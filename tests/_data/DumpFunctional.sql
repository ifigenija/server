--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-10 16:38:47 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 242 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 242
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 18664758)
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
-- TOC entry 226 (class 1259 OID 18665277)
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
-- TOC entry 225 (class 1259 OID 18665260)
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
-- TOC entry 219 (class 1259 OID 18665168)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine text,
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 18665515)
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
-- TOC entry 195 (class 1259 OID 18664936)
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
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    allday boolean DEFAULT false NOT NULL,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 18664967)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 18665441)
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
-- TOC entry 190 (class 1259 OID 18664879)
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
-- TOC entry 227 (class 1259 OID 18665290)
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
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskkopr integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    obiskkoprint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovikopr integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponovikoprint integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    kpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
    stroskiostali numeric(15,2) DEFAULT 0::numeric,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    dnevprvzad numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
    zvrst character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 213 (class 1259 OID 18665100)
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
-- TOC entry 193 (class 1259 OID 18664915)
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
-- TOC entry 191 (class 1259 OID 18664896)
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
-- TOC entry 202 (class 1259 OID 18665014)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 18665496)
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
-- TOC entry 239 (class 1259 OID 18665508)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 18665530)
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
-- TOC entry 206 (class 1259 OID 18665039)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 18664853)
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
-- TOC entry 182 (class 1259 OID 18664767)
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
-- TOC entry 183 (class 1259 OID 18664778)
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
-- TOC entry 178 (class 1259 OID 18664732)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 18664751)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 18665046)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 18665080)
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
-- TOC entry 222 (class 1259 OID 18665209)
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
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 185 (class 1259 OID 18664811)
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
-- TOC entry 187 (class 1259 OID 18664845)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 18175925)
-- Name: postavkac2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkac2 (
    id uuid NOT NULL,
    skupina integer NOT NULL,
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
-- TOC entry 229 (class 1259 OID 18665388)
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
-- TOC entry 203 (class 1259 OID 18665020)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 18664830)
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
-- TOC entry 192 (class 1259 OID 18664908)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 18665032)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 18665402)
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
-- TOC entry 231 (class 1259 OID 18665412)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 18665345)
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
    stizvnekomerc integer,
    stizvprem integer,
    stizvponprem integer,
    stizvponpremdoma integer,
    stizvponpremzamejo integer,
    stizvponpremgost integer,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej integer,
    stizvponprejdoma integer,
    stizvponprejzamejo integer,
    stizvponprejgost integer,
    stizvponprejkopr integer,
    stizvponprejint integer,
    stizvponprejkoprint integer,
    stizvgostuj integer,
    stizvostalihnek integer,
    stizvgostovanjslo integer,
    stizvgostovanjzam integer,
    stizvgostovanjint integer,
    stobisknekom integer,
    stobisknekommat integer,
    stobisknekomgostslo integer,
    stobisknekomgostzam integer,
    stobisknekomgostint integer,
    stobiskprem integer,
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
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
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
-- TOC entry 232 (class 1259 OID 18665420)
-- Name: programskaenotasklopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programskaenotasklopa (
    id uuid NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    programrazno_id uuid
);


--
-- TOC entry 209 (class 1259 OID 18665061)
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
-- TOC entry 201 (class 1259 OID 18665005)
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
-- TOC entry 200 (class 1259 OID 18664995)
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
-- TOC entry 221 (class 1259 OID 18665198)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 18665135)
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
-- TOC entry 175 (class 1259 OID 18664703)
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
-- TOC entry 174 (class 1259 OID 18664701)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 18665074)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 18664741)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 18664725)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 18665088)
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
-- TOC entry 204 (class 1259 OID 18665026)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 18664972)
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
-- TOC entry 173 (class 1259 OID 18664690)
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
-- TOC entry 172 (class 1259 OID 18664682)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 18664677)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 18665145)
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
-- TOC entry 184 (class 1259 OID 18664803)
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
-- TOC entry 199 (class 1259 OID 18664982)
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
-- TOC entry 220 (class 1259 OID 18665186)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 18665430)
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
-- TOC entry 189 (class 1259 OID 18664865)
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
-- TOC entry 176 (class 1259 OID 18664712)
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
-- TOC entry 224 (class 1259 OID 18665235)
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
    maticnioder_id uuid
);


--
-- TOC entry 194 (class 1259 OID 18664926)
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
-- TOC entry 208 (class 1259 OID 18665053)
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
-- TOC entry 218 (class 1259 OID 18665159)
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
-- TOC entry 236 (class 1259 OID 18665476)
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
-- TOC entry 235 (class 1259 OID 18665448)
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
-- TOC entry 237 (class 1259 OID 18665488)
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
-- TOC entry 215 (class 1259 OID 18665125)
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
-- TOC entry 196 (class 1259 OID 18664962)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 18665225)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 18665115)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 18664706)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 18664758)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 18665277)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f1-95f6-6101-307d1a4b8986	000d0000-55f1-95f5-99de-09f2d6d3aed4	\N	00090000-55f1-95f5-e168-3ae4862218f6	000b0000-55f1-95f6-1fad-683772dd69e3	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f1-95f6-ce29-3c1515ed4b14	000d0000-55f1-95f5-1372-275410c16d7b	00100000-55f1-95f6-6c7b-d60f8b29e449	00090000-55f1-95f5-3bb4-5782f95a13ac	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f1-95f6-cde2-8ed9f3b388e5	000d0000-55f1-95f5-a9e5-d9482f325345	00100000-55f1-95f6-f996-3d26552bcba1	00090000-55f1-95f5-9a84-53d5cc05f339	\N	0003	t	\N	2015-09-10	\N	2	t	\N	f	f
000c0000-55f1-95f6-18da-863aaffbaeca	000d0000-55f1-95f5-119f-692c364bd8ab	\N	00090000-55f1-95f5-9db8-6815e0af23fe	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f1-95f6-25ac-5a69768208dc	000d0000-55f1-95f5-114d-669cdc9a8042	\N	00090000-55f1-95f5-3df9-0fdbf834609e	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f1-95f6-277c-1f82ba04b78f	000d0000-55f1-95f5-4831-839eb0f714de	\N	00090000-55f1-95f5-b27b-e96b600aed5c	000b0000-55f1-95f6-7449-b59421903d5a	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f1-95f6-282f-75c1aa49aa3b	000d0000-55f1-95f5-026a-18d1831a340c	00100000-55f1-95f6-0089-6d429426ab64	00090000-55f1-95f5-b5dd-43052439b259	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f1-95f6-525e-d6a824998184	000d0000-55f1-95f5-ff44-e3f9614cc373	\N	00090000-55f1-95f5-09ba-e166dc47ec03	000b0000-55f1-95f6-196d-6347ab80ecab	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f1-95f6-d1c6-ee0ebf3615b4	000d0000-55f1-95f5-026a-18d1831a340c	00100000-55f1-95f6-f1b2-eb74fd8c6592	00090000-55f1-95f5-ebb2-c0b7d9b9e792	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f1-95f6-e2ba-3ae7be2d3667	000d0000-55f1-95f5-026a-18d1831a340c	00100000-55f1-95f6-b7ab-d7a68d96fb24	00090000-55f1-95f5-624b-1f8d5ffe8dde	\N	0010	t	\N	2015-09-10	\N	16	f	\N	f	t
000c0000-55f1-95f6-c5a1-c59d8278c30e	000d0000-55f1-95f5-026a-18d1831a340c	00100000-55f1-95f6-8f59-48e7fd3025e7	00090000-55f1-95f5-922f-2ae68e458605	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f1-95f6-295e-a7f6584d58d9	000d0000-55f1-95f5-00f1-8aaf2cf1a542	\N	00090000-55f1-95f5-3bb4-5782f95a13ac	000b0000-55f1-95f6-4460-188d06a66f89	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2986 (class 0 OID 18665260)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 18665168)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f1-95f5-359c-4680927a81b8	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f1-95f5-ec5a-cd9a212cc639	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f1-95f5-2941-2b422d52f664	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 18665515)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 18664936)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f1-95f6-7805-ea60c58b0b2f	\N	\N	00200000-55f1-95f6-0c42-345f7e5a03f7	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		
00180000-55f1-95f6-3f67-60b71a6e3508	\N	\N	00200000-55f1-95f6-cbba-e30d2a6cf5d4	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		
00180000-55f1-95f6-b980-be91c360c096	\N	\N	00200000-55f1-95f6-7f43-c1aa3114d985	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		
00180000-55f1-95f6-608e-f78c4b953559	\N	\N	00200000-55f1-95f6-87a8-11c77c322e1c	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		
00180000-55f1-95f6-e61b-e9cd91e20e2b	\N	\N	00200000-55f1-95f6-cfb6-c6ea42cefc1d	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		
\.


