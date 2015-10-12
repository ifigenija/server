--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-12 15:13:46 CEST

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
-- TOC entry 181 (class 1259 OID 21725605)
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
-- TOC entry 229 (class 1259 OID 21726162)
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
-- TOC entry 228 (class 1259 OID 21726145)
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
-- TOC entry 219 (class 1259 OID 21726022)
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
-- TOC entry 222 (class 1259 OID 21726052)
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
-- TOC entry 243 (class 1259 OID 21726433)
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
-- TOC entry 197 (class 1259 OID 21725813)
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
-- TOC entry 199 (class 1259 OID 21725844)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21726359)
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
-- TOC entry 190 (class 1259 OID 21725726)
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
-- TOC entry 230 (class 1259 OID 21726175)
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
-- TOC entry 215 (class 1259 OID 21725977)
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
-- TOC entry 195 (class 1259 OID 21725792)
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
-- TOC entry 193 (class 1259 OID 21725766)
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
-- TOC entry 191 (class 1259 OID 21725743)
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
-- TOC entry 204 (class 1259 OID 21725891)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21726414)
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
-- TOC entry 242 (class 1259 OID 21726426)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21726448)
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
-- TOC entry 208 (class 1259 OID 21725916)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21725700)
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
-- TOC entry 182 (class 1259 OID 21725614)
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
-- TOC entry 183 (class 1259 OID 21725625)
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
-- TOC entry 178 (class 1259 OID 21725579)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21725598)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21725923)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21725957)
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
-- TOC entry 225 (class 1259 OID 21726093)
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
-- TOC entry 185 (class 1259 OID 21725658)
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
-- TOC entry 187 (class 1259 OID 21725692)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21726304)
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
-- TOC entry 205 (class 1259 OID 21725897)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21725677)
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
-- TOC entry 194 (class 1259 OID 21725781)
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
-- TOC entry 207 (class 1259 OID 21725909)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21726318)
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
-- TOC entry 234 (class 1259 OID 21726328)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21726243)
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
-- TOC entry 235 (class 1259 OID 21726336)
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
-- TOC entry 211 (class 1259 OID 21725938)
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
-- TOC entry 203 (class 1259 OID 21725882)
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
-- TOC entry 202 (class 1259 OID 21725872)
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
-- TOC entry 224 (class 1259 OID 21726082)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21726012)
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
-- TOC entry 192 (class 1259 OID 21725755)
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
-- TOC entry 175 (class 1259 OID 21725550)
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
-- TOC entry 174 (class 1259 OID 21725548)
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
-- TOC entry 212 (class 1259 OID 21725951)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21725588)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21725572)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21725965)
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
-- TOC entry 206 (class 1259 OID 21725903)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21725849)
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
-- TOC entry 173 (class 1259 OID 21725537)
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
-- TOC entry 172 (class 1259 OID 21725529)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21725524)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21726029)
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
-- TOC entry 184 (class 1259 OID 21725650)
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
-- TOC entry 201 (class 1259 OID 21725859)
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
-- TOC entry 223 (class 1259 OID 21726070)
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
-- TOC entry 236 (class 1259 OID 21726347)
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
-- TOC entry 189 (class 1259 OID 21725712)
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
-- TOC entry 176 (class 1259 OID 21725559)
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
-- TOC entry 227 (class 1259 OID 21726120)
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
-- TOC entry 196 (class 1259 OID 21725803)
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
-- TOC entry 210 (class 1259 OID 21725930)
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
-- TOC entry 221 (class 1259 OID 21726043)
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
-- TOC entry 239 (class 1259 OID 21726394)
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
-- TOC entry 238 (class 1259 OID 21726366)
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
-- TOC entry 240 (class 1259 OID 21726406)
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
-- TOC entry 217 (class 1259 OID 21726002)
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
-- TOC entry 198 (class 1259 OID 21725838)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21726110)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21725992)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21725553)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3006 (class 0 OID 21725605)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21726162)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561b-b208-dc1f-ed279532c42a	000d0000-561b-b208-e8e9-b558abea5758	\N	00090000-561b-b208-c226-4b2a9b63eace	000b0000-561b-b208-c811-1b346b8768d4	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561b-b208-026a-5998a872b4cc	000d0000-561b-b208-5318-2b39de6599cb	00100000-561b-b208-15ee-f838eb245c9d	00090000-561b-b208-27b4-220640fbaaa9	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561b-b208-260e-9765a3d2d209	000d0000-561b-b208-3ffd-fe72e1f54b07	00100000-561b-b208-1aed-b7089217dbe6	00090000-561b-b208-5a81-b78691e73c0f	\N	0003	t	\N	2015-10-12	\N	2	t	\N	f	f
000c0000-561b-b208-c302-41914ffff4bd	000d0000-561b-b208-a9cb-1710433362b2	\N	00090000-561b-b208-36d0-5f5001703669	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561b-b208-2665-55159493a71b	000d0000-561b-b208-1ac7-260a8bc6dea2	\N	00090000-561b-b208-676f-eb1cfeb95e9f	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561b-b208-86af-51eefb5ef36e	000d0000-561b-b208-d6ba-9966b2dccf5f	\N	00090000-561b-b208-87e8-4de0f16bcb8a	000b0000-561b-b208-254d-00899912c69a	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561b-b208-9433-3d938ca2f6f2	000d0000-561b-b208-2dab-4e602239dc6a	00100000-561b-b208-7199-b2c474707dcf	00090000-561b-b208-4780-0fa14871ade0	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561b-b208-0be2-61034532069d	000d0000-561b-b208-32b8-06b9894312ac	\N	00090000-561b-b208-2a46-5ad0ce6bb2a0	000b0000-561b-b208-4bf7-e0f9d77d7924	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561b-b208-5219-71ba1b3e803f	000d0000-561b-b208-2dab-4e602239dc6a	00100000-561b-b208-211c-85eec72d4063	00090000-561b-b208-723c-1d762ee96a22	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561b-b208-ecf1-6e4752e11f63	000d0000-561b-b208-2dab-4e602239dc6a	00100000-561b-b208-8727-1678d9c81856	00090000-561b-b208-70b5-87f9dd17faab	\N	0010	t	\N	2015-10-12	\N	16	f	\N	f	t
000c0000-561b-b208-1b2d-e065c1ff4e46	000d0000-561b-b208-2dab-4e602239dc6a	00100000-561b-b208-b399-6f387a42e906	00090000-561b-b208-c04a-c3707da8cd7e	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561b-b208-dc45-0fa1b17b6689	000d0000-561b-b208-e96a-f4be40958379	\N	00090000-561b-b208-27b4-220640fbaaa9	000b0000-561b-b208-8a70-b1d3da61523b	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3053 (class 0 OID 21726145)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3044 (class 0 OID 21726022)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561b-b208-7ea4-9d1c74c34cf3	00160000-561b-b207-4c52-8390445cbb7f	00090000-561b-b208-e106-e821f37a0ffd	aizv	10	t
003d0000-561b-b208-d171-913bac8ac869	00160000-561b-b207-4c52-8390445cbb7f	00090000-561b-b208-2a23-bcc51cfb5260	apri	14	t
003d0000-561b-b208-4ec5-2e97db8b2aa3	00160000-561b-b207-2847-df5481cd5322	00090000-561b-b208-8bfb-fad5e3eea554	aizv	11	t
003d0000-561b-b208-7ed2-04f1292f6388	00160000-561b-b207-42be-f136123b3743	00090000-561b-b208-05b5-92f17f861eb7	aizv	12	t
003d0000-561b-b208-1a8f-12b838b04ea1	00160000-561b-b207-4c52-8390445cbb7f	00090000-561b-b208-024a-1e36b9ec90f5	apri	18	f
\.


