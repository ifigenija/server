--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-16 11:54:47 CEST

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
-- TOC entry 181 (class 1259 OID 22256245)
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
-- TOC entry 232 (class 1259 OID 22256835)
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
-- TOC entry 231 (class 1259 OID 22256818)
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
-- TOC entry 222 (class 1259 OID 22256695)
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
-- TOC entry 225 (class 1259 OID 22256725)
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
-- TOC entry 246 (class 1259 OID 22257106)
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
-- TOC entry 199 (class 1259 OID 22256475)
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
-- TOC entry 201 (class 1259 OID 22256506)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 22257032)
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
-- TOC entry 192 (class 1259 OID 22256388)
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
-- TOC entry 233 (class 1259 OID 22256848)
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
-- TOC entry 218 (class 1259 OID 22256649)
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
-- TOC entry 197 (class 1259 OID 22256454)
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
-- TOC entry 195 (class 1259 OID 22256428)
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
-- TOC entry 193 (class 1259 OID 22256405)
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
-- TOC entry 207 (class 1259 OID 22256563)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 244 (class 1259 OID 22257087)
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
-- TOC entry 245 (class 1259 OID 22257099)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 22257121)
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
-- TOC entry 211 (class 1259 OID 22256588)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22256362)
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
-- TOC entry 183 (class 1259 OID 22256264)
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
-- TOC entry 187 (class 1259 OID 22256328)
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
-- TOC entry 184 (class 1259 OID 22256275)
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
-- TOC entry 178 (class 1259 OID 22256219)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22256238)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 22256595)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 22256629)
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
-- TOC entry 228 (class 1259 OID 22256766)
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
-- TOC entry 186 (class 1259 OID 22256308)
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
-- TOC entry 189 (class 1259 OID 22256354)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 22256977)
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
-- TOC entry 208 (class 1259 OID 22256569)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22256339)
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
-- TOC entry 196 (class 1259 OID 22256443)
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
-- TOC entry 210 (class 1259 OID 22256581)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 22256991)
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
-- TOC entry 237 (class 1259 OID 22257001)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 22256916)
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
-- TOC entry 238 (class 1259 OID 22257009)
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
-- TOC entry 214 (class 1259 OID 22256610)
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
-- TOC entry 206 (class 1259 OID 22256554)
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
-- TOC entry 205 (class 1259 OID 22256544)
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
-- TOC entry 227 (class 1259 OID 22256755)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 22256685)
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
-- TOC entry 194 (class 1259 OID 22256417)
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
-- TOC entry 175 (class 1259 OID 22256190)
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
-- TOC entry 174 (class 1259 OID 22256188)
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
-- TOC entry 215 (class 1259 OID 22256623)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22256228)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22256212)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 22256637)
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
-- TOC entry 209 (class 1259 OID 22256575)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 22256521)
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
-- TOC entry 173 (class 1259 OID 22256177)
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
-- TOC entry 172 (class 1259 OID 22256169)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22256164)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 223 (class 1259 OID 22256702)
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
-- TOC entry 185 (class 1259 OID 22256300)
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
-- TOC entry 204 (class 1259 OID 22256531)
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
-- TOC entry 226 (class 1259 OID 22256743)
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
-- TOC entry 182 (class 1259 OID 22256254)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 239 (class 1259 OID 22257020)
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
-- TOC entry 202 (class 1259 OID 22256511)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22256374)
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
-- TOC entry 176 (class 1259 OID 22256199)
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
-- TOC entry 230 (class 1259 OID 22256793)
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
-- TOC entry 198 (class 1259 OID 22256465)
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
-- TOC entry 213 (class 1259 OID 22256602)
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
-- TOC entry 224 (class 1259 OID 22256716)
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
-- TOC entry 242 (class 1259 OID 22257067)
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
-- TOC entry 241 (class 1259 OID 22257039)
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
-- TOC entry 243 (class 1259 OID 22257079)
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
-- TOC entry 220 (class 1259 OID 22256674)
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
-- TOC entry 200 (class 1259 OID 22256500)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 229 (class 1259 OID 22256783)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 219 (class 1259 OID 22256664)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2215 (class 2604 OID 22256193)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3044 (class 0 OID 22256245)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 22256835)
-- Dependencies: 232
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5620-c964-f89c-8f543b4ec89c	000d0000-5620-c964-6c7c-24ad71b7be46	\N	00090000-5620-c964-bf85-f867a305a4c1	000b0000-5620-c964-5a70-d4a7aadb4065	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5620-c964-ea90-86068820e739	000d0000-5620-c964-d1c1-2eeb295e3d25	00100000-5620-c964-241d-390a42e5b637	00090000-5620-c964-1b3b-f544f9f9a64b	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5620-c964-18cd-0bcdd94134c2	000d0000-5620-c964-4249-ac0776614cfe	00100000-5620-c964-d159-929a6d5f9607	00090000-5620-c964-9f88-bf27f7594878	\N	0003	t	\N	2015-10-16	\N	2	t	\N	f	f
000c0000-5620-c964-555f-566b230cd796	000d0000-5620-c964-056a-b4faed9f69e8	\N	00090000-5620-c964-3495-1478b4b412d3	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5620-c964-07bb-0dfddadbd656	000d0000-5620-c964-f93c-184c65c62462	\N	00090000-5620-c964-7f65-9b2ebf14493c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5620-c964-0055-e4d8393fd5d2	000d0000-5620-c964-40c1-17101b383b14	\N	00090000-5620-c964-de7e-315765e392b4	000b0000-5620-c964-3ea8-ad631fdc463c	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5620-c964-eacc-a6585dcfcc00	000d0000-5620-c964-3419-ce328a724968	00100000-5620-c964-cf1e-0613372adc7f	00090000-5620-c964-aa6a-ab412bcae36d	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5620-c964-b438-0c4cdc0f6c90	000d0000-5620-c964-b8f5-9daf19b9ab27	\N	00090000-5620-c964-7299-d6c75998dfa7	000b0000-5620-c964-cc3d-89a64581c41b	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5620-c964-4f0e-fb493d20a4b0	000d0000-5620-c964-3419-ce328a724968	00100000-5620-c964-3739-258c8c223854	00090000-5620-c964-4227-44923a8ce1f4	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5620-c964-8e27-d49f2a3a0428	000d0000-5620-c964-3419-ce328a724968	00100000-5620-c964-f7c4-95154066256f	00090000-5620-c964-99cd-6dd581d35031	\N	0010	t	\N	2015-10-16	\N	16	f	\N	f	t
000c0000-5620-c964-c366-3b9b09daecee	000d0000-5620-c964-3419-ce328a724968	00100000-5620-c964-132a-01eafb4de251	00090000-5620-c964-0dec-bc6f17804999	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5620-c964-a16e-df563e5cb946	000d0000-5620-c964-f5d1-efb4bb008527	\N	00090000-5620-c964-1b3b-f544f9f9a64b	000b0000-5620-c964-62d9-a9ccb245db35	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3094 (class 0 OID 22256818)
-- Dependencies: 231
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 22256695)
-- Dependencies: 222
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5620-c964-d39d-4f692d7417ce	00160000-5620-c964-9f2a-12482b0bb2a2	00090000-5620-c964-863d-93c98ef5044e	aizv	10	t
003d0000-5620-c964-21e8-756b59f4d457	00160000-5620-c964-9f2a-12482b0bb2a2	00090000-5620-c964-a48d-33551243645d	apri	14	t
003d0000-5620-c964-8e85-bb9152be9b4d	00160000-5620-c964-28b6-3e0b6914bfad	00090000-5620-c964-b8fc-26b40ae6b51a	aizv	11	t
003d0000-5620-c964-5244-d6562f752db2	00160000-5620-c964-5671-b80f4dc0cc54	00090000-5620-c964-0195-4537af5a5d8c	aizv	12	t
003d0000-5620-c964-7624-4d39be3d0add	00160000-5620-c964-9f2a-12482b0bb2a2	00090000-5620-c964-e3cf-1d9ff6d62e22	apri	18	f
\.


