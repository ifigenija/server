--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-12 07:30:23 CEST

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
-- TOC entry 181 (class 1259 OID 19098058)
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
-- TOC entry 226 (class 1259 OID 19098577)
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
-- TOC entry 225 (class 1259 OID 19098560)
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
-- TOC entry 219 (class 1259 OID 19098468)
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
-- TOC entry 240 (class 1259 OID 19098815)
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
-- TOC entry 195 (class 1259 OID 19098236)
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
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 19098267)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19098741)
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
-- TOC entry 190 (class 1259 OID 19098179)
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
-- TOC entry 227 (class 1259 OID 19098590)
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
-- TOC entry 213 (class 1259 OID 19098400)
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
-- TOC entry 193 (class 1259 OID 19098215)
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
-- TOC entry 191 (class 1259 OID 19098196)
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
-- TOC entry 202 (class 1259 OID 19098314)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19098796)
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
-- TOC entry 239 (class 1259 OID 19098808)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19098830)
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
-- TOC entry 206 (class 1259 OID 19098339)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19098153)
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
-- TOC entry 182 (class 1259 OID 19098067)
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
-- TOC entry 183 (class 1259 OID 19098078)
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
-- TOC entry 178 (class 1259 OID 19098032)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19098051)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19098346)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19098380)
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
-- TOC entry 222 (class 1259 OID 19098509)
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
-- TOC entry 185 (class 1259 OID 19098111)
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
-- TOC entry 187 (class 1259 OID 19098145)
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
-- TOC entry 229 (class 1259 OID 19098688)
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
-- TOC entry 203 (class 1259 OID 19098320)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19098130)
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
-- TOC entry 192 (class 1259 OID 19098208)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 19098332)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19098702)
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
-- TOC entry 231 (class 1259 OID 19098712)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19098645)
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
-- TOC entry 232 (class 1259 OID 19098720)
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
-- TOC entry 209 (class 1259 OID 19098361)
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
-- TOC entry 201 (class 1259 OID 19098305)
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
-- TOC entry 200 (class 1259 OID 19098295)
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
-- TOC entry 221 (class 1259 OID 19098498)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19098435)
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
-- TOC entry 175 (class 1259 OID 19098003)
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
-- TOC entry 174 (class 1259 OID 19098001)
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
-- TOC entry 210 (class 1259 OID 19098374)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19098041)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19098025)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19098388)
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
-- TOC entry 204 (class 1259 OID 19098326)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19098272)
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
-- TOC entry 173 (class 1259 OID 19097990)
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
-- TOC entry 172 (class 1259 OID 19097982)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19097977)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19098445)
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
-- TOC entry 184 (class 1259 OID 19098103)
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
-- TOC entry 199 (class 1259 OID 19098282)
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
-- TOC entry 220 (class 1259 OID 19098486)
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
-- TOC entry 233 (class 1259 OID 19098730)
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
-- TOC entry 189 (class 1259 OID 19098165)
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
-- TOC entry 176 (class 1259 OID 19098012)
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
-- TOC entry 224 (class 1259 OID 19098535)
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
-- TOC entry 194 (class 1259 OID 19098226)
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
-- TOC entry 208 (class 1259 OID 19098353)
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
-- TOC entry 218 (class 1259 OID 19098459)
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
-- TOC entry 236 (class 1259 OID 19098776)
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
-- TOC entry 235 (class 1259 OID 19098748)
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
-- TOC entry 237 (class 1259 OID 19098788)
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
-- TOC entry 215 (class 1259 OID 19098425)
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
-- TOC entry 196 (class 1259 OID 19098262)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19098525)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19098415)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 19098006)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 19098058)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 19098577)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f3-b86d-2bcf-4f5e77ff3803	000d0000-55f3-b86d-4ef5-2235ac239c18	\N	00090000-55f3-b86d-9673-6c70ada8ce95	000b0000-55f3-b86d-b6d3-8a0949746458	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f3-b86d-37a2-6a04f2b48319	000d0000-55f3-b86d-c8ae-8e99951db190	00100000-55f3-b86d-7c2e-3fc997342752	00090000-55f3-b86d-bcf6-b833bc3b0c2d	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f3-b86d-a7db-fb242db09e96	000d0000-55f3-b86d-3d1e-8f293de6c8f2	00100000-55f3-b86d-38b9-6418bb4f4a13	00090000-55f3-b86d-fefe-b43ada81e444	\N	0003	t	\N	2015-09-12	\N	2	t	\N	f	f
000c0000-55f3-b86d-999a-24f75867e787	000d0000-55f3-b86d-4e0f-d57372e956a1	\N	00090000-55f3-b86d-b25b-dddd88d34162	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f3-b86d-f364-1f912345bc7d	000d0000-55f3-b86d-1902-2a7c20c41aa0	\N	00090000-55f3-b86d-5c25-719f90c5adf0	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f3-b86d-7dee-88550ffe6940	000d0000-55f3-b86d-235a-a8869328a2a3	\N	00090000-55f3-b86d-61de-7ffc17c62244	000b0000-55f3-b86d-8f0e-7e17c192fbe8	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f3-b86d-cc34-f69c2169ca03	000d0000-55f3-b86d-8811-df4645c27da8	00100000-55f3-b86d-9c56-598a5de2aa1d	00090000-55f3-b86d-1767-dbbeb8bade12	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f3-b86d-2e6e-c1693ff10eaa	000d0000-55f3-b86d-16cd-327e9412b2bb	\N	00090000-55f3-b86d-1a9d-076c899b804b	000b0000-55f3-b86d-474a-3a672e5fe8c0	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f3-b86d-a134-c92dbff5607e	000d0000-55f3-b86d-8811-df4645c27da8	00100000-55f3-b86d-548f-e62a87f052c1	00090000-55f3-b86d-db0d-b5067cc44a9a	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f3-b86d-d3ab-b6339e977632	000d0000-55f3-b86d-8811-df4645c27da8	00100000-55f3-b86d-f5eb-7dc05607a883	00090000-55f3-b86d-c4d3-00e8e360ddf4	\N	0010	t	\N	2015-09-12	\N	16	f	\N	f	t
000c0000-55f3-b86d-9a6d-81582cae3d32	000d0000-55f3-b86d-8811-df4645c27da8	00100000-55f3-b86d-ff45-90cc409599bf	00090000-55f3-b86d-4841-80ed5974b868	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f3-b86d-e5a9-3468f9145ceb	000d0000-55f3-b86d-71be-36db667811ef	\N	00090000-55f3-b86d-bcf6-b833bc3b0c2d	000b0000-55f3-b86d-f6a4-4d7284e1b55f	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2986 (class 0 OID 19098560)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 19098468)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f3-b86d-a3c6-6c6ece1103ad	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f3-b86d-1b62-b9437418549b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f3-b86d-f04f-293cde9be94d	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 19098815)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 19098236)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f3-b86d-fc41-3b270033db2b	\N	\N	00200000-55f3-b86d-c1a8-a5cdf8be0d29	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f3-b86d-d976-c8783493ff04	\N	\N	00200000-55f3-b86d-3148-c9dbb4580146	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f3-b86d-d867-78ef61f2cc63	\N	\N	00200000-55f3-b86d-d06f-fcb771ff844a	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f3-b86d-be08-fd4fee75ad13	\N	\N	00200000-55f3-b86d-dfcb-56f0c3115b5e	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f3-b86d-c43c-acbcc1b023a3	\N	\N	00200000-55f3-b86d-18ae-86ac33c34c93	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2958 (class 0 OID 19098267)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 19098741)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19098179)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f3-b86b-1212-97275f1086ba	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f3-b86b-99e5-ae62ea60054c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f3-b86b-8867-8df7149d6755	AL	ALB	008	Albania 	Albanija	\N
00040000-55f3-b86b-3609-0e5dec1b5621	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f3-b86b-b55c-d476ea85c1e9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f3-b86b-2732-806d1b187b08	AD	AND	020	Andorra 	Andora	\N
00040000-55f3-b86b-1010-dc2262940777	AO	AGO	024	Angola 	Angola	\N
00040000-55f3-b86b-172a-6930f7a74412	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f3-b86b-aa63-53541375ac63	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f3-b86b-6dec-fdbac9018208	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f3-b86b-c055-541fbd5db7b6	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f3-b86b-a5f4-f718f7876070	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f3-b86b-ff90-eb0bf98e57a7	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f3-b86b-1f67-48ae8addab02	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f3-b86b-96d4-d668ec668341	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f3-b86b-e6a4-10c4a73a40c9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f3-b86b-1635-6247738641f6	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f3-b86b-0642-be8024cced85	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f3-b86b-bd95-84454daefe84	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f3-b86b-9f51-c3468d5ae62d	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f3-b86b-b4eb-30a45402b69c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f3-b86b-091a-cb15f6cd395f	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f3-b86b-6f69-ee260572892b	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f3-b86b-0951-b4fb1e81b06b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f3-b86b-afed-47c18736283d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f3-b86b-a3cc-1b81013d3c1c	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f3-b86b-f216-509f0f36f4b3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f3-b86b-0caa-61a795d155fd	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f3-b86b-a4b8-a56bc253e03c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f3-b86b-afc3-a47ac1b1e706	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f3-b86b-673a-7d253eb9affa	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f3-b86b-2065-b48e637698b3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f3-b86b-1436-0a6da15cd993	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f3-b86b-b312-62729f640c81	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f3-b86b-4a66-2ac0dc33ea44	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f3-b86b-1e9b-249cc648e05d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f3-b86b-0638-b244d9497b04	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f3-b86b-5927-ff2944a8e59f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f3-b86b-e856-8fade6b8c93b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f3-b86b-8d8e-52a90a1b08c2	CA	CAN	124	Canada 	Kanada	\N
00040000-55f3-b86b-309d-211939ed224b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f3-b86b-0697-4afd547bb000	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f3-b86b-7f05-5f0464733f72	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f3-b86b-6d1b-a254a6de210b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f3-b86b-7faa-3ac87c1f426b	CL	CHL	152	Chile 	Čile	\N
00040000-55f3-b86b-f479-f9cf79cd5aae	CN	CHN	156	China 	Kitajska	\N
00040000-55f3-b86b-c914-40de39899f00	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f3-b86b-66b3-d633d141e394	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f3-b86b-5f72-900a85867d0b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f3-b86b-7ce5-64193f23143f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f3-b86b-d399-ff5439c44324	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f3-b86b-6d15-056cc59df3f2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f3-b86b-4a1c-79ca30e61318	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f3-b86b-1d77-52d187a0817b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f3-b86b-e3f9-a5b201678ca6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f3-b86b-15fe-e7c0d32a9f83	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f3-b86b-eb3d-ddac23e39966	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f3-b86b-6ea6-b9906857eaf9	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f3-b86b-56c8-64ac0045ad34	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f3-b86b-3885-fcf6c50eef00	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f3-b86b-cc15-78bcf391173b	DK	DNK	208	Denmark 	Danska	\N
00040000-55f3-b86b-0e48-dd352fdff7eb	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f3-b86b-f3e6-2838a8aa170a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f3-b86b-5204-0014f37a3c07	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f3-b86b-72cb-d1bc5b8a4693	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f3-b86b-6ffe-a356a86cd8c5	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f3-b86b-9531-d17d47215370	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f3-b86b-a3f0-b90a226f6ece	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f3-b86b-f400-0feab14e69cb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f3-b86b-5dcb-8723f392e36b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f3-b86b-9e37-81107744c66b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f3-b86b-62ff-f5e7ecd940ad	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f3-b86b-e747-56b8d60b5289	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f3-b86b-d1dd-55a2a855df09	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f3-b86b-c17e-9a9b2fad1e86	FI	FIN	246	Finland 	Finska	\N
00040000-55f3-b86b-f99c-8fcd3fbc8e95	FR	FRA	250	France 	Francija	\N
00040000-55f3-b86b-a5c9-f6a4593a66f5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f3-b86c-15d5-114deddcf719	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f3-b86b-9ec2-7267e6c20455	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f3-b86b-a047-098536c4c2ab	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f3-b86b-21df-9c72ea6325e6	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f3-b86c-b0ca-2a837fbdeff2	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f3-b86c-e225-50a6d363cc2f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f3-b86c-ccf7-86e5eb1dcdbc	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f3-b86c-27f7-c950633d3a76	GH	GHA	288	Ghana 	Gana	\N
00040000-55f3-b86c-a4c7-f6953e5decbd	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f3-b86c-6e4c-998a8ab369f1	GR	GRC	300	Greece 	Grčija	\N
00040000-55f3-b86c-edbc-051a91f4c0ca	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f3-b86c-c53a-c1d3ae8624c9	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f3-b86c-ee76-0a1f589d45d0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f3-b86c-b479-6da40640e0c4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f3-b86c-5897-6c0c81019002	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f3-b86c-028b-27bf92c924bd	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f3-b86c-7927-c4e0ca7f8d16	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f3-b86c-d4ca-709b0c736ec3	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f3-b86c-9d00-7a4a4b2a56e7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f3-b86c-2652-23342d0a6cc8	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f3-b86c-df9a-a20afb06d575	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f3-b86c-4708-89a29e17f4ae	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f3-b86c-79f2-5a422bc65c07	HN	HND	340	Honduras 	Honduras	\N
00040000-55f3-b86c-f8b7-57a72140b080	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f3-b86c-2689-206031dd62ab	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f3-b86c-abae-a8a575c4677c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f3-b86c-bc06-f1db72a22698	IN	IND	356	India 	Indija	\N
00040000-55f3-b86c-068e-104ea3739d06	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f3-b86c-bec0-d71a3a87d346	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f3-b86c-45f7-2865cf464499	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f3-b86c-7820-b1ec532697b8	IE	IRL	372	Ireland 	Irska	\N
00040000-55f3-b86c-ff27-3854b748aec4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f3-b86c-f6bd-891a8522885c	IL	ISR	376	Israel 	Izrael	\N
00040000-55f3-b86c-0340-b64ac5812321	IT	ITA	380	Italy 	Italija	\N
00040000-55f3-b86c-0939-9bc6bbb0f05f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f3-b86c-580c-e8350faa0abf	JP	JPN	392	Japan 	Japonska	\N
00040000-55f3-b86c-1fad-06d888fe7976	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f3-b86c-d1b7-f1bcbd111df6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f3-b86c-a11f-19a210ad4bbb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f3-b86c-3961-4da40c4fd3c5	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f3-b86c-9942-091dc44e8fdc	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f3-b86c-d4e3-ae87c21dcc8a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f3-b86c-c239-af94269fc112	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f3-b86c-932c-0dde372af72b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f3-b86c-10fb-49f4084abda2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f3-b86c-dfdd-ca7300b3b111	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f3-b86c-8874-b2151c573103	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f3-b86c-d67c-7bdfc6071729	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f3-b86c-ec21-f04d8d41d98c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f3-b86c-765e-5a82c290a9ec	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f3-b86c-5749-7f36736810aa	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f3-b86c-f67b-b59fd9533a9b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f3-b86c-5e6d-cc19edefae8f	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f3-b86c-d7de-342452cc0bbd	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f3-b86c-7a9c-2fa1868475db	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f3-b86c-29e8-d24deb9ed1d6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f3-b86c-ff36-a06ec3b77998	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f3-b86c-cb64-5aa2fe5a7eea	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f3-b86c-005d-f90ee250e64a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f3-b86c-5314-6a543a9b5578	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f3-b86c-cf9f-954103c1d46a	ML	MLI	466	Mali 	Mali	\N
00040000-55f3-b86c-a65e-5726f6763bd4	MT	MLT	470	Malta 	Malta	\N
00040000-55f3-b86c-6bc2-64fde6e7122d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f3-b86c-4032-4540b22dfd55	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f3-b86c-e67e-51f5c83b8700	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f3-b86c-9ee8-fda50c266efb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f3-b86c-e42c-c7e6b5c8a9b9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f3-b86c-bc3b-44ad9c7fe847	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f3-b86c-3175-15244b8921d2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f3-b86c-801b-56559dd3f0ae	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f3-b86c-bb56-cf82a019af74	MC	MCO	492	Monaco 	Monako	\N
00040000-55f3-b86c-ad8b-2be985d836de	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f3-b86c-8190-36e2f623d7fd	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f3-b86c-be00-f0c669bd4910	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f3-b86c-3542-0186015b994a	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f3-b86c-bdc5-08aa34b612c9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f3-b86c-41c4-9ebb953f68c2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f3-b86c-8c2b-a0737173da51	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f3-b86c-a72b-ea90a1f1899f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f3-b86c-0c16-c84c6b9d7d43	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f3-b86c-cab4-46e29282700d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f3-b86c-3642-4cba6b00fb1e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f3-b86c-5aa2-bcfc5c00056a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f3-b86c-0760-19b4acd64959	NE	NER	562	Niger 	Niger 	\N
00040000-55f3-b86c-5d15-306c71661ddd	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f3-b86c-c917-f3530c934816	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f3-b86c-60e4-7ff43c52d745	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f3-b86c-615b-c35f82818eef	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f3-b86c-09db-3318c58e0deb	NO	NOR	578	Norway 	Norveška	\N
00040000-55f3-b86c-787a-00064fd41dd5	OM	OMN	512	Oman 	Oman	\N
00040000-55f3-b86c-4fc1-ad03621e9850	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f3-b86c-bc65-9245a739ceee	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f3-b86c-f0cb-fee2d2ae943b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f3-b86c-6bc9-e7d633a062b6	PA	PAN	591	Panama 	Panama	\N
00040000-55f3-b86c-495d-618762127b0b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f3-b86c-a3e1-e8ef2c0814a9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f3-b86c-d6df-e361af283333	PE	PER	604	Peru 	Peru	\N
00040000-55f3-b86c-2b5b-a1d2b4c04d6e	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f3-b86c-1025-070394afd7cd	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f3-b86c-7e76-dd53044ff543	PL	POL	616	Poland 	Poljska	\N
00040000-55f3-b86c-3219-66206fea8787	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f3-b86c-7d79-b76dc02946b5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f3-b86c-f8ad-2ebddf5ad175	QA	QAT	634	Qatar 	Katar	\N
00040000-55f3-b86c-57bb-31e070e23f92	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f3-b86c-ce0f-7aea1184f642	RO	ROU	642	Romania 	Romunija	\N
00040000-55f3-b86c-edac-0b59c8e91cbd	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f3-b86c-d6ae-96826c11f18f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f3-b86c-931b-f18668969747	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f3-b86c-8e2e-f63047f6af01	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f3-b86c-7e6f-ab81d4f3a197	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f3-b86c-75f9-75e094e038fa	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f3-b86c-c77d-fea9bca999ba	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f3-b86c-a2ff-8fbc346c1c85	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f3-b86c-0a31-ac0cf0f0585b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f3-b86c-84c2-3099de01ceae	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f3-b86c-bfb3-acd2242090cd	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f3-b86c-ef5c-3e71d0d0b706	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f3-b86c-e87a-96b6610cad1c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f3-b86c-b23a-1ac1b6a114b6	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f3-b86c-c3fd-fb22b0274cf0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f3-b86c-90e6-feae07c665f2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f3-b86c-3d53-4b35182d2d71	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f3-b86c-658b-9bf69c55610f	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f3-b86c-1d9c-bec13f967e9c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f3-b86c-aee0-957c646d348b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f3-b86c-6051-901f57582df9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f3-b86c-9995-768e04cddbcc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f3-b86c-9d98-da9914c65f3e	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f3-b86c-26ee-2d66fb5002ff	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f3-b86c-5ba9-14d42c82eb4a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f3-b86c-a2b0-ce981a4d752d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f3-b86c-b894-df8bb6e3922c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f3-b86c-c198-05f0698c5e87	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f3-b86c-bd27-a7879c8e3cd8	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f3-b86c-6bf1-76f937a03ac9	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f3-b86c-af96-0e6b4e12463d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f3-b86c-2bf4-92c6c6e57f74	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f3-b86c-16a2-80eb6ca82eb7	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f3-b86c-275a-e97b3f2b9ec0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f3-b86c-2e18-a1efccdae65c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f3-b86c-0cbe-d923b1c841b6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f3-b86c-4f29-9feeba258922	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f3-b86c-53a1-67574c8b8e19	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f3-b86c-a366-a3d05568acb1	TH	THA	764	Thailand 	Tajska	\N
00040000-55f3-b86c-c5f1-2231b78cfb97	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f3-b86c-2161-bbec20ccd769	TG	TGO	768	Togo 	Togo	\N
00040000-55f3-b86c-188b-23fb6cfac0c4	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f3-b86c-7e0c-edd1c9814859	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f3-b86c-c028-42004849b75c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f3-b86c-b247-14870a80715d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f3-b86c-7165-0da425d67322	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f3-b86c-b3e1-76eb6792d2a4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f3-b86c-b7f0-f42d39fa8f34	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f3-b86c-422f-4aaee16a913a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f3-b86c-0a19-933d35a86b2b	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f3-b86c-57e1-d00541839f74	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f3-b86c-af4a-1f7027fe55f3	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f3-b86c-550a-90a1fbb56402	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f3-b86c-1c7e-cd34c1f30147	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f3-b86c-fc85-6990468efab6	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f3-b86c-b4d2-1ddd7eee1457	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f3-b86c-3907-0d158cc7994f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f3-b86c-c43e-70a8be9960a3	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f3-b86c-557b-1711b82fdb32	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f3-b86c-253a-d680df2a332b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f3-b86c-3ec6-8380b3ff2095	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f3-b86c-ba4e-3b77b32b8231	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f3-b86c-6ad5-66246c97c758	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f3-b86c-ea1c-a7566759a8bc	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f3-b86c-eb00-6e1e81a4c593	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f3-b86c-9dea-7011f470a8c6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f3-b86c-43e5-6a29c1e78fe7	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2988 (class 0 OID 19098590)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f3-b86d-a727-52448194428a	000e0000-55f3-b86d-d00a-762c766c6c1e	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f3-b86b-c394-7a12d40cd20d	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f3-b86d-8f21-87ce6643eca0	000e0000-55f3-b86d-dc88-3b0014bd1757	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f3-b86b-7b94-919125e24963	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f3-b86d-d591-b23586056236	000e0000-55f3-b86d-1f29-5381c4078984	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f3-b86b-c394-7a12d40cd20d	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f3-b86d-fb31-9d26ed53e4a2	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f3-b86d-fd53-780f0034f0f7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 19098400)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f3-b86d-4ef5-2235ac239c18	000e0000-55f3-b86d-dc88-3b0014bd1757	000c0000-55f3-b86d-2bcf-4f5e77ff3803	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f3-b86b-61cb-ba5b0e973d46
000d0000-55f3-b86d-c8ae-8e99951db190	000e0000-55f3-b86d-dc88-3b0014bd1757	000c0000-55f3-b86d-37a2-6a04f2b48319	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f3-b86b-a19e-3889c930d139
000d0000-55f3-b86d-3d1e-8f293de6c8f2	000e0000-55f3-b86d-dc88-3b0014bd1757	000c0000-55f3-b86d-a7db-fb242db09e96	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f3-b86b-d42d-d9c96c7e57b1
000d0000-55f3-b86d-4e0f-d57372e956a1	000e0000-55f3-b86d-dc88-3b0014bd1757	000c0000-55f3-b86d-999a-24f75867e787	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f3-b86b-a769-75863236bb54
000d0000-55f3-b86d-1902-2a7c20c41aa0	000e0000-55f3-b86d-dc88-3b0014bd1757	000c0000-55f3-b86d-f364-1f912345bc7d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f3-b86b-a769-75863236bb54
000d0000-55f3-b86d-235a-a8869328a2a3	000e0000-55f3-b86d-dc88-3b0014bd1757	000c0000-55f3-b86d-7dee-88550ffe6940	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f3-b86b-61cb-ba5b0e973d46
000d0000-55f3-b86d-8811-df4645c27da8	000e0000-55f3-b86d-dc88-3b0014bd1757	000c0000-55f3-b86d-a134-c92dbff5607e	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f3-b86b-61cb-ba5b0e973d46
000d0000-55f3-b86d-16cd-327e9412b2bb	000e0000-55f3-b86d-dc88-3b0014bd1757	000c0000-55f3-b86d-2e6e-c1693ff10eaa	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f3-b86b-a1c0-fdf258642898
000d0000-55f3-b86d-71be-36db667811ef	000e0000-55f3-b86d-dc88-3b0014bd1757	000c0000-55f3-b86d-e5a9-3468f9145ceb	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f3-b86b-07ad-dcb092f0c8bb
\.