--
-- TOC entry 2958 (class 0 OID 18664967)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 18665441)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 18664879)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f1-95f4-5ef5-ebad77a5a00e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f1-95f4-bbef-ad1aa50be922	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f1-95f4-5e16-553e5a159ec6	AL	ALB	008	Albania 	Albanija	\N
00040000-55f1-95f4-f38e-9485053200fe	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f1-95f4-6d72-4369a8f4c775	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f1-95f4-26bb-fed0e1cf40e7	AD	AND	020	Andorra 	Andora	\N
00040000-55f1-95f4-069d-e3701c8507e1	AO	AGO	024	Angola 	Angola	\N
00040000-55f1-95f4-6e15-74ec29fbf255	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f1-95f4-ba1e-8512df568665	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f1-95f4-fdef-88ce47cee6cc	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f1-95f4-7ee2-2e58edf05643	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f1-95f4-01ca-60337c0715b7	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f1-95f4-5dd7-2c5944d46f7e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f1-95f4-538f-1a012855dfe3	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f1-95f4-776f-e3562aca66ef	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f1-95f4-b36c-340ff8e73699	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f1-95f4-b936-182f8f389e5e	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f1-95f4-6c13-e2d3ffca851d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f1-95f4-2499-0e00ac4007de	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f1-95f4-60ff-8387a5951dce	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f1-95f4-828a-c1ed5915fc2d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f1-95f4-de56-fbfc4a99ddd6	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f1-95f4-c3ff-339accab0a30	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f1-95f4-5b47-11bf075896c9	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f1-95f4-dbde-39988bed69fb	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f1-95f4-42b2-c29b9b7c56ca	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f1-95f4-5fa4-2e77e5ebea8c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f1-95f4-2f39-9fc6672bd305	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f1-95f4-6cd7-c6893ccbf8cf	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f1-95f4-732a-d2bf5af2f241	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f1-95f4-ec43-2e7352940bc1	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f1-95f4-717a-6a218806cb1c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f1-95f4-ac09-3850f6a5a165	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f1-95f4-fbea-c2794d0c2e07	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f1-95f4-1043-1f67aa39a278	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f1-95f4-a14a-37f823fefe2f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f1-95f4-41e1-e25b4a8054fc	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f1-95f4-15a8-2ae0413251e6	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f1-95f4-1309-de688960fc0a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f1-95f4-cc16-13ccbcfe01d1	CA	CAN	124	Canada 	Kanada	\N
00040000-55f1-95f4-bcac-c0e15f34cbda	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f1-95f4-7422-d800e109e8bb	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f1-95f4-97de-a9121e4d0272	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f1-95f4-85dd-a8fe21bfd96e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f1-95f4-5597-143630d80b13	CL	CHL	152	Chile 	Čile	\N
00040000-55f1-95f4-36eb-82cf74a1b0f8	CN	CHN	156	China 	Kitajska	\N
00040000-55f1-95f4-204f-c59b1eefee88	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f1-95f4-e0e0-9a813e9fb5c7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f1-95f4-6ea8-2d1f8a3ef4c4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f1-95f4-d2a8-a97b4851a026	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f1-95f4-ddc1-b048805503ca	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f1-95f4-c409-019918706e51	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f1-95f4-33e5-3f7b5700ada7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f1-95f4-045c-5463585b8e2a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f1-95f4-4f78-6664f57eb15d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f1-95f4-903b-1795adb05b1f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f1-95f4-fe8c-e81c314f109c	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f1-95f4-719d-b075456e78f0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f1-95f4-9610-75c8f42f3028	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f1-95f4-5130-50acda5e0149	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f1-95f4-1c00-1ff0a268f10b	DK	DNK	208	Denmark 	Danska	\N
00040000-55f1-95f4-6844-b2aafd57148b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f1-95f4-0c7a-1644208af8d6	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f1-95f4-f768-8b49deb1b205	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f1-95f4-f67a-baad5ad0fe4a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f1-95f4-95d4-61b8a20bf229	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f1-95f4-0377-1fc4b0295095	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f1-95f4-9ca3-c1b6b855f782	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f1-95f4-287e-46aa2a22e391	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f1-95f4-acd4-ecbf3cfa745f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f1-95f4-a2e2-2c14b602f1c8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f1-95f4-6392-f2e813bc3469	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f1-95f4-b281-3c67a71b6007	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f1-95f4-7527-80e14013d228	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f1-95f4-9841-a70b168eacdb	FI	FIN	246	Finland 	Finska	\N
00040000-55f1-95f4-1d92-1d912201f217	FR	FRA	250	France 	Francija	\N
00040000-55f1-95f4-ed4a-a9ee64fc8d0a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f1-95f4-4da1-b7e67a22630f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f1-95f4-91d4-baff9f1ae952	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f1-95f4-a6a5-c68f3d085e42	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f1-95f4-9709-3903f94a134e	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f1-95f4-b613-1b2671db5774	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f1-95f4-df42-5843fdfb29f5	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f1-95f4-3ccd-8f5e736f0ef0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f1-95f4-a4ac-b57e7e239df8	GH	GHA	288	Ghana 	Gana	\N
00040000-55f1-95f4-8833-c1cea64b78d2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f1-95f4-2efe-0ad95f51af66	GR	GRC	300	Greece 	Grčija	\N
00040000-55f1-95f4-4ea4-7ab9e88a5441	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f1-95f4-932a-09865647466f	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f1-95f4-2b7a-080c24bc0a0c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f1-95f4-3833-6fb709149c1f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f1-95f4-6d07-0c553b972ac6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f1-95f4-6e24-787d3f6a196a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f1-95f4-c308-8f3ad5cb99e8	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f1-95f4-135b-ff0ede30a5d5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f1-95f4-f785-48a3d0c782b5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f1-95f4-31d3-1aa33f14592e	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f1-95f4-1456-ffcdd77fd7a0	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f1-95f4-d25e-22e5e5859c26	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f1-95f4-c2b5-e984f7035fbf	HN	HND	340	Honduras 	Honduras	\N
00040000-55f1-95f4-5d34-1c7ef2746ade	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f1-95f4-776a-5486030ecd23	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f1-95f4-92c1-9e348bcbf2e3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f1-95f4-44a7-c1407d37a6de	IN	IND	356	India 	Indija	\N
00040000-55f1-95f4-128c-5192b3512110	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f1-95f4-6a00-49221f39e6da	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f1-95f4-bdfa-caeb3a34e9f1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f1-95f4-0ea1-f1b1b11e36bc	IE	IRL	372	Ireland 	Irska	\N
00040000-55f1-95f4-a948-3ec6d24d2c53	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f1-95f4-c239-8aff2f92a6ad	IL	ISR	376	Israel 	Izrael	\N
00040000-55f1-95f4-4b81-05a2af1d1e60	IT	ITA	380	Italy 	Italija	\N
00040000-55f1-95f4-8bad-86ca902ccba5	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f1-95f4-4b74-82f2477c70da	JP	JPN	392	Japan 	Japonska	\N
00040000-55f1-95f4-d023-27323407793c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f1-95f4-05ed-639f094b943c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f1-95f4-fb31-d183d26655e8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f1-95f4-1f41-4f55318cf8fd	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f1-95f4-a732-84fa82747794	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f1-95f4-e625-6fc6e52afd80	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f1-95f4-1cd5-68b7051aaf0d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f1-95f4-c096-977f87847867	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f1-95f4-73bc-55e4b8283504	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f1-95f4-2694-9e00753fa394	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f1-95f4-fcbc-36e915f90dc3	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f1-95f4-6f18-72d0858ee400	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f1-95f4-7806-f52dfe8d5b71	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f1-95f4-3736-92b0e8f35740	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f1-95f4-910e-262130e00dd8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f1-95f4-2560-1a694f566275	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f1-95f4-2cbb-368cfc13be09	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f1-95f4-3417-f43181360c08	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f1-95f4-f1b1-6b9d8a7ddfee	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f1-95f4-5105-cb1df4ee89c4	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f1-95f4-dd4c-dbdbdf56f618	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f1-95f4-549b-e36ed195eb0e	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f1-95f4-963a-e0471ca1ecf9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f1-95f4-e2e8-b49043aa8162	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f1-95f4-426f-d998c656195b	ML	MLI	466	Mali 	Mali	\N
00040000-55f1-95f4-eeaa-70925f420737	MT	MLT	470	Malta 	Malta	\N
00040000-55f1-95f4-4334-f7f89bbeb1ff	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f1-95f4-acdc-8084e903b23a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f1-95f4-4184-61ef0835a4c1	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f1-95f4-c4aa-3398dad1170c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f1-95f4-83ed-f9250140601b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f1-95f4-a230-0ccb46ec56f4	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f1-95f4-5d02-09906a28e448	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f1-95f4-9867-46ff62f6a61e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f1-95f4-d14f-a12fe0645cfb	MC	MCO	492	Monaco 	Monako	\N
00040000-55f1-95f4-7d3b-dd99a4c8f73e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f1-95f4-8328-b5f143bdd87b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f1-95f4-2eb0-aa57868d4e26	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f1-95f4-a5c5-5fa09a411d16	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f1-95f4-b779-5b1440c8b852	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f1-95f4-f995-156404942dc2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f1-95f4-6925-727794c727f3	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f1-95f4-2227-e90046bde46b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f1-95f4-80bb-9874d09ef14f	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f1-95f4-27dc-f3bdcff960e2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f1-95f4-02a4-104d4d2b2294	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f1-95f4-7579-6ed4879422aa	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f1-95f4-ca2a-3bc74d76fc26	NE	NER	562	Niger 	Niger 	\N
00040000-55f1-95f4-49fb-70fe849e6a45	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f1-95f4-a8d7-b9060ddcd979	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f1-95f4-6d1f-5bdf951873bb	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f1-95f4-9ba9-a2eaad87a893	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f1-95f4-f71a-9661855d71a7	NO	NOR	578	Norway 	Norveška	\N
00040000-55f1-95f4-0121-324da64471bb	OM	OMN	512	Oman 	Oman	\N
00040000-55f1-95f4-fa43-a964d12a7c35	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f1-95f4-802a-583176f80e23	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f1-95f4-940a-8f7cfb4c4ace	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f1-95f4-00d4-809a172af6da	PA	PAN	591	Panama 	Panama	\N
00040000-55f1-95f4-8837-9e5db0bef726	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f1-95f4-47dd-99d30e2042f3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f1-95f4-00d7-3592007ff2e8	PE	PER	604	Peru 	Peru	\N
00040000-55f1-95f4-ec88-cab600fdf09a	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f1-95f4-37c5-86d4ba0742c3	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f1-95f4-e005-a92cdc867093	PL	POL	616	Poland 	Poljska	\N
00040000-55f1-95f4-5240-8eb1b5b80ab0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f1-95f4-9d59-fafc50df7dbe	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f1-95f4-2fc8-9dd448499cb4	QA	QAT	634	Qatar 	Katar	\N
00040000-55f1-95f4-7cb6-17c406e77eac	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f1-95f4-7ca4-4d5f145c9680	RO	ROU	642	Romania 	Romunija	\N
00040000-55f1-95f4-e380-4662926ef686	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f1-95f4-e2db-906fbde77826	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f1-95f4-9eca-6a5498b67db4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f1-95f4-332d-103067a0b3ea	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f1-95f4-27e3-3880136ba3a8	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f1-95f4-6b37-e323860b36e2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f1-95f4-7dc4-bb27a9844726	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f1-95f4-fefe-7e7d8cc038b7	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f1-95f4-7c83-2f0d98b9d373	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f1-95f4-5389-baeed4797a85	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f1-95f4-4f93-6a116755bcd5	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f1-95f4-c9ee-d3f5736f30ac	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f1-95f4-8a85-99cb60cf640e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f1-95f4-9793-002cbd4212af	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f1-95f4-47bd-ea0474e2680a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f1-95f4-a209-971dee2413de	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f1-95f4-df22-e21035d63243	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f1-95f4-6425-80d0f8d8ef59	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f1-95f4-46c5-1d91d8eaf27c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f1-95f4-d588-5323686d7141	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f1-95f4-b529-03e72859f7d2	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f1-95f4-d985-249ddcfe6f01	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f1-95f4-d469-f7596bccca33	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f1-95f4-41d8-01e3d28fc870	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f1-95f4-905f-ba5eceeab664	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f1-95f4-8ea1-c533cf3e448f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f1-95f4-0863-8bad9dedb257	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f1-95f4-d6c3-8c1592d5d66e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f1-95f4-a3b7-9a81e6f33119	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f1-95f4-2413-fcc01d1a1f95	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f1-95f4-bcec-7bdd955637a4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f1-95f4-7910-091f81a2df18	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f1-95f4-bc48-8e5340ddc302	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f1-95f4-3a29-0bb3ef88da9f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f1-95f4-a733-005844832b70	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f1-95f4-9f4b-475bebcbfc35	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f1-95f4-0b74-96b88646aa9a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f1-95f4-d768-c126eddfee78	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f1-95f4-3cf7-d1b5e1dea302	TH	THA	764	Thailand 	Tajska	\N
00040000-55f1-95f4-5e19-00f508fdf9f6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f1-95f4-7a59-9f3fe4d6103a	TG	TGO	768	Togo 	Togo	\N
00040000-55f1-95f4-c6e7-be09e5547d66	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f1-95f4-15d6-898b93257564	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f1-95f4-aa20-b9cd53334ca4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f1-95f4-ba53-f42a618c5698	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f1-95f4-5afd-8d3cfb7c7448	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f1-95f4-d16a-b7650bb47074	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f1-95f4-bb29-2c779e0a7c3a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f1-95f4-897e-33773ca0de4d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f1-95f4-198a-6e391809b582	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f1-95f4-32ef-461da1606912	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f1-95f4-7341-3803f6708ebb	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f1-95f4-b722-71046f998a9c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f1-95f4-73bf-aa57aa596a3d	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f1-95f4-fb08-18355f053513	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f1-95f4-88f0-1c5fb79eaea4	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f1-95f4-5b67-487a3526a5e9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f1-95f4-e568-41a96d180197	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f1-95f4-3ef2-17d852be03de	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f1-95f4-4db7-c851e476c8d3	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f1-95f4-6b1b-b5587474442a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f1-95f4-75cb-358e9ca106d9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f1-95f4-738e-a5982c1652ad	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f1-95f4-c6aa-154b6d8f80f1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f1-95f4-9245-e480c3da8b62	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f1-95f4-e608-3c57408892b8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f1-95f4-8748-130b2ac3532b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2988 (class 0 OID 18665290)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f1-95f6-8f7f-f17e293daf39	000e0000-55f1-95f5-f6f5-8026b921d8e1	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f1-95f4-435b-be6bf3084359	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f1-95f6-a2bd-e8fc6dcd1190	000e0000-55f1-95f5-b81b-2b102c1f0c86	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f1-95f4-520e-d240481b7987	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f1-95f6-a771-037e7ee08167	000e0000-55f1-95f5-d561-85d0de18ce4e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f1-95f4-435b-be6bf3084359	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f1-95f6-55ed-1dbff8cdce7b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f1-95f6-10d4-f3da23bd566d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 18665100)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f1-95f5-99de-09f2d6d3aed4	000e0000-55f1-95f5-b81b-2b102c1f0c86	000c0000-55f1-95f6-6101-307d1a4b8986	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f1-95f4-2e0c-4f45d48ad74f
000d0000-55f1-95f5-1372-275410c16d7b	000e0000-55f1-95f5-b81b-2b102c1f0c86	000c0000-55f1-95f6-ce29-3c1515ed4b14	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f1-95f4-b46d-d59585125947
000d0000-55f1-95f5-a9e5-d9482f325345	000e0000-55f1-95f5-b81b-2b102c1f0c86	000c0000-55f1-95f6-cde2-8ed9f3b388e5	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f1-95f4-2810-d93de8833deb
000d0000-55f1-95f5-119f-692c364bd8ab	000e0000-55f1-95f5-b81b-2b102c1f0c86	000c0000-55f1-95f6-18da-863aaffbaeca	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f1-95f4-ea98-e45759049ef5
000d0000-55f1-95f5-114d-669cdc9a8042	000e0000-55f1-95f5-b81b-2b102c1f0c86	000c0000-55f1-95f6-25ac-5a69768208dc	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f1-95f4-ea98-e45759049ef5
000d0000-55f1-95f5-4831-839eb0f714de	000e0000-55f1-95f5-b81b-2b102c1f0c86	000c0000-55f1-95f6-277c-1f82ba04b78f	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f1-95f4-2e0c-4f45d48ad74f
000d0000-55f1-95f5-026a-18d1831a340c	000e0000-55f1-95f5-b81b-2b102c1f0c86	000c0000-55f1-95f6-d1c6-ee0ebf3615b4	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f1-95f4-2e0c-4f45d48ad74f
000d0000-55f1-95f5-ff44-e3f9614cc373	000e0000-55f1-95f5-b81b-2b102c1f0c86	000c0000-55f1-95f6-525e-d6a824998184	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f1-95f4-5168-fdd27fede886
000d0000-55f1-95f5-00f1-8aaf2cf1a542	000e0000-55f1-95f5-b81b-2b102c1f0c86	000c0000-55f1-95f6-295e-a7f6584d58d9	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f1-95f4-00bb-45cc59f257eb
\.


--
-- TOC entry 2954 (class 0 OID 18664915)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 18664896)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f1-95f6-1c1e-7566fa51bbaf	00080000-55f1-95f5-7a50-3148d7461a46	00090000-55f1-95f5-624b-1f8d5ffe8dde	AK		igralka
\.


