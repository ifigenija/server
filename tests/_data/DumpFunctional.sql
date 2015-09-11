--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-11 15:31:33 CEST

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
-- TOC entry 181 (class 1259 OID 18979588)
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
-- TOC entry 226 (class 1259 OID 18980107)
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
-- TOC entry 225 (class 1259 OID 18980090)
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
-- TOC entry 219 (class 1259 OID 18979998)
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
-- TOC entry 240 (class 1259 OID 18980345)
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
-- TOC entry 195 (class 1259 OID 18979766)
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
-- TOC entry 197 (class 1259 OID 18979797)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 18980271)
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
-- TOC entry 190 (class 1259 OID 18979709)
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
-- TOC entry 227 (class 1259 OID 18980120)
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
-- TOC entry 213 (class 1259 OID 18979930)
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
-- TOC entry 193 (class 1259 OID 18979745)
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
-- TOC entry 191 (class 1259 OID 18979726)
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
-- TOC entry 202 (class 1259 OID 18979844)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 18980326)
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
-- TOC entry 239 (class 1259 OID 18980338)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 18980360)
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
-- TOC entry 206 (class 1259 OID 18979869)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 18979683)
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
-- TOC entry 182 (class 1259 OID 18979597)
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
-- TOC entry 183 (class 1259 OID 18979608)
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
-- TOC entry 178 (class 1259 OID 18979562)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 18979581)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 18979876)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 18979910)
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
-- TOC entry 222 (class 1259 OID 18980039)
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
-- TOC entry 185 (class 1259 OID 18979641)
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
-- TOC entry 187 (class 1259 OID 18979675)
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
-- TOC entry 229 (class 1259 OID 18980218)
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
-- TOC entry 203 (class 1259 OID 18979850)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 18979660)
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
-- TOC entry 192 (class 1259 OID 18979738)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 18979862)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 18980232)
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
-- TOC entry 231 (class 1259 OID 18980242)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 18980175)
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
-- TOC entry 232 (class 1259 OID 18980250)
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
-- TOC entry 209 (class 1259 OID 18979891)
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
-- TOC entry 201 (class 1259 OID 18979835)
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
-- TOC entry 200 (class 1259 OID 18979825)
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
-- TOC entry 221 (class 1259 OID 18980028)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 18979965)
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
-- TOC entry 175 (class 1259 OID 18979533)
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
-- TOC entry 174 (class 1259 OID 18979531)
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
-- TOC entry 210 (class 1259 OID 18979904)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 18979571)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 18979555)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 18979918)
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
-- TOC entry 204 (class 1259 OID 18979856)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 18979802)
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
-- TOC entry 173 (class 1259 OID 18979520)
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
-- TOC entry 172 (class 1259 OID 18979512)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 18979507)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 18979975)
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
-- TOC entry 184 (class 1259 OID 18979633)
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
-- TOC entry 199 (class 1259 OID 18979812)
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
-- TOC entry 220 (class 1259 OID 18980016)
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
-- TOC entry 233 (class 1259 OID 18980260)
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
-- TOC entry 189 (class 1259 OID 18979695)
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
-- TOC entry 176 (class 1259 OID 18979542)
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
-- TOC entry 224 (class 1259 OID 18980065)
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
-- TOC entry 194 (class 1259 OID 18979756)
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
-- TOC entry 208 (class 1259 OID 18979883)
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
-- TOC entry 218 (class 1259 OID 18979989)
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
-- TOC entry 236 (class 1259 OID 18980306)
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
-- TOC entry 235 (class 1259 OID 18980278)
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
-- TOC entry 237 (class 1259 OID 18980318)
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
-- TOC entry 215 (class 1259 OID 18979955)
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
-- TOC entry 196 (class 1259 OID 18979792)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 18980055)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 18979945)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 18979536)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 18979588)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 18980107)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f2-d7b3-683d-b91422a17a59	000d0000-55f2-d7b3-2ce3-4dc6987ffb73	\N	00090000-55f2-d7b3-2bb2-30862250ae51	000b0000-55f2-d7b3-a059-19a56005cb38	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f2-d7b3-5d7b-6df1d9ae2e6f	000d0000-55f2-d7b3-32e6-cf66d36c772b	00100000-55f2-d7b3-b45b-280f6e0fc282	00090000-55f2-d7b3-a71c-def613a39c78	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f2-d7b3-2a67-586a9fdd1fe4	000d0000-55f2-d7b3-0e96-547929c3a026	00100000-55f2-d7b3-25bd-6e66cfb0b6f8	00090000-55f2-d7b3-db41-c778e18c41fe	\N	0003	t	\N	2015-09-11	\N	2	t	\N	f	f
000c0000-55f2-d7b3-8a52-6de1c54d5075	000d0000-55f2-d7b3-0075-9c811a4e54c8	\N	00090000-55f2-d7b3-1f6b-039be04574b6	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f2-d7b3-d43e-c83283b8973f	000d0000-55f2-d7b3-a653-80eadb8c87c6	\N	00090000-55f2-d7b3-1319-2a6059c452d4	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f2-d7b3-f709-9712e6385026	000d0000-55f2-d7b3-4e16-01ad52cb9967	\N	00090000-55f2-d7b3-e4a6-c42227d17b7d	000b0000-55f2-d7b3-3af8-78534691bf20	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f2-d7b3-073e-3fd371c93219	000d0000-55f2-d7b3-f128-0017ea12fc9d	00100000-55f2-d7b3-9c35-343ab901e3dc	00090000-55f2-d7b3-e010-a4ee451aa3b6	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f2-d7b4-9bfb-dcc6f4e8e13c	000d0000-55f2-d7b3-fe8c-f0becc22d199	\N	00090000-55f2-d7b3-1431-e3ce0ec3fff5	000b0000-55f2-d7b3-c15c-c6a4304bcddb	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f2-d7b4-91ca-326b85fec694	000d0000-55f2-d7b3-f128-0017ea12fc9d	00100000-55f2-d7b3-4684-65e56f91b04d	00090000-55f2-d7b3-33b5-c1fc836c9dc3	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f2-d7b4-fcf6-a1b7a1fad632	000d0000-55f2-d7b3-f128-0017ea12fc9d	00100000-55f2-d7b3-3ba8-7b4c151f74f0	00090000-55f2-d7b3-7c49-24b832b808e9	\N	0010	t	\N	2015-09-11	\N	16	f	\N	f	t
000c0000-55f2-d7b4-ebde-34aafa927e51	000d0000-55f2-d7b3-f128-0017ea12fc9d	00100000-55f2-d7b3-5548-91eb7722e722	00090000-55f2-d7b3-8054-23aad56df96b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f2-d7b4-0910-8feba5b1e97d	000d0000-55f2-d7b3-d62a-ce341829a334	\N	00090000-55f2-d7b3-a71c-def613a39c78	000b0000-55f2-d7b3-a4f7-e62346297823	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2986 (class 0 OID 18980090)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 18979998)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f2-d7b3-9a4a-902e412bf766	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f2-d7b3-1a42-2e5bb958858e	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f2-d7b3-727d-692e241bc514	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 18980345)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 18979766)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f2-d7b3-9968-5181300a787f	\N	\N	00200000-55f2-d7b3-bab3-415e989bc287	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f2-d7b3-4223-4251672d5e36	\N	\N	00200000-55f2-d7b3-84f3-7f063743ba7e	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f2-d7b3-254d-5e4bbbd7fd49	\N	\N	00200000-55f2-d7b3-a65c-52117a5d9460	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f2-d7b3-df52-fb9f889c4901	\N	\N	00200000-55f2-d7b3-0557-0876b69fa678	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f2-d7b3-633b-24cc902c17a2	\N	\N	00200000-55f2-d7b3-85c6-165b92b82dca	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2958 (class 0 OID 18979797)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 18980271)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 18979709)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f2-d7b2-c630-9da7b206e4f9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f2-d7b2-2516-16672e77ea81	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f2-d7b2-244d-7ebcae3a8295	AL	ALB	008	Albania 	Albanija	\N
00040000-55f2-d7b2-6db6-b504aa96cf21	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f2-d7b2-2d77-06ee775bf109	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f2-d7b2-695f-f8e6c2eb4ee8	AD	AND	020	Andorra 	Andora	\N
00040000-55f2-d7b2-046f-cf19ecdeeb1f	AO	AGO	024	Angola 	Angola	\N
00040000-55f2-d7b2-ac12-654ed1f78237	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f2-d7b2-4735-8323af66d712	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f2-d7b2-26ba-b6b46e222408	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f2-d7b2-7cb5-f4ac74f3b3e9	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f2-d7b2-4099-e3c0e9c1217e	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f2-d7b2-a1e1-c3f773a5ec34	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f2-d7b2-8fbd-c35d2cbd5573	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f2-d7b2-4c60-244f79895146	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f2-d7b2-faf1-cdb8b8713b34	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f2-d7b2-9570-a0346e03d838	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f2-d7b2-d792-cd37b2f8c956	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f2-d7b2-13f6-84c0b18b1db4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f2-d7b2-faa2-3f8b2d7adc88	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f2-d7b2-e2ae-46d3a239b371	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f2-d7b2-6a53-5f194425c652	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f2-d7b2-f238-b47a74f5a449	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f2-d7b2-a252-3688a7fe4752	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f2-d7b2-66f2-cbc46e590aa7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f2-d7b2-e7db-6515c48ebdda	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f2-d7b2-21df-25ecaf5d2644	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f2-d7b2-0ff0-5d88eb4399c6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f2-d7b2-7a1a-f7e1d23609ff	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f2-d7b2-b609-dfb34651ca25	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f2-d7b2-c174-52e63be4aac9	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f2-d7b2-8099-479faa331866	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f2-d7b2-c1b5-0b9c8ed85830	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f2-d7b2-7aa2-e7e33cac8d0a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f2-d7b2-8e3f-9446f2cf735c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f2-d7b2-7a8f-6e8516fa5178	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f2-d7b2-bf03-bb4732180659	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f2-d7b2-66aa-a212fd6312f8	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f2-d7b2-8ea9-6bdefec70f8f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f2-d7b2-a5f3-88e00d8e2910	CA	CAN	124	Canada 	Kanada	\N
00040000-55f2-d7b2-199f-66b2a28635d9	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f2-d7b2-158e-1e14c7a22e98	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f2-d7b2-c7ca-1deb4444b2dd	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f2-d7b2-1b00-5328fc26b2ff	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f2-d7b2-d2d6-52f0214b105d	CL	CHL	152	Chile 	Čile	\N
00040000-55f2-d7b2-1b04-48e2898e94eb	CN	CHN	156	China 	Kitajska	\N
00040000-55f2-d7b2-36e3-8118c5f0389c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f2-d7b2-0a32-cc1d094486a3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f2-d7b2-cc18-64d940135d41	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f2-d7b2-8625-515f7db548b7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f2-d7b2-dcf7-7bc3b4e3990b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f2-d7b2-d813-e7eaf756ed41	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f2-d7b2-2218-011ec3a89742	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f2-d7b2-3eb9-fce7e26c82c9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f2-d7b2-dea6-516befbefba9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f2-d7b2-971e-a0fbd08c596d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f2-d7b2-35d6-64e35d92bbb7	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f2-d7b2-f3a4-8a87eab972d2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f2-d7b2-23a1-a23831fe576b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f2-d7b2-9809-cbe276f7cd48	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f2-d7b2-462b-05b4e1a95e43	DK	DNK	208	Denmark 	Danska	\N
00040000-55f2-d7b2-ce68-d1029f3dbd28	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f2-d7b2-caca-258375c98367	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f2-d7b2-2517-9ed9b2004f70	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f2-d7b2-5a9b-39a2cfdc0c1a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f2-d7b2-ea43-e591f4f7cfab	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f2-d7b2-5459-6ce2f671564c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f2-d7b2-f3b2-47c27446b447	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f2-d7b2-b50b-1852cfdd69f1	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f2-d7b2-7dec-0ec01e794055	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f2-d7b2-1c8c-de94d07eb0eb	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f2-d7b2-0c26-9e634ae54c71	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f2-d7b2-2924-e84ec569a080	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f2-d7b2-0b54-bbc0ef9586f7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f2-d7b2-67fb-bdd11601f87a	FI	FIN	246	Finland 	Finska	\N
00040000-55f2-d7b2-35a6-c6aeb3e744f1	FR	FRA	250	France 	Francija	\N
00040000-55f2-d7b2-e224-6b6ae35af797	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f2-d7b2-0d97-c900263a1b69	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f2-d7b2-a8d5-313dceb526b6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f2-d7b2-abf2-36043c07ed4c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f2-d7b2-cc22-351af62b0833	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f2-d7b2-52e9-ebe913b202c9	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f2-d7b2-7ab2-a50325d9ec42	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f2-d7b2-77f7-777ba56d804f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f2-d7b2-143d-8c7744c43d01	GH	GHA	288	Ghana 	Gana	\N
00040000-55f2-d7b2-d676-704c91a6ef60	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f2-d7b2-2ad8-170840349130	GR	GRC	300	Greece 	Grčija	\N
00040000-55f2-d7b2-ae98-46a7659d87ad	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f2-d7b2-b516-a543d9d35793	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f2-d7b2-9a1c-8c00bf7248d4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f2-d7b2-9c78-b595c92cf658	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f2-d7b2-de38-ca6d4d67663c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f2-d7b2-1791-a69a8d8b3d1e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f2-d7b2-818c-45fdf4a04fc5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f2-d7b2-7530-6e233cefc0ce	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f2-d7b2-55b7-86f6698d8f24	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f2-d7b2-3836-92c1dcaabec8	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f2-d7b2-fef9-986dd3278684	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f2-d7b2-b596-b93da0e4bbd8	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f2-d7b2-a3c4-09146564121f	HN	HND	340	Honduras 	Honduras	\N
00040000-55f2-d7b2-a7cb-1e51580f2477	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f2-d7b2-5e5d-a0acc924dc8c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f2-d7b2-a98e-d93381bb65ca	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f2-d7b2-db66-f98d75a6aa18	IN	IND	356	India 	Indija	\N
00040000-55f2-d7b2-e18d-0c913b09936d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f2-d7b2-a3e3-8aab6ef43fb6	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f2-d7b2-211d-14f65a05885e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f2-d7b2-2d50-741856264028	IE	IRL	372	Ireland 	Irska	\N
00040000-55f2-d7b2-67b8-03e1449b495a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f2-d7b2-b360-ed7d5b148d91	IL	ISR	376	Israel 	Izrael	\N
00040000-55f2-d7b2-7a4b-4398b4178be1	IT	ITA	380	Italy 	Italija	\N
00040000-55f2-d7b2-9a73-f437fdd8a1a4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f2-d7b2-b6a8-4c2dd0f06e56	JP	JPN	392	Japan 	Japonska	\N
00040000-55f2-d7b2-2171-613dadfa45f3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f2-d7b2-3f6f-82b190ffeb18	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f2-d7b2-bd7b-fe00014b243f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f2-d7b2-7283-1af7e74c6b6c	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f2-d7b2-8f60-81e15ca9ae0e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f2-d7b2-32ca-1e6bdcefb78b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f2-d7b2-b814-671f505d6a0f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f2-d7b2-fc7e-61e9a61aa63e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f2-d7b2-a296-6e0e0fa81672	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f2-d7b2-d466-b21fd7756b15	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f2-d7b2-bff7-adce527c192c	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f2-d7b2-bd5a-81b4cecafa32	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f2-d7b2-bb95-f2624d04d168	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f2-d7b2-eabf-e3c1e9b14201	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f2-d7b2-d365-4476321dda28	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f2-d7b2-09dc-8f3c89168b75	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f2-d7b2-5538-9309ddd1a5b0	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f2-d7b2-69e4-713cc87d5484	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f2-d7b2-4796-f79ed626a148	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f2-d7b2-9d21-40381294e660	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f2-d7b2-698b-5103d74b1638	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f2-d7b2-0036-bdae64314a35	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f2-d7b2-afb0-87ad8a5ca8f2	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f2-d7b2-3943-f4eed74697ea	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f2-d7b2-f983-8662d353dac4	ML	MLI	466	Mali 	Mali	\N
00040000-55f2-d7b2-3942-fb87437f2fdb	MT	MLT	470	Malta 	Malta	\N
00040000-55f2-d7b2-aec6-c21feee3a4f3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f2-d7b2-b974-d741d705ed72	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f2-d7b2-8506-eb129fead51a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f2-d7b2-71e1-2209ce3dce97	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f2-d7b2-4a18-be93855d5dfd	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f2-d7b2-e1c3-e874840a75e2	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f2-d7b2-29ce-079e487e8314	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f2-d7b2-90b3-344d12f5c001	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f2-d7b2-6298-e2ee57c77187	MC	MCO	492	Monaco 	Monako	\N
00040000-55f2-d7b2-2940-fdd756cc87ae	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f2-d7b2-8763-c11b7c5e0c75	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f2-d7b2-a9a9-ec71f4b6bd04	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f2-d7b2-cd4b-73fd3e5eb9a9	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f2-d7b2-5fb2-d2755d65d1bd	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f2-d7b2-0cc0-ebc7a11d505a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f2-d7b2-866e-03042db39601	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f2-d7b2-293e-a4b840304c6e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f2-d7b2-772b-e9cad1b101ba	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f2-d7b2-2a59-b7fecb8938a5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f2-d7b2-6b6f-6eaeecd87fdf	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f2-d7b2-4a29-7a6e8aac4b4e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f2-d7b2-2c35-24811fe6f9f5	NE	NER	562	Niger 	Niger 	\N
00040000-55f2-d7b2-237d-7bd211ec0f64	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f2-d7b2-5af2-a4c79b42f83e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f2-d7b2-e81a-b750adf05640	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f2-d7b2-4b34-6481d779a7e8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f2-d7b2-3895-4328e3391683	NO	NOR	578	Norway 	Norveška	\N
00040000-55f2-d7b2-4397-c6a04540bee2	OM	OMN	512	Oman 	Oman	\N
00040000-55f2-d7b2-5836-b367a6f4093b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f2-d7b2-0c3d-a899f603bce4	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f2-d7b2-1f10-eef858c5833a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f2-d7b2-b849-74d96762e2cd	PA	PAN	591	Panama 	Panama	\N
00040000-55f2-d7b2-c792-73ef5075328d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f2-d7b2-9810-c7112f4d3af8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f2-d7b2-7576-5e3ee1f231e4	PE	PER	604	Peru 	Peru	\N
00040000-55f2-d7b2-932f-ef396279a7a9	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f2-d7b2-6292-6fa8316b60db	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f2-d7b2-2597-57ffe4b9044b	PL	POL	616	Poland 	Poljska	\N
00040000-55f2-d7b2-c82d-89392f3c88f5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f2-d7b2-2602-8ec3771576ed	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f2-d7b2-cbe0-13831b892d11	QA	QAT	634	Qatar 	Katar	\N
00040000-55f2-d7b2-11d8-3c5971f7fd99	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f2-d7b2-3810-b276bbbf25eb	RO	ROU	642	Romania 	Romunija	\N
00040000-55f2-d7b2-e07c-7700ca2aa53a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f2-d7b2-e663-ca1edc2c7a4b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f2-d7b2-725a-55ba4c5a49ad	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f2-d7b2-ab91-fb075535f124	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f2-d7b2-95f0-df0ef386f8e2	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f2-d7b2-15c4-29ff1e1d1533	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f2-d7b2-a086-dcf3c6291e74	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f2-d7b2-83b9-9a80e66559a1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f2-d7b2-9bcd-c4b0f1085c38	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f2-d7b2-3fe6-9c99bd1662d7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f2-d7b2-159a-76eb5844272f	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f2-d7b2-70f5-d33d4b56307a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f2-d7b2-c0d3-8b0150a2c31a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f2-d7b2-ffae-1494096e6b9f	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f2-d7b2-5830-7a5df63def6a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f2-d7b2-d63b-d5fe88b72c1e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f2-d7b2-c895-8e4adf2262a5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f2-d7b2-9bee-2503476e5a6b	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f2-d7b2-9075-15595ab712d9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f2-d7b2-3d2d-1439964d94bc	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f2-d7b2-b6e9-c63b7c9f3453	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f2-d7b2-c0f6-43fbaa297e03	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f2-d7b2-5df7-0b56ae0d1cab	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f2-d7b2-f7a8-673e73cf95d1	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f2-d7b2-863b-3b751d689806	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f2-d7b2-09f7-6a4614009ecf	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f2-d7b2-e454-b4f404790c3d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f2-d7b2-ca2f-3b37093ceefd	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f2-d7b2-6e7d-91588c98664d	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f2-d7b2-7501-5f6d1559be6d	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f2-d7b2-b2f7-e5622ebdd0b4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f2-d7b2-35cb-377e0e75cb9d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f2-d7b2-bb0c-97f763f6d5c6	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f2-d7b2-85fa-b699c9f48717	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f2-d7b2-2860-beeed09cc4b4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f2-d7b2-4910-7a31e4994b7b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f2-d7b2-8943-e853afb3a320	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f2-d7b2-9a66-eb8e1bccae6f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f2-d7b2-8061-acee22cdeebe	TH	THA	764	Thailand 	Tajska	\N
00040000-55f2-d7b2-faa4-da66587ddd4f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f2-d7b2-d29a-4183775fdea9	TG	TGO	768	Togo 	Togo	\N
00040000-55f2-d7b2-e1d1-85009f3877db	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f2-d7b2-e407-b0fba3853361	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f2-d7b2-52f4-10475c1967cd	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f2-d7b2-ba22-517244f3a43f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f2-d7b2-3925-0ce7655cded3	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f2-d7b2-7484-a5b49e365775	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f2-d7b2-6bf4-0e7424e82fd9	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f2-d7b2-c0f5-1be951b29978	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f2-d7b2-2125-5c4b76022bfe	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f2-d7b2-df3d-da9098afed64	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f2-d7b2-39e7-b5f3ce785c11	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f2-d7b2-80d2-6f0b66a906f3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f2-d7b2-c68e-322841965a32	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f2-d7b2-29fe-c0af87d6b027	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f2-d7b2-7b39-4aa71c873e45	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f2-d7b2-7ec1-dba1a9a1e24d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f2-d7b2-326f-362234cad1e2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f2-d7b2-8712-c853d84a0be3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f2-d7b2-618f-f89be5a30a2c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f2-d7b2-ed5d-5397d08a0001	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f2-d7b2-dfa4-c42c7b2eb481	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f2-d7b2-1e64-aa7a9cbeeb33	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f2-d7b2-cc8c-dde65d277408	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f2-d7b2-1177-9c4e8693099a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f2-d7b2-c668-b411c3f8825e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f2-d7b2-15ef-1bfca0514b10	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2988 (class 0 OID 18980120)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f2-d7b3-d3e3-cb141a29d79e	000e0000-55f2-d7b3-bf00-4d7c8741654a	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f2-d7b2-3d40-1c044fa20c2b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f2-d7b3-2312-f58f2f2d6a12	000e0000-55f2-d7b3-2605-d91a0b953172	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f2-d7b2-9947-3258c3ef45ef	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f2-d7b3-af81-4ff55c9904ef	000e0000-55f2-d7b3-dcb1-2575ff3dfdf4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f2-d7b2-3d40-1c044fa20c2b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f2-d7b3-c0bb-dcfacb006bfd	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f2-d7b3-b216-55de942c6922	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 18979930)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f2-d7b3-2ce3-4dc6987ffb73	000e0000-55f2-d7b3-2605-d91a0b953172	000c0000-55f2-d7b3-683d-b91422a17a59	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f2-d7b2-bb48-a24fbc90ee88
000d0000-55f2-d7b3-32e6-cf66d36c772b	000e0000-55f2-d7b3-2605-d91a0b953172	000c0000-55f2-d7b3-5d7b-6df1d9ae2e6f	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f2-d7b2-eb0e-8a5aa7b971f0
000d0000-55f2-d7b3-0e96-547929c3a026	000e0000-55f2-d7b3-2605-d91a0b953172	000c0000-55f2-d7b3-2a67-586a9fdd1fe4	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f2-d7b2-02cc-4d8f92523026
000d0000-55f2-d7b3-0075-9c811a4e54c8	000e0000-55f2-d7b3-2605-d91a0b953172	000c0000-55f2-d7b3-8a52-6de1c54d5075	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f2-d7b2-e73b-9f1a5c021da7
000d0000-55f2-d7b3-a653-80eadb8c87c6	000e0000-55f2-d7b3-2605-d91a0b953172	000c0000-55f2-d7b3-d43e-c83283b8973f	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f2-d7b2-e73b-9f1a5c021da7
000d0000-55f2-d7b3-4e16-01ad52cb9967	000e0000-55f2-d7b3-2605-d91a0b953172	000c0000-55f2-d7b3-f709-9712e6385026	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f2-d7b2-bb48-a24fbc90ee88
000d0000-55f2-d7b3-f128-0017ea12fc9d	000e0000-55f2-d7b3-2605-d91a0b953172	000c0000-55f2-d7b4-91ca-326b85fec694	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f2-d7b2-bb48-a24fbc90ee88
000d0000-55f2-d7b3-fe8c-f0becc22d199	000e0000-55f2-d7b3-2605-d91a0b953172	000c0000-55f2-d7b4-9bfb-dcc6f4e8e13c	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f2-d7b2-6b1f-5b670cac771e
000d0000-55f2-d7b3-d62a-ce341829a334	000e0000-55f2-d7b3-2605-d91a0b953172	000c0000-55f2-d7b4-0910-8feba5b1e97d	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f2-d7b2-1a6b-2cf31f390932
\.