--
-- TOC entry 2954 (class 0 OID 19098215)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 19098196)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f3-b86d-28c7-89e6f0c88cf9	00080000-55f3-b86d-753c-9be59e19d2a8	00090000-55f3-b86d-c4d3-00e8e360ddf4	AK		igralka
\.


--
-- TOC entry 2963 (class 0 OID 19098314)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 19098796)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19098808)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 19098830)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19098339)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19098153)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f3-b86c-981e-1da64eab1b6a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f3-b86c-d639-05ec6b63d387	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f3-b86c-4bb3-112498cf04de	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f3-b86c-eb72-8eb579d511ea	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f3-b86c-005e-3f41f8c1755e	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f3-b86c-78c5-189273e92eb6	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}s:4:"500s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f3-b86c-3dd6-318dcff5eed8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f3-b86c-77df-e601443f1053	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f3-b86c-3a38-0a11a11d3ab5	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f3-b86c-ec06-ad86dc1d1631	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f3-b86c-fec2-62b02c5093d7	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f3-b86c-5d5f-ce2b54131b5e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f3-b86c-a597-d814fdd924c5	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f3-b86c-ae13-63dd0ab4c214	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f3-b86d-3d36-1f51f4d315c3	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f3-b86d-f2f2-5bd7200ff760	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f3-b86d-b69b-0d74e105c521	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f3-b86d-7238-0a17b51cb7a3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f3-b86d-82c4-25332f5ba0fe	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f3-b86e-f8cd-cc3f641cd312	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2943 (class 0 OID 19098067)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f3-b86d-84a4-14da84acbf05	00000000-55f3-b86d-3d36-1f51f4d315c3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f3-b86d-e0f3-aa2babbf169d	00000000-55f3-b86d-3d36-1f51f4d315c3	00010000-55f3-b86c-2838-689fe0f3bb8d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f3-b86d-4e84-ef579a4bfe7c	00000000-55f3-b86d-f2f2-5bd7200ff760	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2944 (class 0 OID 19098078)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f3-b86d-9673-6c70ada8ce95	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f3-b86d-b25b-dddd88d34162	00010000-55f3-b86d-d8ca-7e835510fdbe	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f3-b86d-fefe-b43ada81e444	00010000-55f3-b86d-5021-c55d30b6ce9e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f3-b86d-db0d-b5067cc44a9a	00010000-55f3-b86d-7715-598e443d7daf	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f3-b86d-a8e8-176111a6f961	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f3-b86d-61de-7ffc17c62244	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f3-b86d-4841-80ed5974b868	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f3-b86d-1767-dbbeb8bade12	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f3-b86d-c4d3-00e8e360ddf4	00010000-55f3-b86d-8236-de529a42c00a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f3-b86d-bcf6-b833bc3b0c2d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f3-b86d-1d49-3686a1a7e74d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f3-b86d-5c25-719f90c5adf0	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f3-b86d-1a9d-076c899b804b	00010000-55f3-b86d-53cc-136f08da3c9b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 19098032)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f3-b86c-9f0f-aa10ccf584a5	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f3-b86c-d0eb-7dddf05a1b18	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f3-b86c-1660-a8152d8795a6	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f3-b86c-7e78-1537fe87085d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f3-b86c-0fd8-54f9e26af966	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f3-b86c-85b1-bd7c5d477419	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f3-b86c-74df-4bdfa6af602d	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f3-b86c-6985-6ad399dbcd78	Abonma-read	Abonma - branje	f
00030000-55f3-b86c-3950-a3ba75f3deb5	Abonma-write	Abonma - spreminjanje	f
00030000-55f3-b86c-053b-778e12c17cf4	Alternacija-read	Alternacija - branje	f
00030000-55f3-b86c-1c64-a7e6fac28720	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f3-b86c-76c7-b85ce802da4f	Arhivalija-read	Arhivalija - branje	f
00030000-55f3-b86c-49ab-0d9da3066e2a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f3-b86c-1b42-5b44d652862e	Besedilo-read	Besedilo - branje	f
00030000-55f3-b86c-b974-4c4a440c53fe	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f3-b86c-020d-1f6898bffaf7	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f3-b86c-c6f7-ae6fe441c98e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f3-b86c-eb0d-7e3cefd331e0	Dogodek-read	Dogodek - branje	f
00030000-55f3-b86c-8b89-155c7d57e2d5	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f3-b86c-9ade-b31685c74f7f	DrugiVir-read	DrugiVir - branje	f
00030000-55f3-b86c-25ee-48586b35a2b8	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f3-b86c-20d0-40799e3204b7	Drzava-read	Drzava - branje	f
00030000-55f3-b86c-4c10-95a5c7b518ec	Drzava-write	Drzava - spreminjanje	f
00030000-55f3-b86c-cb82-48df7b1a4d38	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f3-b86c-0689-fdd1b45440b4	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f3-b86c-cfaa-3658f24e4255	Funkcija-read	Funkcija - branje	f
00030000-55f3-b86c-f0f8-7c13cb7c8116	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f3-b86c-e590-811fe8bdd90c	Gostovanje-read	Gostovanje - branje	f
00030000-55f3-b86c-208d-7e967dfd784a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f3-b86c-9c12-c4fa75f9b65b	Gostujoca-read	Gostujoca - branje	f
00030000-55f3-b86c-45e2-35e59d8c2cec	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f3-b86c-3369-833e62767611	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f3-b86c-c683-9fe89c560141	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f3-b86c-a44f-55db9c33c612	Kupec-read	Kupec - branje	f
00030000-55f3-b86c-6794-6c40685042c8	Kupec-write	Kupec - spreminjanje	f
00030000-55f3-b86c-bea8-6ad6f5cd01db	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f3-b86c-b198-152c0bfb10df	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f3-b86c-d0ad-cccac64c55bc	Option-read	Option - branje	f
00030000-55f3-b86c-65fc-ab389b9c2a27	Option-write	Option - spreminjanje	f
00030000-55f3-b86c-d486-aabb90bb0cfb	OptionValue-read	OptionValue - branje	f
00030000-55f3-b86c-554a-648e8d97cd93	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f3-b86c-9fab-2246c582730d	Oseba-read	Oseba - branje	f
00030000-55f3-b86c-fc05-e5f2bfb683f9	Oseba-write	Oseba - spreminjanje	f
00030000-55f3-b86c-2f06-7d1d6047469f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f3-b86c-ae21-feb3dcd80596	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f3-b86c-dd4f-60368ffab8d5	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f3-b86c-aeb3-326257e6ecca	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f3-b86c-428a-120c68d70516	Pogodba-read	Pogodba - branje	f
00030000-55f3-b86c-110c-4ebd2bbe1b0e	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f3-b86c-c67d-a1780a25ddbc	Popa-read	Popa - branje	f
00030000-55f3-b86c-9497-3ab461032b0a	Popa-write	Popa - spreminjanje	f
00030000-55f3-b86c-da57-21017097c65e	Posta-read	Posta - branje	f
00030000-55f3-b86c-fcf1-b892596e0d59	Posta-write	Posta - spreminjanje	f
00030000-55f3-b86c-056d-35e3e08feda8	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f3-b86c-aab1-32e239f81764	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f3-b86c-2b68-2c39bcd61c6a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f3-b86c-0a9d-c1f81da88e56	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f3-b86c-3708-29f7c754342d	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f3-b86c-102c-d2d45577c7b6	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f3-b86c-c87e-bcacd722739a	Predstava-read	Predstava - branje	f
00030000-55f3-b86c-116a-d4d623af97cf	Predstava-write	Predstava - spreminjanje	f
00030000-55f3-b86c-7802-4e8f9b9946d8	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f3-b86c-1b22-83554f6cddc2	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f3-b86c-19e9-3f3720b098fa	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f3-b86c-cc66-baa0c47f0bed	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f3-b86c-5264-d7dce38fbe8f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f3-b86c-0caf-2ddf4bbee399	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f3-b86c-137e-c6b0a57f5fd9	ProgramDela-read	ProgramDela - branje	f
00030000-55f3-b86c-c226-c332a3805866	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f3-b86c-a916-2f48aacc58ee	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f3-b86c-ab82-ea1f8d96df6f	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f3-b86c-ecbe-6c4884ae788f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f3-b86c-47d2-253b9c3d3a71	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f3-b86c-e63b-b3e595b8852f	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f3-b86c-3276-d35fb30655b8	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f3-b86c-7edb-12e1f80099d0	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f3-b86c-ab72-a3b1ba1665fe	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f3-b86c-7b73-7151562699e3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f3-b86c-e8ba-d7f38b93b2f3	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f3-b86c-3a5b-83d89601d9ad	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f3-b86c-5b82-c479da915007	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f3-b86c-ae4e-653c6672c98a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f3-b86c-e6d7-30995d0e236d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f3-b86c-ca9e-39749f531b1b	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f3-b86c-785f-4f8cebf31228	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f3-b86c-d37b-e3b33d09eee8	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f3-b86c-8722-4d3415e89584	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f3-b86c-bd4f-c909835cf2ef	Prostor-read	Prostor - branje	f
00030000-55f3-b86c-f6f8-2ba6951f8299	Prostor-write	Prostor - spreminjanje	f
00030000-55f3-b86c-8ff0-02fcf47787fb	Racun-read	Racun - branje	f
00030000-55f3-b86c-45bb-f5a06dc3df3e	Racun-write	Racun - spreminjanje	f
00030000-55f3-b86c-915a-c6638c717b94	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f3-b86c-bbe9-88bdbd14ef95	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f3-b86c-d588-91e6d12f7ccd	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f3-b86c-a9cd-b7b7a9f65dc8	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f3-b86c-d2ac-d8aa672c3986	Rekvizit-read	Rekvizit - branje	f
00030000-55f3-b86c-b50e-fc537505eeef	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f3-b86c-cab0-0e0cdaab88bf	Revizija-read	Revizija - branje	f
00030000-55f3-b86c-9647-08ccf62e8364	Revizija-write	Revizija - spreminjanje	f
00030000-55f3-b86c-8dde-f991d7464140	Rezervacija-read	Rezervacija - branje	f
00030000-55f3-b86c-352b-2ef166953f16	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f3-b86c-2fd8-d728f8d04468	SedezniRed-read	SedezniRed - branje	f
00030000-55f3-b86c-4ae6-97edcaf7c618	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f3-b86c-67f4-38ba2f764f30	Sedez-read	Sedez - branje	f
00030000-55f3-b86c-df85-68eb2bac5269	Sedez-write	Sedez - spreminjanje	f
00030000-55f3-b86c-8f1a-50880aa36bc5	Sezona-read	Sezona - branje	f
00030000-55f3-b86c-0dfc-8d0717f6844d	Sezona-write	Sezona - spreminjanje	f
00030000-55f3-b86c-a9ca-f152ce3cb324	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f3-b86c-7662-f6a850e6834f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f3-b86c-3c78-948e3cb078cf	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f3-b86c-fc80-43f8614184a3	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f3-b86c-925b-dd5065792019	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f3-b86c-a2b8-58973abe22d3	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f3-b86c-a56c-16b28812b1eb	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f3-b86c-b1b3-64d451fe43db	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f3-b86c-e608-84962f80de9e	Telefonska-read	Telefonska - branje	f
00030000-55f3-b86c-ca24-74af234da5f6	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f3-b86c-778e-b3e61ae1ab40	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f3-b86c-6d4a-5ed7c74fa291	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f3-b86c-bddf-3624cab079be	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f3-b86c-2d9a-3b8faab0a91c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f3-b86c-b0ad-15e0652a2096	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f3-b86c-79f8-7fa0822cd1ea	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f3-b86c-62ce-08781f12e9e8	Trr-read	Trr - branje	f
00030000-55f3-b86c-e410-33dbd22ca1d4	Trr-write	Trr - spreminjanje	f
00030000-55f3-b86c-b4fd-7e83aca5e475	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f3-b86c-b64e-0e5f1c3a2d6a	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f3-b86c-5f6a-07a752c4d951	Vaja-read	Vaja - branje	f
00030000-55f3-b86c-ac56-7647fbd8d4c4	Vaja-write	Vaja - spreminjanje	f
00030000-55f3-b86c-98db-c9f3eb5aa568	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f3-b86c-c634-c46ce77f83fc	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f3-b86c-7ca2-ec995d4d8bed	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f3-b86c-3ff7-85cb06d80bab	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f3-b86c-e981-8edcaacf0e5e	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f3-b86c-3236-270f485c9c13	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f3-b86c-f7d6-f7aa877115fb	Zasedenost-read	Zasedenost - branje	f
00030000-55f3-b86c-2249-4810bedd8172	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f3-b86c-6aed-4356750ebc7a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f3-b86c-ab50-6377f81d5da7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f3-b86c-7f45-0eaec9c6b27a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f3-b86c-aebf-29a9b8f4a93d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f3-b86c-5999-7ca20fc6c9e3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f3-b86c-dd42-f7c8307b7c47	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f3-b86c-32d9-1dc0ad1c04bd	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f3-b86c-b17e-376448b22ec2	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f3-b86c-c5a0-d932fc3632aa	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f3-b86c-65e0-ee3226a7986d	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f3-b86c-3621-c1e3757d5b39	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f3-b86c-96ff-5f12962f5e32	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f3-b86c-ce93-25320486f748	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f3-b86c-593a-22dce6c898e8	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f3-b86c-a60f-7c25929f88c5	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f3-b86c-ccdf-0da33d5122d8	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2941 (class 0 OID 19098051)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f3-b86c-a7e0-a5c9fcd86587	00030000-55f3-b86c-d0eb-7dddf05a1b18
00020000-55f3-b86c-0c6e-06da68c31bf4	00030000-55f3-b86c-20d0-40799e3204b7
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-6985-6ad399dbcd78
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-3950-a3ba75f3deb5
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-053b-778e12c17cf4
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-1c64-a7e6fac28720
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-76c7-b85ce802da4f
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-eb0d-7e3cefd331e0
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-7e78-1537fe87085d
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-8b89-155c7d57e2d5
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-20d0-40799e3204b7
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-4c10-95a5c7b518ec
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-cfaa-3658f24e4255
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-f0f8-7c13cb7c8116
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-e590-811fe8bdd90c
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-208d-7e967dfd784a
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-9c12-c4fa75f9b65b
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-45e2-35e59d8c2cec
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-3369-833e62767611
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-c683-9fe89c560141
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-d0ad-cccac64c55bc
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-d486-aabb90bb0cfb
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-9fab-2246c582730d
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-fc05-e5f2bfb683f9
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-c67d-a1780a25ddbc
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-9497-3ab461032b0a
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-da57-21017097c65e
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-fcf1-b892596e0d59
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-3708-29f7c754342d
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-102c-d2d45577c7b6
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-c87e-bcacd722739a
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-116a-d4d623af97cf
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-5264-d7dce38fbe8f
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-0caf-2ddf4bbee399
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-bd4f-c909835cf2ef
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-f6f8-2ba6951f8299
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-d588-91e6d12f7ccd
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-a9cd-b7b7a9f65dc8
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-d2ac-d8aa672c3986
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-b50e-fc537505eeef
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-8f1a-50880aa36bc5
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-0dfc-8d0717f6844d
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-bddf-3624cab079be
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-b4fd-7e83aca5e475
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-b64e-0e5f1c3a2d6a
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-5f6a-07a752c4d951
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-ac56-7647fbd8d4c4
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-f7d6-f7aa877115fb
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-2249-4810bedd8172
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-6aed-4356750ebc7a
00020000-55f3-b86c-97ad-25a272f3b8e1	00030000-55f3-b86c-7f45-0eaec9c6b27a
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-6985-6ad399dbcd78
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-76c7-b85ce802da4f
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-eb0d-7e3cefd331e0
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-20d0-40799e3204b7
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-e590-811fe8bdd90c
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-9c12-c4fa75f9b65b
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-3369-833e62767611
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-c683-9fe89c560141
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-d0ad-cccac64c55bc
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-d486-aabb90bb0cfb
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-9fab-2246c582730d
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-fc05-e5f2bfb683f9
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-c67d-a1780a25ddbc
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-da57-21017097c65e
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-3708-29f7c754342d
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-102c-d2d45577c7b6
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-c87e-bcacd722739a
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-bd4f-c909835cf2ef
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-d588-91e6d12f7ccd
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-d2ac-d8aa672c3986
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-8f1a-50880aa36bc5
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-e608-84962f80de9e
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-ca24-74af234da5f6
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-62ce-08781f12e9e8
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-e410-33dbd22ca1d4
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-e981-8edcaacf0e5e
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-3236-270f485c9c13
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-6aed-4356750ebc7a
00020000-55f3-b86c-0704-66d84507c7e5	00030000-55f3-b86c-7f45-0eaec9c6b27a
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-6985-6ad399dbcd78
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-053b-778e12c17cf4
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-76c7-b85ce802da4f
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-49ab-0d9da3066e2a
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-1b42-5b44d652862e
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-020d-1f6898bffaf7
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-eb0d-7e3cefd331e0
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-20d0-40799e3204b7
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-cfaa-3658f24e4255
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-e590-811fe8bdd90c
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-9c12-c4fa75f9b65b
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-3369-833e62767611
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-d0ad-cccac64c55bc
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-d486-aabb90bb0cfb
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-9fab-2246c582730d
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-c67d-a1780a25ddbc
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-da57-21017097c65e
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-c87e-bcacd722739a
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-5264-d7dce38fbe8f
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-bd4f-c909835cf2ef
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-d588-91e6d12f7ccd
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-d2ac-d8aa672c3986
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-8f1a-50880aa36bc5
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-bddf-3624cab079be
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-5f6a-07a752c4d951
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-f7d6-f7aa877115fb
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-6aed-4356750ebc7a
00020000-55f3-b86c-5ff2-d36698ebe28b	00030000-55f3-b86c-7f45-0eaec9c6b27a
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-6985-6ad399dbcd78
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-3950-a3ba75f3deb5
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-1c64-a7e6fac28720
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-76c7-b85ce802da4f
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-eb0d-7e3cefd331e0
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-20d0-40799e3204b7
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-e590-811fe8bdd90c
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-9c12-c4fa75f9b65b
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-d0ad-cccac64c55bc
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-d486-aabb90bb0cfb
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-c67d-a1780a25ddbc
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-da57-21017097c65e
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-c87e-bcacd722739a
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-bd4f-c909835cf2ef
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-d588-91e6d12f7ccd
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-d2ac-d8aa672c3986
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-8f1a-50880aa36bc5
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-bddf-3624cab079be
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-6aed-4356750ebc7a
00020000-55f3-b86c-f3ed-8345bff1e13e	00030000-55f3-b86c-7f45-0eaec9c6b27a
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-6985-6ad399dbcd78
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-76c7-b85ce802da4f
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-eb0d-7e3cefd331e0
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-20d0-40799e3204b7
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-e590-811fe8bdd90c
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-9c12-c4fa75f9b65b
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-d0ad-cccac64c55bc
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-d486-aabb90bb0cfb
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-c67d-a1780a25ddbc
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-da57-21017097c65e
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-c87e-bcacd722739a
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-bd4f-c909835cf2ef
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-d588-91e6d12f7ccd
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-d2ac-d8aa672c3986
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-8f1a-50880aa36bc5
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-778e-b3e61ae1ab40
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-1660-a8152d8795a6
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-bddf-3624cab079be
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-6aed-4356750ebc7a
00020000-55f3-b86c-b6d1-7256ee8cc254	00030000-55f3-b86c-7f45-0eaec9c6b27a
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-9f0f-aa10ccf584a5
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-d0eb-7dddf05a1b18
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-1660-a8152d8795a6
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-7e78-1537fe87085d
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-0fd8-54f9e26af966
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-85b1-bd7c5d477419
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-74df-4bdfa6af602d
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-6985-6ad399dbcd78
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-3950-a3ba75f3deb5
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-053b-778e12c17cf4
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-1c64-a7e6fac28720
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-76c7-b85ce802da4f
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-49ab-0d9da3066e2a
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-1b42-5b44d652862e
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-b974-4c4a440c53fe
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-020d-1f6898bffaf7
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-c6f7-ae6fe441c98e
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-eb0d-7e3cefd331e0
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-8b89-155c7d57e2d5
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-20d0-40799e3204b7
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-4c10-95a5c7b518ec
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-9ade-b31685c74f7f
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-25ee-48586b35a2b8
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-cb82-48df7b1a4d38
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-0689-fdd1b45440b4
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-cfaa-3658f24e4255
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-f0f8-7c13cb7c8116
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-e590-811fe8bdd90c
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-208d-7e967dfd784a
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-9c12-c4fa75f9b65b
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-45e2-35e59d8c2cec
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-3369-833e62767611
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-c683-9fe89c560141
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-a44f-55db9c33c612
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-6794-6c40685042c8
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-bea8-6ad6f5cd01db
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-b198-152c0bfb10df
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-d0ad-cccac64c55bc
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-65fc-ab389b9c2a27
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-d486-aabb90bb0cfb
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-554a-648e8d97cd93
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-9fab-2246c582730d
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-fc05-e5f2bfb683f9
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-2f06-7d1d6047469f
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-ae21-feb3dcd80596
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-dd4f-60368ffab8d5
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-aeb3-326257e6ecca
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-428a-120c68d70516
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-110c-4ebd2bbe1b0e
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-c67d-a1780a25ddbc
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-9497-3ab461032b0a
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-da57-21017097c65e
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-fcf1-b892596e0d59
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-056d-35e3e08feda8
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-aab1-32e239f81764
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-2b68-2c39bcd61c6a
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-0a9d-c1f81da88e56
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-3708-29f7c754342d
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-102c-d2d45577c7b6
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-c87e-bcacd722739a
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-116a-d4d623af97cf
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-7802-4e8f9b9946d8
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-1b22-83554f6cddc2
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-19e9-3f3720b098fa
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-cc66-baa0c47f0bed
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-5264-d7dce38fbe8f
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-0caf-2ddf4bbee399
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-137e-c6b0a57f5fd9
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-c226-c332a3805866
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-a916-2f48aacc58ee
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-ab82-ea1f8d96df6f
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-ecbe-6c4884ae788f
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-47d2-253b9c3d3a71
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-e63b-b3e595b8852f
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-3276-d35fb30655b8
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-7edb-12e1f80099d0
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-ab72-a3b1ba1665fe
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-7b73-7151562699e3
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-e8ba-d7f38b93b2f3
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-3a5b-83d89601d9ad
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-5b82-c479da915007
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-ae4e-653c6672c98a
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-e6d7-30995d0e236d
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-ca9e-39749f531b1b
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-785f-4f8cebf31228
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-d37b-e3b33d09eee8
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-8722-4d3415e89584
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-bd4f-c909835cf2ef
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-f6f8-2ba6951f8299
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-8ff0-02fcf47787fb
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-45bb-f5a06dc3df3e
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-915a-c6638c717b94
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-bbe9-88bdbd14ef95
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-d588-91e6d12f7ccd
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-a9cd-b7b7a9f65dc8
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-d2ac-d8aa672c3986
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-b50e-fc537505eeef
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-cab0-0e0cdaab88bf
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-9647-08ccf62e8364
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-8dde-f991d7464140
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-352b-2ef166953f16
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-2fd8-d728f8d04468
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-4ae6-97edcaf7c618
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-67f4-38ba2f764f30
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-df85-68eb2bac5269
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-8f1a-50880aa36bc5
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-0dfc-8d0717f6844d
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-a9ca-f152ce3cb324
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-7662-f6a850e6834f
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-3c78-948e3cb078cf
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-fc80-43f8614184a3
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-925b-dd5065792019
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-a2b8-58973abe22d3
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-a56c-16b28812b1eb
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-b1b3-64d451fe43db
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-e608-84962f80de9e
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-ca24-74af234da5f6
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-778e-b3e61ae1ab40
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-6d4a-5ed7c74fa291
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-bddf-3624cab079be
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-2d9a-3b8faab0a91c
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-b0ad-15e0652a2096
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-79f8-7fa0822cd1ea
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-62ce-08781f12e9e8
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-e410-33dbd22ca1d4
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-b4fd-7e83aca5e475
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-b64e-0e5f1c3a2d6a
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-5f6a-07a752c4d951
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-ac56-7647fbd8d4c4
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-98db-c9f3eb5aa568
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-c634-c46ce77f83fc
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-7ca2-ec995d4d8bed
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-3ff7-85cb06d80bab
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-e981-8edcaacf0e5e
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-3236-270f485c9c13
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-f7d6-f7aa877115fb
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-2249-4810bedd8172
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-6aed-4356750ebc7a
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-ab50-6377f81d5da7
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-7f45-0eaec9c6b27a
00020000-55f3-b86d-a05f-b2fadec2b1ba	00030000-55f3-b86c-aebf-29a9b8f4a93d
\.


