--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-13 11:47:11 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 245 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21746356)
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
-- TOC entry 229 (class 1259 OID 21746913)
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
-- TOC entry 228 (class 1259 OID 21746896)
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
-- TOC entry 219 (class 1259 OID 21746773)
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
-- TOC entry 222 (class 1259 OID 21746803)
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
-- TOC entry 243 (class 1259 OID 21747184)
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
-- TOC entry 197 (class 1259 OID 21746564)
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
-- TOC entry 199 (class 1259 OID 21746595)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21747110)
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
-- TOC entry 190 (class 1259 OID 21746477)
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
-- TOC entry 230 (class 1259 OID 21746926)
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
-- TOC entry 215 (class 1259 OID 21746728)
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
-- TOC entry 195 (class 1259 OID 21746543)
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
-- TOC entry 193 (class 1259 OID 21746517)
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
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21746494)
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
-- TOC entry 204 (class 1259 OID 21746642)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21747165)
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
-- TOC entry 242 (class 1259 OID 21747177)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21747199)
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
-- TOC entry 170 (class 1259 OID 21729914)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 21746667)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21746451)
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
-- TOC entry 182 (class 1259 OID 21746365)
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
-- TOC entry 183 (class 1259 OID 21746376)
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
-- TOC entry 178 (class 1259 OID 21746330)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21746349)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21746674)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21746708)
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
-- TOC entry 225 (class 1259 OID 21746844)
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
-- TOC entry 185 (class 1259 OID 21746409)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
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
-- TOC entry 187 (class 1259 OID 21746443)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21747055)
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
-- TOC entry 205 (class 1259 OID 21746648)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21746428)
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
-- TOC entry 194 (class 1259 OID 21746532)
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
-- TOC entry 207 (class 1259 OID 21746660)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21747069)
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
-- TOC entry 234 (class 1259 OID 21747079)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21746994)
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
-- TOC entry 235 (class 1259 OID 21747087)
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
-- TOC entry 211 (class 1259 OID 21746689)
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
-- TOC entry 203 (class 1259 OID 21746633)
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
-- TOC entry 202 (class 1259 OID 21746623)
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
-- TOC entry 224 (class 1259 OID 21746833)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21746763)
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
-- TOC entry 192 (class 1259 OID 21746506)
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
-- TOC entry 175 (class 1259 OID 21746301)
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
-- TOC entry 174 (class 1259 OID 21746299)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21746702)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21746339)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21746323)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21746716)
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
-- TOC entry 206 (class 1259 OID 21746654)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21746600)
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
-- TOC entry 173 (class 1259 OID 21746288)
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
-- TOC entry 172 (class 1259 OID 21746280)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21746275)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21746780)
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
-- TOC entry 184 (class 1259 OID 21746401)
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
-- TOC entry 201 (class 1259 OID 21746610)
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
-- TOC entry 223 (class 1259 OID 21746821)
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
-- TOC entry 236 (class 1259 OID 21747098)
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
-- TOC entry 189 (class 1259 OID 21746463)
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
-- TOC entry 176 (class 1259 OID 21746310)
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
-- TOC entry 227 (class 1259 OID 21746871)
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
-- TOC entry 196 (class 1259 OID 21746554)
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
-- TOC entry 210 (class 1259 OID 21746681)
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
-- TOC entry 221 (class 1259 OID 21746794)
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
-- TOC entry 239 (class 1259 OID 21747145)
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
-- TOC entry 238 (class 1259 OID 21747117)
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
-- TOC entry 240 (class 1259 OID 21747157)
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
-- TOC entry 217 (class 1259 OID 21746753)
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
-- TOC entry 198 (class 1259 OID 21746589)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21746861)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21746743)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21746304)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3006 (class 0 OID 21746356)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21746913)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561c-d31d-8dc3-b6d27ee10f2a	000d0000-561c-d31c-f281-2ff0cf0ac321	\N	00090000-561c-d31c-79e2-ef281fb24ad1	000b0000-561c-d31c-25ab-5e181d28dfb0	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561c-d31d-2357-1ee520083bc5	000d0000-561c-d31c-639f-30c5b95a542b	00100000-561c-d31c-8973-81b000e5f2cc	00090000-561c-d31c-8f91-516b40b1eb0b	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561c-d31d-b88d-9dc1c9ec1e36	000d0000-561c-d31c-33b4-3fa624115e72	00100000-561c-d31c-cbeb-e2f2b08c8cf5	00090000-561c-d31c-12e3-230fc8f082c7	\N	0003	t	\N	2015-10-13	\N	2	t	\N	f	f
000c0000-561c-d31d-af64-c6b11082d747	000d0000-561c-d31c-72c5-0c8177776e99	\N	00090000-561c-d31c-13c0-9082c9dbf8c5	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561c-d31d-c825-c62503ac7c5b	000d0000-561c-d31c-c497-0413cccae81d	\N	00090000-561c-d31c-88f6-3281709c94de	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561c-d31d-5a4c-1acd1938c9e1	000d0000-561c-d31c-bfd1-7a36c598be3f	\N	00090000-561c-d31c-58c9-5886da0baf38	000b0000-561c-d31c-b69b-ce00befef011	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561c-d31d-6d48-f5a4e0e26d6b	000d0000-561c-d31c-579c-7e85c605122a	00100000-561c-d31c-b446-54fbca8943b7	00090000-561c-d31c-28d4-90b2e46ad5a4	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561c-d31d-d210-b4409883b0c6	000d0000-561c-d31c-6ac4-4849e25c38e8	\N	00090000-561c-d31c-7277-e01a8a6e76c0	000b0000-561c-d31c-eb17-9973b97967b9	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561c-d31d-11c5-5b35412ef1c7	000d0000-561c-d31c-579c-7e85c605122a	00100000-561c-d31c-5913-3d27b374f780	00090000-561c-d31c-6fe8-b9382622d13c	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561c-d31d-022b-68a2a8a391e7	000d0000-561c-d31c-579c-7e85c605122a	00100000-561c-d31c-37be-0079c046e59f	00090000-561c-d31c-d7a9-6a5d8b0e6ba0	\N	0010	t	\N	2015-10-13	\N	16	f	\N	f	t
000c0000-561c-d31d-8bbe-a84868e0a0be	000d0000-561c-d31c-579c-7e85c605122a	00100000-561c-d31c-9fdf-2649830cc1af	00090000-561c-d31c-1dbd-620a899b677b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561c-d31d-04bb-811ec0caacf5	000d0000-561c-d31c-9d33-1c078016a757	\N	00090000-561c-d31c-8f91-516b40b1eb0b	000b0000-561c-d31c-5703-c37e11e4b73a	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3053 (class 0 OID 21746896)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3044 (class 0 OID 21746773)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561c-d31c-6fd9-e30d83f158af	00160000-561c-d31c-349c-271c657807e4	00090000-561c-d31c-c651-f701d23eb008	aizv	10	t
003d0000-561c-d31c-8023-02c3c4ab430e	00160000-561c-d31c-349c-271c657807e4	00090000-561c-d31c-1d98-b82c48e543cc	apri	14	t
003d0000-561c-d31c-f40c-b738e7936f30	00160000-561c-d31c-ad95-dda0cb9c36ca	00090000-561c-d31c-b5ca-73ea1683b712	aizv	11	t
003d0000-561c-d31c-cea9-c89af1711d33	00160000-561c-d31c-e633-b5fdd0abf9b4	00090000-561c-d31c-bd9d-4d7593714de3	aizv	12	t
003d0000-561c-d31c-bf10-d840268b287b	00160000-561c-d31c-349c-271c657807e4	00090000-561c-d31c-ea34-b970b1214f64	apri	18	f
\.