--
-- TOC entry 2963 (class 0 OID 18665014)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 18665496)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 18665508)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 18665530)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 18665039)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 18664853)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f1-95f4-d2c6-6bbbb5a02314	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f1-95f4-a854-4e8aeb7cef12	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f1-95f4-6ca6-17116571bade	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f1-95f4-c287-39b3ba7c39ae	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f1-95f4-6781-73cc04448c15	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f1-95f4-5041-a06d351602d4	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}s:4:"500s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f1-95f4-f0e1-4a5005b6b81c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f1-95f4-69f2-56beb590d901	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f1-95f4-391c-8f61179cdc44	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f1-95f4-a6a3-648be4611ee1	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f1-95f4-dc50-7beb92f27c12	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f1-95f4-d26d-11235ff60911	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f1-95f4-2aab-d3418bcfe7f4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f1-95f4-3e04-ed08c4f971f5	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f1-95f5-6fd3-dc154d476573	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f1-95f5-f32f-6ce6657f5737	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f1-95f5-2fe5-3a6f700bfda0	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f1-95f5-072d-1d30b86b8234	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f1-95f5-0fad-02ecd52d72b7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f1-95f6-8dac-ad0bcba290f6	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2943 (class 0 OID 18664767)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f1-95f5-2284-ee2319d9bd3f	00000000-55f1-95f5-6fd3-dc154d476573	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f1-95f5-252e-46ccb7e7719f	00000000-55f1-95f5-6fd3-dc154d476573	00010000-55f1-95f4-4c10-c2a4865a6f33	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f1-95f5-7435-e6c6007374cc	00000000-55f1-95f5-f32f-6ce6657f5737	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2944 (class 0 OID 18664778)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f1-95f5-e168-3ae4862218f6	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f1-95f5-9db8-6815e0af23fe	00010000-55f1-95f5-c22b-a20a80e3bba1	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f1-95f5-9a84-53d5cc05f339	00010000-55f1-95f5-8814-c93b9a2f633d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f1-95f5-ebb2-c0b7d9b9e792	00010000-55f1-95f5-ba93-f1f877cc348c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f1-95f5-3eb8-68184f38e94a	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f1-95f5-b27b-e96b600aed5c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f1-95f5-922f-2ae68e458605	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f1-95f5-b5dd-43052439b259	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f1-95f5-624b-1f8d5ffe8dde	00010000-55f1-95f5-8cfe-ec30b84a8100	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f1-95f5-3bb4-5782f95a13ac	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f1-95f5-aadf-93f008cbaffa	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f1-95f5-3df9-0fdbf834609e	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f1-95f5-09ba-e166dc47ec03	00010000-55f1-95f5-18d5-812098041dc5	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 18664732)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f1-95f4-d845-79d56471e235	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f1-95f4-7dfb-c4b75e6cb644	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f1-95f4-3742-8c5ab2998fa8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f1-95f4-739c-aeb478c4e4f3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f1-95f4-309f-a21a6d0cff9b	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f1-95f4-7caf-f7b585ce5207	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f1-95f4-0c06-b6f0fc95e5c4	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f1-95f4-59f2-335dac22e708	Abonma-read	Abonma - branje	f
00030000-55f1-95f4-4e94-ed81af9d0613	Abonma-write	Abonma - spreminjanje	f
00030000-55f1-95f4-72d7-265aaba05fd3	Alternacija-read	Alternacija - branje	f
00030000-55f1-95f4-3874-a423fca3bd5e	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f1-95f4-201e-317028aae260	Arhivalija-read	Arhivalija - branje	f
00030000-55f1-95f4-440d-8dc1392d54fa	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f1-95f4-0522-f84961bf2508	Besedilo-read	Besedilo - branje	f
00030000-55f1-95f4-a2e3-bb571c34e01b	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f1-95f4-5c15-7df35837ca13	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f1-95f4-2e3c-1fee7024e269	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f1-95f4-2807-13621206267c	Dogodek-read	Dogodek - branje	f
00030000-55f1-95f4-6113-c1604b527fc6	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f1-95f4-1553-55ca1d655687	DrugiVir-read	DrugiVir - branje	f
00030000-55f1-95f4-344d-61bf0669f4b1	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f1-95f4-2e9a-207c88700b46	Drzava-read	Drzava - branje	f
00030000-55f1-95f4-0ced-9182742edadd	Drzava-write	Drzava - spreminjanje	f
00030000-55f1-95f4-4026-b6288095fb3e	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f1-95f4-dbd9-3f2866070513	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f1-95f4-af77-6716f0fbe005	Funkcija-read	Funkcija - branje	f
00030000-55f1-95f4-85e7-e5bd5677bfdc	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f1-95f4-c480-87803b3e9faf	Gostovanje-read	Gostovanje - branje	f
00030000-55f1-95f4-6d39-dc2be465cc07	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f1-95f4-89a2-31963e5285fd	Gostujoca-read	Gostujoca - branje	f
00030000-55f1-95f4-6b0a-d0006b2a23de	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f1-95f4-69cd-ba33a6a269fc	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f1-95f4-65f1-8df29a658a1e	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f1-95f4-0a52-f1aeaa3cc604	Kupec-read	Kupec - branje	f
00030000-55f1-95f4-cebf-439036f9bc38	Kupec-write	Kupec - spreminjanje	f
00030000-55f1-95f4-ee3f-8a43123ca0a1	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f1-95f4-805f-b1bab18e6ff6	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f1-95f4-8de1-7773282f5cd6	Option-read	Option - branje	f
00030000-55f1-95f4-b771-c4c2c1fb2e39	Option-write	Option - spreminjanje	f
00030000-55f1-95f4-85f0-7fa3f8966b54	OptionValue-read	OptionValue - branje	f
00030000-55f1-95f4-1e63-7c8199b7ea98	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f1-95f4-28c1-ae1de2c65c64	Oseba-read	Oseba - branje	f
00030000-55f1-95f4-092f-ed4c3184587d	Oseba-write	Oseba - spreminjanje	f
00030000-55f1-95f4-be68-e6c71ef3d3fa	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f1-95f4-e99e-a8228444f5e4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f1-95f4-96a8-00fab60d08ea	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f1-95f4-a163-e8fbfcad7c33	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f1-95f4-16bd-4b77ebe77e42	Pogodba-read	Pogodba - branje	f
00030000-55f1-95f4-5559-fa7bdcf45b48	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f1-95f4-6eb2-780efc00f63f	Popa-read	Popa - branje	f
00030000-55f1-95f4-e75f-d2b555e44bfc	Popa-write	Popa - spreminjanje	f
00030000-55f1-95f4-0173-766b395d74d3	Posta-read	Posta - branje	f
00030000-55f1-95f4-b8f1-5c96f46418c3	Posta-write	Posta - spreminjanje	f
00030000-55f1-95f4-ea23-a4eac1828711	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f1-95f4-4d9a-d246ad95b179	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f1-95f4-c22c-1676f30195f4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f1-95f4-e60e-60a08c315480	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f1-95f4-b3b7-eb78beda3deb	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f1-95f4-f3ef-b9fdd835c7d4	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f1-95f4-e593-24adfaf749e9	Predstava-read	Predstava - branje	f
00030000-55f1-95f4-12bd-7234dba41004	Predstava-write	Predstava - spreminjanje	f
00030000-55f1-95f4-9330-237c8afcf4b8	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f1-95f4-4281-7d0810fe58d0	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f1-95f4-9ba2-614292d1f2c4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f1-95f4-5913-5881892458ca	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f1-95f4-5202-9ce8940b3aeb	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f1-95f4-07b5-0a118cad458b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f1-95f4-d3c6-0a184a5dee52	ProgramDela-read	ProgramDela - branje	f
00030000-55f1-95f4-ac8c-8c08bffee4b8	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f1-95f4-6866-6f61805bf1c8	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f1-95f4-7e78-2c80808804fc	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f1-95f4-0b73-056819e4e379	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f1-95f4-ec71-5dd857fab3e0	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f1-95f4-679c-59115b7339d7	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f1-95f4-57af-69a0db380895	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f1-95f4-791b-58b3e7f87e9b	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f1-95f4-bcc6-adf52102b729	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f1-95f4-2e63-2fea3857877e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f1-95f4-0bb6-5f7668b05942	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f1-95f4-800c-874e60f21205	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f1-95f4-b5e2-b626351d4ec4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f1-95f4-22e1-d17045524ff3	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f1-95f4-0743-c0e79cccb2f1	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f1-95f4-5a0c-506611cf2bcc	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f1-95f4-278d-0bb2e68fd4ba	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f1-95f4-7016-af573e691c7b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f1-95f4-18c0-7e2c7b97b31a	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f1-95f4-eb5f-d19bd912f8cf	Prostor-read	Prostor - branje	f
00030000-55f1-95f4-652c-2e51a703f591	Prostor-write	Prostor - spreminjanje	f
00030000-55f1-95f4-ebe0-369a38f1e0a3	Racun-read	Racun - branje	f
00030000-55f1-95f4-3a31-c863a9b0ea04	Racun-write	Racun - spreminjanje	f
00030000-55f1-95f4-57d0-90857db746db	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f1-95f4-5c9a-967a339cb8e4	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f1-95f4-e81f-c5d0ad432ce6	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f1-95f4-5041-663eb47d2ec4	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f1-95f4-93f9-5dae26ed74f8	Rekvizit-read	Rekvizit - branje	f
00030000-55f1-95f4-7cd4-0bc5e2345fe3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f1-95f4-5e71-37643658ff2a	Revizija-read	Revizija - branje	f
00030000-55f1-95f4-0224-dade106d652a	Revizija-write	Revizija - spreminjanje	f
00030000-55f1-95f4-b6da-9f4bd579178f	Rezervacija-read	Rezervacija - branje	f
00030000-55f1-95f4-6681-1dc1b20b250f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f1-95f4-e9b4-29781173d607	SedezniRed-read	SedezniRed - branje	f
00030000-55f1-95f4-5c21-3c5d79654ba3	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f1-95f4-b701-3eb72ee881bc	Sedez-read	Sedez - branje	f
00030000-55f1-95f4-0e2c-d04897c30e4b	Sedez-write	Sedez - spreminjanje	f
00030000-55f1-95f4-d498-dfd0e6b65767	Sezona-read	Sezona - branje	f
00030000-55f1-95f4-971a-d00e314948f9	Sezona-write	Sezona - spreminjanje	f
00030000-55f1-95f4-955d-940db5309f91	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f1-95f4-750b-922865503256	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f1-95f4-8974-612f1ebdfdea	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f1-95f4-e54c-ee191ad2d9b3	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f1-95f4-d3c4-71ba016892e7	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f1-95f4-dd9f-25903adad0b4	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f1-95f4-a067-839abf6e0be4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f1-95f4-a9b1-84b90592394a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f1-95f4-3004-076f37668953	Telefonska-read	Telefonska - branje	f
00030000-55f1-95f4-087f-b56ba9909ef1	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f1-95f4-d81d-60faa4ebfaf0	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f1-95f4-7dd7-b0611ba6fb8e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f1-95f4-0416-9e297b3a2f8f	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f1-95f4-9289-fa8b1bd78e1b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f1-95f4-5db7-358f4f33813b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f1-95f4-097b-e2fe8ab25a80	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f1-95f4-d763-5b5ada257a23	Trr-read	Trr - branje	f
00030000-55f1-95f4-751b-bb9d802d56f1	Trr-write	Trr - spreminjanje	f
00030000-55f1-95f4-38df-0da743d84387	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f1-95f4-22c7-6fe8bc9bd3bd	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f1-95f4-ff45-a3e1f99f4929	Vaja-read	Vaja - branje	f
00030000-55f1-95f4-8461-095f971be42f	Vaja-write	Vaja - spreminjanje	f
00030000-55f1-95f4-24c3-8d31cc2e8bcd	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f1-95f4-15d9-e4a5b31487b8	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f1-95f4-0027-29a9821bbb07	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f1-95f4-0a0a-b313dfaf779c	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f1-95f4-08df-79badf93ba68	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f1-95f4-af4e-d8dde3b5a6d5	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f1-95f4-d66a-0fa7d7959df7	Zasedenost-read	Zasedenost - branje	f
00030000-55f1-95f4-93e7-1b215d1a3b93	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f1-95f4-31cf-ec0943ebb1d8	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f1-95f4-eca9-acfa6a0bc6d7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f1-95f4-24bf-ed0b2294eac9	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f1-95f4-2814-d1fa646cbe89	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f1-95f4-efca-ba1dae448fb7	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f1-95f4-aeb8-d87bba653ba1	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f1-95f4-3928-f728efe3af79	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f1-95f4-ec75-9dc6ac0008be	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f1-95f4-f66a-666c7f48012e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f1-95f4-769f-fee3e97c3a6e	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f1-95f4-36d3-a31de64210eb	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f1-95f4-a13a-118f31d06cc8	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f1-95f4-77bc-27aa4c0ce394	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f1-95f4-c98d-163907ac2070	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f1-95f4-a057-efa7a44485fe	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f1-95f4-d5a2-78ae1a033467	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2941 (class 0 OID 18664751)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f1-95f4-6b9b-f590cd20c610	00030000-55f1-95f4-7dfb-c4b75e6cb644
00020000-55f1-95f4-add3-288c652b20a0	00030000-55f1-95f4-2e9a-207c88700b46
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-59f2-335dac22e708
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-4e94-ed81af9d0613
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-72d7-265aaba05fd3
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-3874-a423fca3bd5e
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-201e-317028aae260
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-2807-13621206267c
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-739c-aeb478c4e4f3
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-6113-c1604b527fc6
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-2e9a-207c88700b46
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-0ced-9182742edadd
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-af77-6716f0fbe005
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-85e7-e5bd5677bfdc
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-c480-87803b3e9faf
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-6d39-dc2be465cc07
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-89a2-31963e5285fd
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-6b0a-d0006b2a23de
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-69cd-ba33a6a269fc
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-65f1-8df29a658a1e
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-8de1-7773282f5cd6
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-85f0-7fa3f8966b54
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-28c1-ae1de2c65c64
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-092f-ed4c3184587d
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-6eb2-780efc00f63f
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-e75f-d2b555e44bfc
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-0173-766b395d74d3
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-b8f1-5c96f46418c3
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-b3b7-eb78beda3deb
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-f3ef-b9fdd835c7d4
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-e593-24adfaf749e9
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-12bd-7234dba41004
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-5202-9ce8940b3aeb
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-07b5-0a118cad458b
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-eb5f-d19bd912f8cf
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-652c-2e51a703f591
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-e81f-c5d0ad432ce6
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-5041-663eb47d2ec4
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-93f9-5dae26ed74f8
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-7cd4-0bc5e2345fe3
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-d498-dfd0e6b65767
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-971a-d00e314948f9
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-0416-9e297b3a2f8f
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-38df-0da743d84387
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-22c7-6fe8bc9bd3bd
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-ff45-a3e1f99f4929
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-8461-095f971be42f
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-d66a-0fa7d7959df7
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-93e7-1b215d1a3b93
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-31cf-ec0943ebb1d8
00020000-55f1-95f4-fabf-1882b2334dd8	00030000-55f1-95f4-24bf-ed0b2294eac9
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-59f2-335dac22e708
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-201e-317028aae260
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-2807-13621206267c
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-2e9a-207c88700b46
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-c480-87803b3e9faf
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-89a2-31963e5285fd
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-69cd-ba33a6a269fc
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-65f1-8df29a658a1e
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-8de1-7773282f5cd6
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-85f0-7fa3f8966b54
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-28c1-ae1de2c65c64
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-092f-ed4c3184587d
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-6eb2-780efc00f63f
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-0173-766b395d74d3
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-b3b7-eb78beda3deb
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-f3ef-b9fdd835c7d4
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-e593-24adfaf749e9
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-eb5f-d19bd912f8cf
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-e81f-c5d0ad432ce6
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-93f9-5dae26ed74f8
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-d498-dfd0e6b65767
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-3004-076f37668953
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-087f-b56ba9909ef1
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-d763-5b5ada257a23
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-751b-bb9d802d56f1
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-08df-79badf93ba68
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-af4e-d8dde3b5a6d5
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-31cf-ec0943ebb1d8
00020000-55f1-95f4-0d13-12baa9c4cbfe	00030000-55f1-95f4-24bf-ed0b2294eac9
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-59f2-335dac22e708
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-72d7-265aaba05fd3
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-201e-317028aae260
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-440d-8dc1392d54fa
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-0522-f84961bf2508
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-5c15-7df35837ca13
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-2807-13621206267c
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-2e9a-207c88700b46
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-af77-6716f0fbe005
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-c480-87803b3e9faf
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-89a2-31963e5285fd
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-69cd-ba33a6a269fc
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-8de1-7773282f5cd6
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-85f0-7fa3f8966b54
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-28c1-ae1de2c65c64
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-6eb2-780efc00f63f
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-0173-766b395d74d3
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-e593-24adfaf749e9
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-5202-9ce8940b3aeb
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-eb5f-d19bd912f8cf
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-e81f-c5d0ad432ce6
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-93f9-5dae26ed74f8
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-d498-dfd0e6b65767
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-0416-9e297b3a2f8f
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-ff45-a3e1f99f4929
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-d66a-0fa7d7959df7
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-31cf-ec0943ebb1d8
00020000-55f1-95f4-ee2b-e4ba315ab5e4	00030000-55f1-95f4-24bf-ed0b2294eac9
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-59f2-335dac22e708
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-4e94-ed81af9d0613
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-3874-a423fca3bd5e
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-201e-317028aae260
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-2807-13621206267c
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-2e9a-207c88700b46
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-c480-87803b3e9faf
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-89a2-31963e5285fd
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-8de1-7773282f5cd6
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-85f0-7fa3f8966b54
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-6eb2-780efc00f63f
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-0173-766b395d74d3
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-e593-24adfaf749e9
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-eb5f-d19bd912f8cf
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-e81f-c5d0ad432ce6
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-93f9-5dae26ed74f8
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-d498-dfd0e6b65767
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-0416-9e297b3a2f8f
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-31cf-ec0943ebb1d8
00020000-55f1-95f4-11e5-43cad536b255	00030000-55f1-95f4-24bf-ed0b2294eac9
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-59f2-335dac22e708
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-201e-317028aae260
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-2807-13621206267c
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-2e9a-207c88700b46
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-c480-87803b3e9faf
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-89a2-31963e5285fd
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-8de1-7773282f5cd6
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-85f0-7fa3f8966b54
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-6eb2-780efc00f63f
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-0173-766b395d74d3
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-e593-24adfaf749e9
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-eb5f-d19bd912f8cf
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-e81f-c5d0ad432ce6
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-93f9-5dae26ed74f8
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-d498-dfd0e6b65767
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-d81d-60faa4ebfaf0
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-3742-8c5ab2998fa8
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-0416-9e297b3a2f8f
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-31cf-ec0943ebb1d8
00020000-55f1-95f4-d26a-8a2ca12e006e	00030000-55f1-95f4-24bf-ed0b2294eac9
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-d845-79d56471e235
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-7dfb-c4b75e6cb644
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-3742-8c5ab2998fa8
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-739c-aeb478c4e4f3
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-309f-a21a6d0cff9b
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-7caf-f7b585ce5207
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0c06-b6f0fc95e5c4
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-59f2-335dac22e708
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-4e94-ed81af9d0613
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-72d7-265aaba05fd3
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-3874-a423fca3bd5e
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-201e-317028aae260
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-440d-8dc1392d54fa
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0522-f84961bf2508
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-a2e3-bb571c34e01b
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-5c15-7df35837ca13
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-2e3c-1fee7024e269
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-2807-13621206267c
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-6113-c1604b527fc6
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-2e9a-207c88700b46
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0ced-9182742edadd
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-1553-55ca1d655687
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-344d-61bf0669f4b1
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-4026-b6288095fb3e
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-dbd9-3f2866070513
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-af77-6716f0fbe005
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-85e7-e5bd5677bfdc
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-c480-87803b3e9faf
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-6d39-dc2be465cc07
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-89a2-31963e5285fd
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-6b0a-d0006b2a23de
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-69cd-ba33a6a269fc
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-65f1-8df29a658a1e
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0a52-f1aeaa3cc604
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-cebf-439036f9bc38
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-ee3f-8a43123ca0a1
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-805f-b1bab18e6ff6
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-8de1-7773282f5cd6
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-b771-c4c2c1fb2e39
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-85f0-7fa3f8966b54
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-1e63-7c8199b7ea98
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-28c1-ae1de2c65c64
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-092f-ed4c3184587d
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-be68-e6c71ef3d3fa
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-e99e-a8228444f5e4
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-96a8-00fab60d08ea
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-a163-e8fbfcad7c33
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-16bd-4b77ebe77e42
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-5559-fa7bdcf45b48
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-6eb2-780efc00f63f
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-e75f-d2b555e44bfc
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0173-766b395d74d3
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-b8f1-5c96f46418c3
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-ea23-a4eac1828711
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-4d9a-d246ad95b179
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-c22c-1676f30195f4
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-e60e-60a08c315480
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-b3b7-eb78beda3deb
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-f3ef-b9fdd835c7d4
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-e593-24adfaf749e9
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-12bd-7234dba41004
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-9330-237c8afcf4b8
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-4281-7d0810fe58d0
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-9ba2-614292d1f2c4
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-5913-5881892458ca
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-5202-9ce8940b3aeb
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-07b5-0a118cad458b
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-d3c6-0a184a5dee52
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-ac8c-8c08bffee4b8
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-6866-6f61805bf1c8
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-7e78-2c80808804fc
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0b73-056819e4e379
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-ec71-5dd857fab3e0
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-679c-59115b7339d7
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-57af-69a0db380895
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-791b-58b3e7f87e9b
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-bcc6-adf52102b729
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-2e63-2fea3857877e
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0bb6-5f7668b05942
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-800c-874e60f21205
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-b5e2-b626351d4ec4
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-22e1-d17045524ff3
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0743-c0e79cccb2f1
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-5a0c-506611cf2bcc
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-278d-0bb2e68fd4ba
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-7016-af573e691c7b
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-18c0-7e2c7b97b31a
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-eb5f-d19bd912f8cf
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-652c-2e51a703f591
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-ebe0-369a38f1e0a3
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-3a31-c863a9b0ea04
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-57d0-90857db746db
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-5c9a-967a339cb8e4
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-e81f-c5d0ad432ce6
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-5041-663eb47d2ec4
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-93f9-5dae26ed74f8
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-7cd4-0bc5e2345fe3
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-5e71-37643658ff2a
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0224-dade106d652a
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-b6da-9f4bd579178f
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-6681-1dc1b20b250f
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-e9b4-29781173d607
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-5c21-3c5d79654ba3
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-b701-3eb72ee881bc
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0e2c-d04897c30e4b
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-d498-dfd0e6b65767
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-971a-d00e314948f9
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-955d-940db5309f91
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-750b-922865503256
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-8974-612f1ebdfdea
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-e54c-ee191ad2d9b3
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-d3c4-71ba016892e7
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-dd9f-25903adad0b4
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-a067-839abf6e0be4
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-a9b1-84b90592394a
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-3004-076f37668953
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-087f-b56ba9909ef1
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-d81d-60faa4ebfaf0
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-7dd7-b0611ba6fb8e
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0416-9e297b3a2f8f
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-9289-fa8b1bd78e1b
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-5db7-358f4f33813b
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-097b-e2fe8ab25a80
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-d763-5b5ada257a23
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-751b-bb9d802d56f1
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-38df-0da743d84387
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-22c7-6fe8bc9bd3bd
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-ff45-a3e1f99f4929
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-8461-095f971be42f
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-24c3-8d31cc2e8bcd
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-15d9-e4a5b31487b8
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0027-29a9821bbb07
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-0a0a-b313dfaf779c
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-08df-79badf93ba68
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-af4e-d8dde3b5a6d5
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-d66a-0fa7d7959df7
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-93e7-1b215d1a3b93
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-31cf-ec0943ebb1d8
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-eca9-acfa6a0bc6d7
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-24bf-ed0b2294eac9
00020000-55f1-95f5-66db-5bff9157f13e	00030000-55f1-95f4-2814-d1fa646cbe89
\.