--
-- TOC entry 2968 (class 0 OID 19098346)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19098380)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 19098509)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f3-b86d-b6d3-8a0949746458	00090000-55f3-b86d-9673-6c70ada8ce95	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f3-b86d-8f0e-7e17c192fbe8	00090000-55f3-b86d-61de-7ffc17c62244	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f3-b86d-474a-3a672e5fe8c0	00090000-55f3-b86d-1a9d-076c899b804b	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f3-b86d-f6a4-4d7284e1b55f	00090000-55f3-b86d-bcf6-b833bc3b0c2d	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2946 (class 0 OID 19098111)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f3-b86d-753c-9be59e19d2a8	00040000-55f3-b86c-6051-901f57582df9	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f3-b86d-7da2-e22ac56d28a1	00040000-55f3-b86c-6051-901f57582df9	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f3-b86d-253b-6c373a5a571d	00040000-55f3-b86c-6051-901f57582df9	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f3-b86d-f042-c184ecb27afd	00040000-55f3-b86c-6051-901f57582df9	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f3-b86d-6419-3717209096d6	00040000-55f3-b86c-6051-901f57582df9	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f3-b86d-1ee3-42d359a4708f	00040000-55f3-b86b-c055-541fbd5db7b6	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f3-b86d-c375-31ea50975f37	00040000-55f3-b86b-15fe-e7c0d32a9f83	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f3-b86d-e96d-47daf42a4993	00040000-55f3-b86b-96d4-d668ec668341	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f3-b86d-6139-0997907eacd9	00040000-55f3-b86c-ccf7-86e5eb1dcdbc	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f3-b86e-dd7e-6ecfdeabe80d	00040000-55f3-b86c-6051-901f57582df9	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2948 (class 0 OID 19098145)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f3-b86b-6ede-16b1a0507841	8341	Adlešiči
00050000-55f3-b86b-e36d-bf86a111fe49	5270	Ajdovščina
00050000-55f3-b86b-b4c6-b81e755d7322	6280	Ankaran/Ancarano
00050000-55f3-b86b-6380-9fede81bb8d2	9253	Apače
00050000-55f3-b86b-4ce7-2895a88c3592	8253	Artiče
00050000-55f3-b86b-0a50-b7226e2fbdb5	4275	Begunje na Gorenjskem
00050000-55f3-b86b-7b98-9d99ccc2ca58	1382	Begunje pri Cerknici
00050000-55f3-b86b-49af-494ce53beea1	9231	Beltinci
00050000-55f3-b86b-c532-3100dca58760	2234	Benedikt
00050000-55f3-b86b-9170-47766c44344f	2345	Bistrica ob Dravi
00050000-55f3-b86b-1c39-5a607b5864c9	3256	Bistrica ob Sotli
00050000-55f3-b86b-274f-2f5e970e975d	8259	Bizeljsko
00050000-55f3-b86b-59a4-5030dfc4e82b	1223	Blagovica
00050000-55f3-b86b-1f4d-59a810604c50	8283	Blanca
00050000-55f3-b86b-f2dd-0bc2d031cbc7	4260	Bled
00050000-55f3-b86b-9a90-3d27a6fe4ba8	4273	Blejska Dobrava
00050000-55f3-b86b-45b3-d10c2702e274	9265	Bodonci
00050000-55f3-b86b-b3ab-00fafcc6adf3	9222	Bogojina
00050000-55f3-b86b-b76e-1285484f1122	4263	Bohinjska Bela
00050000-55f3-b86b-530f-5aa0d6cb9a59	4264	Bohinjska Bistrica
00050000-55f3-b86b-df40-e36a2e83b659	4265	Bohinjsko jezero
00050000-55f3-b86b-12d7-059c6b5ecf08	1353	Borovnica
00050000-55f3-b86b-4638-003be1abdb78	8294	Boštanj
00050000-55f3-b86b-0fc3-796fec3783dc	5230	Bovec
00050000-55f3-b86b-3517-1f92bac33650	5295	Branik
00050000-55f3-b86b-ab7e-4be19be501da	3314	Braslovče
00050000-55f3-b86b-8aaa-e308209cc5ee	5223	Breginj
00050000-55f3-b86b-4612-4a16acbbc577	8280	Brestanica
00050000-55f3-b86b-e980-1581ac7bd7b1	2354	Bresternica
00050000-55f3-b86b-7200-b585a59d2c55	4243	Brezje
00050000-55f3-b86b-c651-f4616f3cf0f2	1351	Brezovica pri Ljubljani
00050000-55f3-b86b-a74b-24b7f50a7835	8250	Brežice
00050000-55f3-b86b-1982-29eb2cf26c38	4210	Brnik - Aerodrom
00050000-55f3-b86b-e06c-9b78076de699	8321	Brusnice
00050000-55f3-b86b-86b5-a680cfb4e21e	3255	Buče
00050000-55f3-b86b-eb65-3a6d266a2abe	8276	Bučka 
00050000-55f3-b86b-511f-1e405dd69529	9261	Cankova
00050000-55f3-b86b-065d-02d453cfdd65	3000	Celje 
00050000-55f3-b86b-c36c-57b595324a78	3001	Celje - poštni predali
00050000-55f3-b86b-6e7e-431fa058c4e1	4207	Cerklje na Gorenjskem
00050000-55f3-b86b-37fb-cf39fc994678	8263	Cerklje ob Krki
00050000-55f3-b86b-fe08-a1a49390811c	1380	Cerknica
00050000-55f3-b86b-60f0-fff1d4136835	5282	Cerkno
00050000-55f3-b86b-7eb2-d4188cf92957	2236	Cerkvenjak
00050000-55f3-b86b-bd62-a6d74dbf52a8	2215	Ceršak
00050000-55f3-b86b-8cfc-7d9ff2a45f9f	2326	Cirkovce
00050000-55f3-b86b-1fdf-11eec037efbb	2282	Cirkulane
00050000-55f3-b86b-f7a0-f5e5dff60b67	5273	Col
00050000-55f3-b86b-885a-f47c81839a72	8251	Čatež ob Savi
00050000-55f3-b86b-c6f1-e1416bbec455	1413	Čemšenik
00050000-55f3-b86b-423b-4738315161b9	5253	Čepovan
00050000-55f3-b86b-eb27-a04f60277434	9232	Črenšovci
00050000-55f3-b86b-cea5-5168cfdd1fe6	2393	Črna na Koroškem
00050000-55f3-b86b-1ccb-72d096fe7cda	6275	Črni Kal
00050000-55f3-b86b-8fd8-113fd54819dd	5274	Črni Vrh nad Idrijo
00050000-55f3-b86b-9aaf-3a6ad04f4688	5262	Črniče
00050000-55f3-b86b-3803-dd39917211f1	8340	Črnomelj
00050000-55f3-b86b-3925-e8e5e6bda045	6271	Dekani
00050000-55f3-b86b-ed1d-ef41798c9452	5210	Deskle
00050000-55f3-b86b-98c8-a2b2c073a831	2253	Destrnik
00050000-55f3-b86b-b18f-162612b7ed46	6215	Divača
00050000-55f3-b86b-acc0-baea255d2f5b	1233	Dob
00050000-55f3-b86b-540a-3281dc6133b0	3224	Dobje pri Planini
00050000-55f3-b86b-9a61-5d0bdb36ae25	8257	Dobova
00050000-55f3-b86b-4a43-b3105895d77f	1423	Dobovec
00050000-55f3-b86b-ee67-9dc9f494cc15	5263	Dobravlje
00050000-55f3-b86b-f914-1ff46730cc23	3204	Dobrna
00050000-55f3-b86b-78bb-35d21bc1a796	8211	Dobrnič
00050000-55f3-b86b-6905-892566326772	1356	Dobrova
00050000-55f3-b86b-e3b9-a2b99a44fc1d	9223	Dobrovnik/Dobronak 
00050000-55f3-b86b-e0a5-a169692a4953	5212	Dobrovo v Brdih
00050000-55f3-b86b-33c2-e5a347fe0a5f	1431	Dol pri Hrastniku
00050000-55f3-b86b-c102-99aea8246755	1262	Dol pri Ljubljani
00050000-55f3-b86b-ed04-9b43585cbc0f	1273	Dole pri Litiji
00050000-55f3-b86b-8081-12e7efce8b84	1331	Dolenja vas
00050000-55f3-b86b-8bb8-a2a0e3fcba1b	8350	Dolenjske Toplice
00050000-55f3-b86b-423d-c5f8213da9b6	1230	Domžale
00050000-55f3-b86b-2e68-66f2518db7f8	2252	Dornava
00050000-55f3-b86b-64dd-65b13eea9a3e	5294	Dornberk
00050000-55f3-b86b-e9de-1354187d0874	1319	Draga
00050000-55f3-b86b-aea0-b7f52867d9bc	8343	Dragatuš
00050000-55f3-b86b-33fa-27ad5b18042c	3222	Dramlje
00050000-55f3-b86b-b9ef-5b36716a907f	2370	Dravograd
00050000-55f3-b86b-d7e6-db9ed09e1875	4203	Duplje
00050000-55f3-b86b-8070-0c6a59b8ce8c	6221	Dutovlje
00050000-55f3-b86b-d4b6-bae31134fcae	8361	Dvor
00050000-55f3-b86b-0875-93341a4d1d96	2343	Fala
00050000-55f3-b86b-9910-78a0007b5399	9208	Fokovci
00050000-55f3-b86b-0420-a6d26af4cbcf	2313	Fram
00050000-55f3-b86b-d608-acc4e1a12d2d	3213	Frankolovo
00050000-55f3-b86b-c7fc-8e7ef8ea103a	1274	Gabrovka
00050000-55f3-b86b-4e52-b6bdfcb60730	8254	Globoko
00050000-55f3-b86b-387f-ea07bcaafa6b	5275	Godovič
00050000-55f3-b86b-0dae-fff678ddfcba	4204	Golnik
00050000-55f3-b86b-9286-d514f6f59b93	3303	Gomilsko
00050000-55f3-b86b-4471-4ac0217ce843	4224	Gorenja vas
00050000-55f3-b86b-848c-711e84d5d498	3263	Gorica pri Slivnici
00050000-55f3-b86b-0de0-81fe8c4d4437	2272	Gorišnica
00050000-55f3-b86b-9e3c-a30593e0d1f9	9250	Gornja Radgona
00050000-55f3-b86b-c2d8-41ba816851e8	3342	Gornji Grad
00050000-55f3-b86b-34ca-909a1139aaaf	4282	Gozd Martuljek
00050000-55f3-b86b-1c02-a759b320eda9	6272	Gračišče
00050000-55f3-b86b-918e-8d5bd23b8788	9264	Grad
00050000-55f3-b86b-6d38-daa0ee416ca5	8332	Gradac
00050000-55f3-b86b-049b-d6b8c6d459f2	1384	Grahovo
00050000-55f3-b86b-767c-a81a55a50cdb	5242	Grahovo ob Bači
00050000-55f3-b86b-e290-800d402d3c38	5251	Grgar
00050000-55f3-b86b-dd09-ac02485e68c5	3302	Griže
00050000-55f3-b86b-5242-c84f5388e18c	3231	Grobelno
00050000-55f3-b86b-b932-842f884413cf	1290	Grosuplje
00050000-55f3-b86b-0c6d-69df2331747a	2288	Hajdina
00050000-55f3-b86b-21b8-92f6c019121c	8362	Hinje
00050000-55f3-b86b-0a77-1ed3c07f2e2c	2311	Hoče
00050000-55f3-b86b-3a0e-7fe27821dfa6	9205	Hodoš/Hodos
00050000-55f3-b86b-2c4e-12db5f67430e	1354	Horjul
00050000-55f3-b86b-b61c-8085792c0ca7	1372	Hotedršica
00050000-55f3-b86b-d1dd-b13e74b5249a	1430	Hrastnik
00050000-55f3-b86b-8feb-150e644cd0a4	6225	Hruševje
00050000-55f3-b86b-24a5-48e5a2747757	4276	Hrušica
00050000-55f3-b86b-9e2b-338053412e03	5280	Idrija
00050000-55f3-b86b-f88b-f243d411f078	1292	Ig
00050000-55f3-b86b-fdff-bc6f68c0df9e	6250	Ilirska Bistrica
00050000-55f3-b86b-5c16-9fd71f8b8513	6251	Ilirska Bistrica-Trnovo
00050000-55f3-b86b-4aab-671778f8198d	1295	Ivančna Gorica
00050000-55f3-b86b-0088-7877a3b9b7e9	2259	Ivanjkovci
00050000-55f3-b86b-8fd5-4998ee697d59	1411	Izlake
00050000-55f3-b86b-b33e-7c5ca676839d	6310	Izola/Isola
00050000-55f3-b86b-50de-d444339d98c1	2222	Jakobski Dol
00050000-55f3-b86b-21b6-4f7afca9c9e5	2221	Jarenina
00050000-55f3-b86b-6058-20672672db17	6254	Jelšane
00050000-55f3-b86b-6235-8c2fce2cf892	4270	Jesenice
00050000-55f3-b86b-bbda-4e1edbb5e1dd	8261	Jesenice na Dolenjskem
00050000-55f3-b86b-44e6-ed14717bb3ab	3273	Jurklošter
00050000-55f3-b86b-e615-61c687458a16	2223	Jurovski Dol
00050000-55f3-b86b-7cdf-eabe8db90181	2256	Juršinci
00050000-55f3-b86b-f3b0-55b51e32b6c4	5214	Kal nad Kanalom
00050000-55f3-b86b-650b-269242d4eddd	3233	Kalobje
00050000-55f3-b86b-6d1d-c045539726c6	4246	Kamna Gorica
00050000-55f3-b86b-952b-0a1a2762da80	2351	Kamnica
00050000-55f3-b86b-5b2d-d9d9d8293023	1241	Kamnik
00050000-55f3-b86b-be8f-f993b55185e0	5213	Kanal
00050000-55f3-b86b-b320-c63c2ba26dd1	8258	Kapele
00050000-55f3-b86b-869f-6a4f5fcfd4a5	2362	Kapla
00050000-55f3-b86b-9d49-9b0b9b3176b2	2325	Kidričevo
00050000-55f3-b86b-da53-1700174c628b	1412	Kisovec
00050000-55f3-b86b-867a-327452608964	6253	Knežak
00050000-55f3-b86b-3204-24bb739e225a	5222	Kobarid
00050000-55f3-b86b-c370-6f884d57b1e7	9227	Kobilje
00050000-55f3-b86b-e834-5de0d055fe7a	1330	Kočevje
00050000-55f3-b86b-5941-18e22948c00d	1338	Kočevska Reka
00050000-55f3-b86b-40a3-e2965f645ddf	2276	Kog
00050000-55f3-b86b-6897-31ef953a1dc6	5211	Kojsko
00050000-55f3-b86b-8db2-fc8223cd2d4f	6223	Komen
00050000-55f3-b86b-107c-e7f43d977db5	1218	Komenda
00050000-55f3-b86b-b158-1b596d9522af	6000	Koper/Capodistria 
00050000-55f3-b86b-0ad7-97ca74628c35	6001	Koper/Capodistria - poštni predali
00050000-55f3-b86b-dacf-0d8d01c42e92	8282	Koprivnica
00050000-55f3-b86b-dabb-79dc2c02d6ee	5296	Kostanjevica na Krasu
00050000-55f3-b86b-d76a-1ce389996d43	8311	Kostanjevica na Krki
00050000-55f3-b86b-6667-88a92261928a	1336	Kostel
00050000-55f3-b86b-45ea-e7ce5f397a42	6256	Košana
00050000-55f3-b86b-2c78-26829d292a89	2394	Kotlje
00050000-55f3-b86b-3fcd-16f6fc2bb33a	6240	Kozina
00050000-55f3-b86b-2b4f-083d1be8cf74	3260	Kozje
00050000-55f3-b86b-98b0-bc5ff54e0e29	4000	Kranj 
00050000-55f3-b86b-54dc-dc9505681668	4001	Kranj - poštni predali
00050000-55f3-b86b-dffa-c990a5bd3ff6	4280	Kranjska Gora
00050000-55f3-b86b-07bd-d3d1b792a250	1281	Kresnice
00050000-55f3-b86b-f64c-fdf15b79f5cc	4294	Križe
00050000-55f3-b86b-849e-fda4f85c121c	9206	Križevci
00050000-55f3-b86b-9f3a-3baee4dea07a	9242	Križevci pri Ljutomeru
00050000-55f3-b86b-9a4c-cb941250b31e	1301	Krka
00050000-55f3-b86b-3781-d3f98edf6029	8296	Krmelj
00050000-55f3-b86b-a3ce-acf5bd403571	4245	Kropa
00050000-55f3-b86b-5270-2e155a927385	8262	Krška vas
00050000-55f3-b86b-7bd7-65bf25787bd6	8270	Krško
00050000-55f3-b86b-cb0e-a39683162d41	9263	Kuzma
00050000-55f3-b86b-52f6-f37fbf0a0997	2318	Laporje
00050000-55f3-b86b-48d5-fe624a937fe2	3270	Laško
00050000-55f3-b86b-1dc1-af10a8238339	1219	Laze v Tuhinju
00050000-55f3-b86b-6468-0a7bf6cba9e2	2230	Lenart v Slovenskih goricah
00050000-55f3-b86b-a953-17aaa4cbca92	9220	Lendava/Lendva
00050000-55f3-b86b-b12e-c75d210b8bd0	4248	Lesce
00050000-55f3-b86b-5409-61a3b083cfb0	3261	Lesično
00050000-55f3-b86b-20c9-1726cf72387d	8273	Leskovec pri Krškem
00050000-55f3-b86b-8111-11ee1e609a2a	2372	Libeliče
00050000-55f3-b86b-274f-a4de124b3fe8	2341	Limbuš
00050000-55f3-b86b-3758-32dd3c01fba8	1270	Litija
00050000-55f3-b86b-3345-e2f939ef32a9	3202	Ljubečna
00050000-55f3-b86b-72bf-7ae46e8ae8ad	1000	Ljubljana 
00050000-55f3-b86b-c0d4-2c3ed9443a33	1001	Ljubljana - poštni predali
00050000-55f3-b86b-8e93-398b3f6588b3	1231	Ljubljana - Črnuče
00050000-55f3-b86b-68d5-cb062dcf7e83	1261	Ljubljana - Dobrunje
00050000-55f3-b86b-bba4-d7ffb44b7f76	1260	Ljubljana - Polje
00050000-55f3-b86b-1373-5952b2bc27cf	1210	Ljubljana - Šentvid
00050000-55f3-b86b-7904-5c86018b09e0	1211	Ljubljana - Šmartno
00050000-55f3-b86b-d91f-4f14c74affa7	3333	Ljubno ob Savinji
00050000-55f3-b86b-0b60-8bb954aad8fe	9240	Ljutomer
00050000-55f3-b86b-8a70-9b227764a39b	3215	Loče
00050000-55f3-b86b-0f12-17ce052192c3	5231	Log pod Mangartom
00050000-55f3-b86b-870d-c7e50bb4ae9a	1358	Log pri Brezovici
00050000-55f3-b86b-b94e-71b6a82bf6a8	1370	Logatec
00050000-55f3-b86b-2143-ba2dde076634	1371	Logatec
00050000-55f3-b86b-4280-8ac8920467e2	1434	Loka pri Zidanem Mostu
00050000-55f3-b86b-2376-0387bacc0175	3223	Loka pri Žusmu
00050000-55f3-b86b-014a-cb015e0a8cad	6219	Lokev
00050000-55f3-b86b-022a-275491038840	1318	Loški Potok
00050000-55f3-b86b-4dff-5297f9b81340	2324	Lovrenc na Dravskem polju
00050000-55f3-b86b-3ea9-cb5c5fb88eaa	2344	Lovrenc na Pohorju
00050000-55f3-b86b-3f80-a9ba431b4dd1	3334	Luče
00050000-55f3-b86b-c58d-9c918be160b2	1225	Lukovica
00050000-55f3-b86b-0a38-400980523e56	9202	Mačkovci
00050000-55f3-b86b-d576-37aa8c9a21bf	2322	Majšperk
00050000-55f3-b86b-2b40-2aea9dd4702c	2321	Makole
00050000-55f3-b86b-6258-e7bad5106a2a	9243	Mala Nedelja
00050000-55f3-b86b-a75f-00f9f259bd71	2229	Malečnik
00050000-55f3-b86b-3c75-d41d9f6ec9f4	6273	Marezige
00050000-55f3-b86b-1dac-7689ec60537f	2000	Maribor 
00050000-55f3-b86b-a439-226423821e50	2001	Maribor - poštni predali
00050000-55f3-b86b-455f-e67bb6b95017	2206	Marjeta na Dravskem polju
00050000-55f3-b86b-3d63-6772b1eb4277	2281	Markovci
00050000-55f3-b86b-6578-190f54299ba4	9221	Martjanci
00050000-55f3-b86b-8c73-4a0700c0001b	6242	Materija
00050000-55f3-b86b-b6ea-2a148b10b8c9	4211	Mavčiče
00050000-55f3-b86b-a403-3846b10ac64e	1215	Medvode
00050000-55f3-b86b-2c01-afec179a574a	1234	Mengeš
00050000-55f3-b86b-e0a1-ebaec508f5b2	8330	Metlika
00050000-55f3-b86b-c15c-0c9edf9aa1f4	2392	Mežica
00050000-55f3-b86b-4a21-e472f5360954	2204	Miklavž na Dravskem polju
00050000-55f3-b86b-89b7-4b73dab5d735	2275	Miklavž pri Ormožu
00050000-55f3-b86b-0378-ca7615e5705a	5291	Miren
00050000-55f3-b86b-4b6c-9dc98c035a7d	8233	Mirna
00050000-55f3-b86b-7aa1-c88f3e33a8f5	8216	Mirna Peč
00050000-55f3-b86b-c39a-dd7684eb4278	2382	Mislinja
00050000-55f3-b86b-7c65-e9c33adbb812	4281	Mojstrana
00050000-55f3-b86b-ec96-5b5c03a0a038	8230	Mokronog
00050000-55f3-b86b-5da9-c9aea9485f79	1251	Moravče
00050000-55f3-b86b-cf79-58614f029c07	9226	Moravske Toplice
00050000-55f3-b86b-1031-bebe24c9bb60	5216	Most na Soči
00050000-55f3-b86b-004f-f654b767fd80	1221	Motnik
00050000-55f3-b86b-dec7-8bcaedc66ac2	3330	Mozirje
00050000-55f3-b86b-d9f9-111006f55b24	9000	Murska Sobota 
00050000-55f3-b86b-4d28-21d53ebae3b0	9001	Murska Sobota - poštni predali
00050000-55f3-b86b-b769-83e71496073b	2366	Muta
00050000-55f3-b86b-f0f2-a643094dc266	4202	Naklo
00050000-55f3-b86b-0ceb-15e60554c31c	3331	Nazarje
00050000-55f3-b86b-41b1-e64c5c5fcb3f	1357	Notranje Gorice
00050000-55f3-b86b-1739-793ee68e6b22	3203	Nova Cerkev
00050000-55f3-b86b-5822-2d8948008260	5000	Nova Gorica 
00050000-55f3-b86b-4b3e-b5476d38adb5	5001	Nova Gorica - poštni predali
00050000-55f3-b86b-30a0-1126551b576a	1385	Nova vas
00050000-55f3-b86b-acf5-a6cec6735b89	8000	Novo mesto
00050000-55f3-b86b-2aa7-68fdfb0ed710	8001	Novo mesto - poštni predali
00050000-55f3-b86b-4f36-cb97417dd460	6243	Obrov
00050000-55f3-b86b-f987-330313e840fe	9233	Odranci
00050000-55f3-b86b-004f-743890df340a	2317	Oplotnica
00050000-55f3-b86b-a9ef-2a1414389911	2312	Orehova vas
00050000-55f3-b86b-9d3f-a530301d0361	2270	Ormož
00050000-55f3-b86b-81d4-0133ee059419	1316	Ortnek
00050000-55f3-b86b-d2ee-7a21e8f10925	1337	Osilnica
00050000-55f3-b86b-6b59-9e0b0361ae13	8222	Otočec
00050000-55f3-b86b-9522-cc04b801d9f1	2361	Ožbalt
00050000-55f3-b86b-2155-e60c4f5536a8	2231	Pernica
00050000-55f3-b86b-1f8e-c064147b71e4	2211	Pesnica pri Mariboru
00050000-55f3-b86b-14af-fe15ca5ba90e	9203	Petrovci
00050000-55f3-b86b-c4c8-db82147b2d6b	3301	Petrovče
00050000-55f3-b86b-6504-59b7c4bac7d8	6330	Piran/Pirano
00050000-55f3-b86b-4765-59d58b6e527f	8255	Pišece
00050000-55f3-b86b-0eca-1a1b99db41f6	6257	Pivka
00050000-55f3-b86b-b14f-a6f099706d44	6232	Planina
00050000-55f3-b86b-bb38-34e94d38e454	3225	Planina pri Sevnici
00050000-55f3-b86b-bf91-3a218daf433d	6276	Pobegi
00050000-55f3-b86b-0497-fceed314f01a	8312	Podbočje
00050000-55f3-b86b-0a6f-4f0b6974c637	5243	Podbrdo
00050000-55f3-b86b-40a8-4b352e560401	3254	Podčetrtek
00050000-55f3-b86b-33da-7ef9687787a8	2273	Podgorci
00050000-55f3-b86b-7486-ecd47b0afe3d	6216	Podgorje
00050000-55f3-b86b-68bc-68964e3f4b76	2381	Podgorje pri Slovenj Gradcu
00050000-55f3-b86b-ae5f-af9bbca290f6	6244	Podgrad
00050000-55f3-b86b-2c1b-e50928ce3ad2	1414	Podkum
00050000-55f3-b86b-52c0-e975fa91e58d	2286	Podlehnik
00050000-55f3-b86b-340d-c5bb68da385a	5272	Podnanos
00050000-55f3-b86b-51db-fa2b49fa1908	4244	Podnart
00050000-55f3-b86b-fdac-ab3b9534e5de	3241	Podplat
00050000-55f3-b86b-0523-5def72bae62f	3257	Podsreda
00050000-55f3-b86b-3155-5febec453ee6	2363	Podvelka
00050000-55f3-b86b-d26f-3ec4b2ba8fba	2208	Pohorje
00050000-55f3-b86b-bb1a-903f250d9a66	2257	Polenšak
00050000-55f3-b86b-2688-b988b59b7216	1355	Polhov Gradec
00050000-55f3-b86b-b48a-82013c75590d	4223	Poljane nad Škofjo Loko
00050000-55f3-b86b-2c23-b232fff06b39	2319	Poljčane
00050000-55f3-b86b-1d8d-2468cf10e58a	1272	Polšnik
00050000-55f3-b86b-4037-d0bce9a564b7	3313	Polzela
00050000-55f3-b86b-4212-b3d289961f0f	3232	Ponikva
00050000-55f3-b86b-5909-efc676d84cc6	6320	Portorož/Portorose
00050000-55f3-b86b-64fc-19a0a8e3fed4	6230	Postojna
00050000-55f3-b86b-dc16-767ba2816629	2331	Pragersko
00050000-55f3-b86b-2fe9-d76981cb733a	3312	Prebold
00050000-55f3-b86b-ec19-76616c9369b3	4205	Preddvor
00050000-55f3-b86b-298b-c0d31088deb9	6255	Prem
00050000-55f3-b86b-2042-4bcf65fe4ca8	1352	Preserje
00050000-55f3-b86b-5a91-92d67b18e781	6258	Prestranek
00050000-55f3-b86b-be3c-3ff5ea7f8cdc	2391	Prevalje
00050000-55f3-b86b-0561-341cb38a4dae	3262	Prevorje
00050000-55f3-b86b-149a-6920e305b2c8	1276	Primskovo 
00050000-55f3-b86b-52e5-62bfb866752e	3253	Pristava pri Mestinju
00050000-55f3-b86b-5417-a9c0e809af19	9207	Prosenjakovci/Partosfalva
00050000-55f3-b86b-ca6a-fff3359027ac	5297	Prvačina
00050000-55f3-b86b-de65-d49096303ee2	2250	Ptuj
00050000-55f3-b86b-a6b5-e7a6d9dbee04	2323	Ptujska Gora
00050000-55f3-b86b-7b63-5be030d6eea5	9201	Puconci
00050000-55f3-b86b-5069-577085b2277d	2327	Rače
00050000-55f3-b86b-a431-7c932e4c6670	1433	Radeče
00050000-55f3-b86b-ca21-3b006f253a00	9252	Radenci
00050000-55f3-b86b-4b0e-c450cc7f4e4f	2360	Radlje ob Dravi
00050000-55f3-b86b-61a5-2a6d364eba3a	1235	Radomlje
00050000-55f3-b86b-2873-7e7f5efa212f	4240	Radovljica
00050000-55f3-b86b-59a2-bce7d3670815	8274	Raka
00050000-55f3-b86b-619c-4c69acb9f6d8	1381	Rakek
00050000-55f3-b86b-b448-3720d2897527	4283	Rateče - Planica
00050000-55f3-b86b-90ce-abcd51e103b6	2390	Ravne na Koroškem
00050000-55f3-b86b-f355-82520ea0a0a3	9246	Razkrižje
00050000-55f3-b86b-2b44-ccbdb102a3d0	3332	Rečica ob Savinji
00050000-55f3-b86b-ef6d-61aa81c1f48b	5292	Renče
00050000-55f3-b86b-780b-966ef6a75c91	1310	Ribnica
00050000-55f3-b86b-8436-f76edaf385ea	2364	Ribnica na Pohorju
00050000-55f3-b86b-a7c8-89e60a610ad6	3272	Rimske Toplice
00050000-55f3-b86b-9733-ea75d7b86378	1314	Rob
00050000-55f3-b86b-6528-6a9a6d35855c	5215	Ročinj
00050000-55f3-b86b-7d5a-0aa4f4914b84	3250	Rogaška Slatina
00050000-55f3-b86b-b2ba-feb1886a60a7	9262	Rogašovci
00050000-55f3-b86b-c297-9b885aabf03b	3252	Rogatec
00050000-55f3-b86b-57fe-59828dc8efee	1373	Rovte
00050000-55f3-b86b-d878-10f15f645cea	2342	Ruše
00050000-55f3-b86b-d293-6ec21f852d5e	1282	Sava
00050000-55f3-b86b-eb44-7ae2919e34b8	6333	Sečovlje/Sicciole
00050000-55f3-b86b-ea23-a62bc511a5e9	4227	Selca
00050000-55f3-b86b-01a4-0535a4ed508b	2352	Selnica ob Dravi
00050000-55f3-b86b-6d08-52844c05882f	8333	Semič
00050000-55f3-b86b-324f-fd3725707390	8281	Senovo
00050000-55f3-b86b-4f45-8a8affba8903	6224	Senožeče
00050000-55f3-b86b-a237-850c731b1f78	8290	Sevnica
00050000-55f3-b86b-b2c8-22d86a8b1f80	6210	Sežana
00050000-55f3-b86b-a03d-cbf01b07c7d8	2214	Sladki Vrh
00050000-55f3-b86b-357b-30ec93a29254	5283	Slap ob Idrijci
00050000-55f3-b86b-abac-521cc9ad0181	2380	Slovenj Gradec
00050000-55f3-b86b-db1a-0d4d664aab2f	2310	Slovenska Bistrica
00050000-55f3-b86b-0055-ba7bb75634f2	3210	Slovenske Konjice
00050000-55f3-b86b-789b-0ebd3a3fa464	1216	Smlednik
00050000-55f3-b86b-1813-64f47e84594c	5232	Soča
00050000-55f3-b86b-bb49-92cc7a64d217	1317	Sodražica
00050000-55f3-b86b-71a4-1176b9beff79	3335	Solčava
00050000-55f3-b86b-513c-e1b85c6a0ada	5250	Solkan
00050000-55f3-b86b-5fb3-084743663d3f	4229	Sorica
00050000-55f3-b86b-9ee8-650ac3d99ecf	4225	Sovodenj
00050000-55f3-b86b-3038-385368fb574b	5281	Spodnja Idrija
00050000-55f3-b86b-e7cd-079005a190b8	2241	Spodnji Duplek
00050000-55f3-b86b-002c-4b437e8b64e3	9245	Spodnji Ivanjci
00050000-55f3-b86b-7630-7256b5a58073	2277	Središče ob Dravi
00050000-55f3-b86b-e132-0e46aa861370	4267	Srednja vas v Bohinju
00050000-55f3-b86b-a004-ef7cca6ce5fe	8256	Sromlje 
00050000-55f3-b86b-38c3-f0146aaa6963	5224	Srpenica
00050000-55f3-b86b-4b73-ec00c1ba888d	1242	Stahovica
00050000-55f3-b86b-13fe-5b6fa46ef954	1332	Stara Cerkev
00050000-55f3-b86b-1ce7-4b183265f8c4	8342	Stari trg ob Kolpi
00050000-55f3-b86b-a98b-82a02f09aff3	1386	Stari trg pri Ložu
00050000-55f3-b86b-00df-9f6bb422c2d9	2205	Starše
00050000-55f3-b86b-eb43-6f97e7cb40cc	2289	Stoperce
00050000-55f3-b86b-1936-637a7c060df8	8322	Stopiče
00050000-55f3-b86b-914c-6b8e744bc657	3206	Stranice
00050000-55f3-b86b-03ef-9704babea6ae	8351	Straža
00050000-55f3-b86b-7412-d3525b108d0c	1313	Struge
00050000-55f3-b86b-c92b-5ef3b05051af	8293	Studenec
00050000-55f3-b86b-fcad-29d08e19d852	8331	Suhor
00050000-55f3-b86b-4b13-7c2e0ef36e8c	2233	Sv. Ana v Slovenskih goricah
00050000-55f3-b86b-bae1-780d257dad61	2235	Sv. Trojica v Slovenskih goricah
00050000-55f3-b86b-e14b-291853c869f1	2353	Sveti Duh na Ostrem Vrhu
00050000-55f3-b86b-9f11-4cf042de4061	9244	Sveti Jurij ob Ščavnici
00050000-55f3-b86b-fae5-a099efa0a244	3264	Sveti Štefan
00050000-55f3-b86b-f6fd-d93a02fae973	2258	Sveti Tomaž
00050000-55f3-b86b-0c91-2a33fcad8654	9204	Šalovci
00050000-55f3-b86b-ce85-93c71b70a2bf	5261	Šempas
00050000-55f3-b86b-0c2a-7eaa739ecb35	5290	Šempeter pri Gorici
00050000-55f3-b86b-9990-ecc2716df8de	3311	Šempeter v Savinjski dolini
00050000-55f3-b86b-5d0d-6b14df0e19c2	4208	Šenčur
00050000-55f3-b86b-4b8c-0425e072411c	2212	Šentilj v Slovenskih goricah
00050000-55f3-b86b-b2e7-b1dc13b153cf	8297	Šentjanž
00050000-55f3-b86b-3a6b-64aa1102a875	2373	Šentjanž pri Dravogradu
00050000-55f3-b86b-8453-1f2ab1af3ccf	8310	Šentjernej
00050000-55f3-b86b-a508-3b696735c133	3230	Šentjur
00050000-55f3-b86b-23e8-3811501507cd	3271	Šentrupert
00050000-55f3-b86b-40c0-1bd6fd80ca29	8232	Šentrupert
00050000-55f3-b86b-81e8-75d9079d7156	1296	Šentvid pri Stični
00050000-55f3-b86b-b796-68782031ffdd	8275	Škocjan
00050000-55f3-b86b-46b7-86461a5b2e6a	6281	Škofije
00050000-55f3-b86b-2e9c-899bf73b6b08	4220	Škofja Loka
00050000-55f3-b86b-3adf-6ea53a654a6b	3211	Škofja vas
00050000-55f3-b86b-d178-2bfaec596236	1291	Škofljica
00050000-55f3-b86b-0079-d5e738c900a1	6274	Šmarje
00050000-55f3-b86b-c073-fe22a91a9ab3	1293	Šmarje - Sap
00050000-55f3-b86b-28be-932f65c7e12c	3240	Šmarje pri Jelšah
00050000-55f3-b86b-bb83-0df72a3126f2	8220	Šmarješke Toplice
00050000-55f3-b86b-9188-af2de1ee6969	2315	Šmartno na Pohorju
00050000-55f3-b86b-31da-531addfa8245	3341	Šmartno ob Dreti
00050000-55f3-b86b-6cc8-b4f4a0134d2b	3327	Šmartno ob Paki
00050000-55f3-b86b-da25-375846d68823	1275	Šmartno pri Litiji
00050000-55f3-b86b-d367-4b070158cca3	2383	Šmartno pri Slovenj Gradcu
00050000-55f3-b86b-b8c4-8e35d2df5cdc	3201	Šmartno v Rožni dolini
00050000-55f3-b86b-a67c-4f63e2591cc7	3325	Šoštanj
00050000-55f3-b86b-7b84-eff38209ebb9	6222	Štanjel
00050000-55f3-b86b-d084-c0432fe4136d	3220	Štore
00050000-55f3-b86b-8d11-e55bee06b3a9	3304	Tabor
00050000-55f3-b86b-6605-1ce3279e68b9	3221	Teharje
00050000-55f3-b86b-5774-5f82c8d4919e	9251	Tišina
00050000-55f3-b86b-04d0-e983cecf9c22	5220	Tolmin
00050000-55f3-b86b-4f20-2dec7b722b9d	3326	Topolšica
00050000-55f3-b86b-2223-a2e69a87e85e	2371	Trbonje
00050000-55f3-b86b-92c2-0e8b3242c7b9	1420	Trbovlje
00050000-55f3-b86b-cfb9-e4d7da9c1b9a	8231	Trebelno 
00050000-55f3-b86b-9e85-9945ca444ecf	8210	Trebnje
00050000-55f3-b86b-5493-209a01eb0642	5252	Trnovo pri Gorici
00050000-55f3-b86b-e593-62aae09476ee	2254	Trnovska vas
00050000-55f3-b86b-6957-d088f205e287	1222	Trojane
00050000-55f3-b86b-895e-32346e87f639	1236	Trzin
00050000-55f3-b86b-390e-3fd79f64897c	4290	Tržič
00050000-55f3-b86b-3587-71d701aff50c	8295	Tržišče
00050000-55f3-b86b-b675-eea49bb7a153	1311	Turjak
00050000-55f3-b86b-08bb-de62eccb5817	9224	Turnišče
00050000-55f3-b86b-8e86-e50680a1c03e	8323	Uršna sela
00050000-55f3-b86b-09ab-0e1739234c39	1252	Vače
00050000-55f3-b86b-4793-f69dad2bed9f	3320	Velenje 
00050000-55f3-b86b-cdf5-12dd5766b12a	3322	Velenje - poštni predali
00050000-55f3-b86b-c2ed-7680ad25da8a	8212	Velika Loka
00050000-55f3-b86b-b94c-1bf352c828a2	2274	Velika Nedelja
00050000-55f3-b86b-d780-977c25389833	9225	Velika Polana
00050000-55f3-b86b-89db-d81c48e3c985	1315	Velike Lašče
00050000-55f3-b86b-ff2c-5384e1b4183b	8213	Veliki Gaber
00050000-55f3-b86b-bfa7-cb60cd11a139	9241	Veržej
00050000-55f3-b86b-dfce-43c6b1506ede	1312	Videm - Dobrepolje
00050000-55f3-b86b-cfc6-f643fd0972d6	2284	Videm pri Ptuju
00050000-55f3-b86b-5f92-572b6dbf419e	8344	Vinica
00050000-55f3-b86b-974a-494b1fc24120	5271	Vipava
00050000-55f3-b86b-d366-5029163d3da8	4212	Visoko
00050000-55f3-b86b-4272-a1a0913b4b2d	1294	Višnja Gora
00050000-55f3-b86b-c1cd-34d0d44d5427	3205	Vitanje
00050000-55f3-b86b-35fe-9436920ea16f	2255	Vitomarci
00050000-55f3-b86b-91fc-4b0f2920de22	1217	Vodice
00050000-55f3-b86b-3036-e9feb9d3eb34	3212	Vojnik\t
00050000-55f3-b86b-1298-927aa4a50378	5293	Volčja Draga
00050000-55f3-b86b-11f7-a04563ddf939	2232	Voličina
00050000-55f3-b86b-4bf4-8a1769b67a41	3305	Vransko
00050000-55f3-b86b-7d9f-6673656e9cc5	6217	Vremski Britof
00050000-55f3-b86b-6ef3-8d8fffaa416b	1360	Vrhnika
00050000-55f3-b86b-9469-a89bd5bce56b	2365	Vuhred
00050000-55f3-b86b-88f4-0d47523ebffd	2367	Vuzenica
00050000-55f3-b86b-0315-125ee664a0ff	8292	Zabukovje 
00050000-55f3-b86b-821e-e958e010c7d3	1410	Zagorje ob Savi
00050000-55f3-b86b-1774-8cac1fd2fc46	1303	Zagradec
00050000-55f3-b86b-c094-6bba2c090726	2283	Zavrč
00050000-55f3-b86b-0290-48a8deedbd2d	8272	Zdole 
00050000-55f3-b86b-fd58-644e803819f1	4201	Zgornja Besnica
00050000-55f3-b86b-b9f8-5ec3d0800e83	2242	Zgornja Korena
00050000-55f3-b86b-abdf-4f116e6fd83f	2201	Zgornja Kungota
00050000-55f3-b86b-8a6e-8691aaecafa9	2316	Zgornja Ložnica
00050000-55f3-b86b-6d70-20a111679a3a	2314	Zgornja Polskava
00050000-55f3-b86b-44f1-a05ad248e372	2213	Zgornja Velka
00050000-55f3-b86b-7ed9-b277d7a0029c	4247	Zgornje Gorje
00050000-55f3-b86b-4e48-8580437c9d96	4206	Zgornje Jezersko
00050000-55f3-b86b-6807-2cf4205e0ae1	2285	Zgornji Leskovec
00050000-55f3-b86b-c9c0-68fc004e5bae	1432	Zidani Most
00050000-55f3-b86b-358c-2462d1702379	3214	Zreče
00050000-55f3-b86b-82ae-6ab607537008	4209	Žabnica
00050000-55f3-b86b-0878-7305e4aefbb6	3310	Žalec
00050000-55f3-b86b-01db-09d0398430ea	4228	Železniki
00050000-55f3-b86b-5047-1e1e5a74b032	2287	Žetale
00050000-55f3-b86b-7235-9ee215a310ae	4226	Žiri
00050000-55f3-b86b-1a7d-dd499facb05f	4274	Žirovnica
00050000-55f3-b86b-8af6-52e6b4506af8	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 19098688)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 19098320)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 19098130)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f3-b86d-815e-0f03207d63f1	00080000-55f3-b86d-753c-9be59e19d2a8	\N	00040000-55f3-b86c-6051-901f57582df9	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f3-b86d-475f-e17c4d39ae1b	00080000-55f3-b86d-753c-9be59e19d2a8	\N	00040000-55f3-b86c-6051-901f57582df9	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f3-b86d-3bda-2ca73d9f00be	00080000-55f3-b86d-7da2-e22ac56d28a1	\N	00040000-55f3-b86c-6051-901f57582df9	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 19098208)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19098332)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19098702)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19098712)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f3-b86d-cfef-a65f25aa8924	00080000-55f3-b86d-253b-6c373a5a571d	0987	AK
00190000-55f3-b86d-81d6-6ec5f9c7d0df	00080000-55f3-b86d-7da2-e22ac56d28a1	0989	AK
00190000-55f3-b86d-ad2e-df91ec583735	00080000-55f3-b86d-f042-c184ecb27afd	0986	AK
00190000-55f3-b86d-9593-d7cc9f638f19	00080000-55f3-b86d-1ee3-42d359a4708f	0984	AK
00190000-55f3-b86d-2145-38c201ea0b12	00080000-55f3-b86d-c375-31ea50975f37	0983	AK
00190000-55f3-b86d-a373-a5b243b507ec	00080000-55f3-b86d-e96d-47daf42a4993	0982	AK
00190000-55f3-b86e-3edd-4cd3045a3c82	00080000-55f3-b86e-dd7e-6ecfdeabe80d	1001	AK
\.