--
-- TOC entry 3047 (class 0 OID 21746803)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561c-d31c-349c-271c657807e4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561c-d31c-ad95-dda0cb9c36ca	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561c-d31c-e633-b5fdd0abf9b4	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3068 (class 0 OID 21747184)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21746564)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561c-d31d-cd00-113331425d3f	\N	\N	00200000-561c-d31c-9f44-bd995f402179	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561c-d31d-ae5e-bf8bd3bb14a7	\N	\N	00200000-561c-d31c-09fd-eca550dd908d	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561c-d31d-f044-a79e31d538f9	\N	\N	00200000-561c-d31c-b9a0-5c8821a12312	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561c-d31d-b487-6213eec78509	\N	\N	00200000-561c-d31c-8dc1-a7f633040920	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561c-d31d-851d-e919e90805a4	\N	\N	00200000-561c-d31c-8c26-cb94df4280da	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3024 (class 0 OID 21746595)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 21747110)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21746477)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561c-d31a-42dd-bc541012062d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561c-d31a-4681-c4df0c18480c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561c-d31a-4c2c-6bd4a7d829ac	AL	ALB	008	Albania 	Albanija	\N
00040000-561c-d31a-99a3-8a388d42ad3f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561c-d31a-22ba-6eebb27bb536	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561c-d31a-5bc0-e8fa272a7b2b	AD	AND	020	Andorra 	Andora	\N
00040000-561c-d31a-b9e5-c6c407410009	AO	AGO	024	Angola 	Angola	\N
00040000-561c-d31a-077c-dcfcd9c2e7f9	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561c-d31a-a055-22b229400a05	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561c-d31a-efb5-987405a8a52f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561c-d31a-cada-af52d29384d1	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561c-d31a-1a81-c4b992a9d833	AM	ARM	051	Armenia 	Armenija	\N
00040000-561c-d31a-c439-9a42ebf7bc1d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561c-d31a-a759-de44b38ee63c	AU	AUS	036	Australia 	Avstralija	\N
00040000-561c-d31a-fc8d-66a6c383df38	AT	AUT	040	Austria 	Avstrija	\N
00040000-561c-d31a-96cc-6e33714fc5c6	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561c-d31a-a494-abd1077df978	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561c-d31a-e3c2-8a8d16c5c5bd	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561c-d31a-2405-1301d84c10ad	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561c-d31a-a57e-1f023a8bec1f	BB	BRB	052	Barbados 	Barbados	\N
00040000-561c-d31a-ca84-b1dd7bebaeef	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561c-d31a-1c9c-ec4956691e34	BE	BEL	056	Belgium 	Belgija	\N
00040000-561c-d31a-cb49-5c34ef274b52	BZ	BLZ	084	Belize 	Belize	\N
00040000-561c-d31a-99d0-d2d5b9148edc	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561c-d31a-22ba-c93dedbf949a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561c-d31a-0072-55aa6135b12b	BT	BTN	064	Bhutan 	Butan	\N
00040000-561c-d31a-6bc1-79d9ab5d84d0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561c-d31a-3b44-56ab249b64ec	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561c-d31a-73a5-7b6ff86cf0ea	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561c-d31a-a34b-252e41bc84e1	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561c-d31a-a6cf-4eaa51dd80ef	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561c-d31a-f285-7a1e0d7bd320	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561c-d31a-a986-b93e5818aed0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561c-d31a-037e-6b7aefd38b9e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561c-d31a-48ee-200b3f3c95d7	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561c-d31a-dd6a-1f7fc3a0ec01	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561c-d31a-ae19-317a5a8dbb5e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561c-d31a-2240-64a61a34539f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561c-d31a-8820-6d706c861bd1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561c-d31a-9a78-833bf08a9e21	CA	CAN	124	Canada 	Kanada	\N
00040000-561c-d31a-9d84-d585cbc5a9d5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561c-d31a-e27b-44186596a75a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561c-d31a-66c5-49ef14a805b5	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561c-d31a-01d1-27e1103ebea1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561c-d31a-6045-6d64d36782ba	CL	CHL	152	Chile 	Čile	\N
00040000-561c-d31a-56a3-981eb5c9f544	CN	CHN	156	China 	Kitajska	\N
00040000-561c-d31a-a037-4c6d14b783f5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561c-d31a-a258-1e7b5c14ebe2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561c-d31a-682d-67ab70d251b2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561c-d31a-9ecc-4854a3b80909	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561c-d31a-67b2-2a6ae9796f81	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561c-d31a-5710-4d261cf39f47	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561c-d31a-6c86-76e1378690e4	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561c-d31a-7874-6356ecf4cde5	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561c-d31a-eca4-9b058c382ccd	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561c-d31a-69aa-988ddccc1c2e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561c-d31a-68da-cc17f725facc	CU	CUB	192	Cuba 	Kuba	\N
00040000-561c-d31a-65c8-30915ce2b9e7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561c-d31a-8b80-7bc984c7f2d7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561c-d31a-ae2c-ec5c31cc880b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561c-d31a-2239-7d068948d340	DK	DNK	208	Denmark 	Danska	\N
00040000-561c-d31a-9c16-14ee6d74045b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561c-d31a-6406-6ea8197626bf	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561c-d31a-5b99-1c279ceea9f3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561c-d31a-1f08-c7a6ea0a0d14	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561c-d31a-17b9-6fabe79f4c75	EG	EGY	818	Egypt 	Egipt	\N
00040000-561c-d31a-81ad-f1bffc6cfeeb	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561c-d31a-c5f8-968bafed2f2e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561c-d31a-348b-146c17f63f6a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561c-d31a-3061-23c177e11f40	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561c-d31a-7884-bdf59d4814ff	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561c-d31a-4453-f1d96bfc7468	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561c-d31a-47a4-0612555aab8a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561c-d31a-373a-9eebd5e2d94a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561c-d31a-4661-d6a21c58f767	FI	FIN	246	Finland 	Finska	\N
00040000-561c-d31a-968f-a3827a58a8ed	FR	FRA	250	France 	Francija	\N
00040000-561c-d31a-7198-336038248e9b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561c-d31a-0373-448cfa6a4c13	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561c-d31a-726c-bea36ca0bd5d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561c-d31a-7bb2-a01dbafd5fc1	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561c-d31a-6611-1be26734ee44	GA	GAB	266	Gabon 	Gabon	\N
00040000-561c-d31a-1c19-b9f67dfa454a	GM	GMB	270	Gambia 	Gambija	\N
00040000-561c-d31a-a484-bcc3def9b192	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561c-d31a-8055-42f9c497ea08	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561c-d31a-96bb-f0d7191c2b16	GH	GHA	288	Ghana 	Gana	\N
00040000-561c-d31a-6145-72ce7eaa8b81	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561c-d31a-4bc5-b331a3ad0e1d	GR	GRC	300	Greece 	Grčija	\N
00040000-561c-d31a-e4bd-eee447ad723a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561c-d31a-ce64-04eceedf0f91	GD	GRD	308	Grenada 	Grenada	\N
00040000-561c-d31a-1367-47e9d474f498	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561c-d31a-0b2b-9783139e4dcd	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561c-d31a-06a9-9e0a76d0e1f6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561c-d31a-3a1d-b8cbca4f955e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561c-d31a-29da-bb5ae641fac6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561c-d31a-6759-8a74e41b42ff	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561c-d31a-b1c5-b264d11fb350	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561c-d31a-f4f6-2d92b2dfbbb4	HT	HTI	332	Haiti 	Haiti	\N
00040000-561c-d31a-af10-ab6bb7ac6a25	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561c-d31a-1bc5-ef04d9516f0d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561c-d31a-dc77-dfadf51265f6	HN	HND	340	Honduras 	Honduras	\N
00040000-561c-d31a-1041-960544653e72	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561c-d31a-6d73-667bcf64dc28	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561c-d31a-0571-ac9c2c845181	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561c-d31a-daa0-32fbdf1e44e7	IN	IND	356	India 	Indija	\N
00040000-561c-d31a-1133-ece871ba2158	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561c-d31a-7459-090cddb5ee52	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561c-d31a-9129-edbb262879a0	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561c-d31a-06e5-207967c04cf4	IE	IRL	372	Ireland 	Irska	\N
00040000-561c-d31a-f54d-f16dcf1498be	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561c-d31a-f947-2ede1804f0b3	IL	ISR	376	Israel 	Izrael	\N
00040000-561c-d31a-827f-d340958c9916	IT	ITA	380	Italy 	Italija	\N
00040000-561c-d31a-d8fa-ad74828bc8fd	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561c-d31a-9b9e-cdc8ebd4d9d4	JP	JPN	392	Japan 	Japonska	\N
00040000-561c-d31a-2d7b-b1b9e158b1ef	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561c-d31a-72e5-de28448b4237	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561c-d31a-7698-eb6e8fb5b711	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561c-d31a-d491-c9e425a3f1c6	KE	KEN	404	Kenya 	Kenija	\N
00040000-561c-d31a-5f2c-832ca3b56381	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561c-d31a-282f-c26a6fbb3256	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561c-d31a-c871-67d6b6299f12	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561c-d31a-7f96-37755e6f2b51	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561c-d31a-c9d4-8dc1873041d7	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561c-d31a-781a-1107ab213bd6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561c-d31a-c48f-132c37d18324	LV	LVA	428	Latvia 	Latvija	\N
00040000-561c-d31a-7e43-25aea2205f5d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561c-d31a-4c56-82056490e809	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561c-d31a-761f-87597f442e03	LR	LBR	430	Liberia 	Liberija	\N
00040000-561c-d31a-dfac-1de726e6779d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561c-d31a-5fa1-02177827b3b4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561c-d31a-87ff-0ed3ac184123	LT	LTU	440	Lithuania 	Litva	\N
00040000-561c-d31a-e91b-f3cea819e30e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561c-d31a-25d5-5213fc2e80e7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561c-d31a-4f89-ab9813e279d4	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561c-d31a-2f24-daa4d8658101	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561c-d31a-c138-40c37c2c2989	MW	MWI	454	Malawi 	Malavi	\N
00040000-561c-d31a-63f2-3662eaed9630	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561c-d31a-b0ae-f5847a5500f5	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561c-d31a-d0e7-52b7d4a29f21	ML	MLI	466	Mali 	Mali	\N
00040000-561c-d31a-afbc-a08252ea9077	MT	MLT	470	Malta 	Malta	\N
00040000-561c-d31a-adc8-0b3aa5cfde2f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561c-d31a-9819-264ebecb6ea5	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561c-d31a-9a2c-589362d88795	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561c-d31a-fa03-c0e9a7b0a2a8	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561c-d31a-ecda-af2d7c81813c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561c-d31a-c45a-73b8672a3db5	MX	MEX	484	Mexico 	Mehika	\N
00040000-561c-d31a-e1b7-a5fdff262ac2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561c-d31a-d65a-15c89063a904	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561c-d31a-5aaa-7effb43108e2	MC	MCO	492	Monaco 	Monako	\N
00040000-561c-d31a-d1d8-e5a05c9e4a51	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561c-d31a-129c-ee4892afaab4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561c-d31a-d78e-91df2b69b6d1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561c-d31a-7223-4eebd30dbccd	MA	MAR	504	Morocco 	Maroko	\N
00040000-561c-d31a-cf2c-d80f469bbf45	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561c-d31a-e0e1-ce07a4444e90	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561c-d31a-6491-b1ec7f444453	NA	NAM	516	Namibia 	Namibija	\N
00040000-561c-d31a-9910-e42140a73721	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561c-d31a-07c0-7da79422175c	NP	NPL	524	Nepal 	Nepal	\N
00040000-561c-d31a-0f98-7b0ce6b45466	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561c-d31a-a625-cfb6a745d490	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561c-d31a-e738-2e3438f69dac	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561c-d31a-f182-5ec9370934be	NE	NER	562	Niger 	Niger 	\N
00040000-561c-d31a-3f62-d587e5386bf8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561c-d31a-8648-14b9b3ae5702	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561c-d31a-a11b-176e703c9230	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561c-d31a-54ac-7079bf537b0c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561c-d31a-04b9-a31f5972a4fb	NO	NOR	578	Norway 	Norveška	\N
00040000-561c-d31a-e3f8-4a1361305f25	OM	OMN	512	Oman 	Oman	\N
00040000-561c-d31a-6b32-db0ccaedfed2	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561c-d31a-e490-2d7c8799d47e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561c-d31a-81de-4181ee41fea1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561c-d31a-e499-f1696014abbe	PA	PAN	591	Panama 	Panama	\N
00040000-561c-d31a-394f-006a9fc0cd81	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561c-d31a-6070-e100e6dc6fff	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561c-d31a-ee84-d45cebfdc306	PE	PER	604	Peru 	Peru	\N
00040000-561c-d31a-dd55-fe54f0e1e584	PH	PHL	608	Philippines 	Filipini	\N
00040000-561c-d31a-c847-fd017c0d6d69	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561c-d31a-e061-bd26255f787c	PL	POL	616	Poland 	Poljska	\N
00040000-561c-d31a-1eea-1995f974f9f8	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561c-d31a-b965-a143e0823b96	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561c-d31a-829f-5913a67217ac	QA	QAT	634	Qatar 	Katar	\N
00040000-561c-d31a-6aea-8ea834519abf	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561c-d31a-e7ad-48481099b5d1	RO	ROU	642	Romania 	Romunija	\N
00040000-561c-d31a-aec7-63c952b055e6	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561c-d31a-bcdd-6961427d10fe	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561c-d31a-3e8f-3f6df5395bbb	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561c-d31a-bea0-d14aa654f806	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561c-d31a-36c7-8758e4ec1a79	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561c-d31a-8c62-4fd9b13b61ec	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561c-d31a-bd46-b647ef43dc97	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561c-d31a-2937-bec01178665d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561c-d31a-55a4-8fa875d97cbb	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561c-d31a-96e9-d7899f05f1b9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561c-d31a-5059-3e26a34eeef3	SM	SMR	674	San Marino 	San Marino	\N
00040000-561c-d31a-d759-e7bcd0149fe7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561c-d31a-4e85-9e35a8321545	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561c-d31a-a50d-78f5029ff00a	SN	SEN	686	Senegal 	Senegal	\N
00040000-561c-d31a-8bb8-92a519dd3ac9	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561c-d31a-0594-0c58fd3df56f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561c-d31a-5f49-2c227fac50ad	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561c-d31a-9570-7ef9373913f2	SG	SGP	702	Singapore 	Singapur	\N
00040000-561c-d31a-b9ad-8c78059168e5	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561c-d31a-d720-6433f73272a5	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561c-d31a-60e1-9d5d5ac2dd19	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561c-d31a-f5c0-8d302e9f178e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561c-d31a-cfbf-efd283e405d7	SO	SOM	706	Somalia 	Somalija	\N
00040000-561c-d31a-d29d-475157da8b7c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561c-d31a-569d-d19dc28a559f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561c-d31a-beec-420d2d03d26f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561c-d31a-5f99-65a87d71b360	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561c-d31a-aecf-d963e5953a0e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561c-d31a-d676-e820dcb35cb6	SD	SDN	729	Sudan 	Sudan	\N
00040000-561c-d31a-dbca-1d01ef19f3b7	SR	SUR	740	Suriname 	Surinam	\N
00040000-561c-d31a-6441-542ff6d606d6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561c-d31a-2c06-e61288966d18	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561c-d31a-73c0-b64cd582df26	SE	SWE	752	Sweden 	Švedska	\N
00040000-561c-d31a-3221-9b7c17ff34c5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561c-d31a-8fb6-f5ebf356fb7a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561c-d31a-a521-cfabadeac5aa	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561c-d31a-52f6-f17a509019b1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561c-d31a-45c5-9bccd096ca89	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561c-d31a-b17f-d95d5019ed4e	TH	THA	764	Thailand 	Tajska	\N
00040000-561c-d31a-af96-f92c3be51b02	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561c-d31a-385c-c4c9b2d672d5	TG	TGO	768	Togo 	Togo	\N
00040000-561c-d31a-20ea-7cd79ded7446	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561c-d31a-b48b-1282c7d367ff	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561c-d31a-e1d9-76a811b0711b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561c-d31a-dc8c-f7f5eefd0db6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561c-d31a-9dfa-0d726039e748	TR	TUR	792	Turkey 	Turčija	\N
00040000-561c-d31a-00ff-ed620715e70c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561c-d31a-4c5c-255ae65ee2e7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561c-d31a-21bf-95b4c736d736	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561c-d31a-e10d-d05615e4cd74	UG	UGA	800	Uganda 	Uganda	\N
00040000-561c-d31a-e00c-29739118642a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561c-d31a-4e2c-2d64e671cf3a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561c-d31a-7268-d13fc9fb4d0e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561c-d31a-8104-0135c81efb85	US	USA	840	United States 	Združene države Amerike	\N
00040000-561c-d31a-2321-bd8ef519e653	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561c-d31a-c4eb-23e5cee7cdbe	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561c-d31a-bea6-d1b82ed4894a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561c-d31a-78df-c3ccc97149be	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561c-d31a-917d-0d8ac2057c31	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561c-d31a-90ff-e303ed7d08d1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561c-d31a-8cce-858fb5c47ee3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561c-d31a-9b66-b649b4733ff6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561c-d31a-bc33-cd4508c91c6b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561c-d31a-f2a9-1eb1f642b701	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561c-d31a-eb4a-a6d77dd5b124	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561c-d31a-ad9f-3eb72aabb8b8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561c-d31a-a9c7-5cb24a33efb4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3055 (class 0 OID 21746926)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561c-d31c-8464-33f648f7fb59	000e0000-561c-d31c-8379-1d9bb287952b	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561c-d31a-e54d-3eb720cb614b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561c-d31c-7306-eaa169075ed6	000e0000-561c-d31c-e71d-8ab2c59c2449	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561c-d31a-7fa3-c784c16cd71f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561c-d31d-3750-c62e344d7338	000e0000-561c-d31c-8f5a-ac40c3a0b5b5	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561c-d31a-e54d-3eb720cb614b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561c-d31d-127b-b8ceba255f52	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561c-d31d-a7eb-619cd1dff971	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 21746728)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561c-d31c-f281-2ff0cf0ac321	000e0000-561c-d31c-e71d-8ab2c59c2449	000c0000-561c-d31d-8dc3-b6d27ee10f2a	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561c-d31a-57af-f3a744df2f1d
000d0000-561c-d31c-639f-30c5b95a542b	000e0000-561c-d31c-e71d-8ab2c59c2449	000c0000-561c-d31d-2357-1ee520083bc5	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561c-d31a-ff50-5e3532a15d32
000d0000-561c-d31c-33b4-3fa624115e72	000e0000-561c-d31c-e71d-8ab2c59c2449	000c0000-561c-d31d-b88d-9dc1c9ec1e36	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561c-d31a-49b5-c7caa355e7a0
000d0000-561c-d31c-72c5-0c8177776e99	000e0000-561c-d31c-e71d-8ab2c59c2449	000c0000-561c-d31d-af64-c6b11082d747	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561c-d31a-ed59-343b32422085
000d0000-561c-d31c-c497-0413cccae81d	000e0000-561c-d31c-e71d-8ab2c59c2449	000c0000-561c-d31d-c825-c62503ac7c5b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561c-d31a-ed59-343b32422085
000d0000-561c-d31c-bfd1-7a36c598be3f	000e0000-561c-d31c-e71d-8ab2c59c2449	000c0000-561c-d31d-5a4c-1acd1938c9e1	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561c-d31a-57af-f3a744df2f1d
000d0000-561c-d31c-579c-7e85c605122a	000e0000-561c-d31c-e71d-8ab2c59c2449	000c0000-561c-d31d-11c5-5b35412ef1c7	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561c-d31a-57af-f3a744df2f1d
000d0000-561c-d31c-6ac4-4849e25c38e8	000e0000-561c-d31c-e71d-8ab2c59c2449	000c0000-561c-d31d-d210-b4409883b0c6	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561c-d31a-93d9-ed2056066675
000d0000-561c-d31c-9d33-1c078016a757	000e0000-561c-d31c-e71d-8ab2c59c2449	000c0000-561c-d31d-04bb-811ec0caacf5	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561c-d31a-3ef8-7a1f84857f15
\.


--
-- TOC entry 3020 (class 0 OID 21746543)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21746517)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 21746494)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561c-d31c-53be-f6461161d37c	00080000-561c-d31c-825c-0809227a8057	00090000-561c-d31c-d7a9-6a5d8b0e6ba0	AK		igralka
\.


--
-- TOC entry 3029 (class 0 OID 21746642)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 21747165)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 21747177)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 21747199)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 21729914)
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
\.


