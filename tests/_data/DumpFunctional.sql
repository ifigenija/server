--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-13 15:22:19 CEST

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
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21893061)
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
-- TOC entry 230 (class 1259 OID 21893628)
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
-- TOC entry 229 (class 1259 OID 21893611)
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
-- TOC entry 220 (class 1259 OID 21893488)
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
-- TOC entry 223 (class 1259 OID 21893518)
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
-- TOC entry 244 (class 1259 OID 21893899)
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
-- TOC entry 198 (class 1259 OID 21893279)
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
-- TOC entry 200 (class 1259 OID 21893310)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 21893825)
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
-- TOC entry 191 (class 1259 OID 21893192)
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
-- TOC entry 231 (class 1259 OID 21893641)
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
-- TOC entry 216 (class 1259 OID 21893443)
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
-- TOC entry 196 (class 1259 OID 21893258)
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
-- TOC entry 194 (class 1259 OID 21893232)
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
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 192 (class 1259 OID 21893209)
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
-- TOC entry 205 (class 1259 OID 21893357)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 21893880)
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
-- TOC entry 243 (class 1259 OID 21893892)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 21893914)
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
-- TOC entry 209 (class 1259 OID 21893382)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 21893166)
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
-- TOC entry 183 (class 1259 OID 21893079)
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
-- TOC entry 184 (class 1259 OID 21893090)
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
-- TOC entry 178 (class 1259 OID 21893035)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21893054)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 21893389)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 21893423)
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
-- TOC entry 226 (class 1259 OID 21893559)
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
-- TOC entry 186 (class 1259 OID 21893123)
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
-- TOC entry 188 (class 1259 OID 21893158)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 21893770)
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
-- TOC entry 206 (class 1259 OID 21893363)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 21893143)
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
-- TOC entry 195 (class 1259 OID 21893247)
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
-- TOC entry 208 (class 1259 OID 21893375)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 21893784)
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
-- TOC entry 235 (class 1259 OID 21893794)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21893709)
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
-- TOC entry 236 (class 1259 OID 21893802)
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
-- TOC entry 212 (class 1259 OID 21893404)
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
-- TOC entry 204 (class 1259 OID 21893348)
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
-- TOC entry 203 (class 1259 OID 21893338)
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
-- TOC entry 225 (class 1259 OID 21893548)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 21893478)
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
-- TOC entry 193 (class 1259 OID 21893221)
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
-- TOC entry 175 (class 1259 OID 21893006)
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
-- TOC entry 174 (class 1259 OID 21893004)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 21893417)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21893044)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21893028)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 21893431)
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
-- TOC entry 207 (class 1259 OID 21893369)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 21893315)
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
-- TOC entry 173 (class 1259 OID 21892993)
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
-- TOC entry 172 (class 1259 OID 21892985)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21892980)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 221 (class 1259 OID 21893495)
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
-- TOC entry 185 (class 1259 OID 21893115)
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
-- TOC entry 202 (class 1259 OID 21893325)
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
-- TOC entry 224 (class 1259 OID 21893536)
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
-- TOC entry 182 (class 1259 OID 21893070)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    sort integer
);


--
-- TOC entry 237 (class 1259 OID 21893813)
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
-- TOC entry 190 (class 1259 OID 21893178)
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
-- TOC entry 176 (class 1259 OID 21893015)
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
-- TOC entry 228 (class 1259 OID 21893586)
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
-- TOC entry 197 (class 1259 OID 21893269)
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
-- TOC entry 211 (class 1259 OID 21893396)
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
-- TOC entry 222 (class 1259 OID 21893509)
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
-- TOC entry 240 (class 1259 OID 21893860)
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
-- TOC entry 239 (class 1259 OID 21893832)
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
-- TOC entry 241 (class 1259 OID 21893872)
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
-- TOC entry 218 (class 1259 OID 21893468)
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
-- TOC entry 199 (class 1259 OID 21893304)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 227 (class 1259 OID 21893576)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 21893458)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2206 (class 2604 OID 21893009)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3016 (class 0 OID 21893061)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 21893628)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561d-0589-ec0d-6019cb3f66af	000d0000-561d-0588-133e-da50ada1f6cd	\N	00090000-561d-0588-7bfe-1b28bb906e48	000b0000-561d-0588-4d6c-b0f06847e629	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561d-0589-aa86-6abf2801c17e	000d0000-561d-0588-616a-9d0dba76b59c	00100000-561d-0588-fee0-49b69bd8b89c	00090000-561d-0588-3a23-fc269ef18f98	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561d-0589-a5e2-932969925682	000d0000-561d-0589-b433-5b178f53b960	00100000-561d-0588-4bdd-8b7f444ea43b	00090000-561d-0588-ed82-f007b41da912	\N	0003	t	\N	2015-10-13	\N	2	t	\N	f	f
000c0000-561d-0589-2d5c-01089d52f38a	000d0000-561d-0589-8ab6-1152c7c9ca1f	\N	00090000-561d-0588-da5f-6bc838f53abf	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561d-0589-9c29-616bdb34ae0d	000d0000-561d-0589-3575-07e35dd12406	\N	00090000-561d-0588-3dd9-0f17c9555839	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561d-0589-abbc-5462fc46b6f4	000d0000-561d-0589-e0fc-1bcb4eb9938a	\N	00090000-561d-0588-3ebd-99c51b8687d1	000b0000-561d-0588-3e28-e57ff491e466	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561d-0589-e893-6c6ad26d1e36	000d0000-561d-0588-e0e2-afedf03ffacb	00100000-561d-0588-308f-1fd82a6092fb	00090000-561d-0588-83ac-1e0f6f5c2212	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561d-0589-17af-934c9c0b4cfe	000d0000-561d-0589-0a7f-ab0fc7e16ceb	\N	00090000-561d-0588-176f-b1263516c899	000b0000-561d-0588-bd73-05161f8cfd61	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561d-0589-8e7c-2caba0bccd11	000d0000-561d-0588-e0e2-afedf03ffacb	00100000-561d-0588-e753-2dadd72456a0	00090000-561d-0588-2008-b44879bd94fe	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561d-0589-2b3c-dbc9613e0c6b	000d0000-561d-0588-e0e2-afedf03ffacb	00100000-561d-0588-d5e5-ef999536d4ec	00090000-561d-0588-b709-9e1d02f850a2	\N	0010	t	\N	2015-10-13	\N	16	f	\N	f	t
000c0000-561d-0589-b6cd-60aa6acbd904	000d0000-561d-0588-e0e2-afedf03ffacb	00100000-561d-0588-09c0-a22c3aaa9859	00090000-561d-0588-b6a1-5a01fec0e1ac	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561d-0589-dc98-8e1f933fa5e6	000d0000-561d-0589-ffbc-f1df74041c8a	\N	00090000-561d-0588-3a23-fc269ef18f98	000b0000-561d-0588-7518-64861618c1a7	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3064 (class 0 OID 21893611)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 21893488)
-- Dependencies: 220
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561d-0588-b7f2-de7489731b21	00160000-561d-0588-0163-a27c573caf9e	00090000-561d-0588-023f-d924c3deb100	aizv	10	t
003d0000-561d-0588-ca92-b25de85a8a17	00160000-561d-0588-0163-a27c573caf9e	00090000-561d-0588-dfd8-2851b79de154	apri	14	t
003d0000-561d-0588-c715-ba9cfdfe1c50	00160000-561d-0588-65b1-364bc397395f	00090000-561d-0588-498f-0c9dc64ea1db	aizv	11	t
003d0000-561d-0588-a5db-3ab784c2de72	00160000-561d-0588-e834-4d9d9f9a4f84	00090000-561d-0588-cc34-e7962c4f53f8	aizv	12	t
003d0000-561d-0588-daba-5add40419216	00160000-561d-0588-0163-a27c573caf9e	00090000-561d-0588-598e-10338c723fd9	apri	18	f
\.