--
-- TOC entry 3047 (class 0 OID 21726052)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561b-b207-4c52-8390445cbb7f	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561b-b207-2847-df5481cd5322	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561b-b207-42be-f136123b3743	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3068 (class 0 OID 21726433)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21725813)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561b-b208-d966-6d68d1223f13	\N	\N	00200000-561b-b208-b5b3-82daf3521ecb	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561b-b208-bba4-3ab97c5425ae	\N	\N	00200000-561b-b208-81b7-d03d09802374	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561b-b208-fbb5-aa996688bd4e	\N	\N	00200000-561b-b208-f034-f0d0bfaf3847	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561b-b208-33af-d32703112110	\N	\N	00200000-561b-b208-0779-adfee93e5cd4	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561b-b208-26aa-4e61314ff892	\N	\N	00200000-561b-b208-5b0c-372d939fb61e	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3024 (class 0 OID 21725844)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 21726359)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21725726)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561b-b205-6e07-b4c61317ef4f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561b-b205-8f40-bace2546c009	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561b-b205-18be-c0491b47e3c0	AL	ALB	008	Albania 	Albanija	\N
00040000-561b-b205-ac6e-8f712a49bf77	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561b-b205-28af-cd38519854a5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561b-b205-0e00-b73de383cf79	AD	AND	020	Andorra 	Andora	\N
00040000-561b-b205-1917-a1e911d75e4d	AO	AGO	024	Angola 	Angola	\N
00040000-561b-b205-ff46-cdde2c3d1acc	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561b-b205-4e98-c1e7fee557b5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561b-b205-df80-3ea36aece63f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561b-b205-530b-2dbd6f43fe64	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561b-b205-7628-05c367a1ca57	AM	ARM	051	Armenia 	Armenija	\N
00040000-561b-b205-e4df-52ff9a9c970c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561b-b205-6924-54b6b20cc3e8	AU	AUS	036	Australia 	Avstralija	\N
00040000-561b-b205-9433-e45d529c2cd1	AT	AUT	040	Austria 	Avstrija	\N
00040000-561b-b205-594a-e8fe91f52c80	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561b-b205-f6fc-801b890f6e9d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561b-b205-1a64-e18af555c581	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561b-b205-572e-6eba01b51be9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561b-b205-59e1-12637424e979	BB	BRB	052	Barbados 	Barbados	\N
00040000-561b-b205-c625-18c7cb03e670	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561b-b205-29b1-cddb67904d43	BE	BEL	056	Belgium 	Belgija	\N
00040000-561b-b205-8c3e-646e2aca1e36	BZ	BLZ	084	Belize 	Belize	\N
00040000-561b-b205-32bc-eace576dd0ca	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561b-b205-3f12-1fe314b5193b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561b-b205-1150-01c0c56ecf9b	BT	BTN	064	Bhutan 	Butan	\N
00040000-561b-b205-c6c9-762ba32668d7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561b-b205-1e64-21b98efde2b5	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561b-b205-104a-5c9a560dfabe	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561b-b205-6ad0-908925847ee0	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561b-b205-3ac7-f10310c4f5b0	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561b-b205-856c-fd71135531c3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561b-b205-de2c-246083a1461f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561b-b205-552b-096f2ed18015	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561b-b205-7fea-e54eb36c86c7	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561b-b205-9238-c6569bcf3740	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561b-b205-2f63-18da01b6409c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561b-b205-c837-2b5fd0ac2fb2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561b-b205-d521-121101d5f9e0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561b-b205-3439-1c700834e410	CA	CAN	124	Canada 	Kanada	\N
00040000-561b-b205-1f19-65c91a118786	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561b-b205-ec51-90c16d6eda75	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561b-b205-fe62-601768facb94	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561b-b205-1768-2377f7f0ee43	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561b-b205-9187-96e8308c5213	CL	CHL	152	Chile 	Čile	\N
00040000-561b-b205-8de0-e92318d63dc2	CN	CHN	156	China 	Kitajska	\N
00040000-561b-b205-c0e8-6c01ca857ab6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561b-b205-d52d-34496e26db97	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561b-b205-362e-a64e5f60b5fd	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561b-b205-830b-d32212be5bb4	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561b-b205-800b-21b1dea9d5a2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561b-b205-26b3-a08dc9ac1866	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561b-b205-d950-008230bfebb9	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561b-b205-ea13-38a5b4c16591	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561b-b205-07dc-be688ee8a429	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561b-b205-6f3b-2f199e10f58a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561b-b205-0c1d-0dcd9d1e12d6	CU	CUB	192	Cuba 	Kuba	\N
00040000-561b-b205-156b-2b6c02670723	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561b-b205-ed05-8b33f4941945	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561b-b205-558f-5652da713d44	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561b-b205-e096-1bb9d8e16794	DK	DNK	208	Denmark 	Danska	\N
00040000-561b-b205-6299-8cfb8fa6edb8	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561b-b205-1ad6-83355f3adda5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561b-b205-1943-55d665f10158	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561b-b205-602a-dc0fbc7ed53f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561b-b205-572e-11bfde5cd107	EG	EGY	818	Egypt 	Egipt	\N
00040000-561b-b205-0ba2-782d8d0f6216	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561b-b205-3580-6650a4d89a77	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561b-b205-1014-9f987211c5e6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561b-b205-10a9-f17709de72cd	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561b-b205-3df6-209746bedb67	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561b-b205-3631-f762e9a10df6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561b-b205-1121-6406ec7d707a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561b-b205-3c71-a47499728ed6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561b-b205-581d-9d2030726b06	FI	FIN	246	Finland 	Finska	\N
00040000-561b-b205-c4e0-ff4c4d812259	FR	FRA	250	France 	Francija	\N
00040000-561b-b205-ff02-0856b1868e8d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561b-b205-a9af-162e2ba5e942	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561b-b205-43c6-97018bf90505	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561b-b205-ffaa-7474ce3af61c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561b-b205-d971-00374bcccfda	GA	GAB	266	Gabon 	Gabon	\N
00040000-561b-b205-55cd-fa47e4555a45	GM	GMB	270	Gambia 	Gambija	\N
00040000-561b-b205-d32b-d3e2eaba315d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561b-b205-e2a7-152f8ef2f91d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561b-b205-0e50-8cb77ad3dbab	GH	GHA	288	Ghana 	Gana	\N
00040000-561b-b205-af7e-56686d3b582e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561b-b205-9bbe-24f4f97705e0	GR	GRC	300	Greece 	Grčija	\N
00040000-561b-b205-c002-6cc2f68a4e0a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561b-b205-97ba-f1e89329c0b3	GD	GRD	308	Grenada 	Grenada	\N
00040000-561b-b205-ca33-e49a901bb73b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561b-b205-f075-d373ad242d7e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561b-b205-0573-168284eba149	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561b-b205-3bfe-6bb55db92fc4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561b-b205-597e-3690d515bb52	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561b-b205-74b6-dc8bde248367	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561b-b205-8609-261175b5ec5b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561b-b205-38f4-37f81a7a8329	HT	HTI	332	Haiti 	Haiti	\N
00040000-561b-b205-8027-7c6685778a76	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561b-b205-9153-3fcdee959404	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561b-b205-e9ae-bf77a37d76a7	HN	HND	340	Honduras 	Honduras	\N
00040000-561b-b205-ccde-9bb7e74adca3	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561b-b205-d28f-6688d3aaa2fe	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561b-b205-92fc-6f2f7521cfe6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561b-b205-95c7-381e2e461069	IN	IND	356	India 	Indija	\N
00040000-561b-b205-8e0e-d474ec7cb1dd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561b-b205-49e9-ae11cf106caa	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561b-b205-202b-33d7b0fc3ae2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561b-b205-6353-6ae0ac2a8501	IE	IRL	372	Ireland 	Irska	\N
00040000-561b-b205-7655-8d66df9df46d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561b-b205-39e5-d791495855a2	IL	ISR	376	Israel 	Izrael	\N
00040000-561b-b205-b1c3-7f74a3d2fa38	IT	ITA	380	Italy 	Italija	\N
00040000-561b-b205-cc03-4e3185748c15	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561b-b205-98e1-c737e6d6f964	JP	JPN	392	Japan 	Japonska	\N
00040000-561b-b205-906d-da75f993c18e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561b-b205-eb3d-f220b5bc10b3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561b-b205-e942-f6b98258e5b8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561b-b205-7925-5806fe7f1d6b	KE	KEN	404	Kenya 	Kenija	\N
00040000-561b-b205-5a3f-29ebe8d93ecd	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561b-b205-e4f7-a72530054a31	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561b-b205-c1f9-c8e1b207ccc0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561b-b205-58f3-595420aa07a9	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561b-b205-f523-958e28814c5d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561b-b205-2170-924fdad3dbb2	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561b-b205-28c6-5683123c960f	LV	LVA	428	Latvia 	Latvija	\N
00040000-561b-b205-ecd3-30f4b81949b1	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561b-b205-6a25-4386cf0b6fc6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561b-b205-5ee7-40958372e4ea	LR	LBR	430	Liberia 	Liberija	\N
00040000-561b-b205-d0e1-8745d3f1c728	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561b-b205-b9a9-32fefb5ddcb2	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561b-b205-7972-08704d9af64f	LT	LTU	440	Lithuania 	Litva	\N
00040000-561b-b205-f990-684fa0cb6e7b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561b-b205-d820-edce126386b8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561b-b205-6a69-e0c7a7c356b6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561b-b205-bc18-ec1e107d1d69	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561b-b205-83cf-7bb11c49e7f4	MW	MWI	454	Malawi 	Malavi	\N
00040000-561b-b205-42fe-7605965a9f19	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561b-b205-47a8-18a8ba0dc53e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561b-b205-e8e2-68dceae16b04	ML	MLI	466	Mali 	Mali	\N
00040000-561b-b205-5631-3bfc7ed5abe1	MT	MLT	470	Malta 	Malta	\N
00040000-561b-b205-c739-9db0e74601af	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561b-b205-dd7d-59fa47e0c266	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561b-b205-5eb3-8d303dc67f21	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561b-b205-d3fa-4924d9c4e14a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561b-b205-eb3a-13c3aae4de46	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561b-b205-f48f-25b96ba6cdec	MX	MEX	484	Mexico 	Mehika	\N
00040000-561b-b205-450f-144cc341395f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561b-b205-abc7-fd864f3fb8c9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561b-b205-54b6-599a29e6be35	MC	MCO	492	Monaco 	Monako	\N
00040000-561b-b205-071b-d19470239b11	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561b-b205-1ef7-69314066c5e5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561b-b205-4da3-b83254f610c5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561b-b205-89af-6269f48fa40c	MA	MAR	504	Morocco 	Maroko	\N
00040000-561b-b205-ef7c-d348cb920d7e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561b-b205-5b14-a064d0cdc9d7	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561b-b205-d63c-332874e37922	NA	NAM	516	Namibia 	Namibija	\N
00040000-561b-b205-14d5-de1162bf6c4b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561b-b205-8f4f-cb8ecf75aec6	NP	NPL	524	Nepal 	Nepal	\N
00040000-561b-b205-149d-5db8a4f65df6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561b-b205-ddd6-e9fa3c685778	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561b-b205-39b5-efac693f1f79	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561b-b205-4cfa-d912e322a79e	NE	NER	562	Niger 	Niger 	\N
00040000-561b-b205-c9e2-dc148087b9e5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561b-b205-162e-36f3096af24f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561b-b205-04ef-a8a1178db9a5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561b-b205-c69c-2f0eb2fca465	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561b-b205-a6d4-81330ff68705	NO	NOR	578	Norway 	Norveška	\N
00040000-561b-b205-3acf-5927360b2d20	OM	OMN	512	Oman 	Oman	\N
00040000-561b-b205-5d41-efe23230c0c4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561b-b205-46d7-956ee5a4c57c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561b-b205-c290-a3a35fc08e59	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561b-b205-48ee-6efd8562b502	PA	PAN	591	Panama 	Panama	\N
00040000-561b-b205-8acf-5aaa5848e754	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561b-b205-e1a0-150e3ce9e61a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561b-b205-fba3-e2858d6eb466	PE	PER	604	Peru 	Peru	\N
00040000-561b-b205-1259-688ece8f20f5	PH	PHL	608	Philippines 	Filipini	\N
00040000-561b-b205-c662-6b0fe0b6fa39	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561b-b205-d8a6-b322d2273c36	PL	POL	616	Poland 	Poljska	\N
00040000-561b-b205-d565-68c2408c95bb	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561b-b205-d818-e15cf7f84566	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561b-b205-dd08-e3d3032a3fad	QA	QAT	634	Qatar 	Katar	\N
00040000-561b-b205-9f52-7f7d6db6699f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561b-b205-3f51-ae7591fe96de	RO	ROU	642	Romania 	Romunija	\N
00040000-561b-b205-84b3-e93785ac9e14	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561b-b205-059b-c345a873b5cd	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561b-b205-6568-c540e3260187	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561b-b205-3cb1-7db0e482b917	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561b-b205-a4e7-cb1a99eea8e4	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561b-b205-4784-acfaed27580a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561b-b205-1bc1-1c5274ed748e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561b-b205-504c-4413b5ee1f9b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561b-b205-82a8-5b2672c05f18	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561b-b205-cd4d-88e1569133d9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561b-b205-1c7b-31fab2f83bb6	SM	SMR	674	San Marino 	San Marino	\N
00040000-561b-b205-210c-ac6889bc37e4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561b-b205-c39d-0963fd2d4256	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561b-b205-9358-c8b1d52e4509	SN	SEN	686	Senegal 	Senegal	\N
00040000-561b-b205-12e3-5f686f130524	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561b-b205-701e-411989a03881	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561b-b205-c5eb-d8c50e233b82	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561b-b205-34ae-8535f21cd0c9	SG	SGP	702	Singapore 	Singapur	\N
00040000-561b-b205-3a3d-9a368ff14e59	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561b-b205-27ec-369b9cad7112	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561b-b205-e4bd-bd94e8ef6e1d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561b-b205-532b-62a56c599404	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561b-b205-c2c1-45ba483fd776	SO	SOM	706	Somalia 	Somalija	\N
00040000-561b-b205-e852-2827ea5d8fdb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561b-b205-d9ff-c1a62bc75261	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561b-b205-8b27-fecc61603431	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561b-b205-23b7-d04c002aa68b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561b-b205-0677-72c628b99504	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561b-b205-05b8-5342eb248970	SD	SDN	729	Sudan 	Sudan	\N
00040000-561b-b205-c60f-9201e51309ad	SR	SUR	740	Suriname 	Surinam	\N
00040000-561b-b205-76f9-457bcac4178d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561b-b205-e44e-52253ff5422c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561b-b205-e2ec-c945bf206f0c	SE	SWE	752	Sweden 	Švedska	\N
00040000-561b-b205-efc5-cbc652df7b29	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561b-b205-161e-b058b46ed3ed	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561b-b205-dec5-494c4bdbb4cb	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561b-b205-a7cb-28b9eb777fc5	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561b-b205-ece0-ad4c910a44fb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561b-b205-3d24-b3a759732779	TH	THA	764	Thailand 	Tajska	\N
00040000-561b-b205-41a1-ddac57604f33	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561b-b205-b664-92c2d76252c7	TG	TGO	768	Togo 	Togo	\N
00040000-561b-b205-dbfa-65a942a9e7d5	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561b-b205-80cd-96f3f9a0666d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561b-b205-ab4a-7806b5a4da88	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561b-b205-ad52-da6e3ac22664	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561b-b205-18ae-6bc32d2e1cac	TR	TUR	792	Turkey 	Turčija	\N
00040000-561b-b205-e7c8-b8a4b7e003f5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561b-b205-9f41-8a2d4c6b3f78	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561b-b205-9769-5141f43958ab	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561b-b205-b361-3ee534f4f503	UG	UGA	800	Uganda 	Uganda	\N
00040000-561b-b205-213a-2fbe95cb8f83	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561b-b205-25fa-73e742e88a7a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561b-b205-a0b0-c8cf42aae792	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561b-b205-67fa-85e0a2456bcc	US	USA	840	United States 	Združene države Amerike	\N
00040000-561b-b205-5438-171952949b5c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561b-b205-2c76-94eb48d60673	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561b-b205-256b-2384ad04952b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561b-b205-fde6-6fa440c091b6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561b-b205-1de7-b58504291171	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561b-b205-834f-2f25160d9c47	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561b-b205-61fc-88486a03084c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561b-b205-1de9-c7bf29bbba5c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561b-b205-7539-66acb4322ca7	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561b-b205-ec5e-fb199b50217e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561b-b205-e50b-c1a78c364441	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561b-b205-c868-6ec9dcdaef9b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561b-b205-0fc6-700bc5c48092	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3055 (class 0 OID 21726175)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561b-b208-7f2d-8ecf50553007	000e0000-561b-b208-5d56-4305de737fd6	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-b205-9071-c591ff110e0c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561b-b208-ddd6-70d1d02c0b1b	000e0000-561b-b208-8ec2-f814b01be724	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-b205-c7ec-616a96aba7f3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561b-b208-11fb-2db482eaedd0	000e0000-561b-b208-c917-256dadf81a96	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-b205-9071-c591ff110e0c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561b-b208-7adf-144c2f9aa3c4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561b-b208-cc67-60d9a66f47e7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 21725977)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561b-b208-e8e9-b558abea5758	000e0000-561b-b208-8ec2-f814b01be724	000c0000-561b-b208-dc1f-ed279532c42a	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561b-b205-8cc2-50187deb005f
000d0000-561b-b208-5318-2b39de6599cb	000e0000-561b-b208-8ec2-f814b01be724	000c0000-561b-b208-026a-5998a872b4cc	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561b-b205-d961-7a305a38f13a
000d0000-561b-b208-3ffd-fe72e1f54b07	000e0000-561b-b208-8ec2-f814b01be724	000c0000-561b-b208-260e-9765a3d2d209	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561b-b205-4542-a1a8ab57dea1
000d0000-561b-b208-a9cb-1710433362b2	000e0000-561b-b208-8ec2-f814b01be724	000c0000-561b-b208-c302-41914ffff4bd	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561b-b205-a2ea-3e301871073e
000d0000-561b-b208-1ac7-260a8bc6dea2	000e0000-561b-b208-8ec2-f814b01be724	000c0000-561b-b208-2665-55159493a71b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561b-b205-a2ea-3e301871073e
000d0000-561b-b208-d6ba-9966b2dccf5f	000e0000-561b-b208-8ec2-f814b01be724	000c0000-561b-b208-86af-51eefb5ef36e	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561b-b205-8cc2-50187deb005f
000d0000-561b-b208-2dab-4e602239dc6a	000e0000-561b-b208-8ec2-f814b01be724	000c0000-561b-b208-5219-71ba1b3e803f	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561b-b205-8cc2-50187deb005f
000d0000-561b-b208-32b8-06b9894312ac	000e0000-561b-b208-8ec2-f814b01be724	000c0000-561b-b208-0be2-61034532069d	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561b-b205-17ba-f46c198dd4b0
000d0000-561b-b208-e96a-f4be40958379	000e0000-561b-b208-8ec2-f814b01be724	000c0000-561b-b208-dc45-0fa1b17b6689	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561b-b205-d5a7-ce7d5da02b5b
\.


--
-- TOC entry 3020 (class 0 OID 21725792)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21725766)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 21725743)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561b-b208-6abe-4267e1c8756c	00080000-561b-b207-67e7-3998f32c2fc8	00090000-561b-b208-70b5-87f9dd17faab	AK		igralka
\.