--
-- TOC entry 2954 (class 0 OID 18979745)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 18979726)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f2-d7b3-75b2-133424da4733	00080000-55f2-d7b3-a7d2-4c0b4c5b36f3	00090000-55f2-d7b3-7c49-24b832b808e9	AK		igralka
\.


--
-- TOC entry 2963 (class 0 OID 18979844)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 18980326)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 18980338)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 18980360)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 18979869)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 18979683)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f2-d7b2-1ae3-e8f5c24ab050	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f2-d7b2-eb47-5abd7b8b92d7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f2-d7b2-f6f6-21ce99ac0596	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f2-d7b2-bb47-3559db33caa7	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f2-d7b2-26d5-51a8fdfaf90b	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f2-d7b2-6e16-7b55bb9f6df8	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}s:4:"500s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f2-d7b2-b191-35a2f2461ca4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f2-d7b2-dd37-a38f71e5ce19	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f2-d7b2-c166-47dd859dbae5	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f2-d7b2-ae8d-1c366279f280	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f2-d7b2-b5b6-38ebe194b626	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f2-d7b2-5a82-a040576826f5	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f2-d7b2-97e1-04819178fa75	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f2-d7b2-f0e0-9f4bc06c2ded	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f2-d7b3-4632-bae0cd58ca7a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f2-d7b3-36cc-632ef5356027	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f2-d7b3-21f2-8bfa0e2e9ae3	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f2-d7b3-7d4c-6d100db2b60d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f2-d7b3-085e-a9de999d736e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f2-d7b4-2e3d-b49476b0d348	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2943 (class 0 OID 18979597)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f2-d7b3-5ce7-58dab441a3d1	00000000-55f2-d7b3-4632-bae0cd58ca7a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f2-d7b3-63b0-1e67bb8c9244	00000000-55f2-d7b3-4632-bae0cd58ca7a	00010000-55f2-d7b2-975e-01b0853848ee	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f2-d7b3-4c47-d77144160c0c	00000000-55f2-d7b3-36cc-632ef5356027	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2944 (class 0 OID 18979608)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f2-d7b3-2bb2-30862250ae51	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f2-d7b3-1f6b-039be04574b6	00010000-55f2-d7b3-a240-b5e9d1a42882	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f2-d7b3-db41-c778e18c41fe	00010000-55f2-d7b3-ca50-c98430d05fdf	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f2-d7b3-33b5-c1fc836c9dc3	00010000-55f2-d7b3-20f7-a85ddd6c3d14	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f2-d7b3-03dc-43f23c30b2bc	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f2-d7b3-e4a6-c42227d17b7d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f2-d7b3-8054-23aad56df96b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f2-d7b3-e010-a4ee451aa3b6	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f2-d7b3-7c49-24b832b808e9	00010000-55f2-d7b3-4ece-0fd6bb05b813	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f2-d7b3-a71c-def613a39c78	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f2-d7b3-0b59-a540d0bb19b1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f2-d7b3-1319-2a6059c452d4	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f2-d7b3-1431-e3ce0ec3fff5	00010000-55f2-d7b3-89ea-51a31ab766d4	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 18979562)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f2-d7b2-bd63-cc12d9eb31cd	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f2-d7b2-0982-1a4cb83023d7	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f2-d7b2-e944-7d14136e4c2b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f2-d7b2-1ff0-6fdce4db40a6	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f2-d7b2-a7df-5572201c5479	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f2-d7b2-ec64-d046d2e340de	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f2-d7b2-a987-3515124d90d9	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f2-d7b2-8f52-c9134139fb12	Abonma-read	Abonma - branje	f
00030000-55f2-d7b2-571d-f96e4030a6ec	Abonma-write	Abonma - spreminjanje	f
00030000-55f2-d7b2-a03c-915330143440	Alternacija-read	Alternacija - branje	f
00030000-55f2-d7b2-169d-9a6d764acc35	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f2-d7b2-08b3-6415dc95cc0f	Arhivalija-read	Arhivalija - branje	f
00030000-55f2-d7b2-b5b2-d1c63a094632	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f2-d7b2-323e-cc40c3823dbf	Besedilo-read	Besedilo - branje	f
00030000-55f2-d7b2-e19d-8eb67410d64d	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f2-d7b2-46ce-ddcb3c711f75	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f2-d7b2-14d1-f3e9a0f23f1d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f2-d7b2-4107-0cd19b80130f	Dogodek-read	Dogodek - branje	f
00030000-55f2-d7b2-d3d7-0f63e13cdf0a	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f2-d7b2-8723-3f1099f7e636	DrugiVir-read	DrugiVir - branje	f
00030000-55f2-d7b2-35de-d3de51b121c3	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f2-d7b2-ed56-a35a107cc67a	Drzava-read	Drzava - branje	f
00030000-55f2-d7b2-b9be-55ef6d8f58ea	Drzava-write	Drzava - spreminjanje	f
00030000-55f2-d7b2-f454-810e2ef360ec	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f2-d7b2-86e6-2061ef33cd16	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f2-d7b2-6b51-16fd8f796ef4	Funkcija-read	Funkcija - branje	f
00030000-55f2-d7b2-979e-474503c4c246	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f2-d7b2-f451-2c688dca8525	Gostovanje-read	Gostovanje - branje	f
00030000-55f2-d7b2-50a5-3fcc8bca1a94	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f2-d7b2-a20b-e43af84589ea	Gostujoca-read	Gostujoca - branje	f
00030000-55f2-d7b2-daeb-f5e6cd157ae7	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f2-d7b2-7f1e-fc41a221ce99	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f2-d7b2-4bcc-b2aeff963879	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f2-d7b2-fa7f-40c9a0e66ae2	Kupec-read	Kupec - branje	f
00030000-55f2-d7b2-e399-e1cff3c0f291	Kupec-write	Kupec - spreminjanje	f
00030000-55f2-d7b2-5a7b-3b46e3ae756e	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f2-d7b2-42f7-21890e9166e7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f2-d7b2-b35e-60d1c812ba57	Option-read	Option - branje	f
00030000-55f2-d7b2-aaef-aac77b60b338	Option-write	Option - spreminjanje	f
00030000-55f2-d7b2-b8c9-e348b2a7aa51	OptionValue-read	OptionValue - branje	f
00030000-55f2-d7b2-2210-24b67329420a	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f2-d7b2-feb5-f6ea813d4d57	Oseba-read	Oseba - branje	f
00030000-55f2-d7b2-5896-3b4d3dc5764d	Oseba-write	Oseba - spreminjanje	f
00030000-55f2-d7b2-e68b-6ba3cd4b0f7a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f2-d7b2-5a22-0461e7c48932	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f2-d7b2-0026-3fa5dfed9b0b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f2-d7b2-8292-23b182569b25	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f2-d7b2-2613-8ca8b89ba94f	Pogodba-read	Pogodba - branje	f
00030000-55f2-d7b2-e958-1036ba2eb7f1	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f2-d7b2-bc6c-46dfb0f0359a	Popa-read	Popa - branje	f
00030000-55f2-d7b2-eded-c5fad5db9834	Popa-write	Popa - spreminjanje	f
00030000-55f2-d7b2-8b1b-9e314c8af0b9	Posta-read	Posta - branje	f
00030000-55f2-d7b2-5b06-e2fd6b068e49	Posta-write	Posta - spreminjanje	f
00030000-55f2-d7b2-ae79-1dc31acef331	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f2-d7b2-fd3d-ea75038d42e5	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f2-d7b2-b172-761047057dad	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f2-d7b2-3299-2ae7fd02512e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f2-d7b2-7ceb-d803a2263bfb	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f2-d7b2-0752-b9e4e5487448	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f2-d7b2-8120-4d6b18330ec1	Predstava-read	Predstava - branje	f
00030000-55f2-d7b2-5b10-acd5c05f9fd5	Predstava-write	Predstava - spreminjanje	f
00030000-55f2-d7b2-3d27-f6b6e0ff79fd	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f2-d7b2-9c23-f4abda745d39	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f2-d7b2-5551-fc20dc57e5b1	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f2-d7b2-e577-5db76c77049d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f2-d7b2-6019-a04f795794a1	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f2-d7b2-3ea5-8ab4be0409a7	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f2-d7b2-9057-f12424dc3b30	ProgramDela-read	ProgramDela - branje	f
00030000-55f2-d7b2-bae3-3cd0be570f71	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f2-d7b2-11e6-b7e3ea79a0a3	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f2-d7b2-a505-caf864a0c644	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f2-d7b2-decf-59ce49086dcf	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f2-d7b2-9ddb-591fef7816da	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f2-d7b2-47e3-068f41d7f473	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f2-d7b2-5198-856333567870	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f2-d7b2-4d38-75515b372957	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f2-d7b2-b897-880112191f36	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f2-d7b2-70b4-f1269c358816	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f2-d7b2-2b24-576c39787779	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f2-d7b2-01bb-2c5184933049	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f2-d7b2-d31d-f44faab25c34	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f2-d7b2-9664-f7b2705b75d6	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f2-d7b2-4672-768f8b812648	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f2-d7b2-6611-ac3e1546453d	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f2-d7b2-d89f-f6596e73cd27	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f2-d7b2-5918-8fd74790fffa	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f2-d7b2-3006-165c07cb5957	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f2-d7b2-bd6f-c09649bf865e	Prostor-read	Prostor - branje	f
00030000-55f2-d7b2-ea9f-aa412783eb9a	Prostor-write	Prostor - spreminjanje	f
00030000-55f2-d7b2-9d49-4f32c89c7fb0	Racun-read	Racun - branje	f
00030000-55f2-d7b2-78f3-e16b8ecce630	Racun-write	Racun - spreminjanje	f
00030000-55f2-d7b2-e73b-b4cbc1a237ec	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f2-d7b2-f626-73480072f957	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f2-d7b2-cf56-dff7c298a4a9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f2-d7b2-98ae-a15c2dc5fb5d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f2-d7b2-3504-0031cf0c32a4	Rekvizit-read	Rekvizit - branje	f
00030000-55f2-d7b2-4c55-88625bd4818a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f2-d7b2-8f45-19359186c652	Revizija-read	Revizija - branje	f
00030000-55f2-d7b2-843d-83b889fd9b74	Revizija-write	Revizija - spreminjanje	f
00030000-55f2-d7b2-6d41-54608e43fd69	Rezervacija-read	Rezervacija - branje	f
00030000-55f2-d7b2-8645-486732232ea1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f2-d7b2-32ff-842a31eae2cd	SedezniRed-read	SedezniRed - branje	f
00030000-55f2-d7b2-5e0d-c8f1918f0c8b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f2-d7b2-2b1e-2db561dfc64e	Sedez-read	Sedez - branje	f
00030000-55f2-d7b2-a7ae-4859f572cc4d	Sedez-write	Sedez - spreminjanje	f
00030000-55f2-d7b2-0c92-d0092d01aa17	Sezona-read	Sezona - branje	f
00030000-55f2-d7b2-6324-cdcfb1cbc115	Sezona-write	Sezona - spreminjanje	f
00030000-55f2-d7b2-bc89-3065f22c0c09	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f2-d7b2-187f-53547cbeb59e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f2-d7b2-8d9b-734d7884d525	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f2-d7b2-afbe-487c43aa5995	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f2-d7b2-ed13-da6e0fe53fc9	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f2-d7b2-ebfa-ea1207d01324	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f2-d7b2-d854-aeaa9e218314	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f2-d7b2-52a7-7b18ae20344e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f2-d7b2-a5c1-eb21d02444f1	Telefonska-read	Telefonska - branje	f
00030000-55f2-d7b2-531d-ba3101d5c2d1	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f2-d7b2-778b-4b98cf280d08	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f2-d7b2-07b1-291d9bace4f3	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f2-d7b2-174f-37c2004e7aa8	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f2-d7b2-768b-2dab86997224	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f2-d7b2-33c5-10ebe60c0895	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f2-d7b2-46fd-0282ce43aca0	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f2-d7b2-4624-d1802b4dfe71	Trr-read	Trr - branje	f
00030000-55f2-d7b2-aefa-1a41606ec256	Trr-write	Trr - spreminjanje	f
00030000-55f2-d7b2-6321-ee3729a10feb	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f2-d7b2-961d-84651d60b9ad	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f2-d7b2-8a23-09d1f261fa29	Vaja-read	Vaja - branje	f
00030000-55f2-d7b2-1bb3-5bfce20e82b4	Vaja-write	Vaja - spreminjanje	f
00030000-55f2-d7b2-b1f6-2042916d13ad	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f2-d7b2-79e8-5739dbef0c73	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f2-d7b2-5ae5-aad5826a8cf8	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f2-d7b2-24e1-69f28d49ed1f	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f2-d7b2-b236-598577ab115f	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f2-d7b2-5291-c318574e1f1b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f2-d7b2-c73a-0d612accdeb9	Zasedenost-read	Zasedenost - branje	f
00030000-55f2-d7b2-265b-f7a12e225d01	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f2-d7b2-329c-83dd745bb488	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f2-d7b2-9bc0-466003334e62	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f2-d7b2-fd89-d63c2a75a726	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f2-d7b2-8a7d-4ebcabfb93ca	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f2-d7b2-5371-99713ae75f64	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f2-d7b2-535c-9b98aec2d064	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f2-d7b2-afa2-982b881f86e3	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f2-d7b2-7a81-6794cb37adb1	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f2-d7b2-c9e3-0b04d9da1b70	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f2-d7b2-cbf8-8d0530bb2da2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f2-d7b2-9fa2-3f45dbb6d3c1	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f2-d7b2-dd10-a951df812e7d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f2-d7b2-1406-696f924d4166	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f2-d7b2-b822-69e00b403757	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f2-d7b2-9cbb-23fafbba16f1	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f2-d7b2-efa9-883af14320df	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2941 (class 0 OID 18979581)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f2-d7b2-9640-1e68f0a9bff4	00030000-55f2-d7b2-0982-1a4cb83023d7
00020000-55f2-d7b2-0698-b637ff67cda1	00030000-55f2-d7b2-ed56-a35a107cc67a
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-8f52-c9134139fb12
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-571d-f96e4030a6ec
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-a03c-915330143440
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-169d-9a6d764acc35
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-08b3-6415dc95cc0f
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-4107-0cd19b80130f
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-1ff0-6fdce4db40a6
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-d3d7-0f63e13cdf0a
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-ed56-a35a107cc67a
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-b9be-55ef6d8f58ea
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-6b51-16fd8f796ef4
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-979e-474503c4c246
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-f451-2c688dca8525
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-50a5-3fcc8bca1a94
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-a20b-e43af84589ea
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-daeb-f5e6cd157ae7
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-7f1e-fc41a221ce99
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-4bcc-b2aeff963879
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-b35e-60d1c812ba57
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-b8c9-e348b2a7aa51
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-feb5-f6ea813d4d57
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-5896-3b4d3dc5764d
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-bc6c-46dfb0f0359a
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-eded-c5fad5db9834
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-8b1b-9e314c8af0b9
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-5b06-e2fd6b068e49
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-7ceb-d803a2263bfb
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-0752-b9e4e5487448
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-8120-4d6b18330ec1
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-5b10-acd5c05f9fd5
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-6019-a04f795794a1
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-3ea5-8ab4be0409a7
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-bd6f-c09649bf865e
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-ea9f-aa412783eb9a
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-cf56-dff7c298a4a9
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-98ae-a15c2dc5fb5d
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-3504-0031cf0c32a4
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-4c55-88625bd4818a
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-0c92-d0092d01aa17
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-6324-cdcfb1cbc115
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-174f-37c2004e7aa8
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-6321-ee3729a10feb
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-961d-84651d60b9ad
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-8a23-09d1f261fa29
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-1bb3-5bfce20e82b4
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-c73a-0d612accdeb9
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-265b-f7a12e225d01
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-329c-83dd745bb488
00020000-55f2-d7b2-e63c-c146210ae7ed	00030000-55f2-d7b2-fd89-d63c2a75a726
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-8f52-c9134139fb12
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-08b3-6415dc95cc0f
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-4107-0cd19b80130f
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-ed56-a35a107cc67a
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-f451-2c688dca8525
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-a20b-e43af84589ea
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-7f1e-fc41a221ce99
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-4bcc-b2aeff963879
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-b35e-60d1c812ba57
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-b8c9-e348b2a7aa51
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-feb5-f6ea813d4d57
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-5896-3b4d3dc5764d
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-bc6c-46dfb0f0359a
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-8b1b-9e314c8af0b9
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-7ceb-d803a2263bfb
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-0752-b9e4e5487448
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-8120-4d6b18330ec1
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-bd6f-c09649bf865e
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-cf56-dff7c298a4a9
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-3504-0031cf0c32a4
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-0c92-d0092d01aa17
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-a5c1-eb21d02444f1
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-531d-ba3101d5c2d1
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-4624-d1802b4dfe71
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-aefa-1a41606ec256
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-b236-598577ab115f
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-5291-c318574e1f1b
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-329c-83dd745bb488
00020000-55f2-d7b2-4787-9c42c6d11f9a	00030000-55f2-d7b2-fd89-d63c2a75a726
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-8f52-c9134139fb12
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-a03c-915330143440
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-08b3-6415dc95cc0f
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-b5b2-d1c63a094632
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-323e-cc40c3823dbf
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-46ce-ddcb3c711f75
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-4107-0cd19b80130f
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-ed56-a35a107cc67a
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-6b51-16fd8f796ef4
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-f451-2c688dca8525
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-a20b-e43af84589ea
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-7f1e-fc41a221ce99
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-b35e-60d1c812ba57
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-b8c9-e348b2a7aa51
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-feb5-f6ea813d4d57
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-bc6c-46dfb0f0359a
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-8b1b-9e314c8af0b9
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-8120-4d6b18330ec1
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-6019-a04f795794a1
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-bd6f-c09649bf865e
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-cf56-dff7c298a4a9
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-3504-0031cf0c32a4
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-0c92-d0092d01aa17
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-174f-37c2004e7aa8
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-8a23-09d1f261fa29
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-c73a-0d612accdeb9
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-329c-83dd745bb488
00020000-55f2-d7b2-1b2c-f0723fd73a52	00030000-55f2-d7b2-fd89-d63c2a75a726
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-8f52-c9134139fb12
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-571d-f96e4030a6ec
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-169d-9a6d764acc35
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-08b3-6415dc95cc0f
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-4107-0cd19b80130f
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-ed56-a35a107cc67a
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-f451-2c688dca8525
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-a20b-e43af84589ea
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-b35e-60d1c812ba57
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-b8c9-e348b2a7aa51
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-bc6c-46dfb0f0359a
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-8b1b-9e314c8af0b9
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-8120-4d6b18330ec1
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-bd6f-c09649bf865e
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-cf56-dff7c298a4a9
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-3504-0031cf0c32a4
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-0c92-d0092d01aa17
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-174f-37c2004e7aa8
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-329c-83dd745bb488
00020000-55f2-d7b2-d957-3074431c21f0	00030000-55f2-d7b2-fd89-d63c2a75a726
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-8f52-c9134139fb12
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-08b3-6415dc95cc0f
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-4107-0cd19b80130f
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-ed56-a35a107cc67a
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-f451-2c688dca8525
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-a20b-e43af84589ea
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-b35e-60d1c812ba57
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-b8c9-e348b2a7aa51
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-bc6c-46dfb0f0359a
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-8b1b-9e314c8af0b9
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-8120-4d6b18330ec1
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-bd6f-c09649bf865e
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-cf56-dff7c298a4a9
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-3504-0031cf0c32a4
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-0c92-d0092d01aa17
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-778b-4b98cf280d08
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-e944-7d14136e4c2b
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-174f-37c2004e7aa8
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-329c-83dd745bb488
00020000-55f2-d7b2-e8e1-3757278d690d	00030000-55f2-d7b2-fd89-d63c2a75a726
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-bd63-cc12d9eb31cd
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-0982-1a4cb83023d7
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-e944-7d14136e4c2b
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-1ff0-6fdce4db40a6
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-a7df-5572201c5479
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-ec64-d046d2e340de
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-a987-3515124d90d9
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-8f52-c9134139fb12
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-571d-f96e4030a6ec
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-a03c-915330143440
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-169d-9a6d764acc35
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-08b3-6415dc95cc0f
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-b5b2-d1c63a094632
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-323e-cc40c3823dbf
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-e19d-8eb67410d64d
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-46ce-ddcb3c711f75
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-14d1-f3e9a0f23f1d
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-4107-0cd19b80130f
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-d3d7-0f63e13cdf0a
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-ed56-a35a107cc67a
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-b9be-55ef6d8f58ea
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-8723-3f1099f7e636
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-35de-d3de51b121c3
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-f454-810e2ef360ec
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-86e6-2061ef33cd16
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-6b51-16fd8f796ef4
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-979e-474503c4c246
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-f451-2c688dca8525
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-50a5-3fcc8bca1a94
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-a20b-e43af84589ea
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-daeb-f5e6cd157ae7
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-7f1e-fc41a221ce99
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-4bcc-b2aeff963879
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-fa7f-40c9a0e66ae2
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-e399-e1cff3c0f291
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-5a7b-3b46e3ae756e
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-42f7-21890e9166e7
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-b35e-60d1c812ba57
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-aaef-aac77b60b338
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-b8c9-e348b2a7aa51
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-2210-24b67329420a
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-feb5-f6ea813d4d57
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-5896-3b4d3dc5764d
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-e68b-6ba3cd4b0f7a
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-5a22-0461e7c48932
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-0026-3fa5dfed9b0b
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-8292-23b182569b25
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-2613-8ca8b89ba94f
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-e958-1036ba2eb7f1
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-bc6c-46dfb0f0359a
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-eded-c5fad5db9834
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-8b1b-9e314c8af0b9
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-5b06-e2fd6b068e49
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-ae79-1dc31acef331
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-fd3d-ea75038d42e5
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-b172-761047057dad
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-3299-2ae7fd02512e
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-7ceb-d803a2263bfb
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-0752-b9e4e5487448
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-8120-4d6b18330ec1
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-5b10-acd5c05f9fd5
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-3d27-f6b6e0ff79fd
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-9c23-f4abda745d39
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-5551-fc20dc57e5b1
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-e577-5db76c77049d
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-6019-a04f795794a1
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-3ea5-8ab4be0409a7
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-9057-f12424dc3b30
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-bae3-3cd0be570f71
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-11e6-b7e3ea79a0a3
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-a505-caf864a0c644
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-decf-59ce49086dcf
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-9ddb-591fef7816da
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-47e3-068f41d7f473
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-5198-856333567870
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-4d38-75515b372957
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-b897-880112191f36
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-70b4-f1269c358816
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-2b24-576c39787779
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-01bb-2c5184933049
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-d31d-f44faab25c34
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-9664-f7b2705b75d6
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-4672-768f8b812648
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-6611-ac3e1546453d
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-d89f-f6596e73cd27
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-5918-8fd74790fffa
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-3006-165c07cb5957
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-bd6f-c09649bf865e
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-ea9f-aa412783eb9a
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-9d49-4f32c89c7fb0
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-78f3-e16b8ecce630
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-e73b-b4cbc1a237ec
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-f626-73480072f957
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-cf56-dff7c298a4a9
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-98ae-a15c2dc5fb5d
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-3504-0031cf0c32a4
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-4c55-88625bd4818a
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-8f45-19359186c652
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-843d-83b889fd9b74
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-6d41-54608e43fd69
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-8645-486732232ea1
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-32ff-842a31eae2cd
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-5e0d-c8f1918f0c8b
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-2b1e-2db561dfc64e
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-a7ae-4859f572cc4d
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-0c92-d0092d01aa17
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-6324-cdcfb1cbc115
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-bc89-3065f22c0c09
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-187f-53547cbeb59e
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-8d9b-734d7884d525
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-afbe-487c43aa5995
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-ed13-da6e0fe53fc9
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-ebfa-ea1207d01324
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-d854-aeaa9e218314
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-52a7-7b18ae20344e
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-a5c1-eb21d02444f1
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-531d-ba3101d5c2d1
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-778b-4b98cf280d08
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-07b1-291d9bace4f3
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-174f-37c2004e7aa8
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-768b-2dab86997224
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-33c5-10ebe60c0895
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-46fd-0282ce43aca0
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-4624-d1802b4dfe71
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-aefa-1a41606ec256
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-6321-ee3729a10feb
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-961d-84651d60b9ad
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-8a23-09d1f261fa29
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-1bb3-5bfce20e82b4
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-b1f6-2042916d13ad
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-79e8-5739dbef0c73
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-5ae5-aad5826a8cf8
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-24e1-69f28d49ed1f
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-b236-598577ab115f
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-5291-c318574e1f1b
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-c73a-0d612accdeb9
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-265b-f7a12e225d01
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-329c-83dd745bb488
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-9bc0-466003334e62
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-fd89-d63c2a75a726
00020000-55f2-d7b3-2d01-4a2883151b74	00030000-55f2-d7b2-8a7d-4ebcabfb93ca
\.