--
-- TOC entry 3058 (class 0 OID 21893518)
-- Dependencies: 223
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561d-0588-0163-a27c573caf9e	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561d-0588-65b1-364bc397395f	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561d-0588-e834-4d9d9f9a4f84	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3079 (class 0 OID 21893899)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 21893279)
-- Dependencies: 198
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561d-0589-bc49-616bed5d9c2f	\N	\N	00200000-561d-0589-8b63-12f43548d635	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561d-0589-735f-a6ec128a904b	\N	\N	00200000-561d-0589-a104-14aac5ceeeb6	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561d-0589-613a-8ab61afed284	\N	\N	00200000-561d-0589-1043-59246a398d08	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561d-0589-1c57-2a8e5dbd01ad	\N	\N	00200000-561d-0589-b91d-8d3bbad1cee6	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561d-0589-d74e-044c5b72bd17	\N	\N	00200000-561d-0589-369f-a8cfe1851e63	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3035 (class 0 OID 21893310)
-- Dependencies: 200
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 21893825)
-- Dependencies: 238
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21893192)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561d-0585-cf6b-72175d1084a4	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561d-0585-57ff-d31eace8104b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561d-0585-5519-29465b7c7e6b	AL	ALB	008	Albania 	Albanija	\N
00040000-561d-0585-da9f-6c9165e1aa30	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561d-0585-e0ea-f9d4fb191e54	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561d-0585-da7d-1c666c6f1837	AD	AND	020	Andorra 	Andora	\N
00040000-561d-0585-7eab-837d7ccec0fb	AO	AGO	024	Angola 	Angola	\N
00040000-561d-0585-3683-e20c98283737	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561d-0585-e3ae-e9c7e0728d4c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561d-0585-39b7-250580f4b579	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561d-0585-05ed-b25a9295226b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561d-0585-390f-c3c8aff442c3	AM	ARM	051	Armenia 	Armenija	\N
00040000-561d-0585-15d2-1ea235a9ae94	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561d-0585-4607-463566aa9038	AU	AUS	036	Australia 	Avstralija	\N
00040000-561d-0586-e470-7857ed895e5a	AT	AUT	040	Austria 	Avstrija	\N
00040000-561d-0586-b1fc-559c5cc163e7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561d-0586-6c11-315841ac778c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561d-0586-c414-0e14879671e1	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561d-0586-3a57-0492b0d85714	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561d-0586-2ff9-16b9f53a911c	BB	BRB	052	Barbados 	Barbados	\N
00040000-561d-0586-95a2-80469dcd4a82	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561d-0586-4794-7dfae8153c0d	BE	BEL	056	Belgium 	Belgija	\N
00040000-561d-0586-896c-12f1ee05247a	BZ	BLZ	084	Belize 	Belize	\N
00040000-561d-0586-7cbb-8e93512568c7	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561d-0586-aa2d-1cbc9b528c52	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561d-0586-5965-44a263adf64e	BT	BTN	064	Bhutan 	Butan	\N
00040000-561d-0586-3f07-39f3ef2054f5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561d-0586-339f-61f43c1f5e56	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561d-0586-ef43-e02b70224e85	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561d-0586-7f47-e696a0efc369	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561d-0586-478e-352188a07420	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561d-0586-87f1-510b30bff9f1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561d-0586-b633-d93f34561efc	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561d-0586-45dc-2352f32df2df	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561d-0586-c424-6899bcfa1ab4	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561d-0586-172d-fef6f126b53c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561d-0586-1372-b707838407bb	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561d-0586-b9c2-da175218d361	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561d-0586-0583-33ca115197b2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561d-0586-457d-ca3e094d9f80	CA	CAN	124	Canada 	Kanada	\N
00040000-561d-0586-b384-682a5764ad88	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561d-0586-b3a6-e98df36da102	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561d-0586-e0d8-3c2b696c1fb2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561d-0586-7bfb-27a0b2a85216	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561d-0586-8009-21b648c5dbd1	CL	CHL	152	Chile 	Čile	\N
00040000-561d-0586-25fb-34e958da6966	CN	CHN	156	China 	Kitajska	\N
00040000-561d-0586-ce2c-a6331c9a7442	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561d-0586-c728-51404d4aff06	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561d-0586-ddc0-14ad2149f32d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561d-0586-0318-4b32701015ef	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561d-0586-acaa-7595e652b580	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561d-0586-ae26-79b2529f57f7	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561d-0586-0b2e-3c2cdfbf9565	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561d-0586-8bad-a562f58e98fa	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561d-0586-5558-882cda30ef7f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561d-0586-b9a9-81cb6028c5ad	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561d-0586-d4b0-99a7132f1373	CU	CUB	192	Cuba 	Kuba	\N
00040000-561d-0586-6cc7-f429235626a7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561d-0586-60ab-f48e7c02cb26	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561d-0586-81ba-93f7f32e6675	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561d-0586-117f-7d1554535951	DK	DNK	208	Denmark 	Danska	\N
00040000-561d-0586-e52a-159909d456df	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561d-0586-c0c1-481790f4604b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561d-0586-2e0a-6c9994ce3d28	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561d-0586-a6da-4966a4af3a4e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561d-0586-bfe0-88b0a1289d1b	EG	EGY	818	Egypt 	Egipt	\N
00040000-561d-0586-489b-7d05d3a9bb88	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561d-0586-2e96-838475c99dce	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561d-0586-8ebe-d85f46a16c22	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561d-0586-d72b-c4d7a7a75a2e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561d-0586-a48b-dbeef5a981a7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561d-0586-6ca1-d5e5ca18ba9c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561d-0586-a452-7ce1ab010673	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561d-0586-55a1-2e2f2a51b056	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561d-0586-00db-bc3c4ac05c79	FI	FIN	246	Finland 	Finska	\N
00040000-561d-0586-bb02-5e330bca2508	FR	FRA	250	France 	Francija	\N
00040000-561d-0586-854d-f5fbaa5f0393	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561d-0586-c723-0de31712e086	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561d-0586-2a4e-038808b4731d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561d-0586-f336-a23dd5025828	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561d-0586-e051-4c5b58182b68	GA	GAB	266	Gabon 	Gabon	\N
00040000-561d-0586-99da-3075fe82cc1a	GM	GMB	270	Gambia 	Gambija	\N
00040000-561d-0586-d170-5779852b28e3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561d-0586-93cc-fcb52d0f726c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561d-0586-7028-1c5da5f0ebe8	GH	GHA	288	Ghana 	Gana	\N
00040000-561d-0586-4ab3-4af818decfd9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561d-0586-92f2-80829fb6e052	GR	GRC	300	Greece 	Grčija	\N
00040000-561d-0586-5d7a-61ec30cc810c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561d-0586-09a4-88d543265983	GD	GRD	308	Grenada 	Grenada	\N
00040000-561d-0586-1fde-bad9e131683c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561d-0586-feb7-476ecfb0fbc2	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561d-0586-9ff4-b6cf5468a854	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561d-0586-1aa3-01c0a93803e8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561d-0586-c63c-64bf1d2389eb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561d-0586-639e-b6346811756a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561d-0586-c09e-1176d0b22e84	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561d-0586-c103-a9cd75c10919	HT	HTI	332	Haiti 	Haiti	\N
00040000-561d-0586-00b5-0d07a5f78aad	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561d-0586-739a-c8a4a8abba34	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561d-0586-8206-d288eeded213	HN	HND	340	Honduras 	Honduras	\N
00040000-561d-0586-151f-2c857df3d665	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561d-0586-5971-0465c586798e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561d-0586-bdc6-2a8bdd3b80f5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561d-0586-5e59-9313708fe625	IN	IND	356	India 	Indija	\N
00040000-561d-0586-c664-356bbd21cba0	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561d-0586-407b-8a1456ef4a98	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561d-0586-b68e-c0b2acaabe8c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561d-0586-4a50-f00fd52cb9ec	IE	IRL	372	Ireland 	Irska	\N
00040000-561d-0586-9391-fab01588a379	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561d-0586-110f-fde9754f1b2e	IL	ISR	376	Israel 	Izrael	\N
00040000-561d-0586-531e-f0e9f6ce64a9	IT	ITA	380	Italy 	Italija	\N
00040000-561d-0586-09fc-c901ff7eb2a9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561d-0586-94e6-cbaf523d9bc5	JP	JPN	392	Japan 	Japonska	\N
00040000-561d-0586-43b3-67a7dd002e02	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561d-0586-41d1-623c4f5e90f7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561d-0586-8e93-17953564ae03	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561d-0586-c790-79cbbc69384f	KE	KEN	404	Kenya 	Kenija	\N
00040000-561d-0586-10e8-e36eea4d1462	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561d-0586-1da0-2099dea06240	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561d-0586-4848-5a7563cbde71	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561d-0586-3121-45cc77d6fd43	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561d-0586-e61d-0c6c1b9a34cd	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561d-0586-cff3-884816f7e45c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561d-0586-a901-e10edb967665	LV	LVA	428	Latvia 	Latvija	\N
00040000-561d-0586-3567-09e2257bd4d8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561d-0586-1267-5c19c2afa035	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561d-0586-a34c-8118ec6f9cd4	LR	LBR	430	Liberia 	Liberija	\N
00040000-561d-0586-dcb6-ed24f9c44e0b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561d-0586-6dac-6e184a93b81e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561d-0586-2937-3f4a638480fc	LT	LTU	440	Lithuania 	Litva	\N
00040000-561d-0586-6955-0ad645133751	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561d-0586-b341-fec0e07a54bf	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561d-0586-f5f8-25cd6eb9ee39	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561d-0586-69ef-a033f032efe3	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561d-0586-38d1-188d6baea554	MW	MWI	454	Malawi 	Malavi	\N
00040000-561d-0586-9c37-fe8ed0e91f6d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561d-0586-877a-a1d16d123781	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561d-0586-4754-19c428fccc7b	ML	MLI	466	Mali 	Mali	\N
00040000-561d-0586-cdc7-076c6076ebe3	MT	MLT	470	Malta 	Malta	\N
00040000-561d-0586-7347-19f44a6e3e89	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561d-0586-8312-61623f52a601	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561d-0586-ce1d-27d1370bbf23	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561d-0586-6811-3768b6adaaf9	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561d-0586-19d3-9f22130fd08c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561d-0586-24bb-10c4ac764a11	MX	MEX	484	Mexico 	Mehika	\N
00040000-561d-0586-d39e-0056681601ee	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561d-0586-318d-a115df3673bb	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561d-0586-4be7-36838893326d	MC	MCO	492	Monaco 	Monako	\N
00040000-561d-0586-9523-8b3f2c3bc471	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561d-0586-2d8a-9650b920dd00	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561d-0586-ef79-5123259b1c74	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561d-0586-609f-db9b9daf1479	MA	MAR	504	Morocco 	Maroko	\N
00040000-561d-0586-e0e5-8f7b80cb3bca	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561d-0586-74d8-f01428d7b7fb	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561d-0586-a727-27868e675cad	NA	NAM	516	Namibia 	Namibija	\N
00040000-561d-0586-7b45-4775c2c93457	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561d-0586-c5a2-ea03952eded2	NP	NPL	524	Nepal 	Nepal	\N
00040000-561d-0586-4c35-f988bd519b00	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561d-0586-1ba1-563a8e528e4b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561d-0586-9f9a-7c7379c3ac31	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561d-0586-fd0d-8ebdc8d9f205	NE	NER	562	Niger 	Niger 	\N
00040000-561d-0586-3c26-634b7b3a6a3b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561d-0586-af16-ef281e6d6703	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561d-0586-14dc-09c5158d9563	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561d-0586-abf7-49a5afdb2bbd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561d-0586-2321-ed058ec6b5f4	NO	NOR	578	Norway 	Norveška	\N
00040000-561d-0586-6070-b68197e9fd9f	OM	OMN	512	Oman 	Oman	\N
00040000-561d-0586-6af0-6a76641cb2af	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561d-0586-2548-9207dba380d6	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561d-0586-3c75-dc98eaadea19	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561d-0586-01b4-90a3c381a238	PA	PAN	591	Panama 	Panama	\N
00040000-561d-0586-e11b-5117c3b3084c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561d-0586-f236-e6284160fda0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561d-0586-10e5-46f93d3a98dd	PE	PER	604	Peru 	Peru	\N
00040000-561d-0586-93a4-ae49dace086d	PH	PHL	608	Philippines 	Filipini	\N
00040000-561d-0586-cd8a-1715a7992a64	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561d-0586-2182-3c6c379d6ff2	PL	POL	616	Poland 	Poljska	\N
00040000-561d-0586-6537-39253eaa7777	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561d-0586-e56a-5c5289212e08	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561d-0586-35d2-bbd3974ff02d	QA	QAT	634	Qatar 	Katar	\N
00040000-561d-0586-0982-c0b4dd03209e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561d-0586-ad8d-37ea51323d5e	RO	ROU	642	Romania 	Romunija	\N
00040000-561d-0586-87dc-a7d7eb7c0546	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561d-0586-6937-07bcff0d8631	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561d-0586-2040-d7d9803dfe29	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561d-0586-db34-1b2e65a7fb51	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561d-0586-898e-71165a84aa5e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561d-0586-78ab-95897d1caf5f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561d-0586-b5ec-3a5c3aee74fa	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561d-0586-b9f4-be64e4314ed4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561d-0586-8a76-17065e94181a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561d-0586-17df-042df04fcf15	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561d-0586-0888-4d42eb5ef5f9	SM	SMR	674	San Marino 	San Marino	\N
00040000-561d-0586-a713-563ecec9027f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561d-0586-66c2-803363e44bfb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561d-0586-0229-255213d40380	SN	SEN	686	Senegal 	Senegal	\N
00040000-561d-0586-9c8a-0e4d2699e53a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561d-0586-06f6-4770540b1918	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561d-0586-f9e8-4d702ff189f9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561d-0586-fd09-d6acce241365	SG	SGP	702	Singapore 	Singapur	\N
00040000-561d-0586-a7a3-519de79657b8	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561d-0586-cf58-0b590a0509ff	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561d-0586-2561-bad64c0ebe54	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561d-0586-7089-109af55972c7	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561d-0586-95cc-811c882703f8	SO	SOM	706	Somalia 	Somalija	\N
00040000-561d-0586-0df7-9b51db93c2e4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561d-0586-1971-381ee1a329f7	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561d-0586-af62-4c774f8db966	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561d-0586-8105-9662c7ee52e5	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561d-0586-2f01-82eeba9a817e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561d-0586-5772-1db8cf194b5f	SD	SDN	729	Sudan 	Sudan	\N
00040000-561d-0586-c7c5-ccdf42f6396a	SR	SUR	740	Suriname 	Surinam	\N
00040000-561d-0586-2f00-9f221da7c988	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561d-0586-ea29-ad5fc9d616af	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561d-0586-a857-1b23d3118023	SE	SWE	752	Sweden 	Švedska	\N
00040000-561d-0586-f9f5-fa36a89e109b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561d-0586-f3d3-ff2e3fa5aaff	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561d-0586-045d-9656db8124ec	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561d-0586-e3d3-2ae19381de15	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561d-0586-30fe-3ad581a5b8cd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561d-0586-247e-23f6b5fdc7aa	TH	THA	764	Thailand 	Tajska	\N
00040000-561d-0586-c9bd-26735063077b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561d-0586-6fc8-99baec0b0f14	TG	TGO	768	Togo 	Togo	\N
00040000-561d-0586-1f90-aa8a5e5b6ffe	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561d-0586-bca2-6ad2612c315c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561d-0586-e079-6e83771e816e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561d-0586-bcad-b05ce804fedf	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561d-0586-9589-73f7b79e48e4	TR	TUR	792	Turkey 	Turčija	\N
00040000-561d-0586-43cb-af76bbd47ebe	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561d-0586-dfa2-c41b2a0f3518	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561d-0586-1f23-12433402ec02	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561d-0586-e83b-43ed3cc12b5f	UG	UGA	800	Uganda 	Uganda	\N
00040000-561d-0586-18d1-fd06ce223423	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561d-0586-5f52-5f20fc36eaec	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561d-0586-af46-4eff9761a7ab	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561d-0586-d7ca-12786e6870b3	US	USA	840	United States 	Združene države Amerike	\N
00040000-561d-0586-2e44-cda4c16a490d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561d-0586-ddf3-137824460c10	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561d-0586-2503-5ff5dde763cb	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561d-0586-f42d-ef1aa2e77d4e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561d-0586-6fcd-37057138eedf	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561d-0586-d81b-28e872c30a58	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561d-0586-c9a5-d34acd76575f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561d-0586-152e-912eb799f137	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561d-0586-19f1-e5f5c69e722f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561d-0586-d9b3-edabb4f155f3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561d-0586-f47f-15bd12928411	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561d-0586-09cd-bae11de8027f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561d-0586-db78-cf760ef35948	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3066 (class 0 OID 21893641)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561d-0589-eb61-5425b08d1070	000e0000-561d-0588-d096-7d0dec3bd1fb	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561d-0585-aa45-fad9c557f218	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561d-0589-b28d-8a891bdc54f4	000e0000-561d-0588-b511-533770fa07e9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561d-0585-49c3-932f989bb39b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561d-0589-1588-60a1ac0557bd	000e0000-561d-0588-6741-7c22439d9ddd	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561d-0585-aa45-fad9c557f218	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561d-0589-d5c4-8dc4f793a1e8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561d-0589-5792-734e473edddc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3051 (class 0 OID 21893443)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561d-0588-133e-da50ada1f6cd	000e0000-561d-0588-b511-533770fa07e9	000c0000-561d-0589-ec0d-6019cb3f66af	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561d-0585-84a5-eff3197171a7
000d0000-561d-0588-616a-9d0dba76b59c	000e0000-561d-0588-b511-533770fa07e9	000c0000-561d-0589-aa86-6abf2801c17e	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561d-0585-0889-913dd4ba2244
000d0000-561d-0589-b433-5b178f53b960	000e0000-561d-0588-b511-533770fa07e9	000c0000-561d-0589-a5e2-932969925682	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561d-0585-0f8c-45db3510db94
000d0000-561d-0589-8ab6-1152c7c9ca1f	000e0000-561d-0588-b511-533770fa07e9	000c0000-561d-0589-2d5c-01089d52f38a	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561d-0585-e420-89bef4315a3c
000d0000-561d-0589-3575-07e35dd12406	000e0000-561d-0588-b511-533770fa07e9	000c0000-561d-0589-9c29-616bdb34ae0d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561d-0585-e420-89bef4315a3c
000d0000-561d-0589-e0fc-1bcb4eb9938a	000e0000-561d-0588-b511-533770fa07e9	000c0000-561d-0589-abbc-5462fc46b6f4	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561d-0585-84a5-eff3197171a7
000d0000-561d-0588-e0e2-afedf03ffacb	000e0000-561d-0588-b511-533770fa07e9	000c0000-561d-0589-8e7c-2caba0bccd11	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561d-0585-84a5-eff3197171a7
000d0000-561d-0589-0a7f-ab0fc7e16ceb	000e0000-561d-0588-b511-533770fa07e9	000c0000-561d-0589-17af-934c9c0b4cfe	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561d-0585-b6e3-62934b4670f6
000d0000-561d-0589-ffbc-f1df74041c8a	000e0000-561d-0588-b511-533770fa07e9	000c0000-561d-0589-dc98-8e1f933fa5e6	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561d-0585-c659-0d7b9409d8b4
\.


--
-- TOC entry 3031 (class 0 OID 21893258)
-- Dependencies: 196
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 21893232)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 21893209)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561d-0588-7501-710c3d9f82a5	00080000-561d-0588-2f7d-ff5c51564e16	00090000-561d-0588-b709-9e1d02f850a2	AK		igralka
\.