--
-- TOC entry 3088 (class 0 OID 22256725)
-- Dependencies: 225
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5620-c964-9f2a-12482b0bb2a2	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5620-c964-28b6-3e0b6914bfad	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5620-c964-5671-b80f4dc0cc54	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3109 (class 0 OID 22257106)
-- Dependencies: 246
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 22256475)
-- Dependencies: 199
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5620-c964-fd42-8614733ed953	\N	\N	00200000-5620-c964-f5b4-fcd6a08e2dbe	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5620-c964-d81f-12e9f5d84b67	\N	\N	00200000-5620-c964-f8d5-8d5f338eb782	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5620-c964-1395-33138086a693	\N	\N	00200000-5620-c964-f32d-815d87da0e68	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5620-c964-fd21-66ce8838aed0	\N	\N	00200000-5620-c964-2856-33e11d3a8256	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5620-c964-bc3e-7590b71fed2e	\N	\N	00200000-5620-c964-a112-e9b451c3481e	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3064 (class 0 OID 22256506)
-- Dependencies: 201
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 22257032)
-- Dependencies: 240
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 22256388)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5620-c962-a96a-bac5467d087a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5620-c962-eeae-19d0b6ad3dbd	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5620-c962-7130-9068c2cfba09	AL	ALB	008	Albania 	Albanija	\N
00040000-5620-c962-9424-6b46367d200f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5620-c962-d271-13c219d499e9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5620-c962-7caa-9bcfa36590de	AD	AND	020	Andorra 	Andora	\N
00040000-5620-c962-2a21-919b65af660f	AO	AGO	024	Angola 	Angola	\N
00040000-5620-c962-2fd2-3eedfebffb40	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5620-c962-5f6d-a649beeff668	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5620-c962-c770-e955a0c3f631	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5620-c962-619d-2918b478c0ca	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5620-c962-6ea8-9d1f79cc03b9	AM	ARM	051	Armenia 	Armenija	\N
00040000-5620-c962-87e5-319bfc85774e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5620-c962-fe6d-05913dbb0a6f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5620-c962-a569-a09148ed8642	AT	AUT	040	Austria 	Avstrija	\N
00040000-5620-c962-e409-bace19ae70a4	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5620-c962-8440-d39c3ed0130f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5620-c962-5488-41e37744c8f8	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5620-c962-60e1-6e26a5452907	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5620-c962-b9fa-953ec945e9b5	BB	BRB	052	Barbados 	Barbados	\N
00040000-5620-c962-5023-729292444343	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5620-c962-dff1-0b2264011d1d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5620-c962-71fe-66e13da8a7b7	BZ	BLZ	084	Belize 	Belize	\N
00040000-5620-c962-ba84-6278baa12914	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5620-c962-9ed8-3c184f47652b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5620-c962-778c-2aad51791495	BT	BTN	064	Bhutan 	Butan	\N
00040000-5620-c962-185a-a26e23b09cc3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5620-c962-2a4b-976aa1955c5b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5620-c962-f976-33242670931f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5620-c962-f756-7fd27b351b07	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5620-c962-04bc-7bfc1c362a2e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5620-c962-8a32-d52dc1731867	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5620-c962-61c6-a9cbfe215964	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5620-c962-dadb-f3408e50af17	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5620-c962-bd36-9544fcf73bc3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5620-c962-0908-7cbb36e8021d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5620-c962-011b-ac64699991c4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5620-c962-8159-c7abc5d143f5	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5620-c962-4ad9-982e55d7a52b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5620-c962-d638-9d1b5904c2f0	CA	CAN	124	Canada 	Kanada	\N
00040000-5620-c962-4991-cf417aa9e003	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5620-c962-2d86-26646a777f33	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5620-c962-da56-d2df088a2f4f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5620-c962-213c-980630d9ee65	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5620-c962-5ae5-d72eeae17402	CL	CHL	152	Chile 	Čile	\N
00040000-5620-c962-38e1-0bd789c8dece	CN	CHN	156	China 	Kitajska	\N
00040000-5620-c962-cbf5-8d389734a188	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5620-c962-8ece-dda6ad7d6e5b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5620-c962-ce43-ce9c5dc8985d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5620-c962-c055-41c189865da3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5620-c962-0fe3-ce00733eea60	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5620-c962-09c6-629bafbff2d0	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5620-c962-df51-584e9828181e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5620-c962-2a45-a9a0c72197b8	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5620-c962-6186-20909a0c6603	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5620-c962-88e5-149b25c7134a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5620-c962-6151-c97f2ba01738	CU	CUB	192	Cuba 	Kuba	\N
00040000-5620-c962-3fbe-5885f403dafd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5620-c962-3158-2ff653dfda08	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5620-c962-486d-189a06a9e5ac	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5620-c962-6aa4-03ffa20ffe32	DK	DNK	208	Denmark 	Danska	\N
00040000-5620-c962-c713-976d1657eda2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5620-c962-f3a5-dee81f56b0d1	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5620-c962-a1b2-6b87715fe947	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5620-c962-384d-e88bf2c6e661	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5620-c962-03fe-59dedac60815	EG	EGY	818	Egypt 	Egipt	\N
00040000-5620-c962-d3bb-1fddab97cc80	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5620-c962-673f-919799717693	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5620-c962-2bd7-bafd5d986031	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5620-c962-517b-a0136624a58a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5620-c962-7494-584dfec6ffd6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5620-c962-198d-70e1fcab7444	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5620-c962-25be-f6369d9b5997	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5620-c962-0756-7190b55a950d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5620-c962-80d7-0e76df0a6ea5	FI	FIN	246	Finland 	Finska	\N
00040000-5620-c962-e140-2722654b1c55	FR	FRA	250	France 	Francija	\N
00040000-5620-c962-39a0-5c4e66e7cc57	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5620-c962-02b4-3f3526c687d1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5620-c962-5826-b395bf39b066	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5620-c962-1cf3-9046fc8ecdcf	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5620-c962-a4e6-6d029dae7810	GA	GAB	266	Gabon 	Gabon	\N
00040000-5620-c962-5864-2bb2525f09a8	GM	GMB	270	Gambia 	Gambija	\N
00040000-5620-c962-afbf-9937af61486a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5620-c962-1fe3-03a1209d5d0b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5620-c962-3627-78f3a9e690a8	GH	GHA	288	Ghana 	Gana	\N
00040000-5620-c962-e4d0-0ac8ce3471ef	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5620-c962-776e-6bd0bf882fec	GR	GRC	300	Greece 	Grčija	\N
00040000-5620-c962-3fbe-cd3c8d2393d4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5620-c962-1054-2e2a808ed240	GD	GRD	308	Grenada 	Grenada	\N
00040000-5620-c962-f3b8-b27bcf91c469	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5620-c962-3278-b0e670181fff	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5620-c962-a4dc-b4500aa8541c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5620-c962-d793-05921180e40d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5620-c962-38b9-7e6378610183	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5620-c962-55d3-4431e06e147b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5620-c962-d9da-26b110c2acd5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5620-c962-8b4e-3a11ffa4c904	HT	HTI	332	Haiti 	Haiti	\N
00040000-5620-c962-cc55-cb34089690c1	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5620-c962-6582-acf5cad6a6bd	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5620-c962-872e-e781617579f2	HN	HND	340	Honduras 	Honduras	\N
00040000-5620-c962-1e3e-9e87fa4852f0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5620-c962-b2fb-911fed29269b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5620-c962-8db9-b8b9d6e35284	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5620-c962-1e86-d696c91c1c8a	IN	IND	356	India 	Indija	\N
00040000-5620-c962-e918-6d5647b7235f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5620-c962-a78e-a5024f8b3e9b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5620-c962-eb8b-d070f74f9dc1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5620-c962-662d-3077b239234c	IE	IRL	372	Ireland 	Irska	\N
00040000-5620-c962-d526-11931e115c2c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5620-c962-7199-64f6507e5fdb	IL	ISR	376	Israel 	Izrael	\N
00040000-5620-c962-dabb-a0003611e231	IT	ITA	380	Italy 	Italija	\N
00040000-5620-c962-18d9-9cd24895c67d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5620-c962-c0be-60ad9aad17e4	JP	JPN	392	Japan 	Japonska	\N
00040000-5620-c962-fac9-f79a25a207d2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5620-c962-f91f-204f22a1d732	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5620-c962-85d9-8ceb013cca2b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5620-c962-5d2c-7f6bc5eec3b4	KE	KEN	404	Kenya 	Kenija	\N
00040000-5620-c962-1037-d4796e4b8d5b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5620-c962-b19f-8d6cca9cad70	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5620-c962-5f07-cab826abe577	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5620-c962-432b-7c77e9157ae7	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5620-c962-7001-8cfb75e3cd75	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5620-c962-fdb2-7da055a122f7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5620-c962-2a92-f3de103c7194	LV	LVA	428	Latvia 	Latvija	\N
00040000-5620-c962-f6b9-9fa57e4fb964	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5620-c962-923e-39ec3da6a910	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5620-c962-b8c3-5d3baa3b31d5	LR	LBR	430	Liberia 	Liberija	\N
00040000-5620-c962-dc55-05ae2586e840	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5620-c962-3707-8819b8554720	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5620-c962-16ba-d7acfcefafb8	LT	LTU	440	Lithuania 	Litva	\N
00040000-5620-c962-1158-b7d23e88e678	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5620-c962-00af-96b55a4eb77c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5620-c962-22cd-bdcab782be77	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5620-c962-df87-3d3becbf9ff5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5620-c962-051b-840168ecb554	MW	MWI	454	Malawi 	Malavi	\N
00040000-5620-c962-b845-d9579414315f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5620-c962-16ae-0a60e028e92f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5620-c962-eb03-f01ee37a7670	ML	MLI	466	Mali 	Mali	\N
00040000-5620-c962-b4d7-b0791f753ef7	MT	MLT	470	Malta 	Malta	\N
00040000-5620-c962-63fe-120ee3e45821	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5620-c962-e76d-04b74c3184e5	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5620-c962-696d-d3a4fca75a35	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5620-c962-3c73-5c82f64f32f2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5620-c962-e6a5-e9e838854ab2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5620-c962-6da0-877d46610232	MX	MEX	484	Mexico 	Mehika	\N
00040000-5620-c962-d1d9-791bb45e2d9f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5620-c962-3c55-39a8b53beb6a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5620-c962-49b3-3aab399036b1	MC	MCO	492	Monaco 	Monako	\N
00040000-5620-c962-beb7-4c3e8212ec22	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5620-c962-ecb3-84337f0b46d8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5620-c962-4ebb-f3bdec06eba5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5620-c962-49cc-a0798624718b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5620-c962-8b1f-423f17b3b4e1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5620-c962-6ab8-b5e9e0ebca24	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5620-c962-47f1-70217e5c9696	NA	NAM	516	Namibia 	Namibija	\N
00040000-5620-c962-b3d2-93dccff80400	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5620-c962-2e92-3c7cf5d6c49a	NP	NPL	524	Nepal 	Nepal	\N
00040000-5620-c962-258e-c8f288645699	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5620-c962-61cf-f8e245bbfcff	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5620-c962-4996-251120914796	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5620-c962-56f8-d0f4605d97e1	NE	NER	562	Niger 	Niger 	\N
00040000-5620-c962-7908-ec12c4f0de96	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5620-c962-ed0d-885dea2f0171	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5620-c962-2c26-3efd69c36663	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5620-c962-5d02-bb3670e408ce	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5620-c962-5161-b026a173de93	NO	NOR	578	Norway 	Norveška	\N
00040000-5620-c962-5f68-512c68126d10	OM	OMN	512	Oman 	Oman	\N
00040000-5620-c962-3f2f-2417ece67c6e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5620-c962-882d-ff7a0b7fa29f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5620-c962-96b6-1443244b30d1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5620-c962-b219-fc96245e6696	PA	PAN	591	Panama 	Panama	\N
00040000-5620-c962-6464-e9eceaaba224	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5620-c962-4540-90d4b347a172	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5620-c962-5368-ccb2824bcc2c	PE	PER	604	Peru 	Peru	\N
00040000-5620-c962-dbdf-ae3e00d45513	PH	PHL	608	Philippines 	Filipini	\N
00040000-5620-c962-7081-45bff73d5788	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5620-c962-468d-4b4987f2f709	PL	POL	616	Poland 	Poljska	\N
00040000-5620-c962-f324-f528cbd068e4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5620-c962-cf2a-675d931371e3	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5620-c962-7f3a-dc375b278cf9	QA	QAT	634	Qatar 	Katar	\N
00040000-5620-c962-90e3-b5fef1e34a6a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5620-c962-4b27-178ecbdb40b6	RO	ROU	642	Romania 	Romunija	\N
00040000-5620-c962-b02d-14eacb314103	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5620-c962-33ee-9fca8e0af169	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5620-c962-3b8b-eabc21fbee56	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5620-c962-67f2-7eea15397f96	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5620-c962-94fa-e0323655d7be	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5620-c962-88ed-bfbf76b73ed8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5620-c962-b605-d2d620b1fd01	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5620-c962-cc0f-2a5e401d7784	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5620-c962-2020-abfbab8b2921	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5620-c962-53eb-b62d175cdaeb	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5620-c962-da37-d9bd7815e2fc	SM	SMR	674	San Marino 	San Marino	\N
00040000-5620-c962-b2a3-d7cdc26d724e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5620-c962-9472-7f8be5a5dbf0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5620-c962-7a00-3c75281dc07c	SN	SEN	686	Senegal 	Senegal	\N
00040000-5620-c962-6811-e177c993d104	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5620-c962-7ea2-e8d8c0425076	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5620-c962-2a93-291a2eaa4d58	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5620-c962-6cb1-38bbdb2f2fe3	SG	SGP	702	Singapore 	Singapur	\N
00040000-5620-c962-73cc-ba9f58c3c069	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5620-c962-a054-c17f1d051dee	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5620-c962-9683-a41b5a86a260	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5620-c962-56df-1088ccf5e1b8	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5620-c962-14d6-90f985a7896f	SO	SOM	706	Somalia 	Somalija	\N
00040000-5620-c962-941c-7fb0fdd0ea2b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5620-c962-0d15-2e509fd50100	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5620-c962-45d8-1a9fe25112a9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5620-c962-8cb0-f8c88fb7d181	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5620-c962-3456-01e0cda14e2b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5620-c962-a6b5-3c959e110170	SD	SDN	729	Sudan 	Sudan	\N
00040000-5620-c962-de4b-4a96c99aa04f	SR	SUR	740	Suriname 	Surinam	\N
00040000-5620-c962-b6f8-3d230356adaf	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5620-c962-1685-fc05e2b65ae5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5620-c962-ad99-60af9605c705	SE	SWE	752	Sweden 	Švedska	\N
00040000-5620-c962-ad04-7f74dbbcc1f8	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5620-c962-ce34-fa7712c8e922	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5620-c962-0803-62b668fb8942	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5620-c962-e9f0-36585b531fb2	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5620-c962-7d0b-d81653bde7ce	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5620-c962-c24f-aace10eac01d	TH	THA	764	Thailand 	Tajska	\N
00040000-5620-c962-24d9-15a0a83ffad4	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5620-c962-3250-be070b2ddab1	TG	TGO	768	Togo 	Togo	\N
00040000-5620-c962-55f9-1ec512d7351c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5620-c962-58a8-0cbea3d7f3b3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5620-c962-6ed3-ce760ec5e884	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5620-c962-8aab-14331783b7fb	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5620-c962-f9b3-73c50d7edf24	TR	TUR	792	Turkey 	Turčija	\N
00040000-5620-c962-6e00-0426457f1221	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5620-c962-6480-ac84cc31cd3a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5620-c962-f05d-18bf572349ca	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5620-c962-bbdb-4f0f67c64f85	UG	UGA	800	Uganda 	Uganda	\N
00040000-5620-c962-b89c-42f6cf59e55e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5620-c962-5819-f1d2e574ca7a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5620-c962-8ff5-2f2e252b8575	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5620-c962-e1ac-bc7355a2ccbe	US	USA	840	United States 	Združene države Amerike	\N
00040000-5620-c962-4d9f-909efe080560	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5620-c962-dda1-4041dfb3bd18	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5620-c962-085a-2c4527511d66	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5620-c962-0ac1-0e33d9ef6c68	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5620-c962-8d9b-76d8a0ab831b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5620-c962-4c42-1742c92440ed	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5620-c962-bdd6-db157315de54	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5620-c962-f332-8d9d02edd58f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5620-c962-c9c4-1905831f9c0e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5620-c962-8066-f7b44371ae9e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5620-c962-0c3c-9f725030516a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5620-c962-2d51-58493a11729f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5620-c962-5d1a-24e803aea4b3	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3096 (class 0 OID 22256848)
-- Dependencies: 233
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5620-c964-abdc-4272d6f0321f	000e0000-5620-c964-3e17-6e47deb527eb	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-c961-d89e-528f40cbb247	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5620-c964-b119-cef78a6fd98c	000e0000-5620-c964-f5a2-ede43b8788f4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-c961-865b-bad5762dde5d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5620-c964-66d3-0faba1ebccbc	000e0000-5620-c964-28f2-59f450f80e38	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5620-c961-d89e-528f40cbb247	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5620-c964-038d-a61fb61cd821	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5620-c964-cca1-c5e074e54955	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3081 (class 0 OID 22256649)
-- Dependencies: 218
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5620-c964-6c7c-24ad71b7be46	000e0000-5620-c964-f5a2-ede43b8788f4	000c0000-5620-c964-f89c-8f543b4ec89c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5620-c961-b68a-777b8d207c08
000d0000-5620-c964-d1c1-2eeb295e3d25	000e0000-5620-c964-f5a2-ede43b8788f4	000c0000-5620-c964-ea90-86068820e739	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5620-c961-9c4d-c3daaee5d1c9
000d0000-5620-c964-4249-ac0776614cfe	000e0000-5620-c964-f5a2-ede43b8788f4	000c0000-5620-c964-18cd-0bcdd94134c2	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5620-c961-399f-d94966c75921
000d0000-5620-c964-056a-b4faed9f69e8	000e0000-5620-c964-f5a2-ede43b8788f4	000c0000-5620-c964-555f-566b230cd796	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5620-c961-540e-92359d496716
000d0000-5620-c964-f93c-184c65c62462	000e0000-5620-c964-f5a2-ede43b8788f4	000c0000-5620-c964-07bb-0dfddadbd656	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5620-c961-540e-92359d496716
000d0000-5620-c964-40c1-17101b383b14	000e0000-5620-c964-f5a2-ede43b8788f4	000c0000-5620-c964-0055-e4d8393fd5d2	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5620-c961-b68a-777b8d207c08
000d0000-5620-c964-3419-ce328a724968	000e0000-5620-c964-f5a2-ede43b8788f4	000c0000-5620-c964-4f0e-fb493d20a4b0	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5620-c961-b68a-777b8d207c08
000d0000-5620-c964-b8f5-9daf19b9ab27	000e0000-5620-c964-f5a2-ede43b8788f4	000c0000-5620-c964-b438-0c4cdc0f6c90	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5620-c961-33b9-37bd9566385b
000d0000-5620-c964-f5d1-efb4bb008527	000e0000-5620-c964-f5a2-ede43b8788f4	000c0000-5620-c964-a16e-df563e5cb946	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5620-c961-ccf3-a1be9ac4dd26
\.


--
-- TOC entry 3060 (class 0 OID 22256454)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 22256428)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 22256405)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5620-c964-7641-f4d709eee78f	00080000-5620-c964-1916-8fc34d84ef44	00090000-5620-c964-99cd-6dd581d35031	AK		igralka
\.