--
-- TOC entry 3033 (class 0 OID 21746667)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21746451)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561c-d31b-3339-1af3bf10a0a9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561c-d31b-5c3f-52218f769ee4	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561c-d31b-818d-e841aa4d64ed	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561c-d31b-235a-7cdd7f6d1e0b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561c-d31b-555f-c9d100477ab2	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561c-d31b-9184-7c1853eacc49	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561c-d31b-5557-0e53c7fae6cd	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561c-d31b-e5fb-ef463b1f6d1a	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561c-d31b-c18b-d6371c4f11b7	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561c-d31b-ae43-31a46d729e05	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561c-d31b-c08e-87f877bdab3c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561c-d31b-e1c4-b9ee321a959c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561c-d31b-c86f-7e5aa29f877e	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561c-d31b-91a7-df290e3d819d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561c-d31b-d8a4-6c992ca02eaf	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561c-d31c-367a-fae90de167b9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561c-d31c-fcbc-08c2adbf6667	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561c-d31c-3689-79412c415365	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561c-d31c-3644-33171273bbad	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561c-d31c-51a9-761580f1e7aa	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561c-d31e-11e5-5d4861450e2e	application.tenant.maticnopodjetje	string	s:36:"00080000-561c-d31e-4227-4adbe7fef0f9";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3007 (class 0 OID 21746365)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561c-d31c-69a7-378dec9e8120	00000000-561c-d31c-367a-fae90de167b9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561c-d31c-9eed-3405cb41636d	00000000-561c-d31c-367a-fae90de167b9	00010000-561c-d31b-8170-e63371654c62	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561c-d31c-b10e-92263629e250	00000000-561c-d31c-fcbc-08c2adbf6667	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3008 (class 0 OID 21746376)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561c-d31c-79e2-ef281fb24ad1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561c-d31c-13c0-9082c9dbf8c5	00010000-561c-d31c-bba8-6af1a69d6e19	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561c-d31c-12e3-230fc8f082c7	00010000-561c-d31c-c4b1-0236b5fd13eb	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561c-d31c-6fe8-b9382622d13c	00010000-561c-d31c-4d1a-e2c1eb9681dd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561c-d31c-5cd9-dbfcf3db5e2e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561c-d31c-58c9-5886da0baf38	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561c-d31c-1dbd-620a899b677b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561c-d31c-28d4-90b2e46ad5a4	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561c-d31c-d7a9-6a5d8b0e6ba0	00010000-561c-d31c-71f3-f8edafb8ea07	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561c-d31c-8f91-516b40b1eb0b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561c-d31c-2de3-fd760a12a7d8	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561c-d31c-88f6-3281709c94de	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561c-d31c-7277-e01a8a6e76c0	00010000-561c-d31c-066e-24e08d4de37a	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561c-d31c-c651-f701d23eb008	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561c-d31c-1d98-b82c48e543cc	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561c-d31c-b5ca-73ea1683b712	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561c-d31c-bd9d-4d7593714de3	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561c-d31c-ea34-b970b1214f64	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3003 (class 0 OID 21746330)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561c-d31a-79fc-9dde8c93483e	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561c-d31a-f81b-27227f2d3b4e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561c-d31a-5a48-72b19d9867d3	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561c-d31a-180e-0afec7df15b8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561c-d31a-4f89-e3584479e861	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561c-d31a-301c-5bb7a3d0f15c	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561c-d31a-e926-cc16af33eee4	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561c-d31a-5d79-43b2aa62824d	Abonma-read	Abonma - branje	f
00030000-561c-d31a-a483-560a89e81b67	Abonma-write	Abonma - spreminjanje	f
00030000-561c-d31a-d45b-23471746d012	Alternacija-read	Alternacija - branje	f
00030000-561c-d31a-602a-e10617d0c75c	Alternacija-write	Alternacija - spreminjanje	f
00030000-561c-d31a-d5bd-6691166d88f5	Arhivalija-read	Arhivalija - branje	f
00030000-561c-d31a-b433-95fee38356a8	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561c-d31a-d00d-34b4be0153bf	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561c-d31a-df17-126bea8f07a6	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561c-d31a-f0ce-49488d84875d	Besedilo-read	Besedilo - branje	f
00030000-561c-d31a-2757-7ab2de7258ff	Besedilo-write	Besedilo - spreminjanje	f
00030000-561c-d31a-77a7-389ba491127f	DogodekIzven-read	DogodekIzven - branje	f
00030000-561c-d31a-a436-9435e57df291	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561c-d31a-ce1f-c1aca56290f1	Dogodek-read	Dogodek - branje	f
00030000-561c-d31a-8b49-3339c53a01cc	Dogodek-write	Dogodek - spreminjanje	f
00030000-561c-d31a-75a3-846166aba00a	DrugiVir-read	DrugiVir - branje	f
00030000-561c-d31a-9642-371a76245d6a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561c-d31a-6422-dc99566be212	Drzava-read	Drzava - branje	f
00030000-561c-d31a-a486-560e0f0801ca	Drzava-write	Drzava - spreminjanje	f
00030000-561c-d31a-65d8-dd5dc09f9d32	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561c-d31a-c45c-650a990e4580	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561c-d31a-b146-87adfaed0c5a	Funkcija-read	Funkcija - branje	f
00030000-561c-d31a-deca-72afef74b997	Funkcija-write	Funkcija - spreminjanje	f
00030000-561c-d31a-3742-d193668a2eec	Gostovanje-read	Gostovanje - branje	f
00030000-561c-d31a-9b65-b3f57b71a48b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561c-d31a-b1de-0d85297c5611	Gostujoca-read	Gostujoca - branje	f
00030000-561c-d31a-1530-39ded6e9c498	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561c-d31a-c19d-9623821bbea2	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561c-d31a-d36c-eb948b20eab6	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561c-d31a-f77f-16055e6130aa	Kupec-read	Kupec - branje	f
00030000-561c-d31a-931b-eb6202de82fc	Kupec-write	Kupec - spreminjanje	f
00030000-561c-d31a-b7c0-f8304d7ecbed	NacinPlacina-read	NacinPlacina - branje	f
00030000-561c-d31a-56da-16bf021845f1	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561c-d31a-3b16-309ef4c25f08	Option-read	Option - branje	f
00030000-561c-d31a-28cf-4e476716cc34	Option-write	Option - spreminjanje	f
00030000-561c-d31a-746e-c3f2998381d9	OptionValue-read	OptionValue - branje	f
00030000-561c-d31a-aeac-1fac3d5e8345	OptionValue-write	OptionValue - spreminjanje	f
00030000-561c-d31a-013c-de44ab585bff	Oseba-read	Oseba - branje	f
00030000-561c-d31a-7d0f-807ec521e0da	Oseba-write	Oseba - spreminjanje	f
00030000-561c-d31a-f60b-7b558b0b6844	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561c-d31a-c35b-088a05d11412	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561c-d31a-1cc5-51deb049fd4d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561c-d31a-d49a-3896bb6fad46	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561c-d31a-7293-f4d15538b74e	Pogodba-read	Pogodba - branje	f
00030000-561c-d31a-561b-fc332c6ff92b	Pogodba-write	Pogodba - spreminjanje	f
00030000-561c-d31a-9f39-3cdb169d1e52	Popa-read	Popa - branje	f
00030000-561c-d31a-d091-e3a61e6bd64f	Popa-write	Popa - spreminjanje	f
00030000-561c-d31a-553a-952a86935416	Posta-read	Posta - branje	f
00030000-561c-d31a-34e2-36511faf1bb4	Posta-write	Posta - spreminjanje	f
00030000-561c-d31a-5f12-2a2d63cc9d91	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561c-d31a-575d-477bc237e4c7	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561c-d31a-6bd4-ccace304eb45	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561c-d31a-258c-e493c2108a94	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561c-d31a-d685-e3deb2ac583d	PostniNaslov-read	PostniNaslov - branje	f
00030000-561c-d31a-850a-1b888d623ec3	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561c-d31a-4d75-5aafbb1312ab	Predstava-read	Predstava - branje	f
00030000-561c-d31a-687e-1f36cdbf0481	Predstava-write	Predstava - spreminjanje	f
00030000-561c-d31a-19ca-177fd318ddc8	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561c-d31a-a9c6-35aa2bbb57b1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561c-d31a-0c8b-1e1ffdcb0834	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561c-d31a-89c9-d1a4e6a9297f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561c-d31a-ad6d-3d590cbd7d51	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561c-d31a-7f6b-b2cec061df88	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561c-d31a-c8f8-d76cac814dee	ProgramDela-read	ProgramDela - branje	f
00030000-561c-d31a-3b80-d5f1459d2387	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561c-d31a-1081-142d5c2bd3a9	ProgramFestival-read	ProgramFestival - branje	f
00030000-561c-d31a-c524-47b4334e6d17	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561c-d31a-8d54-b3779a18a566	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561c-d31a-8d70-ec1b77bea5f3	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561c-d31a-eb97-45a01439b8bf	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561c-d31a-2887-93d28346c4f7	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561c-d31a-9a31-a2e7b35699a0	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561c-d31a-f0e9-a2b0244c3bae	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561c-d31a-61a2-dceb5e457cb0	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561c-d31a-c5e3-809eb578ed2d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561c-d31a-d840-7b0d39eed953	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561c-d31a-1d1a-b6b9a343734a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561c-d31a-00f4-4027a7e79d75	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561c-d31a-e4cb-aafc14824532	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561c-d31a-a651-52b570f9d186	ProgramRazno-read	ProgramRazno - branje	f
00030000-561c-d31a-ff76-3bb4ab900129	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561c-d31a-8ef3-fba2ecace448	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561c-d31a-f182-6cd976ba3915	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561c-d31a-89c2-d685c6401186	Prostor-read	Prostor - branje	f
00030000-561c-d31a-7ad2-bb17a4c88bb6	Prostor-write	Prostor - spreminjanje	f
00030000-561c-d31a-337c-c99203bec1d0	Racun-read	Racun - branje	f
00030000-561c-d31a-0a58-5e53c1c50adc	Racun-write	Racun - spreminjanje	f
00030000-561c-d31a-16cf-3bc1d452b513	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561c-d31a-12cd-15d9258861c1	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561c-d31a-d814-f82a47f19605	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561c-d31a-765a-4f5439ff7c57	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561c-d31a-a340-68a3bcd77b55	Rekvizit-read	Rekvizit - branje	f
00030000-561c-d31a-cff6-ed90aa30b546	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561c-d31a-e067-2d50e1569d2f	Revizija-read	Revizija - branje	f
00030000-561c-d31a-2e7c-32b37acf741b	Revizija-write	Revizija - spreminjanje	f
00030000-561c-d31a-dffd-2f9832a8941d	Rezervacija-read	Rezervacija - branje	f
00030000-561c-d31a-691e-ea6802cad3b3	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561c-d31a-ad39-5c42b7c20955	SedezniRed-read	SedezniRed - branje	f
00030000-561c-d31a-cd10-54d835b207c4	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561c-d31a-3b07-15a7800b73b6	Sedez-read	Sedez - branje	f
00030000-561c-d31a-abce-fe603bfece2f	Sedez-write	Sedez - spreminjanje	f
00030000-561c-d31a-784a-da5933bbeb30	Sezona-read	Sezona - branje	f
00030000-561c-d31a-80cf-b3eb6a659385	Sezona-write	Sezona - spreminjanje	f
00030000-561c-d31a-437b-36bfd471ef42	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561c-d31a-d987-d16038596ca8	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561c-d31a-290b-6ca096ccef73	Stevilcenje-read	Stevilcenje - branje	f
00030000-561c-d31a-62d5-9a154e2fe27c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561c-d31a-30b8-eb4690906647	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561c-d31a-b80a-7fab14049fec	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561c-d31a-5ef5-74d005a0bbfb	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561c-d31a-aabe-05ab084b8870	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561c-d31a-0ea2-9f5252f24c7a	Telefonska-read	Telefonska - branje	f
00030000-561c-d31a-c232-e9fd4eb7fd0c	Telefonska-write	Telefonska - spreminjanje	f
00030000-561c-d31a-5203-d1586ac114db	TerminStoritve-read	TerminStoritve - branje	f
00030000-561c-d31a-32fd-75fb3daeb3ae	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561c-d31a-74f1-4fe62ab8ad37	TipFunkcije-read	TipFunkcije - branje	f
00030000-561c-d31a-5c9d-b297eb0b0990	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561c-d31a-4f5b-cd7626a26dd4	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561c-d31a-121e-f84054308210	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561c-d31a-269f-80b05d3b4586	Trr-read	Trr - branje	f
00030000-561c-d31a-df1b-94e0a11b6ed4	Trr-write	Trr - spreminjanje	f
00030000-561c-d31a-6a50-a181f634eeb6	Uprizoritev-read	Uprizoritev - branje	f
00030000-561c-d31a-35ef-c97a8654f1ad	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561c-d31a-2eaa-b3a6a7402736	Vaja-read	Vaja - branje	f
00030000-561c-d31a-e8c4-23de0f6eafac	Vaja-write	Vaja - spreminjanje	f
00030000-561c-d31a-ebdc-7c32ab611308	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561c-d31a-535c-e24c0ff2ba59	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561c-d31a-55b0-c4462139fbe8	VrstaStroska-read	VrstaStroska - branje	f
00030000-561c-d31a-40b2-e8052635bd66	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561c-d31a-8bf0-be333226ac5e	Zaposlitev-read	Zaposlitev - branje	f
00030000-561c-d31a-15ba-3653dc92f076	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561c-d31a-9c98-b119ee3d7e29	Zasedenost-read	Zasedenost - branje	f
00030000-561c-d31a-a10f-02f0b7087000	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561c-d31a-f80b-ef231c2ec98f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561c-d31a-f52c-c397e0456076	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561c-d31a-67ae-ecdd4641092a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561c-d31a-27c0-28f1c07020ae	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561c-d31a-2587-fe3b6715b8ab	Job-read	Branje opravil - samo zase - branje	f
00030000-561c-d31a-19b3-5ef9b5f7f143	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561c-d31a-a87b-2691c2988169	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561c-d31a-429f-9d42ee16e630	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561c-d31a-3086-92a5fda14cd2	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561c-d31a-a88f-57e8d7e07a4e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561c-d31a-ef8e-0419bae8c0f1	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561c-d31a-75ea-7a7e5d1017a5	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561c-d31a-c758-c3affd53d6ba	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561c-d31a-1f1d-69343c9115c3	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561c-d31a-fa64-509dde19ec1c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561c-d31a-7989-5e8592e742f4	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561c-d31a-06d9-1090f976cba9	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561c-d31a-cce9-c6d08b26a259	Datoteka-write	Datoteka - spreminjanje	f
00030000-561c-d31a-d754-e8d42202ead8	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3005 (class 0 OID 21746349)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561c-d31a-78e0-a17f6ff7999a	00030000-561c-d31a-f81b-27227f2d3b4e
00020000-561c-d31a-0856-6125a7a7c436	00030000-561c-d31a-6422-dc99566be212
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-5d79-43b2aa62824d
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-a483-560a89e81b67
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-d45b-23471746d012
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-602a-e10617d0c75c
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-d5bd-6691166d88f5
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-ce1f-c1aca56290f1
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-180e-0afec7df15b8
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-8b49-3339c53a01cc
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-6422-dc99566be212
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-a486-560e0f0801ca
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-b146-87adfaed0c5a
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-deca-72afef74b997
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-3742-d193668a2eec
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-9b65-b3f57b71a48b
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-b1de-0d85297c5611
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-1530-39ded6e9c498
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-c19d-9623821bbea2
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-d36c-eb948b20eab6
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-3b16-309ef4c25f08
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-746e-c3f2998381d9
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-013c-de44ab585bff
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-7d0f-807ec521e0da
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-9f39-3cdb169d1e52
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-d091-e3a61e6bd64f
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-553a-952a86935416
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-34e2-36511faf1bb4
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-d685-e3deb2ac583d
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-850a-1b888d623ec3
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-4d75-5aafbb1312ab
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-687e-1f36cdbf0481
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-ad6d-3d590cbd7d51
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-7f6b-b2cec061df88
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-89c2-d685c6401186
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-7ad2-bb17a4c88bb6
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-d814-f82a47f19605
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-765a-4f5439ff7c57
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-a340-68a3bcd77b55
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-cff6-ed90aa30b546
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-784a-da5933bbeb30
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-80cf-b3eb6a659385
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-74f1-4fe62ab8ad37
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-6a50-a181f634eeb6
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-35ef-c97a8654f1ad
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-2eaa-b3a6a7402736
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-e8c4-23de0f6eafac
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-9c98-b119ee3d7e29
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-a10f-02f0b7087000
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-f80b-ef231c2ec98f
00020000-561c-d31b-7581-fe5d137c8d07	00030000-561c-d31a-67ae-ecdd4641092a
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-5d79-43b2aa62824d
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-d5bd-6691166d88f5
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-ce1f-c1aca56290f1
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-6422-dc99566be212
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-3742-d193668a2eec
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-b1de-0d85297c5611
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-c19d-9623821bbea2
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-d36c-eb948b20eab6
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-3b16-309ef4c25f08
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-746e-c3f2998381d9
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-013c-de44ab585bff
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-7d0f-807ec521e0da
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-9f39-3cdb169d1e52
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-553a-952a86935416
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-d685-e3deb2ac583d
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-850a-1b888d623ec3
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-4d75-5aafbb1312ab
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-89c2-d685c6401186
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-d814-f82a47f19605
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-a340-68a3bcd77b55
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-784a-da5933bbeb30
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-0ea2-9f5252f24c7a
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-c232-e9fd4eb7fd0c
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-269f-80b05d3b4586
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-df1b-94e0a11b6ed4
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-8bf0-be333226ac5e
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-15ba-3653dc92f076
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-f80b-ef231c2ec98f
00020000-561c-d31b-bbd7-01881d5fc5be	00030000-561c-d31a-67ae-ecdd4641092a
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-5d79-43b2aa62824d
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-d45b-23471746d012
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-d5bd-6691166d88f5
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-b433-95fee38356a8
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-f0ce-49488d84875d
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-77a7-389ba491127f
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-ce1f-c1aca56290f1
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-6422-dc99566be212
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-b146-87adfaed0c5a
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-3742-d193668a2eec
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-b1de-0d85297c5611
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-c19d-9623821bbea2
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-3b16-309ef4c25f08
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-746e-c3f2998381d9
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-013c-de44ab585bff
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-9f39-3cdb169d1e52
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-553a-952a86935416
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-4d75-5aafbb1312ab
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-ad6d-3d590cbd7d51
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-89c2-d685c6401186
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-d814-f82a47f19605
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-a340-68a3bcd77b55
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-784a-da5933bbeb30
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-74f1-4fe62ab8ad37
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-2eaa-b3a6a7402736
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-9c98-b119ee3d7e29
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-f80b-ef231c2ec98f
00020000-561c-d31b-1816-9bfa5ea22622	00030000-561c-d31a-67ae-ecdd4641092a
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-5d79-43b2aa62824d
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-a483-560a89e81b67
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-602a-e10617d0c75c
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-d5bd-6691166d88f5
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-ce1f-c1aca56290f1
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-6422-dc99566be212
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-3742-d193668a2eec
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-b1de-0d85297c5611
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-3b16-309ef4c25f08
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-746e-c3f2998381d9
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-9f39-3cdb169d1e52
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-553a-952a86935416
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-4d75-5aafbb1312ab
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-89c2-d685c6401186
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-d814-f82a47f19605
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-a340-68a3bcd77b55
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-784a-da5933bbeb30
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-74f1-4fe62ab8ad37
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-f80b-ef231c2ec98f
00020000-561c-d31b-906f-0ab765904fe6	00030000-561c-d31a-67ae-ecdd4641092a
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-5d79-43b2aa62824d
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-d5bd-6691166d88f5
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-ce1f-c1aca56290f1
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-6422-dc99566be212
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-3742-d193668a2eec
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-b1de-0d85297c5611
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-3b16-309ef4c25f08
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-746e-c3f2998381d9
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-9f39-3cdb169d1e52
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-553a-952a86935416
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-4d75-5aafbb1312ab
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-89c2-d685c6401186
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-d814-f82a47f19605
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-a340-68a3bcd77b55
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-784a-da5933bbeb30
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-5203-d1586ac114db
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-5a48-72b19d9867d3
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-74f1-4fe62ab8ad37
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-f80b-ef231c2ec98f
00020000-561c-d31b-3630-679b4081876f	00030000-561c-d31a-67ae-ecdd4641092a
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-79fc-9dde8c93483e
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-f81b-27227f2d3b4e
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-5a48-72b19d9867d3
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-180e-0afec7df15b8
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-4f89-e3584479e861
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-301c-5bb7a3d0f15c
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-e926-cc16af33eee4
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-5d79-43b2aa62824d
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-a483-560a89e81b67
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-d45b-23471746d012
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-602a-e10617d0c75c
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-d5bd-6691166d88f5
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-b433-95fee38356a8
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-f0ce-49488d84875d
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-2757-7ab2de7258ff
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-77a7-389ba491127f
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-a436-9435e57df291
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-ce1f-c1aca56290f1
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-8b49-3339c53a01cc
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-6422-dc99566be212
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-a486-560e0f0801ca
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-75a3-846166aba00a
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-9642-371a76245d6a
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-65d8-dd5dc09f9d32
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-c45c-650a990e4580
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-b146-87adfaed0c5a
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-deca-72afef74b997
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-3742-d193668a2eec
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-9b65-b3f57b71a48b
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-b1de-0d85297c5611
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-1530-39ded6e9c498
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-c19d-9623821bbea2
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-d36c-eb948b20eab6
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-f77f-16055e6130aa
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-931b-eb6202de82fc
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-b7c0-f8304d7ecbed
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-56da-16bf021845f1
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-3b16-309ef4c25f08
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-28cf-4e476716cc34
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-746e-c3f2998381d9
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-aeac-1fac3d5e8345
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-013c-de44ab585bff
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-7d0f-807ec521e0da
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-f60b-7b558b0b6844
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-c35b-088a05d11412
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-1cc5-51deb049fd4d
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-d49a-3896bb6fad46
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-7293-f4d15538b74e
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-561b-fc332c6ff92b
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-9f39-3cdb169d1e52
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-d091-e3a61e6bd64f
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-553a-952a86935416
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-34e2-36511faf1bb4
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-5f12-2a2d63cc9d91
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-575d-477bc237e4c7
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-6bd4-ccace304eb45
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-258c-e493c2108a94
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-d685-e3deb2ac583d
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-850a-1b888d623ec3
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-4d75-5aafbb1312ab
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-687e-1f36cdbf0481
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-19ca-177fd318ddc8
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-a9c6-35aa2bbb57b1
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-0c8b-1e1ffdcb0834
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-89c9-d1a4e6a9297f
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-ad6d-3d590cbd7d51
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-7f6b-b2cec061df88
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-c8f8-d76cac814dee
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-3b80-d5f1459d2387
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-1081-142d5c2bd3a9
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-c524-47b4334e6d17
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-8d54-b3779a18a566
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-8d70-ec1b77bea5f3
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-eb97-45a01439b8bf
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-2887-93d28346c4f7
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-9a31-a2e7b35699a0
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-f0e9-a2b0244c3bae
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-61a2-dceb5e457cb0
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-c5e3-809eb578ed2d
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-d840-7b0d39eed953
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-1d1a-b6b9a343734a
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-00f4-4027a7e79d75
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-e4cb-aafc14824532
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-a651-52b570f9d186
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-ff76-3bb4ab900129
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-8ef3-fba2ecace448
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-f182-6cd976ba3915
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-89c2-d685c6401186
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-7ad2-bb17a4c88bb6
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-337c-c99203bec1d0
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-0a58-5e53c1c50adc
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-16cf-3bc1d452b513
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-12cd-15d9258861c1
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-d814-f82a47f19605
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-765a-4f5439ff7c57
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-a340-68a3bcd77b55
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-cff6-ed90aa30b546
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-e067-2d50e1569d2f
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-2e7c-32b37acf741b
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-dffd-2f9832a8941d
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-691e-ea6802cad3b3
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-ad39-5c42b7c20955
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-cd10-54d835b207c4
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-3b07-15a7800b73b6
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-abce-fe603bfece2f
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-784a-da5933bbeb30
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-80cf-b3eb6a659385
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-437b-36bfd471ef42
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-d987-d16038596ca8
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-290b-6ca096ccef73
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-62d5-9a154e2fe27c
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-30b8-eb4690906647
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-b80a-7fab14049fec
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-5ef5-74d005a0bbfb
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-aabe-05ab084b8870
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-0ea2-9f5252f24c7a
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-c232-e9fd4eb7fd0c
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-5203-d1586ac114db
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-32fd-75fb3daeb3ae
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-74f1-4fe62ab8ad37
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-5c9d-b297eb0b0990
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-4f5b-cd7626a26dd4
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-121e-f84054308210
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-269f-80b05d3b4586
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-df1b-94e0a11b6ed4
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-6a50-a181f634eeb6
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-35ef-c97a8654f1ad
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-2eaa-b3a6a7402736
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-e8c4-23de0f6eafac
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-ebdc-7c32ab611308
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-535c-e24c0ff2ba59
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-55b0-c4462139fbe8
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-40b2-e8052635bd66
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-8bf0-be333226ac5e
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-15ba-3653dc92f076
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-9c98-b119ee3d7e29
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-a10f-02f0b7087000
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-f80b-ef231c2ec98f
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-f52c-c397e0456076
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-67ae-ecdd4641092a
00020000-561c-d31c-d560-d87aa80a49da	00030000-561c-d31a-27c0-28f1c07020ae
\.