--
-- TOC entry 2968 (class 0 OID 18665046)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 18665080)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 18665209)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f1-95f6-1fad-683772dd69e3	00090000-55f1-95f5-e168-3ae4862218f6	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f1-95f6-7449-b59421903d5a	00090000-55f1-95f5-b27b-e96b600aed5c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f1-95f6-196d-6347ab80ecab	00090000-55f1-95f5-09ba-e166dc47ec03	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f1-95f6-4460-188d06a66f89	00090000-55f1-95f5-3bb4-5782f95a13ac	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2946 (class 0 OID 18664811)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f1-95f5-7a50-3148d7461a46	00040000-55f1-95f4-b529-03e72859f7d2	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-95f5-2b9d-7c34e1347e28	00040000-55f1-95f4-b529-03e72859f7d2	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f1-95f5-b1d4-b48e7848a52c	00040000-55f1-95f4-b529-03e72859f7d2	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-95f5-be8f-a4e5614182f6	00040000-55f1-95f4-b529-03e72859f7d2	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-95f5-e0db-c60a9f2fbfce	00040000-55f1-95f4-b529-03e72859f7d2	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-95f5-5d54-eab7b4f6b743	00040000-55f1-95f4-7ee2-2e58edf05643	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-95f5-3d34-4d9e71c426a7	00040000-55f1-95f4-903b-1795adb05b1f	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-95f5-ca13-5134dbb7efba	00040000-55f1-95f4-776f-e3562aca66ef	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-95f5-a141-34ebb7784081	00040000-55f1-95f4-3ccd-8f5e736f0ef0	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-95f6-edbb-d145d2426dde	00040000-55f1-95f4-b529-03e72859f7d2	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2948 (class 0 OID 18664845)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f1-95f3-efcf-0f4eee4f63ee	8341	Adlešiči
00050000-55f1-95f3-5406-dbb95da779ff	5270	Ajdovščina
00050000-55f1-95f3-b9cb-893e56946e59	6280	Ankaran/Ancarano
00050000-55f1-95f3-e9c5-fa99e6b02eda	9253	Apače
00050000-55f1-95f3-1374-ddb266384656	8253	Artiče
00050000-55f1-95f3-82b0-4d9b42ba043d	4275	Begunje na Gorenjskem
00050000-55f1-95f3-2ca5-91d80ea3285d	1382	Begunje pri Cerknici
00050000-55f1-95f3-17e0-b18c5b20ac9c	9231	Beltinci
00050000-55f1-95f3-b156-578ce8e980b4	2234	Benedikt
00050000-55f1-95f3-2002-15d2e409982b	2345	Bistrica ob Dravi
00050000-55f1-95f3-d112-4cfe207f2f1c	3256	Bistrica ob Sotli
00050000-55f1-95f3-7e91-331ad8160a58	8259	Bizeljsko
00050000-55f1-95f3-e3fc-a70eefd14545	1223	Blagovica
00050000-55f1-95f3-17f0-2abbe051579d	8283	Blanca
00050000-55f1-95f3-4568-40e07c699078	4260	Bled
00050000-55f1-95f3-c921-bfb968fda876	4273	Blejska Dobrava
00050000-55f1-95f3-dc22-42e26681010c	9265	Bodonci
00050000-55f1-95f3-d1e5-bb4d04dfa098	9222	Bogojina
00050000-55f1-95f3-1117-e89dc1347976	4263	Bohinjska Bela
00050000-55f1-95f3-bb78-af0097d4fdc3	4264	Bohinjska Bistrica
00050000-55f1-95f3-c6a0-b6dd4a916a64	4265	Bohinjsko jezero
00050000-55f1-95f3-b822-ad23f04adfa7	1353	Borovnica
00050000-55f1-95f3-8483-2a42256dc7a3	8294	Boštanj
00050000-55f1-95f3-30f7-e4ce0160caab	5230	Bovec
00050000-55f1-95f3-bd5b-e3ab31efea41	5295	Branik
00050000-55f1-95f3-975f-0bbb42eb5669	3314	Braslovče
00050000-55f1-95f3-5fe7-63616e43367e	5223	Breginj
00050000-55f1-95f3-4cc2-6d5f1a5ecf9e	8280	Brestanica
00050000-55f1-95f3-b251-27447c568afa	2354	Bresternica
00050000-55f1-95f3-8b00-a9bb1bfb7eba	4243	Brezje
00050000-55f1-95f3-34ea-f05647c0ad05	1351	Brezovica pri Ljubljani
00050000-55f1-95f3-fd7e-501bbfc31b38	8250	Brežice
00050000-55f1-95f3-df75-876083b23483	4210	Brnik - Aerodrom
00050000-55f1-95f3-bd7e-b5f8f21c810d	8321	Brusnice
00050000-55f1-95f3-ce1b-1173a2d475ae	3255	Buče
00050000-55f1-95f3-cd6a-83e4c02354e4	8276	Bučka 
00050000-55f1-95f3-11b2-bcdb259aef7b	9261	Cankova
00050000-55f1-95f3-9f16-c325fe9a981e	3000	Celje 
00050000-55f1-95f3-be1c-4f7156886a52	3001	Celje - poštni predali
00050000-55f1-95f3-0056-870d8f5d03ef	4207	Cerklje na Gorenjskem
00050000-55f1-95f3-971e-5a3a5c5b3446	8263	Cerklje ob Krki
00050000-55f1-95f3-9d85-1d196e92d77e	1380	Cerknica
00050000-55f1-95f3-1b80-934095b9475a	5282	Cerkno
00050000-55f1-95f3-0757-39f334d4c6be	2236	Cerkvenjak
00050000-55f1-95f3-d712-5227e7b5d2d0	2215	Ceršak
00050000-55f1-95f3-efca-c631acaa17c5	2326	Cirkovce
00050000-55f1-95f3-779c-951058808bd2	2282	Cirkulane
00050000-55f1-95f3-685b-697052337ea1	5273	Col
00050000-55f1-95f3-6de8-c7743aa70d08	8251	Čatež ob Savi
00050000-55f1-95f3-0bd9-b258fcdee28b	1413	Čemšenik
00050000-55f1-95f3-d009-e8bd4414592c	5253	Čepovan
00050000-55f1-95f3-ab47-a271605e2bdd	9232	Črenšovci
00050000-55f1-95f3-6dda-1b51c8ada604	2393	Črna na Koroškem
00050000-55f1-95f3-3816-cb4c3d4bcc60	6275	Črni Kal
00050000-55f1-95f3-44e1-f8bb7edd7671	5274	Črni Vrh nad Idrijo
00050000-55f1-95f3-cc59-b70fd9c29981	5262	Črniče
00050000-55f1-95f3-0ca6-f1629a3b967e	8340	Črnomelj
00050000-55f1-95f3-038a-2cb5104f7d58	6271	Dekani
00050000-55f1-95f3-7df4-05a78dfdc3d5	5210	Deskle
00050000-55f1-95f3-9919-bac3851313f7	2253	Destrnik
00050000-55f1-95f3-5ab0-46d9d35f351a	6215	Divača
00050000-55f1-95f3-7d61-dc2c8582bc08	1233	Dob
00050000-55f1-95f3-b217-1b865439b83d	3224	Dobje pri Planini
00050000-55f1-95f3-35e7-27c6ea005ccc	8257	Dobova
00050000-55f1-95f3-935b-5f1faa7e6e18	1423	Dobovec
00050000-55f1-95f3-0f34-a9be4efc4d3c	5263	Dobravlje
00050000-55f1-95f3-7114-af2bd9e6de27	3204	Dobrna
00050000-55f1-95f3-6c89-0ba67a79867a	8211	Dobrnič
00050000-55f1-95f3-851d-f607b7bd9ee6	1356	Dobrova
00050000-55f1-95f3-e4ea-3ca3e694fea7	9223	Dobrovnik/Dobronak 
00050000-55f1-95f3-97f5-800a71d27b43	5212	Dobrovo v Brdih
00050000-55f1-95f3-5877-9f0c9df0563d	1431	Dol pri Hrastniku
00050000-55f1-95f3-aa8c-51bf2e3306e3	1262	Dol pri Ljubljani
00050000-55f1-95f3-c3bd-2c77e3ee96e0	1273	Dole pri Litiji
00050000-55f1-95f3-b13d-c1a7a39fc1be	1331	Dolenja vas
00050000-55f1-95f3-77e4-a23246b65a2c	8350	Dolenjske Toplice
00050000-55f1-95f3-2285-e24fb66d027e	1230	Domžale
00050000-55f1-95f3-90a2-55eec54ef413	2252	Dornava
00050000-55f1-95f3-113e-af695809d1a2	5294	Dornberk
00050000-55f1-95f3-d9bc-80202e58765d	1319	Draga
00050000-55f1-95f3-9adb-383379c72b49	8343	Dragatuš
00050000-55f1-95f3-691f-b1abff7705b2	3222	Dramlje
00050000-55f1-95f3-c10d-b539150e7708	2370	Dravograd
00050000-55f1-95f3-a19f-1af74af58614	4203	Duplje
00050000-55f1-95f3-a0d3-1c702a54a10f	6221	Dutovlje
00050000-55f1-95f3-9a67-27393dcad251	8361	Dvor
00050000-55f1-95f3-b571-5a947486bfda	2343	Fala
00050000-55f1-95f3-c4f4-4affa7d6297c	9208	Fokovci
00050000-55f1-95f3-00dd-0808de350287	2313	Fram
00050000-55f1-95f3-1f88-9037b70aa4d3	3213	Frankolovo
00050000-55f1-95f3-d4a6-755cd3617f0b	1274	Gabrovka
00050000-55f1-95f3-4744-93c33e81638a	8254	Globoko
00050000-55f1-95f3-1c6b-e5bd1a9ff317	5275	Godovič
00050000-55f1-95f3-f4f2-6bfa98ad3f2b	4204	Golnik
00050000-55f1-95f3-69ed-be57506e16bd	3303	Gomilsko
00050000-55f1-95f3-e449-88840a1f5d3f	4224	Gorenja vas
00050000-55f1-95f3-82fa-aee40aaca059	3263	Gorica pri Slivnici
00050000-55f1-95f3-afc3-1eec0266fcb2	2272	Gorišnica
00050000-55f1-95f3-cc67-23308d86584d	9250	Gornja Radgona
00050000-55f1-95f3-a0e2-8cc3d7781036	3342	Gornji Grad
00050000-55f1-95f3-43b4-fd163b7c2013	4282	Gozd Martuljek
00050000-55f1-95f3-2a95-b91905163032	6272	Gračišče
00050000-55f1-95f3-833a-b6b799bf2681	9264	Grad
00050000-55f1-95f3-ead4-c333071f1da7	8332	Gradac
00050000-55f1-95f3-5ec2-381e59ebf564	1384	Grahovo
00050000-55f1-95f3-8e2d-1a90d2c1d91d	5242	Grahovo ob Bači
00050000-55f1-95f3-06bb-73e360d2b707	5251	Grgar
00050000-55f1-95f3-52da-abedf4e4760d	3302	Griže
00050000-55f1-95f3-0916-a18548902aea	3231	Grobelno
00050000-55f1-95f3-cc8c-b143ea25c937	1290	Grosuplje
00050000-55f1-95f3-faef-67c632a82488	2288	Hajdina
00050000-55f1-95f3-9547-210374256955	8362	Hinje
00050000-55f1-95f3-a758-1d67d63ad164	2311	Hoče
00050000-55f1-95f3-e027-3e7d9fa61713	9205	Hodoš/Hodos
00050000-55f1-95f3-30a5-3d2f9b5d33da	1354	Horjul
00050000-55f1-95f3-b562-1ce3441cc3ad	1372	Hotedršica
00050000-55f1-95f3-9f2d-c9b9d3a994fe	1430	Hrastnik
00050000-55f1-95f3-43b6-04e567c95f40	6225	Hruševje
00050000-55f1-95f3-0fc8-c666d25be123	4276	Hrušica
00050000-55f1-95f3-2042-c3a3b142adf5	5280	Idrija
00050000-55f1-95f3-63a7-d73f596a94b2	1292	Ig
00050000-55f1-95f3-84e9-84ef2fc1cbf2	6250	Ilirska Bistrica
00050000-55f1-95f3-8540-42ed6236fe02	6251	Ilirska Bistrica-Trnovo
00050000-55f1-95f4-6a14-04546d7ad8fa	1295	Ivančna Gorica
00050000-55f1-95f4-7405-2412df107504	2259	Ivanjkovci
00050000-55f1-95f4-913d-f7b261886a8b	1411	Izlake
00050000-55f1-95f4-75c6-52abcd912935	6310	Izola/Isola
00050000-55f1-95f4-9899-d158a51ac45b	2222	Jakobski Dol
00050000-55f1-95f4-8a3d-82eaf6a67576	2221	Jarenina
00050000-55f1-95f4-4e53-e5e436ffdec9	6254	Jelšane
00050000-55f1-95f4-d7a6-ca70e8ea00d0	4270	Jesenice
00050000-55f1-95f4-535e-d5fc29e8198c	8261	Jesenice na Dolenjskem
00050000-55f1-95f4-c786-b7691617a94a	3273	Jurklošter
00050000-55f1-95f4-3377-7b4944c76154	2223	Jurovski Dol
00050000-55f1-95f4-7dc6-9b1a06f1dd9c	2256	Juršinci
00050000-55f1-95f4-5656-a5dbd961a627	5214	Kal nad Kanalom
00050000-55f1-95f4-655b-be40a4c9f1b6	3233	Kalobje
00050000-55f1-95f4-45bb-0cf217f11b12	4246	Kamna Gorica
00050000-55f1-95f4-d347-9b32e8189bc4	2351	Kamnica
00050000-55f1-95f4-8e0a-54bbaf91d334	1241	Kamnik
00050000-55f1-95f4-05f2-4b06cb7fd7d5	5213	Kanal
00050000-55f1-95f4-fd9f-8063941814f8	8258	Kapele
00050000-55f1-95f4-56f9-01cc76599126	2362	Kapla
00050000-55f1-95f4-52ab-9232039a86b7	2325	Kidričevo
00050000-55f1-95f4-ef60-61e7a6c77f5d	1412	Kisovec
00050000-55f1-95f4-3c15-6680969abd4f	6253	Knežak
00050000-55f1-95f4-ac33-4849c84783be	5222	Kobarid
00050000-55f1-95f4-586f-597ef9bb36b9	9227	Kobilje
00050000-55f1-95f4-282d-ac67e2e0e8a7	1330	Kočevje
00050000-55f1-95f4-ebed-e79beb0454ff	1338	Kočevska Reka
00050000-55f1-95f4-120e-4eab7527f572	2276	Kog
00050000-55f1-95f4-f0eb-f9e422cc46a9	5211	Kojsko
00050000-55f1-95f4-2547-1386364a085f	6223	Komen
00050000-55f1-95f4-6f1d-380f5a9cc34a	1218	Komenda
00050000-55f1-95f4-47bd-c5f6f33e199e	6000	Koper/Capodistria 
00050000-55f1-95f4-e589-8715c61b00e3	6001	Koper/Capodistria - poštni predali
00050000-55f1-95f4-8619-0255248b2430	8282	Koprivnica
00050000-55f1-95f4-4f31-482eca6224f9	5296	Kostanjevica na Krasu
00050000-55f1-95f4-3f9d-4a71d381373e	8311	Kostanjevica na Krki
00050000-55f1-95f4-047b-422ba05e3c40	1336	Kostel
00050000-55f1-95f4-5630-1f88ba08183f	6256	Košana
00050000-55f1-95f4-8aee-890c81aacaca	2394	Kotlje
00050000-55f1-95f4-1d82-048f377b7b36	6240	Kozina
00050000-55f1-95f4-9906-175853e60068	3260	Kozje
00050000-55f1-95f4-27a0-553f8c6fad30	4000	Kranj 
00050000-55f1-95f4-b518-546e9f26e245	4001	Kranj - poštni predali
00050000-55f1-95f4-8285-b6b8334b69da	4280	Kranjska Gora
00050000-55f1-95f4-db1d-c799fd3468ee	1281	Kresnice
00050000-55f1-95f4-5441-04bc6a7607a6	4294	Križe
00050000-55f1-95f4-70d5-fa83f04794b0	9206	Križevci
00050000-55f1-95f4-1414-5ac9bf210af5	9242	Križevci pri Ljutomeru
00050000-55f1-95f4-3757-6086dfb39582	1301	Krka
00050000-55f1-95f4-744a-936a55ea7483	8296	Krmelj
00050000-55f1-95f4-7c28-a99d3dc2067b	4245	Kropa
00050000-55f1-95f4-064b-a12954f29d42	8262	Krška vas
00050000-55f1-95f4-49e4-513ec9837c54	8270	Krško
00050000-55f1-95f4-ff03-187cba31030a	9263	Kuzma
00050000-55f1-95f4-e680-d357de42cf97	2318	Laporje
00050000-55f1-95f4-9bbc-17b345d81286	3270	Laško
00050000-55f1-95f4-31a4-f7c207aa1f63	1219	Laze v Tuhinju
00050000-55f1-95f4-c13c-f227a2547ba0	2230	Lenart v Slovenskih goricah
00050000-55f1-95f4-99da-1febd41ee7fc	9220	Lendava/Lendva
00050000-55f1-95f4-1896-00dbe9b71f63	4248	Lesce
00050000-55f1-95f4-27b2-bd5ba93bb24a	3261	Lesično
00050000-55f1-95f4-8809-f4bdb319f650	8273	Leskovec pri Krškem
00050000-55f1-95f4-5eec-036cdda46634	2372	Libeliče
00050000-55f1-95f4-e8f9-172cd302f749	2341	Limbuš
00050000-55f1-95f4-333d-f18460235b1e	1270	Litija
00050000-55f1-95f4-2c9b-1a043fc415e6	3202	Ljubečna
00050000-55f1-95f4-ed87-1e8861737eac	1000	Ljubljana 
00050000-55f1-95f4-05c8-0ff2b064335d	1001	Ljubljana - poštni predali
00050000-55f1-95f4-9e2c-eb708bf11504	1231	Ljubljana - Črnuče
00050000-55f1-95f4-17f6-74a5b3a3a0fd	1261	Ljubljana - Dobrunje
00050000-55f1-95f4-5dad-1df153f67e22	1260	Ljubljana - Polje
00050000-55f1-95f4-b121-c08f58b2f40f	1210	Ljubljana - Šentvid
00050000-55f1-95f4-ce16-a4d802b4e084	1211	Ljubljana - Šmartno
00050000-55f1-95f4-ffe5-aaa463cb6b43	3333	Ljubno ob Savinji
00050000-55f1-95f4-092a-a879f5290e35	9240	Ljutomer
00050000-55f1-95f4-ab62-d58b0df853cd	3215	Loče
00050000-55f1-95f4-4019-66a58c4b6e09	5231	Log pod Mangartom
00050000-55f1-95f4-03c6-b84d64d1a909	1358	Log pri Brezovici
00050000-55f1-95f4-f4f2-4ced547aaa1e	1370	Logatec
00050000-55f1-95f4-64f8-55c52ba84c58	1371	Logatec
00050000-55f1-95f4-28b4-22e4e8f51061	1434	Loka pri Zidanem Mostu
00050000-55f1-95f4-7c36-ed87b9edeeb1	3223	Loka pri Žusmu
00050000-55f1-95f4-a4d1-022abc2d9ec2	6219	Lokev
00050000-55f1-95f4-233f-f41110df054a	1318	Loški Potok
00050000-55f1-95f4-e053-68a51453820b	2324	Lovrenc na Dravskem polju
00050000-55f1-95f4-6a1f-db4ff9af894f	2344	Lovrenc na Pohorju
00050000-55f1-95f4-3540-f68a30767e08	3334	Luče
00050000-55f1-95f4-a7ef-ba599b34aa8f	1225	Lukovica
00050000-55f1-95f4-fa5f-4d73103a8138	9202	Mačkovci
00050000-55f1-95f4-4dee-e42e354ebf51	2322	Majšperk
00050000-55f1-95f4-fd1d-b8d4ffb418e8	2321	Makole
00050000-55f1-95f4-a65c-bc244ab62d46	9243	Mala Nedelja
00050000-55f1-95f4-78bd-596cce8ddbef	2229	Malečnik
00050000-55f1-95f4-b64a-8f45841d99be	6273	Marezige
00050000-55f1-95f4-bb2a-ed78389765f2	2000	Maribor 
00050000-55f1-95f4-4e85-aa1ead74d02b	2001	Maribor - poštni predali
00050000-55f1-95f4-cf59-5e1ee3d9fa80	2206	Marjeta na Dravskem polju
00050000-55f1-95f4-d4b8-7cb6d5de7a41	2281	Markovci
00050000-55f1-95f4-860a-d490aaa79a52	9221	Martjanci
00050000-55f1-95f4-6657-14d17192b647	6242	Materija
00050000-55f1-95f4-0069-f28eb112411c	4211	Mavčiče
00050000-55f1-95f4-20fd-9fc5f28dec3a	1215	Medvode
00050000-55f1-95f4-3153-7999111ef182	1234	Mengeš
00050000-55f1-95f4-6a24-ed16f41b1705	8330	Metlika
00050000-55f1-95f4-f152-eae09f8fd506	2392	Mežica
00050000-55f1-95f4-5ba1-f483876e2fc1	2204	Miklavž na Dravskem polju
00050000-55f1-95f4-e8d4-17f5bb8ba240	2275	Miklavž pri Ormožu
00050000-55f1-95f4-7f2e-1b26dfeef55c	5291	Miren
00050000-55f1-95f4-699a-f001cdb2e117	8233	Mirna
00050000-55f1-95f4-06ef-3aacba70e363	8216	Mirna Peč
00050000-55f1-95f4-275b-31956c305e56	2382	Mislinja
00050000-55f1-95f4-5881-d12245e6c0ce	4281	Mojstrana
00050000-55f1-95f4-8f35-4552cd1cd52d	8230	Mokronog
00050000-55f1-95f4-eabe-b20162701dd8	1251	Moravče
00050000-55f1-95f4-6199-e860c393cf89	9226	Moravske Toplice
00050000-55f1-95f4-4364-588d0d5c265e	5216	Most na Soči
00050000-55f1-95f4-697b-8634c74c30e0	1221	Motnik
00050000-55f1-95f4-f6e9-02083478d00a	3330	Mozirje
00050000-55f1-95f4-5dc9-49fa550110ad	9000	Murska Sobota 
00050000-55f1-95f4-22a1-30d660ea08ce	9001	Murska Sobota - poštni predali
00050000-55f1-95f4-9721-a5667f37a3aa	2366	Muta
00050000-55f1-95f4-cad3-67f12c35ef9d	4202	Naklo
00050000-55f1-95f4-bb6d-cec88fa5134f	3331	Nazarje
00050000-55f1-95f4-2331-bccc4f344127	1357	Notranje Gorice
00050000-55f1-95f4-c7c7-cd0b52f1aa55	3203	Nova Cerkev
00050000-55f1-95f4-ead2-7c5bbbe86544	5000	Nova Gorica 
00050000-55f1-95f4-d2ac-ef83ae5af2f7	5001	Nova Gorica - poštni predali
00050000-55f1-95f4-cb4c-45faf2cc60f6	1385	Nova vas
00050000-55f1-95f4-775b-3a8b06440808	8000	Novo mesto
00050000-55f1-95f4-c355-779de96eca7b	8001	Novo mesto - poštni predali
00050000-55f1-95f4-af27-0f2ef1809633	6243	Obrov
00050000-55f1-95f4-ceb2-49125cfec513	9233	Odranci
00050000-55f1-95f4-93df-1b22377607f2	2317	Oplotnica
00050000-55f1-95f4-0f11-8e723fc3c780	2312	Orehova vas
00050000-55f1-95f4-1849-63d4111cae2c	2270	Ormož
00050000-55f1-95f4-e54a-f0b5976bed34	1316	Ortnek
00050000-55f1-95f4-96d9-b67ceba2aad4	1337	Osilnica
00050000-55f1-95f4-56e9-3e17b83067b6	8222	Otočec
00050000-55f1-95f4-685d-b34b5af631cd	2361	Ožbalt
00050000-55f1-95f4-f819-ea73ebd2ca49	2231	Pernica
00050000-55f1-95f4-48ed-b6bf16242160	2211	Pesnica pri Mariboru
00050000-55f1-95f4-f275-c8895f027eb7	9203	Petrovci
00050000-55f1-95f4-c9a6-82f8b905ecb1	3301	Petrovče
00050000-55f1-95f4-77a4-bdb91f7eaac1	6330	Piran/Pirano
00050000-55f1-95f4-c72a-2e81969f105e	8255	Pišece
00050000-55f1-95f4-e9b6-8a0466190aa0	6257	Pivka
00050000-55f1-95f4-8b88-698ba1241238	6232	Planina
00050000-55f1-95f4-6a17-326593c473a8	3225	Planina pri Sevnici
00050000-55f1-95f4-1458-8da4b89bb32e	6276	Pobegi
00050000-55f1-95f4-7a9f-4fe418aa2506	8312	Podbočje
00050000-55f1-95f4-5afa-9e626bba11f1	5243	Podbrdo
00050000-55f1-95f4-3087-455d89f1e495	3254	Podčetrtek
00050000-55f1-95f4-5edf-7a61568e0996	2273	Podgorci
00050000-55f1-95f4-24bc-2b692faeedc8	6216	Podgorje
00050000-55f1-95f4-4341-2271d64412ba	2381	Podgorje pri Slovenj Gradcu
00050000-55f1-95f4-3a2b-fce59e50af34	6244	Podgrad
00050000-55f1-95f4-40fa-4175f9c70aae	1414	Podkum
00050000-55f1-95f4-a67c-6d6988615be6	2286	Podlehnik
00050000-55f1-95f4-18e9-fd16acb14aa2	5272	Podnanos
00050000-55f1-95f4-8b2c-22b8931ef0de	4244	Podnart
00050000-55f1-95f4-246b-26ed07ba6f65	3241	Podplat
00050000-55f1-95f4-ba21-b3f3d73d6384	3257	Podsreda
00050000-55f1-95f4-76ec-7e129236c799	2363	Podvelka
00050000-55f1-95f4-af4c-3833b6ab0c5f	2208	Pohorje
00050000-55f1-95f4-c86d-6ca644fb798d	2257	Polenšak
00050000-55f1-95f4-6e24-27e622637951	1355	Polhov Gradec
00050000-55f1-95f4-dea7-6cd89d540aa2	4223	Poljane nad Škofjo Loko
00050000-55f1-95f4-c7de-eb14d487c694	2319	Poljčane
00050000-55f1-95f4-8aa9-6cf3ca3e6499	1272	Polšnik
00050000-55f1-95f4-4d88-fde544e7fcb6	3313	Polzela
00050000-55f1-95f4-1de2-01efbf56b727	3232	Ponikva
00050000-55f1-95f4-ddbc-fb3f94016947	6320	Portorož/Portorose
00050000-55f1-95f4-b7ef-9065d7f2828e	6230	Postojna
00050000-55f1-95f4-3ef4-ec7e099d058e	2331	Pragersko
00050000-55f1-95f4-b6d7-85e6b2b1e60e	3312	Prebold
00050000-55f1-95f4-8fe9-010341455a1b	4205	Preddvor
00050000-55f1-95f4-57eb-76a9cb3a58f9	6255	Prem
00050000-55f1-95f4-6cb5-75ad95f93d2f	1352	Preserje
00050000-55f1-95f4-53e8-99b345f0c546	6258	Prestranek
00050000-55f1-95f4-6b47-5d073af219ce	2391	Prevalje
00050000-55f1-95f4-4c6a-bf15f036c719	3262	Prevorje
00050000-55f1-95f4-537c-f5801f4005f1	1276	Primskovo 
00050000-55f1-95f4-7b47-c3a890954d25	3253	Pristava pri Mestinju
00050000-55f1-95f4-6a9c-a8fa8fb5c5df	9207	Prosenjakovci/Partosfalva
00050000-55f1-95f4-135c-d953db663fdd	5297	Prvačina
00050000-55f1-95f4-ca91-9d7763802012	2250	Ptuj
00050000-55f1-95f4-385b-d13f066b5143	2323	Ptujska Gora
00050000-55f1-95f4-a6e8-cf61fc8c2a0e	9201	Puconci
00050000-55f1-95f4-e08b-1443056dbdd8	2327	Rače
00050000-55f1-95f4-78a4-bd6eea0758b8	1433	Radeče
00050000-55f1-95f4-d71e-7584b1906a85	9252	Radenci
00050000-55f1-95f4-7a8d-affbabbfca74	2360	Radlje ob Dravi
00050000-55f1-95f4-d878-33f77ba300ca	1235	Radomlje
00050000-55f1-95f4-5042-9487254da02e	4240	Radovljica
00050000-55f1-95f4-34a3-ed79e2f14c6a	8274	Raka
00050000-55f1-95f4-01fe-023f5c4ba0bf	1381	Rakek
00050000-55f1-95f4-aa67-0c121763139c	4283	Rateče - Planica
00050000-55f1-95f4-8f9f-114f2765d69e	2390	Ravne na Koroškem
00050000-55f1-95f4-c1c8-4c9e4e9ba27a	9246	Razkrižje
00050000-55f1-95f4-0bd7-f2a8c73b1d2a	3332	Rečica ob Savinji
00050000-55f1-95f4-3caa-1e815ec8263b	5292	Renče
00050000-55f1-95f4-b4b0-351cf60f684b	1310	Ribnica
00050000-55f1-95f4-8cd8-1b233aeb3040	2364	Ribnica na Pohorju
00050000-55f1-95f4-6e01-84e999f15c84	3272	Rimske Toplice
00050000-55f1-95f4-a071-9c99d94e6c4d	1314	Rob
00050000-55f1-95f4-fe86-0756776906ec	5215	Ročinj
00050000-55f1-95f4-2b2b-19765dfa57ee	3250	Rogaška Slatina
00050000-55f1-95f4-30fc-5357eaf924bb	9262	Rogašovci
00050000-55f1-95f4-ce36-32ad7881c2bf	3252	Rogatec
00050000-55f1-95f4-e06c-b5137c2d9c04	1373	Rovte
00050000-55f1-95f4-8935-ef6784b07eed	2342	Ruše
00050000-55f1-95f4-0d1d-6537ff866ef7	1282	Sava
00050000-55f1-95f4-21f5-0dda17449d3d	6333	Sečovlje/Sicciole
00050000-55f1-95f4-b109-537227c0c1e8	4227	Selca
00050000-55f1-95f4-34f3-4922096604a1	2352	Selnica ob Dravi
00050000-55f1-95f4-5de6-87bbc5bc63bd	8333	Semič
00050000-55f1-95f4-fe2c-58517e758a0a	8281	Senovo
00050000-55f1-95f4-ec70-7c9d1cedd0a3	6224	Senožeče
00050000-55f1-95f4-4865-05b5b66e537b	8290	Sevnica
00050000-55f1-95f4-1e50-e0e68d4b4b8a	6210	Sežana
00050000-55f1-95f4-d5c1-997e7674d592	2214	Sladki Vrh
00050000-55f1-95f4-9c29-2c758dce017a	5283	Slap ob Idrijci
00050000-55f1-95f4-3352-dc2a3eb50630	2380	Slovenj Gradec
00050000-55f1-95f4-119a-4bacf5f63e67	2310	Slovenska Bistrica
00050000-55f1-95f4-3a56-9e1e10792053	3210	Slovenske Konjice
00050000-55f1-95f4-a238-b9098dfdf8e0	1216	Smlednik
00050000-55f1-95f4-a73c-f681a4d4e5a4	5232	Soča
00050000-55f1-95f4-7b60-47f9c33fef08	1317	Sodražica
00050000-55f1-95f4-27fc-ea45be13049e	3335	Solčava
00050000-55f1-95f4-4e15-7427024ff9c2	5250	Solkan
00050000-55f1-95f4-e5f6-252798b3e2ab	4229	Sorica
00050000-55f1-95f4-ba6b-8c7b4b2f0072	4225	Sovodenj
00050000-55f1-95f4-173a-61ed4d7bbfc1	5281	Spodnja Idrija
00050000-55f1-95f4-d075-3b6d87b367ac	2241	Spodnji Duplek
00050000-55f1-95f4-173d-4104605f5a2f	9245	Spodnji Ivanjci
00050000-55f1-95f4-ddf9-822b7817b95b	2277	Središče ob Dravi
00050000-55f1-95f4-6d4e-a690566db988	4267	Srednja vas v Bohinju
00050000-55f1-95f4-8c20-ec788f9cff9f	8256	Sromlje 
00050000-55f1-95f4-40c8-2fe448301ae5	5224	Srpenica
00050000-55f1-95f4-b905-7e3dffc5330a	1242	Stahovica
00050000-55f1-95f4-1fe4-5dd559b69357	1332	Stara Cerkev
00050000-55f1-95f4-bd90-20cee76eb6d3	8342	Stari trg ob Kolpi
00050000-55f1-95f4-5aa4-175e6d2900a1	1386	Stari trg pri Ložu
00050000-55f1-95f4-6abf-ee6b0b04093c	2205	Starše
00050000-55f1-95f4-0c3d-6f61e76b39a9	2289	Stoperce
00050000-55f1-95f4-ae3b-b866f09c8a9f	8322	Stopiče
00050000-55f1-95f4-6397-720fd698238a	3206	Stranice
00050000-55f1-95f4-b23e-ae997f64ccf3	8351	Straža
00050000-55f1-95f4-5739-8c0d5e5a3869	1313	Struge
00050000-55f1-95f4-c44d-5495808000f3	8293	Studenec
00050000-55f1-95f4-68c8-f674a172de3b	8331	Suhor
00050000-55f1-95f4-3507-f933af4825b5	2233	Sv. Ana v Slovenskih goricah
00050000-55f1-95f4-f53a-620a9e56c83d	2235	Sv. Trojica v Slovenskih goricah
00050000-55f1-95f4-1e61-c1e51fe87e14	2353	Sveti Duh na Ostrem Vrhu
00050000-55f1-95f4-dffa-3c55dc337a98	9244	Sveti Jurij ob Ščavnici
00050000-55f1-95f4-569f-58f711a214fe	3264	Sveti Štefan
00050000-55f1-95f4-5b53-702585855904	2258	Sveti Tomaž
00050000-55f1-95f4-3d4b-e539294e88f6	9204	Šalovci
00050000-55f1-95f4-f4ce-05e8d52ee05b	5261	Šempas
00050000-55f1-95f4-7e1f-6c10275a43b7	5290	Šempeter pri Gorici
00050000-55f1-95f4-9608-9c22e7d7a2ed	3311	Šempeter v Savinjski dolini
00050000-55f1-95f4-0a49-512e477619b9	4208	Šenčur
00050000-55f1-95f4-c414-e401f5f0c753	2212	Šentilj v Slovenskih goricah
00050000-55f1-95f4-f2c0-078246db5e30	8297	Šentjanž
00050000-55f1-95f4-8445-96d9a47bd083	2373	Šentjanž pri Dravogradu
00050000-55f1-95f4-863a-7e8b32eab1d7	8310	Šentjernej
00050000-55f1-95f4-09fd-caaa6259828a	3230	Šentjur
00050000-55f1-95f4-9c29-ef451088b173	3271	Šentrupert
00050000-55f1-95f4-ec4d-8a34c5d12fda	8232	Šentrupert
00050000-55f1-95f4-2c4c-98294a3443a0	1296	Šentvid pri Stični
00050000-55f1-95f4-9d92-e130cbeb2448	8275	Škocjan
00050000-55f1-95f4-5ce2-693ca38ed321	6281	Škofije
00050000-55f1-95f4-9e79-a6fe1d3effa8	4220	Škofja Loka
00050000-55f1-95f4-2764-d1283000453a	3211	Škofja vas
00050000-55f1-95f4-b127-c19f7918609d	1291	Škofljica
00050000-55f1-95f4-1a13-927ce00a3a7a	6274	Šmarje
00050000-55f1-95f4-f06b-35c7ad8150cb	1293	Šmarje - Sap
00050000-55f1-95f4-23a2-9024b314bce5	3240	Šmarje pri Jelšah
00050000-55f1-95f4-0501-f4cbe9872fe2	8220	Šmarješke Toplice
00050000-55f1-95f4-8dfc-d7b22c8f09d9	2315	Šmartno na Pohorju
00050000-55f1-95f4-39a5-1e53b31e7be4	3341	Šmartno ob Dreti
00050000-55f1-95f4-e1a1-c5e60f9abdcc	3327	Šmartno ob Paki
00050000-55f1-95f4-13a1-b325504dc18c	1275	Šmartno pri Litiji
00050000-55f1-95f4-ae5b-edb3c62b6e71	2383	Šmartno pri Slovenj Gradcu
00050000-55f1-95f4-b60c-bf97a1857dea	3201	Šmartno v Rožni dolini
00050000-55f1-95f4-a3c1-24e00f07f485	3325	Šoštanj
00050000-55f1-95f4-b014-3dc5cd38905e	6222	Štanjel
00050000-55f1-95f4-bc98-724de0070168	3220	Štore
00050000-55f1-95f4-cc44-80e6b7707b42	3304	Tabor
00050000-55f1-95f4-4c47-d2b1b4fd7ee8	3221	Teharje
00050000-55f1-95f4-edb3-6907a663294c	9251	Tišina
00050000-55f1-95f4-3bc3-5f565e6918f2	5220	Tolmin
00050000-55f1-95f4-3494-58b5245bc97a	3326	Topolšica
00050000-55f1-95f4-e915-524a86df5b38	2371	Trbonje
00050000-55f1-95f4-7f0f-253334fb7513	1420	Trbovlje
00050000-55f1-95f4-4a50-e42ffd66bdc9	8231	Trebelno 
00050000-55f1-95f4-772a-2ab6581e8cac	8210	Trebnje
00050000-55f1-95f4-1724-4a3a45537578	5252	Trnovo pri Gorici
00050000-55f1-95f4-c004-d5a67bea2d25	2254	Trnovska vas
00050000-55f1-95f4-557a-6509342c812a	1222	Trojane
00050000-55f1-95f4-c291-a13e2cc40fe5	1236	Trzin
00050000-55f1-95f4-1b28-8698c71af552	4290	Tržič
00050000-55f1-95f4-834f-f166014f3954	8295	Tržišče
00050000-55f1-95f4-0928-30d9e3c44930	1311	Turjak
00050000-55f1-95f4-6bad-64bee632def0	9224	Turnišče
00050000-55f1-95f4-6206-4d902bba43bd	8323	Uršna sela
00050000-55f1-95f4-da1b-0405b04864e9	1252	Vače
00050000-55f1-95f4-2a7d-821184944169	3320	Velenje 
00050000-55f1-95f4-b5e9-987232c7d0df	3322	Velenje - poštni predali
00050000-55f1-95f4-873a-a80adec487ec	8212	Velika Loka
00050000-55f1-95f4-17d0-76b5444a1602	2274	Velika Nedelja
00050000-55f1-95f4-9f44-6bb7c1b4074c	9225	Velika Polana
00050000-55f1-95f4-6d87-b57a7316cba5	1315	Velike Lašče
00050000-55f1-95f4-9a89-73039bac7441	8213	Veliki Gaber
00050000-55f1-95f4-3bdb-c1ca8783c7dc	9241	Veržej
00050000-55f1-95f4-c64e-3786dfd8998b	1312	Videm - Dobrepolje
00050000-55f1-95f4-93a5-a78efc6dd580	2284	Videm pri Ptuju
00050000-55f1-95f4-d35c-21a70e809c08	8344	Vinica
00050000-55f1-95f4-e87e-d71298a5cb0e	5271	Vipava
00050000-55f1-95f4-80fe-d4096e22e36a	4212	Visoko
00050000-55f1-95f4-9a28-0364586fc4ec	1294	Višnja Gora
00050000-55f1-95f4-6a72-a4e337fe4796	3205	Vitanje
00050000-55f1-95f4-19a9-67aff7d684bc	2255	Vitomarci
00050000-55f1-95f4-a032-8e83fb55e56b	1217	Vodice
00050000-55f1-95f4-a314-454be86ac02a	3212	Vojnik\t
00050000-55f1-95f4-73e9-7a2053911e14	5293	Volčja Draga
00050000-55f1-95f4-cd7c-80cbb2405414	2232	Voličina
00050000-55f1-95f4-bd4a-69958094f5b1	3305	Vransko
00050000-55f1-95f4-ce7e-9df659e92774	6217	Vremski Britof
00050000-55f1-95f4-7e49-c3b919b20d99	1360	Vrhnika
00050000-55f1-95f4-9bd4-f65c05a24126	2365	Vuhred
00050000-55f1-95f4-34e5-f06b5b674a4a	2367	Vuzenica
00050000-55f1-95f4-5b56-e9e789ac30da	8292	Zabukovje 
00050000-55f1-95f4-f0c2-872a4fcaf692	1410	Zagorje ob Savi
00050000-55f1-95f4-2fe1-40051f73c89a	1303	Zagradec
00050000-55f1-95f4-99c3-e3f3a9a43274	2283	Zavrč
00050000-55f1-95f4-4132-f0ce17274549	8272	Zdole 
00050000-55f1-95f4-5100-d9bfcbc6a375	4201	Zgornja Besnica
00050000-55f1-95f4-1a39-60135beab8e5	2242	Zgornja Korena
00050000-55f1-95f4-1e2f-612062c2e15b	2201	Zgornja Kungota
00050000-55f1-95f4-ba14-73a2bf9f9b24	2316	Zgornja Ložnica
00050000-55f1-95f4-f5e9-a697eed9987e	2314	Zgornja Polskava
00050000-55f1-95f4-bdf5-c37c0fda0641	2213	Zgornja Velka
00050000-55f1-95f4-e7de-794d662fd2a5	4247	Zgornje Gorje
00050000-55f1-95f4-6ff0-31a509a6b768	4206	Zgornje Jezersko
00050000-55f1-95f4-ddb1-1a90baaea1c6	2285	Zgornji Leskovec
00050000-55f1-95f4-a40e-edf5bf978532	1432	Zidani Most
00050000-55f1-95f4-ca24-7f2422bacd75	3214	Zreče
00050000-55f1-95f4-c66b-a0eebc9be368	4209	Žabnica
00050000-55f1-95f4-d2fd-3a33ed0690d2	3310	Žalec
00050000-55f1-95f4-3bd4-b94e4439638f	4228	Železniki
00050000-55f1-95f4-f5b2-32da4586263d	2287	Žetale
00050000-55f1-95f4-3cd7-f7f07cbc624d	4226	Žiri
00050000-55f1-95f4-e33e-e98cd7cd4fbc	4274	Žirovnica
00050000-55f1-95f4-49f4-9cfdcab0afac	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 18665388)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 18665020)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 18664830)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f1-95f5-73f3-20054c94796f	00080000-55f1-95f5-7a50-3148d7461a46	\N	00040000-55f1-95f4-b529-03e72859f7d2	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f1-95f5-1464-cb80e275dccc	00080000-55f1-95f5-7a50-3148d7461a46	\N	00040000-55f1-95f4-b529-03e72859f7d2	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f1-95f5-7b71-340bb728b34b	00080000-55f1-95f5-2b9d-7c34e1347e28	\N	00040000-55f1-95f4-b529-03e72859f7d2	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 18664908)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 18665032)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 18665402)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 18665412)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f1-95f5-8507-3cb0b9741e21	00080000-55f1-95f5-b1d4-b48e7848a52c	0987	AK
00190000-55f1-95f5-e72e-49189bbea8f5	00080000-55f1-95f5-2b9d-7c34e1347e28	0989	AK
00190000-55f1-95f5-9146-561bec1c4726	00080000-55f1-95f5-be8f-a4e5614182f6	0986	AK
00190000-55f1-95f5-52b0-d6fe147436b5	00080000-55f1-95f5-5d54-eab7b4f6b743	0984	AK
00190000-55f1-95f5-7fd4-1d36d41d99db	00080000-55f1-95f5-3d34-4d9e71c426a7	0983	AK
00190000-55f1-95f5-cf42-eba1a0f3bdc5	00080000-55f1-95f5-ca13-5134dbb7efba	0982	AK
00190000-55f1-95f6-ab6f-7d4d9cc8b908	00080000-55f1-95f6-edbb-d145d2426dde	1001	AK
\.