--
-- TOC entry 3029 (class 0 OID 21725891)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 21726414)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 21726426)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 21726448)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 21093458)
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
-- TOC entry 3033 (class 0 OID 21725916)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21725700)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561b-b206-e261-021d18c2bfa0	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561b-b206-75c7-333151001db7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561b-b206-7bd1-c532ca1c37bc	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561b-b206-2dbe-d3959f1ade9d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561b-b206-4c4c-9ab109564519	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561b-b206-db12-9a3b9645eb4e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561b-b206-5a39-22d9d3a29911	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561b-b206-2899-56e7b7e4a413	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561b-b206-3694-51556d2bf25c	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561b-b206-a766-ddd286ee73ac	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561b-b206-aecd-2f6e45a70e77	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561b-b206-420a-9f764439ce4b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561b-b206-0551-9480728913c1	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561b-b206-3b05-ff0703795c12	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561b-b206-daaf-395f5d90ebd1	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561b-b207-6eda-13e485e78b15	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561b-b207-f0ce-c487104eae4d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561b-b207-d87b-afd94f56136c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561b-b207-535b-cf7fadd2b609	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561b-b207-5437-de4d6cbe6475	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561b-b209-0d65-c2c444aedf89	application.tenant.maticnopodjetje	string	s:36:"00080000-561b-b209-eb32-3c980282290e";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3007 (class 0 OID 21725614)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561b-b207-d4cd-fa55ca66675f	00000000-561b-b207-6eda-13e485e78b15	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561b-b207-0f3e-f2baa30de261	00000000-561b-b207-6eda-13e485e78b15	00010000-561b-b205-6451-e55ede4e37ab	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561b-b207-3165-437b4fad1bcd	00000000-561b-b207-f0ce-c487104eae4d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3008 (class 0 OID 21725625)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561b-b208-c226-4b2a9b63eace	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561b-b208-36d0-5f5001703669	00010000-561b-b207-f5d6-d0b0786112c7	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561b-b208-5a81-b78691e73c0f	00010000-561b-b207-33e8-754c04d9175a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561b-b208-723c-1d762ee96a22	00010000-561b-b207-9838-7ebbb619f545	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561b-b208-e72d-bad024fef426	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561b-b208-87e8-4de0f16bcb8a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561b-b208-c04a-c3707da8cd7e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561b-b208-4780-0fa14871ade0	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561b-b208-70b5-87f9dd17faab	00010000-561b-b207-19c2-67ba96d73e25	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561b-b208-27b4-220640fbaaa9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561b-b208-94a0-52c99d6463fa	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561b-b208-676f-eb1cfeb95e9f	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561b-b208-2a46-5ad0ce6bb2a0	00010000-561b-b207-87d5-c6e85062f6c4	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561b-b208-e106-e821f37a0ffd	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-b208-2a23-bcc51cfb5260	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-b208-8bfb-fad5e3eea554	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-b208-05b5-92f17f861eb7	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561b-b208-024a-1e36b9ec90f5	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3003 (class 0 OID 21725579)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561b-b205-0e9b-49d97de6a7cd	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561b-b205-d86c-7f3c8dbafa6a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561b-b205-c41a-fd6a8d42caee	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561b-b205-61dd-84da1904b93e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561b-b205-5257-377eed0c09f1	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561b-b205-8d82-71778a5a7197	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561b-b205-3468-27039fbe43f0	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561b-b205-45aa-e245541d7ed3	Abonma-read	Abonma - branje	f
00030000-561b-b205-1a3e-103ea30dd6ee	Abonma-write	Abonma - spreminjanje	f
00030000-561b-b205-a5ca-461597dd46bf	Alternacija-read	Alternacija - branje	f
00030000-561b-b205-d14c-c8a33180f7e2	Alternacija-write	Alternacija - spreminjanje	f
00030000-561b-b205-0c28-825734111235	Arhivalija-read	Arhivalija - branje	f
00030000-561b-b205-0009-0287968b23b3	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561b-b205-08d9-998e5114bff8	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561b-b205-67aa-b9f6e9dc9250	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561b-b205-ab33-b56217e2ce67	Besedilo-read	Besedilo - branje	f
00030000-561b-b205-a995-b4b4f0b39f56	Besedilo-write	Besedilo - spreminjanje	f
00030000-561b-b205-783d-c2a458fec0b0	DogodekIzven-read	DogodekIzven - branje	f
00030000-561b-b205-f591-4c6f6f2e96a1	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561b-b205-927b-15f3940350ec	Dogodek-read	Dogodek - branje	f
00030000-561b-b205-50ab-8197fcc070e9	Dogodek-write	Dogodek - spreminjanje	f
00030000-561b-b205-e077-acc88156d081	DrugiVir-read	DrugiVir - branje	f
00030000-561b-b205-e819-5d95e6eb5a45	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561b-b205-26dc-43f1341baacd	Drzava-read	Drzava - branje	f
00030000-561b-b205-4b09-5785eac387a8	Drzava-write	Drzava - spreminjanje	f
00030000-561b-b205-6eee-8dae3eeee063	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561b-b205-0510-314107aa35be	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561b-b205-f6c6-618df1fa4932	Funkcija-read	Funkcija - branje	f
00030000-561b-b205-8c5a-64f414619cc7	Funkcija-write	Funkcija - spreminjanje	f
00030000-561b-b205-2099-03bd98bf2196	Gostovanje-read	Gostovanje - branje	f
00030000-561b-b205-b9d6-3e9563bf04e9	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561b-b205-d5c7-cb89b9fb3116	Gostujoca-read	Gostujoca - branje	f
00030000-561b-b205-450b-fe66f72d7328	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561b-b205-e9b1-eb6bbaa50876	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561b-b205-ac41-8df936d7a1c8	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561b-b205-b77c-66658489a5e0	Kupec-read	Kupec - branje	f
00030000-561b-b205-fd53-c9df87074dda	Kupec-write	Kupec - spreminjanje	f
00030000-561b-b205-3d5d-79a0f8241926	NacinPlacina-read	NacinPlacina - branje	f
00030000-561b-b205-491b-73c306e55c72	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561b-b205-301c-7afc8f51ea2a	Option-read	Option - branje	f
00030000-561b-b205-4dab-9fbdb7a95c1b	Option-write	Option - spreminjanje	f
00030000-561b-b205-3bb9-55d3baac1310	OptionValue-read	OptionValue - branje	f
00030000-561b-b205-e825-8b76b566a9d4	OptionValue-write	OptionValue - spreminjanje	f
00030000-561b-b205-4a96-03c346760027	Oseba-read	Oseba - branje	f
00030000-561b-b205-6aa1-972905da26d8	Oseba-write	Oseba - spreminjanje	f
00030000-561b-b205-3c8d-1d68522db184	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561b-b205-e6f7-02e186c7ee71	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561b-b205-4ea3-512fbca376c0	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561b-b205-c000-73f41c6f8ed6	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561b-b205-611a-18c81b325e88	Pogodba-read	Pogodba - branje	f
00030000-561b-b205-4521-1339163aeb40	Pogodba-write	Pogodba - spreminjanje	f
00030000-561b-b205-c4b7-0d98b637ca94	Popa-read	Popa - branje	f
00030000-561b-b205-0e1d-2ca3e634e1ef	Popa-write	Popa - spreminjanje	f
00030000-561b-b205-5879-e9300b8e0f2c	Posta-read	Posta - branje	f
00030000-561b-b205-80f7-3036e26f0837	Posta-write	Posta - spreminjanje	f
00030000-561b-b205-bb37-3df623e74370	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561b-b205-4413-b5734f45accd	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561b-b205-b1ba-4050f0b73871	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561b-b205-124a-7d74523814af	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561b-b205-b5e3-a64b51a9faba	PostniNaslov-read	PostniNaslov - branje	f
00030000-561b-b205-2565-a907d8bebb79	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561b-b205-3a14-7f69951a3ad4	Predstava-read	Predstava - branje	f
00030000-561b-b205-7e39-50ce89533777	Predstava-write	Predstava - spreminjanje	f
00030000-561b-b205-d7b7-d05955cee6be	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561b-b205-44e5-aefc1e865262	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561b-b205-fdbd-73c7cca8bbd4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561b-b205-18e7-5a4eef3fafef	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561b-b205-1097-865f9c3133b6	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561b-b205-a463-f441c66df73d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561b-b205-bb43-019bdbeb087a	ProgramDela-read	ProgramDela - branje	f
00030000-561b-b205-2ff1-3d278d3c63bc	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561b-b205-4f17-773bc8eff80d	ProgramFestival-read	ProgramFestival - branje	f
00030000-561b-b205-f995-2688ba0c33df	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561b-b205-d9e7-7e85731def75	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561b-b205-0323-3d18e40549af	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561b-b205-83bf-9db1a5a29a8d	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561b-b205-335f-ef43d831e4da	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561b-b205-ab62-cf49f7083e3c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561b-b205-c5b1-51669800ef62	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561b-b205-691c-5d81811a9d59	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561b-b205-3721-911e13fd65f7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561b-b205-eee0-8bb4d4eeaf6c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561b-b205-3c21-7c011c4206f9	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561b-b205-87a4-a59ebf46c6f9	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561b-b205-3786-bb79d0767baa	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561b-b205-b1ed-c37c56b4761e	ProgramRazno-read	ProgramRazno - branje	f
00030000-561b-b205-4699-8a34a50b7629	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561b-b205-5d89-49088af5a0ae	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561b-b205-3993-8acaf906624c	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561b-b205-c72e-27821f08c71d	Prostor-read	Prostor - branje	f
00030000-561b-b205-68d8-2c8f1173c1ae	Prostor-write	Prostor - spreminjanje	f
00030000-561b-b205-bfac-424c99d86d63	Racun-read	Racun - branje	f
00030000-561b-b205-427e-1a643558beee	Racun-write	Racun - spreminjanje	f
00030000-561b-b205-100a-5f15d218de96	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561b-b205-c847-6fa98efa774f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561b-b205-859d-992b6b942fd5	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561b-b205-ef08-76e52059ffd7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561b-b205-bb05-ccc48db3d4c7	Rekvizit-read	Rekvizit - branje	f
00030000-561b-b205-7d4a-5e502aa5bc41	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561b-b205-c024-816fb11f0f8e	Revizija-read	Revizija - branje	f
00030000-561b-b205-76a3-5aa46a0da4ed	Revizija-write	Revizija - spreminjanje	f
00030000-561b-b205-1921-9f718b75e807	Rezervacija-read	Rezervacija - branje	f
00030000-561b-b205-afc8-8260669b83ac	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561b-b205-7444-4847e00ceccc	SedezniRed-read	SedezniRed - branje	f
00030000-561b-b205-2d01-d826b345f1b7	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561b-b205-f30f-a8568e0ddcf7	Sedez-read	Sedez - branje	f
00030000-561b-b205-bb5e-6a691759fd69	Sedez-write	Sedez - spreminjanje	f
00030000-561b-b205-c425-f8947d3686ea	Sezona-read	Sezona - branje	f
00030000-561b-b205-1704-bfc7569f1261	Sezona-write	Sezona - spreminjanje	f
00030000-561b-b205-fedd-acf25140b414	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561b-b205-2c57-c2f8da111e06	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561b-b205-c536-3f824e5f21f6	Stevilcenje-read	Stevilcenje - branje	f
00030000-561b-b205-5264-d099b96e542d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561b-b205-0cce-07716463a4e4	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561b-b205-7694-e972e538ad4a	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561b-b205-d678-049ae4d3b170	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561b-b205-d5af-797609dcd9af	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561b-b205-661f-605543d040bb	Telefonska-read	Telefonska - branje	f
00030000-561b-b205-d10a-b104b08575df	Telefonska-write	Telefonska - spreminjanje	f
00030000-561b-b205-3d8b-2f06d165bf68	TerminStoritve-read	TerminStoritve - branje	f
00030000-561b-b205-11b1-080e783e4c46	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561b-b205-a4a2-e976a0a881a8	TipFunkcije-read	TipFunkcije - branje	f
00030000-561b-b205-b4a4-518e33ed7ed1	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561b-b205-1239-aa775e671949	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561b-b205-cdce-e69a95f8abc4	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561b-b205-a476-d0095d2377f0	Trr-read	Trr - branje	f
00030000-561b-b205-2eb8-e0cb5281cd71	Trr-write	Trr - spreminjanje	f
00030000-561b-b205-2073-66db4a63e543	Uprizoritev-read	Uprizoritev - branje	f
00030000-561b-b205-25ad-8bc172e25a20	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561b-b205-da40-f22b64585401	Vaja-read	Vaja - branje	f
00030000-561b-b205-2c83-84eb26ea7453	Vaja-write	Vaja - spreminjanje	f
00030000-561b-b205-7e91-5f696dece68a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561b-b205-7366-2bb641640a35	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561b-b205-f63f-ee22f91ef75e	VrstaStroska-read	VrstaStroska - branje	f
00030000-561b-b205-a5c0-b40fefa1ff78	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561b-b205-e6f6-91d003403f2b	Zaposlitev-read	Zaposlitev - branje	f
00030000-561b-b205-be29-bb46559f4c30	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561b-b205-2365-bb2c023da647	Zasedenost-read	Zasedenost - branje	f
00030000-561b-b205-4063-97d05c01fc10	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561b-b205-c4f5-c840174e7536	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561b-b205-07ba-1bb45f0ddb4b	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561b-b205-e6a9-feb2b19d1258	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561b-b205-b85b-de11130f217d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561b-b205-f12b-a253cf06b119	Job-read	Branje opravil - samo zase - branje	f
00030000-561b-b205-1d9c-a94043a9b536	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561b-b205-fa71-661139dac696	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561b-b205-daee-3a2bb7e15882	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561b-b205-babd-5b31b6a18551	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561b-b205-3955-3cde45a19295	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561b-b205-3c31-a80399661e1a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561b-b205-c842-d87652c38af1	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561b-b205-687a-2cf42195d73b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561b-b205-9459-ccd846deb62a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561b-b205-4098-faa64fc00f7f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561b-b205-bfed-5b790115f969	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561b-b205-7364-df28ad599d78	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561b-b205-d1cb-32cd7b0e5669	Datoteka-write	Datoteka - spreminjanje	f
00030000-561b-b205-b6dc-9ad15e161f8d	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3005 (class 0 OID 21725598)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561b-b205-40c4-f777f5829c2d	00030000-561b-b205-d86c-7f3c8dbafa6a
00020000-561b-b205-c62b-4ea4333629d4	00030000-561b-b205-26dc-43f1341baacd
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-45aa-e245541d7ed3
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-1a3e-103ea30dd6ee
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-a5ca-461597dd46bf
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-d14c-c8a33180f7e2
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-0c28-825734111235
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-927b-15f3940350ec
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-61dd-84da1904b93e
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-50ab-8197fcc070e9
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-26dc-43f1341baacd
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-4b09-5785eac387a8
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-f6c6-618df1fa4932
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-8c5a-64f414619cc7
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-2099-03bd98bf2196
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-b9d6-3e9563bf04e9
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-d5c7-cb89b9fb3116
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-450b-fe66f72d7328
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-e9b1-eb6bbaa50876
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-ac41-8df936d7a1c8
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-301c-7afc8f51ea2a
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-3bb9-55d3baac1310
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-4a96-03c346760027
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-6aa1-972905da26d8
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-c4b7-0d98b637ca94
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-0e1d-2ca3e634e1ef
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-5879-e9300b8e0f2c
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-80f7-3036e26f0837
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-b5e3-a64b51a9faba
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-2565-a907d8bebb79
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-3a14-7f69951a3ad4
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-7e39-50ce89533777
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-1097-865f9c3133b6
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-a463-f441c66df73d
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-c72e-27821f08c71d
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-68d8-2c8f1173c1ae
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-859d-992b6b942fd5
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-ef08-76e52059ffd7
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-bb05-ccc48db3d4c7
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-7d4a-5e502aa5bc41
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-c425-f8947d3686ea
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-1704-bfc7569f1261
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-a4a2-e976a0a881a8
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-2073-66db4a63e543
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-25ad-8bc172e25a20
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-da40-f22b64585401
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-2c83-84eb26ea7453
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-2365-bb2c023da647
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-4063-97d05c01fc10
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-c4f5-c840174e7536
00020000-561b-b205-cb74-aff94875fca2	00030000-561b-b205-e6a9-feb2b19d1258
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-45aa-e245541d7ed3
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-0c28-825734111235
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-927b-15f3940350ec
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-26dc-43f1341baacd
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-2099-03bd98bf2196
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-d5c7-cb89b9fb3116
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-e9b1-eb6bbaa50876
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-ac41-8df936d7a1c8
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-301c-7afc8f51ea2a
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-3bb9-55d3baac1310
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-4a96-03c346760027
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-6aa1-972905da26d8
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-c4b7-0d98b637ca94
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-5879-e9300b8e0f2c
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-b5e3-a64b51a9faba
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-2565-a907d8bebb79
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-3a14-7f69951a3ad4
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-c72e-27821f08c71d
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-859d-992b6b942fd5
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-bb05-ccc48db3d4c7
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-c425-f8947d3686ea
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-661f-605543d040bb
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-d10a-b104b08575df
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-a476-d0095d2377f0
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-2eb8-e0cb5281cd71
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-e6f6-91d003403f2b
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-be29-bb46559f4c30
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-c4f5-c840174e7536
00020000-561b-b205-99b4-bedf11358e14	00030000-561b-b205-e6a9-feb2b19d1258
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-45aa-e245541d7ed3
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-a5ca-461597dd46bf
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-0c28-825734111235
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-0009-0287968b23b3
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-ab33-b56217e2ce67
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-783d-c2a458fec0b0
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-927b-15f3940350ec
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-26dc-43f1341baacd
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-f6c6-618df1fa4932
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-2099-03bd98bf2196
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-d5c7-cb89b9fb3116
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-e9b1-eb6bbaa50876
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-301c-7afc8f51ea2a
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-3bb9-55d3baac1310
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-4a96-03c346760027
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-c4b7-0d98b637ca94
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-5879-e9300b8e0f2c
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-3a14-7f69951a3ad4
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-1097-865f9c3133b6
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-c72e-27821f08c71d
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-859d-992b6b942fd5
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-bb05-ccc48db3d4c7
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-c425-f8947d3686ea
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-a4a2-e976a0a881a8
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-da40-f22b64585401
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-2365-bb2c023da647
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-c4f5-c840174e7536
00020000-561b-b205-648e-ff7f03df06b0	00030000-561b-b205-e6a9-feb2b19d1258
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-45aa-e245541d7ed3
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-1a3e-103ea30dd6ee
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-d14c-c8a33180f7e2
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-0c28-825734111235
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-927b-15f3940350ec
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-26dc-43f1341baacd
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-2099-03bd98bf2196
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-d5c7-cb89b9fb3116
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-301c-7afc8f51ea2a
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-3bb9-55d3baac1310
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-c4b7-0d98b637ca94
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-5879-e9300b8e0f2c
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-3a14-7f69951a3ad4
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-c72e-27821f08c71d
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-859d-992b6b942fd5
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-bb05-ccc48db3d4c7
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-c425-f8947d3686ea
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-a4a2-e976a0a881a8
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-c4f5-c840174e7536
00020000-561b-b205-f791-8f550a8fc34d	00030000-561b-b205-e6a9-feb2b19d1258
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-45aa-e245541d7ed3
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-0c28-825734111235
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-927b-15f3940350ec
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-26dc-43f1341baacd
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-2099-03bd98bf2196
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-d5c7-cb89b9fb3116
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-301c-7afc8f51ea2a
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-3bb9-55d3baac1310
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-c4b7-0d98b637ca94
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-5879-e9300b8e0f2c
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-3a14-7f69951a3ad4
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-c72e-27821f08c71d
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-859d-992b6b942fd5
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-bb05-ccc48db3d4c7
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-c425-f8947d3686ea
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-3d8b-2f06d165bf68
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-c41a-fd6a8d42caee
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-a4a2-e976a0a881a8
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-c4f5-c840174e7536
00020000-561b-b205-87ca-da9c82310aef	00030000-561b-b205-e6a9-feb2b19d1258
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-0e9b-49d97de6a7cd
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-d86c-7f3c8dbafa6a
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-c41a-fd6a8d42caee
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-61dd-84da1904b93e
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-5257-377eed0c09f1
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-8d82-71778a5a7197
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-3468-27039fbe43f0
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-45aa-e245541d7ed3
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-1a3e-103ea30dd6ee
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-a5ca-461597dd46bf
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-d14c-c8a33180f7e2
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-0c28-825734111235
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-0009-0287968b23b3
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-ab33-b56217e2ce67
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-a995-b4b4f0b39f56
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-783d-c2a458fec0b0
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-f591-4c6f6f2e96a1
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-927b-15f3940350ec
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-50ab-8197fcc070e9
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-26dc-43f1341baacd
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-4b09-5785eac387a8
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-e077-acc88156d081
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-e819-5d95e6eb5a45
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-6eee-8dae3eeee063
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-0510-314107aa35be
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-f6c6-618df1fa4932
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-8c5a-64f414619cc7
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-2099-03bd98bf2196
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-b9d6-3e9563bf04e9
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-d5c7-cb89b9fb3116
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-450b-fe66f72d7328
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-e9b1-eb6bbaa50876
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-ac41-8df936d7a1c8
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-b77c-66658489a5e0
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-fd53-c9df87074dda
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-3d5d-79a0f8241926
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-491b-73c306e55c72
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-301c-7afc8f51ea2a
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-4dab-9fbdb7a95c1b
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-3bb9-55d3baac1310
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-e825-8b76b566a9d4
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-4a96-03c346760027
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-6aa1-972905da26d8
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-3c8d-1d68522db184
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-e6f7-02e186c7ee71
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-4ea3-512fbca376c0
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-c000-73f41c6f8ed6
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-611a-18c81b325e88
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-4521-1339163aeb40
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-c4b7-0d98b637ca94
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-0e1d-2ca3e634e1ef
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-5879-e9300b8e0f2c
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-80f7-3036e26f0837
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-bb37-3df623e74370
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-4413-b5734f45accd
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-b1ba-4050f0b73871
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-124a-7d74523814af
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-b5e3-a64b51a9faba
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-2565-a907d8bebb79
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-3a14-7f69951a3ad4
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-7e39-50ce89533777
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-d7b7-d05955cee6be
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-44e5-aefc1e865262
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-fdbd-73c7cca8bbd4
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-18e7-5a4eef3fafef
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-1097-865f9c3133b6
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-a463-f441c66df73d
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-bb43-019bdbeb087a
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-2ff1-3d278d3c63bc
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-4f17-773bc8eff80d
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-f995-2688ba0c33df
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-d9e7-7e85731def75
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-0323-3d18e40549af
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-83bf-9db1a5a29a8d
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-335f-ef43d831e4da
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-ab62-cf49f7083e3c
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-c5b1-51669800ef62
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-691c-5d81811a9d59
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-3721-911e13fd65f7
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-eee0-8bb4d4eeaf6c
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-3c21-7c011c4206f9
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-87a4-a59ebf46c6f9
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-3786-bb79d0767baa
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-b1ed-c37c56b4761e
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-4699-8a34a50b7629
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-5d89-49088af5a0ae
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-3993-8acaf906624c
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-c72e-27821f08c71d
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-68d8-2c8f1173c1ae
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-bfac-424c99d86d63
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-427e-1a643558beee
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-100a-5f15d218de96
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-c847-6fa98efa774f
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-859d-992b6b942fd5
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-ef08-76e52059ffd7
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-bb05-ccc48db3d4c7
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-7d4a-5e502aa5bc41
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-c024-816fb11f0f8e
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-76a3-5aa46a0da4ed
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-1921-9f718b75e807
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-afc8-8260669b83ac
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-7444-4847e00ceccc
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-2d01-d826b345f1b7
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-f30f-a8568e0ddcf7
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-bb5e-6a691759fd69
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-c425-f8947d3686ea
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-1704-bfc7569f1261
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-fedd-acf25140b414
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-2c57-c2f8da111e06
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-c536-3f824e5f21f6
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-5264-d099b96e542d
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-0cce-07716463a4e4
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-7694-e972e538ad4a
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-d678-049ae4d3b170
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-d5af-797609dcd9af
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-661f-605543d040bb
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-d10a-b104b08575df
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-3d8b-2f06d165bf68
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-11b1-080e783e4c46
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-a4a2-e976a0a881a8
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-b4a4-518e33ed7ed1
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-1239-aa775e671949
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-cdce-e69a95f8abc4
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-a476-d0095d2377f0
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-2eb8-e0cb5281cd71
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-2073-66db4a63e543
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-25ad-8bc172e25a20
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-da40-f22b64585401
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-2c83-84eb26ea7453
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-7e91-5f696dece68a
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-7366-2bb641640a35
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-f63f-ee22f91ef75e
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-a5c0-b40fefa1ff78
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-e6f6-91d003403f2b
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-be29-bb46559f4c30
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-2365-bb2c023da647
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-4063-97d05c01fc10
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-c4f5-c840174e7536
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-07ba-1bb45f0ddb4b
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-e6a9-feb2b19d1258
00020000-561b-b207-1ca1-ad5534e4d7d8	00030000-561b-b205-b85b-de11130f217d
\.