--
-- TOC entry 2989 (class 0 OID 19098645)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f3-b86d-bc89-eb63c1744b90	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2993 (class 0 OID 19098720)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 19098361)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f3-b86d-aec2-1d57d28b69f8	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f3-b86d-feb7-492725a3697b	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f3-b86d-2d66-49a8be76279f	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f3-b86d-2d5c-82c401c4a183	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f3-b86d-98c1-ffdce558d916	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f3-b86d-9997-4f2793306651	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f3-b86d-a28b-a60c75642eb7	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2962 (class 0 OID 19098305)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19098295)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19098498)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19098435)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 19098003)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f3-b86e-dd7e-6ecfdeabe80d	00010000-55f3-b86c-0f1b-83dde2b313f4	2015-09-12 07:30:22	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f3-b86e-f8cd-cc3f641cd312	00010000-55f3-b86c-0f1b-83dde2b313f4	2015-09-12 07:30:22	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f3-b86e-3edd-4cd3045a3c82	00010000-55f3-b86c-0f1b-83dde2b313f4	2015-09-12 07:30:22	INS	a:0:{}
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2971 (class 0 OID 19098374)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 19098041)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f3-b86c-a7e0-a5c9fcd86587	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f3-b86c-0c6e-06da68c31bf4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f3-b86c-895f-0901d5538e80	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f3-b86c-8508-b22328044b8f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f3-b86c-97ad-25a272f3b8e1	planer	Planer dogodkov v koledarju	t
00020000-55f3-b86c-0704-66d84507c7e5	kadrovska	Kadrovska služba	t
00020000-55f3-b86c-5ff2-d36698ebe28b	arhivar	Ažuriranje arhivalij	t
00020000-55f3-b86c-f3ed-8345bff1e13e	igralec	Igralec	t
00020000-55f3-b86c-b6d1-7256ee8cc254	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f3-b86d-a05f-b2fadec2b1ba	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2938 (class 0 OID 19098025)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f3-b86c-2838-689fe0f3bb8d	00020000-55f3-b86c-895f-0901d5538e80
00010000-55f3-b86c-0f1b-83dde2b313f4	00020000-55f3-b86c-895f-0901d5538e80
00010000-55f3-b86d-f3d7-c405448caaf3	00020000-55f3-b86d-a05f-b2fadec2b1ba
\.