--
-- TOC entry 3040 (class 0 OID 21893357)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 21893880)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 21893892)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 21893914)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21729914)
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
-- TOC entry 3044 (class 0 OID 21893382)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21893166)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561d-0586-49b8-d096ad3011a6	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561d-0586-8802-d5368181b6a0	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561d-0586-ce78-30cb12d10127	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561d-0586-c8a3-74efe079b78b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561d-0586-0270-003760586474	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561d-0586-ac27-8be147e4ad7a	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561d-0586-dbec-51c46f0f743a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561d-0586-5ce1-53b427afc657	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561d-0586-1a37-31702de69ea5	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561d-0586-bf79-c2d40faaa8df	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561d-0586-bff4-09f20c77a772	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561d-0586-877a-c85eed4c2524	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561d-0586-1354-722cb12d0d9e	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561d-0586-21c6-525e580afe92	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561d-0586-c251-5698ee310bca	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561d-0588-67a2-787bc137f0c6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561d-0588-1b0f-3c63d368d221	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561d-0588-8749-15cd13d34d34	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561d-0588-540f-ffcf353cb659	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561d-0588-3d0b-c9fe3fb36012	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561d-058a-f594-1706a466b969	application.tenant.maticnopodjetje	string	s:36:"00080000-561d-058a-59f8-90d07a764164";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3018 (class 0 OID 21893079)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561d-0588-79a0-340394ba62aa	00000000-561d-0588-67a2-787bc137f0c6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561d-0588-2a09-d55e226bd7fe	00000000-561d-0588-67a2-787bc137f0c6	00010000-561d-0586-e61a-c41500bfba07	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561d-0588-646d-8d48d76ef67e	00000000-561d-0588-1b0f-3c63d368d221	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3019 (class 0 OID 21893090)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561d-0588-7bfe-1b28bb906e48	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561d-0588-da5f-6bc838f53abf	00010000-561d-0588-7047-833a5c4a24e3	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561d-0588-ed82-f007b41da912	00010000-561d-0588-2535-508d0a151bcc	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561d-0588-2008-b44879bd94fe	00010000-561d-0588-fbfc-25cc8b73753e	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561d-0588-14f3-55fee3df916d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561d-0588-3ebd-99c51b8687d1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561d-0588-b6a1-5a01fec0e1ac	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561d-0588-83ac-1e0f6f5c2212	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561d-0588-b709-9e1d02f850a2	00010000-561d-0588-3545-04459781ffba	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561d-0588-3a23-fc269ef18f98	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561d-0588-2036-e2cadfc85a03	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561d-0588-3dd9-0f17c9555839	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561d-0588-176f-b1263516c899	00010000-561d-0588-ea87-724c2e24bbd0	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561d-0588-023f-d924c3deb100	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561d-0588-dfd8-2851b79de154	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561d-0588-498f-0c9dc64ea1db	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561d-0588-cc34-e7962c4f53f8	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561d-0588-598e-10338c723fd9	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3013 (class 0 OID 21893035)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561d-0586-316f-69da25f0c9f2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561d-0586-a42e-cce7e4079289	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561d-0586-0f97-6bb9da4fbbe4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561d-0586-de3a-c03d05ad1788	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561d-0586-95bc-d39d8d181f24	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561d-0586-459a-6e1b41391c9d	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561d-0586-dbe9-fb17cfd49ff1	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561d-0586-80b2-8394b05b3862	Abonma-read	Abonma - branje	f
00030000-561d-0586-830f-009f59e4609d	Abonma-write	Abonma - spreminjanje	f
00030000-561d-0586-e585-af44bedaae9c	Alternacija-read	Alternacija - branje	f
00030000-561d-0586-a714-9ca6c6c4d8e1	Alternacija-write	Alternacija - spreminjanje	f
00030000-561d-0586-7ce7-3227e71115f6	Arhivalija-read	Arhivalija - branje	f
00030000-561d-0586-160e-0302a771afa5	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561d-0586-0d26-a27962461e2c	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561d-0586-62a0-48b43fdc1d24	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561d-0586-5a0c-2f055eb26cc2	Besedilo-read	Besedilo - branje	f
00030000-561d-0586-0776-0113c8d637d0	Besedilo-write	Besedilo - spreminjanje	f
00030000-561d-0586-5132-1a3db169f9d0	DogodekIzven-read	DogodekIzven - branje	f
00030000-561d-0586-bf58-29af35c80cfd	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561d-0586-e482-c04975d97678	Dogodek-read	Dogodek - branje	f
00030000-561d-0586-681a-d64806f35b5d	Dogodek-write	Dogodek - spreminjanje	f
00030000-561d-0586-9e96-6a8696f6f50b	DrugiVir-read	DrugiVir - branje	f
00030000-561d-0586-91dd-a6733183e327	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561d-0586-f9ec-c7fdbc131d36	Drzava-read	Drzava - branje	f
00030000-561d-0586-64d0-d591831499c7	Drzava-write	Drzava - spreminjanje	f
00030000-561d-0586-9543-3098a373b7e9	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561d-0586-6946-044fe7b79e6b	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561d-0586-2f13-27e740c3a370	Funkcija-read	Funkcija - branje	f
00030000-561d-0586-1d2b-9756ed80cad7	Funkcija-write	Funkcija - spreminjanje	f
00030000-561d-0586-6f84-9280eb0d1806	Gostovanje-read	Gostovanje - branje	f
00030000-561d-0586-a88a-33e7e04b8ac8	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561d-0586-2408-dc66fc43c425	Gostujoca-read	Gostujoca - branje	f
00030000-561d-0586-d4d2-b71852ba05e4	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561d-0586-1b99-a231a6ad2fe3	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561d-0586-9181-766788eedccd	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561d-0586-32a6-6f197c85eb56	Kupec-read	Kupec - branje	f
00030000-561d-0586-79ba-3106a853fbf8	Kupec-write	Kupec - spreminjanje	f
00030000-561d-0586-e8aa-f469eafcdca1	NacinPlacina-read	NacinPlacina - branje	f
00030000-561d-0586-fa77-80f44791a59c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561d-0586-5667-d780b2a541b0	Option-read	Option - branje	f
00030000-561d-0586-7c7d-f6ce84304551	Option-write	Option - spreminjanje	f
00030000-561d-0586-c8b5-16331613480e	OptionValue-read	OptionValue - branje	f
00030000-561d-0586-be51-33747a28f9a4	OptionValue-write	OptionValue - spreminjanje	f
00030000-561d-0586-cc49-ff3dc10e3d0f	Oseba-read	Oseba - branje	f
00030000-561d-0586-bfa2-7d1eb5edd927	Oseba-write	Oseba - spreminjanje	f
00030000-561d-0586-8c3f-477e5a1eef58	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561d-0586-1775-c29652f17361	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561d-0586-1155-dd67c187c549	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561d-0586-ba70-fba39a13810e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561d-0586-ac95-0e2eb32ac83c	Pogodba-read	Pogodba - branje	f
00030000-561d-0586-c487-867648cbdf3b	Pogodba-write	Pogodba - spreminjanje	f
00030000-561d-0586-d499-6f8baa7a0747	Popa-read	Popa - branje	f
00030000-561d-0586-9047-12cc00a97de2	Popa-write	Popa - spreminjanje	f
00030000-561d-0586-94ec-fc34c5438513	Posta-read	Posta - branje	f
00030000-561d-0586-1442-3d920f6aaf44	Posta-write	Posta - spreminjanje	f
00030000-561d-0586-8f5b-cd92f6fcd2fa	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561d-0586-c456-1f35b61295de	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561d-0586-052e-784c794db0ff	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561d-0586-cbd9-d16384ec7f13	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561d-0586-913a-c8dc65aa8a21	PostniNaslov-read	PostniNaslov - branje	f
00030000-561d-0586-82d6-42b5d34f4799	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561d-0586-445b-4847bfb4ba95	Predstava-read	Predstava - branje	f
00030000-561d-0586-7180-65658e100fdc	Predstava-write	Predstava - spreminjanje	f
00030000-561d-0586-72a7-5504794a6141	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561d-0586-acb9-cf4a7005969e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561d-0586-fa13-2a6403326d85	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561d-0586-8bf1-491161ce85c8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561d-0586-8cc7-f77f3526a677	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561d-0586-6403-6c65320ee662	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561d-0586-d4a7-3cb884e3dad3	ProgramDela-read	ProgramDela - branje	f
00030000-561d-0586-8557-f60fda44b779	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561d-0586-79b2-a02d06524510	ProgramFestival-read	ProgramFestival - branje	f
00030000-561d-0586-af69-b86007943df9	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561d-0586-4263-253d42896f86	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561d-0586-8a94-4008d9ee7078	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561d-0586-ff6f-b9a16fa0e799	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561d-0586-41d0-f326383c3d29	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561d-0586-abb7-39b28f6123e7	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561d-0586-b535-e0636da36c49	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561d-0586-1326-acc040731037	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561d-0586-996c-218281e1cfdb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561d-0586-6886-44795b3e3bcb	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561d-0586-12df-f303469a5964	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561d-0586-ec19-44c184b0e151	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561d-0586-7525-46f674bb2612	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561d-0586-469e-57ccd328a378	ProgramRazno-read	ProgramRazno - branje	f
00030000-561d-0586-b99c-77f2d1adb523	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561d-0586-32de-2b1b7a7d033c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561d-0586-a958-0f00dffa4c21	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561d-0586-3d2b-7ace221b0894	Prostor-read	Prostor - branje	f
00030000-561d-0586-1771-562f47619f5b	Prostor-write	Prostor - spreminjanje	f
00030000-561d-0586-9dd8-a85fd9c4d88d	Racun-read	Racun - branje	f
00030000-561d-0586-7f07-ce30f431d6cd	Racun-write	Racun - spreminjanje	f
00030000-561d-0586-4cbc-783950cd1e4d	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561d-0586-c477-f3c94057ab3f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561d-0586-a07c-7c347c773ed5	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561d-0586-1bf9-962ecf0d8195	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561d-0586-b6a8-108c95001c50	Rekvizit-read	Rekvizit - branje	f
00030000-561d-0586-180a-da12151c3403	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561d-0586-5b5e-ae783c796ee0	Revizija-read	Revizija - branje	f
00030000-561d-0586-658e-8d921f211a04	Revizija-write	Revizija - spreminjanje	f
00030000-561d-0586-df3c-e44226fac8c2	Rezervacija-read	Rezervacija - branje	f
00030000-561d-0586-4354-c1cbef5f397e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561d-0586-bd15-3f8423716d58	SedezniRed-read	SedezniRed - branje	f
00030000-561d-0586-9992-c097115cd1b0	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561d-0586-a6da-8e43d1301250	Sedez-read	Sedez - branje	f
00030000-561d-0586-2897-91dbf03b94cf	Sedez-write	Sedez - spreminjanje	f
00030000-561d-0586-a2b8-0846bafcbaeb	Sezona-read	Sezona - branje	f
00030000-561d-0586-a021-a215cd36f0f6	Sezona-write	Sezona - spreminjanje	f
00030000-561d-0586-0eb3-30ad4574267f	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561d-0586-0fd3-cbac126bbc37	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561d-0586-05ec-a0d6b9ccc66c	Stevilcenje-read	Stevilcenje - branje	f
00030000-561d-0586-6f10-5ab316b7dc2c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561d-0586-ad26-322529af57c0	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561d-0586-0694-38295b144d1c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561d-0586-9559-cfdbd6a080a2	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561d-0586-56fb-5f7be029bd50	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561d-0586-8210-aecc1568b13e	Telefonska-read	Telefonska - branje	f
00030000-561d-0586-1578-fe116f615b7a	Telefonska-write	Telefonska - spreminjanje	f
00030000-561d-0586-be8f-1004ec0e4f34	TerminStoritve-read	TerminStoritve - branje	f
00030000-561d-0586-1bda-7d4d0d49e60a	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561d-0586-f81c-acc96fbeb0bb	TipFunkcije-read	TipFunkcije - branje	f
00030000-561d-0586-3b08-c7b5dafdde59	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561d-0586-3e45-6354dcf349af	TipPopa-read	TipPopa - branje	f
00030000-561d-0586-fa55-3cfbf6fa7c6c	TipPopa-write	TipPopa - spreminjanje	f
00030000-561d-0586-0697-d87a79d0cd3f	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561d-0586-fb5c-0842cd0a0999	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561d-0586-9b54-eee715795a67	Trr-read	Trr - branje	f
00030000-561d-0586-ec83-a16bed2f46b4	Trr-write	Trr - spreminjanje	f
00030000-561d-0586-838c-ee9cfd6ec7a1	Uprizoritev-read	Uprizoritev - branje	f
00030000-561d-0586-6826-e536ace470c5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561d-0586-a1d7-550f49cfd55e	Vaja-read	Vaja - branje	f
00030000-561d-0586-dd2e-ab04a0284af4	Vaja-write	Vaja - spreminjanje	f
00030000-561d-0586-9c1a-6c85820e7a89	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561d-0586-c956-dddefddb89ab	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561d-0586-243f-f9e022287c12	VrstaStroska-read	VrstaStroska - branje	f
00030000-561d-0586-c409-5839e0b49b46	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561d-0586-c80c-bb07571acd5b	Zaposlitev-read	Zaposlitev - branje	f
00030000-561d-0586-8e3d-dc2ffabfc092	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561d-0586-c5ff-aafd5b7ca813	Zasedenost-read	Zasedenost - branje	f
00030000-561d-0586-0266-1401664299a1	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561d-0586-1930-b3cf7fe75e1d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561d-0586-9194-0113a0d1d5d3	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561d-0586-71e5-5c6cffa80038	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561d-0586-7c4c-6e5919746659	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561d-0586-f3a5-b776c6d7761f	Job-read	Branje opravil - samo zase - branje	f
00030000-561d-0586-1075-dfd7c5e913a6	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561d-0586-3c93-94ac650ba290	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561d-0586-ffaa-e3f453c275ef	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561d-0586-b6ca-971b144a305f	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561d-0586-e078-7fe6fa2bf273	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561d-0586-c5b6-5aa06ad8dc71	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561d-0586-d5f5-e18773237830	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561d-0586-2baf-313082920088	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561d-0586-724f-4af8a9ecf3f4	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561d-0586-4337-1e770583a2b4	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561d-0586-b27d-a32c756bf317	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561d-0586-5c5e-e9bbfa3dc4a7	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561d-0586-9f81-5778e3a449c2	Datoteka-write	Datoteka - spreminjanje	f
00030000-561d-0586-e83b-719ed08528ec	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3015 (class 0 OID 21893054)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561d-0586-f891-536361b956e3	00030000-561d-0586-a42e-cce7e4079289
00020000-561d-0586-4a0f-f283f0179cfd	00030000-561d-0586-f9ec-c7fdbc131d36
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-80b2-8394b05b3862
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-830f-009f59e4609d
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-e585-af44bedaae9c
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-a714-9ca6c6c4d8e1
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-7ce7-3227e71115f6
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-e482-c04975d97678
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-de3a-c03d05ad1788
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-681a-d64806f35b5d
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-f9ec-c7fdbc131d36
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-64d0-d591831499c7
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-2f13-27e740c3a370
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-1d2b-9756ed80cad7
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-6f84-9280eb0d1806
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-a88a-33e7e04b8ac8
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-2408-dc66fc43c425
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-d4d2-b71852ba05e4
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-1b99-a231a6ad2fe3
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-9181-766788eedccd
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-5667-d780b2a541b0
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-c8b5-16331613480e
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-cc49-ff3dc10e3d0f
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-bfa2-7d1eb5edd927
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-d499-6f8baa7a0747
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-9047-12cc00a97de2
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-94ec-fc34c5438513
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-1442-3d920f6aaf44
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-913a-c8dc65aa8a21
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-82d6-42b5d34f4799
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-445b-4847bfb4ba95
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-7180-65658e100fdc
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-8cc7-f77f3526a677
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-6403-6c65320ee662
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-3d2b-7ace221b0894
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-1771-562f47619f5b
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-a07c-7c347c773ed5
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-1bf9-962ecf0d8195
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-b6a8-108c95001c50
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-180a-da12151c3403
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-a2b8-0846bafcbaeb
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-a021-a215cd36f0f6
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-f81c-acc96fbeb0bb
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-838c-ee9cfd6ec7a1
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-6826-e536ace470c5
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-a1d7-550f49cfd55e
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-dd2e-ab04a0284af4
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-c5ff-aafd5b7ca813
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-0266-1401664299a1
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-1930-b3cf7fe75e1d
00020000-561d-0586-e3f2-0ee97582ef33	00030000-561d-0586-71e5-5c6cffa80038
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-80b2-8394b05b3862
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-7ce7-3227e71115f6
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-e482-c04975d97678
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-f9ec-c7fdbc131d36
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-6f84-9280eb0d1806
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-2408-dc66fc43c425
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-1b99-a231a6ad2fe3
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-9181-766788eedccd
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-5667-d780b2a541b0
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-c8b5-16331613480e
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-cc49-ff3dc10e3d0f
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-bfa2-7d1eb5edd927
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-d499-6f8baa7a0747
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-94ec-fc34c5438513
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-913a-c8dc65aa8a21
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-82d6-42b5d34f4799
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-445b-4847bfb4ba95
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-3d2b-7ace221b0894
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-a07c-7c347c773ed5
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-b6a8-108c95001c50
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-a2b8-0846bafcbaeb
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-8210-aecc1568b13e
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-1578-fe116f615b7a
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-9b54-eee715795a67
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-ec83-a16bed2f46b4
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-c80c-bb07571acd5b
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-8e3d-dc2ffabfc092
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-1930-b3cf7fe75e1d
00020000-561d-0586-2d0e-cd72d778ebee	00030000-561d-0586-71e5-5c6cffa80038
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-80b2-8394b05b3862
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-e585-af44bedaae9c
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-7ce7-3227e71115f6
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-160e-0302a771afa5
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-5a0c-2f055eb26cc2
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-5132-1a3db169f9d0
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-e482-c04975d97678
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-f9ec-c7fdbc131d36
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-2f13-27e740c3a370
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-6f84-9280eb0d1806
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-2408-dc66fc43c425
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-1b99-a231a6ad2fe3
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-5667-d780b2a541b0
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-c8b5-16331613480e
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-cc49-ff3dc10e3d0f
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-d499-6f8baa7a0747
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-94ec-fc34c5438513
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-445b-4847bfb4ba95
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-8cc7-f77f3526a677
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-3d2b-7ace221b0894
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-a07c-7c347c773ed5
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-b6a8-108c95001c50
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-a2b8-0846bafcbaeb
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-f81c-acc96fbeb0bb
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-a1d7-550f49cfd55e
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-c5ff-aafd5b7ca813
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-1930-b3cf7fe75e1d
00020000-561d-0586-c9ab-8c525739d4b5	00030000-561d-0586-71e5-5c6cffa80038
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-80b2-8394b05b3862
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-830f-009f59e4609d
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-a714-9ca6c6c4d8e1
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-7ce7-3227e71115f6
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-e482-c04975d97678
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-f9ec-c7fdbc131d36
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-6f84-9280eb0d1806
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-2408-dc66fc43c425
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-5667-d780b2a541b0
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-c8b5-16331613480e
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-d499-6f8baa7a0747
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-94ec-fc34c5438513
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-445b-4847bfb4ba95
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-3d2b-7ace221b0894
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-a07c-7c347c773ed5
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-b6a8-108c95001c50
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-a2b8-0846bafcbaeb
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-f81c-acc96fbeb0bb
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-1930-b3cf7fe75e1d
00020000-561d-0586-02f5-1ff8e117fcb2	00030000-561d-0586-71e5-5c6cffa80038
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-80b2-8394b05b3862
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-7ce7-3227e71115f6
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-e482-c04975d97678
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-f9ec-c7fdbc131d36
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-6f84-9280eb0d1806
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-2408-dc66fc43c425
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-5667-d780b2a541b0
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-c8b5-16331613480e
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-d499-6f8baa7a0747
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-94ec-fc34c5438513
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-445b-4847bfb4ba95
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-3d2b-7ace221b0894
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-a07c-7c347c773ed5
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-b6a8-108c95001c50
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-a2b8-0846bafcbaeb
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-be8f-1004ec0e4f34
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-0f97-6bb9da4fbbe4
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-f81c-acc96fbeb0bb
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-1930-b3cf7fe75e1d
00020000-561d-0586-04a2-7283f50ada02	00030000-561d-0586-71e5-5c6cffa80038
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-316f-69da25f0c9f2
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-a42e-cce7e4079289
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-0f97-6bb9da4fbbe4
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-de3a-c03d05ad1788
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-95bc-d39d8d181f24
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-459a-6e1b41391c9d
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-dbe9-fb17cfd49ff1
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-80b2-8394b05b3862
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-830f-009f59e4609d
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-e585-af44bedaae9c
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-a714-9ca6c6c4d8e1
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-7ce7-3227e71115f6
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-160e-0302a771afa5
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-5a0c-2f055eb26cc2
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-0776-0113c8d637d0
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-5132-1a3db169f9d0
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-bf58-29af35c80cfd
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-e482-c04975d97678
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-681a-d64806f35b5d
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-f9ec-c7fdbc131d36
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-64d0-d591831499c7
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-9e96-6a8696f6f50b
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-91dd-a6733183e327
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-9543-3098a373b7e9
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-6946-044fe7b79e6b
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-2f13-27e740c3a370
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-1d2b-9756ed80cad7
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-6f84-9280eb0d1806
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-a88a-33e7e04b8ac8
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-2408-dc66fc43c425
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-d4d2-b71852ba05e4
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-1b99-a231a6ad2fe3
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-9181-766788eedccd
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-32a6-6f197c85eb56
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-79ba-3106a853fbf8
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-e8aa-f469eafcdca1
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-fa77-80f44791a59c
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-5667-d780b2a541b0
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-7c7d-f6ce84304551
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-c8b5-16331613480e
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-be51-33747a28f9a4
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-cc49-ff3dc10e3d0f
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-bfa2-7d1eb5edd927
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-8c3f-477e5a1eef58
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-1775-c29652f17361
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-1155-dd67c187c549
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-ba70-fba39a13810e
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-ac95-0e2eb32ac83c
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-c487-867648cbdf3b
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-d499-6f8baa7a0747
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-9047-12cc00a97de2
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-94ec-fc34c5438513
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-1442-3d920f6aaf44
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-8f5b-cd92f6fcd2fa
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-c456-1f35b61295de
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-052e-784c794db0ff
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-cbd9-d16384ec7f13
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-913a-c8dc65aa8a21
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-82d6-42b5d34f4799
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-445b-4847bfb4ba95
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-7180-65658e100fdc
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-72a7-5504794a6141
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-acb9-cf4a7005969e
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-fa13-2a6403326d85
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-8bf1-491161ce85c8
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-8cc7-f77f3526a677
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-6403-6c65320ee662
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-d4a7-3cb884e3dad3
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-8557-f60fda44b779
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-79b2-a02d06524510
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-af69-b86007943df9
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-4263-253d42896f86
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-8a94-4008d9ee7078
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-ff6f-b9a16fa0e799
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-41d0-f326383c3d29
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-abb7-39b28f6123e7
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-b535-e0636da36c49
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-1326-acc040731037
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-996c-218281e1cfdb
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-6886-44795b3e3bcb
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-12df-f303469a5964
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-ec19-44c184b0e151
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-7525-46f674bb2612
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-469e-57ccd328a378
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-b99c-77f2d1adb523
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-32de-2b1b7a7d033c
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-a958-0f00dffa4c21
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-3d2b-7ace221b0894
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-1771-562f47619f5b
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-9dd8-a85fd9c4d88d
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-7f07-ce30f431d6cd
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-4cbc-783950cd1e4d
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-c477-f3c94057ab3f
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-a07c-7c347c773ed5
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-1bf9-962ecf0d8195
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-b6a8-108c95001c50
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-180a-da12151c3403
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-5b5e-ae783c796ee0
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-658e-8d921f211a04
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-df3c-e44226fac8c2
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-4354-c1cbef5f397e
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-bd15-3f8423716d58
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-9992-c097115cd1b0
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-a6da-8e43d1301250
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-2897-91dbf03b94cf
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-a2b8-0846bafcbaeb
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-a021-a215cd36f0f6
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-0eb3-30ad4574267f
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-0fd3-cbac126bbc37
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-05ec-a0d6b9ccc66c
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-6f10-5ab316b7dc2c
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-ad26-322529af57c0
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-0694-38295b144d1c
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-9559-cfdbd6a080a2
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-56fb-5f7be029bd50
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-8210-aecc1568b13e
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-1578-fe116f615b7a
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-be8f-1004ec0e4f34
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-1bda-7d4d0d49e60a
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-f81c-acc96fbeb0bb
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-3b08-c7b5dafdde59
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-0697-d87a79d0cd3f
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-fb5c-0842cd0a0999
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-9b54-eee715795a67
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-ec83-a16bed2f46b4
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-838c-ee9cfd6ec7a1
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-6826-e536ace470c5
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-a1d7-550f49cfd55e
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-dd2e-ab04a0284af4
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-9c1a-6c85820e7a89
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-c956-dddefddb89ab
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-243f-f9e022287c12
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-c409-5839e0b49b46
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-c80c-bb07571acd5b
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-8e3d-dc2ffabfc092
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-c5ff-aafd5b7ca813
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-0266-1401664299a1
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-1930-b3cf7fe75e1d
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-9194-0113a0d1d5d3
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-71e5-5c6cffa80038
00020000-561d-0588-b27a-d2e15f0c0364	00030000-561d-0586-7c4c-6e5919746659
\.