--
-- TOC entry 3070 (class 0 OID 22256563)
-- Dependencies: 207
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 22257087)
-- Dependencies: 244
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 22257099)
-- Dependencies: 245
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 22257121)
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
-- TOC entry 3074 (class 0 OID 22256588)
-- Dependencies: 211
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 22256362)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5620-c962-6a59-02466b08c4d6	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5620-c962-2ee7-07b805027e30	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5620-c962-da16-e21a44a17a41	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5620-c962-e6d3-c07416b9d2ca	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5620-c962-2bca-48b7e3b2c8a0	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5620-c962-82b4-8d33337298db	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5620-c962-7dc1-6ec918033f39	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5620-c962-dcc7-84ef33ae6180	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5620-c962-a6bd-74e2f687a8a2	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5620-c962-ebc7-e238caef4681	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5620-c962-6b70-7e4d062bfc15	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5620-c962-35c5-cb7da1e9ecde	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5620-c962-1c17-c0693e5caae7	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5620-c962-da42-73948deadff2	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5620-c962-9b54-5e23479559a9	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5620-c964-33fa-a681563bb508	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5620-c964-14e7-34a1523d597d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5620-c964-9e34-984b430a2df1	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5620-c964-7890-271dffc8cc50	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5620-c964-5a6c-103a96244c24	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5620-c966-c1bb-8716cb8e8907	application.tenant.maticnopodjetje	string	s:36:"00080000-5620-c966-d29d-192c11603ba6";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3046 (class 0 OID 22256264)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5620-c964-b3c8-dc72a128299f	00000000-5620-c964-33fa-a681563bb508	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5620-c964-929b-4ed1280916f0	00000000-5620-c964-33fa-a681563bb508	00010000-5620-c962-498d-26465e3e1ced	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5620-c964-1371-3aa6d08318e9	00000000-5620-c964-14e7-34a1523d597d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3050 (class 0 OID 22256328)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 22256275)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5620-c964-bf85-f867a305a4c1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5620-c964-3495-1478b4b412d3	00010000-5620-c964-dc88-0bea4f2b54b1	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5620-c964-9f88-bf27f7594878	00010000-5620-c964-dbc0-384d1ae227be	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5620-c964-4227-44923a8ce1f4	00010000-5620-c964-5033-995b14100b34	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5620-c964-8a0a-6267865a5d81	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5620-c964-de7e-315765e392b4	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5620-c964-0dec-bc6f17804999	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5620-c964-aa6a-ab412bcae36d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5620-c964-99cd-6dd581d35031	00010000-5620-c964-256c-dfc126c24b81	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5620-c964-1b3b-f544f9f9a64b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5620-c964-e4aa-79d720e9f983	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5620-c964-7f65-9b2ebf14493c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5620-c964-7299-d6c75998dfa7	00010000-5620-c964-52b0-7eedc7adb382	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5620-c964-863d-93c98ef5044e	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-c964-a48d-33551243645d	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-c964-b8fc-26b40ae6b51a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5620-c964-0195-4537af5a5d8c	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5620-c964-e3cf-1d9ff6d62e22	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 22256219)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5620-c962-0f11-5b00d1dd1883	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5620-c962-dd0d-dd26a4b5dbc0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5620-c962-cc0b-f55aefc51cef	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5620-c962-2021-03fe005c6d2f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5620-c962-ba40-891c624f1993	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5620-c962-fa63-2dc667eb13c8	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5620-c962-83bc-01fab998fd5c	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5620-c962-d0de-f04d59aa4d3b	Abonma-read	Abonma - branje	f
00030000-5620-c962-a256-fbea6ba8229a	Abonma-write	Abonma - spreminjanje	f
00030000-5620-c962-f8e2-d45638b10a0d	Alternacija-read	Alternacija - branje	f
00030000-5620-c962-be6e-79a1eed9f51a	Alternacija-write	Alternacija - spreminjanje	f
00030000-5620-c962-fbec-4a954fd45776	Arhivalija-read	Arhivalija - branje	f
00030000-5620-c962-de00-7601064a2f51	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5620-c962-f34a-6b78bd263c58	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5620-c962-4152-217a6c4a376d	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5620-c962-c895-75e86822cf52	Besedilo-read	Besedilo - branje	f
00030000-5620-c962-51b4-6b31f4ed8c5b	Besedilo-write	Besedilo - spreminjanje	f
00030000-5620-c962-98ab-a5865c675ebf	DogodekIzven-read	DogodekIzven - branje	f
00030000-5620-c962-3af9-2cc9bedbc29d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5620-c962-a7a4-c58164618787	Dogodek-read	Dogodek - branje	f
00030000-5620-c962-11df-1095c3fc3b8b	Dogodek-write	Dogodek - spreminjanje	f
00030000-5620-c962-0f56-3ce3a491717a	DrugiVir-read	DrugiVir - branje	f
00030000-5620-c962-527b-20e43dca91fe	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5620-c962-340a-1559a18f80ee	Drzava-read	Drzava - branje	f
00030000-5620-c962-d29d-9c5b2eed885e	Drzava-write	Drzava - spreminjanje	f
00030000-5620-c962-5491-7c2a6dd29850	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5620-c962-6527-ad5b1848097f	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5620-c962-7b3a-821362d5db8e	Funkcija-read	Funkcija - branje	f
00030000-5620-c962-5569-7b2285175722	Funkcija-write	Funkcija - spreminjanje	f
00030000-5620-c962-10e3-05ccabdf9c51	Gostovanje-read	Gostovanje - branje	f
00030000-5620-c962-aeef-f55aa5184a12	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5620-c962-9dc0-0c4ada5f3d42	Gostujoca-read	Gostujoca - branje	f
00030000-5620-c962-f704-f6fdcc0e5d09	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5620-c962-3a06-c71a30233bbd	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5620-c962-cc30-e5afbccca7d7	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5620-c962-e570-c5e18296e224	Kupec-read	Kupec - branje	f
00030000-5620-c962-f9d3-4cd483b1ee9a	Kupec-write	Kupec - spreminjanje	f
00030000-5620-c962-3595-0090fd2ccb9d	NacinPlacina-read	NacinPlacina - branje	f
00030000-5620-c962-5a5e-16ac37a67940	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5620-c962-803f-f9323bbbbdd6	Option-read	Option - branje	f
00030000-5620-c962-b47f-9a6f7185425c	Option-write	Option - spreminjanje	f
00030000-5620-c962-f37d-004b84c85f6c	OptionValue-read	OptionValue - branje	f
00030000-5620-c962-fceb-858cb02f2e2e	OptionValue-write	OptionValue - spreminjanje	f
00030000-5620-c962-5631-af8563dbe531	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5620-c962-18f7-5599f3ddc7a1	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5620-c962-42d1-2442b6a58c78	Oseba-read	Oseba - branje	f
00030000-5620-c962-d8de-3594a7da4177	Oseba-write	Oseba - spreminjanje	f
00030000-5620-c962-5ac8-df5d11c84c70	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5620-c962-1fab-c91e9f935832	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5620-c962-273b-5f89757b0ad0	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5620-c962-c9eb-82c0c420599a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5620-c962-a1bc-500210fbed58	Pogodba-read	Pogodba - branje	f
00030000-5620-c962-32b9-aee09e6ce192	Pogodba-write	Pogodba - spreminjanje	f
00030000-5620-c962-fd89-6af6f465b88e	Popa-read	Popa - branje	f
00030000-5620-c962-a99a-61a19bb77668	Popa-write	Popa - spreminjanje	f
00030000-5620-c962-7264-ce160675a5a2	Posta-read	Posta - branje	f
00030000-5620-c962-f662-1065a695c9d1	Posta-write	Posta - spreminjanje	f
00030000-5620-c962-f7ba-2c711627bf8c	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5620-c962-707d-3276b6510b12	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5620-c962-50bc-85b5e624b937	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5620-c962-bb27-7c6674d1a618	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5620-c962-89d0-03102a613e13	PostniNaslov-read	PostniNaslov - branje	f
00030000-5620-c962-a9b2-103d31ceb049	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5620-c962-78cf-d6f6e57e45b9	Predstava-read	Predstava - branje	f
00030000-5620-c962-92f3-a3b985910b46	Predstava-write	Predstava - spreminjanje	f
00030000-5620-c962-6e68-7c6d12c0a252	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5620-c962-5a95-95cc57cef6b9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5620-c962-4b06-aca30748d2ca	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5620-c962-8409-e0ef4aaad3dd	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5620-c962-673d-d6c0404624e6	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5620-c962-193d-c72eedd5ddf0	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5620-c962-3739-eb82f781d14b	ProgramDela-read	ProgramDela - branje	f
00030000-5620-c962-7b38-03a636620f6f	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5620-c962-fe40-8f860ca9c997	ProgramFestival-read	ProgramFestival - branje	f
00030000-5620-c962-df97-b221824b303d	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5620-c962-a959-b062774c688a	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5620-c962-6ab4-aa7e964cbb01	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5620-c962-44c6-8bf79af95d92	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5620-c962-c12b-d8a549b6f58c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5620-c962-7e12-43386dba0085	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5620-c962-5979-51a7675b492d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5620-c962-9e4b-9e503cb5e5da	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5620-c962-093c-dfa6a261736c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5620-c962-2c2b-31aaf6e955f4	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5620-c962-08bc-094ad66473e4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5620-c962-555d-2abef6c85ae7	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5620-c962-6b3d-0a4add1b59c6	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5620-c962-9d1b-f7e95bee7b79	ProgramRazno-read	ProgramRazno - branje	f
00030000-5620-c962-1d44-470501a927be	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5620-c962-9a1d-422b943ed4bc	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5620-c962-a574-93b933e1123a	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5620-c962-7f25-f96ca0167103	Prostor-read	Prostor - branje	f
00030000-5620-c962-ccf8-ceb021c1fb96	Prostor-write	Prostor - spreminjanje	f
00030000-5620-c962-bc66-f207ab0f56b5	Racun-read	Racun - branje	f
00030000-5620-c962-2ac3-03aa740afe53	Racun-write	Racun - spreminjanje	f
00030000-5620-c962-084a-c024c63bca1e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5620-c962-dcdc-b3efb19a9841	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5620-c962-158c-b713621ceca6	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5620-c962-20e3-9af33ec64574	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5620-c962-fd87-4beeaefce03d	Rekvizit-read	Rekvizit - branje	f
00030000-5620-c962-83eb-f18bcd700a1f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5620-c962-31fc-5081672df974	Revizija-read	Revizija - branje	f
00030000-5620-c962-a78d-3f993ff9ad79	Revizija-write	Revizija - spreminjanje	f
00030000-5620-c962-7d32-0dcd860c14a8	Rezervacija-read	Rezervacija - branje	f
00030000-5620-c962-8642-98f9d482b245	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5620-c962-64c9-887870a442da	SedezniRed-read	SedezniRed - branje	f
00030000-5620-c962-232d-98e003761ed2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5620-c962-dd0e-f42337e7e599	Sedez-read	Sedez - branje	f
00030000-5620-c962-8580-187294da1f02	Sedez-write	Sedez - spreminjanje	f
00030000-5620-c962-2104-caa21b59be6c	Sezona-read	Sezona - branje	f
00030000-5620-c962-708c-26862bdbc80d	Sezona-write	Sezona - spreminjanje	f
00030000-5620-c962-7395-ef4e8d85a667	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5620-c962-d98b-288133ee4e01	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5620-c962-667b-ab6623f4e839	Stevilcenje-read	Stevilcenje - branje	f
00030000-5620-c962-a31c-64c72410a5c7	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5620-c962-2b6f-8ccade939e49	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5620-c962-a608-7b024e983230	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5620-c962-e4ed-3c8097076b6c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5620-c962-9c2e-0dbe887bbaa9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5620-c962-fe75-5aac77ee8282	Telefonska-read	Telefonska - branje	f
00030000-5620-c962-b90e-159259da71a1	Telefonska-write	Telefonska - spreminjanje	f
00030000-5620-c962-33de-610999c1a16f	TerminStoritve-read	TerminStoritve - branje	f
00030000-5620-c962-0e23-047dc7aff384	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5620-c962-8f7e-73777f1a758b	TipFunkcije-read	TipFunkcije - branje	f
00030000-5620-c962-5aa9-3fe01db9e7ba	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5620-c962-09ba-0675ffcd65e4	TipPopa-read	TipPopa - branje	f
00030000-5620-c962-e601-e94795705792	TipPopa-write	TipPopa - spreminjanje	f
00030000-5620-c962-9813-0dd55313553c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5620-c962-bc7a-381f262e8313	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5620-c962-0292-1b232bc89bc3	TipVaje-read	TipVaje - branje	f
00030000-5620-c962-b5dc-03aff9053e1a	TipVaje-write	TipVaje - spreminjanje	f
00030000-5620-c962-945f-02ee6acc942e	Trr-read	Trr - branje	f
00030000-5620-c962-97c9-554e4288a7b8	Trr-write	Trr - spreminjanje	f
00030000-5620-c962-9575-f5370909359d	Uprizoritev-read	Uprizoritev - branje	f
00030000-5620-c962-7f74-c59afc08e399	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5620-c962-324d-4874a0363802	Vaja-read	Vaja - branje	f
00030000-5620-c962-3ea5-c0f47adda693	Vaja-write	Vaja - spreminjanje	f
00030000-5620-c962-e622-84e4599f34f0	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5620-c962-2514-a0962c5fd7c3	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5620-c962-dd1e-3f8342f1bcf9	VrstaStroska-read	VrstaStroska - branje	f
00030000-5620-c962-f22d-5e9364f10109	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5620-c962-d44f-d8bb5f3ded41	Zaposlitev-read	Zaposlitev - branje	f
00030000-5620-c962-a0d9-128e37366a6e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5620-c962-f8da-c8d156da28bc	Zasedenost-read	Zasedenost - branje	f
00030000-5620-c962-a7c0-07be85982a45	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5620-c962-2abc-4776a7aeddb3	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5620-c962-4098-5944d6a6091a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5620-c962-ffcf-a483b2511a45	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5620-c962-a2cd-39653f0e34a6	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5620-c962-a757-995c99d3b829	Job-read	Branje opravil - samo zase - branje	f
00030000-5620-c962-5e61-ef30084d3a88	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5620-c962-a0e1-8261a7f57487	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5620-c962-5eb8-68d073739403	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5620-c962-c771-b826fa034818	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5620-c962-161d-0526bff31b16	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5620-c962-aba8-307a732f2bab	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5620-c962-cbd1-90a6b422b189	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5620-c962-cc2e-5db100f7e57a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5620-c962-c831-3841f253b887	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5620-c962-c11a-e61b6fa31c69	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5620-c962-a209-2c31f379e0c4	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5620-c962-be4e-f1947e9d0568	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5620-c962-a7fd-858e38ccf137	Datoteka-write	Datoteka - spreminjanje	f
00030000-5620-c962-5b39-0da6645ad989	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3043 (class 0 OID 22256238)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5620-c962-a770-d35d02b8f406	00030000-5620-c962-dd0d-dd26a4b5dbc0
00020000-5620-c962-109c-ade91f9e3662	00030000-5620-c962-340a-1559a18f80ee
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-d0de-f04d59aa4d3b
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-a256-fbea6ba8229a
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-f8e2-d45638b10a0d
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-be6e-79a1eed9f51a
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-fbec-4a954fd45776
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-a7a4-c58164618787
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-2021-03fe005c6d2f
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-11df-1095c3fc3b8b
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-340a-1559a18f80ee
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-d29d-9c5b2eed885e
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-7b3a-821362d5db8e
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-5569-7b2285175722
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-10e3-05ccabdf9c51
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-aeef-f55aa5184a12
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-9dc0-0c4ada5f3d42
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-f704-f6fdcc0e5d09
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-3a06-c71a30233bbd
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-cc30-e5afbccca7d7
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-803f-f9323bbbbdd6
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-f37d-004b84c85f6c
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-42d1-2442b6a58c78
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-d8de-3594a7da4177
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-fd89-6af6f465b88e
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-a99a-61a19bb77668
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-7264-ce160675a5a2
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-f662-1065a695c9d1
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-89d0-03102a613e13
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-a9b2-103d31ceb049
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-78cf-d6f6e57e45b9
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-92f3-a3b985910b46
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-673d-d6c0404624e6
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-193d-c72eedd5ddf0
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-7f25-f96ca0167103
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-ccf8-ceb021c1fb96
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-158c-b713621ceca6
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-20e3-9af33ec64574
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-fd87-4beeaefce03d
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-83eb-f18bcd700a1f
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-2104-caa21b59be6c
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-708c-26862bdbc80d
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-8f7e-73777f1a758b
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-9575-f5370909359d
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-7f74-c59afc08e399
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-324d-4874a0363802
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-3ea5-c0f47adda693
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-f8da-c8d156da28bc
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-a7c0-07be85982a45
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-2abc-4776a7aeddb3
00020000-5620-c962-b691-9a0b94fb04c6	00030000-5620-c962-ffcf-a483b2511a45
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-d0de-f04d59aa4d3b
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-fbec-4a954fd45776
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-a7a4-c58164618787
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-340a-1559a18f80ee
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-10e3-05ccabdf9c51
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-9dc0-0c4ada5f3d42
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-3a06-c71a30233bbd
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-cc30-e5afbccca7d7
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-803f-f9323bbbbdd6
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-f37d-004b84c85f6c
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-42d1-2442b6a58c78
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-d8de-3594a7da4177
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-fd89-6af6f465b88e
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-7264-ce160675a5a2
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-89d0-03102a613e13
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-a9b2-103d31ceb049
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-78cf-d6f6e57e45b9
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-7f25-f96ca0167103
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-158c-b713621ceca6
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-fd87-4beeaefce03d
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-2104-caa21b59be6c
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-fe75-5aac77ee8282
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-b90e-159259da71a1
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-945f-02ee6acc942e
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-97c9-554e4288a7b8
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-d44f-d8bb5f3ded41
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-a0d9-128e37366a6e
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-2abc-4776a7aeddb3
00020000-5620-c962-fc6d-dde6bbbaab5e	00030000-5620-c962-ffcf-a483b2511a45
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-d0de-f04d59aa4d3b
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-f8e2-d45638b10a0d
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-fbec-4a954fd45776
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-de00-7601064a2f51
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-c895-75e86822cf52
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-98ab-a5865c675ebf
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-a7a4-c58164618787
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-340a-1559a18f80ee
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-7b3a-821362d5db8e
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-10e3-05ccabdf9c51
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-9dc0-0c4ada5f3d42
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-3a06-c71a30233bbd
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-803f-f9323bbbbdd6
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-f37d-004b84c85f6c
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-42d1-2442b6a58c78
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-fd89-6af6f465b88e
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-7264-ce160675a5a2
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-78cf-d6f6e57e45b9
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-673d-d6c0404624e6
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-7f25-f96ca0167103
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-158c-b713621ceca6
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-fd87-4beeaefce03d
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-2104-caa21b59be6c
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-8f7e-73777f1a758b
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-324d-4874a0363802
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-f8da-c8d156da28bc
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-2abc-4776a7aeddb3
00020000-5620-c962-57e9-03fc6b3bb86e	00030000-5620-c962-ffcf-a483b2511a45
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-d0de-f04d59aa4d3b
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-a256-fbea6ba8229a
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-be6e-79a1eed9f51a
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-fbec-4a954fd45776
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-a7a4-c58164618787
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-340a-1559a18f80ee
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-10e3-05ccabdf9c51
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-9dc0-0c4ada5f3d42
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-803f-f9323bbbbdd6
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-f37d-004b84c85f6c
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-fd89-6af6f465b88e
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-7264-ce160675a5a2
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-78cf-d6f6e57e45b9
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-7f25-f96ca0167103
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-158c-b713621ceca6
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-fd87-4beeaefce03d
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-2104-caa21b59be6c
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-8f7e-73777f1a758b
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-2abc-4776a7aeddb3
00020000-5620-c962-91fe-5705d625954b	00030000-5620-c962-ffcf-a483b2511a45
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-d0de-f04d59aa4d3b
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-fbec-4a954fd45776
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-a7a4-c58164618787
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-340a-1559a18f80ee
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-10e3-05ccabdf9c51
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-9dc0-0c4ada5f3d42
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-803f-f9323bbbbdd6
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-f37d-004b84c85f6c
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-fd89-6af6f465b88e
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-7264-ce160675a5a2
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-78cf-d6f6e57e45b9
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-7f25-f96ca0167103
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-158c-b713621ceca6
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-fd87-4beeaefce03d
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-2104-caa21b59be6c
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-33de-610999c1a16f
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-cc0b-f55aefc51cef
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-8f7e-73777f1a758b
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-2abc-4776a7aeddb3
00020000-5620-c962-53fa-dd671166d43c	00030000-5620-c962-ffcf-a483b2511a45
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-0f11-5b00d1dd1883
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-dd0d-dd26a4b5dbc0
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-cc0b-f55aefc51cef
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-2021-03fe005c6d2f
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-ba40-891c624f1993
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-fa63-2dc667eb13c8
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-83bc-01fab998fd5c
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-d0de-f04d59aa4d3b
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a256-fbea6ba8229a
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-f8e2-d45638b10a0d
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-be6e-79a1eed9f51a
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-fbec-4a954fd45776
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-de00-7601064a2f51
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-c895-75e86822cf52
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-51b4-6b31f4ed8c5b
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-98ab-a5865c675ebf
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-3af9-2cc9bedbc29d
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a7a4-c58164618787
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-11df-1095c3fc3b8b
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-340a-1559a18f80ee
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-d29d-9c5b2eed885e
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-0f56-3ce3a491717a
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-527b-20e43dca91fe
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-5491-7c2a6dd29850
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-6527-ad5b1848097f
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-7b3a-821362d5db8e
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-5569-7b2285175722
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-10e3-05ccabdf9c51
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-aeef-f55aa5184a12
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-9dc0-0c4ada5f3d42
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-f704-f6fdcc0e5d09
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-3a06-c71a30233bbd
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-cc30-e5afbccca7d7
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-e570-c5e18296e224
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-f9d3-4cd483b1ee9a
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-3595-0090fd2ccb9d
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-5a5e-16ac37a67940
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-803f-f9323bbbbdd6
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-b47f-9a6f7185425c
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-f37d-004b84c85f6c
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-fceb-858cb02f2e2e
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-42d1-2442b6a58c78
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-d8de-3594a7da4177
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-5ac8-df5d11c84c70
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-1fab-c91e9f935832
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-273b-5f89757b0ad0
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-c9eb-82c0c420599a
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a1bc-500210fbed58
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-32b9-aee09e6ce192
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-fd89-6af6f465b88e
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a99a-61a19bb77668
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-7264-ce160675a5a2
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-f662-1065a695c9d1
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-f7ba-2c711627bf8c
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-707d-3276b6510b12
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-50bc-85b5e624b937
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-bb27-7c6674d1a618
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-89d0-03102a613e13
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a9b2-103d31ceb049
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-78cf-d6f6e57e45b9
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-92f3-a3b985910b46
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-6e68-7c6d12c0a252
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-5a95-95cc57cef6b9
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-4b06-aca30748d2ca
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-8409-e0ef4aaad3dd
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-673d-d6c0404624e6
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-193d-c72eedd5ddf0
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-3739-eb82f781d14b
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-7b38-03a636620f6f
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-fe40-8f860ca9c997
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-df97-b221824b303d
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a959-b062774c688a
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-6ab4-aa7e964cbb01
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-44c6-8bf79af95d92
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-c12b-d8a549b6f58c
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-7e12-43386dba0085
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-5979-51a7675b492d
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-9e4b-9e503cb5e5da
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-093c-dfa6a261736c
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-2c2b-31aaf6e955f4
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-08bc-094ad66473e4
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-555d-2abef6c85ae7
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-6b3d-0a4add1b59c6
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-9d1b-f7e95bee7b79
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-1d44-470501a927be
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-9a1d-422b943ed4bc
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a574-93b933e1123a
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-7f25-f96ca0167103
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-ccf8-ceb021c1fb96
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-bc66-f207ab0f56b5
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-2ac3-03aa740afe53
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-084a-c024c63bca1e
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-dcdc-b3efb19a9841
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-158c-b713621ceca6
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-20e3-9af33ec64574
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-fd87-4beeaefce03d
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-83eb-f18bcd700a1f
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-31fc-5081672df974
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a78d-3f993ff9ad79
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-7d32-0dcd860c14a8
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-8642-98f9d482b245
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-64c9-887870a442da
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-232d-98e003761ed2
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-dd0e-f42337e7e599
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-8580-187294da1f02
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-2104-caa21b59be6c
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-708c-26862bdbc80d
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-7395-ef4e8d85a667
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-d98b-288133ee4e01
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-667b-ab6623f4e839
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a31c-64c72410a5c7
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-2b6f-8ccade939e49
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a608-7b024e983230
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-e4ed-3c8097076b6c
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-9c2e-0dbe887bbaa9
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-fe75-5aac77ee8282
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-b90e-159259da71a1
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-33de-610999c1a16f
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-0e23-047dc7aff384
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-8f7e-73777f1a758b
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-5aa9-3fe01db9e7ba
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-9813-0dd55313553c
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-bc7a-381f262e8313
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-945f-02ee6acc942e
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-97c9-554e4288a7b8
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-9575-f5370909359d
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-7f74-c59afc08e399
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-324d-4874a0363802
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-3ea5-c0f47adda693
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-e622-84e4599f34f0
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-2514-a0962c5fd7c3
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-dd1e-3f8342f1bcf9
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-f22d-5e9364f10109
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-d44f-d8bb5f3ded41
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a0d9-128e37366a6e
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-f8da-c8d156da28bc
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a7c0-07be85982a45
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-2abc-4776a7aeddb3
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-4098-5944d6a6091a
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-ffcf-a483b2511a45
00020000-5620-c964-db7c-70260a92b357	00030000-5620-c962-a2cd-39653f0e34a6
\.