--
-- TOC entry 2973 (class 0 OID 19098388)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19098326)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 19098272)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 19097990)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f3-b86b-b8e1-a1bcc4bd4360	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f3-b86b-3df0-9188dd95e344	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f3-b86b-281f-6e6d1aa5feb1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f3-b86b-6f9f-2d25a2588c70	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f3-b86b-1bfd-eb98f8117bef	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2933 (class 0 OID 19097982)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f3-b86b-822c-9160f2677d72	00230000-55f3-b86b-6f9f-2d25a2588c70	popa
00240000-55f3-b86b-dc4b-e38ace299cba	00230000-55f3-b86b-6f9f-2d25a2588c70	oseba
00240000-55f3-b86b-a4ee-5e352b5ccaf0	00230000-55f3-b86b-6f9f-2d25a2588c70	sezona
00240000-55f3-b86b-ee87-bf60774986b7	00230000-55f3-b86b-3df0-9188dd95e344	prostor
00240000-55f3-b86b-3f76-bddfb594fd50	00230000-55f3-b86b-6f9f-2d25a2588c70	besedilo
00240000-55f3-b86b-2bb0-62b7b2b3fdbe	00230000-55f3-b86b-6f9f-2d25a2588c70	uprizoritev
00240000-55f3-b86b-86b9-8e8f1b9adc30	00230000-55f3-b86b-6f9f-2d25a2588c70	funkcija
00240000-55f3-b86b-e1df-3cc92078f730	00230000-55f3-b86b-6f9f-2d25a2588c70	tipfunkcije
00240000-55f3-b86b-714b-9f09e6703582	00230000-55f3-b86b-6f9f-2d25a2588c70	alternacija
00240000-55f3-b86b-d4cb-4d9c851461ff	00230000-55f3-b86b-b8e1-a1bcc4bd4360	pogodba
00240000-55f3-b86b-635e-0b0e953f439d	00230000-55f3-b86b-6f9f-2d25a2588c70	zaposlitev
00240000-55f3-b86b-970f-9a5444f26895	00230000-55f3-b86b-6f9f-2d25a2588c70	zvrstuprizoritve
00240000-55f3-b86b-a9e3-f61e3ac2f0d6	00230000-55f3-b86b-b8e1-a1bcc4bd4360	programdela
00240000-55f3-b86b-8ab4-d7bb56d46bc0	00230000-55f3-b86b-6f9f-2d25a2588c70	zapis
\.


