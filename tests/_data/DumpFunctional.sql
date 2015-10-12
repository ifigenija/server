--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-12 14:41:57 CEST

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
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21718344)
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
-- TOC entry 229 (class 1259 OID 21718901)
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
-- TOC entry 228 (class 1259 OID 21718884)
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
-- TOC entry 219 (class 1259 OID 21718761)
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
-- TOC entry 222 (class 1259 OID 21718791)
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
-- TOC entry 243 (class 1259 OID 21719160)
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
-- TOC entry 197 (class 1259 OID 21718552)
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
-- TOC entry 199 (class 1259 OID 21718583)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21719086)
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
-- TOC entry 190 (class 1259 OID 21718465)
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
-- TOC entry 230 (class 1259 OID 21718914)
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
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
-- TOC entry 215 (class 1259 OID 21718716)
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
-- TOC entry 195 (class 1259 OID 21718531)
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
-- TOC entry 193 (class 1259 OID 21718505)
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
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21718482)
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
-- TOC entry 204 (class 1259 OID 21718630)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21719141)
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
-- TOC entry 242 (class 1259 OID 21719153)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21719175)
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
-- TOC entry 170 (class 1259 OID 21093458)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 21718655)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21718439)
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
-- TOC entry 182 (class 1259 OID 21718353)
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
-- TOC entry 183 (class 1259 OID 21718364)
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
-- TOC entry 178 (class 1259 OID 21718318)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21718337)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21718662)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21718696)
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
-- TOC entry 225 (class 1259 OID 21718832)
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
-- TOC entry 185 (class 1259 OID 21718397)
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
-- TOC entry 187 (class 1259 OID 21718431)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21719031)
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
-- TOC entry 205 (class 1259 OID 21718636)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21718416)
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
-- TOC entry 194 (class 1259 OID 21718520)
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
-- TOC entry 207 (class 1259 OID 21718648)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21719045)
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
-- TOC entry 234 (class 1259 OID 21719055)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21718978)
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
    stpremiervelikih integer,
    stpremiermalih integer,
    stpremiermalihkopr integer,
    stpremiervelikihkopr integer,
    stpremiersredkopr integer,
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
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
-- TOC entry 235 (class 1259 OID 21719063)
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
-- TOC entry 211 (class 1259 OID 21718677)
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
-- TOC entry 203 (class 1259 OID 21718621)
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
-- TOC entry 202 (class 1259 OID 21718611)
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
-- TOC entry 224 (class 1259 OID 21718821)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21718751)
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
-- TOC entry 192 (class 1259 OID 21718494)
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
-- TOC entry 175 (class 1259 OID 21718289)
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
-- TOC entry 174 (class 1259 OID 21718287)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21718690)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21718327)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21718311)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21718704)
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
-- TOC entry 206 (class 1259 OID 21718642)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21718588)
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
-- TOC entry 173 (class 1259 OID 21718276)
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
-- TOC entry 172 (class 1259 OID 21718268)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21718263)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21718768)
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
-- TOC entry 184 (class 1259 OID 21718389)
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
-- TOC entry 201 (class 1259 OID 21718598)
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
-- TOC entry 223 (class 1259 OID 21718809)
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
-- TOC entry 236 (class 1259 OID 21719074)
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
-- TOC entry 189 (class 1259 OID 21718451)
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
-- TOC entry 176 (class 1259 OID 21718298)
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
-- TOC entry 227 (class 1259 OID 21718859)
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
-- TOC entry 196 (class 1259 OID 21718542)
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
-- TOC entry 210 (class 1259 OID 21718669)
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
-- TOC entry 221 (class 1259 OID 21718782)
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
-- TOC entry 239 (class 1259 OID 21719121)
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
-- TOC entry 238 (class 1259 OID 21719093)
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
-- TOC entry 240 (class 1259 OID 21719133)
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
-- TOC entry 217 (class 1259 OID 21718741)
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
-- TOC entry 198 (class 1259 OID 21718577)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21718849)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21718731)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21718292)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2994 (class 0 OID 21718344)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21718901)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561b-aa92-a7a8-f1a39e85b52b	000d0000-561b-aa92-123e-873171325ec1	\N	00090000-561b-aa92-a858-410af23439f4	000b0000-561b-aa92-c4d2-e1d28d8e98f5	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561b-aa92-d989-ea154c7af78e	000d0000-561b-aa92-e9cb-a1dbe85b72d5	00100000-561b-aa92-0baa-f8ed85d98ba8	00090000-561b-aa92-9858-2ee3f9819673	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561b-aa92-66ac-cc2e6912f741	000d0000-561b-aa92-3b01-8dc3e6e188e8	00100000-561b-aa92-72d9-66484a9b94f1	00090000-561b-aa92-3705-497115dd9bbe	\N	0003	t	\N	2015-10-12	\N	2	t	\N	f	f
000c0000-561b-aa92-4597-cf324bd4110a	000d0000-561b-aa92-a9d2-46c206a83ffe	\N	00090000-561b-aa92-2528-f1e0ededb2d9	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561b-aa92-21e6-77729de0baf4	000d0000-561b-aa92-e942-c6efd3214be8	\N	00090000-561b-aa92-6bcb-76f28b4153b9	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561b-aa92-9701-4dd3d8c138d4	000d0000-561b-aa92-c1f9-e6e5684460b1	\N	00090000-561b-aa92-b772-bcc2e135f047	000b0000-561b-aa92-e344-4d05fe7ae021	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561b-aa92-43bf-d5626a494842	000d0000-561b-aa92-bc4e-1affc50c14ae	00100000-561b-aa92-3a61-4a964deb8d72	00090000-561b-aa92-a424-f6423a799940	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561b-aa92-1e0f-a400e8421c6f	000d0000-561b-aa92-2cae-fc2033920e1f	\N	00090000-561b-aa92-ac19-2e46ae6a5c78	000b0000-561b-aa92-748a-7034c1f7b10b	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561b-aa92-305f-936743b09c89	000d0000-561b-aa92-bc4e-1affc50c14ae	00100000-561b-aa92-4099-c04b160a137c	00090000-561b-aa92-bc4e-8cc0cbf5a4b6	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561b-aa92-af0e-e14962027533	000d0000-561b-aa92-bc4e-1affc50c14ae	00100000-561b-aa92-cf15-40b33a763c60	00090000-561b-aa92-ad13-91600139d4be	\N	0010	t	\N	2015-10-12	\N	16	f	\N	f	t
000c0000-561b-aa92-10b1-eb6fd282ccd0	000d0000-561b-aa92-bc4e-1affc50c14ae	00100000-561b-aa92-ee70-2bfee3044c11	00090000-561b-aa92-4da4-779eec23e748	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561b-aa92-71d9-a5c8a7b96ab8	000d0000-561b-aa92-e372-5d888af51058	\N	00090000-561b-aa92-9858-2ee3f9819673	000b0000-561b-aa92-bb78-d5fc0875df3b	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3041 (class 0 OID 21718884)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21718761)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561b-aa92-4ce2-37d75fe3374b	00160000-561b-aa92-20ca-e9b5f216338a	00090000-561b-aa92-bbad-b7d61ca4ff32	aizv	10	t
003d0000-561b-aa92-491d-156afcd10ee6	00160000-561b-aa92-20ca-e9b5f216338a	00090000-561b-aa92-0bea-2387e2564c28	apri	14	t
003d0000-561b-aa92-af13-c636fdee7bf0	00160000-561b-aa92-23c8-d8525f06b8ce	00090000-561b-aa92-1eb0-55b361523883	aizv	11	t
003d0000-561b-aa92-b43a-67d52c7b2d05	00160000-561b-aa92-188a-55fc79af0bf6	00090000-561b-aa92-7395-cc38ba630e65	aizv	12	t
003d0000-561b-aa92-8afa-56b94e5991cb	00160000-561b-aa92-20ca-e9b5f216338a	00090000-561b-aa92-2838-09280366abc1	apri	18	f
\.