--
-- TOC entry 3075 (class 0 OID 22256595)
-- Dependencies: 212
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22256629)
-- Dependencies: 216
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 22256766)
-- Dependencies: 228
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5620-c964-5a70-d4a7aadb4065	00090000-5620-c964-bf85-f867a305a4c1	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5620-c964-3ea8-ad631fdc463c	00090000-5620-c964-de7e-315765e392b4	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5620-c964-cc3d-89a64581c41b	00090000-5620-c964-7299-d6c75998dfa7	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5620-c964-62d9-a9ccb245db35	00090000-5620-c964-1b3b-f544f9f9a64b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3049 (class 0 OID 22256308)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5620-c964-1916-8fc34d84ef44	\N	00040000-5620-c962-9683-a41b5a86a260	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-c964-56d6-5dcb638f025d	\N	00040000-5620-c962-9683-a41b5a86a260	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5620-c964-91ee-7c9514304c09	\N	00040000-5620-c962-9683-a41b5a86a260	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-c964-4dc9-bda92b330d7c	\N	00040000-5620-c962-9683-a41b5a86a260	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-c964-8b52-b42fc454bb92	\N	00040000-5620-c962-9683-a41b5a86a260	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-c964-3871-be086d3daaf9	\N	00040000-5620-c962-619d-2918b478c0ca	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-c964-e26f-b894503ce8fa	\N	00040000-5620-c962-88e5-149b25c7134a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-c964-07e9-c4ef8bc418d3	\N	00040000-5620-c962-a569-a09148ed8642	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-c964-b73a-3e260b82aef6	\N	00040000-5620-c962-1fe3-03a1209d5d0b	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5620-c966-d29d-192c11603ba6	\N	00040000-5620-c962-9683-a41b5a86a260	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3052 (class 0 OID 22256354)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5620-c961-8d83-121ab686428e	8341	Adlešiči
00050000-5620-c961-3845-dc0d81cbc161	5270	Ajdovščina
00050000-5620-c961-2152-1c75fa2cb9a4	6280	Ankaran/Ancarano
00050000-5620-c961-109f-2dfe850a796e	9253	Apače
00050000-5620-c961-8009-0deaa1d069c3	8253	Artiče
00050000-5620-c961-9fde-0162d0d1f8d7	4275	Begunje na Gorenjskem
00050000-5620-c961-293e-0ad0692ad86d	1382	Begunje pri Cerknici
00050000-5620-c961-5c18-2ad2c90a2aa7	9231	Beltinci
00050000-5620-c961-b33f-9ee48922037b	2234	Benedikt
00050000-5620-c961-8c04-896f944ddc43	2345	Bistrica ob Dravi
00050000-5620-c961-7e7e-58757094213c	3256	Bistrica ob Sotli
00050000-5620-c961-7817-81d4af38ecbe	8259	Bizeljsko
00050000-5620-c961-eae2-3e2449b48f5a	1223	Blagovica
00050000-5620-c961-7a4e-74809c54f16b	8283	Blanca
00050000-5620-c961-c36c-4e2725e4eb2b	4260	Bled
00050000-5620-c961-26ae-5c02934e1642	4273	Blejska Dobrava
00050000-5620-c961-d4d8-4c06ff36f532	9265	Bodonci
00050000-5620-c961-0c2d-1be086dbc685	9222	Bogojina
00050000-5620-c961-523d-4e7bc6c51f7b	4263	Bohinjska Bela
00050000-5620-c961-ca56-ba8796ee4afe	4264	Bohinjska Bistrica
00050000-5620-c961-eac6-2998d61401d6	4265	Bohinjsko jezero
00050000-5620-c961-3ced-163b0f415c3e	1353	Borovnica
00050000-5620-c961-c869-8ed0c053783e	8294	Boštanj
00050000-5620-c961-3ed6-c814fd9d5138	5230	Bovec
00050000-5620-c961-5b6c-d785042b3d3d	5295	Branik
00050000-5620-c961-6c4a-440ee45ff4ef	3314	Braslovče
00050000-5620-c961-0168-20d47fddf0f0	5223	Breginj
00050000-5620-c961-29de-d944445a765e	8280	Brestanica
00050000-5620-c961-69ea-83c8f8b0e6b2	2354	Bresternica
00050000-5620-c961-70a9-a89e19e5eec2	4243	Brezje
00050000-5620-c961-eefc-3ea81dcf6503	1351	Brezovica pri Ljubljani
00050000-5620-c961-d337-de87a32e4043	8250	Brežice
00050000-5620-c961-9dc3-fa3ee08b8789	4210	Brnik - Aerodrom
00050000-5620-c961-22a7-d7aa37360e0d	8321	Brusnice
00050000-5620-c961-bf5c-22bef067b4bb	3255	Buče
00050000-5620-c961-fce8-67c9fe3cb154	8276	Bučka 
00050000-5620-c961-f6a2-3ef012f5b9f0	9261	Cankova
00050000-5620-c961-fad9-95190837e3d3	3000	Celje 
00050000-5620-c961-4fe9-5b656e72de1e	3001	Celje - poštni predali
00050000-5620-c961-204f-7d3252f07e1a	4207	Cerklje na Gorenjskem
00050000-5620-c961-d1ec-be9d1072f0dc	8263	Cerklje ob Krki
00050000-5620-c961-a518-01da15f11e04	1380	Cerknica
00050000-5620-c961-51ba-93b8e17e533c	5282	Cerkno
00050000-5620-c961-a272-daf1d587a899	2236	Cerkvenjak
00050000-5620-c961-1c34-acc67dde589c	2215	Ceršak
00050000-5620-c961-af40-17046b74b901	2326	Cirkovce
00050000-5620-c961-7a27-d6d8055458ac	2282	Cirkulane
00050000-5620-c961-fd06-3c247184b244	5273	Col
00050000-5620-c961-1282-8f169da1c3c7	8251	Čatež ob Savi
00050000-5620-c961-f43b-696f94664e34	1413	Čemšenik
00050000-5620-c961-9d2a-21f382183ccb	5253	Čepovan
00050000-5620-c961-6f1d-d5d97aaa50fb	9232	Črenšovci
00050000-5620-c961-682f-b727ecc98ff5	2393	Črna na Koroškem
00050000-5620-c961-f8f9-df124552ba73	6275	Črni Kal
00050000-5620-c961-c759-4f95b093e31c	5274	Črni Vrh nad Idrijo
00050000-5620-c961-d794-11b43f62dc6a	5262	Črniče
00050000-5620-c961-cb13-b63e19f4a785	8340	Črnomelj
00050000-5620-c961-423b-7098f93312d7	6271	Dekani
00050000-5620-c961-9355-37ad6837164a	5210	Deskle
00050000-5620-c961-1ae4-839da344d912	2253	Destrnik
00050000-5620-c961-f7bb-48dc610f3012	6215	Divača
00050000-5620-c961-a363-3d7a41ec7902	1233	Dob
00050000-5620-c961-d3f7-053015b546c8	3224	Dobje pri Planini
00050000-5620-c961-7a3c-6dda2e757d94	8257	Dobova
00050000-5620-c961-cd84-6d7244ab3e4d	1423	Dobovec
00050000-5620-c961-3026-abee0355273e	5263	Dobravlje
00050000-5620-c961-8f2c-e5babd014dea	3204	Dobrna
00050000-5620-c961-0b86-366f8614df6e	8211	Dobrnič
00050000-5620-c961-565e-9daa96c63cca	1356	Dobrova
00050000-5620-c961-58c5-adbae3262bb9	9223	Dobrovnik/Dobronak 
00050000-5620-c961-7afe-3ffcefee3d0a	5212	Dobrovo v Brdih
00050000-5620-c961-d558-f40d333ad767	1431	Dol pri Hrastniku
00050000-5620-c961-25c9-618fa6cb177a	1262	Dol pri Ljubljani
00050000-5620-c961-b91b-47db074c1e3e	1273	Dole pri Litiji
00050000-5620-c961-051a-6e32087903d5	1331	Dolenja vas
00050000-5620-c961-9547-027cf1a6164d	8350	Dolenjske Toplice
00050000-5620-c961-d882-56bf0b3510c4	1230	Domžale
00050000-5620-c961-e201-f90125e9f198	2252	Dornava
00050000-5620-c961-167e-a5b5a2e0fa96	5294	Dornberk
00050000-5620-c961-96a9-31325cac2be3	1319	Draga
00050000-5620-c961-0041-67d9017ce969	8343	Dragatuš
00050000-5620-c961-e1f3-07b71b079d7d	3222	Dramlje
00050000-5620-c961-480b-42da76df6a6b	2370	Dravograd
00050000-5620-c961-bcda-994bae728b79	4203	Duplje
00050000-5620-c961-d7f1-11409e9a9bbd	6221	Dutovlje
00050000-5620-c961-ef0a-22c83ca60beb	8361	Dvor
00050000-5620-c961-8e63-7606a20a8cdb	2343	Fala
00050000-5620-c961-aa93-1731c79831d0	9208	Fokovci
00050000-5620-c961-5fc7-3bdfb18042ac	2313	Fram
00050000-5620-c961-06d1-fea48a1b5933	3213	Frankolovo
00050000-5620-c961-5e27-959c45258098	1274	Gabrovka
00050000-5620-c961-a2a0-3dda2423e91d	8254	Globoko
00050000-5620-c961-b92d-78a1d8f9aa37	5275	Godovič
00050000-5620-c961-0f4b-65789d29dcb6	4204	Golnik
00050000-5620-c961-b430-52102b92d89b	3303	Gomilsko
00050000-5620-c961-c78d-0a2d0853a225	4224	Gorenja vas
00050000-5620-c961-0e8a-8c856256c345	3263	Gorica pri Slivnici
00050000-5620-c961-8508-8fa208fc3e67	2272	Gorišnica
00050000-5620-c961-ce59-3b1f2eea73cc	9250	Gornja Radgona
00050000-5620-c961-ccc1-21ca436eaeb0	3342	Gornji Grad
00050000-5620-c961-f2e5-c674263827c6	4282	Gozd Martuljek
00050000-5620-c961-0028-d38097bedd89	6272	Gračišče
00050000-5620-c961-d8c8-c244ec07922d	9264	Grad
00050000-5620-c961-cafc-cdad76a65b85	8332	Gradac
00050000-5620-c961-9e9f-a3d7b931bede	1384	Grahovo
00050000-5620-c961-34b6-610e19041027	5242	Grahovo ob Bači
00050000-5620-c961-6da2-c71a0c820bf3	5251	Grgar
00050000-5620-c961-e3a4-8f61f7a02509	3302	Griže
00050000-5620-c961-3620-e20a9c52382c	3231	Grobelno
00050000-5620-c961-fc28-c63eed78e02e	1290	Grosuplje
00050000-5620-c961-50e9-fc07bc4e184b	2288	Hajdina
00050000-5620-c961-a15c-5c599befe61a	8362	Hinje
00050000-5620-c961-ccb2-9e2762cb23db	2311	Hoče
00050000-5620-c961-5806-353ea4b022f3	9205	Hodoš/Hodos
00050000-5620-c961-0115-3bec05f85512	1354	Horjul
00050000-5620-c961-56f3-c77560510f16	1372	Hotedršica
00050000-5620-c961-0ffb-a8517ec4e74a	1430	Hrastnik
00050000-5620-c961-e08b-4ca3efde0692	6225	Hruševje
00050000-5620-c961-8910-4b9ff7095540	4276	Hrušica
00050000-5620-c961-7c1e-f76ce2a43df8	5280	Idrija
00050000-5620-c961-574e-f47c57a31d06	1292	Ig
00050000-5620-c961-a974-73ed549d55db	6250	Ilirska Bistrica
00050000-5620-c961-8565-6f4ec3b96afb	6251	Ilirska Bistrica-Trnovo
00050000-5620-c961-b2d7-381f413e1575	1295	Ivančna Gorica
00050000-5620-c961-e20f-082e79e172b2	2259	Ivanjkovci
00050000-5620-c961-1446-3c1b2354ef8f	1411	Izlake
00050000-5620-c961-d952-cffec698664b	6310	Izola/Isola
00050000-5620-c961-f139-f2b011b248f2	2222	Jakobski Dol
00050000-5620-c961-ae3b-7ec6321bb8e6	2221	Jarenina
00050000-5620-c961-6c4d-b5fa5d7a913e	6254	Jelšane
00050000-5620-c961-e645-6dcb4139a148	4270	Jesenice
00050000-5620-c961-24f4-8c64e1f473ad	8261	Jesenice na Dolenjskem
00050000-5620-c961-7233-f93763e412d9	3273	Jurklošter
00050000-5620-c961-fa09-0ff07e8e46fb	2223	Jurovski Dol
00050000-5620-c961-7134-b39d8f871596	2256	Juršinci
00050000-5620-c961-27f5-bbe243cae20d	5214	Kal nad Kanalom
00050000-5620-c961-477b-12dde2605841	3233	Kalobje
00050000-5620-c961-fe61-96be524475d8	4246	Kamna Gorica
00050000-5620-c961-c97a-a3d83851e565	2351	Kamnica
00050000-5620-c961-4d1d-803874e56f39	1241	Kamnik
00050000-5620-c961-bb8c-bd5e0ba82ebf	5213	Kanal
00050000-5620-c961-a07a-297502b19450	8258	Kapele
00050000-5620-c961-d55b-8d11da570797	2362	Kapla
00050000-5620-c961-1194-48f97fcb262e	2325	Kidričevo
00050000-5620-c961-0c6c-37354404f17a	1412	Kisovec
00050000-5620-c961-248b-a1e1e8eaef2b	6253	Knežak
00050000-5620-c961-054c-5580089ad123	5222	Kobarid
00050000-5620-c961-7c6d-9474fcd75ba5	9227	Kobilje
00050000-5620-c961-b6be-cba6ebd6e114	1330	Kočevje
00050000-5620-c961-a69d-6b628aded5d3	1338	Kočevska Reka
00050000-5620-c961-6b4d-127707c78fae	2276	Kog
00050000-5620-c961-bf05-9ce1db726a98	5211	Kojsko
00050000-5620-c961-0eea-e5cfde8b8593	6223	Komen
00050000-5620-c961-7c46-b5238a5a2c37	1218	Komenda
00050000-5620-c961-30b0-5cec214c700a	6000	Koper/Capodistria 
00050000-5620-c961-dbb8-a418b4db6d0c	6001	Koper/Capodistria - poštni predali
00050000-5620-c961-d499-ae0dd3eb86f9	8282	Koprivnica
00050000-5620-c961-e921-4d7a6d36f2f8	5296	Kostanjevica na Krasu
00050000-5620-c961-8804-d49827bc3338	8311	Kostanjevica na Krki
00050000-5620-c961-a3f4-82d28455e55b	1336	Kostel
00050000-5620-c961-a567-db4fa2d799ad	6256	Košana
00050000-5620-c961-b60d-d6d859d84acf	2394	Kotlje
00050000-5620-c961-7c71-dae5778e4f15	6240	Kozina
00050000-5620-c961-671b-43fff6e2ba56	3260	Kozje
00050000-5620-c961-3348-5aa1c5809210	4000	Kranj 
00050000-5620-c961-57e9-85460279bc98	4001	Kranj - poštni predali
00050000-5620-c961-e41d-21dffaf47210	4280	Kranjska Gora
00050000-5620-c961-e654-066600360b95	1281	Kresnice
00050000-5620-c961-d86d-11f83bd2d49b	4294	Križe
00050000-5620-c961-1868-d703ee01f026	9206	Križevci
00050000-5620-c961-4619-898f3cc51d66	9242	Križevci pri Ljutomeru
00050000-5620-c961-8857-a0e327b65d53	1301	Krka
00050000-5620-c961-f1ac-bf752a79ae05	8296	Krmelj
00050000-5620-c961-9455-b332f5cf870d	4245	Kropa
00050000-5620-c961-428a-ffda629b28ee	8262	Krška vas
00050000-5620-c961-0369-2a7397fc425e	8270	Krško
00050000-5620-c961-b2b9-b254f0e66dfc	9263	Kuzma
00050000-5620-c961-86a7-0f48e57b6674	2318	Laporje
00050000-5620-c961-ad04-d51c07abddae	3270	Laško
00050000-5620-c961-aff9-666ad03b4446	1219	Laze v Tuhinju
00050000-5620-c961-5a37-436d50214812	2230	Lenart v Slovenskih goricah
00050000-5620-c961-e2b6-0aa84e7f9814	9220	Lendava/Lendva
00050000-5620-c961-3f02-e74e9a56f01f	4248	Lesce
00050000-5620-c961-5588-da201bebedff	3261	Lesično
00050000-5620-c961-fe6e-d4f2b988c4fc	8273	Leskovec pri Krškem
00050000-5620-c961-2008-6a749f56ac32	2372	Libeliče
00050000-5620-c961-2e8c-d2332f59d56b	2341	Limbuš
00050000-5620-c961-83ad-0ded472e2eee	1270	Litija
00050000-5620-c961-d125-bc4b6e810ee1	3202	Ljubečna
00050000-5620-c961-63ec-983fffd10e96	1000	Ljubljana 
00050000-5620-c961-b3f3-0e8e24199780	1001	Ljubljana - poštni predali
00050000-5620-c961-2c1f-ce33db4d2b12	1231	Ljubljana - Črnuče
00050000-5620-c961-bf55-56c4a7099f74	1261	Ljubljana - Dobrunje
00050000-5620-c961-d317-ae5511781b9a	1260	Ljubljana - Polje
00050000-5620-c961-126b-1286d3c323a5	1210	Ljubljana - Šentvid
00050000-5620-c961-fb2a-679cc5d767f9	1211	Ljubljana - Šmartno
00050000-5620-c961-31c8-bdc14fca8c2b	3333	Ljubno ob Savinji
00050000-5620-c961-ad6f-b195a2de5301	9240	Ljutomer
00050000-5620-c961-f9fa-b929e59fb9b7	3215	Loče
00050000-5620-c961-2b4e-637c1dce6ef3	5231	Log pod Mangartom
00050000-5620-c961-3ca8-1fa5c92e88bc	1358	Log pri Brezovici
00050000-5620-c961-be6d-58f493852bc5	1370	Logatec
00050000-5620-c961-e1ca-c868ddaae6d6	1371	Logatec
00050000-5620-c961-8a20-09bb14945b6a	1434	Loka pri Zidanem Mostu
00050000-5620-c961-cc2e-b355d7f8f42a	3223	Loka pri Žusmu
00050000-5620-c961-c0cb-ed3de40a69db	6219	Lokev
00050000-5620-c961-b7ae-5f5d42733a20	1318	Loški Potok
00050000-5620-c961-399a-ffa8139083f2	2324	Lovrenc na Dravskem polju
00050000-5620-c961-9c8f-052097beb1b1	2344	Lovrenc na Pohorju
00050000-5620-c961-36b7-91791484d7c1	3334	Luče
00050000-5620-c961-df06-45a835fac27f	1225	Lukovica
00050000-5620-c961-c133-1be0e94488ef	9202	Mačkovci
00050000-5620-c961-1ed9-369ed532621e	2322	Majšperk
00050000-5620-c961-1020-4a5d63d546cb	2321	Makole
00050000-5620-c961-c45d-bb6df385352e	9243	Mala Nedelja
00050000-5620-c961-c8aa-cfebb055e2c6	2229	Malečnik
00050000-5620-c961-ca8d-dcbc9b85635f	6273	Marezige
00050000-5620-c961-c92a-8c154a92d407	2000	Maribor 
00050000-5620-c961-d717-a9f11f184bc4	2001	Maribor - poštni predali
00050000-5620-c961-8f34-c369cd3b96b1	2206	Marjeta na Dravskem polju
00050000-5620-c961-5b00-52df65e59121	2281	Markovci
00050000-5620-c961-8ee5-9f49c378a1a2	9221	Martjanci
00050000-5620-c961-6435-56b5d5215094	6242	Materija
00050000-5620-c961-22a8-364304d9ea49	4211	Mavčiče
00050000-5620-c961-a227-0e7b11556af3	1215	Medvode
00050000-5620-c961-283e-0861b77bc9e9	1234	Mengeš
00050000-5620-c961-4c29-67dfdbbffe6b	8330	Metlika
00050000-5620-c961-bd6a-9593d8612f78	2392	Mežica
00050000-5620-c961-308f-d3dfed51f8a7	2204	Miklavž na Dravskem polju
00050000-5620-c961-2280-e624965e15fe	2275	Miklavž pri Ormožu
00050000-5620-c961-4252-48e241880fcd	5291	Miren
00050000-5620-c961-bbe7-e644053ab5c8	8233	Mirna
00050000-5620-c961-75d6-f585721281ec	8216	Mirna Peč
00050000-5620-c961-4c8f-c8296d9dbfe3	2382	Mislinja
00050000-5620-c961-c92b-f62b17c95eb1	4281	Mojstrana
00050000-5620-c961-79fa-ea6b72816709	8230	Mokronog
00050000-5620-c961-6725-c5a860ef5702	1251	Moravče
00050000-5620-c961-c9be-b16cdf9afcd8	9226	Moravske Toplice
00050000-5620-c961-be1d-7760c99ae65f	5216	Most na Soči
00050000-5620-c961-b4cb-9efdab1cce95	1221	Motnik
00050000-5620-c961-864e-d7fc7f9db012	3330	Mozirje
00050000-5620-c961-6f51-ae0b1c723374	9000	Murska Sobota 
00050000-5620-c961-1334-c7c461f122f3	9001	Murska Sobota - poštni predali
00050000-5620-c961-1e67-fed7fe09529f	2366	Muta
00050000-5620-c961-81eb-fb81cdf6b828	4202	Naklo
00050000-5620-c961-326d-6b9ca92ebc96	3331	Nazarje
00050000-5620-c961-8387-1e34a046a75f	1357	Notranje Gorice
00050000-5620-c961-57ff-acd82ae0b596	3203	Nova Cerkev
00050000-5620-c961-919b-9990bf78eea8	5000	Nova Gorica 
00050000-5620-c961-abe3-96f7dad56bcc	5001	Nova Gorica - poštni predali
00050000-5620-c961-2c18-2d2af617aba0	1385	Nova vas
00050000-5620-c961-a388-a66319f11a58	8000	Novo mesto
00050000-5620-c961-23c8-7a448092699d	8001	Novo mesto - poštni predali
00050000-5620-c961-e4f5-db6ae831abea	6243	Obrov
00050000-5620-c961-a2ba-df58fb922929	9233	Odranci
00050000-5620-c961-a643-8c02596a3ac2	2317	Oplotnica
00050000-5620-c961-6350-4e13b1573482	2312	Orehova vas
00050000-5620-c961-ed15-af2d491d505f	2270	Ormož
00050000-5620-c961-ad5d-9c5c30d5961b	1316	Ortnek
00050000-5620-c961-25ae-510d56422392	1337	Osilnica
00050000-5620-c961-717e-547eaed45ce6	8222	Otočec
00050000-5620-c961-0a4c-da6c9f77e89e	2361	Ožbalt
00050000-5620-c961-280b-d3e129a6e501	2231	Pernica
00050000-5620-c961-1412-1a91f6fb7cd4	2211	Pesnica pri Mariboru
00050000-5620-c961-09c0-01613e708425	9203	Petrovci
00050000-5620-c961-f1f0-8eb663d5a322	3301	Petrovče
00050000-5620-c961-e051-329c2e1fcdfd	6330	Piran/Pirano
00050000-5620-c961-c445-bed883bfd61d	8255	Pišece
00050000-5620-c961-8eda-5d95323ece0b	6257	Pivka
00050000-5620-c961-6dd4-d64a86eddfe6	6232	Planina
00050000-5620-c961-d41c-cf45661cf80c	3225	Planina pri Sevnici
00050000-5620-c961-2fc7-805ba83f3aa3	6276	Pobegi
00050000-5620-c961-df75-0007625df5fb	8312	Podbočje
00050000-5620-c961-0f70-de6cd90cbe39	5243	Podbrdo
00050000-5620-c961-8627-e28e314c4b64	3254	Podčetrtek
00050000-5620-c961-7efd-23960ca79d7e	2273	Podgorci
00050000-5620-c961-44d5-0022f1653b27	6216	Podgorje
00050000-5620-c961-7431-c5a6df73d2b8	2381	Podgorje pri Slovenj Gradcu
00050000-5620-c961-748b-0e7171ab7165	6244	Podgrad
00050000-5620-c961-4032-6f8e0b143195	1414	Podkum
00050000-5620-c961-990d-a68ddddeed75	2286	Podlehnik
00050000-5620-c961-30b0-296e2147b305	5272	Podnanos
00050000-5620-c961-6c05-9acadd449720	4244	Podnart
00050000-5620-c961-342b-38e3b16c7dd0	3241	Podplat
00050000-5620-c961-a30f-a9e6cd44a616	3257	Podsreda
00050000-5620-c961-e697-ead998ef13ad	2363	Podvelka
00050000-5620-c961-af7b-3a8fadee6da4	2208	Pohorje
00050000-5620-c961-bb33-18ce3f1012df	2257	Polenšak
00050000-5620-c961-5466-cebc7e4527f4	1355	Polhov Gradec
00050000-5620-c961-95da-5e7ae145e119	4223	Poljane nad Škofjo Loko
00050000-5620-c961-7edf-35fcd85fbddb	2319	Poljčane
00050000-5620-c961-3a1c-6ee7675df61e	1272	Polšnik
00050000-5620-c961-d4d1-380ee90cbb2d	3313	Polzela
00050000-5620-c961-a975-a8d39ebc97a2	3232	Ponikva
00050000-5620-c961-43f3-c2528e583bbe	6320	Portorož/Portorose
00050000-5620-c961-285e-c5de5f75ebde	6230	Postojna
00050000-5620-c961-2822-78a477402be8	2331	Pragersko
00050000-5620-c961-65ea-da90cdcf851c	3312	Prebold
00050000-5620-c961-861a-69713706c583	4205	Preddvor
00050000-5620-c961-8625-d4001347174b	6255	Prem
00050000-5620-c961-7afa-dea79606ff7c	1352	Preserje
00050000-5620-c961-4219-b2004dc53ff6	6258	Prestranek
00050000-5620-c961-381a-7af805cb200d	2391	Prevalje
00050000-5620-c961-512c-4a9785e7e6ff	3262	Prevorje
00050000-5620-c961-2e07-0c1885c1942a	1276	Primskovo 
00050000-5620-c961-f5b3-4962a353b7a3	3253	Pristava pri Mestinju
00050000-5620-c961-e1c4-7f9027d830f1	9207	Prosenjakovci/Partosfalva
00050000-5620-c961-248d-4f6991df7f47	5297	Prvačina
00050000-5620-c961-c43b-c187cb0e6849	2250	Ptuj
00050000-5620-c961-ac33-ab7a2e173628	2323	Ptujska Gora
00050000-5620-c961-5dc5-e29316762607	9201	Puconci
00050000-5620-c961-67c4-04338f5c8650	2327	Rače
00050000-5620-c961-f4c4-ee5db6c1b099	1433	Radeče
00050000-5620-c961-3cad-002e685cad82	9252	Radenci
00050000-5620-c961-f18b-b9202f4132b9	2360	Radlje ob Dravi
00050000-5620-c961-36ac-1224f70f6438	1235	Radomlje
00050000-5620-c961-bdb4-f48368c305e7	4240	Radovljica
00050000-5620-c961-d0dd-9e747d1c14b6	8274	Raka
00050000-5620-c961-3856-254f2b95b3f2	1381	Rakek
00050000-5620-c961-2832-8b269a48968d	4283	Rateče - Planica
00050000-5620-c961-94de-bbab3837a8a0	2390	Ravne na Koroškem
00050000-5620-c961-4e2f-e19778b8f9da	9246	Razkrižje
00050000-5620-c961-b2e8-fa735ad54fce	3332	Rečica ob Savinji
00050000-5620-c961-d0f0-9015cd75e7b7	5292	Renče
00050000-5620-c961-7475-ec27524b45ab	1310	Ribnica
00050000-5620-c961-2a61-932cd38d00ff	2364	Ribnica na Pohorju
00050000-5620-c961-1bb3-624aaa49f504	3272	Rimske Toplice
00050000-5620-c961-b6f1-046d52dd4aa2	1314	Rob
00050000-5620-c961-91fe-db25853798ab	5215	Ročinj
00050000-5620-c961-735b-583130ba44e8	3250	Rogaška Slatina
00050000-5620-c961-ad2d-c9c7482a9b80	9262	Rogašovci
00050000-5620-c961-e6a9-2814abb62d4c	3252	Rogatec
00050000-5620-c961-183a-de2e7f0a0f3b	1373	Rovte
00050000-5620-c961-ba98-7bee5a041fab	2342	Ruše
00050000-5620-c961-3dbf-e299ed9d5eac	1282	Sava
00050000-5620-c961-eb77-b6ec133e1576	6333	Sečovlje/Sicciole
00050000-5620-c961-5dd0-d3e5777220c8	4227	Selca
00050000-5620-c961-5629-999c516d5217	2352	Selnica ob Dravi
00050000-5620-c961-ff34-d017fe24d511	8333	Semič
00050000-5620-c961-7d45-fb7f1c77f5b5	8281	Senovo
00050000-5620-c961-5f22-4954a5adafba	6224	Senožeče
00050000-5620-c961-f17f-ccc4fd40e0e7	8290	Sevnica
00050000-5620-c961-bfd4-d6841dfe44a4	6210	Sežana
00050000-5620-c961-ce1a-f845ef09091f	2214	Sladki Vrh
00050000-5620-c961-51f1-1a0a6b56a2c8	5283	Slap ob Idrijci
00050000-5620-c961-960b-db52b0616cca	2380	Slovenj Gradec
00050000-5620-c961-60a4-5f4cdfb6f6c6	2310	Slovenska Bistrica
00050000-5620-c961-06b5-f7ea21e02ec5	3210	Slovenske Konjice
00050000-5620-c961-e0cd-a9cabf844808	1216	Smlednik
00050000-5620-c961-33e8-af22cbb822a1	5232	Soča
00050000-5620-c961-abc7-495171702097	1317	Sodražica
00050000-5620-c961-22ca-084754e0a154	3335	Solčava
00050000-5620-c961-748d-9321d96159dd	5250	Solkan
00050000-5620-c961-d525-e1cad1618151	4229	Sorica
00050000-5620-c961-b2d0-7c817c683553	4225	Sovodenj
00050000-5620-c961-0bf2-acb1ef49c610	5281	Spodnja Idrija
00050000-5620-c961-c68c-e1d34fb77300	2241	Spodnji Duplek
00050000-5620-c961-8668-991d86f47d4a	9245	Spodnji Ivanjci
00050000-5620-c961-de10-5357a3b6841c	2277	Središče ob Dravi
00050000-5620-c961-b5a6-d75ccc5b216c	4267	Srednja vas v Bohinju
00050000-5620-c961-130b-6e6a1e745657	8256	Sromlje 
00050000-5620-c961-fb28-ef2bd05536d9	5224	Srpenica
00050000-5620-c961-b025-04214264a17e	1242	Stahovica
00050000-5620-c961-b039-bd6d02f831c1	1332	Stara Cerkev
00050000-5620-c961-9624-2fcf74582f97	8342	Stari trg ob Kolpi
00050000-5620-c961-8681-3b2dd667c4d7	1386	Stari trg pri Ložu
00050000-5620-c961-a81a-9f2de0d38847	2205	Starše
00050000-5620-c961-725d-c0d81ba4b925	2289	Stoperce
00050000-5620-c961-26ad-bb50d6274a70	8322	Stopiče
00050000-5620-c961-cc36-417f851ee98f	3206	Stranice
00050000-5620-c961-0d94-d3ca4586467a	8351	Straža
00050000-5620-c961-44b1-1f63a333d48c	1313	Struge
00050000-5620-c961-8343-49b519c57696	8293	Studenec
00050000-5620-c961-53a8-5cb5a92674f2	8331	Suhor
00050000-5620-c961-8b7c-fda92a9fd2e2	2233	Sv. Ana v Slovenskih goricah
00050000-5620-c961-5d22-9053fb6041dd	2235	Sv. Trojica v Slovenskih goricah
00050000-5620-c961-2ce5-ef6c2871a673	2353	Sveti Duh na Ostrem Vrhu
00050000-5620-c961-28c8-5a0ef37c9f46	9244	Sveti Jurij ob Ščavnici
00050000-5620-c961-ac06-0008396bd944	3264	Sveti Štefan
00050000-5620-c961-590f-a12609ac4a0d	2258	Sveti Tomaž
00050000-5620-c961-acf8-b7d11541c79a	9204	Šalovci
00050000-5620-c961-03ac-756809819f6f	5261	Šempas
00050000-5620-c961-5979-40a7e1886f21	5290	Šempeter pri Gorici
00050000-5620-c961-a61a-dd6fe3ab0729	3311	Šempeter v Savinjski dolini
00050000-5620-c961-f0e9-f47cfef2cfe8	4208	Šenčur
00050000-5620-c961-a525-fcc29bfca317	2212	Šentilj v Slovenskih goricah
00050000-5620-c961-da8c-82fc57436aa2	8297	Šentjanž
00050000-5620-c961-f202-81250c5d5bf1	2373	Šentjanž pri Dravogradu
00050000-5620-c961-e546-ccebc59ca3a3	8310	Šentjernej
00050000-5620-c961-e109-5e6ba372a7b7	3230	Šentjur
00050000-5620-c961-cf44-7ed7775ba653	3271	Šentrupert
00050000-5620-c961-cf56-518eae3d5fcd	8232	Šentrupert
00050000-5620-c961-76aa-a659138b3012	1296	Šentvid pri Stični
00050000-5620-c961-de1f-f7fba79e14e0	8275	Škocjan
00050000-5620-c961-441a-0775d952d947	6281	Škofije
00050000-5620-c961-0094-bcbd9033e717	4220	Škofja Loka
00050000-5620-c961-d8aa-7ef657563327	3211	Škofja vas
00050000-5620-c961-ae09-5f181f3d646d	1291	Škofljica
00050000-5620-c961-24c9-6a45034384ab	6274	Šmarje
00050000-5620-c961-a926-63782e96864a	1293	Šmarje - Sap
00050000-5620-c961-36ed-d41e9f5250c0	3240	Šmarje pri Jelšah
00050000-5620-c961-77e1-c96e69f49441	8220	Šmarješke Toplice
00050000-5620-c961-a2fa-f6701269ac42	2315	Šmartno na Pohorju
00050000-5620-c961-b43b-58f917f93746	3341	Šmartno ob Dreti
00050000-5620-c961-442c-4d6ffb308f76	3327	Šmartno ob Paki
00050000-5620-c961-201e-afc51f3e45f6	1275	Šmartno pri Litiji
00050000-5620-c961-e5cd-5bec8bf49adf	2383	Šmartno pri Slovenj Gradcu
00050000-5620-c961-1e39-743a79e04acf	3201	Šmartno v Rožni dolini
00050000-5620-c961-b29d-2d1a0145ddaf	3325	Šoštanj
00050000-5620-c961-4a58-20583d6ae08e	6222	Štanjel
00050000-5620-c961-e05e-9cdaba1d757c	3220	Štore
00050000-5620-c961-0946-5fddebbb9f56	3304	Tabor
00050000-5620-c961-1258-017a0d32c063	3221	Teharje
00050000-5620-c961-3349-8b7fe95cf0f1	9251	Tišina
00050000-5620-c961-05db-66c249616d53	5220	Tolmin
00050000-5620-c961-fb99-7e3456abb9c8	3326	Topolšica
00050000-5620-c961-1fa8-e79810959712	2371	Trbonje
00050000-5620-c961-1e32-5da69c3561ed	1420	Trbovlje
00050000-5620-c961-8c13-e937383c61d8	8231	Trebelno 
00050000-5620-c961-ce94-1982cdca0411	8210	Trebnje
00050000-5620-c961-9690-d95aacad857e	5252	Trnovo pri Gorici
00050000-5620-c961-ad35-336060df8639	2254	Trnovska vas
00050000-5620-c961-c7a4-e0d711324ab8	1222	Trojane
00050000-5620-c961-4d51-461d8f4e81b4	1236	Trzin
00050000-5620-c961-f9b8-3ba2fbffb66a	4290	Tržič
00050000-5620-c961-4276-1e3a6fb75be0	8295	Tržišče
00050000-5620-c961-7083-d61a496cd7ed	1311	Turjak
00050000-5620-c961-477a-ca8fcf357e12	9224	Turnišče
00050000-5620-c961-266d-ea1fe2b60602	8323	Uršna sela
00050000-5620-c961-4d0f-1577199e1168	1252	Vače
00050000-5620-c961-e1a1-04ed40260112	3320	Velenje 
00050000-5620-c961-38ac-ce153e38aee7	3322	Velenje - poštni predali
00050000-5620-c961-2627-b5166b00eff5	8212	Velika Loka
00050000-5620-c961-8219-206dfce52f71	2274	Velika Nedelja
00050000-5620-c961-5915-5f575a35abfa	9225	Velika Polana
00050000-5620-c961-9627-062bda2f5ad2	1315	Velike Lašče
00050000-5620-c961-3986-1e3fd9e4d64e	8213	Veliki Gaber
00050000-5620-c961-37d5-42cde05ad94c	9241	Veržej
00050000-5620-c961-4a3f-02773768d0bf	1312	Videm - Dobrepolje
00050000-5620-c961-2c5e-65b13987aee8	2284	Videm pri Ptuju
00050000-5620-c961-ae9e-661bd22fac2d	8344	Vinica
00050000-5620-c961-20b2-c751d91ca002	5271	Vipava
00050000-5620-c961-6a0b-ef5963c81956	4212	Visoko
00050000-5620-c961-47ea-b27eb7803d31	1294	Višnja Gora
00050000-5620-c961-8ff7-87d09d26fc9e	3205	Vitanje
00050000-5620-c961-7988-1b0be1f4064a	2255	Vitomarci
00050000-5620-c961-041d-11efe5fb72c0	1217	Vodice
00050000-5620-c961-14f3-458dfe7ec7b0	3212	Vojnik\t
00050000-5620-c961-e86b-9f659aebe9b7	5293	Volčja Draga
00050000-5620-c961-9a0b-3a310329c3f1	2232	Voličina
00050000-5620-c961-1545-bf2b222a2b97	3305	Vransko
00050000-5620-c961-7157-6a782f0861ae	6217	Vremski Britof
00050000-5620-c961-7b41-fa7c6b78f2b0	1360	Vrhnika
00050000-5620-c961-4104-9353ec0e3043	2365	Vuhred
00050000-5620-c961-b9d0-74658ac9bd28	2367	Vuzenica
00050000-5620-c961-6fdf-155556c804be	8292	Zabukovje 
00050000-5620-c961-e971-e79139656cb8	1410	Zagorje ob Savi
00050000-5620-c961-93a5-ac27ab69d0dc	1303	Zagradec
00050000-5620-c961-c761-09f638231cd7	2283	Zavrč
00050000-5620-c961-dd21-201684bcfcca	8272	Zdole 
00050000-5620-c961-33dc-415f187a3be8	4201	Zgornja Besnica
00050000-5620-c961-8c76-21ffc5120799	2242	Zgornja Korena
00050000-5620-c961-bb2a-63734ccb5968	2201	Zgornja Kungota
00050000-5620-c961-b2e8-de4606bb2796	2316	Zgornja Ložnica
00050000-5620-c961-bc41-eec80fac126c	2314	Zgornja Polskava
00050000-5620-c961-4d52-6efe1fe2c663	2213	Zgornja Velka
00050000-5620-c961-a4ab-07dbd3abeeed	4247	Zgornje Gorje
00050000-5620-c961-951f-04c38c0a3184	4206	Zgornje Jezersko
00050000-5620-c961-547e-ff88bbee43eb	2285	Zgornji Leskovec
00050000-5620-c961-1c5d-e89c97c268cd	1432	Zidani Most
00050000-5620-c961-78a5-e7f0ab096999	3214	Zreče
00050000-5620-c961-0f26-a2a5e67ee47f	4209	Žabnica
00050000-5620-c961-29dd-251119e85d82	3310	Žalec
00050000-5620-c961-1d33-aa78f80500f9	4228	Železniki
00050000-5620-c961-c492-83563722c038	2287	Žetale
00050000-5620-c961-9974-622ac6396bda	4226	Žiri
00050000-5620-c961-dbb6-6131927d5d24	4274	Žirovnica
00050000-5620-c961-6097-d2198e2d3d3f	8360	Žužemberk
\.