--
-- TOC entry 2989 (class 0 OID 18665345)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f1-95f6-856f-012284989a81	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2993 (class 0 OID 18665420)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 18665061)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f1-95f5-5f7b-05159a4aeea4	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f1-95f5-0c34-f29da707201c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f1-95f5-1145-065c7a7b3516	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f1-95f5-3c29-0e8a92341f71	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f1-95f5-46e6-8a8912ff1d54	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f1-95f5-a6d8-ac61abc5d5b6	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f1-95f5-1bff-6cc490caec95	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2962 (class 0 OID 18665005)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 18664995)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 18665198)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 18665135)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 18664703)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f1-95f6-edbb-d145d2426dde	00010000-55f1-95f4-2bd8-089478da7543	2015-09-10 16:38:46	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f1-95f6-8dac-ad0bcba290f6	00010000-55f1-95f4-2bd8-089478da7543	2015-09-10 16:38:46	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f1-95f6-ab6f-7d4d9cc8b908	00010000-55f1-95f4-2bd8-089478da7543	2015-09-10 16:38:46	INS	a:0:{}
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2971 (class 0 OID 18665074)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 18664741)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f1-95f4-6b9b-f590cd20c610	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f1-95f4-add3-288c652b20a0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f1-95f4-953b-9b92beb98ec7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f1-95f4-9f06-9e4e474e4be9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f1-95f4-fabf-1882b2334dd8	planer	Planer dogodkov v koledarju	t
00020000-55f1-95f4-0d13-12baa9c4cbfe	kadrovska	Kadrovska služba	t
00020000-55f1-95f4-ee2b-e4ba315ab5e4	arhivar	Ažuriranje arhivalij	t
00020000-55f1-95f4-11e5-43cad536b255	igralec	Igralec	t
00020000-55f1-95f4-d26a-8a2ca12e006e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f1-95f5-66db-5bff9157f13e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2938 (class 0 OID 18664725)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f1-95f4-4c10-c2a4865a6f33	00020000-55f1-95f4-953b-9b92beb98ec7
00010000-55f1-95f4-2bd8-089478da7543	00020000-55f1-95f4-953b-9b92beb98ec7
00010000-55f1-95f5-93a9-479f1e1302bf	00020000-55f1-95f5-66db-5bff9157f13e
\.