--
-- TOC entry 3035 (class 0 OID 21718791)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561b-aa92-20ca-e9b5f216338a	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561b-aa92-23c8-d8525f06b8ce	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561b-aa92-188a-55fc79af0bf6	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3056 (class 0 OID 21719160)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21718552)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561b-aa92-9e6b-761a847df9ba	\N	\N	00200000-561b-aa92-d3c6-c3b7a6e02ab7	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561b-aa92-597d-cdf338b6b42f	\N	\N	00200000-561b-aa92-a3c4-fbb4c355db9b	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561b-aa92-ce44-1c73dacc5cc6	\N	\N	00200000-561b-aa92-eb5e-000ba6a8d56b	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561b-aa92-9b00-5b145646d830	\N	\N	00200000-561b-aa92-05d9-7cc916f587da	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561b-aa92-2bdd-4a51745f3144	\N	\N	00200000-561b-aa92-9296-5d520cd1d299	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3012 (class 0 OID 21718583)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 21719086)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21718465)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561b-aa90-ae7c-9a66f5446159	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561b-aa90-b538-b28435cfcd00	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561b-aa90-5ed2-23616612302a	AL	ALB	008	Albania 	Albanija	\N
00040000-561b-aa90-058c-ab748b3b95b0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561b-aa90-ce66-6c9b5cdb4a25	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561b-aa90-538d-c12f7e26e210	AD	AND	020	Andorra 	Andora	\N
00040000-561b-aa90-58cc-9be49aca9627	AO	AGO	024	Angola 	Angola	\N
00040000-561b-aa90-820b-2a6614418990	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561b-aa90-657e-5d16e62b357d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561b-aa90-ede9-7e7578735986	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561b-aa90-8d34-59195db7e098	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561b-aa90-4f10-28f307adf822	AM	ARM	051	Armenia 	Armenija	\N
00040000-561b-aa90-1d7d-8e53dc8278fa	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561b-aa90-a84b-758eb8377c5d	AU	AUS	036	Australia 	Avstralija	\N
00040000-561b-aa90-a1d5-da15098acc3b	AT	AUT	040	Austria 	Avstrija	\N
00040000-561b-aa90-22e7-09d33420f598	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561b-aa90-7b33-c4e0cfcd5f08	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561b-aa90-9976-d1c6d62197e8	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561b-aa90-952b-bed34f44647b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561b-aa90-9912-606f48659462	BB	BRB	052	Barbados 	Barbados	\N
00040000-561b-aa90-496d-9fd92dc787bd	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561b-aa90-501d-f036b29d7a1e	BE	BEL	056	Belgium 	Belgija	\N
00040000-561b-aa90-620b-1a29a210ce3e	BZ	BLZ	084	Belize 	Belize	\N
00040000-561b-aa90-42d8-e1ab1d3436a8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561b-aa90-f86b-ab440026102e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561b-aa90-81b8-a4a5727754a5	BT	BTN	064	Bhutan 	Butan	\N
00040000-561b-aa90-65cf-56b1524d5785	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561b-aa90-15ec-bfb07056a67d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561b-aa90-fff7-b76790eb6d69	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561b-aa90-2431-e6484e81e00d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561b-aa90-fef3-3b1bb44d7d70	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561b-aa90-4789-db938a05d38b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561b-aa90-d9d0-c24e3ec9a4da	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561b-aa90-fbb3-4a886ca95b7a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561b-aa90-6e54-9e3a0e2eadd5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561b-aa90-655d-8189b0211e25	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561b-aa90-12a3-758ec651e9b3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561b-aa90-90e6-6a3f67cf30b8	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561b-aa90-46d9-c3028005d580	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561b-aa90-9cf4-e2f716c511ad	CA	CAN	124	Canada 	Kanada	\N
00040000-561b-aa90-2011-8ca6cc8a81d5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561b-aa90-70d8-98ed7e45c05d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561b-aa90-b3d8-ee2d9a75c066	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561b-aa90-906d-5ccf2f2255c5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561b-aa90-a923-7cca45dfc390	CL	CHL	152	Chile 	Čile	\N
00040000-561b-aa90-0426-1aa04dbd88f5	CN	CHN	156	China 	Kitajska	\N
00040000-561b-aa90-def6-3010b7368e2e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561b-aa90-bce6-3408f638b546	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561b-aa90-e79f-8eff29eae36f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561b-aa90-9d97-614de4f24ba5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561b-aa90-d4f4-13c2d1e178b9	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561b-aa90-ee69-0ce9e7ba59e1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561b-aa90-9a42-798a661d455d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561b-aa90-5e5c-1a3b248288e9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561b-aa90-4be8-95933b0dc309	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561b-aa90-6dc9-432f1873a9d5	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561b-aa90-72d2-fcfe5d6fd69b	CU	CUB	192	Cuba 	Kuba	\N
00040000-561b-aa90-3e8b-702d91cee945	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561b-aa90-2888-12cccd5bf732	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561b-aa90-4b13-ff89ecea577a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561b-aa90-235c-306d18383be9	DK	DNK	208	Denmark 	Danska	\N
00040000-561b-aa90-6ecf-fecc51b23b83	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561b-aa90-7678-9a05eabbf919	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561b-aa90-9f89-44d8649b1a18	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561b-aa90-2ea8-b0f2eb37db67	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561b-aa90-c6d0-3b04abeb3f12	EG	EGY	818	Egypt 	Egipt	\N
00040000-561b-aa90-59a1-35b3dd66ecee	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561b-aa90-94ca-a7bc4bd5c1e2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561b-aa90-2344-29effac03568	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561b-aa90-27a2-e54836950dcf	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561b-aa90-4da8-71f3805a9e7b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561b-aa90-ff92-5473b67b98d5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561b-aa90-058a-b42d90272c4a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561b-aa90-a137-32530ee28d31	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561b-aa90-f4ec-47fbc643acc3	FI	FIN	246	Finland 	Finska	\N
00040000-561b-aa90-2f27-33120d60eab9	FR	FRA	250	France 	Francija	\N
00040000-561b-aa90-3dcd-9bf87c95645e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561b-aa90-9772-57df51b5b8bb	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561b-aa90-6e50-d2515f150455	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561b-aa90-8ab5-271a01acc5a4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561b-aa90-aa44-121ab676d8b7	GA	GAB	266	Gabon 	Gabon	\N
00040000-561b-aa90-5a7d-cc33c7ae27f8	GM	GMB	270	Gambia 	Gambija	\N
00040000-561b-aa90-9ba1-0e28c34edc0f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561b-aa90-fea3-882b889c03b1	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561b-aa90-956f-5e85ae7994d7	GH	GHA	288	Ghana 	Gana	\N
00040000-561b-aa90-eab0-c5b2f15dd3dc	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561b-aa90-7485-40bba7e6ef2b	GR	GRC	300	Greece 	Grčija	\N
00040000-561b-aa90-7a14-81890686f17d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561b-aa90-c038-bc90465298cd	GD	GRD	308	Grenada 	Grenada	\N
00040000-561b-aa90-1a64-a5c54bed63d6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561b-aa90-0ca3-0b5ca7373402	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561b-aa90-8eaf-f0b21751fe44	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561b-aa90-3c6c-51207ebb16a5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561b-aa90-5b69-1a2917ea797d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561b-aa90-38e9-bda00f1adf9a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561b-aa90-60ff-4aa69c219fbf	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561b-aa90-b18b-fb27b2b4979b	HT	HTI	332	Haiti 	Haiti	\N
00040000-561b-aa90-cfe4-a44ea21fdaa9	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561b-aa90-62ab-f91b82480014	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561b-aa90-1b18-da6b66958d44	HN	HND	340	Honduras 	Honduras	\N
00040000-561b-aa90-b39d-a4ffc31a300b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561b-aa90-86bb-b8195fbc38e8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561b-aa90-204e-b059dcd68be3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561b-aa90-f8fe-db55ed5e0c2f	IN	IND	356	India 	Indija	\N
00040000-561b-aa90-68e9-8d70539c8509	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561b-aa90-9bd8-f37aea485153	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561b-aa90-e40a-94da2219d8de	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561b-aa90-9b00-2042cfb963d7	IE	IRL	372	Ireland 	Irska	\N
00040000-561b-aa90-2f2d-2a544900c373	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561b-aa90-23fc-8a10272d9cb9	IL	ISR	376	Israel 	Izrael	\N
00040000-561b-aa90-1314-5ad2a3577a3f	IT	ITA	380	Italy 	Italija	\N
00040000-561b-aa90-af74-223bdb86c309	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561b-aa90-d1a2-972aa93a2e16	JP	JPN	392	Japan 	Japonska	\N
00040000-561b-aa90-59bf-86bc439b9d97	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561b-aa90-4e0f-f9eaba0d36bd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561b-aa90-5fe9-be37f0eef9cb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561b-aa90-b32a-b130b1d8ee7a	KE	KEN	404	Kenya 	Kenija	\N
00040000-561b-aa90-6771-8c07b8b32865	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561b-aa90-d15a-b7ada8d68a22	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561b-aa90-e0ac-047ccf32662a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561b-aa90-cce1-baca9b0bdf49	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561b-aa90-d6f1-d765e67f09b1	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561b-aa90-5efa-0c8fef686bb0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561b-aa90-be3c-4834612dff0c	LV	LVA	428	Latvia 	Latvija	\N
00040000-561b-aa90-73a9-0116740eed2a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561b-aa90-f7ec-a2892395f2f7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561b-aa90-6fa1-220b3d16ac7f	LR	LBR	430	Liberia 	Liberija	\N
00040000-561b-aa90-0f6e-eea896caa2ec	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561b-aa90-cf67-47cbfd2c6f38	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561b-aa90-550e-38dae685dfb3	LT	LTU	440	Lithuania 	Litva	\N
00040000-561b-aa90-fd9a-e6d122da46d5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561b-aa90-2ee7-508c84709c28	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561b-aa90-be46-ceaad5cb0b04	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561b-aa90-c9dd-f45d2702f757	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561b-aa90-9cbc-75fd5141b417	MW	MWI	454	Malawi 	Malavi	\N
00040000-561b-aa90-d478-45b6d25c8390	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561b-aa90-1e3c-4c71f2023071	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561b-aa90-47e1-b7c3b7522fe6	ML	MLI	466	Mali 	Mali	\N
00040000-561b-aa90-5531-aee0952db6c4	MT	MLT	470	Malta 	Malta	\N
00040000-561b-aa90-41ed-048a1eef13d7	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561b-aa90-aeea-c44ef2473be8	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561b-aa90-ef4b-48c01bd44d74	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561b-aa90-a13a-ab30fee5639b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561b-aa90-ad6e-2d7d6422344e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561b-aa90-6118-be86c33d8742	MX	MEX	484	Mexico 	Mehika	\N
00040000-561b-aa90-e1df-97cf4ff78ae3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561b-aa90-183e-8b617fbf4b53	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561b-aa90-c099-3e2399f0b1f3	MC	MCO	492	Monaco 	Monako	\N
00040000-561b-aa90-f6bf-7af50e71f862	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561b-aa90-e965-0d3da5be5522	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561b-aa90-8d38-634104dd88a3	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561b-aa90-f530-f8122ded588b	MA	MAR	504	Morocco 	Maroko	\N
00040000-561b-aa90-21f3-b673f0f689e9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561b-aa90-66d5-97a562c28aa4	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561b-aa90-fccb-0f3dc969b1a9	NA	NAM	516	Namibia 	Namibija	\N
00040000-561b-aa90-4828-e564fd78acbf	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561b-aa90-776c-82d0597a671a	NP	NPL	524	Nepal 	Nepal	\N
00040000-561b-aa90-c8b4-ab2b2b70e4c9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561b-aa90-aa25-45f9240ff3a8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561b-aa90-5857-42548c2b5534	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561b-aa90-26ad-d1d418ce3a1b	NE	NER	562	Niger 	Niger 	\N
00040000-561b-aa90-e5af-a3cb8d1c540f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561b-aa90-4a61-8089e79a2d36	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561b-aa90-d5fb-6d48937fe625	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561b-aa90-05ad-0a69bd2e0788	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561b-aa90-45fe-2fc93d4b493a	NO	NOR	578	Norway 	Norveška	\N
00040000-561b-aa90-ba1c-e7c51004d76b	OM	OMN	512	Oman 	Oman	\N
00040000-561b-aa90-53e6-4934b8328c8d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561b-aa90-781c-2a08df503f39	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561b-aa90-9494-328890c79c68	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561b-aa90-81b6-4a1ece400cd8	PA	PAN	591	Panama 	Panama	\N
00040000-561b-aa90-94f7-76e67db37108	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561b-aa90-1bcb-dcbbbea84d34	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561b-aa90-6a25-cf9ae938bf07	PE	PER	604	Peru 	Peru	\N
00040000-561b-aa90-8f02-2f842f3c5441	PH	PHL	608	Philippines 	Filipini	\N
00040000-561b-aa90-ae23-432e6c17ca8d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561b-aa90-5d9b-5d642eabdf7e	PL	POL	616	Poland 	Poljska	\N
00040000-561b-aa90-43e8-cb5f9927f522	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561b-aa90-499f-0cbf326f1f6c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561b-aa90-bdce-af080b51aadd	QA	QAT	634	Qatar 	Katar	\N
00040000-561b-aa90-f38f-5571d620d242	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561b-aa90-de1f-54e8d0e66085	RO	ROU	642	Romania 	Romunija	\N
00040000-561b-aa90-de7a-03825271d28c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561b-aa90-f292-1f18a22b9c21	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561b-aa90-463e-4aa1f251d463	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561b-aa90-9698-9636d037fa16	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561b-aa90-100a-6b40b2a9632b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561b-aa90-6afc-dcf5a24f4161	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561b-aa90-b273-ca5c6a8c6916	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561b-aa90-f6b0-4b4e2a4c6b90	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561b-aa90-cf8d-12497c1612f0	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561b-aa90-134c-006d12610033	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561b-aa90-7043-f6ab54adc564	SM	SMR	674	San Marino 	San Marino	\N
00040000-561b-aa90-8e77-cc2c26cbf1cf	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561b-aa90-9286-eac5559029d7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561b-aa90-500e-9491ae7173c6	SN	SEN	686	Senegal 	Senegal	\N
00040000-561b-aa90-b28b-16c90d622c1e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561b-aa90-e293-5ca060f9a4bd	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561b-aa90-4430-00fed66dfd37	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561b-aa90-df52-c3d02da1c995	SG	SGP	702	Singapore 	Singapur	\N
00040000-561b-aa90-2606-ea77ed70382f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561b-aa90-1169-c507241d68ce	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561b-aa90-6334-c0a04a554cfa	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561b-aa90-d617-463fd8ae7f71	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561b-aa90-67c1-8626ebdeae05	SO	SOM	706	Somalia 	Somalija	\N
00040000-561b-aa90-db48-aa44604ce461	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561b-aa90-6249-ee89e85597fa	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561b-aa90-6bd6-6eae5895fade	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561b-aa90-eed7-0f8924804594	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561b-aa90-1e78-fd2d2d79411c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561b-aa90-e5e4-122b077a0a30	SD	SDN	729	Sudan 	Sudan	\N
00040000-561b-aa90-7f99-c08c21c7ee3d	SR	SUR	740	Suriname 	Surinam	\N
00040000-561b-aa90-8c63-8e68d5543cc7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561b-aa90-1986-3cfff91399aa	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561b-aa90-82b9-67c301b06054	SE	SWE	752	Sweden 	Švedska	\N
00040000-561b-aa90-82c3-5f8d9272ca75	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561b-aa90-dc1e-28331ace0339	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561b-aa90-ec7d-3f90df5d3813	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561b-aa90-6e05-acda7a576229	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561b-aa90-90f3-ce372c14a86e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561b-aa90-1228-82c06a8e787f	TH	THA	764	Thailand 	Tajska	\N
00040000-561b-aa90-b0d2-043c0b348276	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561b-aa90-7f6b-bec96c0ca844	TG	TGO	768	Togo 	Togo	\N
00040000-561b-aa90-bcc3-2c4335459c43	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561b-aa90-920c-350b9a4a2d0a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561b-aa90-72ae-b9d8370d1e5a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561b-aa90-d9ca-e6183a70e8e6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561b-aa90-08ea-246745a452a5	TR	TUR	792	Turkey 	Turčija	\N
00040000-561b-aa90-85b7-7f2b8542fe70	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561b-aa90-b618-0ace579be33b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561b-aa90-aea3-49b30e8a257e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561b-aa90-8eed-24d827907485	UG	UGA	800	Uganda 	Uganda	\N
00040000-561b-aa90-562e-0ed5ae26f23f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561b-aa90-cbb2-e80af15e1f61	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561b-aa90-a50d-7f2965593fcf	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561b-aa90-76a5-54508db905ab	US	USA	840	United States 	Združene države Amerike	\N
00040000-561b-aa90-8a77-cdb7908505f5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561b-aa90-9a9e-5c62751b3451	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561b-aa90-af4b-e0299ac9c813	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561b-aa90-ea3a-b2b367832a9c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561b-aa90-3710-dd7ed2a398c7	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561b-aa90-d042-5f23cd36fe4e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561b-aa90-74d6-5b7489a9cf5f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561b-aa90-b5bd-efa7b4537d8e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561b-aa90-f751-db020f17199b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561b-aa90-95de-a01be3a073c1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561b-aa90-a492-6ab254dc28a4	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561b-aa90-9742-75e55f4187c5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561b-aa90-12fb-0b0591a5ca5a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3043 (class 0 OID 21718914)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561b-aa92-0c25-41a5f62801dd	000e0000-561b-aa92-d9b0-fe7c656e653e	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-aa90-9469-7c4ef279455b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561b-aa92-ae4f-f1f08e5c0ae1	000e0000-561b-aa92-11e4-286b42219ff6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-aa90-10ea-2f8d6231a3ca	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561b-aa92-4d47-13d1aa132a05	000e0000-561b-aa92-a2bc-9bfc33e77259	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-aa90-9469-7c4ef279455b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561b-aa92-0fb0-d6ec6e0c4cc5	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561b-aa92-8efe-637ab6d34872	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 21718716)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561b-aa92-123e-873171325ec1	000e0000-561b-aa92-11e4-286b42219ff6	000c0000-561b-aa92-a7a8-f1a39e85b52b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561b-aa90-6b1a-d68bd2d694aa
000d0000-561b-aa92-e9cb-a1dbe85b72d5	000e0000-561b-aa92-11e4-286b42219ff6	000c0000-561b-aa92-d989-ea154c7af78e	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561b-aa90-75ff-5ad2eadeaa64
000d0000-561b-aa92-3b01-8dc3e6e188e8	000e0000-561b-aa92-11e4-286b42219ff6	000c0000-561b-aa92-66ac-cc2e6912f741	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561b-aa90-a727-f76f2769f943
000d0000-561b-aa92-a9d2-46c206a83ffe	000e0000-561b-aa92-11e4-286b42219ff6	000c0000-561b-aa92-4597-cf324bd4110a	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561b-aa90-56b3-394da539e942
000d0000-561b-aa92-e942-c6efd3214be8	000e0000-561b-aa92-11e4-286b42219ff6	000c0000-561b-aa92-21e6-77729de0baf4	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561b-aa90-56b3-394da539e942
000d0000-561b-aa92-c1f9-e6e5684460b1	000e0000-561b-aa92-11e4-286b42219ff6	000c0000-561b-aa92-9701-4dd3d8c138d4	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561b-aa90-6b1a-d68bd2d694aa
000d0000-561b-aa92-bc4e-1affc50c14ae	000e0000-561b-aa92-11e4-286b42219ff6	000c0000-561b-aa92-305f-936743b09c89	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561b-aa90-6b1a-d68bd2d694aa
000d0000-561b-aa92-2cae-fc2033920e1f	000e0000-561b-aa92-11e4-286b42219ff6	000c0000-561b-aa92-1e0f-a400e8421c6f	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561b-aa90-1bfe-bd2315c1a890
000d0000-561b-aa92-e372-5d888af51058	000e0000-561b-aa92-11e4-286b42219ff6	000c0000-561b-aa92-71d9-a5c8a7b96ab8	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561b-aa90-dc74-5cbd9009d624
\.


--
-- TOC entry 3008 (class 0 OID 21718531)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21718505)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21718482)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561b-aa92-70a9-1c4edd1c254c	00080000-561b-aa92-6e4e-a9328b11178a	00090000-561b-aa92-ad13-91600139d4be	AK		igralka
\.


--
-- TOC entry 3017 (class 0 OID 21718630)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21719141)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 21719153)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 21719175)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 21093458)
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
\.