--
-- TOC entry 3098 (class 0 OID 22256977)
-- Dependencies: 235
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 22256569)
-- Dependencies: 208
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 22256339)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5620-c964-1214-b351e1176bc8	00080000-5620-c964-1916-8fc34d84ef44	\N	00040000-5620-c962-9683-a41b5a86a260	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5620-c964-27d4-a3b4dc649706	00080000-5620-c964-1916-8fc34d84ef44	\N	00040000-5620-c962-9683-a41b5a86a260	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5620-c964-41f6-7cb26b6dd41e	00080000-5620-c964-56d6-5dcb638f025d	\N	00040000-5620-c962-9683-a41b5a86a260	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3059 (class 0 OID 22256443)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 22256581)
-- Dependencies: 210
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 22256991)
-- Dependencies: 236
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 22257001)
-- Dependencies: 237
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5620-c964-5119-74de2fee241b	00080000-5620-c964-91ee-7c9514304c09	0987	AK
00190000-5620-c964-3665-b7c4df72dcf5	00080000-5620-c964-56d6-5dcb638f025d	0989	AK
00190000-5620-c964-1796-079d1dd73789	00080000-5620-c964-4dc9-bda92b330d7c	0986	AK
00190000-5620-c964-b861-4230f8931104	00080000-5620-c964-3871-be086d3daaf9	0984	AK
00190000-5620-c964-3751-897a76e847bf	00080000-5620-c964-e26f-b894503ce8fa	0983	AK
00190000-5620-c964-5cbb-2bb58a17aaad	00080000-5620-c964-07e9-c4ef8bc418d3	0982	AK
00190000-5620-c966-e4f7-220d2b2edafc	00080000-5620-c966-d29d-192c11603ba6	1001	AK
\.