--
-- TOC entry 3034 (class 0 OID 21725923)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21725957)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 21726093)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561b-b208-c811-1b346b8768d4	00090000-561b-b208-c226-4b2a9b63eace	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561b-b208-254d-00899912c69a	00090000-561b-b208-87e8-4de0f16bcb8a	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561b-b208-4bf7-e0f9d77d7924	00090000-561b-b208-2a46-5ad0ce6bb2a0	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561b-b208-8a70-b1d3da61523b	00090000-561b-b208-27b4-220640fbaaa9	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3010 (class 0 OID 21725658)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561b-b207-67e7-3998f32c2fc8	00040000-561b-b205-e4bd-bd94e8ef6e1d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-b207-9869-b5a808de427a	00040000-561b-b205-e4bd-bd94e8ef6e1d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561b-b207-ab3d-1453c63efc54	00040000-561b-b205-e4bd-bd94e8ef6e1d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-b207-100a-6509b1ed1620	00040000-561b-b205-e4bd-bd94e8ef6e1d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-b207-3e78-e817d5860925	00040000-561b-b205-e4bd-bd94e8ef6e1d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-b207-431d-8ef69d859bcd	00040000-561b-b205-530b-2dbd6f43fe64	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-b207-5514-af59881253f2	00040000-561b-b205-6f3b-2f199e10f58a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-b207-419d-0eb7fcfba1a7	00040000-561b-b205-9433-e45d529c2cd1	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-b207-a623-ae2912c8f5a7	00040000-561b-b205-e2a7-152f8ef2f91d	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-b209-eb32-3c980282290e	00040000-561b-b205-e4bd-bd94e8ef6e1d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3012 (class 0 OID 21725692)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561b-b204-4651-8009a49b051e	8341	Adlešiči
00050000-561b-b204-83fa-6567121381c5	5270	Ajdovščina
00050000-561b-b204-d37f-7b4e1f9a8aed	6280	Ankaran/Ancarano
00050000-561b-b204-786f-ea6054121901	9253	Apače
00050000-561b-b204-1949-062aea3639d4	8253	Artiče
00050000-561b-b204-7e81-b39fb9c73afc	4275	Begunje na Gorenjskem
00050000-561b-b204-c4cf-1b0c0714ccf9	1382	Begunje pri Cerknici
00050000-561b-b204-bc7a-56cbd02d65b7	9231	Beltinci
00050000-561b-b204-0698-1753793bbd69	2234	Benedikt
00050000-561b-b204-4b42-145bad6a3597	2345	Bistrica ob Dravi
00050000-561b-b204-1f4e-89acc39155c5	3256	Bistrica ob Sotli
00050000-561b-b204-b296-322893c74cce	8259	Bizeljsko
00050000-561b-b204-588c-9e904fd05db8	1223	Blagovica
00050000-561b-b204-8159-37d12e92ca03	8283	Blanca
00050000-561b-b204-c0c0-a9daac9cb1a1	4260	Bled
00050000-561b-b204-3c73-30919bc0f090	4273	Blejska Dobrava
00050000-561b-b204-a15e-4fd986282f0d	9265	Bodonci
00050000-561b-b204-1bd3-95b506e7d4bc	9222	Bogojina
00050000-561b-b204-0a00-05c61ef5593d	4263	Bohinjska Bela
00050000-561b-b204-17f7-ccb9b9aef310	4264	Bohinjska Bistrica
00050000-561b-b204-9fc4-b87b54ba9ff8	4265	Bohinjsko jezero
00050000-561b-b204-eafb-b9c0901156f8	1353	Borovnica
00050000-561b-b204-a8e0-1cdc8a82bad6	8294	Boštanj
00050000-561b-b204-40cc-bb73dc16bfdd	5230	Bovec
00050000-561b-b204-7b74-6459b4c9ad7f	5295	Branik
00050000-561b-b204-4b39-0108235a7374	3314	Braslovče
00050000-561b-b204-ca0b-d9cf34bf449c	5223	Breginj
00050000-561b-b204-5c46-3b430990df7e	8280	Brestanica
00050000-561b-b204-27ba-3e99324b2247	2354	Bresternica
00050000-561b-b204-e658-31365dae5675	4243	Brezje
00050000-561b-b204-1390-8a421a974075	1351	Brezovica pri Ljubljani
00050000-561b-b204-ca3e-47dd87317b8f	8250	Brežice
00050000-561b-b204-53f4-288082026b19	4210	Brnik - Aerodrom
00050000-561b-b204-df2e-346775ec74b5	8321	Brusnice
00050000-561b-b204-bc54-cda5ea4d7edc	3255	Buče
00050000-561b-b204-e1fc-ed3fceb3d94a	8276	Bučka 
00050000-561b-b204-d3bb-c7824b16feed	9261	Cankova
00050000-561b-b204-b44d-124b95997764	3000	Celje 
00050000-561b-b204-b9d8-304d3cdf1818	3001	Celje - poštni predali
00050000-561b-b204-5f13-04a2bfc5c0cd	4207	Cerklje na Gorenjskem
00050000-561b-b204-c0d7-9846745c3f6d	8263	Cerklje ob Krki
00050000-561b-b204-7038-7d7390ef2ea2	1380	Cerknica
00050000-561b-b204-9362-68f1535a0a0a	5282	Cerkno
00050000-561b-b204-9591-18f7085de35a	2236	Cerkvenjak
00050000-561b-b204-b144-84481dca4ff7	2215	Ceršak
00050000-561b-b204-9d03-8648fe700043	2326	Cirkovce
00050000-561b-b204-a832-6b7acec7c20b	2282	Cirkulane
00050000-561b-b204-765a-5657d85b2e12	5273	Col
00050000-561b-b204-c429-4c7812fd47f5	8251	Čatež ob Savi
00050000-561b-b204-9b20-b5d9a59965cc	1413	Čemšenik
00050000-561b-b204-b7c9-0a2f20ac441c	5253	Čepovan
00050000-561b-b204-191b-75b02efe70a1	9232	Črenšovci
00050000-561b-b204-c3fc-89395b187af8	2393	Črna na Koroškem
00050000-561b-b204-4a95-e4e7d81148d8	6275	Črni Kal
00050000-561b-b204-73e6-4b0ad7df512c	5274	Črni Vrh nad Idrijo
00050000-561b-b204-dd8e-962221d192f3	5262	Črniče
00050000-561b-b204-a33a-fd0dec1c05a1	8340	Črnomelj
00050000-561b-b204-0f40-34e51bf93539	6271	Dekani
00050000-561b-b204-4c96-e9b40ee61783	5210	Deskle
00050000-561b-b204-4d70-3ed9942dd224	2253	Destrnik
00050000-561b-b204-f82b-5b84bc21dda7	6215	Divača
00050000-561b-b204-a219-cf1f442a4909	1233	Dob
00050000-561b-b204-09e0-a19bd34a5757	3224	Dobje pri Planini
00050000-561b-b204-99c9-2be7f340f2c6	8257	Dobova
00050000-561b-b204-b2c5-f2fd722be8f6	1423	Dobovec
00050000-561b-b204-1efd-df4ee2a48004	5263	Dobravlje
00050000-561b-b204-7c07-08c5f7ba3ea7	3204	Dobrna
00050000-561b-b204-1e2c-eb0aea40e8a7	8211	Dobrnič
00050000-561b-b204-1318-940111076eb4	1356	Dobrova
00050000-561b-b204-dfbd-be0acdd1db77	9223	Dobrovnik/Dobronak 
00050000-561b-b204-8778-489e33e8ee79	5212	Dobrovo v Brdih
00050000-561b-b204-9cb4-3cf7b6500e89	1431	Dol pri Hrastniku
00050000-561b-b204-4123-dc29558bf944	1262	Dol pri Ljubljani
00050000-561b-b204-7759-42fce0e1dc22	1273	Dole pri Litiji
00050000-561b-b204-9ffb-00ee6755febc	1331	Dolenja vas
00050000-561b-b204-cb18-05bef549ca1c	8350	Dolenjske Toplice
00050000-561b-b204-87dc-42bdc76094d0	1230	Domžale
00050000-561b-b204-b77e-e2a8516893dc	2252	Dornava
00050000-561b-b204-a7b9-df9fd427ad99	5294	Dornberk
00050000-561b-b204-a78d-fc5c8553b7b6	1319	Draga
00050000-561b-b204-5287-5262b6c1be14	8343	Dragatuš
00050000-561b-b204-c5bf-598e7b3d851f	3222	Dramlje
00050000-561b-b204-b91b-530fe596ea0c	2370	Dravograd
00050000-561b-b204-056e-7217b4c36a2c	4203	Duplje
00050000-561b-b204-f72a-2f95fcb501e9	6221	Dutovlje
00050000-561b-b204-6167-7728078a63d3	8361	Dvor
00050000-561b-b204-63dc-73f920d34b28	2343	Fala
00050000-561b-b204-7a95-8b5b3c8e1abd	9208	Fokovci
00050000-561b-b204-b834-0cecf2381a36	2313	Fram
00050000-561b-b204-f9dc-68f5c92bc6fa	3213	Frankolovo
00050000-561b-b204-f85c-3f85013b88df	1274	Gabrovka
00050000-561b-b204-d080-7a05aa10ee0f	8254	Globoko
00050000-561b-b204-b1ca-a2c4dc5710da	5275	Godovič
00050000-561b-b204-dcd1-fddecca396de	4204	Golnik
00050000-561b-b204-0c7c-230db87db86f	3303	Gomilsko
00050000-561b-b204-c43e-005898357570	4224	Gorenja vas
00050000-561b-b204-371c-e58a47510990	3263	Gorica pri Slivnici
00050000-561b-b204-2800-094f2fbc6a5f	2272	Gorišnica
00050000-561b-b204-923e-6eb6539b0865	9250	Gornja Radgona
00050000-561b-b204-9314-0c4312a4065e	3342	Gornji Grad
00050000-561b-b204-1593-0d704c93d858	4282	Gozd Martuljek
00050000-561b-b204-9d19-5c3d4360500d	6272	Gračišče
00050000-561b-b204-e29f-411e86085483	9264	Grad
00050000-561b-b204-508a-a19827c4b994	8332	Gradac
00050000-561b-b204-e2af-df6137ae225a	1384	Grahovo
00050000-561b-b204-5c59-4501bcf45f66	5242	Grahovo ob Bači
00050000-561b-b204-8de2-4fe5047803cd	5251	Grgar
00050000-561b-b204-40ec-a43c179c4424	3302	Griže
00050000-561b-b204-d7e4-796b07aedf37	3231	Grobelno
00050000-561b-b204-d22b-32d1aabbb8dc	1290	Grosuplje
00050000-561b-b204-8ce9-af565a10e0a9	2288	Hajdina
00050000-561b-b204-6452-be97d73a19e1	8362	Hinje
00050000-561b-b204-6fa0-1cb14900acdc	2311	Hoče
00050000-561b-b204-ca5c-7698185492d4	9205	Hodoš/Hodos
00050000-561b-b204-826d-90a067d5a5e4	1354	Horjul
00050000-561b-b204-60e6-09f96a901b3f	1372	Hotedršica
00050000-561b-b204-888d-69f0705c05f5	1430	Hrastnik
00050000-561b-b204-a6a3-6d8a6a63b905	6225	Hruševje
00050000-561b-b204-2adc-891a4b72b2ad	4276	Hrušica
00050000-561b-b204-9bd1-c63a07eb075b	5280	Idrija
00050000-561b-b204-cb85-1875693feb6b	1292	Ig
00050000-561b-b204-f067-1cc001f2dc1a	6250	Ilirska Bistrica
00050000-561b-b204-f157-0456abb5ac13	6251	Ilirska Bistrica-Trnovo
00050000-561b-b204-cf09-ffac1debf606	1295	Ivančna Gorica
00050000-561b-b204-e5f0-4c72086a7013	2259	Ivanjkovci
00050000-561b-b204-8e7d-c774a1fbd0e2	1411	Izlake
00050000-561b-b204-4e6a-0ed16bd508c5	6310	Izola/Isola
00050000-561b-b204-62bb-b0b514444263	2222	Jakobski Dol
00050000-561b-b204-b108-ee48ed844028	2221	Jarenina
00050000-561b-b204-5d88-5b152f329d60	6254	Jelšane
00050000-561b-b204-b7c1-f6f91483159a	4270	Jesenice
00050000-561b-b204-4ab2-82cfa5da987d	8261	Jesenice na Dolenjskem
00050000-561b-b204-7bb7-432495134e91	3273	Jurklošter
00050000-561b-b204-bec9-d2ee7ef8fb66	2223	Jurovski Dol
00050000-561b-b204-ebd2-243702f0d73c	2256	Juršinci
00050000-561b-b204-6e4f-f913b323009b	5214	Kal nad Kanalom
00050000-561b-b204-d2db-15028029e102	3233	Kalobje
00050000-561b-b204-d07f-683d60665abd	4246	Kamna Gorica
00050000-561b-b204-a852-ca141e5edf8e	2351	Kamnica
00050000-561b-b204-e7bc-e30352b75beb	1241	Kamnik
00050000-561b-b204-d1cf-762530e18713	5213	Kanal
00050000-561b-b204-772c-382eecaf0759	8258	Kapele
00050000-561b-b204-d274-e8d5d3df99e5	2362	Kapla
00050000-561b-b204-0b0f-c2c87e4d60d1	2325	Kidričevo
00050000-561b-b204-b327-42c7b2d2a1cf	1412	Kisovec
00050000-561b-b204-6d9c-2df4330ba0cd	6253	Knežak
00050000-561b-b204-4a8f-1d63cd76b427	5222	Kobarid
00050000-561b-b204-168e-05139e586c94	9227	Kobilje
00050000-561b-b204-2a1f-b47bfa4f8368	1330	Kočevje
00050000-561b-b204-90df-f9ea1e35d942	1338	Kočevska Reka
00050000-561b-b204-b669-2ac13e96d083	2276	Kog
00050000-561b-b204-7523-c431918423a5	5211	Kojsko
00050000-561b-b204-5053-fb4824e18467	6223	Komen
00050000-561b-b204-95cf-860fbcbdd38f	1218	Komenda
00050000-561b-b204-6e26-e868c1c6af8f	6000	Koper/Capodistria 
00050000-561b-b204-cc61-feb1a009b73f	6001	Koper/Capodistria - poštni predali
00050000-561b-b204-7abf-4fbb12c808ab	8282	Koprivnica
00050000-561b-b204-56ee-aad1c64dad98	5296	Kostanjevica na Krasu
00050000-561b-b204-6d56-5de72d45a717	8311	Kostanjevica na Krki
00050000-561b-b204-afc1-a81229a18ae7	1336	Kostel
00050000-561b-b204-aaaa-b0ee610b8997	6256	Košana
00050000-561b-b204-8c8f-426cf190f01b	2394	Kotlje
00050000-561b-b204-4ea3-929d80b3c96d	6240	Kozina
00050000-561b-b204-6dea-97fe0a0cee62	3260	Kozje
00050000-561b-b204-4cf4-a567d15b4a74	4000	Kranj 
00050000-561b-b204-6ba1-8051f14d5fe6	4001	Kranj - poštni predali
00050000-561b-b204-ec3b-fbc592946018	4280	Kranjska Gora
00050000-561b-b204-25bf-7781002a5c08	1281	Kresnice
00050000-561b-b204-704c-0518296f83ff	4294	Križe
00050000-561b-b204-88e9-563e82ad4ec2	9206	Križevci
00050000-561b-b204-514b-695567ca404a	9242	Križevci pri Ljutomeru
00050000-561b-b204-5cc1-3a6eb16e153e	1301	Krka
00050000-561b-b204-d426-c5cb7caa56d8	8296	Krmelj
00050000-561b-b204-a8ee-7d08939a54f3	4245	Kropa
00050000-561b-b204-a2cb-37245c7091c6	8262	Krška vas
00050000-561b-b204-993d-8199907ae48d	8270	Krško
00050000-561b-b204-2cf4-8b2c4dee3706	9263	Kuzma
00050000-561b-b204-660d-6c311ef7aff4	2318	Laporje
00050000-561b-b204-18f9-14d1525d308a	3270	Laško
00050000-561b-b204-826b-37a5af45d8c7	1219	Laze v Tuhinju
00050000-561b-b204-9e63-dee19a2c8148	2230	Lenart v Slovenskih goricah
00050000-561b-b204-351f-c533201381a6	9220	Lendava/Lendva
00050000-561b-b204-a9c5-4ea97462629f	4248	Lesce
00050000-561b-b204-6a52-8cc4d5feecc3	3261	Lesično
00050000-561b-b204-9caf-025c19a1ce29	8273	Leskovec pri Krškem
00050000-561b-b204-ecdc-7f753e2730cc	2372	Libeliče
00050000-561b-b204-49a5-3d01e7cc967e	2341	Limbuš
00050000-561b-b204-8c54-c361bb3e64ed	1270	Litija
00050000-561b-b204-3607-d25774559a17	3202	Ljubečna
00050000-561b-b204-7317-3fc99c2b4d3f	1000	Ljubljana 
00050000-561b-b204-7f92-741c356a9716	1001	Ljubljana - poštni predali
00050000-561b-b204-8352-2057f857d207	1231	Ljubljana - Črnuče
00050000-561b-b204-e490-0f52b4a31148	1261	Ljubljana - Dobrunje
00050000-561b-b204-c21e-c2c1552d4d29	1260	Ljubljana - Polje
00050000-561b-b204-d5c8-79e5276e22d9	1210	Ljubljana - Šentvid
00050000-561b-b204-1a6e-28fcf4da3cfd	1211	Ljubljana - Šmartno
00050000-561b-b204-9c1e-78f3e463b8e1	3333	Ljubno ob Savinji
00050000-561b-b204-c0c3-b51ecf37f64f	9240	Ljutomer
00050000-561b-b204-768f-e51f8c2042a9	3215	Loče
00050000-561b-b204-d3dc-6dc67513abd5	5231	Log pod Mangartom
00050000-561b-b204-5d1d-f4e16c8e4152	1358	Log pri Brezovici
00050000-561b-b204-a210-7bf6a015e6a9	1370	Logatec
00050000-561b-b204-b4c6-a70fa7a4717a	1371	Logatec
00050000-561b-b204-5bb5-932aa2c31e79	1434	Loka pri Zidanem Mostu
00050000-561b-b204-c2b3-a75dd3b37817	3223	Loka pri Žusmu
00050000-561b-b204-327c-1086861f4ff5	6219	Lokev
00050000-561b-b204-ce54-258bb1a57528	1318	Loški Potok
00050000-561b-b204-979d-f205035b2843	2324	Lovrenc na Dravskem polju
00050000-561b-b204-f8f9-905f14a183d4	2344	Lovrenc na Pohorju
00050000-561b-b204-5222-10bef4b406a0	3334	Luče
00050000-561b-b204-2a94-589da4367d18	1225	Lukovica
00050000-561b-b204-e5c0-41a6a02c7fe1	9202	Mačkovci
00050000-561b-b204-1b6d-a62dd3d45e45	2322	Majšperk
00050000-561b-b204-ccec-dd90e7bddd5a	2321	Makole
00050000-561b-b204-1bd6-be9448666ffc	9243	Mala Nedelja
00050000-561b-b204-e060-c5c433011086	2229	Malečnik
00050000-561b-b204-7318-5803574650c0	6273	Marezige
00050000-561b-b204-a23f-82d00e557a38	2000	Maribor 
00050000-561b-b204-5651-1dbb6a245808	2001	Maribor - poštni predali
00050000-561b-b204-2145-e7e6dfdffb73	2206	Marjeta na Dravskem polju
00050000-561b-b204-6c8c-72800626fac9	2281	Markovci
00050000-561b-b204-0bf7-98c5f7338110	9221	Martjanci
00050000-561b-b204-e18c-1bc1d27c2d66	6242	Materija
00050000-561b-b204-8866-64d68c9fac6b	4211	Mavčiče
00050000-561b-b204-674a-e66ecc1f1859	1215	Medvode
00050000-561b-b204-cfb8-488ef4341f54	1234	Mengeš
00050000-561b-b204-ef93-eabb4a731f05	8330	Metlika
00050000-561b-b204-dbb0-73d4f656f314	2392	Mežica
00050000-561b-b204-19ef-e3eee646aa53	2204	Miklavž na Dravskem polju
00050000-561b-b204-b783-2d75882ba73b	2275	Miklavž pri Ormožu
00050000-561b-b204-9fa0-ea8c7783a391	5291	Miren
00050000-561b-b204-0208-474de127effa	8233	Mirna
00050000-561b-b204-94c7-12f542992356	8216	Mirna Peč
00050000-561b-b204-1a28-a198ef684564	2382	Mislinja
00050000-561b-b204-5712-17aef5adf4aa	4281	Mojstrana
00050000-561b-b204-d71d-09fe8a6cd055	8230	Mokronog
00050000-561b-b204-7a29-104c8ad7f74c	1251	Moravče
00050000-561b-b204-6cdd-e5c23add6a49	9226	Moravske Toplice
00050000-561b-b204-d07a-b85094967262	5216	Most na Soči
00050000-561b-b204-abd9-4aefe971fd47	1221	Motnik
00050000-561b-b204-8d62-f9a1a8a987fc	3330	Mozirje
00050000-561b-b204-6cec-e37822b02a0c	9000	Murska Sobota 
00050000-561b-b204-ab2a-a1b4405d82c6	9001	Murska Sobota - poštni predali
00050000-561b-b204-0501-efd7da155758	2366	Muta
00050000-561b-b204-94f3-972e1f454068	4202	Naklo
00050000-561b-b204-8d03-82094b7d962b	3331	Nazarje
00050000-561b-b204-e76c-485f59f420cc	1357	Notranje Gorice
00050000-561b-b204-3dff-d1ec28d55170	3203	Nova Cerkev
00050000-561b-b204-6be0-0d21f60bc32e	5000	Nova Gorica 
00050000-561b-b204-2e67-a6dc22d84f7f	5001	Nova Gorica - poštni predali
00050000-561b-b204-800a-bfc59ff1d9a6	1385	Nova vas
00050000-561b-b204-ad74-4b8088a8c734	8000	Novo mesto
00050000-561b-b204-d26d-43b24b966a31	8001	Novo mesto - poštni predali
00050000-561b-b204-c291-1bcee81d8fdb	6243	Obrov
00050000-561b-b204-09ba-fa5b73f66ef4	9233	Odranci
00050000-561b-b204-0fa4-c5d53f14bb86	2317	Oplotnica
00050000-561b-b204-a11c-82f82b0c2a32	2312	Orehova vas
00050000-561b-b204-60ca-e8c75d87f691	2270	Ormož
00050000-561b-b204-b4fa-a6761ce85f46	1316	Ortnek
00050000-561b-b204-3364-d34f50e35d8b	1337	Osilnica
00050000-561b-b204-ce16-6751836285f1	8222	Otočec
00050000-561b-b204-adb7-f6326aba53b9	2361	Ožbalt
00050000-561b-b204-0dfc-0e0aed85674a	2231	Pernica
00050000-561b-b204-80f9-0a79e35208eb	2211	Pesnica pri Mariboru
00050000-561b-b204-99b2-e7e8c96094bd	9203	Petrovci
00050000-561b-b204-33ca-0ce4bff745ac	3301	Petrovče
00050000-561b-b204-8445-4107d1c43ef4	6330	Piran/Pirano
00050000-561b-b204-25f4-22047619de9f	8255	Pišece
00050000-561b-b204-c54b-f2524d2ad334	6257	Pivka
00050000-561b-b204-9403-0ee2a836c29e	6232	Planina
00050000-561b-b204-0db8-ee5c75fe2ea8	3225	Planina pri Sevnici
00050000-561b-b204-8bf9-841b43b0653c	6276	Pobegi
00050000-561b-b204-e17a-d1b44505bf56	8312	Podbočje
00050000-561b-b204-e690-a4246b732a3d	5243	Podbrdo
00050000-561b-b204-9452-6c7d1410163b	3254	Podčetrtek
00050000-561b-b204-f5ea-456f72a41168	2273	Podgorci
00050000-561b-b204-f739-49356ecc963a	6216	Podgorje
00050000-561b-b204-fc10-4a50a10ad02a	2381	Podgorje pri Slovenj Gradcu
00050000-561b-b204-e68f-e07a02c51868	6244	Podgrad
00050000-561b-b204-42e5-184e719e14b4	1414	Podkum
00050000-561b-b204-5b33-d3678052fe90	2286	Podlehnik
00050000-561b-b204-af29-ec9a14ab2472	5272	Podnanos
00050000-561b-b204-b60c-c05db8e0b47b	4244	Podnart
00050000-561b-b204-118e-354230306dbd	3241	Podplat
00050000-561b-b204-2b0c-402a4d6888af	3257	Podsreda
00050000-561b-b204-495c-1562bc956694	2363	Podvelka
00050000-561b-b204-de6b-ae5ff5398f74	2208	Pohorje
00050000-561b-b204-ec08-28b878ac8d12	2257	Polenšak
00050000-561b-b204-b668-b4e99005ce7f	1355	Polhov Gradec
00050000-561b-b204-c866-2227ae1e94b1	4223	Poljane nad Škofjo Loko
00050000-561b-b204-2825-5d35d08a0b02	2319	Poljčane
00050000-561b-b204-d750-9534601cfe80	1272	Polšnik
00050000-561b-b204-6a2c-410c5fb84ac1	3313	Polzela
00050000-561b-b204-ca18-dd083bf9329c	3232	Ponikva
00050000-561b-b204-c19b-68b7c2621213	6320	Portorož/Portorose
00050000-561b-b204-4e67-588735ab9c1e	6230	Postojna
00050000-561b-b204-7714-baa59990c963	2331	Pragersko
00050000-561b-b204-58e0-3bbec3dd8849	3312	Prebold
00050000-561b-b204-8765-58cf4879447b	4205	Preddvor
00050000-561b-b204-2fca-c0daac68a68c	6255	Prem
00050000-561b-b204-13d2-56e0cd5c87fb	1352	Preserje
00050000-561b-b204-55b2-14469db08822	6258	Prestranek
00050000-561b-b204-c574-6f0dba90625b	2391	Prevalje
00050000-561b-b204-ffdb-ffb089e1fbc3	3262	Prevorje
00050000-561b-b204-ba4f-d71b70071bc2	1276	Primskovo 
00050000-561b-b204-8679-c6f4f109930a	3253	Pristava pri Mestinju
00050000-561b-b204-4a43-a3db4d1feda8	9207	Prosenjakovci/Partosfalva
00050000-561b-b204-0de9-5e3af27f8272	5297	Prvačina
00050000-561b-b204-54a2-da727d1936d6	2250	Ptuj
00050000-561b-b204-ad38-66281f6f7d6b	2323	Ptujska Gora
00050000-561b-b204-6443-8200f89fd072	9201	Puconci
00050000-561b-b204-ba71-f6312d7caf8f	2327	Rače
00050000-561b-b204-836e-2d760828e99e	1433	Radeče
00050000-561b-b204-af8d-d049e2295fed	9252	Radenci
00050000-561b-b204-6fa9-dc61118dd6bf	2360	Radlje ob Dravi
00050000-561b-b204-3d0f-94e5ec7ea58d	1235	Radomlje
00050000-561b-b204-6b87-ecd602b62d69	4240	Radovljica
00050000-561b-b204-9a2c-575e1638e807	8274	Raka
00050000-561b-b204-c610-41e37939e146	1381	Rakek
00050000-561b-b204-088e-86d0ff5fdad5	4283	Rateče - Planica
00050000-561b-b204-ce85-5e0e3fe7ee3e	2390	Ravne na Koroškem
00050000-561b-b204-12c4-ebbb336a353e	9246	Razkrižje
00050000-561b-b204-3bd4-341eb2f8fdf0	3332	Rečica ob Savinji
00050000-561b-b204-6019-62cd4fb343ea	5292	Renče
00050000-561b-b204-ab69-46691b51707b	1310	Ribnica
00050000-561b-b204-7801-ab0c62f08733	2364	Ribnica na Pohorju
00050000-561b-b204-858c-df395c19115f	3272	Rimske Toplice
00050000-561b-b204-c31e-4fcb0aad0bba	1314	Rob
00050000-561b-b204-a41e-0c6c1567191d	5215	Ročinj
00050000-561b-b204-4f92-69d59fa85335	3250	Rogaška Slatina
00050000-561b-b204-5d9f-defb615bbdad	9262	Rogašovci
00050000-561b-b204-937d-65b32217bbae	3252	Rogatec
00050000-561b-b204-bdee-2531121b51b1	1373	Rovte
00050000-561b-b204-e665-124bdafaa87d	2342	Ruše
00050000-561b-b204-2ad4-5323d1acc765	1282	Sava
00050000-561b-b204-5a00-4c59b4fe74a7	6333	Sečovlje/Sicciole
00050000-561b-b204-48f6-9db8b11bb472	4227	Selca
00050000-561b-b204-d984-4c940283e7ee	2352	Selnica ob Dravi
00050000-561b-b204-d4b8-6e763761c489	8333	Semič
00050000-561b-b204-1e29-8b7659eebc8f	8281	Senovo
00050000-561b-b204-eb45-31acb574e89b	6224	Senožeče
00050000-561b-b204-5843-61f54ca94b76	8290	Sevnica
00050000-561b-b204-4c17-bff3b3c338f7	6210	Sežana
00050000-561b-b204-61d0-f3ee34165602	2214	Sladki Vrh
00050000-561b-b204-6669-587270cb801d	5283	Slap ob Idrijci
00050000-561b-b204-b1d7-aac0967836b0	2380	Slovenj Gradec
00050000-561b-b204-7600-e24b8c545421	2310	Slovenska Bistrica
00050000-561b-b204-9fa1-fcf0684b342e	3210	Slovenske Konjice
00050000-561b-b204-c9b0-a822cdfed955	1216	Smlednik
00050000-561b-b204-f434-564c0a512c80	5232	Soča
00050000-561b-b205-6c0b-d0afe541d6e2	1317	Sodražica
00050000-561b-b205-7924-345dd41f593d	3335	Solčava
00050000-561b-b205-091d-d0be7f470891	5250	Solkan
00050000-561b-b205-4934-df7d1966c349	4229	Sorica
00050000-561b-b205-6f44-5aa4c2f6d515	4225	Sovodenj
00050000-561b-b205-8bea-0cdcd3c2c864	5281	Spodnja Idrija
00050000-561b-b205-9730-54e27b1554a2	2241	Spodnji Duplek
00050000-561b-b205-3ea3-8dea83aad65a	9245	Spodnji Ivanjci
00050000-561b-b205-7be4-a720dc5c1c98	2277	Središče ob Dravi
00050000-561b-b205-05ed-76321eb3b4ef	4267	Srednja vas v Bohinju
00050000-561b-b205-1d97-5ed5952e20f2	8256	Sromlje 
00050000-561b-b205-fc6a-b062afbdef27	5224	Srpenica
00050000-561b-b205-2092-3666694b8022	1242	Stahovica
00050000-561b-b205-fcbc-9d4611484e85	1332	Stara Cerkev
00050000-561b-b205-fad1-6d18d4035811	8342	Stari trg ob Kolpi
00050000-561b-b205-9d40-8ac51de8b826	1386	Stari trg pri Ložu
00050000-561b-b205-99dd-d1291f470a44	2205	Starše
00050000-561b-b205-14db-770afcc6bda4	2289	Stoperce
00050000-561b-b205-b041-9b5eeac0ff1b	8322	Stopiče
00050000-561b-b205-02cf-68d2fd85dfd0	3206	Stranice
00050000-561b-b205-f6d8-e8d6152aeb33	8351	Straža
00050000-561b-b205-bf43-97347a9482ba	1313	Struge
00050000-561b-b205-67ea-48e45ceb7ddc	8293	Studenec
00050000-561b-b205-78b6-984fdb1bebd6	8331	Suhor
00050000-561b-b205-9c74-4b644a35164a	2233	Sv. Ana v Slovenskih goricah
00050000-561b-b205-9da6-fdb1e5ba978f	2235	Sv. Trojica v Slovenskih goricah
00050000-561b-b205-55a8-b8e0119c1029	2353	Sveti Duh na Ostrem Vrhu
00050000-561b-b205-0a53-25962c450c18	9244	Sveti Jurij ob Ščavnici
00050000-561b-b205-7083-0d3c2a932d74	3264	Sveti Štefan
00050000-561b-b205-9bef-8e645812a8f4	2258	Sveti Tomaž
00050000-561b-b205-189a-5e2f8a69c41d	9204	Šalovci
00050000-561b-b205-879a-1eb052cb6434	5261	Šempas
00050000-561b-b205-9761-c766fcb7ca9a	5290	Šempeter pri Gorici
00050000-561b-b205-c436-f9afcc128e3f	3311	Šempeter v Savinjski dolini
00050000-561b-b205-0987-32e5acc1db2c	4208	Šenčur
00050000-561b-b205-b6c8-b45f24f320b2	2212	Šentilj v Slovenskih goricah
00050000-561b-b205-d776-7fe63576f3e7	8297	Šentjanž
00050000-561b-b205-dc64-a7616948bcd6	2373	Šentjanž pri Dravogradu
00050000-561b-b205-b63a-082bfba739ef	8310	Šentjernej
00050000-561b-b205-c66d-c380c58c593d	3230	Šentjur
00050000-561b-b205-0312-7cb03a29717f	3271	Šentrupert
00050000-561b-b205-e4a1-26fef5a2fb4d	8232	Šentrupert
00050000-561b-b205-f335-6bfea9fa123c	1296	Šentvid pri Stični
00050000-561b-b205-ddf0-0da7935c4874	8275	Škocjan
00050000-561b-b205-ffd0-23b72ca6eca4	6281	Škofije
00050000-561b-b205-e654-96493bac740b	4220	Škofja Loka
00050000-561b-b205-542e-7f21fb0a439c	3211	Škofja vas
00050000-561b-b205-c034-f3b14853c801	1291	Škofljica
00050000-561b-b205-11a0-3921bd2ec6a0	6274	Šmarje
00050000-561b-b205-94f1-a5d231633463	1293	Šmarje - Sap
00050000-561b-b205-b628-8fda20ab8f8c	3240	Šmarje pri Jelšah
00050000-561b-b205-cec2-5d9a0476bc69	8220	Šmarješke Toplice
00050000-561b-b205-ba7d-1fbb07f25072	2315	Šmartno na Pohorju
00050000-561b-b205-7ba6-8ad94744e6d1	3341	Šmartno ob Dreti
00050000-561b-b205-9cb4-bb8cb7584e1c	3327	Šmartno ob Paki
00050000-561b-b205-aee1-c69f586088af	1275	Šmartno pri Litiji
00050000-561b-b205-dea3-4760f5a37255	2383	Šmartno pri Slovenj Gradcu
00050000-561b-b205-d268-570add534c8a	3201	Šmartno v Rožni dolini
00050000-561b-b205-358f-749a230ea5d6	3325	Šoštanj
00050000-561b-b205-96b4-a41f1e0c9815	6222	Štanjel
00050000-561b-b205-ab54-ab8fe67ce6e1	3220	Štore
00050000-561b-b205-4ca3-0ba7da102392	3304	Tabor
00050000-561b-b205-8528-4f89a6d2480c	3221	Teharje
00050000-561b-b205-7c40-36c54a3c1680	9251	Tišina
00050000-561b-b205-670a-8c29529eb174	5220	Tolmin
00050000-561b-b205-e6b8-3a341b59735d	3326	Topolšica
00050000-561b-b205-b070-87859fd6ca74	2371	Trbonje
00050000-561b-b205-f02f-d9e38ccdbc68	1420	Trbovlje
00050000-561b-b205-8dd2-3aa4a0db0e5c	8231	Trebelno 
00050000-561b-b205-304a-dc315e0afb7a	8210	Trebnje
00050000-561b-b205-518d-ec8a4b4259c5	5252	Trnovo pri Gorici
00050000-561b-b205-84a8-3fba2939896f	2254	Trnovska vas
00050000-561b-b205-cd50-7e759a0b3550	1222	Trojane
00050000-561b-b205-971d-c1721ce50a53	1236	Trzin
00050000-561b-b205-d9f3-ecbf230c5580	4290	Tržič
00050000-561b-b205-dafa-3bcfd4460d5a	8295	Tržišče
00050000-561b-b205-db9e-3357402250ed	1311	Turjak
00050000-561b-b205-11f3-b53783bfe58d	9224	Turnišče
00050000-561b-b205-ad4d-41bc5706f4df	8323	Uršna sela
00050000-561b-b205-925d-93964a364101	1252	Vače
00050000-561b-b205-9c66-ced1aaec979b	3320	Velenje 
00050000-561b-b205-b21c-e357451c2e91	3322	Velenje - poštni predali
00050000-561b-b205-2cea-adc0652819e5	8212	Velika Loka
00050000-561b-b205-bcbb-82a08d13b9a3	2274	Velika Nedelja
00050000-561b-b205-0f70-42d7112292f7	9225	Velika Polana
00050000-561b-b205-2b3d-08195a8d1254	1315	Velike Lašče
00050000-561b-b205-3963-8395943ef0ea	8213	Veliki Gaber
00050000-561b-b205-7596-a76a1d61114e	9241	Veržej
00050000-561b-b205-c9ce-c942f1201264	1312	Videm - Dobrepolje
00050000-561b-b205-6596-345b2da77f84	2284	Videm pri Ptuju
00050000-561b-b205-54f3-f5591b4bcda3	8344	Vinica
00050000-561b-b205-c4c2-b166cc1d7f78	5271	Vipava
00050000-561b-b205-ebd5-1566468b0745	4212	Visoko
00050000-561b-b205-c99d-9bcae5f59362	1294	Višnja Gora
00050000-561b-b205-6da2-df637561c864	3205	Vitanje
00050000-561b-b205-2fb9-695ed5ecbfd2	2255	Vitomarci
00050000-561b-b205-d154-7acf44736396	1217	Vodice
00050000-561b-b205-886d-ac76ae9330c0	3212	Vojnik\t
00050000-561b-b205-000b-2ac33d2082d4	5293	Volčja Draga
00050000-561b-b205-5995-18dfd0b9b1e5	2232	Voličina
00050000-561b-b205-f318-645e7d1b5d2f	3305	Vransko
00050000-561b-b205-78fb-3ade1a25a982	6217	Vremski Britof
00050000-561b-b205-e6f7-bc909a1f1c82	1360	Vrhnika
00050000-561b-b205-728a-a2b1a292e277	2365	Vuhred
00050000-561b-b205-1960-ed33cfc93be1	2367	Vuzenica
00050000-561b-b205-936b-627edd80d028	8292	Zabukovje 
00050000-561b-b205-7e2d-18a54914e909	1410	Zagorje ob Savi
00050000-561b-b205-1fb3-3905af132850	1303	Zagradec
00050000-561b-b205-f185-c9d7f8a06808	2283	Zavrč
00050000-561b-b205-fb41-2cd0fa26ec0a	8272	Zdole 
00050000-561b-b205-cce1-7a9b9a8fe5b4	4201	Zgornja Besnica
00050000-561b-b205-c212-abb4b86a77c2	2242	Zgornja Korena
00050000-561b-b205-dc81-d3e953c1ceff	2201	Zgornja Kungota
00050000-561b-b205-24e3-82ad95ba1bc0	2316	Zgornja Ložnica
00050000-561b-b205-88c4-9c30e19ffcc4	2314	Zgornja Polskava
00050000-561b-b205-87a2-c3e2be017cf7	2213	Zgornja Velka
00050000-561b-b205-e27d-077524294849	4247	Zgornje Gorje
00050000-561b-b205-4502-05bc62846a00	4206	Zgornje Jezersko
00050000-561b-b205-41de-7b2e41f6cd28	2285	Zgornji Leskovec
00050000-561b-b205-5cb5-80c3ddba2818	1432	Zidani Most
00050000-561b-b205-9be1-34f1e48343a7	3214	Zreče
00050000-561b-b205-28af-6a6ae8939238	4209	Žabnica
00050000-561b-b205-a86c-a78c42892c61	3310	Žalec
00050000-561b-b205-a5f2-1b24e4ae4970	4228	Železniki
00050000-561b-b205-0547-2d073002a995	2287	Žetale
00050000-561b-b205-5fd4-b54d02151a09	4226	Žiri
00050000-561b-b205-5921-11accb629ac3	4274	Žirovnica
00050000-561b-b205-48ee-18a807d5a15c	8360	Žužemberk
\.