--
-- TOC entry 2968 (class 0 OID 18979876)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 18979910)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 18980039)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f2-d7b3-a059-19a56005cb38	00090000-55f2-d7b3-2bb2-30862250ae51	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f2-d7b3-3af8-78534691bf20	00090000-55f2-d7b3-e4a6-c42227d17b7d	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f2-d7b3-c15c-c6a4304bcddb	00090000-55f2-d7b3-1431-e3ce0ec3fff5	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f2-d7b3-a4f7-e62346297823	00090000-55f2-d7b3-a71c-def613a39c78	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2946 (class 0 OID 18979641)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f2-d7b3-a7d2-4c0b4c5b36f3	00040000-55f2-d7b2-b6e9-c63b7c9f3453	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-d7b3-c5dd-95c85f496288	00040000-55f2-d7b2-b6e9-c63b7c9f3453	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f2-d7b3-617f-57862b412b5f	00040000-55f2-d7b2-b6e9-c63b7c9f3453	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-d7b3-e9f4-f52b0a938fba	00040000-55f2-d7b2-b6e9-c63b7c9f3453	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-d7b3-a59a-7262e765b95d	00040000-55f2-d7b2-b6e9-c63b7c9f3453	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-d7b3-2bae-ca2e7eb83d12	00040000-55f2-d7b2-7cb5-f4ac74f3b3e9	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-d7b3-104e-bfd353f7f945	00040000-55f2-d7b2-971e-a0fbd08c596d	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-d7b3-d775-dc6a00bde0d1	00040000-55f2-d7b2-4c60-244f79895146	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-d7b3-472b-5d24960ab72d	00040000-55f2-d7b2-77f7-777ba56d804f	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-d7b4-3d5a-e020bc242a96	00040000-55f2-d7b2-b6e9-c63b7c9f3453	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2948 (class 0 OID 18979675)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f2-d7b1-0cfc-4c3748dc33ec	8341	Adlešiči
00050000-55f2-d7b1-5ae5-dd95e4b187f6	5270	Ajdovščina
00050000-55f2-d7b1-f529-bea1044bdf36	6280	Ankaran/Ancarano
00050000-55f2-d7b1-d7eb-a2054694bae0	9253	Apače
00050000-55f2-d7b1-6e4a-77cf9078c90a	8253	Artiče
00050000-55f2-d7b1-1808-5b2cde2fb15f	4275	Begunje na Gorenjskem
00050000-55f2-d7b1-5d33-c8ecec3b8331	1382	Begunje pri Cerknici
00050000-55f2-d7b1-749f-a353edcbf34f	9231	Beltinci
00050000-55f2-d7b1-3557-41f85792d183	2234	Benedikt
00050000-55f2-d7b1-e9a9-dde0db5be51a	2345	Bistrica ob Dravi
00050000-55f2-d7b1-0107-d6390be9dcf6	3256	Bistrica ob Sotli
00050000-55f2-d7b1-63b8-a183d49ebfe5	8259	Bizeljsko
00050000-55f2-d7b1-0edd-affe15de1917	1223	Blagovica
00050000-55f2-d7b1-b097-bf590703022d	8283	Blanca
00050000-55f2-d7b1-c55f-b9944dd7f934	4260	Bled
00050000-55f2-d7b1-ad17-6ea2e2201008	4273	Blejska Dobrava
00050000-55f2-d7b1-0911-8f4eff91f568	9265	Bodonci
00050000-55f2-d7b1-028b-72c095422b6c	9222	Bogojina
00050000-55f2-d7b1-cd26-2f5f1588588f	4263	Bohinjska Bela
00050000-55f2-d7b1-6915-de170242fa02	4264	Bohinjska Bistrica
00050000-55f2-d7b1-616f-88fbe804f060	4265	Bohinjsko jezero
00050000-55f2-d7b1-d0b6-560b1d1bbc9f	1353	Borovnica
00050000-55f2-d7b1-f873-b6c229c837af	8294	Boštanj
00050000-55f2-d7b1-5cd8-0877db729ab9	5230	Bovec
00050000-55f2-d7b1-79be-0de1d31885e7	5295	Branik
00050000-55f2-d7b1-4099-e8ac38527838	3314	Braslovče
00050000-55f2-d7b1-e38e-c3e4d2bd68a6	5223	Breginj
00050000-55f2-d7b1-382f-c3a94109d370	8280	Brestanica
00050000-55f2-d7b1-250d-d748ec22235c	2354	Bresternica
00050000-55f2-d7b1-80c9-484a8e84a15c	4243	Brezje
00050000-55f2-d7b1-afd6-bd2dc4e28b39	1351	Brezovica pri Ljubljani
00050000-55f2-d7b1-90f9-1fb7db61ba47	8250	Brežice
00050000-55f2-d7b1-d167-7e250442666a	4210	Brnik - Aerodrom
00050000-55f2-d7b1-486e-84a7c691b9b8	8321	Brusnice
00050000-55f2-d7b1-40b3-3dc4812b0313	3255	Buče
00050000-55f2-d7b1-9e68-50ab43e6ffaf	8276	Bučka 
00050000-55f2-d7b1-4aaf-b335913f184b	9261	Cankova
00050000-55f2-d7b1-ab19-6350c7420ad2	3000	Celje 
00050000-55f2-d7b1-c04a-6e3a6a071256	3001	Celje - poštni predali
00050000-55f2-d7b1-7928-e9b744b87f95	4207	Cerklje na Gorenjskem
00050000-55f2-d7b1-3522-a77ea831f44f	8263	Cerklje ob Krki
00050000-55f2-d7b1-40ca-7ec124fecd6f	1380	Cerknica
00050000-55f2-d7b1-40b1-c657bb69f1bb	5282	Cerkno
00050000-55f2-d7b1-ae19-656ba4ae3774	2236	Cerkvenjak
00050000-55f2-d7b1-129a-35a9eb1d8fa7	2215	Ceršak
00050000-55f2-d7b1-7a18-8f1587b46a47	2326	Cirkovce
00050000-55f2-d7b1-9ebf-2edd56ff128c	2282	Cirkulane
00050000-55f2-d7b1-2909-66c5fef845da	5273	Col
00050000-55f2-d7b1-19f8-d338a60a9524	8251	Čatež ob Savi
00050000-55f2-d7b1-2890-f2d8d9490a4a	1413	Čemšenik
00050000-55f2-d7b1-aac8-875d7b8b0070	5253	Čepovan
00050000-55f2-d7b1-ba3a-5e3681413520	9232	Črenšovci
00050000-55f2-d7b1-487d-827b5927d4fa	2393	Črna na Koroškem
00050000-55f2-d7b1-706a-f407987da156	6275	Črni Kal
00050000-55f2-d7b1-11c8-dfd1d790c5e7	5274	Črni Vrh nad Idrijo
00050000-55f2-d7b1-1e02-a751de2917d2	5262	Črniče
00050000-55f2-d7b1-8ffd-3aa66c28bf34	8340	Črnomelj
00050000-55f2-d7b1-aad1-731e0f35364b	6271	Dekani
00050000-55f2-d7b1-2e36-3aa3f09e5ceb	5210	Deskle
00050000-55f2-d7b1-7679-492bd79d628d	2253	Destrnik
00050000-55f2-d7b1-5602-20a726de78ac	6215	Divača
00050000-55f2-d7b1-b209-5798435dd2bc	1233	Dob
00050000-55f2-d7b1-32ff-0480ad1c1aa4	3224	Dobje pri Planini
00050000-55f2-d7b1-db11-d6eb381d532e	8257	Dobova
00050000-55f2-d7b1-3adf-ca24c65f7435	1423	Dobovec
00050000-55f2-d7b1-1472-8566d519fbae	5263	Dobravlje
00050000-55f2-d7b1-6865-97a74e1ec4c0	3204	Dobrna
00050000-55f2-d7b1-fbb7-be90cb225e11	8211	Dobrnič
00050000-55f2-d7b1-5493-376c0f55af01	1356	Dobrova
00050000-55f2-d7b1-3ae1-cf2d4487b4fb	9223	Dobrovnik/Dobronak 
00050000-55f2-d7b1-3f15-d40a80d20f9f	5212	Dobrovo v Brdih
00050000-55f2-d7b1-411e-1dce6971f996	1431	Dol pri Hrastniku
00050000-55f2-d7b1-c6b9-82731ba4c1b6	1262	Dol pri Ljubljani
00050000-55f2-d7b1-9b7d-b8f41bda1648	1273	Dole pri Litiji
00050000-55f2-d7b1-ca02-d71d770b6c49	1331	Dolenja vas
00050000-55f2-d7b1-0699-1217021ea385	8350	Dolenjske Toplice
00050000-55f2-d7b1-bf2c-f27dc62205d2	1230	Domžale
00050000-55f2-d7b1-95b3-7f59f7755250	2252	Dornava
00050000-55f2-d7b1-282c-c09381beaf6f	5294	Dornberk
00050000-55f2-d7b1-1a07-096315e200ca	1319	Draga
00050000-55f2-d7b1-41fa-57718df150ef	8343	Dragatuš
00050000-55f2-d7b1-4197-f1d1ff1b3b9e	3222	Dramlje
00050000-55f2-d7b1-66ca-040a3793c3da	2370	Dravograd
00050000-55f2-d7b1-a701-f4999eca3430	4203	Duplje
00050000-55f2-d7b1-a77e-b61b9dd76c76	6221	Dutovlje
00050000-55f2-d7b1-9a41-aa897c1c5006	8361	Dvor
00050000-55f2-d7b1-0b03-76021c625676	2343	Fala
00050000-55f2-d7b1-32f4-ce455fe9f737	9208	Fokovci
00050000-55f2-d7b1-822f-937984fc7dce	2313	Fram
00050000-55f2-d7b1-b2f9-6da859e4516e	3213	Frankolovo
00050000-55f2-d7b1-d08b-b41cc6023bf6	1274	Gabrovka
00050000-55f2-d7b1-bab9-d990d2a89844	8254	Globoko
00050000-55f2-d7b1-97bb-624edd3bd1c8	5275	Godovič
00050000-55f2-d7b1-9097-91edb8c192c2	4204	Golnik
00050000-55f2-d7b1-78fe-f3e8f57ea6a9	3303	Gomilsko
00050000-55f2-d7b1-1238-4db18a29f94b	4224	Gorenja vas
00050000-55f2-d7b1-3599-a083f2f0666a	3263	Gorica pri Slivnici
00050000-55f2-d7b1-8d4f-c37a58c384eb	2272	Gorišnica
00050000-55f2-d7b1-e4f6-a39b66680d36	9250	Gornja Radgona
00050000-55f2-d7b1-f11d-cc8e394d2ab4	3342	Gornji Grad
00050000-55f2-d7b1-ee05-85a2c18a5a33	4282	Gozd Martuljek
00050000-55f2-d7b1-ec4e-ac6bf57af168	6272	Gračišče
00050000-55f2-d7b1-3563-cf955ca826bc	9264	Grad
00050000-55f2-d7b1-8e01-7d519ef5e8b3	8332	Gradac
00050000-55f2-d7b1-5ea3-64fa38d371fc	1384	Grahovo
00050000-55f2-d7b1-d207-50694f0830ab	5242	Grahovo ob Bači
00050000-55f2-d7b1-f1cb-b24918d725f1	5251	Grgar
00050000-55f2-d7b1-8171-04dd311dc9cb	3302	Griže
00050000-55f2-d7b1-c641-cb0c2595acd1	3231	Grobelno
00050000-55f2-d7b1-29c5-390b65eb9591	1290	Grosuplje
00050000-55f2-d7b1-f64d-a315654b0904	2288	Hajdina
00050000-55f2-d7b1-564d-6d34839d4023	8362	Hinje
00050000-55f2-d7b1-8321-6aa6a207b5d8	2311	Hoče
00050000-55f2-d7b1-361b-a45b17261f8d	9205	Hodoš/Hodos
00050000-55f2-d7b1-e81c-90ff3830d44b	1354	Horjul
00050000-55f2-d7b1-e296-8079257c8b66	1372	Hotedršica
00050000-55f2-d7b1-5538-c47e1e60a7d9	1430	Hrastnik
00050000-55f2-d7b1-1fd8-0900e0dbc441	6225	Hruševje
00050000-55f2-d7b1-33ce-fcdee6380356	4276	Hrušica
00050000-55f2-d7b1-7ece-0281a50e7804	5280	Idrija
00050000-55f2-d7b1-69aa-366f6047d27f	1292	Ig
00050000-55f2-d7b1-d22e-853b81cabd9e	6250	Ilirska Bistrica
00050000-55f2-d7b1-379e-4a92cdc5c10e	6251	Ilirska Bistrica-Trnovo
00050000-55f2-d7b1-dd17-e8b413c4921e	1295	Ivančna Gorica
00050000-55f2-d7b1-1439-84f8bb8f4f89	2259	Ivanjkovci
00050000-55f2-d7b1-2498-fa31b70d2eb4	1411	Izlake
00050000-55f2-d7b1-915e-ca5b60c034af	6310	Izola/Isola
00050000-55f2-d7b1-9c82-9d5f8d14a09d	2222	Jakobski Dol
00050000-55f2-d7b1-7f59-7acb1e9bd05a	2221	Jarenina
00050000-55f2-d7b1-9786-eb9a06a12b1c	6254	Jelšane
00050000-55f2-d7b1-2d84-4967fa1382e7	4270	Jesenice
00050000-55f2-d7b1-1850-6f2ec42ba2c7	8261	Jesenice na Dolenjskem
00050000-55f2-d7b1-b9fd-d53e0cad4142	3273	Jurklošter
00050000-55f2-d7b1-a349-22a60dc355ff	2223	Jurovski Dol
00050000-55f2-d7b1-b4d4-f276e82c99a2	2256	Juršinci
00050000-55f2-d7b1-cd06-4c50c696d57b	5214	Kal nad Kanalom
00050000-55f2-d7b1-2e0c-28d5e879adcd	3233	Kalobje
00050000-55f2-d7b1-fd62-d7d54ec6bdca	4246	Kamna Gorica
00050000-55f2-d7b1-3add-5490dc681b6f	2351	Kamnica
00050000-55f2-d7b1-c71b-6d60e9010fcf	1241	Kamnik
00050000-55f2-d7b1-30df-4d6346de29c0	5213	Kanal
00050000-55f2-d7b1-a51e-77fb23e9ca6a	8258	Kapele
00050000-55f2-d7b1-2c92-291bb6a5569a	2362	Kapla
00050000-55f2-d7b1-623b-5fc04956edfa	2325	Kidričevo
00050000-55f2-d7b1-f5e2-9bb4ee3fb728	1412	Kisovec
00050000-55f2-d7b1-da35-45866c89133d	6253	Knežak
00050000-55f2-d7b1-ea4d-254736c9164c	5222	Kobarid
00050000-55f2-d7b1-9306-ca7f0318fe51	9227	Kobilje
00050000-55f2-d7b1-dbe1-f49caa5787a5	1330	Kočevje
00050000-55f2-d7b1-7b02-cceb52dae731	1338	Kočevska Reka
00050000-55f2-d7b1-c1ca-fa8723419293	2276	Kog
00050000-55f2-d7b1-6ebb-c60cd2eb3935	5211	Kojsko
00050000-55f2-d7b1-0314-dd3d9323280e	6223	Komen
00050000-55f2-d7b1-58a3-1f614d892dd0	1218	Komenda
00050000-55f2-d7b1-c8d7-38adcc779abf	6000	Koper/Capodistria 
00050000-55f2-d7b1-9e78-fd00eac14d9f	6001	Koper/Capodistria - poštni predali
00050000-55f2-d7b1-87ab-5dfef8514405	8282	Koprivnica
00050000-55f2-d7b1-d15f-79fcd6765fd8	5296	Kostanjevica na Krasu
00050000-55f2-d7b1-d086-9c1f41845140	8311	Kostanjevica na Krki
00050000-55f2-d7b1-0302-33721f82714f	1336	Kostel
00050000-55f2-d7b1-640c-3568977ac8c5	6256	Košana
00050000-55f2-d7b1-947d-1feb0459d1bd	2394	Kotlje
00050000-55f2-d7b1-653f-25a32a5ba197	6240	Kozina
00050000-55f2-d7b1-c13e-f98218c6aade	3260	Kozje
00050000-55f2-d7b1-669d-b83c9e3c24f3	4000	Kranj 
00050000-55f2-d7b1-bcb3-773b254537e4	4001	Kranj - poštni predali
00050000-55f2-d7b1-0244-7777e98d8797	4280	Kranjska Gora
00050000-55f2-d7b1-f26c-9d02e056dd1d	1281	Kresnice
00050000-55f2-d7b1-93c0-41f99c4dc7f4	4294	Križe
00050000-55f2-d7b1-f93e-fc0954d0154f	9206	Križevci
00050000-55f2-d7b1-b1bd-de0976e834ef	9242	Križevci pri Ljutomeru
00050000-55f2-d7b1-28a4-5c386e9972f5	1301	Krka
00050000-55f2-d7b1-d353-fbc145ec8935	8296	Krmelj
00050000-55f2-d7b1-c927-52bc45db6095	4245	Kropa
00050000-55f2-d7b1-f2e1-89d570190203	8262	Krška vas
00050000-55f2-d7b1-6fb3-76f525c32e04	8270	Krško
00050000-55f2-d7b1-9164-12df24b0f01f	9263	Kuzma
00050000-55f2-d7b1-1f0e-c21a9022ee73	2318	Laporje
00050000-55f2-d7b1-6e79-2fe080ed1e1a	3270	Laško
00050000-55f2-d7b1-22b7-598b1ecf525d	1219	Laze v Tuhinju
00050000-55f2-d7b1-334a-b4eacb60d57d	2230	Lenart v Slovenskih goricah
00050000-55f2-d7b1-67b4-bb77e5958054	9220	Lendava/Lendva
00050000-55f2-d7b1-bb7d-5c27d9b6007d	4248	Lesce
00050000-55f2-d7b1-9c55-d7b5122f889c	3261	Lesično
00050000-55f2-d7b1-d820-ac64c712b527	8273	Leskovec pri Krškem
00050000-55f2-d7b1-179c-a026fb908bf2	2372	Libeliče
00050000-55f2-d7b1-a3e9-ab1775019873	2341	Limbuš
00050000-55f2-d7b1-1a97-e0d7e83e8740	1270	Litija
00050000-55f2-d7b1-52c1-22cd2f10d780	3202	Ljubečna
00050000-55f2-d7b1-d6c9-381367330850	1000	Ljubljana 
00050000-55f2-d7b1-d6ec-092628488300	1001	Ljubljana - poštni predali
00050000-55f2-d7b1-403d-330670046bc1	1231	Ljubljana - Črnuče
00050000-55f2-d7b1-ae8b-e614f491af75	1261	Ljubljana - Dobrunje
00050000-55f2-d7b1-9ece-934534d77180	1260	Ljubljana - Polje
00050000-55f2-d7b1-b26c-782aad7dba69	1210	Ljubljana - Šentvid
00050000-55f2-d7b1-947e-bdb68022825a	1211	Ljubljana - Šmartno
00050000-55f2-d7b1-6fa1-8dfabfea5f2a	3333	Ljubno ob Savinji
00050000-55f2-d7b1-1092-bd3612807519	9240	Ljutomer
00050000-55f2-d7b1-3126-f0d2c907053f	3215	Loče
00050000-55f2-d7b1-20ee-cded44a882a4	5231	Log pod Mangartom
00050000-55f2-d7b1-f4e5-8a38d36c83fc	1358	Log pri Brezovici
00050000-55f2-d7b1-c046-6572e3d60d3b	1370	Logatec
00050000-55f2-d7b1-bf29-1147c731cd11	1371	Logatec
00050000-55f2-d7b1-5830-db86fa5c9e49	1434	Loka pri Zidanem Mostu
00050000-55f2-d7b1-628d-e1d56d6a6180	3223	Loka pri Žusmu
00050000-55f2-d7b1-7bab-b187a87eb847	6219	Lokev
00050000-55f2-d7b1-b618-a1a14c15a33a	1318	Loški Potok
00050000-55f2-d7b1-ffde-877b0a0e79d8	2324	Lovrenc na Dravskem polju
00050000-55f2-d7b1-bc3d-59db50199904	2344	Lovrenc na Pohorju
00050000-55f2-d7b1-4601-94cdd43dbcd8	3334	Luče
00050000-55f2-d7b1-a53b-cd711216ea3b	1225	Lukovica
00050000-55f2-d7b1-d16a-eff7854e15e4	9202	Mačkovci
00050000-55f2-d7b1-8256-63d697cec132	2322	Majšperk
00050000-55f2-d7b1-5533-d09d18edf3a3	2321	Makole
00050000-55f2-d7b1-9ce4-ae3463e1b214	9243	Mala Nedelja
00050000-55f2-d7b1-ce36-235c6e6b540a	2229	Malečnik
00050000-55f2-d7b1-7a77-327204d54fc4	6273	Marezige
00050000-55f2-d7b1-efee-ab731d519b66	2000	Maribor 
00050000-55f2-d7b1-fc15-e0f98caf19ee	2001	Maribor - poštni predali
00050000-55f2-d7b1-8de6-4aaf7147d837	2206	Marjeta na Dravskem polju
00050000-55f2-d7b1-3faf-d345027918c1	2281	Markovci
00050000-55f2-d7b1-7ec9-60f367a646f8	9221	Martjanci
00050000-55f2-d7b1-3bfa-53111b74d427	6242	Materija
00050000-55f2-d7b1-69a4-395c4e944a62	4211	Mavčiče
00050000-55f2-d7b1-6e6b-9abd0667572b	1215	Medvode
00050000-55f2-d7b1-c6e4-0855e3ab6e19	1234	Mengeš
00050000-55f2-d7b1-6c93-7f0742dbdc2b	8330	Metlika
00050000-55f2-d7b1-e964-d30b8eea28e0	2392	Mežica
00050000-55f2-d7b1-2967-2d6156dde9cf	2204	Miklavž na Dravskem polju
00050000-55f2-d7b1-d68b-521ff9a4face	2275	Miklavž pri Ormožu
00050000-55f2-d7b1-a2f5-75146f4a36ac	5291	Miren
00050000-55f2-d7b1-b21e-74576eaa8d14	8233	Mirna
00050000-55f2-d7b1-163f-35bf1b67594f	8216	Mirna Peč
00050000-55f2-d7b1-9d27-c91143b427a6	2382	Mislinja
00050000-55f2-d7b1-be33-632acfa5eb98	4281	Mojstrana
00050000-55f2-d7b1-de09-c9833a139d78	8230	Mokronog
00050000-55f2-d7b1-53b8-c26935bddbd5	1251	Moravče
00050000-55f2-d7b1-13ed-b1321715cde4	9226	Moravske Toplice
00050000-55f2-d7b1-abef-7808aae441e3	5216	Most na Soči
00050000-55f2-d7b1-bd99-b36bda93bde8	1221	Motnik
00050000-55f2-d7b1-5898-a1a835d4fa1f	3330	Mozirje
00050000-55f2-d7b1-f7bd-2a0c495378a6	9000	Murska Sobota 
00050000-55f2-d7b1-11b0-ca361861d9e5	9001	Murska Sobota - poštni predali
00050000-55f2-d7b1-035f-1b1bccf09619	2366	Muta
00050000-55f2-d7b1-16bb-485a669215e9	4202	Naklo
00050000-55f2-d7b1-736b-de81ea9efa57	3331	Nazarje
00050000-55f2-d7b1-60ae-e9434b915a3e	1357	Notranje Gorice
00050000-55f2-d7b1-b790-89035e207800	3203	Nova Cerkev
00050000-55f2-d7b1-42f5-af27b5cebbb7	5000	Nova Gorica 
00050000-55f2-d7b1-e581-46eff90da893	5001	Nova Gorica - poštni predali
00050000-55f2-d7b1-5c85-fc37dc5cc878	1385	Nova vas
00050000-55f2-d7b1-cb92-bed14af664f6	8000	Novo mesto
00050000-55f2-d7b1-097d-9e25354f92c7	8001	Novo mesto - poštni predali
00050000-55f2-d7b1-de88-ea7d8c45760d	6243	Obrov
00050000-55f2-d7b1-c574-166e965e99b5	9233	Odranci
00050000-55f2-d7b1-3d20-f7fe68c005b4	2317	Oplotnica
00050000-55f2-d7b1-04fd-bf10dbe0d359	2312	Orehova vas
00050000-55f2-d7b1-5023-fdca853bceb5	2270	Ormož
00050000-55f2-d7b1-a40c-667a8362dfdd	1316	Ortnek
00050000-55f2-d7b1-7438-a4662a57f34f	1337	Osilnica
00050000-55f2-d7b1-1f42-93cdcf449beb	8222	Otočec
00050000-55f2-d7b1-1d55-bf1af2502f68	2361	Ožbalt
00050000-55f2-d7b1-7129-4bec4453e28a	2231	Pernica
00050000-55f2-d7b1-2f1a-dea877ddded9	2211	Pesnica pri Mariboru
00050000-55f2-d7b1-c975-6b44f393f0ae	9203	Petrovci
00050000-55f2-d7b1-3be0-51a197e2aebf	3301	Petrovče
00050000-55f2-d7b1-b5b6-444770898d72	6330	Piran/Pirano
00050000-55f2-d7b1-79c7-89f57d57722d	8255	Pišece
00050000-55f2-d7b1-9b29-3ac3abd8b05a	6257	Pivka
00050000-55f2-d7b1-e50a-d5d568212b12	6232	Planina
00050000-55f2-d7b1-f726-eb570d62d6c1	3225	Planina pri Sevnici
00050000-55f2-d7b1-3623-8113feb43962	6276	Pobegi
00050000-55f2-d7b1-c1c8-0eb55970c655	8312	Podbočje
00050000-55f2-d7b1-6fc1-25fa1b6a444b	5243	Podbrdo
00050000-55f2-d7b1-09aa-557f48b8b70b	3254	Podčetrtek
00050000-55f2-d7b1-2a56-0ab38e571f59	2273	Podgorci
00050000-55f2-d7b1-eaf6-1f864611495a	6216	Podgorje
00050000-55f2-d7b1-dfd1-bd7da3f6f727	2381	Podgorje pri Slovenj Gradcu
00050000-55f2-d7b1-7fc9-b50a77645286	6244	Podgrad
00050000-55f2-d7b1-4242-38e71e090e95	1414	Podkum
00050000-55f2-d7b1-40da-3cc697562b57	2286	Podlehnik
00050000-55f2-d7b1-528d-4714f19bfa3d	5272	Podnanos
00050000-55f2-d7b1-8641-2afdf8fe283a	4244	Podnart
00050000-55f2-d7b1-6136-7a376c3c3403	3241	Podplat
00050000-55f2-d7b1-3586-ef1269a1e10d	3257	Podsreda
00050000-55f2-d7b1-abfa-25bf30919ff0	2363	Podvelka
00050000-55f2-d7b1-d5e9-aca2dcd59ce8	2208	Pohorje
00050000-55f2-d7b1-a7a8-ae1937ab9e26	2257	Polenšak
00050000-55f2-d7b1-3ee1-1963ea20d767	1355	Polhov Gradec
00050000-55f2-d7b1-29d9-0e19a1ed3293	4223	Poljane nad Škofjo Loko
00050000-55f2-d7b1-3b68-e06e8a4ffe74	2319	Poljčane
00050000-55f2-d7b1-721a-2b1418a3bff3	1272	Polšnik
00050000-55f2-d7b1-2381-c21951cdd4cb	3313	Polzela
00050000-55f2-d7b1-2f9e-92905215655e	3232	Ponikva
00050000-55f2-d7b1-bf14-46175acbd10c	6320	Portorož/Portorose
00050000-55f2-d7b1-86c6-7fd6391d154d	6230	Postojna
00050000-55f2-d7b1-ac73-1428c32a7633	2331	Pragersko
00050000-55f2-d7b1-7550-5db324a9e6dd	3312	Prebold
00050000-55f2-d7b1-947a-0a22ec958682	4205	Preddvor
00050000-55f2-d7b1-22ef-ed1bac81635c	6255	Prem
00050000-55f2-d7b1-6a23-f5b2594755da	1352	Preserje
00050000-55f2-d7b1-1d84-3c2e3495eeab	6258	Prestranek
00050000-55f2-d7b1-714b-b23d8f769417	2391	Prevalje
00050000-55f2-d7b1-2306-b4260b753bde	3262	Prevorje
00050000-55f2-d7b1-e56a-7dae6d144214	1276	Primskovo 
00050000-55f2-d7b1-25ce-f8e14f187589	3253	Pristava pri Mestinju
00050000-55f2-d7b1-1496-53645bbb6805	9207	Prosenjakovci/Partosfalva
00050000-55f2-d7b1-a9a6-25d8a5f2dc1c	5297	Prvačina
00050000-55f2-d7b1-2fbb-531a2d4231d1	2250	Ptuj
00050000-55f2-d7b1-7901-f22acf8fb243	2323	Ptujska Gora
00050000-55f2-d7b1-7ac6-6061f9c78066	9201	Puconci
00050000-55f2-d7b1-03c1-3ac0bdb9f416	2327	Rače
00050000-55f2-d7b1-74fe-b50c64624b48	1433	Radeče
00050000-55f2-d7b1-4636-b608971b06d5	9252	Radenci
00050000-55f2-d7b1-7eb2-57beaa52c601	2360	Radlje ob Dravi
00050000-55f2-d7b1-ca6c-94bcac3c8ce9	1235	Radomlje
00050000-55f2-d7b1-9dcf-900c2ebeef88	4240	Radovljica
00050000-55f2-d7b1-aa76-84c5a3c9f963	8274	Raka
00050000-55f2-d7b1-9996-77ebe89c029d	1381	Rakek
00050000-55f2-d7b1-7fed-16e0968fcad6	4283	Rateče - Planica
00050000-55f2-d7b1-778b-f21c041c2bc1	2390	Ravne na Koroškem
00050000-55f2-d7b1-484f-64b15684c830	9246	Razkrižje
00050000-55f2-d7b1-5a46-a92b157186df	3332	Rečica ob Savinji
00050000-55f2-d7b1-58cd-ffabaf24a2be	5292	Renče
00050000-55f2-d7b1-8fed-67cfb63ac713	1310	Ribnica
00050000-55f2-d7b1-81af-dafbf7346ab7	2364	Ribnica na Pohorju
00050000-55f2-d7b1-d7ed-da39648ceb7b	3272	Rimske Toplice
00050000-55f2-d7b1-f8fc-4a10fece06ef	1314	Rob
00050000-55f2-d7b1-93d0-22ecf0e1c103	5215	Ročinj
00050000-55f2-d7b1-de2c-617b48f2caf7	3250	Rogaška Slatina
00050000-55f2-d7b1-698f-e25e88d477a6	9262	Rogašovci
00050000-55f2-d7b1-c28b-783179cce03e	3252	Rogatec
00050000-55f2-d7b1-bcfa-f0cf1237825c	1373	Rovte
00050000-55f2-d7b1-e04f-57f1aedeb65c	2342	Ruše
00050000-55f2-d7b1-e9b2-98f709ec75b6	1282	Sava
00050000-55f2-d7b1-ba57-e5b4e2bdafcb	6333	Sečovlje/Sicciole
00050000-55f2-d7b1-2937-b46025965574	4227	Selca
00050000-55f2-d7b1-9413-0cfb760bdb7c	2352	Selnica ob Dravi
00050000-55f2-d7b1-8bf6-8b822f07f4a7	8333	Semič
00050000-55f2-d7b1-3186-ded9b7f3c63c	8281	Senovo
00050000-55f2-d7b1-9d59-4605337573cc	6224	Senožeče
00050000-55f2-d7b1-88a6-f78f5f973959	8290	Sevnica
00050000-55f2-d7b1-beee-85f1ccffe159	6210	Sežana
00050000-55f2-d7b1-f860-0489dca98b7b	2214	Sladki Vrh
00050000-55f2-d7b1-5175-2155f8413295	5283	Slap ob Idrijci
00050000-55f2-d7b1-f038-bc07de6aacf3	2380	Slovenj Gradec
00050000-55f2-d7b1-fdc5-52565a86a641	2310	Slovenska Bistrica
00050000-55f2-d7b1-83f2-10fda4e4c332	3210	Slovenske Konjice
00050000-55f2-d7b1-b6fb-ce1233a8999a	1216	Smlednik
00050000-55f2-d7b1-a448-ffde221032b7	5232	Soča
00050000-55f2-d7b1-d819-4e93f7122cdb	1317	Sodražica
00050000-55f2-d7b1-a6b0-bfdac4ef0604	3335	Solčava
00050000-55f2-d7b1-ccb6-e49891660a0b	5250	Solkan
00050000-55f2-d7b1-4291-ab01e9f7c7ed	4229	Sorica
00050000-55f2-d7b1-187c-123b966a591d	4225	Sovodenj
00050000-55f2-d7b1-35d7-17620f69839e	5281	Spodnja Idrija
00050000-55f2-d7b1-e83a-0b05ffd4b26b	2241	Spodnji Duplek
00050000-55f2-d7b1-ccda-d1806d259f25	9245	Spodnji Ivanjci
00050000-55f2-d7b1-3984-c74bbb2e66cb	2277	Središče ob Dravi
00050000-55f2-d7b1-f967-9ab6de151296	4267	Srednja vas v Bohinju
00050000-55f2-d7b1-e863-c1a52fde39d6	8256	Sromlje 
00050000-55f2-d7b1-1b64-4de562808f21	5224	Srpenica
00050000-55f2-d7b1-6ecc-181892397187	1242	Stahovica
00050000-55f2-d7b1-d757-de0689cecdfe	1332	Stara Cerkev
00050000-55f2-d7b1-2a9f-6bd68ea1f259	8342	Stari trg ob Kolpi
00050000-55f2-d7b1-16c0-8cd98e7f57f9	1386	Stari trg pri Ložu
00050000-55f2-d7b1-0897-dc1838a14ae8	2205	Starše
00050000-55f2-d7b1-96f8-e1a45237cfe6	2289	Stoperce
00050000-55f2-d7b1-8129-823ef7ed0b51	8322	Stopiče
00050000-55f2-d7b1-4610-258710c0473a	3206	Stranice
00050000-55f2-d7b1-fada-af89c414eec8	8351	Straža
00050000-55f2-d7b1-a77a-5174d72a112d	1313	Struge
00050000-55f2-d7b1-1f6b-3a623db7912c	8293	Studenec
00050000-55f2-d7b1-d163-15ce34051146	8331	Suhor
00050000-55f2-d7b1-79b9-b1d7d564b0c7	2233	Sv. Ana v Slovenskih goricah
00050000-55f2-d7b1-ecda-009b64f05c8f	2235	Sv. Trojica v Slovenskih goricah
00050000-55f2-d7b1-fc84-c6f24d3f9c2e	2353	Sveti Duh na Ostrem Vrhu
00050000-55f2-d7b1-4071-84532b8b2a4a	9244	Sveti Jurij ob Ščavnici
00050000-55f2-d7b1-2e8b-b991cdd062d6	3264	Sveti Štefan
00050000-55f2-d7b1-df55-2bf18335f8e6	2258	Sveti Tomaž
00050000-55f2-d7b1-6914-8217bd947cf3	9204	Šalovci
00050000-55f2-d7b1-8468-f1daaf1498ea	5261	Šempas
00050000-55f2-d7b1-c89f-898bd9d580db	5290	Šempeter pri Gorici
00050000-55f2-d7b1-de9b-00b7400da81a	3311	Šempeter v Savinjski dolini
00050000-55f2-d7b1-a903-40ad9e7cf78d	4208	Šenčur
00050000-55f2-d7b1-0b97-390c6706ec93	2212	Šentilj v Slovenskih goricah
00050000-55f2-d7b1-4cca-bb9a22192d2b	8297	Šentjanž
00050000-55f2-d7b1-6b6d-7866a08062c7	2373	Šentjanž pri Dravogradu
00050000-55f2-d7b1-d209-bc14174bf4f4	8310	Šentjernej
00050000-55f2-d7b1-79ed-af9d4f44e75c	3230	Šentjur
00050000-55f2-d7b1-05d2-5e056d399566	3271	Šentrupert
00050000-55f2-d7b1-6791-e4e5337cf409	8232	Šentrupert
00050000-55f2-d7b1-c931-430dadd7d97a	1296	Šentvid pri Stični
00050000-55f2-d7b1-46e0-e571dcfa3a4f	8275	Škocjan
00050000-55f2-d7b1-9b52-f42dc8c36816	6281	Škofije
00050000-55f2-d7b1-cac6-ae2705f64797	4220	Škofja Loka
00050000-55f2-d7b1-9645-45b846fdeb67	3211	Škofja vas
00050000-55f2-d7b1-8927-010277c8d310	1291	Škofljica
00050000-55f2-d7b1-cf8e-d8f64272f41b	6274	Šmarje
00050000-55f2-d7b1-0259-20721548607f	1293	Šmarje - Sap
00050000-55f2-d7b1-2fd7-828af03e7bc1	3240	Šmarje pri Jelšah
00050000-55f2-d7b1-9385-2a6b7ce22cb3	8220	Šmarješke Toplice
00050000-55f2-d7b1-931c-dbc4dc4d3d74	2315	Šmartno na Pohorju
00050000-55f2-d7b1-e485-e295d457d3bd	3341	Šmartno ob Dreti
00050000-55f2-d7b1-04d1-58747b054500	3327	Šmartno ob Paki
00050000-55f2-d7b1-8705-93c103f2414c	1275	Šmartno pri Litiji
00050000-55f2-d7b1-8535-77ff61ad79ca	2383	Šmartno pri Slovenj Gradcu
00050000-55f2-d7b1-d0be-eff78fe9b6e3	3201	Šmartno v Rožni dolini
00050000-55f2-d7b1-0500-e256bb1ef4a8	3325	Šoštanj
00050000-55f2-d7b1-0cff-d8158697615a	6222	Štanjel
00050000-55f2-d7b1-d694-fe06506747a0	3220	Štore
00050000-55f2-d7b1-153c-f50711c387dd	3304	Tabor
00050000-55f2-d7b2-93e4-b1802be1cd61	3221	Teharje
00050000-55f2-d7b2-ef54-8d7d1b9ec75a	9251	Tišina
00050000-55f2-d7b2-aac1-8938c901b810	5220	Tolmin
00050000-55f2-d7b2-ca62-31260d9df52f	3326	Topolšica
00050000-55f2-d7b2-6793-381cea3b4913	2371	Trbonje
00050000-55f2-d7b2-d109-da4d88cb3502	1420	Trbovlje
00050000-55f2-d7b2-cbb8-d87b19bd9630	8231	Trebelno 
00050000-55f2-d7b2-6d26-872ce27f6182	8210	Trebnje
00050000-55f2-d7b2-5a46-974e35a1ee5a	5252	Trnovo pri Gorici
00050000-55f2-d7b2-850c-1ad0aa0d7107	2254	Trnovska vas
00050000-55f2-d7b2-5188-015737fd7ae4	1222	Trojane
00050000-55f2-d7b2-ac89-17cdc3d50bc4	1236	Trzin
00050000-55f2-d7b2-2405-d5b054ddedf8	4290	Tržič
00050000-55f2-d7b2-c020-2631c5a4b8f4	8295	Tržišče
00050000-55f2-d7b2-f84c-4334dbf3f26f	1311	Turjak
00050000-55f2-d7b2-7b70-3c893d7638aa	9224	Turnišče
00050000-55f2-d7b2-d66b-bc4a2ea286b1	8323	Uršna sela
00050000-55f2-d7b2-da68-0ae14fd3c2f7	1252	Vače
00050000-55f2-d7b2-cf82-1a4c87f8b10b	3320	Velenje 
00050000-55f2-d7b2-ee85-cd16bf05253e	3322	Velenje - poštni predali
00050000-55f2-d7b2-2a65-24133d29c70c	8212	Velika Loka
00050000-55f2-d7b2-f240-694070f85c84	2274	Velika Nedelja
00050000-55f2-d7b2-e270-2b055633666b	9225	Velika Polana
00050000-55f2-d7b2-aa96-d6a2c49378a2	1315	Velike Lašče
00050000-55f2-d7b2-240d-53bf4df563a2	8213	Veliki Gaber
00050000-55f2-d7b2-9d94-6bba76530bd5	9241	Veržej
00050000-55f2-d7b2-95a4-cc58c2c9f048	1312	Videm - Dobrepolje
00050000-55f2-d7b2-d352-045702fef476	2284	Videm pri Ptuju
00050000-55f2-d7b2-d02e-620c05030796	8344	Vinica
00050000-55f2-d7b2-abee-26ba28fed9be	5271	Vipava
00050000-55f2-d7b2-91f8-d1e5cf422c94	4212	Visoko
00050000-55f2-d7b2-e0a0-b92dc669df28	1294	Višnja Gora
00050000-55f2-d7b2-9a34-aa79477afb06	3205	Vitanje
00050000-55f2-d7b2-a393-847608e14e89	2255	Vitomarci
00050000-55f2-d7b2-e121-24dc62e5fe42	1217	Vodice
00050000-55f2-d7b2-ddbd-2ee66f85aece	3212	Vojnik\t
00050000-55f2-d7b2-2854-beb45d6e0ba6	5293	Volčja Draga
00050000-55f2-d7b2-facb-3bb698cd4ef8	2232	Voličina
00050000-55f2-d7b2-83b9-875afaa708a8	3305	Vransko
00050000-55f2-d7b2-7c4f-e60565de72d8	6217	Vremski Britof
00050000-55f2-d7b2-3351-38e2ada46238	1360	Vrhnika
00050000-55f2-d7b2-7dd0-ee08c67c2acb	2365	Vuhred
00050000-55f2-d7b2-62a9-438d47a150a4	2367	Vuzenica
00050000-55f2-d7b2-c7c2-7a2591c7ffab	8292	Zabukovje 
00050000-55f2-d7b2-e25b-a40cd4b6da5c	1410	Zagorje ob Savi
00050000-55f2-d7b2-3b90-61aad06f4c1d	1303	Zagradec
00050000-55f2-d7b2-789f-e8e8bc08d2d2	2283	Zavrč
00050000-55f2-d7b2-c050-a736a4be96ab	8272	Zdole 
00050000-55f2-d7b2-7f90-7c1909da2e89	4201	Zgornja Besnica
00050000-55f2-d7b2-4ab1-4d913fabcee7	2242	Zgornja Korena
00050000-55f2-d7b2-d131-a5a6e84f71aa	2201	Zgornja Kungota
00050000-55f2-d7b2-7a80-706d05cc4add	2316	Zgornja Ložnica
00050000-55f2-d7b2-d070-4a46f33f7780	2314	Zgornja Polskava
00050000-55f2-d7b2-d747-1579c87ae5c6	2213	Zgornja Velka
00050000-55f2-d7b2-c141-431d469f8fb1	4247	Zgornje Gorje
00050000-55f2-d7b2-94f4-c020a12626f2	4206	Zgornje Jezersko
00050000-55f2-d7b2-4d6d-fbb451de3981	2285	Zgornji Leskovec
00050000-55f2-d7b2-1678-1f4c6b3733b5	1432	Zidani Most
00050000-55f2-d7b2-b449-29783df990fe	3214	Zreče
00050000-55f2-d7b2-f754-a28f2ddbebec	4209	Žabnica
00050000-55f2-d7b2-e987-142f27f05e12	3310	Žalec
00050000-55f2-d7b2-70ed-cd43a385e1dc	4228	Železniki
00050000-55f2-d7b2-0aa2-3a000f2543c9	2287	Žetale
00050000-55f2-d7b2-a062-09f68d57f7fe	4226	Žiri
00050000-55f2-d7b2-2075-4bc7f36f242e	4274	Žirovnica
00050000-55f2-d7b2-9cba-9c2e90a7bf40	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 18980218)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 18979850)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 18979660)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f2-d7b3-cdcf-d7f4f4228d6a	00080000-55f2-d7b3-a7d2-4c0b4c5b36f3	\N	00040000-55f2-d7b2-b6e9-c63b7c9f3453	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f2-d7b3-274a-057638c15582	00080000-55f2-d7b3-a7d2-4c0b4c5b36f3	\N	00040000-55f2-d7b2-b6e9-c63b7c9f3453	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f2-d7b3-4d9d-1f91e3d8bc7b	00080000-55f2-d7b3-c5dd-95c85f496288	\N	00040000-55f2-d7b2-b6e9-c63b7c9f3453	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 18979738)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 18979862)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 18980232)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 18980242)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f2-d7b3-d919-62f134e22169	00080000-55f2-d7b3-617f-57862b412b5f	0987	AK
00190000-55f2-d7b3-3554-c030314f80f8	00080000-55f2-d7b3-c5dd-95c85f496288	0989	AK
00190000-55f2-d7b3-cc05-e598bfab0e62	00080000-55f2-d7b3-e9f4-f52b0a938fba	0986	AK
00190000-55f2-d7b3-4c3b-b0749d389180	00080000-55f2-d7b3-2bae-ca2e7eb83d12	0984	AK
00190000-55f2-d7b3-1a9e-d630ef2f1c10	00080000-55f2-d7b3-104e-bfd353f7f945	0983	AK
00190000-55f2-d7b3-b7dd-d296a75adea2	00080000-55f2-d7b3-d775-dc6a00bde0d1	0982	AK
00190000-55f2-d7b4-d530-a751bf08f6b0	00080000-55f2-d7b4-3d5a-e020bc242a96	1001	AK
\.