--
-- TOC entry 3097 (class 0 OID 22256916)
-- Dependencies: 234
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5620-c964-2ff4-73ba0e3befdf	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3101 (class 0 OID 22257009)
-- Dependencies: 238
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 22256610)
-- Dependencies: 214
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5620-c964-6333-548fe13ee9b5	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5620-c964-4cfe-c658fdfcff9c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5620-c964-942e-62378d79f567	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5620-c964-8705-2a0b2adab6a6	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5620-c964-c51d-5ce9ee517678	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5620-c964-1a98-5f95404bc817	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5620-c964-5113-af615bd94872	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3069 (class 0 OID 22256554)
-- Dependencies: 206
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 22256544)
-- Dependencies: 205
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 22256755)
-- Dependencies: 227
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 22256685)
-- Dependencies: 221
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 22256417)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 22256190)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5620-c966-d29d-192c11603ba6	00010000-5620-c962-9bca-5c6b579164b7	2015-10-16 11:54:46	INS	a:0:{}
2	App\\Entity\\Option	00000000-5620-c966-c1bb-8716cb8e8907	00010000-5620-c962-9bca-5c6b579164b7	2015-10-16 11:54:46	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5620-c966-e4f7-220d2b2edafc	00010000-5620-c962-9bca-5c6b579164b7	2015-10-16 11:54:46	INS	a:0:{}
\.


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3078 (class 0 OID 22256623)
-- Dependencies: 215
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 22256228)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5620-c962-a770-d35d02b8f406	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5620-c962-109c-ade91f9e3662	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5620-c962-43a0-b6449c267671	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5620-c962-0aa4-9988c3c2050a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5620-c962-b691-9a0b94fb04c6	planer	Planer dogodkov v koledarju	t
00020000-5620-c962-fc6d-dde6bbbaab5e	kadrovska	Kadrovska služba	t
00020000-5620-c962-57e9-03fc6b3bb86e	arhivar	Ažuriranje arhivalij	t
00020000-5620-c962-91fe-5705d625954b	igralec	Igralec	t
00020000-5620-c962-53fa-dd671166d43c	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5620-c964-db7c-70260a92b357	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3040 (class 0 OID 22256212)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5620-c962-498d-26465e3e1ced	00020000-5620-c962-43a0-b6449c267671
00010000-5620-c962-9bca-5c6b579164b7	00020000-5620-c962-43a0-b6449c267671
00010000-5620-c964-085d-e2b0c5f9594a	00020000-5620-c964-db7c-70260a92b357
\.