--
-- TOC entry 3021 (class 0 OID 21718655)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21718439)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561b-aa91-beea-aac0205ad8f9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561b-aa91-2f52-3c24097a23fe	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561b-aa91-98de-69e72ab837de	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561b-aa91-d227-0ce71bebf41a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561b-aa91-f53e-c5ad7e73b196	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561b-aa91-c289-133dfcb7019a	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561b-aa91-9d35-41f657c8176c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561b-aa91-6d6d-09e57138143e	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561b-aa91-b050-6e3c861b3409	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561b-aa91-fd18-6f991f927bcf	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561b-aa91-c035-2d804aa8267c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561b-aa91-c3e8-d46239f891f1	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561b-aa91-1a95-dcd182172b2d	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561b-aa91-3ae6-c1dafe93c4c3	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561b-aa91-1ff9-d01735a20704	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561b-aa92-7bf8-7ba242a7e5ee	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561b-aa92-4921-3f059e70a84a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561b-aa92-67c3-72de6f2c4b3e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561b-aa92-3752-caf18eec5190	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561b-aa92-6218-c16be9a13ce1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561b-aa94-9b53-ff9806aab162	application.tenant.maticnopodjetje	string	s:36:"00080000-561b-aa94-671f-a1b013d243fa";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2995 (class 0 OID 21718353)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561b-aa92-2157-4a36d4f6dc73	00000000-561b-aa92-7bf8-7ba242a7e5ee	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561b-aa92-b912-a73e2d55c16b	00000000-561b-aa92-7bf8-7ba242a7e5ee	00010000-561b-aa91-0759-5cb88283bdec	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561b-aa92-6d2b-25138126a11f	00000000-561b-aa92-4921-3f059e70a84a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2996 (class 0 OID 21718364)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561b-aa92-a858-410af23439f4	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561b-aa92-2528-f1e0ededb2d9	00010000-561b-aa92-c92f-f0e1c552ce03	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561b-aa92-3705-497115dd9bbe	00010000-561b-aa92-017b-b3260ba73ccd	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561b-aa92-bc4e-8cc0cbf5a4b6	00010000-561b-aa92-815f-5725f39543fb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561b-aa92-eec2-a94adfdf8184	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561b-aa92-b772-bcc2e135f047	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561b-aa92-4da4-779eec23e748	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561b-aa92-a424-f6423a799940	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561b-aa92-ad13-91600139d4be	00010000-561b-aa92-1982-cb6f1073528c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561b-aa92-9858-2ee3f9819673	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561b-aa92-628d-f2f297e8d67e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561b-aa92-6bcb-76f28b4153b9	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561b-aa92-ac19-2e46ae6a5c78	00010000-561b-aa92-7394-821fc842e34e	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561b-aa92-bbad-b7d61ca4ff32	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-aa92-0bea-2387e2564c28	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-aa92-1eb0-55b361523883	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-aa92-7395-cc38ba630e65	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561b-aa92-2838-09280366abc1	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2991 (class 0 OID 21718318)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561b-aa90-ffb5-398c6c798d92	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561b-aa90-1f88-10f906ec2224	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561b-aa90-52bf-fcfbe293aec4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561b-aa90-5230-8b7380dc83ac	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561b-aa90-9fb3-fa19a0bbd790	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561b-aa90-968b-26cd3bca2dcb	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561b-aa90-baf9-34ff7c8a1cae	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561b-aa90-d464-929e4dde27fd	Abonma-read	Abonma - branje	f
00030000-561b-aa90-76f1-29c8d29afe46	Abonma-write	Abonma - spreminjanje	f
00030000-561b-aa90-5141-c16277fdd53e	Alternacija-read	Alternacija - branje	f
00030000-561b-aa90-a2f8-a944c39624c1	Alternacija-write	Alternacija - spreminjanje	f
00030000-561b-aa90-2a5a-ab4ff087708f	Arhivalija-read	Arhivalija - branje	f
00030000-561b-aa90-995a-a528d6512606	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561b-aa90-3e8f-0e73b1dec2ea	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561b-aa90-86bf-d898c520de5a	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561b-aa90-32dc-6f6ae28416e6	Besedilo-read	Besedilo - branje	f
00030000-561b-aa90-0712-b52b6fb9eba1	Besedilo-write	Besedilo - spreminjanje	f
00030000-561b-aa90-8e9f-1ed73ee7ce98	DogodekIzven-read	DogodekIzven - branje	f
00030000-561b-aa90-8ba9-774652416be2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561b-aa90-b838-20ad0c764b6e	Dogodek-read	Dogodek - branje	f
00030000-561b-aa90-0604-35bcffedec95	Dogodek-write	Dogodek - spreminjanje	f
00030000-561b-aa90-f0cb-a01bbc6f6a78	DrugiVir-read	DrugiVir - branje	f
00030000-561b-aa90-9efa-cc2c3dce7e01	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561b-aa90-4919-db59e8a073b6	Drzava-read	Drzava - branje	f
00030000-561b-aa90-6186-84c548e2d812	Drzava-write	Drzava - spreminjanje	f
00030000-561b-aa90-da3f-3ad07509c3ba	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561b-aa90-d49a-ea11b2f83a21	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561b-aa90-76cb-fe226f0f1792	Funkcija-read	Funkcija - branje	f
00030000-561b-aa90-dfb8-b00cd616d936	Funkcija-write	Funkcija - spreminjanje	f
00030000-561b-aa90-a307-353bf612b9e1	Gostovanje-read	Gostovanje - branje	f
00030000-561b-aa90-b7f9-74f34d84c286	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561b-aa90-ec3e-412140e9ba7c	Gostujoca-read	Gostujoca - branje	f
00030000-561b-aa90-5754-8bdd4128ff08	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561b-aa90-9e1b-0119e25f55d5	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561b-aa90-8499-3270a1ee971c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561b-aa90-64dc-eb4617b8ac1b	Kupec-read	Kupec - branje	f
00030000-561b-aa90-081e-50ef1446859e	Kupec-write	Kupec - spreminjanje	f
00030000-561b-aa90-1988-960f281d1d44	NacinPlacina-read	NacinPlacina - branje	f
00030000-561b-aa90-37dc-cea54de66be2	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561b-aa90-7660-e7abb59cf4b7	Option-read	Option - branje	f
00030000-561b-aa90-f3c8-a88463261e1a	Option-write	Option - spreminjanje	f
00030000-561b-aa90-8a5e-329cd551c223	OptionValue-read	OptionValue - branje	f
00030000-561b-aa90-778a-a8390e213b09	OptionValue-write	OptionValue - spreminjanje	f
00030000-561b-aa90-1e03-98fbfe02d838	Oseba-read	Oseba - branje	f
00030000-561b-aa90-5b06-be3d4c9525f2	Oseba-write	Oseba - spreminjanje	f
00030000-561b-aa90-3d7f-de7e0069ecd8	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561b-aa90-5723-a746a241da36	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561b-aa90-f076-88873903925b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561b-aa90-0f08-c4310977bdc2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561b-aa90-aac4-a73ebbda1203	Pogodba-read	Pogodba - branje	f
00030000-561b-aa90-f690-3bf984ed022a	Pogodba-write	Pogodba - spreminjanje	f
00030000-561b-aa90-7928-beafb16ed77f	Popa-read	Popa - branje	f
00030000-561b-aa90-951d-8bdeb38d1257	Popa-write	Popa - spreminjanje	f
00030000-561b-aa90-7338-500b614055f0	Posta-read	Posta - branje	f
00030000-561b-aa90-7ade-444ecec58463	Posta-write	Posta - spreminjanje	f
00030000-561b-aa90-70db-ec53a034e153	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561b-aa90-33b4-c2480b8a1d78	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561b-aa90-a1ed-41090b666bf3	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561b-aa90-6db2-e9b2f1e3da75	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561b-aa90-1964-8fe5d69694e8	PostniNaslov-read	PostniNaslov - branje	f
00030000-561b-aa90-6825-7b8427fde644	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561b-aa90-3a6c-d9c6ec5e8036	Predstava-read	Predstava - branje	f
00030000-561b-aa90-27b3-e1b443295024	Predstava-write	Predstava - spreminjanje	f
00030000-561b-aa90-e400-44efcc9ec671	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561b-aa90-c4e5-6cac238432a9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561b-aa90-3beb-f8a41d612299	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561b-aa90-bceb-91373516e4ee	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561b-aa90-9b5c-a972ce75f415	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561b-aa90-4892-d72e382d5c7e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561b-aa90-78a7-5f30c37d8b4f	ProgramDela-read	ProgramDela - branje	f
00030000-561b-aa90-1524-261d80cba7c7	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561b-aa90-449c-e68adbd3c4e8	ProgramFestival-read	ProgramFestival - branje	f
00030000-561b-aa90-ee6a-d3567766eaf9	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561b-aa90-0007-0f8ad708ff5b	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561b-aa90-f59e-a43890eec4e6	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561b-aa90-fbe8-4af1a8e9e949	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561b-aa90-1f84-aeff4fbb8151	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561b-aa90-a66c-99ca952a4271	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561b-aa90-74d4-e67583cb9d6e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561b-aa90-afea-75ad26b9e019	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561b-aa90-7033-7821ba662466	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561b-aa90-b3bc-12808e39d525	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561b-aa90-5e4e-0ded97e1bb35	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561b-aa90-ca78-1c7fa818c775	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561b-aa90-9040-1c9815183fe5	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561b-aa90-9cfa-f84cfeecf52a	ProgramRazno-read	ProgramRazno - branje	f
00030000-561b-aa90-7c1e-b0051277a230	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561b-aa90-21ed-45bd1294c4e7	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561b-aa90-6d07-ac7bc0b98738	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561b-aa90-0814-8f89ec26fbd3	Prostor-read	Prostor - branje	f
00030000-561b-aa90-3d68-257def41aa19	Prostor-write	Prostor - spreminjanje	f
00030000-561b-aa90-0f0f-3682d1e80fcd	Racun-read	Racun - branje	f
00030000-561b-aa90-9b3e-c16787f75324	Racun-write	Racun - spreminjanje	f
00030000-561b-aa90-840d-57853eed4d03	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561b-aa90-b286-cfe52699bbbc	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561b-aa90-8cb7-ed28fd7319ac	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561b-aa90-ced2-bc200cc5092c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561b-aa90-76c9-4918f897f386	Rekvizit-read	Rekvizit - branje	f
00030000-561b-aa90-6e3c-02ae3588c0b7	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561b-aa90-7cf1-ca643d4a2f5b	Revizija-read	Revizija - branje	f
00030000-561b-aa90-b2b8-54e217d2033f	Revizija-write	Revizija - spreminjanje	f
00030000-561b-aa90-af3f-73e3ba628a15	Rezervacija-read	Rezervacija - branje	f
00030000-561b-aa90-4b8b-5792ea910a72	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561b-aa90-5763-a4a3a4758b5b	SedezniRed-read	SedezniRed - branje	f
00030000-561b-aa90-ddf7-da1f3cdcf675	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561b-aa90-506a-ea2e144a9be0	Sedez-read	Sedez - branje	f
00030000-561b-aa90-eb31-4de70a590a23	Sedez-write	Sedez - spreminjanje	f
00030000-561b-aa90-b6b5-88b81e171c94	Sezona-read	Sezona - branje	f
00030000-561b-aa90-af3d-e1bbfc89240f	Sezona-write	Sezona - spreminjanje	f
00030000-561b-aa90-4290-d4f50f3f89e3	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561b-aa90-56aa-fe3c645cb40a	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561b-aa90-071e-4d5a6804750e	Stevilcenje-read	Stevilcenje - branje	f
00030000-561b-aa90-7bc2-d7c5b5aac129	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561b-aa90-5aa1-41bbdb0df8a9	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561b-aa90-ca89-18f463f1d883	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561b-aa90-b1af-3ae3b059193d	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561b-aa90-0778-36b7d627a830	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561b-aa90-e809-924933838709	Telefonska-read	Telefonska - branje	f
00030000-561b-aa90-92aa-077db19921a7	Telefonska-write	Telefonska - spreminjanje	f
00030000-561b-aa90-0fff-0493fb8cab09	TerminStoritve-read	TerminStoritve - branje	f
00030000-561b-aa90-9f57-b5a3c5f4fbe0	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561b-aa90-6e38-ef59341a4db9	TipFunkcije-read	TipFunkcije - branje	f
00030000-561b-aa90-a4b5-675ee34fd983	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561b-aa90-9960-06e18d419416	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561b-aa90-e7a9-22dea2065cf8	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561b-aa90-a0e7-1098cba73383	Trr-read	Trr - branje	f
00030000-561b-aa90-1cb0-0d5ac3197e5e	Trr-write	Trr - spreminjanje	f
00030000-561b-aa90-cc28-8c20d5c51630	Uprizoritev-read	Uprizoritev - branje	f
00030000-561b-aa90-7c52-75a5d0a544f6	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561b-aa90-f93d-7eb22525b73b	Vaja-read	Vaja - branje	f
00030000-561b-aa90-7aac-77101c1e27d6	Vaja-write	Vaja - spreminjanje	f
00030000-561b-aa90-b34a-c5e8d56b0130	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561b-aa90-c9fb-cba06e338c74	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561b-aa90-65d4-9739a5be8220	VrstaStroska-read	VrstaStroska - branje	f
00030000-561b-aa90-d539-41fc246793cd	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561b-aa90-7fef-7b494c06bdf2	Zaposlitev-read	Zaposlitev - branje	f
00030000-561b-aa90-d713-ef09bce5099a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561b-aa90-90cb-5474fe4015c0	Zasedenost-read	Zasedenost - branje	f
00030000-561b-aa90-cc28-addf095a00bb	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561b-aa90-9730-694a848711c3	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561b-aa90-5899-42d10002dc70	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561b-aa90-16f8-adf43885975c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561b-aa90-da20-0c7abb082acb	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561b-aa90-01a7-b2f078c85de3	Job-read	Branje opravil - samo zase - branje	f
00030000-561b-aa90-cc31-0dac38485114	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561b-aa90-0e95-38b571b513a4	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561b-aa90-42b3-61a3c5087923	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561b-aa90-2535-5a4168463851	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561b-aa90-0aca-9548273a73ee	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561b-aa90-76a8-9ea403b62ee3	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561b-aa90-041d-d64fd5c3668e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561b-aa90-46b5-d00557d6c546	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561b-aa91-1663-df620672da3a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561b-aa91-e1b7-172dae5217a3	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561b-aa91-4545-cb5e54029578	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561b-aa91-86c1-2ddb90eaf7cb	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561b-aa91-ec54-104e5eb57bd6	Datoteka-write	Datoteka - spreminjanje	f
00030000-561b-aa91-8c16-eecbab3bbf52	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2993 (class 0 OID 21718337)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561b-aa91-cfe0-7a5ff678fb81	00030000-561b-aa90-1f88-10f906ec2224
00020000-561b-aa91-7518-11be64dd0a41	00030000-561b-aa90-4919-db59e8a073b6
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-d464-929e4dde27fd
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-76f1-29c8d29afe46
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-5141-c16277fdd53e
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-a2f8-a944c39624c1
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-2a5a-ab4ff087708f
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-b838-20ad0c764b6e
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-5230-8b7380dc83ac
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-0604-35bcffedec95
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-4919-db59e8a073b6
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-6186-84c548e2d812
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-76cb-fe226f0f1792
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-dfb8-b00cd616d936
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-a307-353bf612b9e1
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-b7f9-74f34d84c286
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-ec3e-412140e9ba7c
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-5754-8bdd4128ff08
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-9e1b-0119e25f55d5
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-8499-3270a1ee971c
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-7660-e7abb59cf4b7
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-8a5e-329cd551c223
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-1e03-98fbfe02d838
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-5b06-be3d4c9525f2
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-7928-beafb16ed77f
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-951d-8bdeb38d1257
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-7338-500b614055f0
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-7ade-444ecec58463
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-1964-8fe5d69694e8
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-6825-7b8427fde644
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-3a6c-d9c6ec5e8036
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-27b3-e1b443295024
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-9b5c-a972ce75f415
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-4892-d72e382d5c7e
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-0814-8f89ec26fbd3
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-3d68-257def41aa19
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-8cb7-ed28fd7319ac
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-ced2-bc200cc5092c
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-76c9-4918f897f386
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-6e3c-02ae3588c0b7
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-b6b5-88b81e171c94
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-af3d-e1bbfc89240f
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-6e38-ef59341a4db9
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-cc28-8c20d5c51630
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-7c52-75a5d0a544f6
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-f93d-7eb22525b73b
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-7aac-77101c1e27d6
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-90cb-5474fe4015c0
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-cc28-addf095a00bb
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-9730-694a848711c3
00020000-561b-aa91-4450-30ac73bac6ef	00030000-561b-aa90-16f8-adf43885975c
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-d464-929e4dde27fd
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-2a5a-ab4ff087708f
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-b838-20ad0c764b6e
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-4919-db59e8a073b6
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-a307-353bf612b9e1
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-ec3e-412140e9ba7c
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-9e1b-0119e25f55d5
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-8499-3270a1ee971c
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-7660-e7abb59cf4b7
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-8a5e-329cd551c223
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-1e03-98fbfe02d838
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-5b06-be3d4c9525f2
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-7928-beafb16ed77f
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-7338-500b614055f0
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-1964-8fe5d69694e8
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-6825-7b8427fde644
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-3a6c-d9c6ec5e8036
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-0814-8f89ec26fbd3
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-8cb7-ed28fd7319ac
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-76c9-4918f897f386
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-b6b5-88b81e171c94
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-e809-924933838709
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-92aa-077db19921a7
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-a0e7-1098cba73383
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-1cb0-0d5ac3197e5e
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-7fef-7b494c06bdf2
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-d713-ef09bce5099a
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-9730-694a848711c3
00020000-561b-aa91-9071-adbc4260765d	00030000-561b-aa90-16f8-adf43885975c
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-d464-929e4dde27fd
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-5141-c16277fdd53e
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-2a5a-ab4ff087708f
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-995a-a528d6512606
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-32dc-6f6ae28416e6
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-8e9f-1ed73ee7ce98
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-b838-20ad0c764b6e
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-4919-db59e8a073b6
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-76cb-fe226f0f1792
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-a307-353bf612b9e1
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-ec3e-412140e9ba7c
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-9e1b-0119e25f55d5
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-7660-e7abb59cf4b7
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-8a5e-329cd551c223
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-1e03-98fbfe02d838
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-7928-beafb16ed77f
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-7338-500b614055f0
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-3a6c-d9c6ec5e8036
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-9b5c-a972ce75f415
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-0814-8f89ec26fbd3
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-8cb7-ed28fd7319ac
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-76c9-4918f897f386
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-b6b5-88b81e171c94
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-6e38-ef59341a4db9
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-f93d-7eb22525b73b
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-90cb-5474fe4015c0
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-9730-694a848711c3
00020000-561b-aa91-95f3-432f37aa7866	00030000-561b-aa90-16f8-adf43885975c
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-d464-929e4dde27fd
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-76f1-29c8d29afe46
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-a2f8-a944c39624c1
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-2a5a-ab4ff087708f
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-b838-20ad0c764b6e
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-4919-db59e8a073b6
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-a307-353bf612b9e1
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-ec3e-412140e9ba7c
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-7660-e7abb59cf4b7
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-8a5e-329cd551c223
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-7928-beafb16ed77f
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-7338-500b614055f0
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-3a6c-d9c6ec5e8036
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-0814-8f89ec26fbd3
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-8cb7-ed28fd7319ac
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-76c9-4918f897f386
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-b6b5-88b81e171c94
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-6e38-ef59341a4db9
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-9730-694a848711c3
00020000-561b-aa91-e8bc-da6fd1665db3	00030000-561b-aa90-16f8-adf43885975c
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-d464-929e4dde27fd
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-2a5a-ab4ff087708f
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-b838-20ad0c764b6e
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-4919-db59e8a073b6
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-a307-353bf612b9e1
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-ec3e-412140e9ba7c
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-7660-e7abb59cf4b7
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-8a5e-329cd551c223
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-7928-beafb16ed77f
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-7338-500b614055f0
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-3a6c-d9c6ec5e8036
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-0814-8f89ec26fbd3
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-8cb7-ed28fd7319ac
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-76c9-4918f897f386
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-b6b5-88b81e171c94
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-0fff-0493fb8cab09
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-52bf-fcfbe293aec4
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-6e38-ef59341a4db9
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-9730-694a848711c3
00020000-561b-aa91-8442-d43c8de80a86	00030000-561b-aa90-16f8-adf43885975c
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-ffb5-398c6c798d92
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-1f88-10f906ec2224
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-52bf-fcfbe293aec4
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-5230-8b7380dc83ac
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-9fb3-fa19a0bbd790
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-968b-26cd3bca2dcb
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-baf9-34ff7c8a1cae
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-d464-929e4dde27fd
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-76f1-29c8d29afe46
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-5141-c16277fdd53e
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-a2f8-a944c39624c1
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-2a5a-ab4ff087708f
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-995a-a528d6512606
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-32dc-6f6ae28416e6
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-0712-b52b6fb9eba1
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-8e9f-1ed73ee7ce98
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-8ba9-774652416be2
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-b838-20ad0c764b6e
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-0604-35bcffedec95
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-4919-db59e8a073b6
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-6186-84c548e2d812
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-f0cb-a01bbc6f6a78
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-9efa-cc2c3dce7e01
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-da3f-3ad07509c3ba
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-d49a-ea11b2f83a21
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-76cb-fe226f0f1792
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-dfb8-b00cd616d936
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-a307-353bf612b9e1
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-b7f9-74f34d84c286
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-ec3e-412140e9ba7c
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-5754-8bdd4128ff08
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-9e1b-0119e25f55d5
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-8499-3270a1ee971c
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-64dc-eb4617b8ac1b
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-081e-50ef1446859e
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-1988-960f281d1d44
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-37dc-cea54de66be2
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-7660-e7abb59cf4b7
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-f3c8-a88463261e1a
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-8a5e-329cd551c223
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-778a-a8390e213b09
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-1e03-98fbfe02d838
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-5b06-be3d4c9525f2
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-3d7f-de7e0069ecd8
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-5723-a746a241da36
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-f076-88873903925b
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-0f08-c4310977bdc2
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-aac4-a73ebbda1203
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-f690-3bf984ed022a
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-7928-beafb16ed77f
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-951d-8bdeb38d1257
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-7338-500b614055f0
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-7ade-444ecec58463
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-70db-ec53a034e153
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-33b4-c2480b8a1d78
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-a1ed-41090b666bf3
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-6db2-e9b2f1e3da75
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-1964-8fe5d69694e8
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-6825-7b8427fde644
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-3a6c-d9c6ec5e8036
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-27b3-e1b443295024
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-e400-44efcc9ec671
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-c4e5-6cac238432a9
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-3beb-f8a41d612299
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-bceb-91373516e4ee
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-9b5c-a972ce75f415
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-4892-d72e382d5c7e
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-78a7-5f30c37d8b4f
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-1524-261d80cba7c7
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-449c-e68adbd3c4e8
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-ee6a-d3567766eaf9
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-0007-0f8ad708ff5b
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-f59e-a43890eec4e6
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-fbe8-4af1a8e9e949
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-1f84-aeff4fbb8151
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-a66c-99ca952a4271
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-74d4-e67583cb9d6e
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-afea-75ad26b9e019
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-7033-7821ba662466
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-b3bc-12808e39d525
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-5e4e-0ded97e1bb35
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-ca78-1c7fa818c775
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-9040-1c9815183fe5
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-9cfa-f84cfeecf52a
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-7c1e-b0051277a230
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-21ed-45bd1294c4e7
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-6d07-ac7bc0b98738
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-0814-8f89ec26fbd3
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-3d68-257def41aa19
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-0f0f-3682d1e80fcd
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-9b3e-c16787f75324
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-840d-57853eed4d03
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-b286-cfe52699bbbc
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-8cb7-ed28fd7319ac
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-ced2-bc200cc5092c
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-76c9-4918f897f386
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-6e3c-02ae3588c0b7
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-7cf1-ca643d4a2f5b
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-b2b8-54e217d2033f
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-af3f-73e3ba628a15
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-4b8b-5792ea910a72
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-5763-a4a3a4758b5b
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-ddf7-da1f3cdcf675
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-506a-ea2e144a9be0
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-eb31-4de70a590a23
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-b6b5-88b81e171c94
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-af3d-e1bbfc89240f
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-4290-d4f50f3f89e3
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-56aa-fe3c645cb40a
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-071e-4d5a6804750e
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-7bc2-d7c5b5aac129
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-5aa1-41bbdb0df8a9
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-ca89-18f463f1d883
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-b1af-3ae3b059193d
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-0778-36b7d627a830
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-e809-924933838709
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-92aa-077db19921a7
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-0fff-0493fb8cab09
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-9f57-b5a3c5f4fbe0
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-6e38-ef59341a4db9
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-a4b5-675ee34fd983
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-9960-06e18d419416
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-e7a9-22dea2065cf8
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-a0e7-1098cba73383
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-1cb0-0d5ac3197e5e
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-cc28-8c20d5c51630
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-7c52-75a5d0a544f6
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-f93d-7eb22525b73b
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-7aac-77101c1e27d6
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-b34a-c5e8d56b0130
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-c9fb-cba06e338c74
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-65d4-9739a5be8220
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-d539-41fc246793cd
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-7fef-7b494c06bdf2
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-d713-ef09bce5099a
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-90cb-5474fe4015c0
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-cc28-addf095a00bb
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-9730-694a848711c3
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-5899-42d10002dc70
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-16f8-adf43885975c
00020000-561b-aa92-345c-20fd2bf748f0	00030000-561b-aa90-da20-0c7abb082acb
\.