--
-- TOC entry 2989 (class 0 OID 18980175)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f2-d7b3-0d63-f5d7f3e48294	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2993 (class 0 OID 18980250)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 18979891)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f2-d7b3-fee4-4e31d4f879c1	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f2-d7b3-8d92-97ffb7b5b1f8	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f2-d7b3-a6b0-d6281dc8122e	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f2-d7b3-cfc4-ec58e3cc3732	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f2-d7b3-5b8b-81878a3ac350	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f2-d7b3-f2df-cb81cb7eef6c	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f2-d7b3-73d7-dc260b0481e3	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2962 (class 0 OID 18979835)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 18979825)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 18980028)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 18979965)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 18979533)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f2-d7b4-3d5a-e020bc242a96	00010000-55f2-d7b2-fc63-046c8c35f067	2015-09-11 15:31:32	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f2-d7b4-2e3d-b49476b0d348	00010000-55f2-d7b2-fc63-046c8c35f067	2015-09-11 15:31:32	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f2-d7b4-d530-a751bf08f6b0	00010000-55f2-d7b2-fc63-046c8c35f067	2015-09-11 15:31:32	INS	a:0:{}
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2971 (class 0 OID 18979904)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 18979571)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f2-d7b2-9640-1e68f0a9bff4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f2-d7b2-0698-b637ff67cda1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f2-d7b2-62fc-3b74cd99372a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f2-d7b2-15fb-83fa298c12c0	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f2-d7b2-e63c-c146210ae7ed	planer	Planer dogodkov v koledarju	t
00020000-55f2-d7b2-4787-9c42c6d11f9a	kadrovska	Kadrovska služba	t
00020000-55f2-d7b2-1b2c-f0723fd73a52	arhivar	Ažuriranje arhivalij	t
00020000-55f2-d7b2-d957-3074431c21f0	igralec	Igralec	t
00020000-55f2-d7b2-e8e1-3757278d690d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f2-d7b3-2d01-4a2883151b74	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2938 (class 0 OID 18979555)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f2-d7b2-975e-01b0853848ee	00020000-55f2-d7b2-62fc-3b74cd99372a
00010000-55f2-d7b2-fc63-046c8c35f067	00020000-55f2-d7b2-62fc-3b74cd99372a
00010000-55f2-d7b3-fb66-6415a8aad916	00020000-55f2-d7b3-2d01-4a2883151b74
\.