--
-- TOC entry 2973 (class 0 OID 18665088)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 18665026)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 18664972)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 18664690)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f1-95f4-2249-eb0acd07c7d5	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f1-95f4-c076-e3083f1a12cb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f1-95f4-4a4e-940d83f15eb4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f1-95f4-b1ba-695db0103b34	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f1-95f4-a8ad-dae3a70ada64	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2933 (class 0 OID 18664682)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f1-95f4-3fdc-890423084d50	00230000-55f1-95f4-b1ba-695db0103b34	popa
00240000-55f1-95f4-90fc-21db2f7f5d8c	00230000-55f1-95f4-b1ba-695db0103b34	oseba
00240000-55f1-95f4-6319-8faa6c3ebb56	00230000-55f1-95f4-b1ba-695db0103b34	sezona
00240000-55f1-95f4-51dc-51d13c2da0ac	00230000-55f1-95f4-c076-e3083f1a12cb	prostor
00240000-55f1-95f4-3243-20bb9a7d50ee	00230000-55f1-95f4-b1ba-695db0103b34	besedilo
00240000-55f1-95f4-199d-7a1daad25ef8	00230000-55f1-95f4-b1ba-695db0103b34	uprizoritev
00240000-55f1-95f4-cec4-c39ffbab0541	00230000-55f1-95f4-b1ba-695db0103b34	funkcija
00240000-55f1-95f4-a2f7-794ad673f5cb	00230000-55f1-95f4-b1ba-695db0103b34	tipfunkcije
00240000-55f1-95f4-d2a1-d432a03f8492	00230000-55f1-95f4-b1ba-695db0103b34	alternacija
00240000-55f1-95f4-dd3f-eb8886789123	00230000-55f1-95f4-2249-eb0acd07c7d5	pogodba
00240000-55f1-95f4-fcd5-05bf50cd2565	00230000-55f1-95f4-b1ba-695db0103b34	zaposlitev
00240000-55f1-95f4-7409-96997eec3d0c	00230000-55f1-95f4-b1ba-695db0103b34	zvrstuprizoritve
00240000-55f1-95f4-3e33-91bde4bc243a	00230000-55f1-95f4-2249-eb0acd07c7d5	programdela
00240000-55f1-95f4-d76c-266751142898	00230000-55f1-95f4-b1ba-695db0103b34	zapis
\.