--
-- TOC entry 2932 (class 0 OID 19097977)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5bd356c1-b1d3-4531-a4e2-ec77ff0fb351	00240000-55f3-b86b-822c-9160f2677d72	0	1001
\.


--
-- TOC entry 2978 (class 0 OID 19098445)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f3-b86d-cb87-6ccfa41baeef	000e0000-55f3-b86d-dc88-3b0014bd1757	00080000-55f3-b86d-753c-9be59e19d2a8	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f3-b86c-b27a-856c23fee581
00270000-55f3-b86d-093c-c55c5568e5cb	000e0000-55f3-b86d-dc88-3b0014bd1757	00080000-55f3-b86d-753c-9be59e19d2a8	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f3-b86c-b27a-856c23fee581
\.


--
-- TOC entry 2945 (class 0 OID 19098103)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 19098282)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f3-b86d-7280-78c8e622f7f6	00180000-55f3-b86d-fc41-3b270033db2b	000c0000-55f3-b86d-2bcf-4f5e77ff3803	00090000-55f3-b86d-c4d3-00e8e360ddf4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f3-b86d-dc52-ca83901f2133	00180000-55f3-b86d-fc41-3b270033db2b	000c0000-55f3-b86d-37a2-6a04f2b48319	00090000-55f3-b86d-bcf6-b833bc3b0c2d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f3-b86d-240c-20807aae20a3	00180000-55f3-b86d-fc41-3b270033db2b	000c0000-55f3-b86d-a7db-fb242db09e96	00090000-55f3-b86d-fefe-b43ada81e444	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f3-b86d-48f4-3b13d9a21c4c	00180000-55f3-b86d-fc41-3b270033db2b	000c0000-55f3-b86d-999a-24f75867e787	00090000-55f3-b86d-b25b-dddd88d34162	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f3-b86d-ee71-5f5f3873a658	00180000-55f3-b86d-fc41-3b270033db2b	000c0000-55f3-b86d-f364-1f912345bc7d	00090000-55f3-b86d-5c25-719f90c5adf0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f3-b86d-26c2-f5ef26e93f75	00180000-55f3-b86d-d867-78ef61f2cc63	\N	00090000-55f3-b86d-5c25-719f90c5adf0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2981 (class 0 OID 19098486)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f3-b86b-07ad-dcb092f0c8bb	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f3-b86b-bb53-e79c43a0f143	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f3-b86b-80df-a025cdc1fb28	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f3-b86b-a19e-3889c930d139	04	Režija	Režija	Režija	umetnik
000f0000-55f3-b86b-e96a-dc80ecb80db5	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f3-b86b-4542-5b7612f1e4ee	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f3-b86b-41c3-a9c864cbff40	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f3-b86b-bc12-367f660ac07f	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f3-b86b-0262-bb94348161be	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f3-b86b-244e-a6dd24e59524	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f3-b86b-a1c0-fdf258642898	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f3-b86b-22e8-73d0cd887aa3	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f3-b86b-3497-dd42dc306651	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f3-b86b-d3f7-b3176166a114	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f3-b86b-61cb-ba5b0e973d46	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f3-b86b-e375-defc2a15a5f4	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f3-b86b-a769-75863236bb54	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f3-b86b-d42d-d9c96c7e57b1	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2994 (class 0 OID 19098730)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f3-b86b-35bf-536c22d22067	01	Velika predstava	f	1.00	1.00
002b0000-55f3-b86b-20cb-c5b04749732c	02	Mala predstava	f	0.50	0.50
002b0000-55f3-b86b-fb78-68348da62b05	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f3-b86b-c394-7a12d40cd20d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f3-b86b-7b94-919125e24963	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2950 (class 0 OID 19098165)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 19098012)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f3-b86c-0f1b-83dde2b313f4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROk9A5MHv6y2.mdmGECslJvauUP9DAiou	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f3-b86d-5021-c55d30b6ce9e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f3-b86d-d8ca-7e835510fdbe	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f3-b86d-8236-de529a42c00a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f3-b86d-53cc-136f08da3c9b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f3-b86d-7715-598e443d7daf	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f3-b86d-ee35-7406e0f1a306	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f3-b86d-87bb-a87bc5acf7d3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f3-b86d-3c04-ae60d8103f03	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f3-b86d-5af2-888113ff4894	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f3-b86d-f3d7-c405448caaf3	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f3-b86c-2838-689fe0f3bb8d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2985 (class 0 OID 19098535)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f3-b86d-d00a-762c766c6c1e	00160000-55f3-b86d-a3c6-6c6ece1103ad	\N	00140000-55f3-b86b-c539-1a4dfbd1bdab	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f3-b86d-98c1-ffdce558d916
000e0000-55f3-b86d-dc88-3b0014bd1757	00160000-55f3-b86d-f04f-293cde9be94d	\N	00140000-55f3-b86b-bde6-ea4744b4adda	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f3-b86d-9997-4f2793306651
000e0000-55f3-b86d-1f29-5381c4078984	\N	\N	00140000-55f3-b86b-bde6-ea4744b4adda	00190000-55f3-b86d-cfef-a65f25aa8924	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f3-b86d-98c1-ffdce558d916
000e0000-55f3-b86d-8262-11deb85c0767	\N	\N	00140000-55f3-b86b-bde6-ea4744b4adda	00190000-55f3-b86d-cfef-a65f25aa8924	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f3-b86d-98c1-ffdce558d916
000e0000-55f3-b86d-85f0-eca3af5f0357	\N	\N	00140000-55f3-b86b-bde6-ea4744b4adda	00190000-55f3-b86d-cfef-a65f25aa8924	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f3-b86d-aec2-1d57d28b69f8
000e0000-55f3-b86d-01fc-f6b2b1e683f4	\N	\N	00140000-55f3-b86b-bde6-ea4744b4adda	00190000-55f3-b86d-cfef-a65f25aa8924	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f3-b86d-aec2-1d57d28b69f8
\.