--
-- TOC entry 3022 (class 0 OID 21718662)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21718696)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21718832)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561b-aa92-c4d2-e1d28d8e98f5	00090000-561b-aa92-a858-410af23439f4	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561b-aa92-e344-4d05fe7ae021	00090000-561b-aa92-b772-bcc2e135f047	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561b-aa92-748a-7034c1f7b10b	00090000-561b-aa92-ac19-2e46ae6a5c78	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561b-aa92-bb78-d5fc0875df3b	00090000-561b-aa92-9858-2ee3f9819673	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2998 (class 0 OID 21718397)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561b-aa92-6e4e-a9328b11178a	00040000-561b-aa90-6334-c0a04a554cfa	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-aa92-3725-70a5fe409094	00040000-561b-aa90-6334-c0a04a554cfa	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561b-aa92-266c-5e8aec486c0b	00040000-561b-aa90-6334-c0a04a554cfa	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-aa92-9649-eacc0cee7629	00040000-561b-aa90-6334-c0a04a554cfa	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-aa92-2bf1-bd00b4630421	00040000-561b-aa90-6334-c0a04a554cfa	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-aa92-8737-3ee69e1537fd	00040000-561b-aa90-8d34-59195db7e098	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-aa92-cd7c-9f94fa3c3fd7	00040000-561b-aa90-6dc9-432f1873a9d5	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-aa92-7c83-d63ca4006db8	00040000-561b-aa90-a1d5-da15098acc3b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-aa92-a729-0d484f2e3448	00040000-561b-aa90-fea3-882b889c03b1	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-aa94-671f-a1b013d243fa	00040000-561b-aa90-6334-c0a04a554cfa	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3000 (class 0 OID 21718431)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561b-aa90-81be-1d4cdc238d45	8341	Adlešiči
00050000-561b-aa90-6ef6-28f4f54be05d	5270	Ajdovščina
00050000-561b-aa90-cff7-e6d996bae3aa	6280	Ankaran/Ancarano
00050000-561b-aa90-fb1d-637a1390de9d	9253	Apače
00050000-561b-aa90-945b-56d78c03cc70	8253	Artiče
00050000-561b-aa90-6509-386c2ade900b	4275	Begunje na Gorenjskem
00050000-561b-aa90-b5b2-e88708174517	1382	Begunje pri Cerknici
00050000-561b-aa90-886f-f4c3521df890	9231	Beltinci
00050000-561b-aa90-839f-a7aa54466dad	2234	Benedikt
00050000-561b-aa90-5e87-0143c111f810	2345	Bistrica ob Dravi
00050000-561b-aa90-6144-847f825d050d	3256	Bistrica ob Sotli
00050000-561b-aa90-21f7-f9e41f5bda1f	8259	Bizeljsko
00050000-561b-aa90-5bf7-c6b2319f6861	1223	Blagovica
00050000-561b-aa90-5696-81a765989326	8283	Blanca
00050000-561b-aa90-4df8-6c7a7d15216c	4260	Bled
00050000-561b-aa90-44af-c5df425edcde	4273	Blejska Dobrava
00050000-561b-aa90-8efa-28bca30559ea	9265	Bodonci
00050000-561b-aa90-fbcc-35d7735cdc67	9222	Bogojina
00050000-561b-aa90-eb97-194c4a6bd247	4263	Bohinjska Bela
00050000-561b-aa90-c1af-ee31c289d98c	4264	Bohinjska Bistrica
00050000-561b-aa90-0409-a06bb3deff57	4265	Bohinjsko jezero
00050000-561b-aa90-38d7-87ee8a2b434c	1353	Borovnica
00050000-561b-aa90-1812-8a6004f079bd	8294	Boštanj
00050000-561b-aa90-43d3-bcbc5aeb9655	5230	Bovec
00050000-561b-aa90-5e94-cf7d9d1e6b94	5295	Branik
00050000-561b-aa90-d815-241d5bb28811	3314	Braslovče
00050000-561b-aa90-67a2-d09635372cda	5223	Breginj
00050000-561b-aa90-1ccc-87a3b1e32a7e	8280	Brestanica
00050000-561b-aa90-3ace-b681c7f02484	2354	Bresternica
00050000-561b-aa90-a8c6-15770f40067b	4243	Brezje
00050000-561b-aa90-9d84-5c3484fd7efe	1351	Brezovica pri Ljubljani
00050000-561b-aa90-58d6-8bba717ac867	8250	Brežice
00050000-561b-aa90-bcc4-5c68426dd097	4210	Brnik - Aerodrom
00050000-561b-aa90-eda4-99a9fbad6f5c	8321	Brusnice
00050000-561b-aa90-5599-6114edc5446f	3255	Buče
00050000-561b-aa90-56d9-d8333c26a346	8276	Bučka 
00050000-561b-aa90-82df-cbcaf5d67d5c	9261	Cankova
00050000-561b-aa90-f057-8895ec8ed03f	3000	Celje 
00050000-561b-aa90-4842-0db44987ff32	3001	Celje - poštni predali
00050000-561b-aa90-912e-0d5882c9dc03	4207	Cerklje na Gorenjskem
00050000-561b-aa90-6bed-03633232212a	8263	Cerklje ob Krki
00050000-561b-aa90-0fba-b611b675709b	1380	Cerknica
00050000-561b-aa90-7c58-192f5b447a73	5282	Cerkno
00050000-561b-aa90-8c90-cf6d54a6d8a0	2236	Cerkvenjak
00050000-561b-aa90-d8d6-faa0da34fd68	2215	Ceršak
00050000-561b-aa90-cf1d-8a2ba117616b	2326	Cirkovce
00050000-561b-aa90-7aee-b8e064876175	2282	Cirkulane
00050000-561b-aa90-44ce-c0ec7c73dad9	5273	Col
00050000-561b-aa90-e2d6-4523226d6f7d	8251	Čatež ob Savi
00050000-561b-aa90-4a9d-d38d45550ee2	1413	Čemšenik
00050000-561b-aa90-e8de-310d1dde37d9	5253	Čepovan
00050000-561b-aa90-43d6-320d69ec1618	9232	Črenšovci
00050000-561b-aa90-5352-eb5cd963b7ab	2393	Črna na Koroškem
00050000-561b-aa90-8397-6f8d036676fc	6275	Črni Kal
00050000-561b-aa90-a460-c7e7971898c1	5274	Črni Vrh nad Idrijo
00050000-561b-aa90-72f6-eecc426fecd3	5262	Črniče
00050000-561b-aa90-8dc7-2da505aed510	8340	Črnomelj
00050000-561b-aa90-442f-d912eb7675f8	6271	Dekani
00050000-561b-aa90-2b50-5e4a6568293b	5210	Deskle
00050000-561b-aa90-0e03-30e813b26073	2253	Destrnik
00050000-561b-aa90-38f9-1ce3a232107b	6215	Divača
00050000-561b-aa90-413c-9f91cf45d1b8	1233	Dob
00050000-561b-aa90-d083-462879a7697f	3224	Dobje pri Planini
00050000-561b-aa90-8388-ad9254605653	8257	Dobova
00050000-561b-aa90-534f-22793e658aad	1423	Dobovec
00050000-561b-aa90-d4c2-139f303283e6	5263	Dobravlje
00050000-561b-aa90-1cf9-f01995067c9c	3204	Dobrna
00050000-561b-aa90-99f6-29aba4490228	8211	Dobrnič
00050000-561b-aa90-7e67-8cff031bceea	1356	Dobrova
00050000-561b-aa90-75c6-6531fc0be180	9223	Dobrovnik/Dobronak 
00050000-561b-aa90-ef4c-c2dc9ac53625	5212	Dobrovo v Brdih
00050000-561b-aa90-1b54-501fd0c0ef87	1431	Dol pri Hrastniku
00050000-561b-aa90-9d27-0bc7b10ea6bb	1262	Dol pri Ljubljani
00050000-561b-aa90-d74b-67f022277e9f	1273	Dole pri Litiji
00050000-561b-aa90-55bf-1ac42f9c0358	1331	Dolenja vas
00050000-561b-aa90-2844-fec0abbf0b96	8350	Dolenjske Toplice
00050000-561b-aa90-42e8-88ee7e048fc3	1230	Domžale
00050000-561b-aa90-b8e6-041a97d1fdac	2252	Dornava
00050000-561b-aa90-7a6c-70060beff418	5294	Dornberk
00050000-561b-aa90-baff-b647e4489cca	1319	Draga
00050000-561b-aa90-812f-7603541f5302	8343	Dragatuš
00050000-561b-aa90-862f-51b5e19aa6ef	3222	Dramlje
00050000-561b-aa90-bcde-004542a8ed17	2370	Dravograd
00050000-561b-aa90-ff86-4abf3a167045	4203	Duplje
00050000-561b-aa90-aea0-9134685b1440	6221	Dutovlje
00050000-561b-aa90-e4eb-d89c1a593153	8361	Dvor
00050000-561b-aa90-e80c-e099c4770ddf	2343	Fala
00050000-561b-aa90-47f1-9e4d29077915	9208	Fokovci
00050000-561b-aa90-2c7d-4d95fc2feb99	2313	Fram
00050000-561b-aa90-55f5-b05dfdf3f1a3	3213	Frankolovo
00050000-561b-aa90-2d2b-609e92b94d3f	1274	Gabrovka
00050000-561b-aa90-d58e-04e1ba4424ac	8254	Globoko
00050000-561b-aa90-728e-7fad139aabe0	5275	Godovič
00050000-561b-aa90-8e05-eb238ace0803	4204	Golnik
00050000-561b-aa90-d066-fd3730d47e9b	3303	Gomilsko
00050000-561b-aa90-52c4-2ad5bb0928b6	4224	Gorenja vas
00050000-561b-aa90-3b0b-1e1af7dd21ff	3263	Gorica pri Slivnici
00050000-561b-aa90-ae93-61827d9b8f6b	2272	Gorišnica
00050000-561b-aa90-3271-efb504f9cbfe	9250	Gornja Radgona
00050000-561b-aa90-c1ae-ad756d89fcb5	3342	Gornji Grad
00050000-561b-aa90-3f73-3042b9b44556	4282	Gozd Martuljek
00050000-561b-aa90-f078-21088b527646	6272	Gračišče
00050000-561b-aa90-2aea-6f9acfaa6380	9264	Grad
00050000-561b-aa90-bd4d-f59dffc75074	8332	Gradac
00050000-561b-aa90-6847-9efea28f9bb7	1384	Grahovo
00050000-561b-aa90-75ea-6a79e6b8eb2e	5242	Grahovo ob Bači
00050000-561b-aa90-9b96-d2944eccbbaa	5251	Grgar
00050000-561b-aa90-e730-7e726e320c12	3302	Griže
00050000-561b-aa90-6632-fa8bc43efce2	3231	Grobelno
00050000-561b-aa90-fda3-64779af95ce1	1290	Grosuplje
00050000-561b-aa90-c468-925a694af471	2288	Hajdina
00050000-561b-aa90-11aa-bac5f61e6080	8362	Hinje
00050000-561b-aa90-0c64-368534073118	2311	Hoče
00050000-561b-aa90-798b-89c9d5df8407	9205	Hodoš/Hodos
00050000-561b-aa90-222a-34126e9c4599	1354	Horjul
00050000-561b-aa90-1e31-9ebbbc3d1b94	1372	Hotedršica
00050000-561b-aa90-15ab-75e9c178c2f6	1430	Hrastnik
00050000-561b-aa90-ed35-3f7a001ef603	6225	Hruševje
00050000-561b-aa90-86c5-d4b82faab2d9	4276	Hrušica
00050000-561b-aa90-3d76-2e15f31fc81a	5280	Idrija
00050000-561b-aa90-4c96-1d24ac9f1535	1292	Ig
00050000-561b-aa90-30bd-0b2b8884b46d	6250	Ilirska Bistrica
00050000-561b-aa90-6ec4-cd2a6516e729	6251	Ilirska Bistrica-Trnovo
00050000-561b-aa90-5dae-8d1e8de17547	1295	Ivančna Gorica
00050000-561b-aa90-5cec-96d6cd2c5056	2259	Ivanjkovci
00050000-561b-aa90-46ba-ad25edb2916e	1411	Izlake
00050000-561b-aa90-64e7-52f2f7299263	6310	Izola/Isola
00050000-561b-aa90-60b7-a8dd3d350ca4	2222	Jakobski Dol
00050000-561b-aa90-36c7-5490d1cd6ae6	2221	Jarenina
00050000-561b-aa90-7802-4302f0886cce	6254	Jelšane
00050000-561b-aa90-f15d-25a26f388761	4270	Jesenice
00050000-561b-aa90-db60-750eee71f444	8261	Jesenice na Dolenjskem
00050000-561b-aa90-78c0-29be5c12dd55	3273	Jurklošter
00050000-561b-aa90-ce31-516056f89bf4	2223	Jurovski Dol
00050000-561b-aa90-48b1-1328a3153707	2256	Juršinci
00050000-561b-aa90-4d81-3e44707aba2a	5214	Kal nad Kanalom
00050000-561b-aa90-9271-0b5955356355	3233	Kalobje
00050000-561b-aa90-44a6-3d73b0745c73	4246	Kamna Gorica
00050000-561b-aa90-78cc-23b26a449359	2351	Kamnica
00050000-561b-aa90-3488-8a8461ff588d	1241	Kamnik
00050000-561b-aa90-9bc3-4104844be9fe	5213	Kanal
00050000-561b-aa90-aa2f-fdd48d8f13e9	8258	Kapele
00050000-561b-aa90-883f-f6f44cd28043	2362	Kapla
00050000-561b-aa90-aca6-a75496ffd35f	2325	Kidričevo
00050000-561b-aa90-0ec3-b3c4f627a591	1412	Kisovec
00050000-561b-aa90-7289-4e6346eaae87	6253	Knežak
00050000-561b-aa90-3345-68e8220692eb	5222	Kobarid
00050000-561b-aa90-5ba3-e43e11e51f7c	9227	Kobilje
00050000-561b-aa90-1cd5-a350efc7e6f3	1330	Kočevje
00050000-561b-aa90-2ee2-a690b1b2b3ef	1338	Kočevska Reka
00050000-561b-aa90-3233-77a559fb2262	2276	Kog
00050000-561b-aa90-9565-16a856986692	5211	Kojsko
00050000-561b-aa90-40a4-ebfd22802b42	6223	Komen
00050000-561b-aa90-a4a8-0f1cca3b4b26	1218	Komenda
00050000-561b-aa90-b113-4905e39c61f6	6000	Koper/Capodistria 
00050000-561b-aa90-7ac0-3ae5bf8bb6e7	6001	Koper/Capodistria - poštni predali
00050000-561b-aa90-73ae-7342e5464192	8282	Koprivnica
00050000-561b-aa90-270a-68a05295f550	5296	Kostanjevica na Krasu
00050000-561b-aa90-990e-48a8d239c8ec	8311	Kostanjevica na Krki
00050000-561b-aa90-1066-37106940a464	1336	Kostel
00050000-561b-aa90-a770-a0a7e86a4dab	6256	Košana
00050000-561b-aa90-cdc0-13d772aca1c0	2394	Kotlje
00050000-561b-aa90-f629-4aad46235e13	6240	Kozina
00050000-561b-aa90-25fa-76fe3d0ac0e5	3260	Kozje
00050000-561b-aa90-cfe7-cd4f73826b9b	4000	Kranj 
00050000-561b-aa90-d5c4-7213d39eda73	4001	Kranj - poštni predali
00050000-561b-aa90-5eb5-0fc13e3c761c	4280	Kranjska Gora
00050000-561b-aa90-debe-236beadd2b60	1281	Kresnice
00050000-561b-aa90-0ca5-15bfed9c9e54	4294	Križe
00050000-561b-aa90-0559-284f86a3e869	9206	Križevci
00050000-561b-aa90-c6a8-4e5d0db680b2	9242	Križevci pri Ljutomeru
00050000-561b-aa90-739f-a31a0cbac765	1301	Krka
00050000-561b-aa90-e0c0-e29710d655dd	8296	Krmelj
00050000-561b-aa90-2752-182913af3865	4245	Kropa
00050000-561b-aa90-df4d-b36d3c0a7229	8262	Krška vas
00050000-561b-aa90-ad54-14344159207a	8270	Krško
00050000-561b-aa90-b4c4-32b9d35afcbf	9263	Kuzma
00050000-561b-aa90-bcef-83769958efd2	2318	Laporje
00050000-561b-aa90-e69e-d2b9c1331767	3270	Laško
00050000-561b-aa90-017c-0ffb74e23486	1219	Laze v Tuhinju
00050000-561b-aa90-f4a5-44aa803bfe2c	2230	Lenart v Slovenskih goricah
00050000-561b-aa90-1626-bde1f6e6303a	9220	Lendava/Lendva
00050000-561b-aa90-697b-d5e30beee1b0	4248	Lesce
00050000-561b-aa90-1858-2015f0f2efe6	3261	Lesično
00050000-561b-aa90-6279-f646f40aedab	8273	Leskovec pri Krškem
00050000-561b-aa90-3ce9-a5ca906b7921	2372	Libeliče
00050000-561b-aa90-53b1-7842a2277bdb	2341	Limbuš
00050000-561b-aa90-8522-1fc416b3617c	1270	Litija
00050000-561b-aa90-15a8-aa39fbd9f1fc	3202	Ljubečna
00050000-561b-aa90-f955-d6d46d6975f2	1000	Ljubljana 
00050000-561b-aa90-0dce-66cd9e8f8ad2	1001	Ljubljana - poštni predali
00050000-561b-aa90-13f9-6f384951d9b4	1231	Ljubljana - Črnuče
00050000-561b-aa90-b2b9-3d3de439c0f8	1261	Ljubljana - Dobrunje
00050000-561b-aa90-c0c6-45b850f8045c	1260	Ljubljana - Polje
00050000-561b-aa90-fda7-062dc94c0916	1210	Ljubljana - Šentvid
00050000-561b-aa90-c7d0-0f621f75e32e	1211	Ljubljana - Šmartno
00050000-561b-aa90-0cfd-709ea04f9c9c	3333	Ljubno ob Savinji
00050000-561b-aa90-27f7-55407d976958	9240	Ljutomer
00050000-561b-aa90-7e7f-20d01774db5e	3215	Loče
00050000-561b-aa90-dc66-77a30659139d	5231	Log pod Mangartom
00050000-561b-aa90-72e6-3141bce69b84	1358	Log pri Brezovici
00050000-561b-aa90-5a38-59883fb15518	1370	Logatec
00050000-561b-aa90-572a-9e323d7cd8ba	1371	Logatec
00050000-561b-aa90-79d5-b79913d3bf27	1434	Loka pri Zidanem Mostu
00050000-561b-aa90-580f-ec2a53cc3f27	3223	Loka pri Žusmu
00050000-561b-aa90-0a5e-9c17983bcbcd	6219	Lokev
00050000-561b-aa90-89f4-4e2ba4c4c907	1318	Loški Potok
00050000-561b-aa90-41ff-3ca8d43738ed	2324	Lovrenc na Dravskem polju
00050000-561b-aa90-5a4d-af3b7cd41519	2344	Lovrenc na Pohorju
00050000-561b-aa90-9062-499778c1d554	3334	Luče
00050000-561b-aa90-0c2e-b4fffd05454a	1225	Lukovica
00050000-561b-aa90-8d56-838ec019a092	9202	Mačkovci
00050000-561b-aa90-b4bc-c99725846865	2322	Majšperk
00050000-561b-aa90-af5c-47becc4df6b0	2321	Makole
00050000-561b-aa90-b3cb-11aeaa1ef58c	9243	Mala Nedelja
00050000-561b-aa90-a787-94367db3bb29	2229	Malečnik
00050000-561b-aa90-e1e2-ca3ab8a9bbc7	6273	Marezige
00050000-561b-aa90-ad30-cb531bd8c980	2000	Maribor 
00050000-561b-aa90-726d-d729c6a1d469	2001	Maribor - poštni predali
00050000-561b-aa90-e0d6-f8dfd665963e	2206	Marjeta na Dravskem polju
00050000-561b-aa90-8853-e44bc19396fb	2281	Markovci
00050000-561b-aa90-4892-028c025bf283	9221	Martjanci
00050000-561b-aa90-1752-d21659f64024	6242	Materija
00050000-561b-aa90-37d6-7b1581373bd4	4211	Mavčiče
00050000-561b-aa90-0b40-c55e6ef1698c	1215	Medvode
00050000-561b-aa90-b8c5-b3a60a2e19e4	1234	Mengeš
00050000-561b-aa90-7d8e-278c09817a3b	8330	Metlika
00050000-561b-aa90-4fda-0cefc78aaeb6	2392	Mežica
00050000-561b-aa90-57d4-6a6aa30fc9c1	2204	Miklavž na Dravskem polju
00050000-561b-aa90-ee2b-e7a8444073b5	2275	Miklavž pri Ormožu
00050000-561b-aa90-d634-8bee321f0d63	5291	Miren
00050000-561b-aa90-1f5d-c9cf5504d4e8	8233	Mirna
00050000-561b-aa90-b82d-dc25bc0cc6db	8216	Mirna Peč
00050000-561b-aa90-eb59-ddf1dc85e680	2382	Mislinja
00050000-561b-aa90-db06-91ad2f8b46c0	4281	Mojstrana
00050000-561b-aa90-a037-30aa44a6dca5	8230	Mokronog
00050000-561b-aa90-6f92-f3a48ae56d0d	1251	Moravče
00050000-561b-aa90-e51e-21ac94f4d870	9226	Moravske Toplice
00050000-561b-aa90-05df-ae5e4ccd813f	5216	Most na Soči
00050000-561b-aa90-5e08-a82655b0877b	1221	Motnik
00050000-561b-aa90-231b-c364c10c58d0	3330	Mozirje
00050000-561b-aa90-ea9b-7d691b76eafd	9000	Murska Sobota 
00050000-561b-aa90-4b94-4a42102736bd	9001	Murska Sobota - poštni predali
00050000-561b-aa90-9321-7082567a6dec	2366	Muta
00050000-561b-aa90-5469-fd92055c90d7	4202	Naklo
00050000-561b-aa90-ead9-f9171956d3aa	3331	Nazarje
00050000-561b-aa90-d1d6-ea87d9da3460	1357	Notranje Gorice
00050000-561b-aa90-3c82-354be0a660b9	3203	Nova Cerkev
00050000-561b-aa90-8d1e-90820265b5b4	5000	Nova Gorica 
00050000-561b-aa90-c885-6a7abaa1d35f	5001	Nova Gorica - poštni predali
00050000-561b-aa90-a6cd-94f058bbb0c1	1385	Nova vas
00050000-561b-aa90-c441-8154a77c0de0	8000	Novo mesto
00050000-561b-aa90-b3db-78a710100cd0	8001	Novo mesto - poštni predali
00050000-561b-aa90-f743-59bbc94f5b10	6243	Obrov
00050000-561b-aa90-e44f-6a22b3378dc0	9233	Odranci
00050000-561b-aa90-43c6-b736c82aec77	2317	Oplotnica
00050000-561b-aa90-9776-c1a5d9339b10	2312	Orehova vas
00050000-561b-aa90-5407-d320a72f8a73	2270	Ormož
00050000-561b-aa90-d938-b9dbd4139d54	1316	Ortnek
00050000-561b-aa90-6420-90712314a5f1	1337	Osilnica
00050000-561b-aa90-bd69-9f95ac42753f	8222	Otočec
00050000-561b-aa90-bddd-57a3032fbfa5	2361	Ožbalt
00050000-561b-aa90-0e15-50dec6fcc91e	2231	Pernica
00050000-561b-aa90-e0a1-2a979a3a9694	2211	Pesnica pri Mariboru
00050000-561b-aa90-e58f-668cfb3ba70f	9203	Petrovci
00050000-561b-aa90-b230-0d1945bc3813	3301	Petrovče
00050000-561b-aa90-8e9c-304734713689	6330	Piran/Pirano
00050000-561b-aa90-ecb2-3fb94bace495	8255	Pišece
00050000-561b-aa90-656a-de0db55d3ae0	6257	Pivka
00050000-561b-aa90-2720-5fdb536dafcf	6232	Planina
00050000-561b-aa90-95ac-2faac107322e	3225	Planina pri Sevnici
00050000-561b-aa90-90b7-a865a7da0ff1	6276	Pobegi
00050000-561b-aa90-a53b-37e674e36fd6	8312	Podbočje
00050000-561b-aa90-53c4-7f7c0fb8fb81	5243	Podbrdo
00050000-561b-aa90-e88c-f21cb16bf16c	3254	Podčetrtek
00050000-561b-aa90-0dd1-2deabc57a99f	2273	Podgorci
00050000-561b-aa90-f35e-a711c5e4e598	6216	Podgorje
00050000-561b-aa90-f07f-c424ae9cb5cf	2381	Podgorje pri Slovenj Gradcu
00050000-561b-aa90-996e-c8ff2b9df2aa	6244	Podgrad
00050000-561b-aa90-374e-145d644483a5	1414	Podkum
00050000-561b-aa90-37cd-99e597c48ae0	2286	Podlehnik
00050000-561b-aa90-8292-1ba608b83a4e	5272	Podnanos
00050000-561b-aa90-e518-5c94f3ea60aa	4244	Podnart
00050000-561b-aa90-12d3-261738110507	3241	Podplat
00050000-561b-aa90-ad16-b7d9a740497e	3257	Podsreda
00050000-561b-aa90-26ab-25a2b69e6988	2363	Podvelka
00050000-561b-aa90-bc81-e1a2abda9bfe	2208	Pohorje
00050000-561b-aa90-de93-bde3189aa67b	2257	Polenšak
00050000-561b-aa90-a18e-2fd5343116fb	1355	Polhov Gradec
00050000-561b-aa90-d7ac-b441b9e2ce53	4223	Poljane nad Škofjo Loko
00050000-561b-aa90-0680-beca41634035	2319	Poljčane
00050000-561b-aa90-65a0-22af03b51a3d	1272	Polšnik
00050000-561b-aa90-d45e-a7e9615b1d8f	3313	Polzela
00050000-561b-aa90-fd79-ffdcee2dc6ac	3232	Ponikva
00050000-561b-aa90-bcda-8f1564214550	6320	Portorož/Portorose
00050000-561b-aa90-ec7f-292486e81014	6230	Postojna
00050000-561b-aa90-a6f8-a0e8692d9ef1	2331	Pragersko
00050000-561b-aa90-4de6-36ecf1861cd0	3312	Prebold
00050000-561b-aa90-a96e-180c75e344bf	4205	Preddvor
00050000-561b-aa90-8eee-7df53fa77525	6255	Prem
00050000-561b-aa90-678f-5ac94371d4cb	1352	Preserje
00050000-561b-aa90-fc25-918fb70aa6d1	6258	Prestranek
00050000-561b-aa90-1989-a99839a83e5a	2391	Prevalje
00050000-561b-aa90-a497-7c604b9bea67	3262	Prevorje
00050000-561b-aa90-0bc8-9a112f76dec5	1276	Primskovo 
00050000-561b-aa90-ff4e-0feac1c8d555	3253	Pristava pri Mestinju
00050000-561b-aa90-89b5-4ae31d47d3b7	9207	Prosenjakovci/Partosfalva
00050000-561b-aa90-3574-2625ca6d3ba2	5297	Prvačina
00050000-561b-aa90-05b9-641507591f19	2250	Ptuj
00050000-561b-aa90-b06f-085de950447a	2323	Ptujska Gora
00050000-561b-aa90-1c37-694c5b1d78a0	9201	Puconci
00050000-561b-aa90-dc2e-4beabf7ba4d3	2327	Rače
00050000-561b-aa90-b23f-10691d1b098b	1433	Radeče
00050000-561b-aa90-b38a-364c71871ec2	9252	Radenci
00050000-561b-aa90-06de-25ae6ecea34b	2360	Radlje ob Dravi
00050000-561b-aa90-97ef-93bf4dd066cc	1235	Radomlje
00050000-561b-aa90-e44b-6ebbcc265305	4240	Radovljica
00050000-561b-aa90-3246-227f716e9898	8274	Raka
00050000-561b-aa90-4e95-95986cb37294	1381	Rakek
00050000-561b-aa90-c782-4fde9f5b73ac	4283	Rateče - Planica
00050000-561b-aa90-4a9f-9bd2ba0955bf	2390	Ravne na Koroškem
00050000-561b-aa90-8710-d1623819a1a3	9246	Razkrižje
00050000-561b-aa90-6b70-4419f19f62db	3332	Rečica ob Savinji
00050000-561b-aa90-6a67-7d47da63f7df	5292	Renče
00050000-561b-aa90-142c-16df024628ff	1310	Ribnica
00050000-561b-aa90-2e56-ce264cebffe8	2364	Ribnica na Pohorju
00050000-561b-aa90-6ccd-536f0b50bc0a	3272	Rimske Toplice
00050000-561b-aa90-8a65-bee2ce7cd6fb	1314	Rob
00050000-561b-aa90-486a-1c54fbc4d52c	5215	Ročinj
00050000-561b-aa90-7e0a-88ebff8dbc9b	3250	Rogaška Slatina
00050000-561b-aa90-33de-2f8d55650be0	9262	Rogašovci
00050000-561b-aa90-b140-8a6f1149ba47	3252	Rogatec
00050000-561b-aa90-c0d0-7b2628b7ae5b	1373	Rovte
00050000-561b-aa90-2b34-2889578e893d	2342	Ruše
00050000-561b-aa90-dfe7-d424ca9f433a	1282	Sava
00050000-561b-aa90-9697-c761047bc8af	6333	Sečovlje/Sicciole
00050000-561b-aa90-ff76-69c54bed292a	4227	Selca
00050000-561b-aa90-9013-d3cb4e3022d7	2352	Selnica ob Dravi
00050000-561b-aa90-3370-b32f53b2c4ed	8333	Semič
00050000-561b-aa90-dbf9-648b9269e394	8281	Senovo
00050000-561b-aa90-e413-b2b0f2f3696e	6224	Senožeče
00050000-561b-aa90-dbbb-436080f6ad0a	8290	Sevnica
00050000-561b-aa90-7998-c580fba91063	6210	Sežana
00050000-561b-aa90-c492-91b47c341c65	2214	Sladki Vrh
00050000-561b-aa90-cf0a-429043100ccc	5283	Slap ob Idrijci
00050000-561b-aa90-ad6c-edae9e24a546	2380	Slovenj Gradec
00050000-561b-aa90-ee1f-e69d3723a1a9	2310	Slovenska Bistrica
00050000-561b-aa90-92ca-277ba942c522	3210	Slovenske Konjice
00050000-561b-aa90-d307-267568faf5e8	1216	Smlednik
00050000-561b-aa90-e3f8-fccdc122dfda	5232	Soča
00050000-561b-aa90-0e60-112322f14953	1317	Sodražica
00050000-561b-aa90-865f-4263312e04e2	3335	Solčava
00050000-561b-aa90-1a14-2a5d6f2877e2	5250	Solkan
00050000-561b-aa90-66c6-ba9d8262c2c9	4229	Sorica
00050000-561b-aa90-8082-7195976e1113	4225	Sovodenj
00050000-561b-aa90-c28e-46e833e272c4	5281	Spodnja Idrija
00050000-561b-aa90-87a3-842cc6262a12	2241	Spodnji Duplek
00050000-561b-aa90-77ef-ea3da393f9ec	9245	Spodnji Ivanjci
00050000-561b-aa90-62e9-0c5f452fa1ce	2277	Središče ob Dravi
00050000-561b-aa90-f519-889db874553e	4267	Srednja vas v Bohinju
00050000-561b-aa90-5714-32b421917912	8256	Sromlje 
00050000-561b-aa90-c9dc-9d27457e96df	5224	Srpenica
00050000-561b-aa90-12ed-cd3a1b6fd7fd	1242	Stahovica
00050000-561b-aa90-030e-22b55e9f8cd9	1332	Stara Cerkev
00050000-561b-aa90-c814-511093c0e8df	8342	Stari trg ob Kolpi
00050000-561b-aa90-2cc5-b93a11ea85d7	1386	Stari trg pri Ložu
00050000-561b-aa90-e5f2-a0a1b53b99e7	2205	Starše
00050000-561b-aa90-1674-fb4fa91cc7a8	2289	Stoperce
00050000-561b-aa90-14f0-56f4e38392d2	8322	Stopiče
00050000-561b-aa90-5460-eb600b323bd0	3206	Stranice
00050000-561b-aa90-f113-a9e0a5070b6b	8351	Straža
00050000-561b-aa90-3207-5d0b755fba57	1313	Struge
00050000-561b-aa90-28bf-7db72e98fc67	8293	Studenec
00050000-561b-aa90-6ca1-327203d7d786	8331	Suhor
00050000-561b-aa90-c951-be1f108fb0b8	2233	Sv. Ana v Slovenskih goricah
00050000-561b-aa90-3726-413b72ee8c1b	2235	Sv. Trojica v Slovenskih goricah
00050000-561b-aa90-8f99-d706f833568d	2353	Sveti Duh na Ostrem Vrhu
00050000-561b-aa90-711a-46555cfac7fa	9244	Sveti Jurij ob Ščavnici
00050000-561b-aa90-2c7e-d4509617413e	3264	Sveti Štefan
00050000-561b-aa90-1d5b-03ee89a3b4a0	2258	Sveti Tomaž
00050000-561b-aa90-937e-b85b9115de44	9204	Šalovci
00050000-561b-aa90-8525-fedb7e45635f	5261	Šempas
00050000-561b-aa90-0235-876f510a6709	5290	Šempeter pri Gorici
00050000-561b-aa90-a3a8-983b3c90e2d9	3311	Šempeter v Savinjski dolini
00050000-561b-aa90-eaef-021fe29e40ad	4208	Šenčur
00050000-561b-aa90-7c52-ae0b10172089	2212	Šentilj v Slovenskih goricah
00050000-561b-aa90-80d1-081c345ae45b	8297	Šentjanž
00050000-561b-aa90-3196-909836b623de	2373	Šentjanž pri Dravogradu
00050000-561b-aa90-3556-6fbb8c8db9e6	8310	Šentjernej
00050000-561b-aa90-63c6-23702f3e0b34	3230	Šentjur
00050000-561b-aa90-eff0-73e28a54e63e	3271	Šentrupert
00050000-561b-aa90-fe4a-c1a59255b716	8232	Šentrupert
00050000-561b-aa90-4485-a8b63bf05903	1296	Šentvid pri Stični
00050000-561b-aa90-c0f3-35179a6c7c6d	8275	Škocjan
00050000-561b-aa90-bed8-ccd8966ab84f	6281	Škofije
00050000-561b-aa90-ee89-7cf9b264cbde	4220	Škofja Loka
00050000-561b-aa90-0bc5-691f1287c256	3211	Škofja vas
00050000-561b-aa90-cbfa-ac87e73847c8	1291	Škofljica
00050000-561b-aa90-268a-528256e723ea	6274	Šmarje
00050000-561b-aa90-7dbd-5d31910ae10f	1293	Šmarje - Sap
00050000-561b-aa90-ed22-eea6d0a1eeda	3240	Šmarje pri Jelšah
00050000-561b-aa90-2aec-88399e0f065c	8220	Šmarješke Toplice
00050000-561b-aa90-7a22-b41aac5d1891	2315	Šmartno na Pohorju
00050000-561b-aa90-1641-af4779a4f10e	3341	Šmartno ob Dreti
00050000-561b-aa90-9cdd-38148344e2d1	3327	Šmartno ob Paki
00050000-561b-aa90-9c4b-8466b63eeb40	1275	Šmartno pri Litiji
00050000-561b-aa90-c36f-487844692c4c	2383	Šmartno pri Slovenj Gradcu
00050000-561b-aa90-0bde-163b992215e5	3201	Šmartno v Rožni dolini
00050000-561b-aa90-7675-a1a876baa0aa	3325	Šoštanj
00050000-561b-aa90-5332-c0b4052cda68	6222	Štanjel
00050000-561b-aa90-46f9-60e115d8daa8	3220	Štore
00050000-561b-aa90-b359-686596e6fd7c	3304	Tabor
00050000-561b-aa90-ba8f-a0d9e8fa119d	3221	Teharje
00050000-561b-aa90-384f-d8ee4ae0c000	9251	Tišina
00050000-561b-aa90-1da0-38cad54fcf42	5220	Tolmin
00050000-561b-aa90-bd80-0dcf4a90f5ad	3326	Topolšica
00050000-561b-aa90-6bbb-a7c87afb72aa	2371	Trbonje
00050000-561b-aa90-82df-693e53ddec9a	1420	Trbovlje
00050000-561b-aa90-6424-4971d8b570e4	8231	Trebelno 
00050000-561b-aa90-1820-71997c43f48e	8210	Trebnje
00050000-561b-aa90-2797-f1aefcb8f96f	5252	Trnovo pri Gorici
00050000-561b-aa90-e298-73525f6cb352	2254	Trnovska vas
00050000-561b-aa90-2727-15fed0e46d87	1222	Trojane
00050000-561b-aa90-7675-f9fdbf51fbf7	1236	Trzin
00050000-561b-aa90-45b3-902a624c0158	4290	Tržič
00050000-561b-aa90-a668-3943f9792bec	8295	Tržišče
00050000-561b-aa90-b076-9e8295e67408	1311	Turjak
00050000-561b-aa90-93f4-7da30dafdc24	9224	Turnišče
00050000-561b-aa90-d8ed-495dc13142e8	8323	Uršna sela
00050000-561b-aa90-2d9c-64b9af94e1cf	1252	Vače
00050000-561b-aa90-b7e1-c4f983d7974f	3320	Velenje 
00050000-561b-aa90-b4d7-081d95ccf49e	3322	Velenje - poštni predali
00050000-561b-aa90-5d05-35f57e6999bf	8212	Velika Loka
00050000-561b-aa90-12a8-a4f904797b39	2274	Velika Nedelja
00050000-561b-aa90-5460-b0e89b610189	9225	Velika Polana
00050000-561b-aa90-bd95-ee46999e6f2e	1315	Velike Lašče
00050000-561b-aa90-5775-1a4990f54fbe	8213	Veliki Gaber
00050000-561b-aa90-2e58-2da1f1d0f3d7	9241	Veržej
00050000-561b-aa90-c01c-ebf61775624b	1312	Videm - Dobrepolje
00050000-561b-aa90-1225-4454289c8c9d	2284	Videm pri Ptuju
00050000-561b-aa90-bed9-ad994e544ac6	8344	Vinica
00050000-561b-aa90-4e27-2f10d7656ded	5271	Vipava
00050000-561b-aa90-f38a-09965ee9ed5c	4212	Visoko
00050000-561b-aa90-f300-4be632608406	1294	Višnja Gora
00050000-561b-aa90-8025-205595ecaec8	3205	Vitanje
00050000-561b-aa90-de16-dac8b8c122bd	2255	Vitomarci
00050000-561b-aa90-9b29-2f42b8185061	1217	Vodice
00050000-561b-aa90-3fa5-a7fc09644c71	3212	Vojnik\t
00050000-561b-aa90-d220-904662fe1dc3	5293	Volčja Draga
00050000-561b-aa90-128e-33b4eecff832	2232	Voličina
00050000-561b-aa90-250a-c8a521ec75a4	3305	Vransko
00050000-561b-aa90-5f2f-de2ec43fb2c9	6217	Vremski Britof
00050000-561b-aa90-5734-d2989676c15f	1360	Vrhnika
00050000-561b-aa90-6a1e-37f507576af0	2365	Vuhred
00050000-561b-aa90-8174-1c44d8cba13f	2367	Vuzenica
00050000-561b-aa90-3ecc-ecc92d3b503f	8292	Zabukovje 
00050000-561b-aa90-7a7e-665765227d61	1410	Zagorje ob Savi
00050000-561b-aa90-4e78-2c1635ed9835	1303	Zagradec
00050000-561b-aa90-f83e-ffe5c6bb0b9b	2283	Zavrč
00050000-561b-aa90-8cc2-27ed1a5e4026	8272	Zdole 
00050000-561b-aa90-e1b7-e55a2f21df7d	4201	Zgornja Besnica
00050000-561b-aa90-d8f5-63d02338b0ee	2242	Zgornja Korena
00050000-561b-aa90-7126-1375c8296fc9	2201	Zgornja Kungota
00050000-561b-aa90-c81d-e3748c891d06	2316	Zgornja Ložnica
00050000-561b-aa90-1080-1f45044b7cbb	2314	Zgornja Polskava
00050000-561b-aa90-e162-00a40c8fa99c	2213	Zgornja Velka
00050000-561b-aa90-1488-54f2a5160b2d	4247	Zgornje Gorje
00050000-561b-aa90-87d3-c73c16bf1d31	4206	Zgornje Jezersko
00050000-561b-aa90-184b-fc618f8af90e	2285	Zgornji Leskovec
00050000-561b-aa90-58b4-6ac7172728bb	1432	Zidani Most
00050000-561b-aa90-97e7-88731d9bf2d2	3214	Zreče
00050000-561b-aa90-6468-3f7498a818e2	4209	Žabnica
00050000-561b-aa90-b9cd-ced051f786a4	3310	Žalec
00050000-561b-aa90-0823-e3889065d61f	4228	Železniki
00050000-561b-aa90-494c-f50777dbcab6	2287	Žetale
00050000-561b-aa90-61a6-bd22c041c74c	4226	Žiri
00050000-561b-aa90-c12d-6ff100e2278e	4274	Žirovnica
00050000-561b-aa90-df3f-05c68ff694bf	8360	Žužemberk
\.