--
-- TOC entry 2932 (class 0 OID 18664677)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
cc9e4c9e-92a4-46ed-82da-4640d5ad171e	00240000-55f1-95f4-3fdc-890423084d50	0	1001
\.


--
-- TOC entry 2978 (class 0 OID 18665145)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f1-95f6-d05f-c24d772a4aca	000e0000-55f1-95f5-b81b-2b102c1f0c86	00080000-55f1-95f5-7a50-3148d7461a46	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f1-95f4-3a2e-1cc8abf1d2da
00270000-55f1-95f6-76cf-0f846a0f0b4c	000e0000-55f1-95f5-b81b-2b102c1f0c86	00080000-55f1-95f5-7a50-3148d7461a46	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f1-95f4-3a2e-1cc8abf1d2da
\.


--
-- TOC entry 2945 (class 0 OID 18664803)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 18664982)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f1-95f6-fa61-09797c96ccf1	00180000-55f1-95f6-7805-ea60c58b0b2f	000c0000-55f1-95f6-6101-307d1a4b8986	00090000-55f1-95f5-624b-1f8d5ffe8dde	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f1-95f6-8bbe-147932ea8465	00180000-55f1-95f6-7805-ea60c58b0b2f	000c0000-55f1-95f6-ce29-3c1515ed4b14	00090000-55f1-95f5-3bb4-5782f95a13ac	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f1-95f6-833b-b02ba6fabfa3	00180000-55f1-95f6-7805-ea60c58b0b2f	000c0000-55f1-95f6-cde2-8ed9f3b388e5	00090000-55f1-95f5-9a84-53d5cc05f339	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f1-95f6-d04b-bbf02f430c61	00180000-55f1-95f6-7805-ea60c58b0b2f	000c0000-55f1-95f6-18da-863aaffbaeca	00090000-55f1-95f5-9db8-6815e0af23fe	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f1-95f6-f96b-ad1ffb7e469b	00180000-55f1-95f6-7805-ea60c58b0b2f	000c0000-55f1-95f6-25ac-5a69768208dc	00090000-55f1-95f5-3df9-0fdbf834609e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f1-95f6-0162-6d368bba5d18	00180000-55f1-95f6-b980-be91c360c096	\N	00090000-55f1-95f5-3df9-0fdbf834609e	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2981 (class 0 OID 18665186)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f1-95f4-00bb-45cc59f257eb	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f1-95f4-36d8-fc0861efe0ad	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f1-95f4-8e2f-39e9c9fa2853	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f1-95f4-b46d-d59585125947	04	Režija	Režija	Režija	umetnik
000f0000-55f1-95f4-dc22-149a50d77ffa	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f1-95f4-fe93-f61be287f7e2	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f1-95f4-9fb6-8768b6b9d70d	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f1-95f4-a35f-d91aba8a1983	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f1-95f4-585a-b9df76352758	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f1-95f4-2acc-b91c0b99f4e1	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f1-95f4-5168-fdd27fede886	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f1-95f4-0105-c819e9434493	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f1-95f4-611d-7b1bfbdafdee	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f1-95f4-0541-4eb978bc6840	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f1-95f4-2e0c-4f45d48ad74f	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f1-95f4-c1bf-51705add86f3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f1-95f4-ea98-e45759049ef5	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f1-95f4-2810-d93de8833deb	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2994 (class 0 OID 18665430)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f1-95f4-2fcd-cfb9ecc84969	01	Velika predstava	f	1.00	1.00
002b0000-55f1-95f4-750a-7fc8fb54d694	02	Mala predstava	f	0.50	0.50
002b0000-55f1-95f4-cb5e-12a2efc956c9	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f1-95f4-435b-be6bf3084359	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f1-95f4-520e-d240481b7987	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2950 (class 0 OID 18664865)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 18664712)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f1-95f4-2bd8-089478da7543	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROSfwVvgu6O3tU/5G7OkEaEnRZimp0SfG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f1-95f5-8814-c93b9a2f633d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f1-95f5-c22b-a20a80e3bba1	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f1-95f5-8cfe-ec30b84a8100	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f1-95f5-18d5-812098041dc5	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f1-95f5-ba93-f1f877cc348c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f1-95f5-ccb0-c03264f5b020	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f1-95f5-1bc7-3096639a7fa4	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f1-95f5-efed-e820fe60c0ae	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f1-95f5-5a36-18494a673481	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f1-95f5-93a9-479f1e1302bf	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f1-95f4-4c10-c2a4865a6f33	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2985 (class 0 OID 18665235)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f1-95f5-f6f5-8026b921d8e1	00160000-55f1-95f5-359c-4680927a81b8	\N	00140000-55f1-95f4-577a-0b5b63f3c15c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f1-95f5-46e6-8a8912ff1d54
000e0000-55f1-95f5-b81b-2b102c1f0c86	00160000-55f1-95f5-2941-2b422d52f664	\N	00140000-55f1-95f4-c222-207085e27f32	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f1-95f5-a6d8-ac61abc5d5b6
000e0000-55f1-95f5-d561-85d0de18ce4e	\N	\N	00140000-55f1-95f4-c222-207085e27f32	00190000-55f1-95f5-8507-3cb0b9741e21	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f1-95f5-46e6-8a8912ff1d54
000e0000-55f1-95f5-c7b0-fbc565d81516	\N	\N	00140000-55f1-95f4-c222-207085e27f32	00190000-55f1-95f5-8507-3cb0b9741e21	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f1-95f5-46e6-8a8912ff1d54
000e0000-55f1-95f5-9335-218371b7bd3c	\N	\N	00140000-55f1-95f4-c222-207085e27f32	00190000-55f1-95f5-8507-3cb0b9741e21	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f1-95f5-5f7b-05159a4aeea4
000e0000-55f1-95f5-6295-1cda9f668cdd	\N	\N	00140000-55f1-95f4-c222-207085e27f32	00190000-55f1-95f5-8507-3cb0b9741e21	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f1-95f5-5f7b-05159a4aeea4
\.