--
-- TOC entry 3080 (class 0 OID 22256637)
-- Dependencies: 217
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 22256575)
-- Dependencies: 209
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 22256521)
-- Dependencies: 203
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 22256177)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5620-c961-e992-0403a0f18188	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5620-c961-2b52-120bc3b9fe8a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5620-c961-fb71-25718ac7f6df	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5620-c961-7784-8413a3608545	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5620-c961-028a-27f9e64f8de9	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3035 (class 0 OID 22256169)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5620-c962-0b36-3352c099e650	00230000-5620-c961-7784-8413a3608545	popa
00240000-5620-c962-4c2e-521b8254034d	00230000-5620-c961-7784-8413a3608545	oseba
00240000-5620-c962-db02-3270a6830d2a	00230000-5620-c961-7784-8413a3608545	tippopa
00240000-5620-c962-3a9c-4d70f29909c0	00230000-5620-c961-7784-8413a3608545	organizacijskaenota
00240000-5620-c962-1447-a78ca6f218b5	00230000-5620-c961-7784-8413a3608545	sezona
00240000-5620-c962-f4fd-4204005b9a16	00230000-5620-c961-7784-8413a3608545	tipvaje
00240000-5620-c962-1860-611d3a3161e0	00230000-5620-c961-2b52-120bc3b9fe8a	prostor
00240000-5620-c962-4557-0a72d05b5d1e	00230000-5620-c961-7784-8413a3608545	besedilo
00240000-5620-c962-4396-b7f68cfe0761	00230000-5620-c961-7784-8413a3608545	uprizoritev
00240000-5620-c962-0d98-30b6451f7740	00230000-5620-c961-7784-8413a3608545	funkcija
00240000-5620-c962-819e-7130a0c0b59a	00230000-5620-c961-7784-8413a3608545	tipfunkcije
00240000-5620-c962-4141-066b4d9c8a71	00230000-5620-c961-7784-8413a3608545	alternacija
00240000-5620-c962-90f6-009ea8f883bb	00230000-5620-c961-e992-0403a0f18188	pogodba
00240000-5620-c962-bc4f-0b744bd4c022	00230000-5620-c961-7784-8413a3608545	zaposlitev
00240000-5620-c962-edcf-a9ac9b218d6a	00230000-5620-c961-7784-8413a3608545	zvrstuprizoritve
00240000-5620-c962-a030-c5a67c4cc31b	00230000-5620-c961-e992-0403a0f18188	programdela
00240000-5620-c962-aa60-89a0ffa98057	00230000-5620-c961-7784-8413a3608545	zapis
\.


--
-- TOC entry 3034 (class 0 OID 22256164)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
58ba3cdc-1a10-478a-a84a-3db27f534ee7	00240000-5620-c962-0b36-3352c099e650	0	1001
\.


--
-- TOC entry 3086 (class 0 OID 22256702)
-- Dependencies: 223
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5620-c964-4f6c-14b761ab5566	000e0000-5620-c964-f5a2-ede43b8788f4	00080000-5620-c964-1916-8fc34d84ef44	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5620-c962-d4b8-0e88c33f5d09
00270000-5620-c964-0af4-29c06a614127	000e0000-5620-c964-f5a2-ede43b8788f4	00080000-5620-c964-1916-8fc34d84ef44	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5620-c962-d4b8-0e88c33f5d09
\.


--
-- TOC entry 3048 (class 0 OID 22256300)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 22256531)
-- Dependencies: 204
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5620-c964-103b-2b3f05940fba	00180000-5620-c964-fd42-8614733ed953	000c0000-5620-c964-f89c-8f543b4ec89c	00090000-5620-c964-99cd-6dd581d35031	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-c964-64d9-6649a3b84ac9	00180000-5620-c964-fd42-8614733ed953	000c0000-5620-c964-ea90-86068820e739	00090000-5620-c964-1b3b-f544f9f9a64b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-c964-07c2-fe03aaba8d58	00180000-5620-c964-fd42-8614733ed953	000c0000-5620-c964-18cd-0bcdd94134c2	00090000-5620-c964-9f88-bf27f7594878	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-c964-7309-58b5895b7b0c	00180000-5620-c964-fd42-8614733ed953	000c0000-5620-c964-555f-566b230cd796	00090000-5620-c964-3495-1478b4b412d3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-c964-6904-d75f7096545c	00180000-5620-c964-fd42-8614733ed953	000c0000-5620-c964-07bb-0dfddadbd656	00090000-5620-c964-7f65-9b2ebf14493c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5620-c964-577e-61ee241983fe	00180000-5620-c964-1395-33138086a693	\N	00090000-5620-c964-7f65-9b2ebf14493c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	\N	\N
\.


--
-- TOC entry 3089 (class 0 OID 22256743)
-- Dependencies: 226
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5620-c961-ccf3-a1be9ac4dd26	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5620-c961-d25a-b5ff610b1fe8	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5620-c961-b954-106689649582	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5620-c961-9c4d-c3daaee5d1c9	04	Režija	Režija	Režija	umetnik	30
000f0000-5620-c961-b2dd-f309292931fd	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5620-c961-454f-15a5817e190d	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5620-c961-635b-db36be776746	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5620-c961-7c7d-798a5fd539a7	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5620-c961-d4ea-f7d19608fd69	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5620-c961-1a30-60e18e46bb1b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5620-c961-33b9-37bd9566385b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5620-c961-f08e-869fff9a9614	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5620-c961-ed17-69a77780ada7	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5620-c961-9c1d-6c4dab385e04	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5620-c961-b68a-777b8d207c08	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5620-c961-df9f-708e4701faad	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5620-c961-540e-92359d496716	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5620-c961-399f-d94966c75921	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3045 (class 0 OID 22256254)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5620-c964-4cc4-0c0a2179d76e	0001	šola	osnovna ali srednja šola
00400000-5620-c964-55f3-44909341e2b1	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5620-c964-5d61-e46b9dcdffe1	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3102 (class 0 OID 22257020)
-- Dependencies: 239
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5620-c961-17c2-14de94d8898e	01	Velika predstava	f	1.00	1.00
002b0000-5620-c961-d647-949a3b34011f	02	Mala predstava	f	0.50	0.50
002b0000-5620-c961-6400-73f8e19aec29	03	Mala koprodukcija	t	0.40	1.00
002b0000-5620-c961-d89e-528f40cbb247	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5620-c961-865b-bad5762dde5d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3065 (class 0 OID 22256511)
-- Dependencies: 202
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5620-c961-6603-28aedfa7f378	0001	prva vaja	prva vaja
00420000-5620-c961-c49c-c8fbae8d6485	0002	tehnična vaja	tehnična vaja
00420000-5620-c961-8267-842feadd3901	0003	lučna vaja	lučna vaja
00420000-5620-c961-38b3-295ddb986bca	0004	kostumska vaja	kostumska vaja
00420000-5620-c961-1552-1f6b0e24e085	0005	foto vaja	foto vaja
00420000-5620-c961-ec4a-ff8b0536aea2	0006	1. glavna vaja	1. glavna vaja
00420000-5620-c961-c36a-ac18f1074fe8	0007	2. glavna vaja	2. glavna vaja
00420000-5620-c961-9681-eb451bf79309	0008	1. generalka	1. generalka
00420000-5620-c961-413a-1a8b1b00ba79	0009	2. generalka	2. generalka
00420000-5620-c961-c7b9-54ba0ef7072a	0010	odprta generalka	odprta generalka
00420000-5620-c961-453e-44b630db632c	0011	obnovitvena vaja	obnovitvena vaja
00420000-5620-c961-b1e4-485228d1ee3f	0012	pevska vaja	pevska vaja
00420000-5620-c961-1e26-e242acc4c1c9	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5620-c961-b05e-36f0ca5f1b98	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3054 (class 0 OID 22256374)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 22256199)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5620-c962-9bca-5c6b579164b7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROfa3iltKnSRL6Tuo7dTyrz636DOxm2y.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5620-c964-dbc0-384d1ae227be	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5620-c964-dc88-0bea4f2b54b1	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5620-c964-256c-dfc126c24b81	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5620-c964-52b0-7eedc7adb382	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5620-c964-5033-995b14100b34	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5620-c964-aaa2-c875255be953	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5620-c964-ed5b-04dd2da24009	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5620-c964-580d-64afd7e4481f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5620-c964-172f-40bd78b85b95	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5620-c964-085d-e2b0c5f9594a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5620-c962-498d-26465e3e1ced	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3093 (class 0 OID 22256793)
-- Dependencies: 230
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5620-c964-3e17-6e47deb527eb	00160000-5620-c964-9f2a-12482b0bb2a2	\N	00140000-5620-c962-395a-68ca681cc087	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5620-c964-c51d-5ce9ee517678
000e0000-5620-c964-f5a2-ede43b8788f4	00160000-5620-c964-5671-b80f4dc0cc54	\N	00140000-5620-c962-34d6-c28d3e14a1aa	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5620-c964-1a98-5f95404bc817
000e0000-5620-c964-28f2-59f450f80e38	\N	\N	00140000-5620-c962-34d6-c28d3e14a1aa	00190000-5620-c964-5119-74de2fee241b	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5620-c964-c51d-5ce9ee517678
000e0000-5620-c964-0071-4fd8f2f74ce9	\N	\N	00140000-5620-c962-34d6-c28d3e14a1aa	00190000-5620-c964-5119-74de2fee241b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5620-c964-c51d-5ce9ee517678
000e0000-5620-c964-c189-3c698453c9cc	\N	\N	00140000-5620-c962-34d6-c28d3e14a1aa	00190000-5620-c964-5119-74de2fee241b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5620-c964-6333-548fe13ee9b5
000e0000-5620-c964-c2d0-910fdff36a2e	\N	\N	00140000-5620-c962-34d6-c28d3e14a1aa	00190000-5620-c964-5119-74de2fee241b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5620-c964-6333-548fe13ee9b5
\.