--
-- TOC entry 3045 (class 0 OID 21719031)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21718636)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21718416)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561b-aa92-bf3d-9fd2005a7b2f	00080000-561b-aa92-6e4e-a9328b11178a	\N	00040000-561b-aa90-6334-c0a04a554cfa	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561b-aa92-aa35-b5202690d198	00080000-561b-aa92-6e4e-a9328b11178a	\N	00040000-561b-aa90-6334-c0a04a554cfa	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561b-aa92-2508-15f7bdb570d5	00080000-561b-aa92-3725-70a5fe409094	\N	00040000-561b-aa90-6334-c0a04a554cfa	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3007 (class 0 OID 21718520)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21718648)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 21719045)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 21719055)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561b-aa92-af80-153f7c976f91	00080000-561b-aa92-266c-5e8aec486c0b	0987	AK
00190000-561b-aa92-c244-eb18ff1787b0	00080000-561b-aa92-3725-70a5fe409094	0989	AK
00190000-561b-aa92-7cc1-bb2326533817	00080000-561b-aa92-9649-eacc0cee7629	0986	AK
00190000-561b-aa92-6b66-b5bcb8c20503	00080000-561b-aa92-8737-3ee69e1537fd	0984	AK
00190000-561b-aa92-32ae-c7c81e39945a	00080000-561b-aa92-cd7c-9f94fa3c3fd7	0983	AK
00190000-561b-aa92-df69-51eef4612475	00080000-561b-aa92-7c83-d63ca4006db8	0982	AK
00190000-561b-aa94-0108-1b925a133ce1	00080000-561b-aa94-671f-a1b013d243fa	1001	AK
\.