--
-- TOC entry 3057 (class 0 OID 21726304)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21725897)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 21725677)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561b-b208-270f-8a72f33d0eac	00080000-561b-b207-67e7-3998f32c2fc8	\N	00040000-561b-b205-e4bd-bd94e8ef6e1d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561b-b208-2167-8977349fa75a	00080000-561b-b207-67e7-3998f32c2fc8	\N	00040000-561b-b205-e4bd-bd94e8ef6e1d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561b-b208-de18-e00d41ee67d1	00080000-561b-b207-9869-b5a808de427a	\N	00040000-561b-b205-e4bd-bd94e8ef6e1d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3019 (class 0 OID 21725781)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21725909)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 21726318)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 21726328)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561b-b208-8496-9214ec40e71c	00080000-561b-b207-ab3d-1453c63efc54	0987	AK
00190000-561b-b208-7229-735b4d6b1c82	00080000-561b-b207-9869-b5a808de427a	0989	AK
00190000-561b-b208-35e7-e9d1f484b5ba	00080000-561b-b207-100a-6509b1ed1620	0986	AK
00190000-561b-b208-0179-735b82d1e931	00080000-561b-b207-431d-8ef69d859bcd	0984	AK
00190000-561b-b208-4cf2-43bad2b59e49	00080000-561b-b207-5514-af59881253f2	0983	AK
00190000-561b-b208-6a20-1d81bfa77240	00080000-561b-b207-419d-0eb7fcfba1a7	0982	AK
00190000-561b-b209-fbe0-93a3455cecb2	00080000-561b-b209-eb32-3c980282290e	1001	AK
\.