--
-- TOC entry 3045 (class 0 OID 21893389)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 21893423)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 21893559)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561d-0588-4d6c-b0f06847e629	00090000-561d-0588-7bfe-1b28bb906e48	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561d-0588-3e28-e57ff491e466	00090000-561d-0588-3ebd-99c51b8687d1	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561d-0588-bd73-05161f8cfd61	00090000-561d-0588-176f-b1263516c899	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561d-0588-7518-64861618c1a7	00090000-561d-0588-3a23-fc269ef18f98	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3021 (class 0 OID 21893123)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561d-0588-2f7d-ff5c51564e16	\N	00040000-561d-0586-2561-bad64c0ebe54	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561d-0588-36cb-f0df16e7f96f	\N	00040000-561d-0586-2561-bad64c0ebe54	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561d-0588-bd2c-4dd7ab9db424	\N	00040000-561d-0586-2561-bad64c0ebe54	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561d-0588-cdb0-9f1463b5039f	\N	00040000-561d-0586-2561-bad64c0ebe54	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561d-0588-7a3a-a627d4f6281f	\N	00040000-561d-0586-2561-bad64c0ebe54	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561d-0588-f9e9-f715c189efaf	\N	00040000-561d-0585-05ed-b25a9295226b	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561d-0588-2d71-5092d3b06b1b	\N	00040000-561d-0586-b9a9-81cb6028c5ad	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561d-0588-d71b-7c896cfd4643	\N	00040000-561d-0586-e470-7857ed895e5a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561d-0588-e3f6-b3d2b64a4091	\N	00040000-561d-0586-93cc-fcb52d0f726c	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561d-058a-59f8-90d07a764164	\N	00040000-561d-0586-2561-bad64c0ebe54	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3023 (class 0 OID 21893158)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561d-0585-0099-443f33e8153b	8341	Adlešiči
00050000-561d-0585-9b2b-0f28ed2429ff	5270	Ajdovščina
00050000-561d-0585-b959-3a059cdea1b5	6280	Ankaran/Ancarano
00050000-561d-0585-85e6-4f94cb01e7d0	9253	Apače
00050000-561d-0585-3b08-5f3440f671c1	8253	Artiče
00050000-561d-0585-4a72-7e93ada7dffe	4275	Begunje na Gorenjskem
00050000-561d-0585-cd15-4d9b728f5f58	1382	Begunje pri Cerknici
00050000-561d-0585-c7e2-bcd39ec228a1	9231	Beltinci
00050000-561d-0585-af71-c98546355afb	2234	Benedikt
00050000-561d-0585-2929-0c0e560db1f5	2345	Bistrica ob Dravi
00050000-561d-0585-339e-1d7b36d6bfae	3256	Bistrica ob Sotli
00050000-561d-0585-38b3-124d93db30c1	8259	Bizeljsko
00050000-561d-0585-2c7b-18132faa7360	1223	Blagovica
00050000-561d-0585-4431-b02ce8240d91	8283	Blanca
00050000-561d-0585-68da-16eeab24ca98	4260	Bled
00050000-561d-0585-07f2-3389dbca95d0	4273	Blejska Dobrava
00050000-561d-0585-5156-7a47e194eb11	9265	Bodonci
00050000-561d-0585-5eed-f70c17b40f79	9222	Bogojina
00050000-561d-0585-23fa-cffed7d3f5a5	4263	Bohinjska Bela
00050000-561d-0585-47be-9f48b05d585e	4264	Bohinjska Bistrica
00050000-561d-0585-827d-75ea042eff62	4265	Bohinjsko jezero
00050000-561d-0585-1a28-46577bf30acd	1353	Borovnica
00050000-561d-0585-ee07-ce340274814c	8294	Boštanj
00050000-561d-0585-bc13-4814e5a45f21	5230	Bovec
00050000-561d-0585-4c93-677a5fbfdde1	5295	Branik
00050000-561d-0585-29f8-291a2ab0c121	3314	Braslovče
00050000-561d-0585-1dd8-f131d4d9fc12	5223	Breginj
00050000-561d-0585-32a8-ad5da1ee3ace	8280	Brestanica
00050000-561d-0585-086d-21f8a98fd9b3	2354	Bresternica
00050000-561d-0585-9b66-c92a07ba71b8	4243	Brezje
00050000-561d-0585-8c16-e66637b27271	1351	Brezovica pri Ljubljani
00050000-561d-0585-c6f0-694dafcce7b9	8250	Brežice
00050000-561d-0585-594a-380199d4b0f2	4210	Brnik - Aerodrom
00050000-561d-0585-e358-8cba3a4d8d55	8321	Brusnice
00050000-561d-0585-8ce1-02d025bf6c11	3255	Buče
00050000-561d-0585-5518-6badb5fad115	8276	Bučka 
00050000-561d-0585-0fbf-7b7869f69d6d	9261	Cankova
00050000-561d-0585-0a78-0075714b0ceb	3000	Celje 
00050000-561d-0585-45f7-341c41ed2c2c	3001	Celje - poštni predali
00050000-561d-0585-f9fc-17ea684ced20	4207	Cerklje na Gorenjskem
00050000-561d-0585-716a-773a73366f24	8263	Cerklje ob Krki
00050000-561d-0585-0e84-bc34d09b9a2d	1380	Cerknica
00050000-561d-0585-76f2-acf597086342	5282	Cerkno
00050000-561d-0585-7fa0-a9f883aa314a	2236	Cerkvenjak
00050000-561d-0585-8439-05ab0da04767	2215	Ceršak
00050000-561d-0585-2e33-b7ae1c350b82	2326	Cirkovce
00050000-561d-0585-145c-9115f3d0b1e4	2282	Cirkulane
00050000-561d-0585-50f0-ab80cd1e52ef	5273	Col
00050000-561d-0585-6b11-feff2a62d0da	8251	Čatež ob Savi
00050000-561d-0585-adda-d40c919f5676	1413	Čemšenik
00050000-561d-0585-2462-6c342358acf5	5253	Čepovan
00050000-561d-0585-48b5-9eaeedc73c0d	9232	Črenšovci
00050000-561d-0585-92af-54a2e4f32b6a	2393	Črna na Koroškem
00050000-561d-0585-5a4b-69d2e621ffac	6275	Črni Kal
00050000-561d-0585-d7b7-2299c192b71e	5274	Črni Vrh nad Idrijo
00050000-561d-0585-a070-dbf2ddccd475	5262	Črniče
00050000-561d-0585-7ae6-fdfbf9047911	8340	Črnomelj
00050000-561d-0585-7a11-364820bb699d	6271	Dekani
00050000-561d-0585-c4d2-acbfcbcd614e	5210	Deskle
00050000-561d-0585-bb8b-fa2297ea8aa2	2253	Destrnik
00050000-561d-0585-e4a4-b16494d7163b	6215	Divača
00050000-561d-0585-1863-c589a0a7c918	1233	Dob
00050000-561d-0585-3fd6-a11ddd940bbc	3224	Dobje pri Planini
00050000-561d-0585-9fc8-eac58f8854da	8257	Dobova
00050000-561d-0585-351a-6f87edec6cab	1423	Dobovec
00050000-561d-0585-5a02-f7dca17fb95a	5263	Dobravlje
00050000-561d-0585-28e3-8106cff2d155	3204	Dobrna
00050000-561d-0585-c8b7-84e8cc61538c	8211	Dobrnič
00050000-561d-0585-ddec-6fd52ce1e1da	1356	Dobrova
00050000-561d-0585-1e75-721d83b46b99	9223	Dobrovnik/Dobronak 
00050000-561d-0585-6f50-e741f7b61813	5212	Dobrovo v Brdih
00050000-561d-0585-a52b-f28ab933169c	1431	Dol pri Hrastniku
00050000-561d-0585-dd10-48519730bdb4	1262	Dol pri Ljubljani
00050000-561d-0585-2fc9-c3d1144116a9	1273	Dole pri Litiji
00050000-561d-0585-b865-1eeef7049844	1331	Dolenja vas
00050000-561d-0585-8b13-f71fbba74ddc	8350	Dolenjske Toplice
00050000-561d-0585-2c31-7c228f495453	1230	Domžale
00050000-561d-0585-151d-f1f73c2db494	2252	Dornava
00050000-561d-0585-9b26-39ea0d9e16db	5294	Dornberk
00050000-561d-0585-df63-729c06a04e94	1319	Draga
00050000-561d-0585-c240-2b7bf4eba273	8343	Dragatuš
00050000-561d-0585-d495-0dfdb212232d	3222	Dramlje
00050000-561d-0585-baf5-8b1524905bc5	2370	Dravograd
00050000-561d-0585-7635-ac76adbcd3b0	4203	Duplje
00050000-561d-0585-9a9e-28b7564e8e18	6221	Dutovlje
00050000-561d-0585-befd-681152705f7e	8361	Dvor
00050000-561d-0585-bccc-2b7ef27a11e0	2343	Fala
00050000-561d-0585-b2fb-a9f4c0e69f43	9208	Fokovci
00050000-561d-0585-01f5-98df58c278d8	2313	Fram
00050000-561d-0585-138f-0ccae4a74d1c	3213	Frankolovo
00050000-561d-0585-02b8-4bd52ae44d99	1274	Gabrovka
00050000-561d-0585-d211-4272f9a5c5ac	8254	Globoko
00050000-561d-0585-969b-ce538867cb1d	5275	Godovič
00050000-561d-0585-a43d-d8c08aaff5c9	4204	Golnik
00050000-561d-0585-b03d-813eaa759e31	3303	Gomilsko
00050000-561d-0585-ad8a-b03886343333	4224	Gorenja vas
00050000-561d-0585-b7d4-24596c9dc0dc	3263	Gorica pri Slivnici
00050000-561d-0585-5f6d-d5b0513b9eb1	2272	Gorišnica
00050000-561d-0585-7f5e-590bf0d5e7ba	9250	Gornja Radgona
00050000-561d-0585-0185-210bd2e4e130	3342	Gornji Grad
00050000-561d-0585-e5ea-9c7d86e0bfe2	4282	Gozd Martuljek
00050000-561d-0585-42c6-f7e0c1dedbf6	6272	Gračišče
00050000-561d-0585-7e2f-da035db5f46b	9264	Grad
00050000-561d-0585-ce6c-324a6cae3785	8332	Gradac
00050000-561d-0585-4371-96d257c22ec1	1384	Grahovo
00050000-561d-0585-0d57-09d0e38eb8b3	5242	Grahovo ob Bači
00050000-561d-0585-5b11-ece22c9307f1	5251	Grgar
00050000-561d-0585-a591-b623d9754f19	3302	Griže
00050000-561d-0585-e73f-5de77afd2a6c	3231	Grobelno
00050000-561d-0585-f067-9cb2ae6ff278	1290	Grosuplje
00050000-561d-0585-1c78-b677b429d24f	2288	Hajdina
00050000-561d-0585-6b11-bd53451e7f4d	8362	Hinje
00050000-561d-0585-ea8c-c509d1914a40	2311	Hoče
00050000-561d-0585-f419-05bd7f232d18	9205	Hodoš/Hodos
00050000-561d-0585-8de9-93836a36e22a	1354	Horjul
00050000-561d-0585-5c73-e0ecd0780a9c	1372	Hotedršica
00050000-561d-0585-500b-7cef01549032	1430	Hrastnik
00050000-561d-0585-4380-184778804c99	6225	Hruševje
00050000-561d-0585-3256-020a7a4f8119	4276	Hrušica
00050000-561d-0585-38a4-da49c1c684a3	5280	Idrija
00050000-561d-0585-2591-3d9a86eb7fcb	1292	Ig
00050000-561d-0585-2e09-19a3da487e83	6250	Ilirska Bistrica
00050000-561d-0585-229f-f13fc4b06265	6251	Ilirska Bistrica-Trnovo
00050000-561d-0585-a605-79f6dc5d1508	1295	Ivančna Gorica
00050000-561d-0585-865c-b0fc51d855c6	2259	Ivanjkovci
00050000-561d-0585-e006-394516c69897	1411	Izlake
00050000-561d-0585-f796-c3adf5db0ca4	6310	Izola/Isola
00050000-561d-0585-8d47-d152f6a0ce45	2222	Jakobski Dol
00050000-561d-0585-43cd-37b2f287a1cb	2221	Jarenina
00050000-561d-0585-c2c0-d863f72156be	6254	Jelšane
00050000-561d-0585-6166-77aef84cad4d	4270	Jesenice
00050000-561d-0585-a77d-7c7dc095cdec	8261	Jesenice na Dolenjskem
00050000-561d-0585-850e-7c9580033866	3273	Jurklošter
00050000-561d-0585-7efe-fbe52ad93601	2223	Jurovski Dol
00050000-561d-0585-9655-e1b6792e9c12	2256	Juršinci
00050000-561d-0585-9964-403d19434950	5214	Kal nad Kanalom
00050000-561d-0585-dce0-a398f3106481	3233	Kalobje
00050000-561d-0585-c12f-861f9b327d07	4246	Kamna Gorica
00050000-561d-0585-52b4-8e5bb20bf405	2351	Kamnica
00050000-561d-0585-cc1c-4964e7437bf5	1241	Kamnik
00050000-561d-0585-fac5-ed0712f80371	5213	Kanal
00050000-561d-0585-b7c6-57f2b4aca5fd	8258	Kapele
00050000-561d-0585-9cc1-976ddbf00c91	2362	Kapla
00050000-561d-0585-5c9d-efc69506ba4d	2325	Kidričevo
00050000-561d-0585-aa3a-fc43219ebfce	1412	Kisovec
00050000-561d-0585-43bb-90618f10c7e8	6253	Knežak
00050000-561d-0585-249d-7e7faee4e556	5222	Kobarid
00050000-561d-0585-81ca-9656590199c0	9227	Kobilje
00050000-561d-0585-3656-1ee0e7b1ff28	1330	Kočevje
00050000-561d-0585-fbc3-1a58aa9bc3bc	1338	Kočevska Reka
00050000-561d-0585-ee8f-e3f6ccd12ff6	2276	Kog
00050000-561d-0585-635f-768642c74c2a	5211	Kojsko
00050000-561d-0585-8601-cb332219f6a8	6223	Komen
00050000-561d-0585-1ca1-79b103d94921	1218	Komenda
00050000-561d-0585-3dba-317db059b40c	6000	Koper/Capodistria 
00050000-561d-0585-28a7-dd1b21c7cd3f	6001	Koper/Capodistria - poštni predali
00050000-561d-0585-02a4-d9f10cb0f895	8282	Koprivnica
00050000-561d-0585-a5e8-f7a96423cd3b	5296	Kostanjevica na Krasu
00050000-561d-0585-6ab0-d5e1ad26d1e8	8311	Kostanjevica na Krki
00050000-561d-0585-74cd-046f94699fb6	1336	Kostel
00050000-561d-0585-e97d-5e062aedba9a	6256	Košana
00050000-561d-0585-20e8-54e6d12af53f	2394	Kotlje
00050000-561d-0585-da3d-b7a8f5894592	6240	Kozina
00050000-561d-0585-f3c7-678a10b8c0f9	3260	Kozje
00050000-561d-0585-66e0-f2292a5f33f5	4000	Kranj 
00050000-561d-0585-553a-0ba7b27aa1b5	4001	Kranj - poštni predali
00050000-561d-0585-065f-cac79f0996a3	4280	Kranjska Gora
00050000-561d-0585-0712-90fd4846f196	1281	Kresnice
00050000-561d-0585-b3a3-cb9a6753d464	4294	Križe
00050000-561d-0585-d8aa-34e54f679cb3	9206	Križevci
00050000-561d-0585-b2e0-96e6bab34cb2	9242	Križevci pri Ljutomeru
00050000-561d-0585-4229-f8d750dec962	1301	Krka
00050000-561d-0585-b7e7-b783b81836a8	8296	Krmelj
00050000-561d-0585-ed38-c25edf6ef861	4245	Kropa
00050000-561d-0585-1956-f72f4fd728a7	8262	Krška vas
00050000-561d-0585-32af-0e7bc2e21212	8270	Krško
00050000-561d-0585-3dc5-2c76f2702202	9263	Kuzma
00050000-561d-0585-a1fe-34d6b91fe38f	2318	Laporje
00050000-561d-0585-b945-4ebe246878b5	3270	Laško
00050000-561d-0585-cf29-cdae3c00c0f2	1219	Laze v Tuhinju
00050000-561d-0585-b35c-193880d58915	2230	Lenart v Slovenskih goricah
00050000-561d-0585-2a3d-7fd7a1b08d15	9220	Lendava/Lendva
00050000-561d-0585-3e04-82e2496e5c24	4248	Lesce
00050000-561d-0585-53fa-afbd08e4312b	3261	Lesično
00050000-561d-0585-6d64-6092499fd902	8273	Leskovec pri Krškem
00050000-561d-0585-2bb0-4ea56fffecf0	2372	Libeliče
00050000-561d-0585-f8aa-752604064acd	2341	Limbuš
00050000-561d-0585-81c7-c94c021df324	1270	Litija
00050000-561d-0585-d97a-52111d04cef6	3202	Ljubečna
00050000-561d-0585-13cc-82f37075bca1	1000	Ljubljana 
00050000-561d-0585-ec40-861ef3a03739	1001	Ljubljana - poštni predali
00050000-561d-0585-0467-8c9893a6ecb4	1231	Ljubljana - Črnuče
00050000-561d-0585-8521-b72debcbf750	1261	Ljubljana - Dobrunje
00050000-561d-0585-490c-d35c636d7bba	1260	Ljubljana - Polje
00050000-561d-0585-42f1-8f7d83020219	1210	Ljubljana - Šentvid
00050000-561d-0585-915d-c21898326465	1211	Ljubljana - Šmartno
00050000-561d-0585-8d7d-3c9b9048a7ea	3333	Ljubno ob Savinji
00050000-561d-0585-316d-97b4abe93dcc	9240	Ljutomer
00050000-561d-0585-2fd4-468632774ab6	3215	Loče
00050000-561d-0585-447a-635253317937	5231	Log pod Mangartom
00050000-561d-0585-5e63-1b97953aae4e	1358	Log pri Brezovici
00050000-561d-0585-7052-512c23923727	1370	Logatec
00050000-561d-0585-b6ab-45bb1ecc7739	1371	Logatec
00050000-561d-0585-23c1-d5f8e688b790	1434	Loka pri Zidanem Mostu
00050000-561d-0585-b190-a5eacba81fd4	3223	Loka pri Žusmu
00050000-561d-0585-b6dd-e018d6126c0c	6219	Lokev
00050000-561d-0585-07e7-aa95ec66c40b	1318	Loški Potok
00050000-561d-0585-2334-42754dd58f96	2324	Lovrenc na Dravskem polju
00050000-561d-0585-2f2c-0a39645de56b	2344	Lovrenc na Pohorju
00050000-561d-0585-3ec5-6e6e2169f7a4	3334	Luče
00050000-561d-0585-b8a5-ccb52903247b	1225	Lukovica
00050000-561d-0585-8cbc-15119bb7a634	9202	Mačkovci
00050000-561d-0585-4401-c87007595c50	2322	Majšperk
00050000-561d-0585-8f0f-ef6c4a4be7a5	2321	Makole
00050000-561d-0585-a972-b5e8bfff9997	9243	Mala Nedelja
00050000-561d-0585-664c-b22f68e97451	2229	Malečnik
00050000-561d-0585-ee90-67f2076be31c	6273	Marezige
00050000-561d-0585-daa6-f993fbd7c1c1	2000	Maribor 
00050000-561d-0585-c5e7-3d561c1b9e55	2001	Maribor - poštni predali
00050000-561d-0585-b65d-9005b663beb0	2206	Marjeta na Dravskem polju
00050000-561d-0585-f9d2-da0aee44b3c6	2281	Markovci
00050000-561d-0585-5ae4-712199d8ad9c	9221	Martjanci
00050000-561d-0585-4b80-8cf4409c586b	6242	Materija
00050000-561d-0585-4875-68335186d70f	4211	Mavčiče
00050000-561d-0585-7643-9b5f00bd27ea	1215	Medvode
00050000-561d-0585-2046-f755bbf19627	1234	Mengeš
00050000-561d-0585-13c3-8ffeec5f0175	8330	Metlika
00050000-561d-0585-a68d-33ecb59826db	2392	Mežica
00050000-561d-0585-856e-40c705a33127	2204	Miklavž na Dravskem polju
00050000-561d-0585-5095-42da0920e6c7	2275	Miklavž pri Ormožu
00050000-561d-0585-5031-466e976c18aa	5291	Miren
00050000-561d-0585-66d0-2d545d23e47c	8233	Mirna
00050000-561d-0585-21e5-d8d36af424d2	8216	Mirna Peč
00050000-561d-0585-496f-df41334849c7	2382	Mislinja
00050000-561d-0585-12c0-0a2f8a3dbdae	4281	Mojstrana
00050000-561d-0585-db29-dcc2953cbaf8	8230	Mokronog
00050000-561d-0585-6031-70174e67c027	1251	Moravče
00050000-561d-0585-40d3-a08c75bfbcee	9226	Moravske Toplice
00050000-561d-0585-6655-cb1d68a60ebc	5216	Most na Soči
00050000-561d-0585-59bf-fdd6c1735499	1221	Motnik
00050000-561d-0585-741d-df8a461ab217	3330	Mozirje
00050000-561d-0585-d537-c565a3efe6c4	9000	Murska Sobota 
00050000-561d-0585-73c1-d4311e65a20e	9001	Murska Sobota - poštni predali
00050000-561d-0585-7c94-7d8babc0d9a3	2366	Muta
00050000-561d-0585-f0b9-325c6a94b965	4202	Naklo
00050000-561d-0585-bf4b-6a5a42af3500	3331	Nazarje
00050000-561d-0585-96d7-b947eeb8a531	1357	Notranje Gorice
00050000-561d-0585-4839-49982dc65a59	3203	Nova Cerkev
00050000-561d-0585-6380-ce574cad3c6a	5000	Nova Gorica 
00050000-561d-0585-7868-1b9b76caed2a	5001	Nova Gorica - poštni predali
00050000-561d-0585-a9aa-bf89f982cc24	1385	Nova vas
00050000-561d-0585-e5fb-76e51e19380b	8000	Novo mesto
00050000-561d-0585-9920-e6f8499ec940	8001	Novo mesto - poštni predali
00050000-561d-0585-1517-987216a55b41	6243	Obrov
00050000-561d-0585-9bd8-aa276aa93445	9233	Odranci
00050000-561d-0585-469a-2eebe65e8bea	2317	Oplotnica
00050000-561d-0585-5b06-edaaf1b351a1	2312	Orehova vas
00050000-561d-0585-52ed-1750f7cfbae1	2270	Ormož
00050000-561d-0585-e5ea-b21a55766b7b	1316	Ortnek
00050000-561d-0585-3f0d-cb1662b4c5ab	1337	Osilnica
00050000-561d-0585-5786-a18726ae2175	8222	Otočec
00050000-561d-0585-45a3-ba3c393e6c17	2361	Ožbalt
00050000-561d-0585-83b4-fecf0be2f988	2231	Pernica
00050000-561d-0585-c775-e5cb70efc082	2211	Pesnica pri Mariboru
00050000-561d-0585-edcb-513c00cefc77	9203	Petrovci
00050000-561d-0585-8c7a-9ed1839c040e	3301	Petrovče
00050000-561d-0585-1399-3937fd0a24c6	6330	Piran/Pirano
00050000-561d-0585-b1ab-0c9b13983301	8255	Pišece
00050000-561d-0585-ee40-c041aab6e275	6257	Pivka
00050000-561d-0585-7fe6-d560ce1dbb12	6232	Planina
00050000-561d-0585-4d23-131f54701b37	3225	Planina pri Sevnici
00050000-561d-0585-2f41-39646de9b943	6276	Pobegi
00050000-561d-0585-59e0-26b32af6f28c	8312	Podbočje
00050000-561d-0585-50b2-23e646c81e58	5243	Podbrdo
00050000-561d-0585-a9fc-34c50e9efd3c	3254	Podčetrtek
00050000-561d-0585-893e-5c2c8dc31c68	2273	Podgorci
00050000-561d-0585-a52c-92b55c5a9b71	6216	Podgorje
00050000-561d-0585-7ffc-424fb422fc7b	2381	Podgorje pri Slovenj Gradcu
00050000-561d-0585-f25f-a9fc1785c43a	6244	Podgrad
00050000-561d-0585-816d-6f6539533016	1414	Podkum
00050000-561d-0585-b621-9f04c845ca9f	2286	Podlehnik
00050000-561d-0585-3179-aea86201bc15	5272	Podnanos
00050000-561d-0585-a0af-70c38add45c7	4244	Podnart
00050000-561d-0585-262e-a32af11bb898	3241	Podplat
00050000-561d-0585-fe12-b7359b868946	3257	Podsreda
00050000-561d-0585-a96b-2c4d9e1c2450	2363	Podvelka
00050000-561d-0585-5643-7e4d0b6eb530	2208	Pohorje
00050000-561d-0585-e398-a9b90ab88ffd	2257	Polenšak
00050000-561d-0585-c523-d62f3c3731db	1355	Polhov Gradec
00050000-561d-0585-7f08-14c091f50e4d	4223	Poljane nad Škofjo Loko
00050000-561d-0585-9828-4aa9c991b0ab	2319	Poljčane
00050000-561d-0585-8fea-7edfa09d760e	1272	Polšnik
00050000-561d-0585-05dd-692709f1a2ed	3313	Polzela
00050000-561d-0585-2d34-0a6e9f43f1a3	3232	Ponikva
00050000-561d-0585-00e8-a19e6acae435	6320	Portorož/Portorose
00050000-561d-0585-db76-0b9b346e1b1d	6230	Postojna
00050000-561d-0585-b613-356fd7257559	2331	Pragersko
00050000-561d-0585-0c87-2ceccce0d42c	3312	Prebold
00050000-561d-0585-3b99-34c7dcc1915d	4205	Preddvor
00050000-561d-0585-6a47-36e287c70058	6255	Prem
00050000-561d-0585-847a-740bca2e3729	1352	Preserje
00050000-561d-0585-807f-f8ccf24a49be	6258	Prestranek
00050000-561d-0585-effe-7aadd007884d	2391	Prevalje
00050000-561d-0585-c061-60c1f7a719a3	3262	Prevorje
00050000-561d-0585-898c-252995ec56ea	1276	Primskovo 
00050000-561d-0585-c209-5272867b7479	3253	Pristava pri Mestinju
00050000-561d-0585-f97c-c8d9e9f34447	9207	Prosenjakovci/Partosfalva
00050000-561d-0585-4ec1-84694d547bc8	5297	Prvačina
00050000-561d-0585-a8d4-13239fa2a3dc	2250	Ptuj
00050000-561d-0585-61dc-c402b7cf015b	2323	Ptujska Gora
00050000-561d-0585-78b6-8caad92ff975	9201	Puconci
00050000-561d-0585-3590-5b7ddad661e3	2327	Rače
00050000-561d-0585-204f-0c74d65a10fc	1433	Radeče
00050000-561d-0585-c62c-70b55edc73b0	9252	Radenci
00050000-561d-0585-1a4a-c02c42d94b56	2360	Radlje ob Dravi
00050000-561d-0585-a5d2-0cc51b60db05	1235	Radomlje
00050000-561d-0585-70fa-154ebb95bafb	4240	Radovljica
00050000-561d-0585-ac49-113a9a68a856	8274	Raka
00050000-561d-0585-e993-43ab37599a53	1381	Rakek
00050000-561d-0585-937c-76cb3a287eba	4283	Rateče - Planica
00050000-561d-0585-7eca-500248d05ba0	2390	Ravne na Koroškem
00050000-561d-0585-3b74-1c4b06c6518f	9246	Razkrižje
00050000-561d-0585-0746-9be1bc988eaa	3332	Rečica ob Savinji
00050000-561d-0585-518a-8d6d33ce8200	5292	Renče
00050000-561d-0585-226f-03087f9dc2c6	1310	Ribnica
00050000-561d-0585-4822-763639a9b9bd	2364	Ribnica na Pohorju
00050000-561d-0585-e66a-4b943c2de22c	3272	Rimske Toplice
00050000-561d-0585-815d-576a2954b13c	1314	Rob
00050000-561d-0585-a1d4-1ce09c94bb05	5215	Ročinj
00050000-561d-0585-f394-99a0d903b1f3	3250	Rogaška Slatina
00050000-561d-0585-f14e-0b780a217abc	9262	Rogašovci
00050000-561d-0585-9350-08b615eeba21	3252	Rogatec
00050000-561d-0585-222f-55dde799a89c	1373	Rovte
00050000-561d-0585-2f60-18b2ed4b0807	2342	Ruše
00050000-561d-0585-4b43-ba5873451cbf	1282	Sava
00050000-561d-0585-8d82-cd1b1dcf9e0c	6333	Sečovlje/Sicciole
00050000-561d-0585-1fad-12d4b9cf4d2c	4227	Selca
00050000-561d-0585-7845-1c75da5db9c9	2352	Selnica ob Dravi
00050000-561d-0585-9904-049e77dad2ea	8333	Semič
00050000-561d-0585-b194-c7943740c7b0	8281	Senovo
00050000-561d-0585-a791-679ccb98b28b	6224	Senožeče
00050000-561d-0585-ddc0-a08416c0a717	8290	Sevnica
00050000-561d-0585-7b0e-d9aa6fe4f9f1	6210	Sežana
00050000-561d-0585-73ef-9802319abd2b	2214	Sladki Vrh
00050000-561d-0585-3a1e-1686a7a5030b	5283	Slap ob Idrijci
00050000-561d-0585-320d-c9c351a6ab34	2380	Slovenj Gradec
00050000-561d-0585-5553-b50c86b11646	2310	Slovenska Bistrica
00050000-561d-0585-da81-f88fdcbc9449	3210	Slovenske Konjice
00050000-561d-0585-ebcf-11b1280507d5	1216	Smlednik
00050000-561d-0585-37c7-a161ae2cdd1f	5232	Soča
00050000-561d-0585-b451-21d0b0cf91e4	1317	Sodražica
00050000-561d-0585-6cf8-fe71cf555fa5	3335	Solčava
00050000-561d-0585-5249-5aab795ee45c	5250	Solkan
00050000-561d-0585-47d7-711e5d1ec1ab	4229	Sorica
00050000-561d-0585-8c69-30ebf7a397d4	4225	Sovodenj
00050000-561d-0585-7a3f-c9897b504987	5281	Spodnja Idrija
00050000-561d-0585-73d6-c62650ba072f	2241	Spodnji Duplek
00050000-561d-0585-60d8-92de4b8a1e01	9245	Spodnji Ivanjci
00050000-561d-0585-7e80-3c99b25edfa1	2277	Središče ob Dravi
00050000-561d-0585-15e9-5fbd02216c57	4267	Srednja vas v Bohinju
00050000-561d-0585-a451-96366ae0f4c6	8256	Sromlje 
00050000-561d-0585-6654-f3c99152863d	5224	Srpenica
00050000-561d-0585-f0e6-bfdd957f6d38	1242	Stahovica
00050000-561d-0585-ccaf-fff6b250a292	1332	Stara Cerkev
00050000-561d-0585-eb3c-a28d8c4fbf89	8342	Stari trg ob Kolpi
00050000-561d-0585-86da-c2877ba822eb	1386	Stari trg pri Ložu
00050000-561d-0585-14ca-e3a3ebdb4a50	2205	Starše
00050000-561d-0585-1adc-6825851f164c	2289	Stoperce
00050000-561d-0585-3dbc-6311b780e367	8322	Stopiče
00050000-561d-0585-b4ed-072ce7d00ff9	3206	Stranice
00050000-561d-0585-c014-41f68e44ba1d	8351	Straža
00050000-561d-0585-a363-e8286b6e652f	1313	Struge
00050000-561d-0585-2e07-56871be51768	8293	Studenec
00050000-561d-0585-dbba-9384149f6633	8331	Suhor
00050000-561d-0585-66c5-3f230bd9b9c1	2233	Sv. Ana v Slovenskih goricah
00050000-561d-0585-8467-78713e349f3d	2235	Sv. Trojica v Slovenskih goricah
00050000-561d-0585-012e-dc5706d7f6f4	2353	Sveti Duh na Ostrem Vrhu
00050000-561d-0585-ac07-d23714e4b8ac	9244	Sveti Jurij ob Ščavnici
00050000-561d-0585-ceb1-10485d5da8f7	3264	Sveti Štefan
00050000-561d-0585-60b9-689d6a09237d	2258	Sveti Tomaž
00050000-561d-0585-6040-dfe3ecd41a28	9204	Šalovci
00050000-561d-0585-92ff-41183a714030	5261	Šempas
00050000-561d-0585-6733-037dccf95888	5290	Šempeter pri Gorici
00050000-561d-0585-99ab-3504d4f1dbef	3311	Šempeter v Savinjski dolini
00050000-561d-0585-c772-60928d1048a0	4208	Šenčur
00050000-561d-0585-1070-ede62c15f7d0	2212	Šentilj v Slovenskih goricah
00050000-561d-0585-f319-f97717d034f9	8297	Šentjanž
00050000-561d-0585-647a-7fb3d015ac47	2373	Šentjanž pri Dravogradu
00050000-561d-0585-3229-9b969c9f4ab9	8310	Šentjernej
00050000-561d-0585-670c-874bfb117af8	3230	Šentjur
00050000-561d-0585-ae18-57c420628e85	3271	Šentrupert
00050000-561d-0585-edb0-71803011e77e	8232	Šentrupert
00050000-561d-0585-9e66-95cef628d5fd	1296	Šentvid pri Stični
00050000-561d-0585-cb27-59d7047cfb6c	8275	Škocjan
00050000-561d-0585-8204-e087364354eb	6281	Škofije
00050000-561d-0585-1a43-ff1c77438054	4220	Škofja Loka
00050000-561d-0585-e97b-bfbcb0f1245d	3211	Škofja vas
00050000-561d-0585-692c-1588b1bddd5a	1291	Škofljica
00050000-561d-0585-470b-36df5df78424	6274	Šmarje
00050000-561d-0585-7ff5-0c41878972b0	1293	Šmarje - Sap
00050000-561d-0585-8398-2a3b99a223af	3240	Šmarje pri Jelšah
00050000-561d-0585-2c2b-bbd651a60347	8220	Šmarješke Toplice
00050000-561d-0585-6a03-6deab7576b3a	2315	Šmartno na Pohorju
00050000-561d-0585-2125-555ae92b4d83	3341	Šmartno ob Dreti
00050000-561d-0585-df70-b30ca9bd778b	3327	Šmartno ob Paki
00050000-561d-0585-2ba5-aa611345e3dc	1275	Šmartno pri Litiji
00050000-561d-0585-e0d5-cbdce2157cd9	2383	Šmartno pri Slovenj Gradcu
00050000-561d-0585-efa3-3fc6beab4327	3201	Šmartno v Rožni dolini
00050000-561d-0585-724b-3dce3ef78bff	3325	Šoštanj
00050000-561d-0585-3bb2-99f02342e5a8	6222	Štanjel
00050000-561d-0585-3a86-385a1a83c60f	3220	Štore
00050000-561d-0585-b77f-827c51d23f56	3304	Tabor
00050000-561d-0585-311d-21ac9e49513e	3221	Teharje
00050000-561d-0585-1e9e-0656fc3c1d3d	9251	Tišina
00050000-561d-0585-ffc5-5f402c4bf6e0	5220	Tolmin
00050000-561d-0585-32d2-cfab45002805	3326	Topolšica
00050000-561d-0585-440f-a24b9c52b24b	2371	Trbonje
00050000-561d-0585-375e-8386f7dc5d07	1420	Trbovlje
00050000-561d-0585-a71d-c086d23fc167	8231	Trebelno 
00050000-561d-0585-b575-d11a8492e81e	8210	Trebnje
00050000-561d-0585-8e04-abc50e9b430f	5252	Trnovo pri Gorici
00050000-561d-0585-68c2-bd16eab2a171	2254	Trnovska vas
00050000-561d-0585-2e1c-69c8f3cf1849	1222	Trojane
00050000-561d-0585-d38e-d5e4e8c23412	1236	Trzin
00050000-561d-0585-44d7-f3c1242b4004	4290	Tržič
00050000-561d-0585-bdcb-42750f78f348	8295	Tržišče
00050000-561d-0585-ebf3-6ab964c6d1e6	1311	Turjak
00050000-561d-0585-f52b-bf2d288f11fa	9224	Turnišče
00050000-561d-0585-cc0a-dc90a492d25f	8323	Uršna sela
00050000-561d-0585-468a-d018d1e0558a	1252	Vače
00050000-561d-0585-d88a-2cd5540b7617	3320	Velenje 
00050000-561d-0585-857f-844b61317f20	3322	Velenje - poštni predali
00050000-561d-0585-2ee6-888757274b38	8212	Velika Loka
00050000-561d-0585-5776-480aeabeacce	2274	Velika Nedelja
00050000-561d-0585-dafe-bbdb4cc228df	9225	Velika Polana
00050000-561d-0585-d0a9-fff625ad46c8	1315	Velike Lašče
00050000-561d-0585-d5cd-9feb549a96aa	8213	Veliki Gaber
00050000-561d-0585-d915-024d3f6fe0e5	9241	Veržej
00050000-561d-0585-977f-0ffe8a4e3275	1312	Videm - Dobrepolje
00050000-561d-0585-d3ee-7999f8dfd370	2284	Videm pri Ptuju
00050000-561d-0585-cfd5-d41ec3db8e50	8344	Vinica
00050000-561d-0585-dfad-0dc290c190e6	5271	Vipava
00050000-561d-0585-165f-af11991b4486	4212	Visoko
00050000-561d-0585-a8cb-11b512623539	1294	Višnja Gora
00050000-561d-0585-6114-607d94415c23	3205	Vitanje
00050000-561d-0585-2dc9-34e453889b52	2255	Vitomarci
00050000-561d-0585-e282-02806354d0e1	1217	Vodice
00050000-561d-0585-d901-143f07b77079	3212	Vojnik\t
00050000-561d-0585-bb4a-0d62a1d94f70	5293	Volčja Draga
00050000-561d-0585-7f49-98dd6b824555	2232	Voličina
00050000-561d-0585-8cb3-ad30e8655edc	3305	Vransko
00050000-561d-0585-cee5-6f91a7a62206	6217	Vremski Britof
00050000-561d-0585-4b4c-dd10b1624b8b	1360	Vrhnika
00050000-561d-0585-9acd-9e9716513c46	2365	Vuhred
00050000-561d-0585-a1c4-b2e7f4d19cee	2367	Vuzenica
00050000-561d-0585-d663-524d9b3ff0ca	8292	Zabukovje 
00050000-561d-0585-80c6-d65cd68ba0d0	1410	Zagorje ob Savi
00050000-561d-0585-04da-6ea929673197	1303	Zagradec
00050000-561d-0585-d6b9-651cb3eee17b	2283	Zavrč
00050000-561d-0585-2d3e-864d7a5545a4	8272	Zdole 
00050000-561d-0585-540e-d1fe44c13e89	4201	Zgornja Besnica
00050000-561d-0585-1c6b-19f483269e13	2242	Zgornja Korena
00050000-561d-0585-ef4a-56ef957e5cca	2201	Zgornja Kungota
00050000-561d-0585-a270-1932c33f69cf	2316	Zgornja Ložnica
00050000-561d-0585-abef-dd0d32cdc114	2314	Zgornja Polskava
00050000-561d-0585-630e-4e8c57373a70	2213	Zgornja Velka
00050000-561d-0585-cd2b-45c8b8bd769d	4247	Zgornje Gorje
00050000-561d-0585-bce6-238da0bfcf16	4206	Zgornje Jezersko
00050000-561d-0585-00ac-49f7d4dd1e52	2285	Zgornji Leskovec
00050000-561d-0585-19cd-a69144a9e34c	1432	Zidani Most
00050000-561d-0585-538a-c24e11c114f8	3214	Zreče
00050000-561d-0585-5173-41154bfde605	4209	Žabnica
00050000-561d-0585-8161-d5a857bbad35	3310	Žalec
00050000-561d-0585-26eb-d7f2aa2bbf16	4228	Železniki
00050000-561d-0585-6563-24007df62571	2287	Žetale
00050000-561d-0585-6414-cf04e8857098	4226	Žiri
00050000-561d-0585-d93a-2173a8a8870a	4274	Žirovnica
00050000-561d-0585-868a-1a3f38deab7a	8360	Žužemberk
\.