--
-- TOC entry 3044 (class 0 OID 21718978)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561b-aa92-6fea-1e14f75eb098	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3048 (class 0 OID 21719063)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21718677)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561b-aa92-fe8e-bd3c0fa41044	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561b-aa92-1b84-a719ce65d1d1	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561b-aa92-b03b-c87aaf6d1a9f	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561b-aa92-3b2a-0385d034c406	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561b-aa92-2359-8e64e085ee82	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561b-aa92-fe53-7fb5c5117833	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561b-aa92-6215-963948672d72	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3016 (class 0 OID 21718621)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21718611)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21718821)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21718751)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21718494)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21718289)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561b-aa94-671f-a1b013d243fa	00010000-561b-aa91-ff87-b86b9f494a56	2015-10-12 14:41:56	INS	a:0:{}
2	App\\Entity\\Option	00000000-561b-aa94-9b53-ff9806aab162	00010000-561b-aa91-ff87-b86b9f494a56	2015-10-12 14:41:56	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561b-aa94-0108-1b925a133ce1	00010000-561b-aa91-ff87-b86b9f494a56	2015-10-12 14:41:56	INS	a:0:{}
\.


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3025 (class 0 OID 21718690)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 21718327)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561b-aa91-cfe0-7a5ff678fb81	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561b-aa91-7518-11be64dd0a41	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561b-aa91-fbe7-c45e119f9c78	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561b-aa91-6f22-8fd6faa85690	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561b-aa91-4450-30ac73bac6ef	planer	Planer dogodkov v koledarju	t
00020000-561b-aa91-9071-adbc4260765d	kadrovska	Kadrovska služba	t
00020000-561b-aa91-95f3-432f37aa7866	arhivar	Ažuriranje arhivalij	t
00020000-561b-aa91-e8bc-da6fd1665db3	igralec	Igralec	t
00020000-561b-aa91-8442-d43c8de80a86	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561b-aa92-345c-20fd2bf748f0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2990 (class 0 OID 21718311)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561b-aa91-0759-5cb88283bdec	00020000-561b-aa91-fbe7-c45e119f9c78
00010000-561b-aa91-ff87-b86b9f494a56	00020000-561b-aa91-fbe7-c45e119f9c78
00010000-561b-aa92-0fdb-ef4b64255081	00020000-561b-aa92-345c-20fd2bf748f0
\.