--
-- TOC entry 2973 (class 0 OID 18979918)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 18979856)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 18979802)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 18979520)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f2-d7b2-ba05-3b169484bbfa	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f2-d7b2-1435-d5dcca28e4fd	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f2-d7b2-5d78-8123af71f06a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f2-d7b2-ee44-d257e94da66c	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f2-d7b2-5606-02308ced2867	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2933 (class 0 OID 18979512)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f2-d7b2-a03d-d755ff3a0dfa	00230000-55f2-d7b2-ee44-d257e94da66c	popa
00240000-55f2-d7b2-be9d-eb80623ebe77	00230000-55f2-d7b2-ee44-d257e94da66c	oseba
00240000-55f2-d7b2-bf7c-c2a550d55db5	00230000-55f2-d7b2-ee44-d257e94da66c	sezona
00240000-55f2-d7b2-092b-8ad5b1f90462	00230000-55f2-d7b2-1435-d5dcca28e4fd	prostor
00240000-55f2-d7b2-3e89-3a63efd4b287	00230000-55f2-d7b2-ee44-d257e94da66c	besedilo
00240000-55f2-d7b2-92a0-e37134ce352e	00230000-55f2-d7b2-ee44-d257e94da66c	uprizoritev
00240000-55f2-d7b2-4eac-7f629678d3a1	00230000-55f2-d7b2-ee44-d257e94da66c	funkcija
00240000-55f2-d7b2-5ec8-377b89e602ee	00230000-55f2-d7b2-ee44-d257e94da66c	tipfunkcije
00240000-55f2-d7b2-265a-1b4665acdc21	00230000-55f2-d7b2-ee44-d257e94da66c	alternacija
00240000-55f2-d7b2-87c4-560eae9df4e9	00230000-55f2-d7b2-ba05-3b169484bbfa	pogodba
00240000-55f2-d7b2-58bf-513dc4723a7e	00230000-55f2-d7b2-ee44-d257e94da66c	zaposlitev
00240000-55f2-d7b2-1fb0-d4a9df35bfe4	00230000-55f2-d7b2-ee44-d257e94da66c	zvrstuprizoritve
00240000-55f2-d7b2-a29c-a078abafbffd	00230000-55f2-d7b2-ba05-3b169484bbfa	programdela
00240000-55f2-d7b2-2fa5-6eee63a87d4f	00230000-55f2-d7b2-ee44-d257e94da66c	zapis
\.