--
-- TOC entry 3068 (class 0 OID 21893770)
-- Dependencies: 233
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 21893363)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21893143)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561d-0588-47a5-f50c9d86fd79	00080000-561d-0588-2f7d-ff5c51564e16	\N	00040000-561d-0586-2561-bad64c0ebe54	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561d-0588-b3c8-3fb6349a04e7	00080000-561d-0588-2f7d-ff5c51564e16	\N	00040000-561d-0586-2561-bad64c0ebe54	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561d-0588-858f-6d98110633f6	00080000-561d-0588-36cb-f0df16e7f96f	\N	00040000-561d-0586-2561-bad64c0ebe54	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3030 (class 0 OID 21893247)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 21893375)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 21893784)
-- Dependencies: 234
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 21893794)
-- Dependencies: 235
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561d-0588-d9ab-91d807b3c041	00080000-561d-0588-bd2c-4dd7ab9db424	0987	AK
00190000-561d-0588-7a7f-9ff37ccd32ce	00080000-561d-0588-36cb-f0df16e7f96f	0989	AK
00190000-561d-0588-105c-5dac82febdbe	00080000-561d-0588-cdb0-9f1463b5039f	0986	AK
00190000-561d-0588-2c4b-314a00a5afa4	00080000-561d-0588-f9e9-f715c189efaf	0984	AK
00190000-561d-0588-6718-a31aa3a10ef6	00080000-561d-0588-2d71-5092d3b06b1b	0983	AK
00190000-561d-0588-c1db-6b8dc26ee96c	00080000-561d-0588-d71b-7c896cfd4643	0982	AK
00190000-561d-058a-9ab7-cec983e63e20	00080000-561d-058a-59f8-90d07a764164	1001	AK
\.