--
-- TOC entry 2955 (class 0 OID 19098226)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f3-b86d-c1a8-a5cdf8be0d29	000e0000-55f3-b86d-dc88-3b0014bd1757	\N	1	
00200000-55f3-b86d-3148-c9dbb4580146	000e0000-55f3-b86d-dc88-3b0014bd1757	\N	2	
00200000-55f3-b86d-d06f-fcb771ff844a	000e0000-55f3-b86d-dc88-3b0014bd1757	\N	3	
00200000-55f3-b86d-dfcb-56f0c3115b5e	000e0000-55f3-b86d-dc88-3b0014bd1757	\N	4	
00200000-55f3-b86d-18ae-86ac33c34c93	000e0000-55f3-b86d-dc88-3b0014bd1757	\N	5	
\.


--
-- TOC entry 2969 (class 0 OID 19098353)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19098459)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f3-b86c-1c58-411f150fae2e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f3-b86c-6a5b-4b6c1606dc62	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f3-b86c-803b-12061e43cb48	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f3-b86c-9f70-7ef5f00cf69f	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f3-b86c-265b-7cf3dece9f15	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f3-b86c-356c-bbd442a0b647	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f3-b86c-796a-8392b7cf26bb	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f3-b86c-75af-b397436dd5fc	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f3-b86c-b27a-856c23fee581	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f3-b86c-1aff-8740eda04255	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f3-b86c-e605-765f24b1dc45	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f3-b86c-2b02-108bddae1ee9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f3-b86c-53d2-a20e5c84e421	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f3-b86c-b279-ee3fd00a4ff9	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f3-b86c-3711-50194a0a7a3b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f3-b86c-ba4f-7e963cbf06ae	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f3-b86c-0454-7a6530a1bc82	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f3-b86c-5e0e-8920e165f591	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f3-b86c-6028-9f199d319871	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f3-b86c-f55f-47eebcada6ce	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f3-b86c-760b-4cff2677563b	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f3-b86c-05c4-1fd43b0a6aa5	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f3-b86c-2627-832113164e18	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f3-b86c-6fd6-5362b59db569	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f3-b86c-4f0c-46f3bd1891dd	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f3-b86c-9c2d-65351139c172	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f3-b86c-28e9-8c7bdc76e2ea	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f3-b86c-9432-de2628248f2a	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2997 (class 0 OID 19098776)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 19098748)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 19098788)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 19098425)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f3-b86d-7c2e-3fc997342752	00090000-55f3-b86d-bcf6-b833bc3b0c2d	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f3-b86d-38b9-6418bb4f4a13	00090000-55f3-b86d-fefe-b43ada81e444	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f3-b86d-9c56-598a5de2aa1d	00090000-55f3-b86d-1767-dbbeb8bade12	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f3-b86d-548f-e62a87f052c1	00090000-55f3-b86d-db0d-b5067cc44a9a	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f3-b86d-f5eb-7dc05607a883	00090000-55f3-b86d-c4d3-00e8e360ddf4	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f3-b86d-ff45-90cc409599bf	00090000-55f3-b86d-4841-80ed5974b868	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2957 (class 0 OID 19098262)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19098525)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f3-b86b-c539-1a4dfbd1bdab	01	Drama	drama (SURS 01)
00140000-55f3-b86b-071c-a364c19d669e	02	Opera	opera (SURS 02)
00140000-55f3-b86b-e012-79dbf4320489	03	Balet	balet (SURS 03)
00140000-55f3-b86b-b4c7-03b61024ff21	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f3-b86b-0be4-d862d7b51307	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f3-b86b-bde6-ea4744b4adda	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f3-b86b-ce06-d09b69b71c22	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2975 (class 0 OID 19098415)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 19098066)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 19098584)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 19098574)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 19098484)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 19098828)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 19098251)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 19098271)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 19098746)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19098191)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 19098639)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 19098411)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 19098224)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 19098205)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 19098318)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 19098805)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 19098812)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 19098836)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 19098345)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 19098163)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 19098075)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 19098099)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 19098055)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 19098040)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 19098351)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 19098387)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 19098520)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19098127)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19098151)
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
-- TOC entry 2679 (class 2606 OID 19098700)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 19098324)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 19098141)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19098212)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 19098336)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 19098709)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 19098717)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 19098687)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 19098728)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 19098369)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 19098309)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 19098300)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 19098508)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 19098442)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 19098011)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 19098378)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 19098029)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 19098049)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 19098396)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 19098331)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 19098280)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 19097999)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19097987)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 19097981)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 19098455)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 19098108)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 19098291)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 19098495)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 19098740)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 19098176)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 19098024)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 19098553)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 19098234)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 19098359)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 19098467)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 19098786)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 19098770)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 19098794)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 19098433)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 19098266)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 19098533)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 19098423)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 19098260)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 19098261)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 19098259)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 19098258)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 19098257)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2624 (class 1259 OID 19098456)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 19098457)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 19098458)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 19098807)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 19098806)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 19098129)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 19098352)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 19098774)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 19098773)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 19098775)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 19098772)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 19098771)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 19098338)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 19098337)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 19098235)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 19098412)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19098414)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 19098413)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 19098207)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 19098206)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 19098729)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 19098522)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 19098523)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 19098524)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 19098795)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 19098558)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 19098555)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 19098559)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 19098557)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 19098556)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 19098178)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 19098177)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 19098102)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 19098379)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 19098056)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 19098057)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 19098399)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 19098398)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 19098397)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 19098213)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 19098214)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 19097989)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 19098304)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 19098302)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 19098301)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 19098303)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 19098030)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 19098031)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 19098360)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 19098829)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 19098837)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 19098838)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 19098325)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 19098443)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 19098444)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 19098644)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 19098643)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 19098640)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 19098641)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 19098642)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 19098143)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 19098142)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 19098144)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 19098373)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 19098372)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 19098710)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 19098711)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 19098588)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 19098589)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 19098586)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 19098587)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 19098434)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 19098313)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 19098312)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 19098310)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 19098311)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 19098576)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 19098575)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 19098225)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 19098701)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 19098747)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 19098813)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 19098814)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 19098077)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 19098076)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 19098109)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19098110)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 19098294)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 19098293)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 19098292)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 19098253)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2545 (class 1259 OID 19098254)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2546 (class 1259 OID 19098252)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2547 (class 1259 OID 19098256)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2548 (class 1259 OID 19098255)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 19098128)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 19098192)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19098194)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 19098193)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 19098195)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 19098319)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 19098521)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 19098554)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 19098496)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19098497)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 19098100)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 19098101)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 19098424)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 19098000)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19098164)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 19097988)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2597 (class 1259 OID 19098371)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 19098370)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 19098585)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 19098152)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 19098534)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 19098787)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 19098718)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 19098719)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 19098485)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 19098281)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 19098050)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 19098959)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 19098964)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 19098984)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 19098954)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 19098974)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 19098979)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 19098969)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2785 (class 2606 OID 19099134)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2784 (class 2606 OID 19099139)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2783 (class 2606 OID 19099144)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 19099309)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2818 (class 2606 OID 19099304)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 19098894)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 19099064)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2812 (class 2606 OID 19099289)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 19099284)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 19099294)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 19099279)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2815 (class 2606 OID 19099274)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2767 (class 2606 OID 19099059)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 19099054)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 19098949)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 19099104)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 19099114)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 19099109)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 19098929)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 19098924)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 19099044)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 19099264)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 19099149)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 19099154)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 19099159)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2816 (class 2606 OID 19099299)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2790 (class 2606 OID 19099179)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2793 (class 2606 OID 19099164)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2789 (class 2606 OID 19099184)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2791 (class 2606 OID 19099174)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2792 (class 2606 OID 19099169)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 19098919)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 19098914)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 19098879)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 19098874)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 19099084)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 19098854)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 19098859)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2774 (class 2606 OID 19099099)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 19099094)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 19099089)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 19098934)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 19098939)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 19098839)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2757 (class 2606 OID 19099019)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2759 (class 2606 OID 19099009)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2760 (class 2606 OID 19099004)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2758 (class 2606 OID 19099014)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 19098844)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 19098849)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 19099069)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2821 (class 2606 OID 19099324)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 19099329)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2822 (class 2606 OID 19099334)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 19099049)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2782 (class 2606 OID 19099124)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2781 (class 2606 OID 19099129)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 19099239)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 19099234)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 19099219)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 19099224)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2802 (class 2606 OID 19099229)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 19098904)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 19098899)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 19098909)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 19099079)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2772 (class 2606 OID 19099074)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2807 (class 2606 OID 19099249)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2806 (class 2606 OID 19099254)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2797 (class 2606 OID 19099209)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 19099214)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2799 (class 2606 OID 19099199)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2798 (class 2606 OID 19099204)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 19099119)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 19099039)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2762 (class 2606 OID 19099034)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 19099024)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2763 (class 2606 OID 19099029)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 19099194)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2795 (class 2606 OID 19099189)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 19098944)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 19099244)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2808 (class 2606 OID 19099259)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 19099269)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 19099314)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 19099319)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 19098869)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 19098864)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 19098884)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 19098889)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 19098999)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 19098994)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 19098989)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-12 07:30:23 CEST

--
-- PostgreSQL database dump complete
--