--
-- TOC entry 2955 (class 0 OID 18664926)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f1-95f6-0c42-345f7e5a03f7	000e0000-55f1-95f5-b81b-2b102c1f0c86	\N	1	
00200000-55f1-95f6-cbba-e30d2a6cf5d4	000e0000-55f1-95f5-b81b-2b102c1f0c86	\N	2	
00200000-55f1-95f6-7f43-c1aa3114d985	000e0000-55f1-95f5-b81b-2b102c1f0c86	\N	3	
00200000-55f1-95f6-87a8-11c77c322e1c	000e0000-55f1-95f5-b81b-2b102c1f0c86	\N	4	
00200000-55f1-95f6-cfb6-c6ea42cefc1d	000e0000-55f1-95f5-b81b-2b102c1f0c86	\N	5	
\.


--
-- TOC entry 2969 (class 0 OID 18665053)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 18665159)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f1-95f4-a6b1-c160f0d77f3d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f1-95f4-a07a-f2268ffa1d3e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f1-95f4-f589-0a0d846893ab	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f1-95f4-2706-d6a1de976ffd	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f1-95f4-ded7-dfb8f4b72b48	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f1-95f4-c037-c305cedb3142	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f1-95f4-e137-3168078c3d92	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f1-95f4-71b6-ad7d0e872938	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f1-95f4-3a2e-1cc8abf1d2da	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f1-95f4-18c6-f475f5e5b207	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f1-95f4-7a6f-266298c45610	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f1-95f4-cb0b-fac6e05d0f8d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f1-95f4-3368-d3774f9279c5	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f1-95f4-231c-641bdf8eb027	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f1-95f4-1c64-4c27a5135560	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f1-95f4-a975-98d610164f99	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f1-95f4-523d-72616d59dccb	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f1-95f4-edb7-9b00b3dbb864	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f1-95f4-bc70-61e117ccd055	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f1-95f4-6272-84afa60e86be	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f1-95f4-39fd-bbac89e0813c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f1-95f4-b0b4-7c06d5e71636	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f1-95f4-6c9c-ff32287375cf	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f1-95f4-f61d-118b7dfdd3b1	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f1-95f4-ec33-f3b1f2d570f0	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f1-95f4-6966-e4bc83fdc119	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f1-95f4-f8d3-c822a222ebb8	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f1-95f4-659b-54fe59a2d45d	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2997 (class 0 OID 18665476)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 18665448)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 18665488)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 18665125)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f1-95f6-6c7b-d60f8b29e449	00090000-55f1-95f5-3bb4-5782f95a13ac	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f1-95f6-f996-3d26552bcba1	00090000-55f1-95f5-9a84-53d5cc05f339	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f1-95f6-0089-6d429426ab64	00090000-55f1-95f5-b5dd-43052439b259	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f1-95f6-f1b2-eb74fd8c6592	00090000-55f1-95f5-ebb2-c0b7d9b9e792	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f1-95f6-b7ab-d7a68d96fb24	00090000-55f1-95f5-624b-1f8d5ffe8dde	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f1-95f6-8f59-48e7fd3025e7	00090000-55f1-95f5-922f-2ae68e458605	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2957 (class 0 OID 18664962)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 18665225)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f1-95f4-577a-0b5b63f3c15c	01	Drama	drama (SURS 01)
00140000-55f1-95f4-063d-fd1f973bafec	02	Opera	opera (SURS 02)
00140000-55f1-95f4-6f63-1cc8362d5b8b	03	Balet	balet (SURS 03)
00140000-55f1-95f4-5d70-8c45fadfca40	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f1-95f4-26bf-998f166a8499	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f1-95f4-c222-207085e27f32	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f1-95f4-882e-697635350458	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2975 (class 0 OID 18665115)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 18664766)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 18665284)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 18665274)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 18665184)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 18665528)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 18664951)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 18664971)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 18665446)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 18664891)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 18665339)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 18665111)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 18664924)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 18664905)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 18665018)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 18665505)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 18665512)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 18665536)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 18665045)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 18664863)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 18664775)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 18664799)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 18664755)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 18664740)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 18665051)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 18665087)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 18665220)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 18664827)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 18664851)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 18175937)
-- Name: postavkac2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkac2
    ADD CONSTRAINT postavkac2_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 18665400)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 18665024)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 18664841)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 18664912)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 18665036)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 18665409)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 18665417)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 18665387)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 18665428)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 18665069)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 18665009)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 18665000)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 18665208)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 18665142)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 18664711)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 18665078)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 18664729)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 18664749)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 18665096)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 18665031)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 18664980)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 18664699)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 18664687)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 18664681)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 18665155)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 18664808)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 18664991)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 18665195)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 18665440)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 18664876)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 18664724)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 18665253)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 18664934)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 18665059)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 18665167)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 18665486)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 18665470)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 18665494)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 18665133)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 18664966)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 18665233)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 18665123)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 18664960)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 18664961)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 18664959)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 18664958)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2624 (class 1259 OID 18665156)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 18665157)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 18665158)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 18665507)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 18665506)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 18664829)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 18665052)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 18665474)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 18665473)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 18665475)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 18665472)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 18665471)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 18665038)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 18665037)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 18664935)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 18665112)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 18665114)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 18665113)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 18664907)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 18664906)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 18665429)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 18665222)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 18665223)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 18665224)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 18665495)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 18665258)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 18665255)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 18665259)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 18665257)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 18665256)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 18664878)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 18664877)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 18664802)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 18665079)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 18664756)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 18664757)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 18665099)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 18665098)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 18665097)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 18664913)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 18664914)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 18664689)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 18665004)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 18665002)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 18665001)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 18665003)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 18664730)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 18664731)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 18665060)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 18665529)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 18665537)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 18665538)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 18665025)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 18665143)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 18665144)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 18665344)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 18665343)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 18665340)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 18665341)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 18665342)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 18664843)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 18664842)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 18664844)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 18665073)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 18665072)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 18665410)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 18665411)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 18665288)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 18665289)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 18665286)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 18665287)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 18665134)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 18665013)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 18665012)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 18665010)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 18665011)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 18665276)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 18665275)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 18664925)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 18665401)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 18665447)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 18665513)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 18665514)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 18664777)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 18664776)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 18664809)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 18664810)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 18664994)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 18664993)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 18664992)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2543 (class 1259 OID 18664953)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2544 (class 1259 OID 18664954)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2545 (class 1259 OID 18664952)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2546 (class 1259 OID 18664956)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2547 (class 1259 OID 18664957)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2548 (class 1259 OID 18664955)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 18664828)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 18664892)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 18664894)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 18664893)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 18664895)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 18665019)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 18665221)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 18665254)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 18665196)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 18665197)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 18664800)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 18664801)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 18665124)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 18664700)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 18664864)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 18664688)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2597 (class 1259 OID 18665071)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 18665070)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 18665285)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 18664852)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 18665234)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 18665487)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 18665418)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 18665419)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 18665185)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 18664981)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 18664750)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 18665659)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 18665664)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 18665684)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 18665654)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 18665674)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 18665679)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 18665669)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2785 (class 2606 OID 18665834)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2784 (class 2606 OID 18665839)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2783 (class 2606 OID 18665844)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 18666009)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2818 (class 2606 OID 18666004)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 18665594)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 18665764)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2812 (class 2606 OID 18665989)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 18665984)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 18665994)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 18665979)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2815 (class 2606 OID 18665974)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2767 (class 2606 OID 18665759)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 18665754)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 18665649)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 18665804)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 18665814)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 18665809)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 18665629)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 18665624)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 18665744)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 18665964)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 18665849)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 18665854)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 18665859)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2816 (class 2606 OID 18665999)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2790 (class 2606 OID 18665879)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2793 (class 2606 OID 18665864)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2789 (class 2606 OID 18665884)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2791 (class 2606 OID 18665874)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2792 (class 2606 OID 18665869)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 18665619)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 18665614)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 18665579)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 18665574)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 18665784)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 18665554)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 18665559)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2774 (class 2606 OID 18665799)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 18665794)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 18665789)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 18665634)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 18665639)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 18665539)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2757 (class 2606 OID 18665719)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2759 (class 2606 OID 18665709)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2760 (class 2606 OID 18665704)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2758 (class 2606 OID 18665714)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 18665544)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 18665549)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 18665769)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2821 (class 2606 OID 18666024)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 18666029)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2822 (class 2606 OID 18666034)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 18665749)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2782 (class 2606 OID 18665824)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2781 (class 2606 OID 18665829)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 18665939)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 18665934)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 18665919)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 18665924)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2802 (class 2606 OID 18665929)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 18665604)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 18665599)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 18665609)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 18665779)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2772 (class 2606 OID 18665774)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2807 (class 2606 OID 18665949)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2806 (class 2606 OID 18665954)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2797 (class 2606 OID 18665909)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 18665914)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2799 (class 2606 OID 18665899)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2798 (class 2606 OID 18665904)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 18665819)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 18665739)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2762 (class 2606 OID 18665734)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 18665724)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2763 (class 2606 OID 18665729)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 18665894)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2795 (class 2606 OID 18665889)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 18665644)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 18665944)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2808 (class 2606 OID 18665959)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 18665969)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 18666014)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 18666019)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 18665569)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 18665564)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 18665584)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 18665589)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 18665699)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 18665694)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 18665689)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-10 16:38:47 CEST

--
-- PostgreSQL database dump complete
--