--
-- TOC entry 3067 (class 0 OID 21893709)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561d-0589-09fc-c6fd41f6f677	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3071 (class 0 OID 21893802)
-- Dependencies: 236
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 21893404)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561d-0588-aacd-fef7d1f00192	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561d-0588-835f-a4c55cc08c3b	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561d-0588-e711-adb4a3630005	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561d-0588-9199-36bd1df607a4	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561d-0588-795a-b7a14953a099	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561d-0588-4e76-7b2d01b0ca0f	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561d-0588-8e2e-77a9950748a6	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3039 (class 0 OID 21893348)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21893338)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 21893548)
-- Dependencies: 225
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21893478)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 21893221)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21893006)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561d-058a-59f8-90d07a764164	00010000-561d-0586-c839-efd3295095be	2015-10-13 15:22:18	INS	a:0:{}
2	App\\Entity\\Option	00000000-561d-058a-f594-1706a466b969	00010000-561d-0586-c839-efd3295095be	2015-10-13 15:22:18	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561d-058a-9ab7-cec983e63e20	00010000-561d-0586-c839-efd3295095be	2015-10-13 15:22:18	INS	a:0:{}
\.


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3048 (class 0 OID 21893417)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21893044)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561d-0586-f891-536361b956e3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561d-0586-4a0f-f283f0179cfd	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561d-0586-78fb-90720e60d18a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561d-0586-d55d-f6ed543818a1	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561d-0586-e3f2-0ee97582ef33	planer	Planer dogodkov v koledarju	t
00020000-561d-0586-2d0e-cd72d778ebee	kadrovska	Kadrovska služba	t
00020000-561d-0586-c9ab-8c525739d4b5	arhivar	Ažuriranje arhivalij	t
00020000-561d-0586-02f5-1ff8e117fcb2	igralec	Igralec	t
00020000-561d-0586-04a2-7283f50ada02	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561d-0588-b27a-d2e15f0c0364	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3012 (class 0 OID 21893028)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561d-0586-e61a-c41500bfba07	00020000-561d-0586-78fb-90720e60d18a
00010000-561d-0586-c839-efd3295095be	00020000-561d-0586-78fb-90720e60d18a
00010000-561d-0588-4f4d-a2957405f1a7	00020000-561d-0588-b27a-d2e15f0c0364
\.