--
-- TOC entry 3027 (class 0 OID 21718704)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 21718642)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21718588)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21718276)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561b-aa90-df36-afd66f8b0a02	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561b-aa90-855f-e17f64654b36	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561b-aa90-11c6-f08310547da6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561b-aa90-a4fe-ccc94de4fd3d	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561b-aa90-e841-2849cb005d31	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2985 (class 0 OID 21718268)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561b-aa90-bb39-4c2f59c24cca	00230000-561b-aa90-a4fe-ccc94de4fd3d	popa
00240000-561b-aa90-87b4-8cbc6fb745f1	00230000-561b-aa90-a4fe-ccc94de4fd3d	oseba
00240000-561b-aa90-e4b1-31def5c7068f	00230000-561b-aa90-a4fe-ccc94de4fd3d	sezona
00240000-561b-aa90-5398-1ce1181b8a81	00230000-561b-aa90-855f-e17f64654b36	prostor
00240000-561b-aa90-f919-dcae3b3a83e4	00230000-561b-aa90-a4fe-ccc94de4fd3d	besedilo
00240000-561b-aa90-8fe3-f3ecee2a9f49	00230000-561b-aa90-a4fe-ccc94de4fd3d	uprizoritev
00240000-561b-aa90-65b2-376a49580349	00230000-561b-aa90-a4fe-ccc94de4fd3d	funkcija
00240000-561b-aa90-977a-27c7bb06f804	00230000-561b-aa90-a4fe-ccc94de4fd3d	tipfunkcije
00240000-561b-aa90-9b86-e46a2dfab232	00230000-561b-aa90-a4fe-ccc94de4fd3d	alternacija
00240000-561b-aa90-ab28-98b55b409386	00230000-561b-aa90-df36-afd66f8b0a02	pogodba
00240000-561b-aa90-ac70-ac67dffe0d21	00230000-561b-aa90-a4fe-ccc94de4fd3d	zaposlitev
00240000-561b-aa90-1ceb-14a3e44409d8	00230000-561b-aa90-a4fe-ccc94de4fd3d	zvrstuprizoritve
00240000-561b-aa90-247c-080f17319d0b	00230000-561b-aa90-df36-afd66f8b0a02	programdela
00240000-561b-aa90-179c-a24e118a06fe	00230000-561b-aa90-a4fe-ccc94de4fd3d	zapis
\.


--
-- TOC entry 2984 (class 0 OID 21718263)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
062bf0cc-73f3-4032-96f8-26c7866c2955	00240000-561b-aa90-bb39-4c2f59c24cca	0	1001
\.


--
-- TOC entry 3033 (class 0 OID 21718768)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561b-aa92-fd05-6e2b4917fdc2	000e0000-561b-aa92-11e4-286b42219ff6	00080000-561b-aa92-6e4e-a9328b11178a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561b-aa90-4eee-29f52630edaa
00270000-561b-aa92-bab1-797c1710ae31	000e0000-561b-aa92-11e4-286b42219ff6	00080000-561b-aa92-6e4e-a9328b11178a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561b-aa90-4eee-29f52630edaa
\.


--
-- TOC entry 2997 (class 0 OID 21718389)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21718598)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-561b-aa93-e8bd-b7460c783869	00180000-561b-aa92-9e6b-761a847df9ba	000c0000-561b-aa92-a7a8-f1a39e85b52b	00090000-561b-aa92-ad13-91600139d4be	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-aa93-9c16-9fef110e9970	00180000-561b-aa92-9e6b-761a847df9ba	000c0000-561b-aa92-d989-ea154c7af78e	00090000-561b-aa92-9858-2ee3f9819673	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-aa93-c123-5d3c78ea5036	00180000-561b-aa92-9e6b-761a847df9ba	000c0000-561b-aa92-66ac-cc2e6912f741	00090000-561b-aa92-3705-497115dd9bbe	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-aa93-73eb-855a515d834f	00180000-561b-aa92-9e6b-761a847df9ba	000c0000-561b-aa92-4597-cf324bd4110a	00090000-561b-aa92-2528-f1e0ededb2d9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-aa93-207c-8824442d2280	00180000-561b-aa92-9e6b-761a847df9ba	000c0000-561b-aa92-21e6-77729de0baf4	00090000-561b-aa92-6bcb-76f28b4153b9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-aa93-f217-d8ab6662d643	00180000-561b-aa92-ce44-1c73dacc5cc6	\N	00090000-561b-aa92-6bcb-76f28b4153b9	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3036 (class 0 OID 21718809)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561b-aa90-dc74-5cbd9009d624	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561b-aa90-848b-0eefa8ac0534	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561b-aa90-8c2a-0e28291d0056	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561b-aa90-75ff-5ad2eadeaa64	04	Režija	Režija	Režija	umetnik	30
000f0000-561b-aa90-2531-d1f70d4dc13b	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561b-aa90-a1aa-ee9518e4f23e	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561b-aa90-58d9-1a61ef294c75	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561b-aa90-d4c3-f9de47554093	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561b-aa90-1a47-4c39e5b236b3	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561b-aa90-8de2-d7013305a9a5	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561b-aa90-1bfe-bd2315c1a890	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561b-aa90-e191-7f364dd507b7	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561b-aa90-fe1c-ba7866c29b4b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561b-aa90-6d66-8e4649aaa0fd	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561b-aa90-6b1a-d68bd2d694aa	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561b-aa90-4d1a-3315cdb98f47	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561b-aa90-56b3-394da539e942	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561b-aa90-a727-f76f2769f943	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3049 (class 0 OID 21719074)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561b-aa90-2217-337447b49ace	01	Velika predstava	f	1.00	1.00
002b0000-561b-aa90-ff4d-ab3a873f6b1d	02	Mala predstava	f	0.50	0.50
002b0000-561b-aa90-b525-5a8c89cf148a	03	Mala koprodukcija	t	0.40	1.00
002b0000-561b-aa90-9469-7c4ef279455b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561b-aa90-10ea-2f8d6231a3ca	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3002 (class 0 OID 21718451)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21718298)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561b-aa91-ff87-b86b9f494a56	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROqYqgQIv1Vs5c1sa76/HvnPYeFKUOVp6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561b-aa92-017b-b3260ba73ccd	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561b-aa92-c92f-f0e1c552ce03	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561b-aa92-1982-cb6f1073528c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561b-aa92-7394-821fc842e34e	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561b-aa92-815f-5725f39543fb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561b-aa92-0c38-0a30b0edb952	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561b-aa92-5ffc-5713725dcaf0	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561b-aa92-5561-9210f2f6f89a	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561b-aa92-fe24-abb729303b30	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561b-aa92-0fdb-ef4b64255081	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561b-aa91-0759-5cb88283bdec	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 21718859)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561b-aa92-d9b0-fe7c656e653e	00160000-561b-aa92-20ca-e9b5f216338a	\N	00140000-561b-aa90-f63f-f80c187d30d5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561b-aa92-2359-8e64e085ee82
000e0000-561b-aa92-11e4-286b42219ff6	00160000-561b-aa92-188a-55fc79af0bf6	\N	00140000-561b-aa90-d406-7ca3b9d53271	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561b-aa92-fe53-7fb5c5117833
000e0000-561b-aa92-a2bc-9bfc33e77259	\N	\N	00140000-561b-aa90-d406-7ca3b9d53271	00190000-561b-aa92-af80-153f7c976f91	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561b-aa92-2359-8e64e085ee82
000e0000-561b-aa92-5ab0-c345bb651686	\N	\N	00140000-561b-aa90-d406-7ca3b9d53271	00190000-561b-aa92-af80-153f7c976f91	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561b-aa92-2359-8e64e085ee82
000e0000-561b-aa92-5f4f-ecec04a4fad4	\N	\N	00140000-561b-aa90-d406-7ca3b9d53271	00190000-561b-aa92-af80-153f7c976f91	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561b-aa92-fe8e-bd3c0fa41044
000e0000-561b-aa92-62b7-903504151a01	\N	\N	00140000-561b-aa90-d406-7ca3b9d53271	00190000-561b-aa92-af80-153f7c976f91	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561b-aa92-fe8e-bd3c0fa41044
\.