--
-- TOC entry 3034 (class 0 OID 21746674)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21746708)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 21746844)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561c-d31c-25ab-5e181d28dfb0	00090000-561c-d31c-79e2-ef281fb24ad1	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561c-d31c-b69b-ce00befef011	00090000-561c-d31c-58c9-5886da0baf38	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561c-d31c-eb17-9973b97967b9	00090000-561c-d31c-7277-e01a8a6e76c0	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561c-d31c-5703-c37e11e4b73a	00090000-561c-d31c-8f91-516b40b1eb0b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3010 (class 0 OID 21746409)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561c-d31c-825c-0809227a8057	00040000-561c-d31a-60e1-9d5d5ac2dd19	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-d31c-014c-c942a2e6909e	00040000-561c-d31a-60e1-9d5d5ac2dd19	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561c-d31c-af56-dcc3b75f9308	00040000-561c-d31a-60e1-9d5d5ac2dd19	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-d31c-d927-e0b9977f71b6	00040000-561c-d31a-60e1-9d5d5ac2dd19	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-d31c-0a36-a7e1a845e095	00040000-561c-d31a-60e1-9d5d5ac2dd19	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-d31c-f6db-a3386527649d	00040000-561c-d31a-cada-af52d29384d1	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-d31c-9b75-3bab32f69bca	00040000-561c-d31a-69aa-988ddccc1c2e	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-d31c-16f9-a850db064a55	00040000-561c-d31a-fc8d-66a6c383df38	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-d31c-cd72-3ad7b8771f1a	00040000-561c-d31a-8055-42f9c497ea08	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-d31e-4227-4adbe7fef0f9	00040000-561c-d31a-60e1-9d5d5ac2dd19	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3012 (class 0 OID 21746443)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561c-d31a-fdd5-f45eee0844b1	8341	Adlešiči
00050000-561c-d31a-c384-9ef78f2af05b	5270	Ajdovščina
00050000-561c-d31a-b62d-4e4255c28fbb	6280	Ankaran/Ancarano
00050000-561c-d31a-f31a-abb6f593d419	9253	Apače
00050000-561c-d31a-aa4e-82c6b7245e10	8253	Artiče
00050000-561c-d31a-a3cb-a67e99bac437	4275	Begunje na Gorenjskem
00050000-561c-d31a-9f79-a04c91955c39	1382	Begunje pri Cerknici
00050000-561c-d31a-3448-bb5e1b2e808c	9231	Beltinci
00050000-561c-d31a-2898-4462056067b4	2234	Benedikt
00050000-561c-d31a-abf0-278646ddfe77	2345	Bistrica ob Dravi
00050000-561c-d31a-0a22-b8624f22db06	3256	Bistrica ob Sotli
00050000-561c-d31a-3ca3-040e594eb183	8259	Bizeljsko
00050000-561c-d31a-3213-17b8583dc089	1223	Blagovica
00050000-561c-d31a-7d5f-632779e10c33	8283	Blanca
00050000-561c-d31a-9423-20181560345f	4260	Bled
00050000-561c-d31a-db48-96e4501283b3	4273	Blejska Dobrava
00050000-561c-d31a-7159-38fc260c0ec0	9265	Bodonci
00050000-561c-d31a-8148-3f69b586bcbe	9222	Bogojina
00050000-561c-d31a-a9c8-f13119d0aaa0	4263	Bohinjska Bela
00050000-561c-d31a-0103-5c7991408a91	4264	Bohinjska Bistrica
00050000-561c-d31a-0088-be9aafd15f78	4265	Bohinjsko jezero
00050000-561c-d31a-bdc9-f9f204e0d3ca	1353	Borovnica
00050000-561c-d31a-9480-ca6100ca6942	8294	Boštanj
00050000-561c-d31a-429b-7d2ec8ace209	5230	Bovec
00050000-561c-d31a-bf4f-be7db9a9cf09	5295	Branik
00050000-561c-d31a-1d28-c23025035d48	3314	Braslovče
00050000-561c-d31a-582a-e7a658d08986	5223	Breginj
00050000-561c-d31a-2300-2191bebb0739	8280	Brestanica
00050000-561c-d31a-995b-b3d1d31c5244	2354	Bresternica
00050000-561c-d31a-5fc4-f93836d2daca	4243	Brezje
00050000-561c-d31a-6ed0-4dd1ed1a96eb	1351	Brezovica pri Ljubljani
00050000-561c-d31a-a029-ad72af07a2d6	8250	Brežice
00050000-561c-d31a-4088-d9fdc4ce0624	4210	Brnik - Aerodrom
00050000-561c-d31a-257a-c7680bf9d6d1	8321	Brusnice
00050000-561c-d31a-8f4e-30c047f5c1f2	3255	Buče
00050000-561c-d31a-6ad5-a738e706edc9	8276	Bučka 
00050000-561c-d31a-8fe9-63a512710a2f	9261	Cankova
00050000-561c-d31a-757b-d568bd7dd216	3000	Celje 
00050000-561c-d31a-f6a8-4d2cdc7714b1	3001	Celje - poštni predali
00050000-561c-d31a-b721-7863f8161cbc	4207	Cerklje na Gorenjskem
00050000-561c-d31a-6ee9-f6d5410f73db	8263	Cerklje ob Krki
00050000-561c-d31a-e1ad-81ab50e4325b	1380	Cerknica
00050000-561c-d31a-a7c5-10ff6f872050	5282	Cerkno
00050000-561c-d31a-7432-1a424d7a7df4	2236	Cerkvenjak
00050000-561c-d31a-7271-6e75d26af647	2215	Ceršak
00050000-561c-d31a-4ad6-37d21950278e	2326	Cirkovce
00050000-561c-d31a-5bbb-149977152f64	2282	Cirkulane
00050000-561c-d31a-9221-fb8935188085	5273	Col
00050000-561c-d31a-cad1-acecb62434c1	8251	Čatež ob Savi
00050000-561c-d31a-fc5f-3e85a8d44711	1413	Čemšenik
00050000-561c-d31a-d7ae-1ef43e271c68	5253	Čepovan
00050000-561c-d31a-d571-762b1fcc8dc7	9232	Črenšovci
00050000-561c-d31a-91ca-77e4acdc25bf	2393	Črna na Koroškem
00050000-561c-d31a-3a61-77e36c02fae7	6275	Črni Kal
00050000-561c-d31a-a430-c24d41b329ae	5274	Črni Vrh nad Idrijo
00050000-561c-d31a-37b4-0ffa8375e0f5	5262	Črniče
00050000-561c-d31a-0ba0-c34d032acc03	8340	Črnomelj
00050000-561c-d31a-8668-f9895765c1f6	6271	Dekani
00050000-561c-d31a-68f3-1bb984b556c4	5210	Deskle
00050000-561c-d31a-d83d-9285af5b77ca	2253	Destrnik
00050000-561c-d31a-0501-ca2653f6a20f	6215	Divača
00050000-561c-d31a-dfd6-568545eba3b1	1233	Dob
00050000-561c-d31a-713b-1b438b8295b4	3224	Dobje pri Planini
00050000-561c-d31a-6843-8be5f7146705	8257	Dobova
00050000-561c-d31a-0574-d6bf52863e7d	1423	Dobovec
00050000-561c-d31a-c9c2-c6f04691e75c	5263	Dobravlje
00050000-561c-d31a-21ee-6aec1fb6cd1d	3204	Dobrna
00050000-561c-d31a-c834-1e9f1225cfb1	8211	Dobrnič
00050000-561c-d31a-a6ae-2706a9e497d1	1356	Dobrova
00050000-561c-d31a-eca3-5a200b164739	9223	Dobrovnik/Dobronak 
00050000-561c-d31a-f86a-c4bdce38e81b	5212	Dobrovo v Brdih
00050000-561c-d31a-f14e-77a6195b52dd	1431	Dol pri Hrastniku
00050000-561c-d31a-a3e9-1c8f9f5a205f	1262	Dol pri Ljubljani
00050000-561c-d31a-c388-2d93a9a0d65a	1273	Dole pri Litiji
00050000-561c-d31a-3b7f-d183a44410ee	1331	Dolenja vas
00050000-561c-d31a-2db4-c5c683b1174f	8350	Dolenjske Toplice
00050000-561c-d31a-45c4-3421f7ccbfca	1230	Domžale
00050000-561c-d31a-79b0-c857529cfa05	2252	Dornava
00050000-561c-d31a-1f96-ee4d8e1cb4de	5294	Dornberk
00050000-561c-d31a-5f4b-022725769c1d	1319	Draga
00050000-561c-d31a-e09a-4d7968a43660	8343	Dragatuš
00050000-561c-d31a-8525-ce3bb98971ee	3222	Dramlje
00050000-561c-d31a-279a-aca8cc0c50bb	2370	Dravograd
00050000-561c-d31a-c637-e6049665eeb9	4203	Duplje
00050000-561c-d31a-d651-fe4e48af8225	6221	Dutovlje
00050000-561c-d31a-6221-e6eaf232c114	8361	Dvor
00050000-561c-d31a-8c70-998e46dbea81	2343	Fala
00050000-561c-d31a-fb17-be054b2d5ac8	9208	Fokovci
00050000-561c-d31a-41eb-52a433d052a7	2313	Fram
00050000-561c-d31a-fa02-6498dab272e7	3213	Frankolovo
00050000-561c-d31a-99d2-ed8ae00f22a6	1274	Gabrovka
00050000-561c-d31a-1edd-00fa10ab2800	8254	Globoko
00050000-561c-d31a-e323-44473de48caf	5275	Godovič
00050000-561c-d31a-f2da-36d8dcc6497d	4204	Golnik
00050000-561c-d31a-137b-92d59ca2cd7e	3303	Gomilsko
00050000-561c-d31a-e3f8-9171c05be341	4224	Gorenja vas
00050000-561c-d31a-009a-a62b73c16e00	3263	Gorica pri Slivnici
00050000-561c-d31a-193c-a66d7279c893	2272	Gorišnica
00050000-561c-d31a-4c4a-18f83c88032b	9250	Gornja Radgona
00050000-561c-d31a-e6d6-9d6073e4f362	3342	Gornji Grad
00050000-561c-d31a-01cc-46a5ab52b963	4282	Gozd Martuljek
00050000-561c-d31a-5786-38befdc45571	6272	Gračišče
00050000-561c-d31a-1cdc-3dd2744f2e2d	9264	Grad
00050000-561c-d31a-d3f9-c56889ba21a3	8332	Gradac
00050000-561c-d31a-3d94-704496d0c220	1384	Grahovo
00050000-561c-d31a-71e3-6de397e158ec	5242	Grahovo ob Bači
00050000-561c-d31a-e7e1-fec305be9543	5251	Grgar
00050000-561c-d31a-5712-e9150c52f7c1	3302	Griže
00050000-561c-d31a-f79d-482732bf301f	3231	Grobelno
00050000-561c-d31a-3595-b83adf2fed51	1290	Grosuplje
00050000-561c-d31a-d0a7-30a1d7996d7f	2288	Hajdina
00050000-561c-d31a-1fd2-402d5051bcf9	8362	Hinje
00050000-561c-d31a-8a10-2876a2ffe405	2311	Hoče
00050000-561c-d31a-a88c-a5dffcfd9dfb	9205	Hodoš/Hodos
00050000-561c-d31a-6d1a-46860ca27f49	1354	Horjul
00050000-561c-d31a-ecf8-b0c5b2f4efa0	1372	Hotedršica
00050000-561c-d31a-a36f-ad389ff20956	1430	Hrastnik
00050000-561c-d31a-41eb-00c3aacd9358	6225	Hruševje
00050000-561c-d31a-3dd2-e4704e11c91a	4276	Hrušica
00050000-561c-d31a-d1b7-c2f77d08f264	5280	Idrija
00050000-561c-d31a-8dea-13d29efe7421	1292	Ig
00050000-561c-d31a-4ad1-7e1b0129bdca	6250	Ilirska Bistrica
00050000-561c-d31a-92c1-e8e40b007fa0	6251	Ilirska Bistrica-Trnovo
00050000-561c-d31a-c95a-740a4c179867	1295	Ivančna Gorica
00050000-561c-d31a-c988-400e6c1b89de	2259	Ivanjkovci
00050000-561c-d31a-328c-41d2acdf5e68	1411	Izlake
00050000-561c-d31a-6c24-43c4f3e22b4c	6310	Izola/Isola
00050000-561c-d31a-7f7e-517bc73db720	2222	Jakobski Dol
00050000-561c-d31a-c881-88acd4c18ab6	2221	Jarenina
00050000-561c-d31a-f882-a29e807d3a6d	6254	Jelšane
00050000-561c-d31a-318b-8c9c7d24445e	4270	Jesenice
00050000-561c-d31a-9a95-22c6cf52a813	8261	Jesenice na Dolenjskem
00050000-561c-d31a-3c8a-6dd723b76f59	3273	Jurklošter
00050000-561c-d31a-1372-dab6c8154291	2223	Jurovski Dol
00050000-561c-d31a-1580-fbb43d7c75ce	2256	Juršinci
00050000-561c-d31a-5586-c95475309709	5214	Kal nad Kanalom
00050000-561c-d31a-382d-0ee2be80e3e7	3233	Kalobje
00050000-561c-d31a-9750-af36ca6218f4	4246	Kamna Gorica
00050000-561c-d31a-fca9-abc89aa0bd8d	2351	Kamnica
00050000-561c-d31a-8c2d-caf470bb475b	1241	Kamnik
00050000-561c-d31a-0f6d-c8f843389b33	5213	Kanal
00050000-561c-d31a-f78b-1a1b2722fac8	8258	Kapele
00050000-561c-d31a-7e77-ffde206a83de	2362	Kapla
00050000-561c-d31a-26f7-f74c85b9b88a	2325	Kidričevo
00050000-561c-d31a-4ff8-de87df8e4e90	1412	Kisovec
00050000-561c-d31a-8c9d-3d8fca45f4e8	6253	Knežak
00050000-561c-d31a-4cb3-732dcf278aeb	5222	Kobarid
00050000-561c-d31a-a032-2c053d02179c	9227	Kobilje
00050000-561c-d31a-e6f6-55e74a3a7e8a	1330	Kočevje
00050000-561c-d31a-c7c9-068c479b3e95	1338	Kočevska Reka
00050000-561c-d31a-cfb3-ee0b05bf5636	2276	Kog
00050000-561c-d31a-0e2b-7ba015d89d5d	5211	Kojsko
00050000-561c-d31a-a449-a31d96c225d4	6223	Komen
00050000-561c-d31a-c598-64191e144559	1218	Komenda
00050000-561c-d31a-79f4-2a0b5d782acb	6000	Koper/Capodistria 
00050000-561c-d31a-8cf6-db56d337ffc0	6001	Koper/Capodistria - poštni predali
00050000-561c-d31a-a6d9-6ebe3c045b4c	8282	Koprivnica
00050000-561c-d31a-2b26-9a9aedb282f7	5296	Kostanjevica na Krasu
00050000-561c-d31a-ba81-63599b8d8aa9	8311	Kostanjevica na Krki
00050000-561c-d31a-7364-89a2f6efb262	1336	Kostel
00050000-561c-d31a-c489-03299c36c357	6256	Košana
00050000-561c-d31a-33ef-a3ae6d01ca87	2394	Kotlje
00050000-561c-d31a-e955-b0eea15033b9	6240	Kozina
00050000-561c-d31a-3c07-4bc21cc7a39a	3260	Kozje
00050000-561c-d31a-5e9b-40afdfd0f5fa	4000	Kranj 
00050000-561c-d31a-6914-36a312320098	4001	Kranj - poštni predali
00050000-561c-d31a-ef4c-460cd3345ebb	4280	Kranjska Gora
00050000-561c-d31a-fb6a-28a47c67ca4d	1281	Kresnice
00050000-561c-d31a-4dc8-f304a52abfb2	4294	Križe
00050000-561c-d31a-e1f2-c418ad1b155c	9206	Križevci
00050000-561c-d31a-9a8b-2e61d91b6a32	9242	Križevci pri Ljutomeru
00050000-561c-d31a-4d89-ddeb4ae8dc5f	1301	Krka
00050000-561c-d31a-f8cc-3f80fe7f8a2c	8296	Krmelj
00050000-561c-d31a-619e-22976c2e8233	4245	Kropa
00050000-561c-d31a-ce01-9144cfea78b3	8262	Krška vas
00050000-561c-d31a-b029-1c3e784b3cff	8270	Krško
00050000-561c-d31a-4069-8dde559594b2	9263	Kuzma
00050000-561c-d31a-849e-83723bf34804	2318	Laporje
00050000-561c-d31a-c997-cd877968d6f2	3270	Laško
00050000-561c-d31a-8273-45bd57469e2e	1219	Laze v Tuhinju
00050000-561c-d31a-13f5-0641e3184687	2230	Lenart v Slovenskih goricah
00050000-561c-d31a-288a-87b2c514e741	9220	Lendava/Lendva
00050000-561c-d31a-9980-a7c01b753c36	4248	Lesce
00050000-561c-d31a-2225-1230beff0978	3261	Lesično
00050000-561c-d31a-13eb-c7fb763c2b51	8273	Leskovec pri Krškem
00050000-561c-d31a-3c15-01ff287c7379	2372	Libeliče
00050000-561c-d31a-cba3-740d8fe9f23f	2341	Limbuš
00050000-561c-d31a-bbad-f3d605b171b0	1270	Litija
00050000-561c-d31a-7d15-bc6f42c3a8c8	3202	Ljubečna
00050000-561c-d31a-0072-73287b6887ec	1000	Ljubljana 
00050000-561c-d31a-a0d2-9e64996f6708	1001	Ljubljana - poštni predali
00050000-561c-d31a-3a2e-d57acf84595f	1231	Ljubljana - Črnuče
00050000-561c-d31a-22f2-de89337c1994	1261	Ljubljana - Dobrunje
00050000-561c-d31a-6904-ba04236b723c	1260	Ljubljana - Polje
00050000-561c-d31a-5b12-45f1bd5663df	1210	Ljubljana - Šentvid
00050000-561c-d31a-d624-343b7e2dceef	1211	Ljubljana - Šmartno
00050000-561c-d31a-0882-29ed6a4a748c	3333	Ljubno ob Savinji
00050000-561c-d31a-2e52-d469bcd2d291	9240	Ljutomer
00050000-561c-d31a-6270-a4dfaa7b1e30	3215	Loče
00050000-561c-d31a-cb83-dd8bff1fe452	5231	Log pod Mangartom
00050000-561c-d31a-f6e5-0ee79cc39f46	1358	Log pri Brezovici
00050000-561c-d31a-cce3-d98685e38f0a	1370	Logatec
00050000-561c-d31a-e7d3-14b94999d3f5	1371	Logatec
00050000-561c-d31a-1eea-0c3d919e816c	1434	Loka pri Zidanem Mostu
00050000-561c-d31a-f9d0-7c299191db6b	3223	Loka pri Žusmu
00050000-561c-d31a-558f-4a37d55d6df5	6219	Lokev
00050000-561c-d31a-7d9a-9c339f810651	1318	Loški Potok
00050000-561c-d31a-3148-1c0ecad1e786	2324	Lovrenc na Dravskem polju
00050000-561c-d31a-6f56-bc926024ac6e	2344	Lovrenc na Pohorju
00050000-561c-d31a-cbcf-6f57e592bbb9	3334	Luče
00050000-561c-d31a-d3f2-8c513eb1c326	1225	Lukovica
00050000-561c-d31a-5d46-c2a3610789f8	9202	Mačkovci
00050000-561c-d31a-d220-cdc2bbaa7b03	2322	Majšperk
00050000-561c-d31a-e2a3-8028573a709e	2321	Makole
00050000-561c-d31a-a9d0-5d64c06361e8	9243	Mala Nedelja
00050000-561c-d31a-270f-647b9cf2463f	2229	Malečnik
00050000-561c-d31a-0984-e9935f6bb079	6273	Marezige
00050000-561c-d31a-b7f4-b3a4b3f0a858	2000	Maribor 
00050000-561c-d31a-2af9-f5eb633337dd	2001	Maribor - poštni predali
00050000-561c-d31a-b77d-d9de5e984096	2206	Marjeta na Dravskem polju
00050000-561c-d31a-c28f-de0c668c9ea7	2281	Markovci
00050000-561c-d31a-f1e7-f877c0de16a2	9221	Martjanci
00050000-561c-d31a-ce37-45d6ee725027	6242	Materija
00050000-561c-d31a-f5f0-4daa3b3ba2fe	4211	Mavčiče
00050000-561c-d31a-3d47-d4ef2afea7aa	1215	Medvode
00050000-561c-d31a-a2d1-624d24983cfd	1234	Mengeš
00050000-561c-d31a-f12e-8dd1cec7fc2d	8330	Metlika
00050000-561c-d31a-f494-87693d50e57a	2392	Mežica
00050000-561c-d31a-204e-4d43d8238892	2204	Miklavž na Dravskem polju
00050000-561c-d31a-dc57-34dba2b58b41	2275	Miklavž pri Ormožu
00050000-561c-d31a-db38-dbddb0423d69	5291	Miren
00050000-561c-d31a-b935-bec6201c8feb	8233	Mirna
00050000-561c-d31a-a092-6654350cae15	8216	Mirna Peč
00050000-561c-d31a-244d-9fd52e8b7161	2382	Mislinja
00050000-561c-d31a-0eab-08414bf800d1	4281	Mojstrana
00050000-561c-d31a-c9c6-22e8d62fd459	8230	Mokronog
00050000-561c-d31a-df49-95e5ceae27d0	1251	Moravče
00050000-561c-d31a-5b19-f6e0e47fe148	9226	Moravske Toplice
00050000-561c-d31a-8477-0f5d9ee54718	5216	Most na Soči
00050000-561c-d31a-724f-90e84c2786e4	1221	Motnik
00050000-561c-d31a-e990-bebdebd48e6c	3330	Mozirje
00050000-561c-d31a-7fa9-f7a81c291f07	9000	Murska Sobota 
00050000-561c-d31a-0544-beae28b4cdd2	9001	Murska Sobota - poštni predali
00050000-561c-d31a-ddf8-78d3d9942793	2366	Muta
00050000-561c-d31a-5a74-8a60e1c2eb26	4202	Naklo
00050000-561c-d31a-ad91-1459d2a7d8e1	3331	Nazarje
00050000-561c-d31a-2780-aec97a98c0b4	1357	Notranje Gorice
00050000-561c-d31a-17f6-f9ba23189432	3203	Nova Cerkev
00050000-561c-d31a-b881-8d0cb63aa2ab	5000	Nova Gorica 
00050000-561c-d31a-6b16-6b428e280b0b	5001	Nova Gorica - poštni predali
00050000-561c-d31a-7310-fad51e29cceb	1385	Nova vas
00050000-561c-d31a-ea22-b623c4c4d2d7	8000	Novo mesto
00050000-561c-d31a-012a-d4e7e2913c3e	8001	Novo mesto - poštni predali
00050000-561c-d31a-47e3-19c3e9fec7f8	6243	Obrov
00050000-561c-d31a-75b5-360c312d38cc	9233	Odranci
00050000-561c-d31a-3e8f-bdd773e45399	2317	Oplotnica
00050000-561c-d31a-625f-79fcf5596b6d	2312	Orehova vas
00050000-561c-d31a-1633-734a95457f14	2270	Ormož
00050000-561c-d31a-ff7e-b4c52277bbd3	1316	Ortnek
00050000-561c-d31a-78b4-df8b0dc9be03	1337	Osilnica
00050000-561c-d31a-a142-5cdc4da19ae5	8222	Otočec
00050000-561c-d31a-840a-0bdfdead3dae	2361	Ožbalt
00050000-561c-d31a-430b-312afa0be5fd	2231	Pernica
00050000-561c-d31a-2642-95e6728ed456	2211	Pesnica pri Mariboru
00050000-561c-d31a-f93e-b1d59ff11c8d	9203	Petrovci
00050000-561c-d31a-7d9e-fbcca07ab83e	3301	Petrovče
00050000-561c-d31a-f64c-225de7bada5d	6330	Piran/Pirano
00050000-561c-d31a-5a6a-d00b77e1eafc	8255	Pišece
00050000-561c-d31a-35b9-a67b3b241461	6257	Pivka
00050000-561c-d31a-2307-890630edcf75	6232	Planina
00050000-561c-d31a-f144-bf413d8f7db7	3225	Planina pri Sevnici
00050000-561c-d31a-fdb4-3d0f73fa1c47	6276	Pobegi
00050000-561c-d31a-d295-53296309a13c	8312	Podbočje
00050000-561c-d31a-58a6-76da4256ffe6	5243	Podbrdo
00050000-561c-d31a-d387-3a3aaee7c09f	3254	Podčetrtek
00050000-561c-d31a-efe5-f0dda99a5c7f	2273	Podgorci
00050000-561c-d31a-1930-dd503b642b7c	6216	Podgorje
00050000-561c-d31a-fd1f-6bcf8577a074	2381	Podgorje pri Slovenj Gradcu
00050000-561c-d31a-de0c-ce364c163490	6244	Podgrad
00050000-561c-d31a-4b5a-ed2c8f8d8792	1414	Podkum
00050000-561c-d31a-6445-bbf4a5e24249	2286	Podlehnik
00050000-561c-d31a-2aeb-8ef57e95a027	5272	Podnanos
00050000-561c-d31a-3455-72ab1aed8349	4244	Podnart
00050000-561c-d31a-f3e4-ba3f4786d306	3241	Podplat
00050000-561c-d31a-8893-76e3c2463c40	3257	Podsreda
00050000-561c-d31a-1ed1-e8f376dcc584	2363	Podvelka
00050000-561c-d31a-e2d4-bd71a27a2506	2208	Pohorje
00050000-561c-d31a-a309-9cd631e3caab	2257	Polenšak
00050000-561c-d31a-adf7-74cb769e2945	1355	Polhov Gradec
00050000-561c-d31a-10e4-8bac3b9be523	4223	Poljane nad Škofjo Loko
00050000-561c-d31a-fa25-1fde8d06cf3e	2319	Poljčane
00050000-561c-d31a-6941-78ea428c14cd	1272	Polšnik
00050000-561c-d31a-89e4-1c8758e52478	3313	Polzela
00050000-561c-d31a-493c-d6dc19e0984e	3232	Ponikva
00050000-561c-d31a-3599-91b8b0fd73eb	6320	Portorož/Portorose
00050000-561c-d31a-ce0a-97ad59267cdf	6230	Postojna
00050000-561c-d31a-d66f-e4c4bdd7ef3d	2331	Pragersko
00050000-561c-d31a-3c67-52dfc382419e	3312	Prebold
00050000-561c-d31a-638e-108142d3a83f	4205	Preddvor
00050000-561c-d31a-8a53-8f9f7faf8dbc	6255	Prem
00050000-561c-d31a-e513-53355b922bdb	1352	Preserje
00050000-561c-d31a-9b1e-26a43399b416	6258	Prestranek
00050000-561c-d31a-43dd-f1041669d202	2391	Prevalje
00050000-561c-d31a-bb4a-aadb2db387a8	3262	Prevorje
00050000-561c-d31a-e603-e93bd2fd6758	1276	Primskovo 
00050000-561c-d31a-a3cf-d6914caf4179	3253	Pristava pri Mestinju
00050000-561c-d31a-424f-c722edcdef80	9207	Prosenjakovci/Partosfalva
00050000-561c-d31a-9031-57572329846c	5297	Prvačina
00050000-561c-d31a-748c-e679a782aa3b	2250	Ptuj
00050000-561c-d31a-bd4b-59080631e627	2323	Ptujska Gora
00050000-561c-d31a-a35f-700cce017852	9201	Puconci
00050000-561c-d31a-62ae-a114c89d4895	2327	Rače
00050000-561c-d31a-845d-c28e8153a0f5	1433	Radeče
00050000-561c-d31a-65e4-9589ae0f7013	9252	Radenci
00050000-561c-d31a-80de-d612f2cc587c	2360	Radlje ob Dravi
00050000-561c-d31a-af6d-1f02be382ace	1235	Radomlje
00050000-561c-d31a-de83-13323b50d0fa	4240	Radovljica
00050000-561c-d31a-bdc3-a8131005d223	8274	Raka
00050000-561c-d31a-d82c-f45aa591d671	1381	Rakek
00050000-561c-d31a-fd8d-8fd2461436a1	4283	Rateče - Planica
00050000-561c-d31a-951c-87e8ea69db97	2390	Ravne na Koroškem
00050000-561c-d31a-fdf6-61791624ef84	9246	Razkrižje
00050000-561c-d31a-1185-d37d3b55318d	3332	Rečica ob Savinji
00050000-561c-d31a-d982-3f68bc922d7c	5292	Renče
00050000-561c-d31a-34cd-c4c53d3c45f5	1310	Ribnica
00050000-561c-d31a-e691-c7413fb311e6	2364	Ribnica na Pohorju
00050000-561c-d31a-bfe2-9bb6c544ac5c	3272	Rimske Toplice
00050000-561c-d31a-475d-6e2bf9efda9f	1314	Rob
00050000-561c-d31a-7de1-d91860a01f98	5215	Ročinj
00050000-561c-d31a-6075-f6a110ecfb4d	3250	Rogaška Slatina
00050000-561c-d31a-dd6f-8ad52359916d	9262	Rogašovci
00050000-561c-d31a-a8e0-88b40b7c705a	3252	Rogatec
00050000-561c-d31a-0953-57555b3c1c0d	1373	Rovte
00050000-561c-d31a-6622-9dc9206199ab	2342	Ruše
00050000-561c-d31a-ba30-d6c1989c9571	1282	Sava
00050000-561c-d31a-141a-8c8991dbb89f	6333	Sečovlje/Sicciole
00050000-561c-d31a-5a26-a58d66f4ec2d	4227	Selca
00050000-561c-d31a-dc24-3a87213db7b7	2352	Selnica ob Dravi
00050000-561c-d31a-bd3e-928c7c92c0f4	8333	Semič
00050000-561c-d31a-08b2-9040276b7115	8281	Senovo
00050000-561c-d31a-96b5-1b0eef64ace2	6224	Senožeče
00050000-561c-d31a-0377-9ec5790b71dd	8290	Sevnica
00050000-561c-d31a-2879-8d3c2e6a1d7a	6210	Sežana
00050000-561c-d31a-4bd2-fabaafdf12e6	2214	Sladki Vrh
00050000-561c-d31a-8b35-06dacfe7db4c	5283	Slap ob Idrijci
00050000-561c-d31a-6c81-921b17503f5e	2380	Slovenj Gradec
00050000-561c-d31a-fe30-e543e0532f04	2310	Slovenska Bistrica
00050000-561c-d31a-ccdb-d3b0de2f291b	3210	Slovenske Konjice
00050000-561c-d31a-8523-2e8511e7052a	1216	Smlednik
00050000-561c-d31a-5f45-4b6cdaf7fc39	5232	Soča
00050000-561c-d31a-efeb-da6d93789945	1317	Sodražica
00050000-561c-d31a-20a9-2b73f6c3f9e4	3335	Solčava
00050000-561c-d31a-c437-4e1f17d00913	5250	Solkan
00050000-561c-d31a-e0f4-2fa136742148	4229	Sorica
00050000-561c-d31a-6969-e2266d7a1243	4225	Sovodenj
00050000-561c-d31a-d63c-b225f21ee9fa	5281	Spodnja Idrija
00050000-561c-d31a-5893-e4b88465d6b6	2241	Spodnji Duplek
00050000-561c-d31a-6dd7-e938e4c8a7fb	9245	Spodnji Ivanjci
00050000-561c-d31a-e397-f60e8e343cde	2277	Središče ob Dravi
00050000-561c-d31a-c8e3-e53adc13f933	4267	Srednja vas v Bohinju
00050000-561c-d31a-b949-6663ac96d6bd	8256	Sromlje 
00050000-561c-d31a-666c-b88135f85793	5224	Srpenica
00050000-561c-d31a-8d92-2d14a2ce5588	1242	Stahovica
00050000-561c-d31a-b496-071b290f8a02	1332	Stara Cerkev
00050000-561c-d31a-362a-d4c3d348557a	8342	Stari trg ob Kolpi
00050000-561c-d31a-fa0b-dd7f70dd6303	1386	Stari trg pri Ložu
00050000-561c-d31a-cda7-2be0f2b1c05f	2205	Starše
00050000-561c-d31a-cd53-ec5232d0a8d2	2289	Stoperce
00050000-561c-d31a-d3a8-39c4a80fb3fe	8322	Stopiče
00050000-561c-d31a-9f92-a84db463d483	3206	Stranice
00050000-561c-d31a-e179-2b613fe09c5c	8351	Straža
00050000-561c-d31a-8c04-9d0aa66c29f6	1313	Struge
00050000-561c-d31a-c5b1-d212e34d53d5	8293	Studenec
00050000-561c-d31a-bf0e-3db24f48a167	8331	Suhor
00050000-561c-d31a-4751-aaa1e88fc1c5	2233	Sv. Ana v Slovenskih goricah
00050000-561c-d31a-26ed-dc1d2abecad5	2235	Sv. Trojica v Slovenskih goricah
00050000-561c-d31a-eac0-3644a506b648	2353	Sveti Duh na Ostrem Vrhu
00050000-561c-d31a-88db-d50ead6c1162	9244	Sveti Jurij ob Ščavnici
00050000-561c-d31a-b583-5861c742ea68	3264	Sveti Štefan
00050000-561c-d31a-cf43-c5e89171574a	2258	Sveti Tomaž
00050000-561c-d31a-2dfa-536d6df79979	9204	Šalovci
00050000-561c-d31a-a468-ae32f14a557c	5261	Šempas
00050000-561c-d31a-a7be-013a9fc49102	5290	Šempeter pri Gorici
00050000-561c-d31a-1b90-e857ea6ef4b6	3311	Šempeter v Savinjski dolini
00050000-561c-d31a-031d-939a91482527	4208	Šenčur
00050000-561c-d31a-e60f-7614608cf621	2212	Šentilj v Slovenskih goricah
00050000-561c-d31a-a0f6-3c6f53e5e7f4	8297	Šentjanž
00050000-561c-d31a-c1bf-4658aefa60b6	2373	Šentjanž pri Dravogradu
00050000-561c-d31a-5dfc-deb0a2829e27	8310	Šentjernej
00050000-561c-d31a-a289-749f23a4c39f	3230	Šentjur
00050000-561c-d31a-89ce-1e4662491ba7	3271	Šentrupert
00050000-561c-d31a-b834-111bdb100366	8232	Šentrupert
00050000-561c-d31a-684a-ed969ddac738	1296	Šentvid pri Stični
00050000-561c-d31a-3ed7-cc7a0a2e8c04	8275	Škocjan
00050000-561c-d31a-3b9e-f0c04f658c05	6281	Škofije
00050000-561c-d31a-2cf3-6ee70da48433	4220	Škofja Loka
00050000-561c-d31a-8550-d64f34365a8d	3211	Škofja vas
00050000-561c-d31a-ac22-65c445a27bd5	1291	Škofljica
00050000-561c-d31a-a8fb-4bb786de54b3	6274	Šmarje
00050000-561c-d31a-1daf-a46cdca39d58	1293	Šmarje - Sap
00050000-561c-d31a-1cd4-adbe29e7dbcc	3240	Šmarje pri Jelšah
00050000-561c-d31a-f974-0765f7c99690	8220	Šmarješke Toplice
00050000-561c-d31a-eb53-fe5b23cc3c85	2315	Šmartno na Pohorju
00050000-561c-d31a-7bf7-11b47b5adeb9	3341	Šmartno ob Dreti
00050000-561c-d31a-ae7e-0cd2848edfb1	3327	Šmartno ob Paki
00050000-561c-d31a-4e90-2289b9eced84	1275	Šmartno pri Litiji
00050000-561c-d31a-2459-f5763ea2c650	2383	Šmartno pri Slovenj Gradcu
00050000-561c-d31a-a1b1-8871f0f29bf0	3201	Šmartno v Rožni dolini
00050000-561c-d31a-6026-e57c94f18e20	3325	Šoštanj
00050000-561c-d31a-32c9-f6602c7496cf	6222	Štanjel
00050000-561c-d31a-14fd-27ee8cfdf982	3220	Štore
00050000-561c-d31a-d0d7-36c4be73e004	3304	Tabor
00050000-561c-d31a-ea5d-861e37804faf	3221	Teharje
00050000-561c-d31a-900e-c22506dc58ff	9251	Tišina
00050000-561c-d31a-86b8-b80da462c124	5220	Tolmin
00050000-561c-d31a-c27b-47cbbedf7ac6	3326	Topolšica
00050000-561c-d31a-995b-a76edc5e7155	2371	Trbonje
00050000-561c-d31a-f7e8-45aca986ed07	1420	Trbovlje
00050000-561c-d31a-03f8-5f2c2d74aeb6	8231	Trebelno 
00050000-561c-d31a-d072-e9f6a39fa996	8210	Trebnje
00050000-561c-d31a-936a-0bde458bcbdb	5252	Trnovo pri Gorici
00050000-561c-d31a-236b-5c233edc8220	2254	Trnovska vas
00050000-561c-d31a-e8b2-a432d5786cce	1222	Trojane
00050000-561c-d31a-2c82-9943eb60203a	1236	Trzin
00050000-561c-d31a-ac92-52f8c5d4e221	4290	Tržič
00050000-561c-d31a-631b-5f56f1075cb2	8295	Tržišče
00050000-561c-d31a-e017-e4ede82215b8	1311	Turjak
00050000-561c-d31a-d58f-054cbb9b3979	9224	Turnišče
00050000-561c-d31a-7162-ff92323422fe	8323	Uršna sela
00050000-561c-d31a-91d1-62f7fdfa3e7b	1252	Vače
00050000-561c-d31a-68d4-36d23496d52e	3320	Velenje 
00050000-561c-d31a-09eb-e55fde65853d	3322	Velenje - poštni predali
00050000-561c-d31a-5135-addabf47c53c	8212	Velika Loka
00050000-561c-d31a-d730-22def7d23d0e	2274	Velika Nedelja
00050000-561c-d31a-f82a-49ce89758c51	9225	Velika Polana
00050000-561c-d31a-a620-473474e15734	1315	Velike Lašče
00050000-561c-d31a-f693-bd7e5180fa8d	8213	Veliki Gaber
00050000-561c-d31a-5865-ba1efce7e608	9241	Veržej
00050000-561c-d31a-8dab-7683cf10056f	1312	Videm - Dobrepolje
00050000-561c-d31a-bdd8-40dad7779603	2284	Videm pri Ptuju
00050000-561c-d31a-6c38-8f58f6431105	8344	Vinica
00050000-561c-d31a-2075-9c088cf1ae77	5271	Vipava
00050000-561c-d31a-8cca-af594b49a137	4212	Visoko
00050000-561c-d31a-d22d-37e1766e4770	1294	Višnja Gora
00050000-561c-d31a-9246-a8c659626083	3205	Vitanje
00050000-561c-d31a-c1cc-c9e0d93d6d32	2255	Vitomarci
00050000-561c-d31a-d411-21a75c330792	1217	Vodice
00050000-561c-d31a-d735-a8879151c448	3212	Vojnik\t
00050000-561c-d31a-ffa0-74059ba77308	5293	Volčja Draga
00050000-561c-d31a-f37f-f48dbd5b1cad	2232	Voličina
00050000-561c-d31a-55b1-252163bcafc7	3305	Vransko
00050000-561c-d31a-cc16-607ea343f643	6217	Vremski Britof
00050000-561c-d31a-0580-62795592d5ef	1360	Vrhnika
00050000-561c-d31a-e255-d304d4c61042	2365	Vuhred
00050000-561c-d31a-acfb-0a0334006d59	2367	Vuzenica
00050000-561c-d31a-e1b4-3d11ed3f4686	8292	Zabukovje 
00050000-561c-d31a-a6fd-62865423f772	1410	Zagorje ob Savi
00050000-561c-d31a-624a-d739f9d1cc93	1303	Zagradec
00050000-561c-d31a-c259-2c4fb02f8bfe	2283	Zavrč
00050000-561c-d31a-464d-6859723168f7	8272	Zdole 
00050000-561c-d31a-0332-b4cd42e80370	4201	Zgornja Besnica
00050000-561c-d31a-7ca1-bfa1c9be6162	2242	Zgornja Korena
00050000-561c-d31a-7bb4-5120657e3680	2201	Zgornja Kungota
00050000-561c-d31a-1302-cef7ca7b664d	2316	Zgornja Ložnica
00050000-561c-d31a-5b2d-5bd3aa15ecc9	2314	Zgornja Polskava
00050000-561c-d31a-cb3a-20daf3414c08	2213	Zgornja Velka
00050000-561c-d31a-653c-245042184dc6	4247	Zgornje Gorje
00050000-561c-d31a-c6f2-18ed1fd0ac8b	4206	Zgornje Jezersko
00050000-561c-d31a-3cca-73230261299e	2285	Zgornji Leskovec
00050000-561c-d31a-b769-87efc43f664e	1432	Zidani Most
00050000-561c-d31a-7e72-efa46313414d	3214	Zreče
00050000-561c-d31a-8b8c-c52cb9a443e7	4209	Žabnica
00050000-561c-d31a-23e4-bc5dd91a0fbd	3310	Žalec
00050000-561c-d31a-cb64-858317cdd314	4228	Železniki
00050000-561c-d31a-7b24-b0256fc1371d	2287	Žetale
00050000-561c-d31a-2e03-c287d7ea4a3b	4226	Žiri
00050000-561c-d31a-a2a9-90bf1e178446	4274	Žirovnica
00050000-561c-d31a-bdab-d9610a411e1d	8360	Žužemberk
\.