--
-- TOC entry 3050 (class 0 OID 21893431)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21893369)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21893315)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 21892993)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561d-0585-cd36-2e318c0f9f57	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561d-0585-8635-2f45a5267b71	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561d-0585-98de-8e025b356f2b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561d-0585-8039-8bb2e0483eff	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561d-0585-77ef-926690b3e042	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3007 (class 0 OID 21892985)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561d-0585-7686-9b41f9c36978	00230000-561d-0585-8039-8bb2e0483eff	popa
00240000-561d-0585-0a23-72c5842d4090	00230000-561d-0585-8039-8bb2e0483eff	oseba
00240000-561d-0585-f624-607afaf8eeda	00230000-561d-0585-8039-8bb2e0483eff	sezona
00240000-561d-0585-fa6a-9fdb95903fd3	00230000-561d-0585-8635-2f45a5267b71	prostor
00240000-561d-0585-6229-dbac2e67bd61	00230000-561d-0585-8039-8bb2e0483eff	besedilo
00240000-561d-0585-25ff-786cd4a3d198	00230000-561d-0585-8039-8bb2e0483eff	uprizoritev
00240000-561d-0585-e5ea-daaba017ade5	00230000-561d-0585-8039-8bb2e0483eff	funkcija
00240000-561d-0585-25f9-29b17a18d95f	00230000-561d-0585-8039-8bb2e0483eff	tipfunkcije
00240000-561d-0585-b9c1-b3d8370c36a5	00230000-561d-0585-8039-8bb2e0483eff	alternacija
00240000-561d-0585-b1bb-3fa819debd9d	00230000-561d-0585-cd36-2e318c0f9f57	pogodba
00240000-561d-0585-f270-822bf71bed3e	00230000-561d-0585-8039-8bb2e0483eff	zaposlitev
00240000-561d-0585-3b6b-f9bcfdb08e2e	00230000-561d-0585-8039-8bb2e0483eff	zvrstuprizoritve
00240000-561d-0585-2539-6ebdc8f5dde0	00230000-561d-0585-cd36-2e318c0f9f57	programdela
00240000-561d-0585-2df3-7f418a7b999d	00230000-561d-0585-8039-8bb2e0483eff	zapis
\.


--
-- TOC entry 3006 (class 0 OID 21892980)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
b55baaf4-1a20-46eb-836f-f31774d1f679	00240000-561d-0585-7686-9b41f9c36978	0	1001
\.


--
-- TOC entry 3056 (class 0 OID 21893495)
-- Dependencies: 221
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561d-0589-4f3e-4a8206dff7bc	000e0000-561d-0588-b511-533770fa07e9	00080000-561d-0588-2f7d-ff5c51564e16	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561d-0586-b520-efe9902699a5
00270000-561d-0589-6e72-825fa3c697d1	000e0000-561d-0588-b511-533770fa07e9	00080000-561d-0588-2f7d-ff5c51564e16	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561d-0586-b520-efe9902699a5
\.


--
-- TOC entry 3020 (class 0 OID 21893115)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21893325)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-561d-0589-372c-0b7661ecf987	00180000-561d-0589-bc49-616bed5d9c2f	000c0000-561d-0589-ec0d-6019cb3f66af	00090000-561d-0588-b709-9e1d02f850a2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561d-0589-7324-d0d734ee025c	00180000-561d-0589-bc49-616bed5d9c2f	000c0000-561d-0589-aa86-6abf2801c17e	00090000-561d-0588-3a23-fc269ef18f98	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561d-0589-e7f2-b88c053a14c4	00180000-561d-0589-bc49-616bed5d9c2f	000c0000-561d-0589-a5e2-932969925682	00090000-561d-0588-ed82-f007b41da912	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561d-0589-bae7-7c3b0facdb16	00180000-561d-0589-bc49-616bed5d9c2f	000c0000-561d-0589-2d5c-01089d52f38a	00090000-561d-0588-da5f-6bc838f53abf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561d-0589-c405-93cd0760ae67	00180000-561d-0589-bc49-616bed5d9c2f	000c0000-561d-0589-9c29-616bdb34ae0d	00090000-561d-0588-3dd9-0f17c9555839	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561d-0589-b87b-46d7c103cd3a	00180000-561d-0589-613a-8ab61afed284	\N	00090000-561d-0588-3dd9-0f17c9555839	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3059 (class 0 OID 21893536)
-- Dependencies: 224
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561d-0585-c659-0d7b9409d8b4	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561d-0585-512a-81d11673b659	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561d-0585-803a-325522ba7ecf	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561d-0585-0889-913dd4ba2244	04	Režija	Režija	Režija	umetnik	30
000f0000-561d-0585-1881-2c8e9ce1aad2	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561d-0585-1eeb-5123e11cf2ba	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561d-0585-2f41-807189aabf5b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561d-0585-1cd4-b958c8e9035e	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561d-0585-4ce2-5deae3b5dd3c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561d-0585-8e3f-76cdc6e4df8a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561d-0585-b6e3-62934b4670f6	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561d-0585-ccd8-a8486a4bf284	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561d-0585-d603-ea38c7e3e9bd	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561d-0585-d2cd-ccc09f11774c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561d-0585-84a5-eff3197171a7	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561d-0585-3d15-9880929d869b	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561d-0585-e420-89bef4315a3c	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561d-0585-0f8c-45db3510db94	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3017 (class 0 OID 21893070)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, ime, opis, sort) FROM stdin;
00400000-561d-0588-8c2a-960b7a32d881	šola	osnovna ali srednja šola	1
00400000-561d-0588-fac6-9d5fdf22bd66	gledalec	gledalec, ki ima abonma ali podobno	2
00400000-561d-0588-b358-63882c1cb8fa	sponzor	sponzor dogodkov	3
\.


--
-- TOC entry 3072 (class 0 OID 21893813)
-- Dependencies: 237
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561d-0585-737d-a5b98b4ffe7d	01	Velika predstava	f	1.00	1.00
002b0000-561d-0585-d471-d82058e5bfd9	02	Mala predstava	f	0.50	0.50
002b0000-561d-0585-ce02-266702efdb78	03	Mala koprodukcija	t	0.40	1.00
002b0000-561d-0585-aa45-fad9c557f218	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561d-0585-49c3-932f989bb39b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3025 (class 0 OID 21893178)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 21893015)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561d-0586-c839-efd3295095be	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROmleMPnPaWTu2ungUSq5G7gH.zSMMkJe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561d-0588-2535-508d0a151bcc	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561d-0588-7047-833a5c4a24e3	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561d-0588-3545-04459781ffba	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561d-0588-ea87-724c2e24bbd0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561d-0588-fbfc-25cc8b73753e	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561d-0588-94fa-d171611b0cac	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561d-0588-a8d6-4c44e7d1e36b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561d-0588-7abb-009fac46c193	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561d-0588-ed67-4659b8e1b711	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561d-0588-4f4d-a2957405f1a7	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561d-0586-e61a-c41500bfba07	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3063 (class 0 OID 21893586)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561d-0588-d096-7d0dec3bd1fb	00160000-561d-0588-0163-a27c573caf9e	\N	00140000-561d-0585-a8f1-2f6eb3ec7d3c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561d-0588-795a-b7a14953a099
000e0000-561d-0588-b511-533770fa07e9	00160000-561d-0588-e834-4d9d9f9a4f84	\N	00140000-561d-0585-0d44-2d00ee1a9daa	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561d-0588-4e76-7b2d01b0ca0f
000e0000-561d-0588-6741-7c22439d9ddd	\N	\N	00140000-561d-0585-0d44-2d00ee1a9daa	00190000-561d-0588-d9ab-91d807b3c041	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561d-0588-795a-b7a14953a099
000e0000-561d-0588-be8d-0392ecdee765	\N	\N	00140000-561d-0585-0d44-2d00ee1a9daa	00190000-561d-0588-d9ab-91d807b3c041	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561d-0588-795a-b7a14953a099
000e0000-561d-0588-c2f1-4c18c42fa1ca	\N	\N	00140000-561d-0585-0d44-2d00ee1a9daa	00190000-561d-0588-d9ab-91d807b3c041	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561d-0588-aacd-fef7d1f00192
000e0000-561d-0588-4f3a-e0fb1139af48	\N	\N	00140000-561d-0585-0d44-2d00ee1a9daa	00190000-561d-0588-d9ab-91d807b3c041	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561d-0588-aacd-fef7d1f00192
\.