--
-- TOC entry 3056 (class 0 OID 21726243)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561b-b208-23fa-834bba8ce558	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3060 (class 0 OID 21726336)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21725938)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561b-b207-2c85-a890ec2e2884	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561b-b207-3357-aa50fb55bd86	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561b-b207-8ee3-ce90725299fd	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561b-b207-f94c-8d5d6d512c17	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561b-b207-38c9-ee1452e107c3	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561b-b207-90a1-6932bdf30cd7	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561b-b207-9eb0-2d05b33c79b2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3028 (class 0 OID 21725882)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 21725872)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 21726082)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 21726012)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21725755)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 21725550)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561b-b209-eb32-3c980282290e	00010000-561b-b205-f9da-9becb8758f4d	2015-10-12 15:13:45	INS	a:0:{}
2	App\\Entity\\Option	00000000-561b-b209-0d65-c2c444aedf89	00010000-561b-b205-f9da-9becb8758f4d	2015-10-12 15:13:45	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561b-b209-fbe0-93a3455cecb2	00010000-561b-b205-f9da-9becb8758f4d	2015-10-12 15:13:45	INS	a:0:{}
\.


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3037 (class 0 OID 21725951)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21725588)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561b-b205-40c4-f777f5829c2d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561b-b205-c62b-4ea4333629d4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561b-b205-d505-b0367270e366	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561b-b205-349d-d22f609f6d7a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561b-b205-cb74-aff94875fca2	planer	Planer dogodkov v koledarju	t
00020000-561b-b205-99b4-bedf11358e14	kadrovska	Kadrovska služba	t
00020000-561b-b205-648e-ff7f03df06b0	arhivar	Ažuriranje arhivalij	t
00020000-561b-b205-f791-8f550a8fc34d	igralec	Igralec	t
00020000-561b-b205-87ca-da9c82310aef	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561b-b207-1ca1-ad5534e4d7d8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3002 (class 0 OID 21725572)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561b-b205-6451-e55ede4e37ab	00020000-561b-b205-d505-b0367270e366
00010000-561b-b205-f9da-9becb8758f4d	00020000-561b-b205-d505-b0367270e366
00010000-561b-b208-6b69-3b8177456283	00020000-561b-b207-1ca1-ad5534e4d7d8
\.