--
-- TOC entry 3057 (class 0 OID 21747055)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21746648)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 21746428)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561c-d31c-d731-7bc8cf429147	00080000-561c-d31c-825c-0809227a8057	\N	00040000-561c-d31a-60e1-9d5d5ac2dd19	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561c-d31c-84f7-3a25b948b7a8	00080000-561c-d31c-825c-0809227a8057	\N	00040000-561c-d31a-60e1-9d5d5ac2dd19	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561c-d31c-c375-021a0ab64f48	00080000-561c-d31c-014c-c942a2e6909e	\N	00040000-561c-d31a-60e1-9d5d5ac2dd19	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3019 (class 0 OID 21746532)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21746660)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 21747069)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 21747079)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561c-d31c-ac0e-b5b841c70817	00080000-561c-d31c-af56-dcc3b75f9308	0987	AK
00190000-561c-d31c-56e4-f5a8b0c7729c	00080000-561c-d31c-014c-c942a2e6909e	0989	AK
00190000-561c-d31c-db28-34fe0742bbeb	00080000-561c-d31c-d927-e0b9977f71b6	0986	AK
00190000-561c-d31c-98e6-10dac35cd1ac	00080000-561c-d31c-f6db-a3386527649d	0984	AK
00190000-561c-d31c-38cb-7f4d7ddc752a	00080000-561c-d31c-9b75-3bab32f69bca	0983	AK
00190000-561c-d31c-88ac-1e29a6bebdc2	00080000-561c-d31c-16f9-a850db064a55	0982	AK
00190000-561c-d31e-8c51-556238d1a019	00080000-561c-d31e-4227-4adbe7fef0f9	1001	AK
\.