--
-- TOC entry 3032 (class 0 OID 21893269)
-- Dependencies: 197
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561d-0589-8b63-12f43548d635	000e0000-561d-0588-b511-533770fa07e9	\N	1	
00200000-561d-0589-a104-14aac5ceeeb6	000e0000-561d-0588-b511-533770fa07e9	\N	2	
00200000-561d-0589-1043-59246a398d08	000e0000-561d-0588-b511-533770fa07e9	\N	3	
00200000-561d-0589-b91d-8d3bbad1cee6	000e0000-561d-0588-b511-533770fa07e9	\N	4	
00200000-561d-0589-369f-a8cfe1851e63	000e0000-561d-0588-b511-533770fa07e9	\N	5	
\.


--
-- TOC entry 3046 (class 0 OID 21893396)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 21893509)
-- Dependencies: 222
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561d-0586-44b7-b34910a3d90b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561d-0586-a02b-6aa77ae2a1cb	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561d-0586-22cc-6d3a8bef5eec	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561d-0586-2764-609356df130f	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561d-0586-65ee-1b5e5bd778b4	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561d-0586-685e-114e39b3c7e1	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561d-0586-d0a7-2a3286af6f8f	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561d-0586-cf14-0f8a7339a08b	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561d-0586-b520-efe9902699a5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561d-0586-5fe0-ec6930bb0760	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561d-0586-8e8c-589d94c809b8	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561d-0586-4fa8-5989b6470736	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561d-0586-c377-e9688e83f5fa	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561d-0586-534e-9a174bab50d1	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561d-0586-7e63-1ac0445714c2	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561d-0586-a82b-768f9540567e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561d-0586-ae7b-86dc31cd3203	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561d-0586-70ef-656485ad6e76	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561d-0586-78a9-914e6474571d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561d-0586-f12e-c79130614759	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561d-0586-166d-65b96c1e95ea	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561d-0586-98d3-9ee27f32455d	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561d-0586-6d11-1cf178459bd1	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561d-0586-03c3-2a7f844df546	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561d-0586-7c98-196810efe6ce	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561d-0586-bdf8-6948f7903f23	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561d-0586-248b-e22fb0c63479	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561d-0586-e898-814c59245a3e	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3075 (class 0 OID 21893860)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 21893832)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 21893872)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 21893468)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-561d-0588-fee0-49b69bd8b89c	00090000-561d-0588-3a23-fc269ef18f98	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-561d-0588-4bdd-8b7f444ea43b	00090000-561d-0588-ed82-f007b41da912	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-561d-0588-308f-1fd82a6092fb	00090000-561d-0588-83ac-1e0f6f5c2212	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-561d-0588-e753-2dadd72456a0	00090000-561d-0588-2008-b44879bd94fe	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-561d-0588-d5e5-ef999536d4ec	00090000-561d-0588-b709-9e1d02f850a2	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-561d-0588-09c0-a22c3aaa9859	00090000-561d-0588-b6a1-5a01fec0e1ac	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3034 (class 0 OID 21893304)
-- Dependencies: 199
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 21893576)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561d-0585-a8f1-2f6eb3ec7d3c	01	Drama	drama (SURS 01)
00140000-561d-0585-8c90-65f6fd08b8e5	02	Opera	opera (SURS 02)
00140000-561d-0585-1b0c-91f344a8a58a	03	Balet	balet (SURS 03)
00140000-561d-0585-4322-949058a1a409	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561d-0585-b199-abfb198f6063	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561d-0585-0d44-2d00ee1a9daa	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561d-0585-aa15-d4de59c6148e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3052 (class 0 OID 21893458)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2533 (class 2606 OID 21893069)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 21893635)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 21893625)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 21893492)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 21893534)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 21893912)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 21893293)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 21893314)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 21893830)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 21893204)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 21893703)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 21893454)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21893267)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 21893242)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21893218)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 21893361)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 21893889)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 21893896)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2791 (class 2606 OID 21893920)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21729918)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2649 (class 2606 OID 21893388)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 21893176)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 21893087)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 21893111)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 21893058)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2524 (class 2606 OID 21893043)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 21893394)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 21893430)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 21893571)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 21893139)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 21893164)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 21893782)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 21893367)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 21893154)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 21893255)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 21893379)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 21893791)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 21893799)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 21893769)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 21893811)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 21893412)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 21893352)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 21893343)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 21893558)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 21893485)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 21893230)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 21893014)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21893421)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 21893032)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2526 (class 2606 OID 21893052)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 21893439)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21893374)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21893323)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 21893002)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 21892990)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 21892984)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 21893505)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 21893120)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 21893334)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 21893545)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 21893077)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 21893823)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 21893189)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 21893027)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 21893604)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 21893277)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 21893402)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 21893517)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 21893870)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 21893854)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 21893878)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 21893476)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 21893308)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21893584)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 21893466)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 1259 OID 21893302)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2602 (class 1259 OID 21893303)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2603 (class 1259 OID 21893301)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2604 (class 1259 OID 21893300)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2605 (class 1259 OID 21893299)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2691 (class 1259 OID 21893506)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2692 (class 1259 OID 21893507)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2693 (class 1259 OID 21893508)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2777 (class 1259 OID 21893891)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2778 (class 1259 OID 21893890)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2550 (class 1259 OID 21893141)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2551 (class 1259 OID 21893142)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2650 (class 1259 OID 21893395)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2764 (class 1259 OID 21893858)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2765 (class 1259 OID 21893857)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2766 (class 1259 OID 21893859)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2767 (class 1259 OID 21893856)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2768 (class 1259 OID 21893855)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 21893381)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2645 (class 1259 OID 21893380)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2596 (class 1259 OID 21893278)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2674 (class 1259 OID 21893455)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 21893457)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2676 (class 1259 OID 21893456)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 21893220)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 21893219)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2755 (class 1259 OID 21893812)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2707 (class 1259 OID 21893573)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2708 (class 1259 OID 21893574)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 21893575)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2774 (class 1259 OID 21893879)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2716 (class 1259 OID 21893609)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2717 (class 1259 OID 21893606)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2718 (class 1259 OID 21893610)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2719 (class 1259 OID 21893608)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2720 (class 1259 OID 21893607)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 21893191)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 21893190)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2541 (class 1259 OID 21893114)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2662 (class 1259 OID 21893422)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2528 (class 1259 OID 21893059)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2529 (class 1259 OID 21893060)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2667 (class 1259 OID 21893442)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2668 (class 1259 OID 21893441)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2669 (class 1259 OID 21893440)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2589 (class 1259 OID 21893256)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2590 (class 1259 OID 21893257)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2508 (class 1259 OID 21892992)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2624 (class 1259 OID 21893347)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2625 (class 1259 OID 21893345)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2626 (class 1259 OID 21893344)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2627 (class 1259 OID 21893346)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2519 (class 1259 OID 21893033)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2520 (class 1259 OID 21893034)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2653 (class 1259 OID 21893403)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2787 (class 1259 OID 21893913)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2689 (class 1259 OID 21893494)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2690 (class 1259 OID 21893493)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2788 (class 1259 OID 21893921)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2789 (class 1259 OID 21893922)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2639 (class 1259 OID 21893368)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2683 (class 1259 OID 21893486)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2684 (class 1259 OID 21893487)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2737 (class 1259 OID 21893708)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2738 (class 1259 OID 21893707)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2739 (class 1259 OID 21893704)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2740 (class 1259 OID 21893705)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2741 (class 1259 OID 21893706)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 21893156)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 21893155)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 21893157)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 21893416)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2657 (class 1259 OID 21893415)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2747 (class 1259 OID 21893792)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2748 (class 1259 OID 21893793)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2730 (class 1259 OID 21893639)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 21893640)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2732 (class 1259 OID 21893637)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2733 (class 1259 OID 21893638)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2680 (class 1259 OID 21893477)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2630 (class 1259 OID 21893356)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2631 (class 1259 OID 21893355)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2632 (class 1259 OID 21893353)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2633 (class 1259 OID 21893354)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2726 (class 1259 OID 21893627)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2727 (class 1259 OID 21893626)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2580 (class 1259 OID 21893231)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2583 (class 1259 OID 21893245)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2584 (class 1259 OID 21893244)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2585 (class 1259 OID 21893243)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 21893246)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2595 (class 1259 OID 21893268)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2744 (class 1259 OID 21893783)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2763 (class 1259 OID 21893831)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2781 (class 1259 OID 21893897)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2782 (class 1259 OID 21893898)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2537 (class 1259 OID 21893089)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2538 (class 1259 OID 21893088)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2546 (class 1259 OID 21893121)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 21893122)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 21893309)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 21893337)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 21893336)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2621 (class 1259 OID 21893335)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2606 (class 1259 OID 21893295)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2607 (class 1259 OID 21893296)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2608 (class 1259 OID 21893294)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2609 (class 1259 OID 21893298)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2610 (class 1259 OID 21893297)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 21893140)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 21893078)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2572 (class 1259 OID 21893205)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 21893207)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 21893206)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 21893208)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2638 (class 1259 OID 21893362)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 21893572)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 21893605)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 21893546)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 21893547)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2544 (class 1259 OID 21893112)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 21893113)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2677 (class 1259 OID 21893467)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2514 (class 1259 OID 21893003)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 21893177)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2511 (class 1259 OID 21892991)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2760 (class 1259 OID 21893824)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 21893414)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2661 (class 1259 OID 21893413)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2734 (class 1259 OID 21893636)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2562 (class 1259 OID 21893165)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 21893585)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2771 (class 1259 OID 21893871)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2753 (class 1259 OID 21893800)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2754 (class 1259 OID 21893801)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2700 (class 1259 OID 21893535)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2618 (class 1259 OID 21893324)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 21893053)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2823 (class 2606 OID 21894058)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2822 (class 2606 OID 21894063)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2818 (class 2606 OID 21894083)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2824 (class 2606 OID 21894053)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2820 (class 2606 OID 21894073)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2819 (class 2606 OID 21894078)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2821 (class 2606 OID 21894068)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2859 (class 2606 OID 21894248)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2858 (class 2606 OID 21894253)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2857 (class 2606 OID 21894258)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2891 (class 2606 OID 21894423)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2892 (class 2606 OID 21894418)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2804 (class 2606 OID 21893978)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2803 (class 2606 OID 21893983)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2841 (class 2606 OID 21894168)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2886 (class 2606 OID 21894403)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2887 (class 2606 OID 21894398)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2885 (class 2606 OID 21894408)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2888 (class 2606 OID 21894393)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2889 (class 2606 OID 21894388)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2839 (class 2606 OID 21894163)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2840 (class 2606 OID 21894158)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2817 (class 2606 OID 21894048)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2851 (class 2606 OID 21894208)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2849 (class 2606 OID 21894218)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2850 (class 2606 OID 21894213)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2810 (class 2606 OID 21894018)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 21894013)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2837 (class 2606 OID 21894148)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2883 (class 2606 OID 21894378)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2862 (class 2606 OID 21894263)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2861 (class 2606 OID 21894268)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2860 (class 2606 OID 21894273)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2890 (class 2606 OID 21894413)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2864 (class 2606 OID 21894293)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2867 (class 2606 OID 21894278)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2863 (class 2606 OID 21894298)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2865 (class 2606 OID 21894288)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2866 (class 2606 OID 21894283)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2808 (class 2606 OID 21894008)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2809 (class 2606 OID 21894003)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2799 (class 2606 OID 21893963)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2800 (class 2606 OID 21893958)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 21894188)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2796 (class 2606 OID 21893938)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2795 (class 2606 OID 21893943)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2846 (class 2606 OID 21894203)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2847 (class 2606 OID 21894198)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2848 (class 2606 OID 21894193)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2815 (class 2606 OID 21894033)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2814 (class 2606 OID 21894038)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2792 (class 2606 OID 21893923)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2829 (class 2606 OID 21894123)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2831 (class 2606 OID 21894113)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2832 (class 2606 OID 21894108)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2830 (class 2606 OID 21894118)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 21893928)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2793 (class 2606 OID 21893933)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2842 (class 2606 OID 21894173)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2895 (class 2606 OID 21894438)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2855 (class 2606 OID 21894243)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2856 (class 2606 OID 21894238)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2897 (class 2606 OID 21894443)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2896 (class 2606 OID 21894448)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2838 (class 2606 OID 21894153)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2854 (class 2606 OID 21894228)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2853 (class 2606 OID 21894233)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2874 (class 2606 OID 21894353)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2875 (class 2606 OID 21894348)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2878 (class 2606 OID 21894333)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2877 (class 2606 OID 21894338)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2876 (class 2606 OID 21894343)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2806 (class 2606 OID 21893993)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2807 (class 2606 OID 21893988)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2805 (class 2606 OID 21893998)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2843 (class 2606 OID 21894183)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2844 (class 2606 OID 21894178)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2881 (class 2606 OID 21894363)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2880 (class 2606 OID 21894368)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2871 (class 2606 OID 21894323)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2870 (class 2606 OID 21894328)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2873 (class 2606 OID 21894313)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2872 (class 2606 OID 21894318)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2852 (class 2606 OID 21894223)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2833 (class 2606 OID 21894143)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2834 (class 2606 OID 21894138)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2836 (class 2606 OID 21894128)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2835 (class 2606 OID 21894133)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2868 (class 2606 OID 21894308)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2869 (class 2606 OID 21894303)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2812 (class 2606 OID 21894023)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2813 (class 2606 OID 21894028)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 21894043)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2879 (class 2606 OID 21894358)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2882 (class 2606 OID 21894373)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2884 (class 2606 OID 21894383)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2894 (class 2606 OID 21894428)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2893 (class 2606 OID 21894433)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2797 (class 2606 OID 21893953)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2798 (class 2606 OID 21893948)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2802 (class 2606 OID 21893968)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2801 (class 2606 OID 21893973)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2825 (class 2606 OID 21894088)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2826 (class 2606 OID 21894103)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2827 (class 2606 OID 21894098)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2828 (class 2606 OID 21894093)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-13 15:22:20 CEST

--
-- PostgreSQL database dump complete
--