--
-- TOC entry 2932 (class 0 OID 18979507)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
c04d9dd1-6d91-4e4a-90a9-aa7545742194	00240000-55f2-d7b2-a03d-d755ff3a0dfa	0	1001
\.


--
-- TOC entry 2978 (class 0 OID 18979975)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f2-d7b3-652a-964252145dcf	000e0000-55f2-d7b3-2605-d91a0b953172	00080000-55f2-d7b3-a7d2-4c0b4c5b36f3	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f2-d7b2-95df-c34f95452bc5
00270000-55f2-d7b3-be89-50f587dec4d0	000e0000-55f2-d7b3-2605-d91a0b953172	00080000-55f2-d7b3-a7d2-4c0b4c5b36f3	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f2-d7b2-95df-c34f95452bc5
\.


--
-- TOC entry 2945 (class 0 OID 18979633)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 18979812)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f2-d7b4-4686-1eec6be581c6	00180000-55f2-d7b3-9968-5181300a787f	000c0000-55f2-d7b3-683d-b91422a17a59	00090000-55f2-d7b3-7c49-24b832b808e9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f2-d7b4-31c6-192c04c4ad69	00180000-55f2-d7b3-9968-5181300a787f	000c0000-55f2-d7b3-5d7b-6df1d9ae2e6f	00090000-55f2-d7b3-a71c-def613a39c78	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f2-d7b4-2efd-1e8d365c505f	00180000-55f2-d7b3-9968-5181300a787f	000c0000-55f2-d7b3-2a67-586a9fdd1fe4	00090000-55f2-d7b3-db41-c778e18c41fe	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f2-d7b4-7651-0d5d48fbc542	00180000-55f2-d7b3-9968-5181300a787f	000c0000-55f2-d7b3-8a52-6de1c54d5075	00090000-55f2-d7b3-1f6b-039be04574b6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f2-d7b4-ddb1-4b7a514234a1	00180000-55f2-d7b3-9968-5181300a787f	000c0000-55f2-d7b3-d43e-c83283b8973f	00090000-55f2-d7b3-1319-2a6059c452d4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f2-d7b4-e31b-dbd0eb63eea2	00180000-55f2-d7b3-254d-5e4bbbd7fd49	\N	00090000-55f2-d7b3-1319-2a6059c452d4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2981 (class 0 OID 18980016)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f2-d7b2-1a6b-2cf31f390932	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f2-d7b2-1ecc-907ac9e7ee20	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f2-d7b2-0b37-945d98f8b5f4	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f2-d7b2-eb0e-8a5aa7b971f0	04	Režija	Režija	Režija	umetnik
000f0000-55f2-d7b2-cba9-979a25ea9aa9	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f2-d7b2-f4f6-9c4c78b72b45	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f2-d7b2-f079-9ab44bfc6445	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f2-d7b2-d243-d4df9fbf747b	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f2-d7b2-1d8e-b73cff3e3ba1	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f2-d7b2-bfda-fce23117186a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f2-d7b2-6b1f-5b670cac771e	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f2-d7b2-032d-ad5990ed847c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f2-d7b2-a3c2-7f831a9ce525	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f2-d7b2-7853-18b2446bab97	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f2-d7b2-bb48-a24fbc90ee88	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f2-d7b2-079a-fefb43aad93f	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f2-d7b2-e73b-9f1a5c021da7	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f2-d7b2-02cc-4d8f92523026	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2994 (class 0 OID 18980260)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f2-d7b2-df3c-c03861953f1a	01	Velika predstava	f	1.00	1.00
002b0000-55f2-d7b2-1ec6-8a00842ca36f	02	Mala predstava	f	0.50	0.50
002b0000-55f2-d7b2-ce8c-6c6e918b3492	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f2-d7b2-3d40-1c044fa20c2b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f2-d7b2-9947-3258c3ef45ef	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2950 (class 0 OID 18979695)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 18979542)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f2-d7b2-fc63-046c8c35f067	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROgovllGTVE8Ve1QZ0CVzTOwIQBMaIsxG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f2-d7b3-ca50-c98430d05fdf	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f2-d7b3-a240-b5e9d1a42882	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f2-d7b3-4ece-0fd6bb05b813	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f2-d7b3-89ea-51a31ab766d4	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f2-d7b3-20f7-a85ddd6c3d14	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f2-d7b3-4f93-66df3edeaa09	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f2-d7b3-2fe2-e722c714574d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f2-d7b3-00b4-0e56381eab68	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f2-d7b3-aef6-77d44aeaf4c6	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f2-d7b3-fb66-6415a8aad916	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f2-d7b2-975e-01b0853848ee	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2985 (class 0 OID 18980065)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f2-d7b3-bf00-4d7c8741654a	00160000-55f2-d7b3-9a4a-902e412bf766	\N	00140000-55f2-d7b2-d7af-545f51bd516a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f2-d7b3-5b8b-81878a3ac350
000e0000-55f2-d7b3-2605-d91a0b953172	00160000-55f2-d7b3-727d-692e241bc514	\N	00140000-55f2-d7b2-5f1b-4f3a6547280a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f2-d7b3-f2df-cb81cb7eef6c
000e0000-55f2-d7b3-dcb1-2575ff3dfdf4	\N	\N	00140000-55f2-d7b2-5f1b-4f3a6547280a	00190000-55f2-d7b3-d919-62f134e22169	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f2-d7b3-5b8b-81878a3ac350
000e0000-55f2-d7b3-76d9-981e9ec426a5	\N	\N	00140000-55f2-d7b2-5f1b-4f3a6547280a	00190000-55f2-d7b3-d919-62f134e22169	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f2-d7b3-5b8b-81878a3ac350
000e0000-55f2-d7b3-58d6-b6857ab0cb86	\N	\N	00140000-55f2-d7b2-5f1b-4f3a6547280a	00190000-55f2-d7b3-d919-62f134e22169	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f2-d7b3-fee4-4e31d4f879c1
000e0000-55f2-d7b3-e72e-40471eb8da78	\N	\N	00140000-55f2-d7b2-5f1b-4f3a6547280a	00190000-55f2-d7b3-d919-62f134e22169	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f2-d7b3-fee4-4e31d4f879c1
\.