--
-- TOC entry 3056 (class 0 OID 21746994)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561c-d31d-5e64-0421752c75a0	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3060 (class 0 OID 21747087)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21746689)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561c-d31c-119e-67e184c752c4	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561c-d31c-6985-5ae43db6a306	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561c-d31c-6342-48afeeb2b889	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561c-d31c-971c-a309b3b03082	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561c-d31c-d618-d660075f2b78	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561c-d31c-6229-dfdd02ccf0fa	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561c-d31c-00de-27f09ac24ca5	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3028 (class 0 OID 21746633)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 21746623)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 21746833)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 21746763)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21746506)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 21746301)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561c-d31e-4227-4adbe7fef0f9	00010000-561c-d31b-4c18-b03b8acd33ce	2015-10-13 11:47:10	INS	a:0:{}
2	App\\Entity\\Option	00000000-561c-d31e-11e5-5d4861450e2e	00010000-561c-d31b-4c18-b03b8acd33ce	2015-10-13 11:47:10	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561c-d31e-8c51-556238d1a019	00010000-561c-d31b-4c18-b03b8acd33ce	2015-10-13 11:47:10	INS	a:0:{}
\.


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3037 (class 0 OID 21746702)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21746339)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561c-d31a-78e0-a17f6ff7999a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561c-d31a-0856-6125a7a7c436	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561c-d31a-60cd-74853a0be397	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561c-d31a-e23a-9d73f3505e71	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561c-d31b-7581-fe5d137c8d07	planer	Planer dogodkov v koledarju	t
00020000-561c-d31b-bbd7-01881d5fc5be	kadrovska	Kadrovska služba	t
00020000-561c-d31b-1816-9bfa5ea22622	arhivar	Ažuriranje arhivalij	t
00020000-561c-d31b-906f-0ab765904fe6	igralec	Igralec	t
00020000-561c-d31b-3630-679b4081876f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561c-d31c-d560-d87aa80a49da	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3002 (class 0 OID 21746323)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561c-d31b-8170-e63371654c62	00020000-561c-d31a-60cd-74853a0be397
00010000-561c-d31b-4c18-b03b8acd33ce	00020000-561c-d31a-60cd-74853a0be397
00010000-561c-d31c-6941-e033977f4295	00020000-561c-d31c-d560-d87aa80a49da
\.