--
-- TOC entry 3039 (class 0 OID 21725965)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21725903)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21725849)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21725537)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561b-b205-de08-1fdf6c5d17c5	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561b-b205-502e-3d6e6f9374b2	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561b-b205-e539-a341593b4cf2	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561b-b205-66aa-8515736a4e66	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561b-b205-fc7d-7d07cf41a9e2	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2997 (class 0 OID 21725529)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561b-b205-6c8a-266c9cb438d3	00230000-561b-b205-66aa-8515736a4e66	popa
00240000-561b-b205-98b1-d3f3a9539915	00230000-561b-b205-66aa-8515736a4e66	oseba
00240000-561b-b205-a6cf-c247c114d8e9	00230000-561b-b205-66aa-8515736a4e66	sezona
00240000-561b-b205-e13b-8bc206550f75	00230000-561b-b205-502e-3d6e6f9374b2	prostor
00240000-561b-b205-925a-ab6255f91bbb	00230000-561b-b205-66aa-8515736a4e66	besedilo
00240000-561b-b205-8250-060cf6467e9a	00230000-561b-b205-66aa-8515736a4e66	uprizoritev
00240000-561b-b205-6b90-ce9790e86d7f	00230000-561b-b205-66aa-8515736a4e66	funkcija
00240000-561b-b205-7841-ca87e51e6d08	00230000-561b-b205-66aa-8515736a4e66	tipfunkcije
00240000-561b-b205-2f69-cbf715bd1663	00230000-561b-b205-66aa-8515736a4e66	alternacija
00240000-561b-b205-9268-b073174dc6b4	00230000-561b-b205-de08-1fdf6c5d17c5	pogodba
00240000-561b-b205-7804-7f974b7b2a17	00230000-561b-b205-66aa-8515736a4e66	zaposlitev
00240000-561b-b205-86a9-00d0b22d60eb	00230000-561b-b205-66aa-8515736a4e66	zvrstuprizoritve
00240000-561b-b205-b4c5-a49a627e0146	00230000-561b-b205-de08-1fdf6c5d17c5	programdela
00240000-561b-b205-0355-4428ce1c98b0	00230000-561b-b205-66aa-8515736a4e66	zapis
\.


--
-- TOC entry 2996 (class 0 OID 21725524)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
3ee359ca-7089-4fd9-9ee6-7188bfc50c52	00240000-561b-b205-6c8a-266c9cb438d3	0	1001
\.


--
-- TOC entry 3045 (class 0 OID 21726029)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561b-b208-1564-2ac03b68fbff	000e0000-561b-b208-8ec2-f814b01be724	00080000-561b-b207-67e7-3998f32c2fc8	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561b-b205-e6dd-1afd057071a6
00270000-561b-b208-8af5-04eb3bf758e2	000e0000-561b-b208-8ec2-f814b01be724	00080000-561b-b207-67e7-3998f32c2fc8	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561b-b205-e6dd-1afd057071a6
\.


--
-- TOC entry 3009 (class 0 OID 21725650)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21725859)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-561b-b208-b7fd-07e30af84a7e	00180000-561b-b208-d966-6d68d1223f13	000c0000-561b-b208-dc1f-ed279532c42a	00090000-561b-b208-70b5-87f9dd17faab	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-b208-bef2-5363ada4fd80	00180000-561b-b208-d966-6d68d1223f13	000c0000-561b-b208-026a-5998a872b4cc	00090000-561b-b208-27b4-220640fbaaa9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-b208-a100-e9ce2e6e1b6b	00180000-561b-b208-d966-6d68d1223f13	000c0000-561b-b208-260e-9765a3d2d209	00090000-561b-b208-5a81-b78691e73c0f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-b208-c48a-5ce48b78fc07	00180000-561b-b208-d966-6d68d1223f13	000c0000-561b-b208-c302-41914ffff4bd	00090000-561b-b208-36d0-5f5001703669	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-b208-42c0-439392d71846	00180000-561b-b208-d966-6d68d1223f13	000c0000-561b-b208-2665-55159493a71b	00090000-561b-b208-676f-eb1cfeb95e9f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-b208-ef6c-90b7397f5641	00180000-561b-b208-fbb5-aa996688bd4e	\N	00090000-561b-b208-676f-eb1cfeb95e9f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3048 (class 0 OID 21726070)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561b-b205-d5a7-ce7d5da02b5b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561b-b205-36b7-ef57d18e1a5e	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561b-b205-0ddc-f03cd98939da	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561b-b205-d961-7a305a38f13a	04	Režija	Režija	Režija	umetnik	30
000f0000-561b-b205-5c7a-b053005cbc4d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561b-b205-772e-975253019804	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561b-b205-47d2-507735e00ec3	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561b-b205-f474-f69bd5cc146e	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561b-b205-422c-491b2d9ce20a	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561b-b205-f426-6955d97af1f9	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561b-b205-17ba-f46c198dd4b0	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561b-b205-28b6-8f7e26c5a480	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561b-b205-5db3-94687d9bc5a9	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561b-b205-d76e-66470bf9f4ad	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561b-b205-8cc2-50187deb005f	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561b-b205-ab1f-32f8ac761159	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561b-b205-a2ea-3e301871073e	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561b-b205-4542-a1a8ab57dea1	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3061 (class 0 OID 21726347)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561b-b205-187f-029e106d340d	01	Velika predstava	f	1.00	1.00
002b0000-561b-b205-a41a-ab69ffc82abb	02	Mala predstava	f	0.50	0.50
002b0000-561b-b205-b684-30197b6a4765	03	Mala koprodukcija	t	0.40	1.00
002b0000-561b-b205-9071-c591ff110e0c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561b-b205-c7ec-616a96aba7f3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3014 (class 0 OID 21725712)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21725559)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561b-b205-f9da-9becb8758f4d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROqRa2z12Odb6ppAjfY3piqJ7HCVKUTqu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561b-b207-33e8-754c04d9175a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561b-b207-f5d6-d0b0786112c7	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561b-b207-19c2-67ba96d73e25	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561b-b207-87d5-c6e85062f6c4	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561b-b207-9838-7ebbb619f545	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561b-b208-18f3-2ca655c1fe17	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561b-b208-76b0-c00e6868ec16	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561b-b208-50dd-d244a365529d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561b-b208-fde5-1ee8e12479a0	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561b-b208-6b69-3b8177456283	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561b-b205-6451-e55ede4e37ab	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3052 (class 0 OID 21726120)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561b-b208-5d56-4305de737fd6	00160000-561b-b207-4c52-8390445cbb7f	\N	00140000-561b-b205-95ea-bc67e28d1ab7	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561b-b207-38c9-ee1452e107c3
000e0000-561b-b208-8ec2-f814b01be724	00160000-561b-b207-42be-f136123b3743	\N	00140000-561b-b205-d8cf-633058396c5e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561b-b207-90a1-6932bdf30cd7
000e0000-561b-b208-c917-256dadf81a96	\N	\N	00140000-561b-b205-d8cf-633058396c5e	00190000-561b-b208-8496-9214ec40e71c	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561b-b207-38c9-ee1452e107c3
000e0000-561b-b208-8457-6a3811d09d3f	\N	\N	00140000-561b-b205-d8cf-633058396c5e	00190000-561b-b208-8496-9214ec40e71c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561b-b207-38c9-ee1452e107c3
000e0000-561b-b208-eff6-11d0873095ea	\N	\N	00140000-561b-b205-d8cf-633058396c5e	00190000-561b-b208-8496-9214ec40e71c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561b-b207-2c85-a890ec2e2884
000e0000-561b-b208-841c-c14e949c5534	\N	\N	00140000-561b-b205-d8cf-633058396c5e	00190000-561b-b208-8496-9214ec40e71c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561b-b207-2c85-a890ec2e2884
\.