--
-- TOC entry 3009 (class 0 OID 21718542)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561b-aa92-d3c6-c3b7a6e02ab7	000e0000-561b-aa92-11e4-286b42219ff6	\N	1	
00200000-561b-aa92-a3c4-fbb4c355db9b	000e0000-561b-aa92-11e4-286b42219ff6	\N	2	
00200000-561b-aa92-eb5e-000ba6a8d56b	000e0000-561b-aa92-11e4-286b42219ff6	\N	3	
00200000-561b-aa92-05d9-7cc916f587da	000e0000-561b-aa92-11e4-286b42219ff6	\N	4	
00200000-561b-aa92-9296-5d520cd1d299	000e0000-561b-aa92-11e4-286b42219ff6	\N	5	
\.


--
-- TOC entry 3023 (class 0 OID 21718669)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21718782)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561b-aa90-b04c-6839e21a93e8	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561b-aa90-15b8-e069ae85af0b	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561b-aa90-a25c-7a9c0166da91	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561b-aa90-429d-68096b6f9a26	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561b-aa90-fe57-b95264fde72e	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561b-aa90-030f-a6d96fc16381	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561b-aa90-4e00-e28378fce3b2	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561b-aa90-7f51-38b65a154013	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561b-aa90-4eee-29f52630edaa	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561b-aa90-cd57-2c8d199b84e5	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561b-aa90-4ee1-4f5b6b3655c7	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561b-aa90-c1e9-18829ac9447b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561b-aa90-b6e9-6f9b577813aa	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561b-aa90-6e47-70a22f636ce4	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561b-aa90-28e6-3de481c49a23	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561b-aa90-4531-98f022c84252	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561b-aa90-c25f-a7f7b884be64	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561b-aa90-2f03-05b9db200bac	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561b-aa90-a40b-0aa9a454dfd2	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561b-aa90-0b14-a6ad3e9c4a22	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561b-aa90-a337-8decf27e907a	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561b-aa90-beb9-b469929f7c88	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561b-aa90-7a80-68cc15a3490f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561b-aa90-bb11-3402e9e07c91	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561b-aa90-dbe5-21c0d873bfe3	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561b-aa90-ab94-d360da970517	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561b-aa90-ae12-e403f2df3646	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561b-aa90-2b75-bfc0d27aaeaf	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3052 (class 0 OID 21719121)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 21719093)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 21719133)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21718741)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-561b-aa92-0baa-f8ed85d98ba8	00090000-561b-aa92-9858-2ee3f9819673	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-aa92-72d9-66484a9b94f1	00090000-561b-aa92-3705-497115dd9bbe	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-aa92-3a61-4a964deb8d72	00090000-561b-aa92-a424-f6423a799940	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-aa92-4099-c04b160a137c	00090000-561b-aa92-bc4e-8cc0cbf5a4b6	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-aa92-cf15-40b33a763c60	00090000-561b-aa92-ad13-91600139d4be	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-aa92-ee70-2bfee3044c11	00090000-561b-aa92-4da4-779eec23e748	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3011 (class 0 OID 21718577)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21718849)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561b-aa90-f63f-f80c187d30d5	01	Drama	drama (SURS 01)
00140000-561b-aa90-a7ec-c641d0da66d3	02	Opera	opera (SURS 02)
00140000-561b-aa90-ebbe-16ae66f4296e	03	Balet	balet (SURS 03)
00140000-561b-aa90-328c-2f5ab746ce1d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561b-aa90-45cb-b6a438f99e6a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561b-aa90-d406-7ca3b9d53271	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561b-aa90-c2bd-983440cc4b2f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3029 (class 0 OID 21718731)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2516 (class 2606 OID 21718352)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21718908)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 21718898)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 21718765)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 21718807)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 21719173)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21718566)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21718587)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21719091)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21718477)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21718972)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 21718727)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 21718540)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 21718515)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 21718491)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 21718634)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 21719150)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 21719157)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2770 (class 2606 OID 21719181)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2628 (class 2606 OID 21718661)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 21718449)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 21718361)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21718385)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 21718341)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2507 (class 2606 OID 21718326)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 21718667)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 21718703)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21718844)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 21718413)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 21718437)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 21719043)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21718640)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 21718427)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 21718528)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21718652)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 21719052)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 21719060)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 21719030)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 21719072)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21718685)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21718625)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21718616)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21718831)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 21718758)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 21718503)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 21718297)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21718694)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21718315)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2509 (class 2606 OID 21718335)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21718712)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 21718647)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 21718596)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 21718285)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 21718273)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 21718267)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 21718778)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 21718394)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 21718607)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 21718818)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21719084)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 21718462)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 21718310)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 21718877)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21718550)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 21718675)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 21718790)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 21719131)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 21719115)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 21719139)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21718749)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 21718581)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 21718857)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 21718739)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 1259 OID 21718575)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2581 (class 1259 OID 21718576)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2582 (class 1259 OID 21718574)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2583 (class 1259 OID 21718573)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2584 (class 1259 OID 21718572)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2670 (class 1259 OID 21718779)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2671 (class 1259 OID 21718780)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 21718781)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2756 (class 1259 OID 21719152)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2757 (class 1259 OID 21719151)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2530 (class 1259 OID 21718415)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2629 (class 1259 OID 21718668)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2743 (class 1259 OID 21719119)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2744 (class 1259 OID 21719118)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2745 (class 1259 OID 21719120)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2746 (class 1259 OID 21719117)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2747 (class 1259 OID 21719116)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2623 (class 1259 OID 21718654)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2624 (class 1259 OID 21718653)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2575 (class 1259 OID 21718551)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 21718728)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2654 (class 1259 OID 21718730)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2655 (class 1259 OID 21718729)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2555 (class 1259 OID 21718493)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 21718492)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 21719073)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2686 (class 1259 OID 21718846)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2687 (class 1259 OID 21718847)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 21718848)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2753 (class 1259 OID 21719140)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2695 (class 1259 OID 21718882)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2696 (class 1259 OID 21718879)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2697 (class 1259 OID 21718883)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2698 (class 1259 OID 21718881)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2699 (class 1259 OID 21718880)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2545 (class 1259 OID 21718464)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2546 (class 1259 OID 21718463)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 21718388)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2641 (class 1259 OID 21718695)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2511 (class 1259 OID 21718342)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2512 (class 1259 OID 21718343)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2646 (class 1259 OID 21718715)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2647 (class 1259 OID 21718714)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2648 (class 1259 OID 21718713)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2568 (class 1259 OID 21718529)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 21718530)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2491 (class 1259 OID 21718275)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2603 (class 1259 OID 21718620)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2604 (class 1259 OID 21718618)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2605 (class 1259 OID 21718617)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2606 (class 1259 OID 21718619)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2502 (class 1259 OID 21718316)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 21718317)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2632 (class 1259 OID 21718676)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2766 (class 1259 OID 21719174)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2668 (class 1259 OID 21718767)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 21718766)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2767 (class 1259 OID 21719182)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2768 (class 1259 OID 21719183)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2618 (class 1259 OID 21718641)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2662 (class 1259 OID 21718759)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2663 (class 1259 OID 21718760)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2716 (class 1259 OID 21718977)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2717 (class 1259 OID 21718976)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2718 (class 1259 OID 21718973)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2719 (class 1259 OID 21718974)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2720 (class 1259 OID 21718975)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2534 (class 1259 OID 21718429)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 21718428)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2536 (class 1259 OID 21718430)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2635 (class 1259 OID 21718689)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2636 (class 1259 OID 21718688)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2726 (class 1259 OID 21719053)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 21719054)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2709 (class 1259 OID 21718912)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 21718913)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2711 (class 1259 OID 21718910)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2712 (class 1259 OID 21718911)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2659 (class 1259 OID 21718750)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2609 (class 1259 OID 21718629)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2610 (class 1259 OID 21718628)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2611 (class 1259 OID 21718626)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2612 (class 1259 OID 21718627)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2705 (class 1259 OID 21718900)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 21718899)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2559 (class 1259 OID 21718504)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2562 (class 1259 OID 21718518)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2563 (class 1259 OID 21718517)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2564 (class 1259 OID 21718516)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 21718519)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2574 (class 1259 OID 21718541)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 21719044)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2742 (class 1259 OID 21719092)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2760 (class 1259 OID 21719158)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2761 (class 1259 OID 21719159)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2517 (class 1259 OID 21718363)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2518 (class 1259 OID 21718362)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2526 (class 1259 OID 21718395)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 21718396)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 21718582)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 21718610)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 21718609)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2600 (class 1259 OID 21718608)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2585 (class 1259 OID 21718568)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2586 (class 1259 OID 21718569)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2587 (class 1259 OID 21718567)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2588 (class 1259 OID 21718571)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2589 (class 1259 OID 21718570)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2533 (class 1259 OID 21718414)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 21718478)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 21718480)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2553 (class 1259 OID 21718479)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2554 (class 1259 OID 21718481)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2617 (class 1259 OID 21718635)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2691 (class 1259 OID 21718845)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2700 (class 1259 OID 21718878)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2682 (class 1259 OID 21718819)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 21718820)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2524 (class 1259 OID 21718386)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 21718387)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2656 (class 1259 OID 21718740)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 21718286)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 21718450)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2494 (class 1259 OID 21718274)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2739 (class 1259 OID 21719085)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 21718687)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2640 (class 1259 OID 21718686)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 21718909)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 21718438)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 21718858)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 21719132)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 21719061)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 21719062)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2679 (class 1259 OID 21718808)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2597 (class 1259 OID 21718597)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 21718336)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2797 (class 2606 OID 21719314)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2798 (class 2606 OID 21719319)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2802 (class 2606 OID 21719339)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2796 (class 2606 OID 21719309)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2800 (class 2606 OID 21719329)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2801 (class 2606 OID 21719334)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2799 (class 2606 OID 21719324)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2835 (class 2606 OID 21719504)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2836 (class 2606 OID 21719509)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 21719514)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2870 (class 2606 OID 21719679)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2869 (class 2606 OID 21719674)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2782 (class 2606 OID 21719239)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2819 (class 2606 OID 21719424)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2866 (class 2606 OID 21719659)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2865 (class 2606 OID 21719654)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2867 (class 2606 OID 21719664)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2864 (class 2606 OID 21719649)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2863 (class 2606 OID 21719644)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2818 (class 2606 OID 21719419)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2817 (class 2606 OID 21719414)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2795 (class 2606 OID 21719304)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 21719464)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2829 (class 2606 OID 21719474)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2828 (class 2606 OID 21719469)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2789 (class 2606 OID 21719274)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 21719269)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2815 (class 2606 OID 21719404)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2861 (class 2606 OID 21719634)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2838 (class 2606 OID 21719519)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2839 (class 2606 OID 21719524)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 21719529)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2868 (class 2606 OID 21719669)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2844 (class 2606 OID 21719549)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2841 (class 2606 OID 21719534)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2845 (class 2606 OID 21719554)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2843 (class 2606 OID 21719544)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2842 (class 2606 OID 21719539)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2787 (class 2606 OID 21719264)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2786 (class 2606 OID 21719259)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 21719224)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2778 (class 2606 OID 21719219)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 21719444)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2774 (class 2606 OID 21719199)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2775 (class 2606 OID 21719204)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2826 (class 2606 OID 21719459)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2825 (class 2606 OID 21719454)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2824 (class 2606 OID 21719449)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2792 (class 2606 OID 21719289)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2793 (class 2606 OID 21719294)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2771 (class 2606 OID 21719184)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2810 (class 2606 OID 21719379)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2808 (class 2606 OID 21719369)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2807 (class 2606 OID 21719364)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2809 (class 2606 OID 21719374)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2772 (class 2606 OID 21719189)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 21719194)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2820 (class 2606 OID 21719429)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2873 (class 2606 OID 21719694)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2834 (class 2606 OID 21719499)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2833 (class 2606 OID 21719494)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2874 (class 2606 OID 21719699)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2875 (class 2606 OID 21719704)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2816 (class 2606 OID 21719409)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2831 (class 2606 OID 21719484)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2832 (class 2606 OID 21719489)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 21719609)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2855 (class 2606 OID 21719604)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2852 (class 2606 OID 21719589)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 21719594)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2854 (class 2606 OID 21719599)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2784 (class 2606 OID 21719249)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2783 (class 2606 OID 21719244)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 21719254)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2822 (class 2606 OID 21719439)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2821 (class 2606 OID 21719434)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2858 (class 2606 OID 21719619)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2859 (class 2606 OID 21719624)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2850 (class 2606 OID 21719579)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2851 (class 2606 OID 21719584)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2848 (class 2606 OID 21719569)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2849 (class 2606 OID 21719574)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2830 (class 2606 OID 21719479)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2814 (class 2606 OID 21719399)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2813 (class 2606 OID 21719394)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2811 (class 2606 OID 21719384)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2812 (class 2606 OID 21719389)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2847 (class 2606 OID 21719564)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2846 (class 2606 OID 21719559)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2790 (class 2606 OID 21719279)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2791 (class 2606 OID 21719284)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 21719299)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 21719614)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2860 (class 2606 OID 21719629)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 21719639)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2871 (class 2606 OID 21719684)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2872 (class 2606 OID 21719689)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2777 (class 2606 OID 21719214)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2776 (class 2606 OID 21719209)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2780 (class 2606 OID 21719229)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2781 (class 2606 OID 21719234)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 21719344)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2806 (class 2606 OID 21719359)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2805 (class 2606 OID 21719354)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2804 (class 2606 OID 21719349)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-12 14:41:57 CEST

--
-- PostgreSQL database dump complete
--