--
-- TOC entry 3039 (class 0 OID 21746716)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21746654)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21746600)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21746288)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561c-d31a-14fb-6b2d9be7c00f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561c-d31a-b366-56c84bcf4b2e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561c-d31a-a165-3e0e61e56a0e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561c-d31a-ed69-294c53d8499f	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561c-d31a-c2b3-f737fdc2ed1f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2997 (class 0 OID 21746280)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561c-d31a-8152-f3c55c5a1c2b	00230000-561c-d31a-ed69-294c53d8499f	popa
00240000-561c-d31a-cd3b-dea748916b8f	00230000-561c-d31a-ed69-294c53d8499f	oseba
00240000-561c-d31a-c601-a56cc6f19ee1	00230000-561c-d31a-ed69-294c53d8499f	sezona
00240000-561c-d31a-b101-aecfe22cc96e	00230000-561c-d31a-b366-56c84bcf4b2e	prostor
00240000-561c-d31a-38ba-52b307bfcafd	00230000-561c-d31a-ed69-294c53d8499f	besedilo
00240000-561c-d31a-845c-323b7bad8d32	00230000-561c-d31a-ed69-294c53d8499f	uprizoritev
00240000-561c-d31a-5e05-1dab8b6ac008	00230000-561c-d31a-ed69-294c53d8499f	funkcija
00240000-561c-d31a-8156-f9d372d6cd7e	00230000-561c-d31a-ed69-294c53d8499f	tipfunkcije
00240000-561c-d31a-bb41-c112b5a654a4	00230000-561c-d31a-ed69-294c53d8499f	alternacija
00240000-561c-d31a-48d2-9d0895db5acc	00230000-561c-d31a-14fb-6b2d9be7c00f	pogodba
00240000-561c-d31a-b784-22fb7a3404f7	00230000-561c-d31a-ed69-294c53d8499f	zaposlitev
00240000-561c-d31a-0c37-8bc95d8f0729	00230000-561c-d31a-ed69-294c53d8499f	zvrstuprizoritve
00240000-561c-d31a-2fb0-2df0c29b7bbb	00230000-561c-d31a-14fb-6b2d9be7c00f	programdela
00240000-561c-d31a-b07a-bb9f25e44727	00230000-561c-d31a-ed69-294c53d8499f	zapis
\.


--
-- TOC entry 2996 (class 0 OID 21746275)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
1d337241-95cc-4b87-a9b6-bffdb6726a37	00240000-561c-d31a-8152-f3c55c5a1c2b	0	1001
\.


--
-- TOC entry 3045 (class 0 OID 21746780)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561c-d31d-48b0-6f5f294c8837	000e0000-561c-d31c-e71d-8ab2c59c2449	00080000-561c-d31c-825c-0809227a8057	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561c-d31a-f4af-7c5127d07130
00270000-561c-d31d-8e98-46bb54f42881	000e0000-561c-d31c-e71d-8ab2c59c2449	00080000-561c-d31c-825c-0809227a8057	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561c-d31a-f4af-7c5127d07130
\.


--
-- TOC entry 3009 (class 0 OID 21746401)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21746610)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-561c-d31d-ced0-5264424afac1	00180000-561c-d31d-cd00-113331425d3f	000c0000-561c-d31d-8dc3-b6d27ee10f2a	00090000-561c-d31c-d7a9-6a5d8b0e6ba0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-d31d-bafa-ce5b60dcba04	00180000-561c-d31d-cd00-113331425d3f	000c0000-561c-d31d-2357-1ee520083bc5	00090000-561c-d31c-8f91-516b40b1eb0b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-d31d-c9f4-b2afb2f86cb3	00180000-561c-d31d-cd00-113331425d3f	000c0000-561c-d31d-b88d-9dc1c9ec1e36	00090000-561c-d31c-12e3-230fc8f082c7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-d31d-e952-1aab0e7f30bf	00180000-561c-d31d-cd00-113331425d3f	000c0000-561c-d31d-af64-c6b11082d747	00090000-561c-d31c-13c0-9082c9dbf8c5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-d31d-1dfa-9b8d1a96a273	00180000-561c-d31d-cd00-113331425d3f	000c0000-561c-d31d-c825-c62503ac7c5b	00090000-561c-d31c-88f6-3281709c94de	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-d31d-2f40-90a84a9bf210	00180000-561c-d31d-f044-a79e31d538f9	\N	00090000-561c-d31c-88f6-3281709c94de	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3048 (class 0 OID 21746821)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561c-d31a-3ef8-7a1f84857f15	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561c-d31a-6dde-ac33500e3eb9	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561c-d31a-78cf-1b7ab2d42d2e	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561c-d31a-ff50-5e3532a15d32	04	Režija	Režija	Režija	umetnik	30
000f0000-561c-d31a-4628-0d226598b968	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561c-d31a-1094-02adf380be7f	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561c-d31a-1903-0bbd3112e2ed	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561c-d31a-7b65-fbf4d32060ec	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561c-d31a-9dc2-4d92c8b24d61	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561c-d31a-ae83-f0f0f6edecba	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561c-d31a-93d9-ed2056066675	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561c-d31a-11ef-5bace4305ad2	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561c-d31a-2413-a212d03fefec	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561c-d31a-bb75-d5da96da3c3c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561c-d31a-57af-f3a744df2f1d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561c-d31a-dfbc-ab0982f6e221	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561c-d31a-ed59-343b32422085	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561c-d31a-49b5-c7caa355e7a0	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3061 (class 0 OID 21747098)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561c-d31a-6ed0-e51fd9bca0be	01	Velika predstava	f	1.00	1.00
002b0000-561c-d31a-3f5f-c762f848b0ae	02	Mala predstava	f	0.50	0.50
002b0000-561c-d31a-db58-4db6e0b4cef1	03	Mala koprodukcija	t	0.40	1.00
002b0000-561c-d31a-e54d-3eb720cb614b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561c-d31a-7fa3-c784c16cd71f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3014 (class 0 OID 21746463)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21746310)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561c-d31b-4c18-b03b8acd33ce	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROPr3q05iX6IZsxmsFF7EFFX1mc3HtKcy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561c-d31c-c4b1-0236b5fd13eb	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561c-d31c-bba8-6af1a69d6e19	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561c-d31c-71f3-f8edafb8ea07	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561c-d31c-066e-24e08d4de37a	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561c-d31c-4d1a-e2c1eb9681dd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561c-d31c-e3e9-0377f03cd966	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561c-d31c-00a5-38094f7ad1e2	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561c-d31c-f9c8-2984ac7c8803	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561c-d31c-f6d4-9ab11cc18568	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561c-d31c-6941-e033977f4295	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561c-d31b-8170-e63371654c62	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3052 (class 0 OID 21746871)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561c-d31c-8379-1d9bb287952b	00160000-561c-d31c-349c-271c657807e4	\N	00140000-561c-d31a-7eb4-11c4057b6dae	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561c-d31c-d618-d660075f2b78
000e0000-561c-d31c-e71d-8ab2c59c2449	00160000-561c-d31c-e633-b5fdd0abf9b4	\N	00140000-561c-d31a-cfba-fe843f4dbfcf	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561c-d31c-6229-dfdd02ccf0fa
000e0000-561c-d31c-8f5a-ac40c3a0b5b5	\N	\N	00140000-561c-d31a-cfba-fe843f4dbfcf	00190000-561c-d31c-ac0e-b5b841c70817	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561c-d31c-d618-d660075f2b78
000e0000-561c-d31c-c1ff-d7a98b0e7f20	\N	\N	00140000-561c-d31a-cfba-fe843f4dbfcf	00190000-561c-d31c-ac0e-b5b841c70817	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561c-d31c-d618-d660075f2b78
000e0000-561c-d31c-139a-f2b81d600cdc	\N	\N	00140000-561c-d31a-cfba-fe843f4dbfcf	00190000-561c-d31c-ac0e-b5b841c70817	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561c-d31c-119e-67e184c752c4
000e0000-561c-d31c-ff2b-718a79d8c912	\N	\N	00140000-561c-d31a-cfba-fe843f4dbfcf	00190000-561c-d31c-ac0e-b5b841c70817	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561c-d31c-119e-67e184c752c4
\.