--
-- TOC entry 2955 (class 0 OID 18979756)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f2-d7b3-bab3-415e989bc287	000e0000-55f2-d7b3-2605-d91a0b953172	\N	1	
00200000-55f2-d7b3-84f3-7f063743ba7e	000e0000-55f2-d7b3-2605-d91a0b953172	\N	2	
00200000-55f2-d7b3-a65c-52117a5d9460	000e0000-55f2-d7b3-2605-d91a0b953172	\N	3	
00200000-55f2-d7b3-0557-0876b69fa678	000e0000-55f2-d7b3-2605-d91a0b953172	\N	4	
00200000-55f2-d7b3-85c6-165b92b82dca	000e0000-55f2-d7b3-2605-d91a0b953172	\N	5	
\.


--
-- TOC entry 2969 (class 0 OID 18979883)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 18979989)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f2-d7b2-ecc7-71980775d9fb	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f2-d7b2-879c-ba7540d37455	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f2-d7b2-0a6a-034e57303655	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f2-d7b2-c468-70a00b74d011	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f2-d7b2-868c-d2faac341f73	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f2-d7b2-c8b7-fc5f7294a5fd	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f2-d7b2-633c-7782ca8a1e4e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f2-d7b2-d186-b05847351bff	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f2-d7b2-95df-c34f95452bc5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f2-d7b2-f0d6-632baa46a1be	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f2-d7b2-ad46-6cbb65433fbc	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f2-d7b2-d7ef-c6344cdd44ad	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f2-d7b2-984b-9ca92b96047b	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f2-d7b2-2308-bde374168789	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f2-d7b2-caf4-a348a8271965	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f2-d7b2-2a9e-59b6954741a1	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f2-d7b2-bc2d-2b7939b9cf6d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f2-d7b2-0e8c-969212a2d077	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f2-d7b2-c227-70037424d9bb	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f2-d7b2-7a2d-35d77c742dc6	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f2-d7b2-ab8a-a622726ce01f	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f2-d7b2-71dc-88fc72bde0b4	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f2-d7b2-b524-f187377f52d7	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f2-d7b2-e31e-8816a2c90553	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f2-d7b2-6024-742dd7590306	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f2-d7b2-3a0e-511eb49f1831	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f2-d7b2-95a3-160d86c86b69	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f2-d7b2-4eb1-bce056bbfdf3	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2997 (class 0 OID 18980306)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 18980278)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 18980318)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 18979955)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f2-d7b3-b45b-280f6e0fc282	00090000-55f2-d7b3-a71c-def613a39c78	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f2-d7b3-25bd-6e66cfb0b6f8	00090000-55f2-d7b3-db41-c778e18c41fe	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f2-d7b3-9c35-343ab901e3dc	00090000-55f2-d7b3-e010-a4ee451aa3b6	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f2-d7b3-4684-65e56f91b04d	00090000-55f2-d7b3-33b5-c1fc836c9dc3	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f2-d7b3-3ba8-7b4c151f74f0	00090000-55f2-d7b3-7c49-24b832b808e9	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f2-d7b3-5548-91eb7722e722	00090000-55f2-d7b3-8054-23aad56df96b	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2957 (class 0 OID 18979792)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 18980055)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f2-d7b2-d7af-545f51bd516a	01	Drama	drama (SURS 01)
00140000-55f2-d7b2-898f-85787b45e676	02	Opera	opera (SURS 02)
00140000-55f2-d7b2-02cf-d5336eb0e39e	03	Balet	balet (SURS 03)
00140000-55f2-d7b2-2a0d-1c6717df0e3a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f2-d7b2-e16e-f992dd8bcd1b	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f2-d7b2-5f1b-4f3a6547280a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f2-d7b2-7b34-13232af21193	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2975 (class 0 OID 18979945)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 18979596)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 18980114)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 18980104)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 18980014)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 18980358)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 18979781)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 18979801)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 18980276)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 18979721)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 18980169)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 18979941)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 18979754)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 18979735)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 18979848)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 18980335)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 18980342)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 18980366)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 18979875)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 18979693)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 18979605)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 18979629)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 18979585)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 18979570)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 18979881)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 18979917)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 18980050)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 18979657)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 18979681)
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
-- TOC entry 2679 (class 2606 OID 18980230)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 18979854)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 18979671)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 18979742)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 18979866)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 18980239)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 18980247)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 18980217)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 18980258)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 18979899)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 18979839)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 18979830)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 18980038)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 18979972)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 18979541)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 18979908)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 18979559)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 18979579)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 18979926)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 18979861)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 18979810)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 18979529)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 18979517)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 18979511)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 18979985)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 18979638)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 18979821)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 18980025)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 18980270)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 18979706)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 18979554)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 18980083)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 18979764)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 18979889)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 18979997)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 18980316)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 18980300)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 18980324)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 18979963)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 18979796)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 18980063)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 18979953)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 18979790)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 18979791)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 18979789)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 18979788)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 18979787)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2624 (class 1259 OID 18979986)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 18979987)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 18979988)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 18980337)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 18980336)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 18979659)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 18979882)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 18980304)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 18980303)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 18980305)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 18980302)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 18980301)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 18979868)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 18979867)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 18979765)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 18979942)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 18979944)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 18979943)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 18979737)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 18979736)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 18980259)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 18980052)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 18980053)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 18980054)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 18980325)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 18980088)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 18980085)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 18980089)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 18980087)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 18980086)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 18979708)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 18979707)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 18979632)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 18979909)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 18979586)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 18979587)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 18979929)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 18979928)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 18979927)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 18979743)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 18979744)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 18979519)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 18979834)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 18979832)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 18979831)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 18979833)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 18979560)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 18979561)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 18979890)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 18980359)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 18980367)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 18980368)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 18979855)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 18979973)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 18979974)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 18980174)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 18980173)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 18980170)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 18980171)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 18980172)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 18979673)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 18979672)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 18979674)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 18979903)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 18979902)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 18980240)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 18980241)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 18980118)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 18980119)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 18980116)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 18980117)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 18979964)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 18979843)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 18979842)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 18979840)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 18979841)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 18980106)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 18980105)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 18979755)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 18980231)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 18980277)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 18980343)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 18980344)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 18979607)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 18979606)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 18979639)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 18979640)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 18979824)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 18979823)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 18979822)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 18979783)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2545 (class 1259 OID 18979784)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2546 (class 1259 OID 18979782)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2547 (class 1259 OID 18979786)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2548 (class 1259 OID 18979785)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 18979658)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 18979722)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 18979724)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 18979723)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 18979725)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 18979849)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 18980051)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 18980084)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 18980026)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 18980027)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 18979630)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 18979631)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 18979954)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 18979530)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 18979694)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 18979518)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2597 (class 1259 OID 18979901)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 18979900)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 18980115)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 18979682)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 18980064)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 18980317)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 18980248)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 18980249)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 18980015)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 18979811)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 18979580)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 18980489)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 18980494)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 18980514)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 18980484)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 18980504)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 18980509)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 18980499)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2785 (class 2606 OID 18980664)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2784 (class 2606 OID 18980669)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2783 (class 2606 OID 18980674)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 18980839)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2818 (class 2606 OID 18980834)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 18980424)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 18980594)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2812 (class 2606 OID 18980819)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 18980814)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 18980824)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 18980809)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2815 (class 2606 OID 18980804)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2767 (class 2606 OID 18980589)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 18980584)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 18980479)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 18980634)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 18980644)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 18980639)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 18980459)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 18980454)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 18980574)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 18980794)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 18980679)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 18980684)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 18980689)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2816 (class 2606 OID 18980829)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2790 (class 2606 OID 18980709)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2793 (class 2606 OID 18980694)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2789 (class 2606 OID 18980714)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2791 (class 2606 OID 18980704)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2792 (class 2606 OID 18980699)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 18980449)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 18980444)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 18980409)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 18980404)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 18980614)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 18980384)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 18980389)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2774 (class 2606 OID 18980629)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 18980624)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 18980619)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 18980464)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 18980469)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 18980369)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2757 (class 2606 OID 18980549)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2759 (class 2606 OID 18980539)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2760 (class 2606 OID 18980534)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2758 (class 2606 OID 18980544)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 18980374)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 18980379)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 18980599)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2821 (class 2606 OID 18980854)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 18980859)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2822 (class 2606 OID 18980864)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 18980579)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2782 (class 2606 OID 18980654)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2781 (class 2606 OID 18980659)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 18980769)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 18980764)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 18980749)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 18980754)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2802 (class 2606 OID 18980759)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 18980434)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 18980429)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 18980439)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 18980609)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2772 (class 2606 OID 18980604)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2807 (class 2606 OID 18980779)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2806 (class 2606 OID 18980784)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2797 (class 2606 OID 18980739)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 18980744)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2799 (class 2606 OID 18980729)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2798 (class 2606 OID 18980734)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 18980649)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 18980569)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2762 (class 2606 OID 18980564)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 18980554)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2763 (class 2606 OID 18980559)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 18980724)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2795 (class 2606 OID 18980719)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 18980474)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 18980774)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2808 (class 2606 OID 18980789)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 18980799)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 18980844)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 18980849)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 18980399)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 18980394)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 18980414)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 18980419)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 18980529)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 18980524)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 18980519)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-11 15:31:33 CEST

--
-- PostgreSQL database dump complete
--