--
-- TOC entry 3061 (class 0 OID 22256465)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5620-c964-f5b4-fcd6a08e2dbe	\N	000e0000-5620-c964-f5a2-ede43b8788f4	1	
00200000-5620-c964-f8d5-8d5f338eb782	\N	000e0000-5620-c964-f5a2-ede43b8788f4	2	
00200000-5620-c964-f32d-815d87da0e68	\N	000e0000-5620-c964-f5a2-ede43b8788f4	3	
00200000-5620-c964-2856-33e11d3a8256	\N	000e0000-5620-c964-f5a2-ede43b8788f4	4	
00200000-5620-c964-a112-e9b451c3481e	\N	000e0000-5620-c964-f5a2-ede43b8788f4	5	
\.


--
-- TOC entry 3076 (class 0 OID 22256602)
-- Dependencies: 213
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 22256716)
-- Dependencies: 224
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5620-c962-172a-e12b37b39ed6	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5620-c962-77c2-5da700e3314c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5620-c962-6d30-88441aec0a32	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5620-c962-577a-74858957d2f4	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5620-c962-c802-c7f79523586f	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5620-c962-38ef-0275b68762b0	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5620-c962-ec1a-9104dd20a6e8	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5620-c962-62f3-18072965e2ac	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5620-c962-d4b8-0e88c33f5d09	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5620-c962-c11c-4e7ef66e3a88	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5620-c962-a156-812e4dbee215	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5620-c962-3142-28c52267664c	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5620-c962-cd9f-e16defc5db23	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5620-c962-556c-02ec0850a009	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5620-c962-84c8-6eacd04661c2	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5620-c962-6bf7-43c3e4220004	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5620-c962-873d-38fa2a1fe9c9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5620-c962-737e-8312b149030b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5620-c962-446e-8a4577bc882f	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5620-c962-95b5-0d52f1745904	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5620-c962-a972-cdb47940fff7	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5620-c962-b720-a47eeaacc838	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5620-c962-4467-9c7bbb88c2eb	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5620-c962-a8c6-1fe11e742e55	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5620-c962-427e-d468b21386cb	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5620-c962-129e-38c0a4400e0c	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5620-c962-1d4d-88a41ddf7f51	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5620-c962-195b-db6f65cd8ec7	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3105 (class 0 OID 22257067)
-- Dependencies: 242
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 22257039)
-- Dependencies: 241
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 22257079)
-- Dependencies: 243
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 22256674)
-- Dependencies: 220
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5620-c964-241d-390a42e5b637	00090000-5620-c964-1b3b-f544f9f9a64b	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-c964-d159-929a6d5f9607	00090000-5620-c964-9f88-bf27f7594878	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-c964-cf1e-0613372adc7f	00090000-5620-c964-aa6a-ab412bcae36d	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-c964-3739-258c8c223854	00090000-5620-c964-4227-44923a8ce1f4	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-c964-f7c4-95154066256f	00090000-5620-c964-99cd-6dd581d35031	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5620-c964-132a-01eafb4de251	00090000-5620-c964-0dec-bc6f17804999	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3063 (class 0 OID 22256500)
-- Dependencies: 200
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 22256783)
-- Dependencies: 229
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5620-c962-395a-68ca681cc087	01	Drama	drama (SURS 01)
00140000-5620-c962-3812-5515ce167164	02	Opera	opera (SURS 02)
00140000-5620-c962-489c-9e793fa1e45a	03	Balet	balet (SURS 03)
00140000-5620-c962-02c7-6de4e4427382	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5620-c962-28d3-2d3b0d5d13ce	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5620-c962-34d6-c28d3e14a1aa	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5620-c962-3a9d-48c9ca46ad8b	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3082 (class 0 OID 22256664)
-- Dependencies: 219
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2543 (class 2606 OID 22256253)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 22256842)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 22256832)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 22256699)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 22256741)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 22257119)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 22256489)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 22256510)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 22257037)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 22256400)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 22256910)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 22256660)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 22256463)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 22256438)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 22256414)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 22256567)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 22257096)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 22257103)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2814 (class 2606 OID 22257127)
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
-- TOC entry 2671 (class 2606 OID 22256594)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 22256372)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 22256272)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 22256334)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 22256296)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 22256242)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2534 (class 2606 OID 22256227)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 22256600)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 22256636)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 22256778)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 22256324)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 22256360)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 22256989)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 22256573)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 22256350)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 22256451)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 22256585)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 22256998)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 22257006)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 22256976)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 22257018)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 22256618)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 22256558)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 22256549)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 22256765)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 22256692)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 22256426)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 22256198)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 22256627)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 22256216)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2536 (class 2606 OID 22256236)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 22256645)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 22256580)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 22256529)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 22256186)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 22256174)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 22256168)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 22256712)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 22256305)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 22256540)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 22256752)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 22256261)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 22257030)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 22256518)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 22256385)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 22256211)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 22256811)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 22256472)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 22256608)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 22256724)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 22257077)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 22257061)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 22257085)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 22256682)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 22256504)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 22256791)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 22256672)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 1259 OID 22256498)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2620 (class 1259 OID 22256499)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2621 (class 1259 OID 22256497)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2622 (class 1259 OID 22256496)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2623 (class 1259 OID 22256495)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2714 (class 1259 OID 22256713)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2715 (class 1259 OID 22256714)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2716 (class 1259 OID 22256715)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 22257098)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2801 (class 1259 OID 22257097)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2561 (class 1259 OID 22256326)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2562 (class 1259 OID 22256327)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2672 (class 1259 OID 22256601)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2787 (class 1259 OID 22257065)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2788 (class 1259 OID 22257064)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2789 (class 1259 OID 22257066)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2790 (class 1259 OID 22257063)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2791 (class 1259 OID 22257062)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2666 (class 1259 OID 22256587)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2667 (class 1259 OID 22256586)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2613 (class 1259 OID 22256473)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2614 (class 1259 OID 22256474)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 22256661)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2697 (class 1259 OID 22256663)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2698 (class 1259 OID 22256662)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2593 (class 1259 OID 22256416)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 22256415)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 22257019)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2730 (class 1259 OID 22256780)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 22256781)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2732 (class 1259 OID 22256782)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2797 (class 1259 OID 22257086)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2739 (class 1259 OID 22256816)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2740 (class 1259 OID 22256813)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2741 (class 1259 OID 22256817)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2742 (class 1259 OID 22256815)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2743 (class 1259 OID 22256814)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2583 (class 1259 OID 22256387)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 22256386)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2552 (class 1259 OID 22256299)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2684 (class 1259 OID 22256628)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2538 (class 1259 OID 22256243)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2539 (class 1259 OID 22256244)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2689 (class 1259 OID 22256648)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 22256647)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2691 (class 1259 OID 22256646)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2566 (class 1259 OID 22256337)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2567 (class 1259 OID 22256336)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2568 (class 1259 OID 22256338)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2606 (class 1259 OID 22256452)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 22256453)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2518 (class 1259 OID 22256176)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2646 (class 1259 OID 22256553)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2647 (class 1259 OID 22256551)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2648 (class 1259 OID 22256550)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2649 (class 1259 OID 22256552)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2529 (class 1259 OID 22256217)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2530 (class 1259 OID 22256218)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2675 (class 1259 OID 22256609)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2810 (class 1259 OID 22257120)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2712 (class 1259 OID 22256701)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2713 (class 1259 OID 22256700)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2811 (class 1259 OID 22257128)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2812 (class 1259 OID 22257129)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2661 (class 1259 OID 22256574)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2706 (class 1259 OID 22256693)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2707 (class 1259 OID 22256694)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2760 (class 1259 OID 22256915)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2761 (class 1259 OID 22256914)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2762 (class 1259 OID 22256911)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2763 (class 1259 OID 22256912)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2764 (class 1259 OID 22256913)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2572 (class 1259 OID 22256352)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2573 (class 1259 OID 22256351)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2574 (class 1259 OID 22256353)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2678 (class 1259 OID 22256622)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2679 (class 1259 OID 22256621)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2770 (class 1259 OID 22256999)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2771 (class 1259 OID 22257000)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2753 (class 1259 OID 22256846)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 22256847)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2755 (class 1259 OID 22256844)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2756 (class 1259 OID 22256845)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2702 (class 1259 OID 22256683)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2703 (class 1259 OID 22256684)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2652 (class 1259 OID 22256562)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2653 (class 1259 OID 22256561)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2654 (class 1259 OID 22256559)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2655 (class 1259 OID 22256560)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2749 (class 1259 OID 22256834)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2750 (class 1259 OID 22256833)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2597 (class 1259 OID 22256427)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2600 (class 1259 OID 22256441)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2601 (class 1259 OID 22256440)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2602 (class 1259 OID 22256439)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2603 (class 1259 OID 22256442)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2612 (class 1259 OID 22256464)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 22256990)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2786 (class 1259 OID 22257038)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2804 (class 1259 OID 22257104)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2805 (class 1259 OID 22257105)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2548 (class 1259 OID 22256274)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2549 (class 1259 OID 22256273)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2557 (class 1259 OID 22256306)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 22256307)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2629 (class 1259 OID 22256505)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 22256543)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 22256542)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2643 (class 1259 OID 22256541)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2624 (class 1259 OID 22256491)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2625 (class 1259 OID 22256492)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2626 (class 1259 OID 22256490)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2627 (class 1259 OID 22256494)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2628 (class 1259 OID 22256493)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2565 (class 1259 OID 22256325)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 22256262)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 22256263)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2589 (class 1259 OID 22256401)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 22256403)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2591 (class 1259 OID 22256402)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2592 (class 1259 OID 22256404)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2660 (class 1259 OID 22256568)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 22256779)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 22256812)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2726 (class 1259 OID 22256753)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 22256754)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2555 (class 1259 OID 22256297)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 22256298)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2699 (class 1259 OID 22256673)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 22256187)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 22256373)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2571 (class 1259 OID 22256335)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 22256175)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2783 (class 1259 OID 22257031)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2682 (class 1259 OID 22256620)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2683 (class 1259 OID 22256619)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 22256519)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 22256520)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2757 (class 1259 OID 22256843)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 22256361)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 22256792)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 22257078)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2776 (class 1259 OID 22257007)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 22257008)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2723 (class 1259 OID 22256742)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2640 (class 1259 OID 22256530)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 22256237)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2850 (class 2606 OID 22257285)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2849 (class 2606 OID 22257290)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2845 (class 2606 OID 22257310)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2851 (class 2606 OID 22257280)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2847 (class 2606 OID 22257300)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2846 (class 2606 OID 22257305)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2848 (class 2606 OID 22257295)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2887 (class 2606 OID 22257480)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2886 (class 2606 OID 22257485)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2885 (class 2606 OID 22257490)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 22257655)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2920 (class 2606 OID 22257650)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 22257185)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2826 (class 2606 OID 22257190)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2868 (class 2606 OID 22257395)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2914 (class 2606 OID 22257635)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 22257630)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2913 (class 2606 OID 22257640)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2916 (class 2606 OID 22257625)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2917 (class 2606 OID 22257620)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2866 (class 2606 OID 22257390)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2867 (class 2606 OID 22257385)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2844 (class 2606 OID 22257270)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2843 (class 2606 OID 22257275)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2878 (class 2606 OID 22257435)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2876 (class 2606 OID 22257445)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2877 (class 2606 OID 22257440)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2836 (class 2606 OID 22257240)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2837 (class 2606 OID 22257235)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2864 (class 2606 OID 22257375)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 22257610)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2890 (class 2606 OID 22257495)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 22257500)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 22257505)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2918 (class 2606 OID 22257645)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2892 (class 2606 OID 22257525)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2895 (class 2606 OID 22257510)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2891 (class 2606 OID 22257530)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2893 (class 2606 OID 22257520)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2894 (class 2606 OID 22257515)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2834 (class 2606 OID 22257230)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2835 (class 2606 OID 22257225)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2822 (class 2606 OID 22257170)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2823 (class 2606 OID 22257165)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 22257415)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2819 (class 2606 OID 22257145)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2818 (class 2606 OID 22257150)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2873 (class 2606 OID 22257430)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2874 (class 2606 OID 22257425)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2875 (class 2606 OID 22257420)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2829 (class 2606 OID 22257200)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2830 (class 2606 OID 22257195)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2828 (class 2606 OID 22257205)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2841 (class 2606 OID 22257255)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2840 (class 2606 OID 22257260)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2815 (class 2606 OID 22257130)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2856 (class 2606 OID 22257350)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2858 (class 2606 OID 22257340)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2859 (class 2606 OID 22257335)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2857 (class 2606 OID 22257345)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2817 (class 2606 OID 22257135)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 22257140)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2869 (class 2606 OID 22257400)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2923 (class 2606 OID 22257670)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2883 (class 2606 OID 22257475)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 22257470)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2925 (class 2606 OID 22257675)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2924 (class 2606 OID 22257680)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2865 (class 2606 OID 22257380)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2882 (class 2606 OID 22257460)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2881 (class 2606 OID 22257465)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2902 (class 2606 OID 22257585)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2903 (class 2606 OID 22257580)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2906 (class 2606 OID 22257565)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2905 (class 2606 OID 22257570)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2904 (class 2606 OID 22257575)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2832 (class 2606 OID 22257215)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2833 (class 2606 OID 22257210)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2831 (class 2606 OID 22257220)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2870 (class 2606 OID 22257410)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2871 (class 2606 OID 22257405)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2909 (class 2606 OID 22257595)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2908 (class 2606 OID 22257600)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2899 (class 2606 OID 22257555)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2898 (class 2606 OID 22257560)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2901 (class 2606 OID 22257545)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2900 (class 2606 OID 22257550)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2880 (class 2606 OID 22257450)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 22257455)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2860 (class 2606 OID 22257370)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2861 (class 2606 OID 22257365)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2863 (class 2606 OID 22257355)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2862 (class 2606 OID 22257360)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2896 (class 2606 OID 22257540)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2897 (class 2606 OID 22257535)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2838 (class 2606 OID 22257245)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2839 (class 2606 OID 22257250)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2842 (class 2606 OID 22257265)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2907 (class 2606 OID 22257590)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2910 (class 2606 OID 22257605)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2912 (class 2606 OID 22257615)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2922 (class 2606 OID 22257660)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2921 (class 2606 OID 22257665)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2820 (class 2606 OID 22257160)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2821 (class 2606 OID 22257155)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2825 (class 2606 OID 22257175)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2824 (class 2606 OID 22257180)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2852 (class 2606 OID 22257315)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2853 (class 2606 OID 22257330)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2854 (class 2606 OID 22257325)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2855 (class 2606 OID 22257320)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-16 11:54:47 CEST

--
-- PostgreSQL database dump complete
--