--
-- TOC entry 3021 (class 0 OID 21746554)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561c-d31c-9f44-bd995f402179	000e0000-561c-d31c-e71d-8ab2c59c2449	\N	1	
00200000-561c-d31c-09fd-eca550dd908d	000e0000-561c-d31c-e71d-8ab2c59c2449	\N	2	
00200000-561c-d31c-b9a0-5c8821a12312	000e0000-561c-d31c-e71d-8ab2c59c2449	\N	3	
00200000-561c-d31c-8dc1-a7f633040920	000e0000-561c-d31c-e71d-8ab2c59c2449	\N	4	
00200000-561c-d31c-8c26-cb94df4280da	000e0000-561c-d31c-e71d-8ab2c59c2449	\N	5	
\.


--
-- TOC entry 3035 (class 0 OID 21746681)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 21746794)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561c-d31a-2e25-c18b46ec1748	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561c-d31a-de4d-379f33ff9c0b	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561c-d31a-2c56-8e040b622641	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561c-d31a-bafc-f74ba45bcc86	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561c-d31a-8014-aefc774b2387	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561c-d31a-d6b6-dbb9d762d038	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561c-d31a-9225-a1e683cc93d1	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561c-d31a-791d-94b9495a2871	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561c-d31a-f4af-7c5127d07130	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561c-d31a-55fc-6808881ffe62	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561c-d31a-76f5-581f67802261	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561c-d31a-8270-d018a3880089	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561c-d31a-8569-276cd7e6c6d5	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561c-d31a-7c58-8ef807b2d2ce	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561c-d31a-9734-0085c3560d6b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561c-d31a-1d4b-71a7771414fc	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561c-d31a-812e-c2f31e0012a3	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561c-d31a-9dc5-eec7938a587f	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561c-d31a-caa9-a2d35e08f015	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561c-d31a-8c54-8f46e8c88eb8	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561c-d31a-f4e2-642a9fb36704	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561c-d31a-876e-ec64f29fac23	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561c-d31a-e87b-e08bdc9f9043	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561c-d31a-9925-a06c171f2ff4	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561c-d31a-18a5-8d7bbd5374d7	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561c-d31a-db49-37aa908914d2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561c-d31a-41be-c84a0f90c734	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561c-d31a-d87d-5cb63d5d9cc4	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3064 (class 0 OID 21747145)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 21747117)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 21747157)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21746753)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-561c-d31c-8973-81b000e5f2cc	00090000-561c-d31c-8f91-516b40b1eb0b	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-d31c-cbeb-e2f2b08c8cf5	00090000-561c-d31c-12e3-230fc8f082c7	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-d31c-b446-54fbca8943b7	00090000-561c-d31c-28d4-90b2e46ad5a4	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-d31c-5913-3d27b374f780	00090000-561c-d31c-6fe8-b9382622d13c	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-d31c-37be-0079c046e59f	00090000-561c-d31c-d7a9-6a5d8b0e6ba0	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-d31c-9fdf-2649830cc1af	00090000-561c-d31c-1dbd-620a899b677b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3023 (class 0 OID 21746589)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 21746861)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561c-d31a-7eb4-11c4057b6dae	01	Drama	drama (SURS 01)
00140000-561c-d31a-6444-73338cfe6318	02	Opera	opera (SURS 02)
00140000-561c-d31a-b502-0557dd109f39	03	Balet	balet (SURS 03)
00140000-561c-d31a-b0de-1b316751258f	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561c-d31a-c5fa-f366cc9150ce	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561c-d31a-cfba-fe843f4dbfcf	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561c-d31a-9688-b83b527f5f27	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3041 (class 0 OID 21746743)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2528 (class 2606 OID 21746364)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 21746920)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 21746910)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 21746777)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21746819)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 21747197)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 21746578)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 21746599)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 21747115)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21746489)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 21746988)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21746739)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 21746552)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21746527)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 21746503)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 21746646)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 21747174)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 21747181)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2782 (class 2606 OID 21747205)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 21729918)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2640 (class 2606 OID 21746673)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 21746461)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 21746373)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 21746397)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21746353)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2519 (class 2606 OID 21746338)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21746679)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 21746715)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 21746856)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21746425)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 21746449)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 21747067)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 21746652)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21746439)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 21746540)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21746664)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21747076)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 21747084)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 21747054)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 21747096)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21746697)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21746637)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21746628)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 21746843)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 21746770)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 21746515)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 21746309)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 21746706)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 21746327)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2521 (class 2606 OID 21746347)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 21746724)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 21746659)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21746608)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 21746297)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21746285)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 21746279)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 21746790)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 21746406)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21746619)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 21746830)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 21747108)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 21746474)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 21746322)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 21746889)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 21746562)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 21746687)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 21746802)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 21747155)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 21747139)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 21747163)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 21746761)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 21746593)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 21746869)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 21746751)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 1259 OID 21746587)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2593 (class 1259 OID 21746588)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2594 (class 1259 OID 21746586)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2595 (class 1259 OID 21746585)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2596 (class 1259 OID 21746584)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2682 (class 1259 OID 21746791)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2683 (class 1259 OID 21746792)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2684 (class 1259 OID 21746793)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2768 (class 1259 OID 21747176)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2769 (class 1259 OID 21747175)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2542 (class 1259 OID 21746427)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2641 (class 1259 OID 21746680)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2755 (class 1259 OID 21747143)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2756 (class 1259 OID 21747142)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2757 (class 1259 OID 21747144)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2758 (class 1259 OID 21747141)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2759 (class 1259 OID 21747140)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2635 (class 1259 OID 21746666)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2636 (class 1259 OID 21746665)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2587 (class 1259 OID 21746563)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 21746740)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 21746742)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 21746741)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2567 (class 1259 OID 21746505)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2568 (class 1259 OID 21746504)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2746 (class 1259 OID 21747097)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2698 (class 1259 OID 21746858)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 21746859)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2700 (class 1259 OID 21746860)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2765 (class 1259 OID 21747164)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2707 (class 1259 OID 21746894)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2708 (class 1259 OID 21746891)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2709 (class 1259 OID 21746895)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2710 (class 1259 OID 21746893)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2711 (class 1259 OID 21746892)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2557 (class 1259 OID 21746476)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 21746475)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2533 (class 1259 OID 21746400)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 21746707)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 21746354)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2524 (class 1259 OID 21746355)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 21746727)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 21746726)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 21746725)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 21746541)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 21746542)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2503 (class 1259 OID 21746287)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2615 (class 1259 OID 21746632)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2616 (class 1259 OID 21746630)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2617 (class 1259 OID 21746629)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2618 (class 1259 OID 21746631)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 21746328)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2515 (class 1259 OID 21746329)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2644 (class 1259 OID 21746688)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2778 (class 1259 OID 21747198)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2680 (class 1259 OID 21746779)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2681 (class 1259 OID 21746778)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2779 (class 1259 OID 21747206)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2780 (class 1259 OID 21747207)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2630 (class 1259 OID 21746653)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 21746771)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 21746772)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 21746993)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2729 (class 1259 OID 21746992)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2730 (class 1259 OID 21746989)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2731 (class 1259 OID 21746990)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2732 (class 1259 OID 21746991)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2546 (class 1259 OID 21746441)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 21746440)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2548 (class 1259 OID 21746442)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2647 (class 1259 OID 21746701)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2648 (class 1259 OID 21746700)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2738 (class 1259 OID 21747077)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 21747078)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2721 (class 1259 OID 21746924)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2722 (class 1259 OID 21746925)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2723 (class 1259 OID 21746922)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2724 (class 1259 OID 21746923)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 21746762)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 21746641)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2622 (class 1259 OID 21746640)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2623 (class 1259 OID 21746638)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2624 (class 1259 OID 21746639)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2717 (class 1259 OID 21746912)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 21746911)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2571 (class 1259 OID 21746516)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2574 (class 1259 OID 21746530)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2575 (class 1259 OID 21746529)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2576 (class 1259 OID 21746528)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2577 (class 1259 OID 21746531)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2586 (class 1259 OID 21746553)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 21747068)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2754 (class 1259 OID 21747116)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2772 (class 1259 OID 21747182)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2773 (class 1259 OID 21747183)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2529 (class 1259 OID 21746375)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2530 (class 1259 OID 21746374)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2538 (class 1259 OID 21746407)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 21746408)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2602 (class 1259 OID 21746594)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2610 (class 1259 OID 21746622)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2611 (class 1259 OID 21746621)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2612 (class 1259 OID 21746620)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2597 (class 1259 OID 21746580)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2598 (class 1259 OID 21746581)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2599 (class 1259 OID 21746579)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2600 (class 1259 OID 21746583)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2601 (class 1259 OID 21746582)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2545 (class 1259 OID 21746426)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 21746490)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 21746492)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2565 (class 1259 OID 21746491)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2566 (class 1259 OID 21746493)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2629 (class 1259 OID 21746647)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2703 (class 1259 OID 21746857)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 21746890)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 21746831)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2695 (class 1259 OID 21746832)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2536 (class 1259 OID 21746398)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21746399)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 21746752)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 21746298)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 21746462)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2506 (class 1259 OID 21746286)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2751 (class 1259 OID 21747109)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2651 (class 1259 OID 21746699)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 21746698)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2725 (class 1259 OID 21746921)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2553 (class 1259 OID 21746450)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 21746870)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2762 (class 1259 OID 21747156)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2744 (class 1259 OID 21747085)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 21747086)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2691 (class 1259 OID 21746820)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2609 (class 1259 OID 21746609)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2522 (class 1259 OID 21746348)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2813 (class 2606 OID 21747338)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2812 (class 2606 OID 21747343)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2808 (class 2606 OID 21747363)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2814 (class 2606 OID 21747333)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2810 (class 2606 OID 21747353)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2809 (class 2606 OID 21747358)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2811 (class 2606 OID 21747348)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2849 (class 2606 OID 21747528)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2848 (class 2606 OID 21747533)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 21747538)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2881 (class 2606 OID 21747703)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2882 (class 2606 OID 21747698)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 21747263)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 21747448)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2876 (class 2606 OID 21747683)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 21747678)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2875 (class 2606 OID 21747688)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 21747673)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2879 (class 2606 OID 21747668)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2829 (class 2606 OID 21747443)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2830 (class 2606 OID 21747438)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2807 (class 2606 OID 21747328)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2841 (class 2606 OID 21747488)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2839 (class 2606 OID 21747498)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2840 (class 2606 OID 21747493)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2800 (class 2606 OID 21747298)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2801 (class 2606 OID 21747293)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2827 (class 2606 OID 21747428)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 21747658)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2852 (class 2606 OID 21747543)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2851 (class 2606 OID 21747548)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2850 (class 2606 OID 21747553)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2880 (class 2606 OID 21747693)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2854 (class 2606 OID 21747573)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2857 (class 2606 OID 21747558)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2853 (class 2606 OID 21747578)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2855 (class 2606 OID 21747568)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2856 (class 2606 OID 21747563)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2798 (class 2606 OID 21747288)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2799 (class 2606 OID 21747283)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 21747248)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2791 (class 2606 OID 21747243)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2835 (class 2606 OID 21747468)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2787 (class 2606 OID 21747223)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2786 (class 2606 OID 21747228)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2836 (class 2606 OID 21747483)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2837 (class 2606 OID 21747478)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2838 (class 2606 OID 21747473)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2805 (class 2606 OID 21747313)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 21747318)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2783 (class 2606 OID 21747208)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2819 (class 2606 OID 21747403)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2821 (class 2606 OID 21747393)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2822 (class 2606 OID 21747388)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2820 (class 2606 OID 21747398)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2785 (class 2606 OID 21747213)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 21747218)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2832 (class 2606 OID 21747453)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2885 (class 2606 OID 21747718)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 21747523)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2846 (class 2606 OID 21747518)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2887 (class 2606 OID 21747723)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2886 (class 2606 OID 21747728)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 21747433)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2844 (class 2606 OID 21747508)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2843 (class 2606 OID 21747513)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2864 (class 2606 OID 21747633)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2865 (class 2606 OID 21747628)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2868 (class 2606 OID 21747613)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2867 (class 2606 OID 21747618)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2866 (class 2606 OID 21747623)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2796 (class 2606 OID 21747273)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2797 (class 2606 OID 21747268)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2795 (class 2606 OID 21747278)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2833 (class 2606 OID 21747463)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2834 (class 2606 OID 21747458)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 21747643)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2870 (class 2606 OID 21747648)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2861 (class 2606 OID 21747603)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2860 (class 2606 OID 21747608)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2863 (class 2606 OID 21747593)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2862 (class 2606 OID 21747598)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2842 (class 2606 OID 21747503)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2823 (class 2606 OID 21747423)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2824 (class 2606 OID 21747418)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2826 (class 2606 OID 21747408)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2825 (class 2606 OID 21747413)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2858 (class 2606 OID 21747588)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2859 (class 2606 OID 21747583)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2802 (class 2606 OID 21747303)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2803 (class 2606 OID 21747308)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 21747323)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2869 (class 2606 OID 21747638)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2872 (class 2606 OID 21747653)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2874 (class 2606 OID 21747663)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2884 (class 2606 OID 21747708)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2883 (class 2606 OID 21747713)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2788 (class 2606 OID 21747238)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 21747233)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2793 (class 2606 OID 21747253)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 21747258)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2815 (class 2606 OID 21747368)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2816 (class 2606 OID 21747383)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 21747378)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2818 (class 2606 OID 21747373)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-13 11:47:11 CEST

--
-- PostgreSQL database dump complete
--