--
-- TOC entry 3021 (class 0 OID 21725803)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561b-b208-b5b3-82daf3521ecb	000e0000-561b-b208-8ec2-f814b01be724	\N	1	
00200000-561b-b208-81b7-d03d09802374	000e0000-561b-b208-8ec2-f814b01be724	\N	2	
00200000-561b-b208-f034-f0d0bfaf3847	000e0000-561b-b208-8ec2-f814b01be724	\N	3	
00200000-561b-b208-0779-adfee93e5cd4	000e0000-561b-b208-8ec2-f814b01be724	\N	4	
00200000-561b-b208-5b0c-372d939fb61e	000e0000-561b-b208-8ec2-f814b01be724	\N	5	
\.


--
-- TOC entry 3035 (class 0 OID 21725930)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 21726043)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561b-b205-ecb8-fe3fc7918b33	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561b-b205-08b1-5ff5a105bb72	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561b-b205-4d0a-88c35077fa1b	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561b-b205-cd6c-9078076c88a1	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561b-b205-b400-44649876b6c7	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561b-b205-eb41-981746742a5f	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561b-b205-9b9f-a89e747d984f	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561b-b205-f0c3-51b7e378ca5c	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561b-b205-e6dd-1afd057071a6	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561b-b205-29e8-b8b4a0730189	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561b-b205-8f6d-200f59c1d55d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561b-b205-7e07-0e56a6de7f2c	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561b-b205-3930-674bad1664ee	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561b-b205-7284-a79aba08c28c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561b-b205-fa0b-73be40a8c980	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561b-b205-1510-4019f051f095	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561b-b205-34bd-4a7b3363b6a2	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561b-b205-d9a8-642262bc5a23	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561b-b205-3b36-fd3d3865212a	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561b-b205-b0b4-5d72d005906d	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561b-b205-4589-bfe19fc38c84	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561b-b205-4fe6-006321124437	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561b-b205-257a-36b52e7b269f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561b-b205-c756-6892b51465d8	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561b-b205-a24e-2b3c6d17f581	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561b-b205-2d85-21d621cde330	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561b-b205-d3c1-de000d1bc05d	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561b-b205-24e5-57973ea3570a	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3064 (class 0 OID 21726394)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 21726366)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 21726406)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21726002)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-561b-b208-15ee-f838eb245c9d	00090000-561b-b208-27b4-220640fbaaa9	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-b208-1aed-b7089217dbe6	00090000-561b-b208-5a81-b78691e73c0f	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-b208-7199-b2c474707dcf	00090000-561b-b208-4780-0fa14871ade0	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-b208-211c-85eec72d4063	00090000-561b-b208-723c-1d762ee96a22	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-b208-8727-1678d9c81856	00090000-561b-b208-70b5-87f9dd17faab	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-b208-b399-6f387a42e906	00090000-561b-b208-c04a-c3707da8cd7e	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3023 (class 0 OID 21725838)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 21726110)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561b-b205-95ea-bc67e28d1ab7	01	Drama	drama (SURS 01)
00140000-561b-b205-5960-849e88af76df	02	Opera	opera (SURS 02)
00140000-561b-b205-8718-448bc89ec21f	03	Balet	balet (SURS 03)
00140000-561b-b205-4449-e256e9fa5121	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561b-b205-261d-a22c83ddb885	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561b-b205-d8cf-633058396c5e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561b-b205-57b3-3581026ea93a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3041 (class 0 OID 21725992)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2528 (class 2606 OID 21725613)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 21726169)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 21726159)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 21726026)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21726068)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 21726446)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 21725827)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 21725848)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 21726364)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21725738)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 21726237)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21725988)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 21725801)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21725776)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 21725752)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 21725895)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 21726423)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 21726430)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2782 (class 2606 OID 21726454)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2640 (class 2606 OID 21725922)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 21725710)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 21725622)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 21725646)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21725602)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2519 (class 2606 OID 21725587)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21725928)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 21725964)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 21726105)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21725674)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 21725698)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 21726316)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 21725901)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21725688)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 21725789)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21725913)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21726325)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 21726333)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 21726303)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 21726345)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21725946)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21725886)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21725877)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 21726092)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 21726019)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 21725764)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 21725558)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 21725955)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 21725576)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2521 (class 2606 OID 21725596)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 21725973)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 21725908)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21725857)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 21725546)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21725534)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 21725528)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 21726039)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 21725655)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21725868)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 21726079)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 21726357)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 21725723)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 21725571)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 21726138)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 21725811)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 21725936)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 21726051)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 21726404)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 21726388)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 21726412)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 21726010)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 21725842)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 21726118)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 21726000)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 1259 OID 21725836)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2593 (class 1259 OID 21725837)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2594 (class 1259 OID 21725835)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2595 (class 1259 OID 21725834)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2596 (class 1259 OID 21725833)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2682 (class 1259 OID 21726040)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2683 (class 1259 OID 21726041)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2684 (class 1259 OID 21726042)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2768 (class 1259 OID 21726425)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2769 (class 1259 OID 21726424)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2542 (class 1259 OID 21725676)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2641 (class 1259 OID 21725929)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2755 (class 1259 OID 21726392)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2756 (class 1259 OID 21726391)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2757 (class 1259 OID 21726393)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2758 (class 1259 OID 21726390)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2759 (class 1259 OID 21726389)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2635 (class 1259 OID 21725915)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2636 (class 1259 OID 21725914)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2587 (class 1259 OID 21725812)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 21725989)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 21725991)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 21725990)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2567 (class 1259 OID 21725754)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2568 (class 1259 OID 21725753)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2746 (class 1259 OID 21726346)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2698 (class 1259 OID 21726107)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 21726108)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2700 (class 1259 OID 21726109)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2765 (class 1259 OID 21726413)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2707 (class 1259 OID 21726143)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2708 (class 1259 OID 21726140)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2709 (class 1259 OID 21726144)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2710 (class 1259 OID 21726142)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2711 (class 1259 OID 21726141)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2557 (class 1259 OID 21725725)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 21725724)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2533 (class 1259 OID 21725649)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 21725956)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 21725603)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2524 (class 1259 OID 21725604)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 21725976)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 21725975)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 21725974)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 21725790)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 21725791)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2503 (class 1259 OID 21725536)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2615 (class 1259 OID 21725881)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2616 (class 1259 OID 21725879)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2617 (class 1259 OID 21725878)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2618 (class 1259 OID 21725880)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 21725577)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2515 (class 1259 OID 21725578)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2644 (class 1259 OID 21725937)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2778 (class 1259 OID 21726447)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2680 (class 1259 OID 21726028)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2681 (class 1259 OID 21726027)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2779 (class 1259 OID 21726455)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2780 (class 1259 OID 21726456)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2630 (class 1259 OID 21725902)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 21726020)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 21726021)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 21726242)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2729 (class 1259 OID 21726241)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2730 (class 1259 OID 21726238)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2731 (class 1259 OID 21726239)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2732 (class 1259 OID 21726240)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2546 (class 1259 OID 21725690)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 21725689)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2548 (class 1259 OID 21725691)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2647 (class 1259 OID 21725950)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2648 (class 1259 OID 21725949)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2738 (class 1259 OID 21726326)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 21726327)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2721 (class 1259 OID 21726173)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2722 (class 1259 OID 21726174)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2723 (class 1259 OID 21726171)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2724 (class 1259 OID 21726172)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 21726011)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 21725890)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2622 (class 1259 OID 21725889)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2623 (class 1259 OID 21725887)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2624 (class 1259 OID 21725888)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2717 (class 1259 OID 21726161)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 21726160)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2571 (class 1259 OID 21725765)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2574 (class 1259 OID 21725779)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2575 (class 1259 OID 21725778)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2576 (class 1259 OID 21725777)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2577 (class 1259 OID 21725780)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2586 (class 1259 OID 21725802)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 21726317)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2754 (class 1259 OID 21726365)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2772 (class 1259 OID 21726431)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2773 (class 1259 OID 21726432)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2529 (class 1259 OID 21725624)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2530 (class 1259 OID 21725623)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2538 (class 1259 OID 21725656)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 21725657)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2602 (class 1259 OID 21725843)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2610 (class 1259 OID 21725871)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2611 (class 1259 OID 21725870)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2612 (class 1259 OID 21725869)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2597 (class 1259 OID 21725829)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2598 (class 1259 OID 21725830)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2599 (class 1259 OID 21725828)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2600 (class 1259 OID 21725832)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2601 (class 1259 OID 21725831)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2545 (class 1259 OID 21725675)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 21725739)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 21725741)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2565 (class 1259 OID 21725740)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2566 (class 1259 OID 21725742)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2629 (class 1259 OID 21725896)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2703 (class 1259 OID 21726106)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 21726139)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 21726080)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2695 (class 1259 OID 21726081)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2536 (class 1259 OID 21725647)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21725648)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 21726001)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 21725547)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 21725711)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2506 (class 1259 OID 21725535)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2751 (class 1259 OID 21726358)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2651 (class 1259 OID 21725948)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 21725947)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2725 (class 1259 OID 21726170)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2553 (class 1259 OID 21725699)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 21726119)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2762 (class 1259 OID 21726405)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2744 (class 1259 OID 21726334)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 21726335)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2691 (class 1259 OID 21726069)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2609 (class 1259 OID 21725858)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2522 (class 1259 OID 21725597)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2813 (class 2606 OID 21726587)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2812 (class 2606 OID 21726592)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2808 (class 2606 OID 21726612)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2814 (class 2606 OID 21726582)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2810 (class 2606 OID 21726602)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2809 (class 2606 OID 21726607)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2811 (class 2606 OID 21726597)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2849 (class 2606 OID 21726777)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2848 (class 2606 OID 21726782)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 21726787)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2881 (class 2606 OID 21726952)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2882 (class 2606 OID 21726947)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 21726512)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 21726697)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2876 (class 2606 OID 21726932)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 21726927)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2875 (class 2606 OID 21726937)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 21726922)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2879 (class 2606 OID 21726917)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2829 (class 2606 OID 21726692)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2830 (class 2606 OID 21726687)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2807 (class 2606 OID 21726577)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2841 (class 2606 OID 21726737)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2839 (class 2606 OID 21726747)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2840 (class 2606 OID 21726742)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2800 (class 2606 OID 21726547)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2801 (class 2606 OID 21726542)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2827 (class 2606 OID 21726677)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 21726907)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2852 (class 2606 OID 21726792)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2851 (class 2606 OID 21726797)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2850 (class 2606 OID 21726802)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2880 (class 2606 OID 21726942)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2854 (class 2606 OID 21726822)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2857 (class 2606 OID 21726807)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2853 (class 2606 OID 21726827)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2855 (class 2606 OID 21726817)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2856 (class 2606 OID 21726812)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2798 (class 2606 OID 21726537)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2799 (class 2606 OID 21726532)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 21726497)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2791 (class 2606 OID 21726492)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2835 (class 2606 OID 21726717)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2787 (class 2606 OID 21726472)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2786 (class 2606 OID 21726477)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2836 (class 2606 OID 21726732)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2837 (class 2606 OID 21726727)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2838 (class 2606 OID 21726722)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2805 (class 2606 OID 21726562)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 21726567)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2783 (class 2606 OID 21726457)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2819 (class 2606 OID 21726652)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2821 (class 2606 OID 21726642)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2822 (class 2606 OID 21726637)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2820 (class 2606 OID 21726647)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2785 (class 2606 OID 21726462)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 21726467)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2832 (class 2606 OID 21726702)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2885 (class 2606 OID 21726967)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 21726772)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2846 (class 2606 OID 21726767)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2887 (class 2606 OID 21726972)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2886 (class 2606 OID 21726977)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 21726682)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2844 (class 2606 OID 21726757)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2843 (class 2606 OID 21726762)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2864 (class 2606 OID 21726882)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2865 (class 2606 OID 21726877)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2868 (class 2606 OID 21726862)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2867 (class 2606 OID 21726867)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2866 (class 2606 OID 21726872)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2796 (class 2606 OID 21726522)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2797 (class 2606 OID 21726517)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2795 (class 2606 OID 21726527)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2833 (class 2606 OID 21726712)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2834 (class 2606 OID 21726707)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 21726892)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2870 (class 2606 OID 21726897)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2861 (class 2606 OID 21726852)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2860 (class 2606 OID 21726857)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2863 (class 2606 OID 21726842)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2862 (class 2606 OID 21726847)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2842 (class 2606 OID 21726752)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2823 (class 2606 OID 21726672)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2824 (class 2606 OID 21726667)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2826 (class 2606 OID 21726657)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2825 (class 2606 OID 21726662)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2858 (class 2606 OID 21726837)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2859 (class 2606 OID 21726832)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2802 (class 2606 OID 21726552)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2803 (class 2606 OID 21726557)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 21726572)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2869 (class 2606 OID 21726887)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2872 (class 2606 OID 21726902)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2874 (class 2606 OID 21726912)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2884 (class 2606 OID 21726957)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2883 (class 2606 OID 21726962)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2788 (class 2606 OID 21726487)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 21726482)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2793 (class 2606 OID 21726502)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 21726507)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2815 (class 2606 OID 21726617)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2816 (class 2606 OID 21726632)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 21726627)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2818 (class 2606 OID 21726622)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-12 15:13:47 CEST

--
-- PostgreSQL database dump complete
--

