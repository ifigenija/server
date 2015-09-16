--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-16 09:48:37 CEST

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
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 242
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 19829396)
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
-- TOC entry 226 (class 1259 OID 19829918)
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
-- TOC entry 225 (class 1259 OID 19829901)
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
-- TOC entry 219 (class 1259 OID 19829809)
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
-- TOC entry 240 (class 1259 OID 19830157)
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
-- TOC entry 195 (class 1259 OID 19829577)
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
-- TOC entry 197 (class 1259 OID 19829608)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19830083)
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
-- TOC entry 190 (class 1259 OID 19829517)
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
-- TOC entry 227 (class 1259 OID 19829931)
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
-- TOC entry 213 (class 1259 OID 19829741)
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
-- TOC entry 193 (class 1259 OID 19829556)
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
-- TOC entry 191 (class 1259 OID 19829534)
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
-- TOC entry 202 (class 1259 OID 19829655)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19830138)
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
-- TOC entry 239 (class 1259 OID 19830150)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19830172)
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
-- TOC entry 206 (class 1259 OID 19829680)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19829491)
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
-- TOC entry 182 (class 1259 OID 19829405)
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
-- TOC entry 183 (class 1259 OID 19829416)
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
-- TOC entry 178 (class 1259 OID 19829370)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19829389)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19829687)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19829721)
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
-- TOC entry 222 (class 1259 OID 19829850)
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
-- TOC entry 185 (class 1259 OID 19829449)
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
-- TOC entry 187 (class 1259 OID 19829483)
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
-- TOC entry 229 (class 1259 OID 19830029)
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
-- TOC entry 203 (class 1259 OID 19829661)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19829468)
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
-- TOC entry 192 (class 1259 OID 19829546)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 19829673)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19830043)
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
-- TOC entry 231 (class 1259 OID 19830053)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19829986)
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
-- TOC entry 232 (class 1259 OID 19830061)
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
-- TOC entry 209 (class 1259 OID 19829702)
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
-- TOC entry 201 (class 1259 OID 19829646)
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
-- TOC entry 200 (class 1259 OID 19829636)
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
-- TOC entry 221 (class 1259 OID 19829839)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19829776)
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
-- TOC entry 175 (class 1259 OID 19829341)
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
-- TOC entry 174 (class 1259 OID 19829339)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 19829715)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19829379)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19829363)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19829729)
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
-- TOC entry 204 (class 1259 OID 19829667)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19829613)
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
-- TOC entry 173 (class 1259 OID 19829328)
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
-- TOC entry 172 (class 1259 OID 19829320)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19829315)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19829786)
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
-- TOC entry 184 (class 1259 OID 19829441)
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
-- TOC entry 199 (class 1259 OID 19829623)
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
-- TOC entry 220 (class 1259 OID 19829827)
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
-- TOC entry 233 (class 1259 OID 19830071)
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
-- TOC entry 189 (class 1259 OID 19829503)
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
-- TOC entry 176 (class 1259 OID 19829350)
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
-- TOC entry 224 (class 1259 OID 19829876)
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
-- TOC entry 194 (class 1259 OID 19829567)
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
-- TOC entry 208 (class 1259 OID 19829694)
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
-- TOC entry 218 (class 1259 OID 19829800)
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
-- TOC entry 236 (class 1259 OID 19830118)
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
-- TOC entry 235 (class 1259 OID 19830090)
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
-- TOC entry 237 (class 1259 OID 19830130)
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
-- TOC entry 215 (class 1259 OID 19829766)
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
-- TOC entry 196 (class 1259 OID 19829603)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19829866)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19829756)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2195 (class 2604 OID 19829344)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2944 (class 0 OID 19829396)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 19829918)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f9-1ed4-157a-9108406a5e29	000d0000-55f9-1ed4-513f-889eb7230aca	\N	00090000-55f9-1ed4-17f2-c5b2324bcb60	000b0000-55f9-1ed4-c17b-50c38286c0b2	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f9-1ed4-0dfa-e40cae8bd6a9	000d0000-55f9-1ed4-bdb2-42e33a6084d2	00100000-55f9-1ed4-ecd0-71662a9351fa	00090000-55f9-1ed4-de8a-99f9927d61a6	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f9-1ed4-522b-30e4c45aba1e	000d0000-55f9-1ed4-d6e0-7e8442e13173	00100000-55f9-1ed4-8617-f36c404731b9	00090000-55f9-1ed4-77b5-542503dea75a	\N	0003	t	\N	2015-09-16	\N	2	t	\N	f	f
000c0000-55f9-1ed4-6edf-90529b901d29	000d0000-55f9-1ed4-03a7-1750268426c3	\N	00090000-55f9-1ed4-c6af-de9edaf57f80	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f9-1ed4-c268-175643e7de17	000d0000-55f9-1ed4-0bb1-96fd1cf63a40	\N	00090000-55f9-1ed4-1ff5-5e9d95197aaa	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f9-1ed4-3240-21d7794418c7	000d0000-55f9-1ed4-062c-ed91ee461f4a	\N	00090000-55f9-1ed4-6660-3f6eb049d2ca	000b0000-55f9-1ed4-45a6-be3dd6d32663	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f9-1ed4-7dd6-89516e2e9022	000d0000-55f9-1ed4-4dc0-93cb2f4e7a5d	00100000-55f9-1ed4-0d51-4cec9878a733	00090000-55f9-1ed4-c4cd-c99d88c3d670	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f9-1ed4-4579-59c4d94f7e16	000d0000-55f9-1ed4-ac3f-a57d3f48a2af	\N	00090000-55f9-1ed4-db86-b8a6c3380ada	000b0000-55f9-1ed4-78d3-21597141e379	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f9-1ed4-e3f7-34a56d24c6aa	000d0000-55f9-1ed4-4dc0-93cb2f4e7a5d	00100000-55f9-1ed4-f341-1130dd64e7cb	00090000-55f9-1ed4-7ae3-68ffe321be80	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f9-1ed4-3dbf-696ab7a17279	000d0000-55f9-1ed4-4dc0-93cb2f4e7a5d	00100000-55f9-1ed4-4167-32dfcfbb3124	00090000-55f9-1ed4-c1d9-3ce541f68c06	\N	0010	t	\N	2015-09-16	\N	16	f	\N	f	t
000c0000-55f9-1ed4-5930-a11082f1c2a2	000d0000-55f9-1ed4-4dc0-93cb2f4e7a5d	00100000-55f9-1ed4-1b33-5b2d0d960e4d	00090000-55f9-1ed4-c525-8aaecb4b95fe	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f9-1ed4-5da1-592d541c29eb	000d0000-55f9-1ed4-c60d-8138fac2b284	\N	00090000-55f9-1ed4-de8a-99f9927d61a6	000b0000-55f9-1ed4-ba92-ff6923eece13	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2988 (class 0 OID 19829901)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19829809)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f9-1ed3-d274-84173e0ad7ba	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f9-1ed3-396b-00cbbb961526	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f9-1ed3-bf7e-06c181f4974f	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3003 (class 0 OID 19830157)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 19829577)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f9-1ed4-daed-d3ccab5ac244	\N	\N	00200000-55f9-1ed4-7ce4-669cb41eea12	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f9-1ed4-28d1-2b0ee321939d	\N	\N	00200000-55f9-1ed4-71be-b7000ba97975	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f9-1ed4-77e7-2435a7dcdd38	\N	\N	00200000-55f9-1ed4-4308-e60f22510bc1	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f9-1ed4-eedc-693a1f25e120	\N	\N	00200000-55f9-1ed4-3c02-2d428be67f7b	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f9-1ed4-220e-3d84bef7ad03	\N	\N	00200000-55f9-1ed4-895a-1bfbb9d30a3a	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2960 (class 0 OID 19829608)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 19830083)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 19829517)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f9-1ed2-1cf5-18992f4e9b15	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f9-1ed2-23c5-1be4cdd47b2c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f9-1ed2-60de-3413ba3ccb35	AL	ALB	008	Albania 	Albanija	\N
00040000-55f9-1ed2-4ea9-54d76d7eef7d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f9-1ed2-118c-e30a013779a4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f9-1ed2-c35f-eb6c54024e85	AD	AND	020	Andorra 	Andora	\N
00040000-55f9-1ed2-8736-25185c94358f	AO	AGO	024	Angola 	Angola	\N
00040000-55f9-1ed2-2028-7f92831f3810	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f9-1ed2-af68-17db0adc21c0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f9-1ed2-871c-62346645a5b0	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f9-1ed2-1aba-54854d823513	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f9-1ed2-1cc1-1ef1e9281ec6	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f9-1ed2-8a19-267f0224e582	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f9-1ed2-bd66-3b34e3ddda81	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f9-1ed2-3d32-a199deb716f8	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f9-1ed2-9a36-5f0393d93cc0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f9-1ed2-1413-ed07ed51d70c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f9-1ed2-9d88-40289802ceb2	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f9-1ed2-5153-a25677dd2e4c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f9-1ed2-d1e9-c28ce9d5d6a6	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f9-1ed2-dffa-c02ce0894f21	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f9-1ed2-b144-abe58dea9749	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f9-1ed2-af10-d221ae94a79f	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f9-1ed2-3bcf-4ce5f4fcb904	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f9-1ed2-04fd-7c0eb9589c59	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f9-1ed2-ff73-dc6380607ea7	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f9-1ed2-1e46-0e31b91046a5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f9-1ed2-009f-0d328ff620cf	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f9-1ed2-ae94-d651d9c61a47	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f9-1ed2-b0e7-4c1b83397e82	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f9-1ed2-4b04-6cf8d24a022c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f9-1ed2-fea3-0c5a117c1cfb	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f9-1ed2-796e-cede8b98c715	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f9-1ed2-15bc-8c6dcd874e67	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f9-1ed2-01e1-f67bdecdfb13	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f9-1ed2-8408-10c8bd661635	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f9-1ed2-0039-4d2682445158	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f9-1ed2-8241-b30465f7f6f3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f9-1ed2-417b-4e584bdf80f9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f9-1ed2-ea5a-fbd1ae948463	CA	CAN	124	Canada 	Kanada	\N
00040000-55f9-1ed2-6176-95f9ad9cc3b2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f9-1ed2-0bc3-fa82b6204135	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f9-1ed2-af33-2d8e1ae3e2c0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f9-1ed2-9255-ebcb02eec0d2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f9-1ed2-0693-d20e0fc35c66	CL	CHL	152	Chile 	Čile	\N
00040000-55f9-1ed2-65a3-f0361c0a1521	CN	CHN	156	China 	Kitajska	\N
00040000-55f9-1ed2-987f-609ba780ec82	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f9-1ed2-92cd-6cb81e772f2b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f9-1ed2-a91d-89e2de93830e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f9-1ed2-3bec-aa7480b4459f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f9-1ed2-f211-a23ad45c7715	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f9-1ed2-b533-b9fb029a9117	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f9-1ed2-9fc3-54e87ae730f2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f9-1ed2-afdd-3d22b06593a1	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f9-1ed2-211a-ceaa8a6def11	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f9-1ed2-d4d3-2506e491d12e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f9-1ed2-f339-8fc431639e85	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f9-1ed2-6c0e-a2c8ace46155	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f9-1ed2-62f3-0092acae4d3d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f9-1ed2-4b3a-4983bd7f59de	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f9-1ed2-56b7-8482cc15aa85	DK	DNK	208	Denmark 	Danska	\N
00040000-55f9-1ed2-1cf1-1f1dc96a121d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f9-1ed2-973a-a8ecd3f2c0f9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f9-1ed2-6a39-8d0dd044d928	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f9-1ed2-1b78-7b63fa7d7170	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f9-1ed2-ace5-5e49ba4e1de0	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f9-1ed2-f158-50c53b32bdf1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f9-1ed2-0c56-7c0e16d5cd2e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f9-1ed2-166d-ddabb3aa9f55	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f9-1ed2-97c6-b3b9a8dfa9c8	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f9-1ed2-345c-dd6188a76c39	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f9-1ed2-05b5-e07b83d35553	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f9-1ed2-6562-a05d77b9da33	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f9-1ed2-7355-82fa26a28f33	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f9-1ed2-4932-e5d34513ccd5	FI	FIN	246	Finland 	Finska	\N
00040000-55f9-1ed2-5d28-cb4133839d87	FR	FRA	250	France 	Francija	\N
00040000-55f9-1ed2-cf1c-39f7450bc3e1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f9-1ed2-fbc8-ebeffacdbd1c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f9-1ed2-becb-51fbcf918fbe	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f9-1ed2-7490-870a5bcd6dba	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f9-1ed2-5150-8a3994a3d7e7	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f9-1ed2-4a2b-f3dc10c23caf	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f9-1ed2-0814-bdf476f432eb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f9-1ed2-d34f-be9a6b6c2701	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f9-1ed2-91f8-9da7f9e24406	GH	GHA	288	Ghana 	Gana	\N
00040000-55f9-1ed2-798c-d01a5aca706e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f9-1ed2-f23b-616ada634c7b	GR	GRC	300	Greece 	Grčija	\N
00040000-55f9-1ed2-3716-af66e6597c2b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f9-1ed2-bd81-62ca18d478a4	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f9-1ed2-5c94-f6a374c5c30b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f9-1ed2-04c0-d35a898516aa	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f9-1ed2-eb43-90fe92bd126e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f9-1ed2-2e9c-83be0d238958	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f9-1ed2-d19e-19f24e995736	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f9-1ed2-d37f-559a4c5c094f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f9-1ed2-6706-8f8ca0bcea9e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f9-1ed2-4c32-6cfa5376cf8c	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f9-1ed2-0eea-379733474e5c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f9-1ed2-ac17-552e47813b72	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f9-1ed2-5c37-e6772bea1339	HN	HND	340	Honduras 	Honduras	\N
00040000-55f9-1ed2-3b10-93abda9b5950	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f9-1ed2-4600-389ef00d32df	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f9-1ed2-c964-18a141974006	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f9-1ed2-90df-e993307ef6ea	IN	IND	356	India 	Indija	\N
00040000-55f9-1ed2-b8a1-1ba19a40c91c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f9-1ed2-6144-2766bc11a156	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f9-1ed2-10b6-d669087583b9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f9-1ed2-0dc6-7fc0af3166e4	IE	IRL	372	Ireland 	Irska	\N
00040000-55f9-1ed2-47a3-8fc3d73459d1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f9-1ed2-5809-94a74dca6f89	IL	ISR	376	Israel 	Izrael	\N
00040000-55f9-1ed2-9bea-d8b3438faa0b	IT	ITA	380	Italy 	Italija	\N
00040000-55f9-1ed2-7ceb-6ce141f4e2c4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f9-1ed2-eb76-4c978888169a	JP	JPN	392	Japan 	Japonska	\N
00040000-55f9-1ed2-43ac-413e8e54d6ee	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f9-1ed2-1352-daa65b91c102	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f9-1ed2-027a-dc4ff74dcc10	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f9-1ed2-f745-a1067bac49f8	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f9-1ed2-4fd1-71cc3efd3fac	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f9-1ed2-1103-8cdbd370e7d0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f9-1ed2-35d7-a11165240756	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f9-1ed2-8c43-e7e8ade83dad	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f9-1ed2-3cff-70429ebd96c6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f9-1ed2-0047-5a50edaebf4e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f9-1ed2-73a0-505ffc5a070d	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f9-1ed2-8132-689d194295e0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f9-1ed2-0f4b-a74a6ffdcadd	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f9-1ed2-ce72-b58c9a889fd8	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f9-1ed2-27e5-02ac085d83ed	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f9-1ed2-a1eb-d570000ee701	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f9-1ed2-1c0b-f7b12613e75c	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f9-1ed2-482d-29076c9fe204	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f9-1ed2-3da4-40e70f48cbb8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f9-1ed2-2b94-b93b434d0ca2	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f9-1ed2-f884-688acee6c434	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f9-1ed2-7a4a-e1ab0d9d7cf0	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f9-1ed2-c49f-3b4264b5d2b7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f9-1ed2-ba77-39ac0b7d6611	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f9-1ed2-2091-fa0130a0d113	ML	MLI	466	Mali 	Mali	\N
00040000-55f9-1ed2-42cc-94c3fdee8601	MT	MLT	470	Malta 	Malta	\N
00040000-55f9-1ed2-dd1b-7c17182e1dae	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f9-1ed2-be85-8fdcd4aca442	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f9-1ed2-66f2-b1705192f39d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f9-1ed2-fdee-b82a24bcffcb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f9-1ed2-dbf3-66f2f1d4b960	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f9-1ed2-3754-d3086653a857	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f9-1ed2-b886-572330a8c0de	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f9-1ed2-976c-e8bf1949a0e8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f9-1ed2-4b42-01ab9c7198d0	MC	MCO	492	Monaco 	Monako	\N
00040000-55f9-1ed2-25b5-eec0a10d3188	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f9-1ed2-7789-b3e35f3a1c85	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f9-1ed2-82c8-b8c280bac3c6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f9-1ed2-9c22-2afbab0ebb49	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f9-1ed2-3d6a-91506cdf2e23	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f9-1ed2-bbfe-4ff2ac9219d1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f9-1ed2-31a9-0ac02f4304a8	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f9-1ed2-232b-d251ddb72867	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f9-1ed2-b907-48560d82acff	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f9-1ed2-3a48-a99a988441cb	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f9-1ed2-e825-84c2197a2cc6	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f9-1ed2-772e-28673e707218	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f9-1ed2-b74f-6d062dcfdc8f	NE	NER	562	Niger 	Niger 	\N
00040000-55f9-1ed2-64b9-59003b1dd8a3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f9-1ed2-f9de-1666bc6457ee	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f9-1ed2-9033-67b24c1dfe92	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f9-1ed2-af3d-fe4cb1cd7262	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f9-1ed2-e419-355844192b26	NO	NOR	578	Norway 	Norveška	\N
00040000-55f9-1ed2-f64d-38b9d744ff6c	OM	OMN	512	Oman 	Oman	\N
00040000-55f9-1ed2-6ea5-f32424fe8f60	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f9-1ed2-4b8a-e8a91da759e0	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f9-1ed2-455f-1fd9be106ec5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f9-1ed2-6a1a-8815bbe0c05a	PA	PAN	591	Panama 	Panama	\N
00040000-55f9-1ed2-48a2-d2e1032f94c7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f9-1ed2-33dd-81d260459225	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f9-1ed2-827f-4860c395cd7d	PE	PER	604	Peru 	Peru	\N
00040000-55f9-1ed2-2abb-06290c369477	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f9-1ed2-80cb-c137265f7856	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f9-1ed2-c55c-ba09af82b023	PL	POL	616	Poland 	Poljska	\N
00040000-55f9-1ed2-5389-28be3582ae61	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f9-1ed2-3fb4-f3974e7bc62f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f9-1ed2-94dd-889f85f66ff6	QA	QAT	634	Qatar 	Katar	\N
00040000-55f9-1ed2-d399-c3451f4a31ac	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f9-1ed2-63b6-73f38f79e8bc	RO	ROU	642	Romania 	Romunija	\N
00040000-55f9-1ed2-f39e-87c8960c21a0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f9-1ed2-71b9-290c3ad3106b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f9-1ed2-7771-2721c22d3c9d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f9-1ed2-d364-c444bb8a30ba	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f9-1ed2-3548-f69ada5bbd30	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f9-1ed2-943b-fac1edec65a3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f9-1ed2-3b17-16463cbee03f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f9-1ed2-816e-5b11376f6815	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f9-1ed2-1359-8e074d68db46	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f9-1ed2-09ec-b00d02aca36c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f9-1ed2-a51a-68428230eb72	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f9-1ed2-4a94-10d0b5971896	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f9-1ed2-065d-4f992ac5333a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f9-1ed2-4e74-c7548205cdbb	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f9-1ed2-ef1a-be204997af3b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f9-1ed2-bdc8-8e76d39e62b6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f9-1ed2-23ab-620fc2668cf4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f9-1ed2-e973-de8090e0e89a	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f9-1ed2-3972-3339ee435991	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f9-1ed2-3f20-3f802ef9c5ed	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f9-1ed2-dfa3-6f4056fff910	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f9-1ed2-bd9e-c2b9a3e2f4ae	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f9-1ed2-34dc-50b24ec0799a	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f9-1ed2-741c-611d573d8f9d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f9-1ed2-0459-67f570f51cbf	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f9-1ed2-f562-0aaf13070ad7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f9-1ed2-4071-7659fa41bba9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f9-1ed2-59c7-3e4ac63a9ee0	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f9-1ed2-b24e-d8c7d4a6a2ee	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f9-1ed2-a4f7-4923aba6fcfa	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f9-1ed2-ff58-793bec956631	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f9-1ed2-1371-3ec5776b601b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f9-1ed2-4b44-56bfa8cf65fa	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f9-1ed2-20a9-f60700175f32	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f9-1ed2-78bf-dafe829cdbeb	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f9-1ed2-cc9e-015d5f15a7bc	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f9-1ed2-02e7-8b59aaeb7c6c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f9-1ed2-0655-bd92e02ac6d1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f9-1ed2-3083-4a34f1a85573	TH	THA	764	Thailand 	Tajska	\N
00040000-55f9-1ed2-2ab8-acd88eb54518	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f9-1ed2-6cff-902f9530b338	TG	TGO	768	Togo 	Togo	\N
00040000-55f9-1ed2-d903-763a6648eba3	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f9-1ed2-4b72-8c894f14bbaa	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f9-1ed2-6555-0c83dbf8ea3c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f9-1ed2-fd1a-d71e376feee6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f9-1ed2-4b18-20b580d7f978	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f9-1ed2-61d3-3623e348c587	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f9-1ed2-5311-2f7124012815	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f9-1ed2-15d5-69cb3826bac6	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f9-1ed2-d9e7-2c6707b6a77d	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f9-1ed2-30a4-424603f9ca8e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f9-1ed2-0edc-15d8d33898d2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f9-1ed2-82a2-684182a469aa	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f9-1ed2-ee38-82f3b5a4df9a	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f9-1ed2-9769-4fac1f9e62fb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f9-1ed2-e8c3-5e77f6216a43	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f9-1ed2-3e32-748e25203a55	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f9-1ed2-376b-1581d62fbff1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f9-1ed2-a71d-a5bf1da25d64	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f9-1ed2-6009-9f3b9d3a2ba7	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f9-1ed2-50bf-6acd5b725ac0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f9-1ed2-236a-105c96860dd3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f9-1ed2-2bbd-d8285c147845	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f9-1ed2-9b6e-e2cbd576c580	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f9-1ed2-235b-d9bde5b15860	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f9-1ed2-5d3c-e3e81caf3e84	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f9-1ed2-7e3f-517d68085f86	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2990 (class 0 OID 19829931)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f9-1ed4-b9a0-a74bd25663e7	000e0000-55f9-1ed4-e215-e36ad4e5e63b	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f9-1ed2-f449-54010bdda15e	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f9-1ed4-0d4f-544302131e20	000e0000-55f9-1ed4-afba-6892ce15be5e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f9-1ed2-ad01-8da76f17abf4	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f9-1ed4-07c2-a966db361403	000e0000-55f9-1ed4-945c-19118fca3fd7	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f9-1ed2-f449-54010bdda15e	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f9-1ed4-7d33-0815ca96c201	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f9-1ed4-fd04-bcd6bd0a9fe0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2976 (class 0 OID 19829741)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f9-1ed4-513f-889eb7230aca	000e0000-55f9-1ed4-afba-6892ce15be5e	000c0000-55f9-1ed4-157a-9108406a5e29	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f9-1ed2-5295-4abaa274f9ca
000d0000-55f9-1ed4-bdb2-42e33a6084d2	000e0000-55f9-1ed4-afba-6892ce15be5e	000c0000-55f9-1ed4-0dfa-e40cae8bd6a9	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f9-1ed2-e2e4-9cbb9211c023
000d0000-55f9-1ed4-d6e0-7e8442e13173	000e0000-55f9-1ed4-afba-6892ce15be5e	000c0000-55f9-1ed4-522b-30e4c45aba1e	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f9-1ed2-e191-061657009289
000d0000-55f9-1ed4-03a7-1750268426c3	000e0000-55f9-1ed4-afba-6892ce15be5e	000c0000-55f9-1ed4-6edf-90529b901d29	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f9-1ed2-3f31-221e84a21c3e
000d0000-55f9-1ed4-0bb1-96fd1cf63a40	000e0000-55f9-1ed4-afba-6892ce15be5e	000c0000-55f9-1ed4-c268-175643e7de17	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f9-1ed2-3f31-221e84a21c3e
000d0000-55f9-1ed4-062c-ed91ee461f4a	000e0000-55f9-1ed4-afba-6892ce15be5e	000c0000-55f9-1ed4-3240-21d7794418c7	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f9-1ed2-5295-4abaa274f9ca
000d0000-55f9-1ed4-4dc0-93cb2f4e7a5d	000e0000-55f9-1ed4-afba-6892ce15be5e	000c0000-55f9-1ed4-e3f7-34a56d24c6aa	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f9-1ed2-5295-4abaa274f9ca
000d0000-55f9-1ed4-ac3f-a57d3f48a2af	000e0000-55f9-1ed4-afba-6892ce15be5e	000c0000-55f9-1ed4-4579-59c4d94f7e16	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f9-1ed2-d76c-2c1b508aca8f
000d0000-55f9-1ed4-c60d-8138fac2b284	000e0000-55f9-1ed4-afba-6892ce15be5e	000c0000-55f9-1ed4-5da1-592d541c29eb	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f9-1ed2-8449-0575d41d65a0
\.


--
-- TOC entry 2956 (class 0 OID 19829556)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 19829534)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f9-1ed4-d684-e7ef3b7c223b	00080000-55f9-1ed3-0059-0edeb2f7df1a	00090000-55f9-1ed4-c1d9-3ce541f68c06	AK		igralka
\.


--
-- TOC entry 2965 (class 0 OID 19829655)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 19830138)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 19830150)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 19830172)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 19829680)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19829491)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f9-1ed3-1994-41fa0a8f4c25	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f9-1ed3-a286-91c77a36d69e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f9-1ed3-b76c-ed25e71e21df	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f9-1ed3-f50d-aae459f308f2	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f9-1ed3-adf5-3829bf737d9d	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f9-1ed3-9c67-12fc72b7f68f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f9-1ed3-447a-8b436f1cec87	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f9-1ed3-aa12-5bf8f6524e59	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f9-1ed3-8d68-8b608bb9970b	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f9-1ed3-9f90-18a56c8aef9d	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f9-1ed3-b5c0-2e1dcd59518d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f9-1ed3-cd48-9e1f99e72622	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f9-1ed3-5aff-e00ac14d4d70	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f9-1ed3-ec55-0cbac5c6e5b0	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f9-1ed3-1bc4-1b3ba469ff61	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f9-1ed3-a1cf-0d55ab031da9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f9-1ed3-0a99-f809dd0c4705	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f9-1ed3-afd6-3a3ed01717cf	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f9-1ed3-db1b-c23ad52d9d65	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f9-1ed5-1b20-f1b32e70f7da	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2945 (class 0 OID 19829405)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f9-1ed3-6ee1-559a1342bde7	00000000-55f9-1ed3-1bc4-1b3ba469ff61	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f9-1ed3-3820-6890bddebf56	00000000-55f9-1ed3-1bc4-1b3ba469ff61	00010000-55f9-1ed3-2d6f-14e7d5e9dcdf	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f9-1ed3-5737-eec0c07c039d	00000000-55f9-1ed3-a1cf-0d55ab031da9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2946 (class 0 OID 19829416)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f9-1ed4-17f2-c5b2324bcb60	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f9-1ed4-c6af-de9edaf57f80	00010000-55f9-1ed3-cf4e-3bafa342eed0	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f9-1ed4-77b5-542503dea75a	00010000-55f9-1ed3-76f5-c29958ba5a88	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f9-1ed4-7ae3-68ffe321be80	00010000-55f9-1ed4-1af3-63bdbb7311dd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f9-1ed4-d5ef-063aa3676932	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f9-1ed4-6660-3f6eb049d2ca	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f9-1ed4-c525-8aaecb4b95fe	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f9-1ed4-c4cd-c99d88c3d670	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f9-1ed4-c1d9-3ce541f68c06	00010000-55f9-1ed3-15f7-57b5cfb0c3c7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f9-1ed4-de8a-99f9927d61a6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f9-1ed4-45ea-188c53e8c545	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f9-1ed4-1ff5-5e9d95197aaa	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f9-1ed4-db86-b8a6c3380ada	00010000-55f9-1ed4-839a-e8656db8ce7d	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 19829370)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f9-1ed2-959c-39f1799a4c18	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f9-1ed2-3a3d-7bf9052aa223	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f9-1ed2-fdfd-5c37b31f3750	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f9-1ed2-fc52-ca3a95fa98a3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f9-1ed2-af84-96c718276ca5	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f9-1ed2-f5c7-65c31374c775	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f9-1ed2-36c9-61f9865f3735	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f9-1ed2-6673-427d8f59634c	Abonma-read	Abonma - branje	f
00030000-55f9-1ed2-ad55-90e5fcb6d576	Abonma-write	Abonma - spreminjanje	f
00030000-55f9-1ed2-1b30-ec8d756a26eb	Alternacija-read	Alternacija - branje	f
00030000-55f9-1ed2-c25f-b2fb33f5a103	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f9-1ed2-f347-9521c8e12a01	Arhivalija-read	Arhivalija - branje	f
00030000-55f9-1ed2-1c13-ab0a30ed995d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f9-1ed2-f1dc-deebe7b7fe42	Besedilo-read	Besedilo - branje	f
00030000-55f9-1ed2-d172-3669ae1d3745	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f9-1ed2-89d8-918c9bbbd8b3	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f9-1ed2-da75-b78d8eac3238	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f9-1ed2-1b3b-dd9787f0f759	Dogodek-read	Dogodek - branje	f
00030000-55f9-1ed2-0ddd-699056df6c1f	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f9-1ed2-8d1a-45dd36de7400	DrugiVir-read	DrugiVir - branje	f
00030000-55f9-1ed2-d03b-d401d9ce0db6	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f9-1ed2-5d35-78f2d08b881c	Drzava-read	Drzava - branje	f
00030000-55f9-1ed2-4331-06bf50a5a46d	Drzava-write	Drzava - spreminjanje	f
00030000-55f9-1ed2-79b8-ba34811b8f21	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f9-1ed2-8ede-4a2a0d59d961	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f9-1ed2-ee28-5cfac1929662	Funkcija-read	Funkcija - branje	f
00030000-55f9-1ed2-f762-a22c7e2a3500	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f9-1ed2-23cb-bd16d9348721	Gostovanje-read	Gostovanje - branje	f
00030000-55f9-1ed2-1a5a-39f1132b6478	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f9-1ed2-ba52-a6f56a68b4ea	Gostujoca-read	Gostujoca - branje	f
00030000-55f9-1ed2-c687-3eb1535f3231	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f9-1ed2-bfcd-09563cac3904	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f9-1ed2-1528-aaf9e8b410d3	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f9-1ed2-8ad6-7f506b3c8df9	Kupec-read	Kupec - branje	f
00030000-55f9-1ed2-a1e7-7001b3eb6ff3	Kupec-write	Kupec - spreminjanje	f
00030000-55f9-1ed2-7594-41668e03efe4	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f9-1ed2-3a70-d98717bead3f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f9-1ed2-e00c-404cdbe00373	Option-read	Option - branje	f
00030000-55f9-1ed2-66d3-e92226959107	Option-write	Option - spreminjanje	f
00030000-55f9-1ed2-a1bc-b3bc9c388a18	OptionValue-read	OptionValue - branje	f
00030000-55f9-1ed2-6224-01c0eec3a787	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f9-1ed2-8710-62bdf789eabb	Oseba-read	Oseba - branje	f
00030000-55f9-1ed2-9a06-17f25879241f	Oseba-write	Oseba - spreminjanje	f
00030000-55f9-1ed2-257d-9dea47ce712b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f9-1ed2-1c2a-a79102ffac4f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f9-1ed2-9038-9b3d239330dc	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f9-1ed2-c564-b550dad7872e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f9-1ed2-0a54-b0fc2abb212f	Pogodba-read	Pogodba - branje	f
00030000-55f9-1ed2-d38d-7b7a577ae5d4	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f9-1ed2-7c39-64bdd773e25c	Popa-read	Popa - branje	f
00030000-55f9-1ed2-3d93-0e7a06d26bb9	Popa-write	Popa - spreminjanje	f
00030000-55f9-1ed2-5026-c4709b5e65ca	Posta-read	Posta - branje	f
00030000-55f9-1ed2-d5fa-60cfe9f4a25b	Posta-write	Posta - spreminjanje	f
00030000-55f9-1ed2-6ab0-c6417bd88868	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f9-1ed2-851b-2a4f41438742	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f9-1ed2-1701-a07f6f194fac	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f9-1ed2-e425-819796f89f91	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f9-1ed2-5cc5-b2c1b21acf7b	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f9-1ed2-31d6-191163c6b924	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f9-1ed2-772c-5395e5a7b82c	Predstava-read	Predstava - branje	f
00030000-55f9-1ed2-43c0-238e1f50d3b3	Predstava-write	Predstava - spreminjanje	f
00030000-55f9-1ed2-f3d4-198a631a5ea5	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f9-1ed2-2666-9c8f0491dc63	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f9-1ed2-c448-e17382b855d7	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f9-1ed2-b8ce-03f33652357e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f9-1ed2-8b3a-97e1abb9e8f0	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f9-1ed2-112b-43ab69f0225c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f9-1ed2-3d0f-7cac5f45dd6e	ProgramDela-read	ProgramDela - branje	f
00030000-55f9-1ed2-159c-201c6fb0ea60	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f9-1ed2-df4b-60e0be1093d0	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f9-1ed2-dafc-d9b6a748eaae	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f9-1ed2-6149-5828f6433fde	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f9-1ed2-16fa-cd8530a3388f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f9-1ed2-2b15-aa458f1a107e	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f9-1ed2-031d-41bd8969cb70	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f9-1ed2-1074-e9f811e23d0b	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f9-1ed2-1c21-b95052e9358c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f9-1ed2-8375-6a12a1e0d098	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f9-1ed2-d5ad-f11efaaffb4f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f9-1ed2-983c-f4fdb7797e95	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f9-1ed2-700e-8146b6cb0429	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f9-1ed2-4518-242bb8464136	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f9-1ed2-545f-b15b84e88edb	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f9-1ed2-8de7-f5926801282c	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f9-1ed2-edea-cae30b604817	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f9-1ed2-c5da-bcb3c5e7bd32	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f9-1ed2-65c3-482069ad1989	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f9-1ed2-c38d-8a46f016c254	Prostor-read	Prostor - branje	f
00030000-55f9-1ed2-dc6e-d48c86f1f5f9	Prostor-write	Prostor - spreminjanje	f
00030000-55f9-1ed2-160c-cced7eba184e	Racun-read	Racun - branje	f
00030000-55f9-1ed2-0ed6-b58b840d1680	Racun-write	Racun - spreminjanje	f
00030000-55f9-1ed2-34f3-bcab4339d512	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f9-1ed2-01d2-e0320cc6a750	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f9-1ed2-6fa8-cc0967b8862f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f9-1ed2-7607-d8848441c417	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f9-1ed2-4745-3badaeef3cc4	Rekvizit-read	Rekvizit - branje	f
00030000-55f9-1ed2-e431-564e25bf5e33	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f9-1ed2-67a4-fed807c3ea43	Revizija-read	Revizija - branje	f
00030000-55f9-1ed2-7897-43ba93cbd113	Revizija-write	Revizija - spreminjanje	f
00030000-55f9-1ed2-8af7-2afb25d3caa0	Rezervacija-read	Rezervacija - branje	f
00030000-55f9-1ed2-3d9a-47b780b60f3a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f9-1ed2-775f-0a531c1cdf87	SedezniRed-read	SedezniRed - branje	f
00030000-55f9-1ed2-10da-e9d7e5e1369a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f9-1ed2-7f55-fecbed571ef6	Sedez-read	Sedez - branje	f
00030000-55f9-1ed2-67db-06e2a4bc9e9f	Sedez-write	Sedez - spreminjanje	f
00030000-55f9-1ed2-d3a7-e9e232ace295	Sezona-read	Sezona - branje	f
00030000-55f9-1ed2-1aed-21c91c4e4ac9	Sezona-write	Sezona - spreminjanje	f
00030000-55f9-1ed2-4969-81894a54de5e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f9-1ed2-8cc7-f0ef3262073f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f9-1ed2-aac3-7b556459a6e2	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f9-1ed2-568a-af03765dc3c1	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f9-1ed2-e675-451073470b4a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f9-1ed2-3f08-c02255e29783	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f9-1ed2-e58e-ea0498e46307	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f9-1ed2-f60b-5b96306aada7	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f9-1ed2-199d-f010db57e86e	Telefonska-read	Telefonska - branje	f
00030000-55f9-1ed2-c1c5-310d3cd3b057	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f9-1ed2-43e0-eed25cad2bff	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f9-1ed2-b7a1-067f8417942f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f9-1ed2-d9eb-728458a3b81a	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f9-1ed2-9152-325689d1336c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f9-1ed2-2413-d9e56433c7f6	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f9-1ed2-ad50-424c4abeeabd	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f9-1ed2-ade0-4855d5f5df88	Trr-read	Trr - branje	f
00030000-55f9-1ed2-0675-eb53da0c8423	Trr-write	Trr - spreminjanje	f
00030000-55f9-1ed2-0357-18063274ec20	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f9-1ed2-6933-ce51e23bc611	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f9-1ed2-45d1-30b2919f6005	Vaja-read	Vaja - branje	f
00030000-55f9-1ed2-f704-268cf2564830	Vaja-write	Vaja - spreminjanje	f
00030000-55f9-1ed2-c379-cb2de48d0d88	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f9-1ed2-8d41-3cca018285d5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f9-1ed2-5025-b3d3eb69f56b	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f9-1ed2-e5b7-047c87ad8add	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f9-1ed2-f50f-0a522971ed92	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f9-1ed2-7983-f1e902cd9b65	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f9-1ed2-5e4f-5ce35f8eee21	Zasedenost-read	Zasedenost - branje	f
00030000-55f9-1ed2-7e39-c2ca0c9e0058	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f9-1ed2-6023-314ee5d960f6	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f9-1ed2-8efc-b694ed1fea64	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f9-1ed2-2f92-e7b2fbf515aa	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f9-1ed2-c860-8064858b3dcb	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f9-1ed2-96fc-7b4e9704622b	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f9-1ed2-2b5c-b63c81612a22	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f9-1ed2-20fb-a55fb9d2df7b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f9-1ed2-f21b-f2a0dd90584b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f9-1ed2-f841-185b1be81afc	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f9-1ed2-bebd-8219676829fd	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f9-1ed2-44eb-f068d83273e1	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f9-1ed2-7af9-2df8d115966c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f9-1ed2-3f3a-4d062e48da36	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f9-1ed2-f364-164d604d5f6f	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f9-1ed2-5fdf-6c316477ca0e	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f9-1ed2-c3fd-896f61254d38	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2943 (class 0 OID 19829389)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f9-1ed2-d491-92673f107514	00030000-55f9-1ed2-3a3d-7bf9052aa223
00020000-55f9-1ed2-0b76-d8e7b70acfb8	00030000-55f9-1ed2-5d35-78f2d08b881c
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-6673-427d8f59634c
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-ad55-90e5fcb6d576
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-1b30-ec8d756a26eb
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-c25f-b2fb33f5a103
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-f347-9521c8e12a01
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-1b3b-dd9787f0f759
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-fc52-ca3a95fa98a3
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-0ddd-699056df6c1f
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-5d35-78f2d08b881c
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-4331-06bf50a5a46d
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-ee28-5cfac1929662
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-f762-a22c7e2a3500
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-23cb-bd16d9348721
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-1a5a-39f1132b6478
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-ba52-a6f56a68b4ea
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-c687-3eb1535f3231
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-bfcd-09563cac3904
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-1528-aaf9e8b410d3
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-e00c-404cdbe00373
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-a1bc-b3bc9c388a18
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-8710-62bdf789eabb
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-9a06-17f25879241f
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-7c39-64bdd773e25c
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-3d93-0e7a06d26bb9
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-5026-c4709b5e65ca
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-d5fa-60cfe9f4a25b
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-5cc5-b2c1b21acf7b
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-31d6-191163c6b924
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-772c-5395e5a7b82c
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-43c0-238e1f50d3b3
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-8b3a-97e1abb9e8f0
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-112b-43ab69f0225c
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-c38d-8a46f016c254
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-dc6e-d48c86f1f5f9
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-6fa8-cc0967b8862f
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-7607-d8848441c417
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-4745-3badaeef3cc4
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-e431-564e25bf5e33
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-d3a7-e9e232ace295
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-1aed-21c91c4e4ac9
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-d9eb-728458a3b81a
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-0357-18063274ec20
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-6933-ce51e23bc611
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-45d1-30b2919f6005
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-f704-268cf2564830
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-5e4f-5ce35f8eee21
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-7e39-c2ca0c9e0058
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-6023-314ee5d960f6
00020000-55f9-1ed2-f658-d746b1fe181a	00030000-55f9-1ed2-2f92-e7b2fbf515aa
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-6673-427d8f59634c
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-f347-9521c8e12a01
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-1b3b-dd9787f0f759
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-5d35-78f2d08b881c
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-23cb-bd16d9348721
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-ba52-a6f56a68b4ea
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-bfcd-09563cac3904
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-1528-aaf9e8b410d3
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-e00c-404cdbe00373
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-a1bc-b3bc9c388a18
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-8710-62bdf789eabb
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-9a06-17f25879241f
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-7c39-64bdd773e25c
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-5026-c4709b5e65ca
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-5cc5-b2c1b21acf7b
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-31d6-191163c6b924
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-772c-5395e5a7b82c
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-c38d-8a46f016c254
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-6fa8-cc0967b8862f
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-4745-3badaeef3cc4
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-d3a7-e9e232ace295
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-199d-f010db57e86e
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-c1c5-310d3cd3b057
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-ade0-4855d5f5df88
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-0675-eb53da0c8423
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-f50f-0a522971ed92
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-7983-f1e902cd9b65
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-6023-314ee5d960f6
00020000-55f9-1ed2-6775-22739ea13f68	00030000-55f9-1ed2-2f92-e7b2fbf515aa
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-6673-427d8f59634c
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-1b30-ec8d756a26eb
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-f347-9521c8e12a01
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-1c13-ab0a30ed995d
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-f1dc-deebe7b7fe42
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-89d8-918c9bbbd8b3
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-1b3b-dd9787f0f759
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-5d35-78f2d08b881c
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-ee28-5cfac1929662
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-23cb-bd16d9348721
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-ba52-a6f56a68b4ea
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-bfcd-09563cac3904
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-e00c-404cdbe00373
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-a1bc-b3bc9c388a18
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-8710-62bdf789eabb
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-7c39-64bdd773e25c
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-5026-c4709b5e65ca
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-772c-5395e5a7b82c
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-8b3a-97e1abb9e8f0
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-c38d-8a46f016c254
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-6fa8-cc0967b8862f
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-4745-3badaeef3cc4
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-d3a7-e9e232ace295
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-d9eb-728458a3b81a
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-45d1-30b2919f6005
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-5e4f-5ce35f8eee21
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-6023-314ee5d960f6
00020000-55f9-1ed2-e9da-3197189848d4	00030000-55f9-1ed2-2f92-e7b2fbf515aa
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-6673-427d8f59634c
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-ad55-90e5fcb6d576
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-c25f-b2fb33f5a103
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-f347-9521c8e12a01
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-1b3b-dd9787f0f759
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-5d35-78f2d08b881c
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-23cb-bd16d9348721
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-ba52-a6f56a68b4ea
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-e00c-404cdbe00373
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-a1bc-b3bc9c388a18
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-7c39-64bdd773e25c
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-5026-c4709b5e65ca
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-772c-5395e5a7b82c
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-c38d-8a46f016c254
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-6fa8-cc0967b8862f
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-4745-3badaeef3cc4
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-d3a7-e9e232ace295
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-d9eb-728458a3b81a
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-6023-314ee5d960f6
00020000-55f9-1ed2-f9be-c425bb8e2864	00030000-55f9-1ed2-2f92-e7b2fbf515aa
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-6673-427d8f59634c
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-f347-9521c8e12a01
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-1b3b-dd9787f0f759
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-5d35-78f2d08b881c
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-23cb-bd16d9348721
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-ba52-a6f56a68b4ea
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-e00c-404cdbe00373
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-a1bc-b3bc9c388a18
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-7c39-64bdd773e25c
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-5026-c4709b5e65ca
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-772c-5395e5a7b82c
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-c38d-8a46f016c254
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-6fa8-cc0967b8862f
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-4745-3badaeef3cc4
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-d3a7-e9e232ace295
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-43e0-eed25cad2bff
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-fdfd-5c37b31f3750
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-d9eb-728458a3b81a
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-6023-314ee5d960f6
00020000-55f9-1ed2-95ea-2cd6f33ba971	00030000-55f9-1ed2-2f92-e7b2fbf515aa
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-959c-39f1799a4c18
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-3a3d-7bf9052aa223
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-fdfd-5c37b31f3750
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-fc52-ca3a95fa98a3
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-af84-96c718276ca5
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-f5c7-65c31374c775
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-36c9-61f9865f3735
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-6673-427d8f59634c
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-ad55-90e5fcb6d576
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-1b30-ec8d756a26eb
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-c25f-b2fb33f5a103
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-f347-9521c8e12a01
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-1c13-ab0a30ed995d
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-f1dc-deebe7b7fe42
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-d172-3669ae1d3745
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-89d8-918c9bbbd8b3
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-da75-b78d8eac3238
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-1b3b-dd9787f0f759
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-0ddd-699056df6c1f
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-5d35-78f2d08b881c
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-4331-06bf50a5a46d
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-8d1a-45dd36de7400
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-d03b-d401d9ce0db6
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-79b8-ba34811b8f21
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-8ede-4a2a0d59d961
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-ee28-5cfac1929662
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-f762-a22c7e2a3500
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-23cb-bd16d9348721
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-1a5a-39f1132b6478
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-ba52-a6f56a68b4ea
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-c687-3eb1535f3231
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-bfcd-09563cac3904
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-1528-aaf9e8b410d3
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-8ad6-7f506b3c8df9
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-a1e7-7001b3eb6ff3
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-7594-41668e03efe4
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-3a70-d98717bead3f
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-e00c-404cdbe00373
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-66d3-e92226959107
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-a1bc-b3bc9c388a18
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-6224-01c0eec3a787
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-8710-62bdf789eabb
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-9a06-17f25879241f
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-257d-9dea47ce712b
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-1c2a-a79102ffac4f
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-9038-9b3d239330dc
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-c564-b550dad7872e
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-0a54-b0fc2abb212f
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-d38d-7b7a577ae5d4
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-7c39-64bdd773e25c
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-3d93-0e7a06d26bb9
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-5026-c4709b5e65ca
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-d5fa-60cfe9f4a25b
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-6ab0-c6417bd88868
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-851b-2a4f41438742
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-1701-a07f6f194fac
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-e425-819796f89f91
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-5cc5-b2c1b21acf7b
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-31d6-191163c6b924
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-772c-5395e5a7b82c
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-43c0-238e1f50d3b3
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-f3d4-198a631a5ea5
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-2666-9c8f0491dc63
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-c448-e17382b855d7
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-b8ce-03f33652357e
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-8b3a-97e1abb9e8f0
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-112b-43ab69f0225c
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-3d0f-7cac5f45dd6e
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-159c-201c6fb0ea60
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-df4b-60e0be1093d0
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-dafc-d9b6a748eaae
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-6149-5828f6433fde
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-16fa-cd8530a3388f
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-2b15-aa458f1a107e
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-031d-41bd8969cb70
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-1074-e9f811e23d0b
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-1c21-b95052e9358c
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-8375-6a12a1e0d098
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-d5ad-f11efaaffb4f
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-983c-f4fdb7797e95
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-700e-8146b6cb0429
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-4518-242bb8464136
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-545f-b15b84e88edb
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-8de7-f5926801282c
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-edea-cae30b604817
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-c5da-bcb3c5e7bd32
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-65c3-482069ad1989
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-c38d-8a46f016c254
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-dc6e-d48c86f1f5f9
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-160c-cced7eba184e
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-0ed6-b58b840d1680
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-34f3-bcab4339d512
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-01d2-e0320cc6a750
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-6fa8-cc0967b8862f
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-7607-d8848441c417
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-4745-3badaeef3cc4
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-e431-564e25bf5e33
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-67a4-fed807c3ea43
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-7897-43ba93cbd113
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-8af7-2afb25d3caa0
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-3d9a-47b780b60f3a
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-775f-0a531c1cdf87
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-10da-e9d7e5e1369a
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-7f55-fecbed571ef6
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-67db-06e2a4bc9e9f
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-d3a7-e9e232ace295
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-1aed-21c91c4e4ac9
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-4969-81894a54de5e
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-8cc7-f0ef3262073f
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-aac3-7b556459a6e2
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-568a-af03765dc3c1
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-e675-451073470b4a
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-3f08-c02255e29783
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-e58e-ea0498e46307
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-f60b-5b96306aada7
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-199d-f010db57e86e
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-c1c5-310d3cd3b057
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-43e0-eed25cad2bff
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-b7a1-067f8417942f
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-d9eb-728458a3b81a
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-9152-325689d1336c
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-2413-d9e56433c7f6
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-ad50-424c4abeeabd
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-ade0-4855d5f5df88
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-0675-eb53da0c8423
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-0357-18063274ec20
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-6933-ce51e23bc611
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-45d1-30b2919f6005
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-f704-268cf2564830
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-c379-cb2de48d0d88
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-8d41-3cca018285d5
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-5025-b3d3eb69f56b
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-e5b7-047c87ad8add
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-f50f-0a522971ed92
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-7983-f1e902cd9b65
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-5e4f-5ce35f8eee21
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-7e39-c2ca0c9e0058
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-6023-314ee5d960f6
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-8efc-b694ed1fea64
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-2f92-e7b2fbf515aa
00020000-55f9-1ed3-1582-e5d99e531103	00030000-55f9-1ed2-c860-8064858b3dcb
\.


--
-- TOC entry 2970 (class 0 OID 19829687)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 19829721)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 19829850)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f9-1ed4-c17b-50c38286c0b2	00090000-55f9-1ed4-17f2-c5b2324bcb60	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f9-1ed4-45a6-be3dd6d32663	00090000-55f9-1ed4-6660-3f6eb049d2ca	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f9-1ed4-78d3-21597141e379	00090000-55f9-1ed4-db86-b8a6c3380ada	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f9-1ed4-ba92-ff6923eece13	00090000-55f9-1ed4-de8a-99f9927d61a6	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2948 (class 0 OID 19829449)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f9-1ed3-0059-0edeb2f7df1a	00040000-55f9-1ed2-dfa3-6f4056fff910	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-1ed3-aaaa-7321f967f9ab	00040000-55f9-1ed2-dfa3-6f4056fff910	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f9-1ed3-b45c-86cb3fc27ec4	00040000-55f9-1ed2-dfa3-6f4056fff910	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-1ed3-b595-9de1a370ca63	00040000-55f9-1ed2-dfa3-6f4056fff910	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-1ed3-225c-f4ca3a3b6a69	00040000-55f9-1ed2-dfa3-6f4056fff910	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-1ed3-1e0a-67103fd33155	00040000-55f9-1ed2-1aba-54854d823513	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-1ed3-1d2d-188b536fa18c	00040000-55f9-1ed2-d4d3-2506e491d12e	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-1ed3-32dc-fa1240e71dc1	00040000-55f9-1ed2-3d32-a199deb716f8	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-1ed3-c1e2-b846696b1262	00040000-55f9-1ed2-d34f-be9a6b6c2701	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-1ed5-96af-c3ac6223100c	00040000-55f9-1ed2-dfa3-6f4056fff910	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2950 (class 0 OID 19829483)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f9-1ed2-a3a3-7bc000af6af0	8341	Adlešiči
00050000-55f9-1ed2-2575-c35f0c9b36cd	5270	Ajdovščina
00050000-55f9-1ed2-9578-b85377c0e5ed	6280	Ankaran/Ancarano
00050000-55f9-1ed2-09e0-9c1cd4ff9dff	9253	Apače
00050000-55f9-1ed2-c3c9-648d8ddd9c80	8253	Artiče
00050000-55f9-1ed2-b434-c78045f63da9	4275	Begunje na Gorenjskem
00050000-55f9-1ed2-a3b9-ee6bd57e5fac	1382	Begunje pri Cerknici
00050000-55f9-1ed2-f45f-9d987727d55b	9231	Beltinci
00050000-55f9-1ed2-dd12-3e0f39e9c2ae	2234	Benedikt
00050000-55f9-1ed2-40b9-b0aa5060eb82	2345	Bistrica ob Dravi
00050000-55f9-1ed2-675d-69747dcd4311	3256	Bistrica ob Sotli
00050000-55f9-1ed2-1503-793b2d18de46	8259	Bizeljsko
00050000-55f9-1ed2-2179-c26f6f8aa327	1223	Blagovica
00050000-55f9-1ed2-d8b6-da7912d830a0	8283	Blanca
00050000-55f9-1ed2-e246-0c10932d02b6	4260	Bled
00050000-55f9-1ed2-7d95-d200a6c174d0	4273	Blejska Dobrava
00050000-55f9-1ed2-ebd9-bd1e8a06a627	9265	Bodonci
00050000-55f9-1ed2-be99-d8d620e82f1f	9222	Bogojina
00050000-55f9-1ed2-7d7d-90b5d1a06ea4	4263	Bohinjska Bela
00050000-55f9-1ed2-4d80-2cd46e9825ff	4264	Bohinjska Bistrica
00050000-55f9-1ed2-8959-5c92d245c0a2	4265	Bohinjsko jezero
00050000-55f9-1ed2-6483-45bd77cedcaf	1353	Borovnica
00050000-55f9-1ed2-b056-7b78b9743d55	8294	Boštanj
00050000-55f9-1ed2-466d-0ac1c8001a0b	5230	Bovec
00050000-55f9-1ed2-3e02-8031391285a7	5295	Branik
00050000-55f9-1ed2-bfda-809ee3556c6a	3314	Braslovče
00050000-55f9-1ed2-4496-ca1fdb4fffae	5223	Breginj
00050000-55f9-1ed2-efb5-1a587d70cc88	8280	Brestanica
00050000-55f9-1ed2-d28f-6522f9236eeb	2354	Bresternica
00050000-55f9-1ed2-4de9-fe23a2349b82	4243	Brezje
00050000-55f9-1ed2-300b-48c2efadf6bc	1351	Brezovica pri Ljubljani
00050000-55f9-1ed2-8b9a-815e57c8952d	8250	Brežice
00050000-55f9-1ed2-f54e-280523e69174	4210	Brnik - Aerodrom
00050000-55f9-1ed2-4e92-3119038de65c	8321	Brusnice
00050000-55f9-1ed2-76b8-95d73b8a575d	3255	Buče
00050000-55f9-1ed2-3927-c8207609f9c5	8276	Bučka 
00050000-55f9-1ed2-c8f3-7b1322b9cdd2	9261	Cankova
00050000-55f9-1ed2-2a55-8d5a08f31eb0	3000	Celje 
00050000-55f9-1ed2-b054-e6ac93019a98	3001	Celje - poštni predali
00050000-55f9-1ed2-58cf-33852f3f81c7	4207	Cerklje na Gorenjskem
00050000-55f9-1ed2-1a09-4ca1acfbee89	8263	Cerklje ob Krki
00050000-55f9-1ed2-ff90-7f409a8b25d2	1380	Cerknica
00050000-55f9-1ed2-4d03-1007bde9db1b	5282	Cerkno
00050000-55f9-1ed2-8372-f33aa9548589	2236	Cerkvenjak
00050000-55f9-1ed2-c05b-4419a3ea8245	2215	Ceršak
00050000-55f9-1ed2-67f4-5d25283046e1	2326	Cirkovce
00050000-55f9-1ed2-1002-639a0e859d71	2282	Cirkulane
00050000-55f9-1ed2-5cb9-12432863fbc6	5273	Col
00050000-55f9-1ed2-f0f3-516f1faa9923	8251	Čatež ob Savi
00050000-55f9-1ed2-f98d-730226f0097e	1413	Čemšenik
00050000-55f9-1ed2-f557-f106ccb78c58	5253	Čepovan
00050000-55f9-1ed2-446d-5eec5f4b8d10	9232	Črenšovci
00050000-55f9-1ed2-77e0-930d803dbb4f	2393	Črna na Koroškem
00050000-55f9-1ed2-78bc-89564e80fa30	6275	Črni Kal
00050000-55f9-1ed2-d17e-05262f27909a	5274	Črni Vrh nad Idrijo
00050000-55f9-1ed2-0320-a3afd7b63ca5	5262	Črniče
00050000-55f9-1ed2-4054-3fb307c43589	8340	Črnomelj
00050000-55f9-1ed2-9c59-a759b3dd5d42	6271	Dekani
00050000-55f9-1ed2-8be7-2fe3cf90e1ba	5210	Deskle
00050000-55f9-1ed2-aa3a-5ebb64a272eb	2253	Destrnik
00050000-55f9-1ed2-4ef9-617c8280d92e	6215	Divača
00050000-55f9-1ed2-8038-b114062368b3	1233	Dob
00050000-55f9-1ed2-b611-59415012d77b	3224	Dobje pri Planini
00050000-55f9-1ed2-f904-b35051da1462	8257	Dobova
00050000-55f9-1ed2-a3f0-a62a9049970c	1423	Dobovec
00050000-55f9-1ed2-a3ba-8fcc29a5e7f8	5263	Dobravlje
00050000-55f9-1ed2-ce01-0e2460ca683d	3204	Dobrna
00050000-55f9-1ed2-5125-06d24f657db8	8211	Dobrnič
00050000-55f9-1ed2-3480-b619a6eb16eb	1356	Dobrova
00050000-55f9-1ed2-dc92-4fe855c4e0ee	9223	Dobrovnik/Dobronak 
00050000-55f9-1ed2-b364-7baaf08f8a33	5212	Dobrovo v Brdih
00050000-55f9-1ed2-6c92-ed5e9e7a2a72	1431	Dol pri Hrastniku
00050000-55f9-1ed2-12e9-0e8506981a4f	1262	Dol pri Ljubljani
00050000-55f9-1ed2-1d8e-42fde6a577d1	1273	Dole pri Litiji
00050000-55f9-1ed2-cc43-916eefdcd371	1331	Dolenja vas
00050000-55f9-1ed2-8c27-d1ff6a2daa0c	8350	Dolenjske Toplice
00050000-55f9-1ed2-d4f4-46a91bce6b3d	1230	Domžale
00050000-55f9-1ed2-1329-35e70d05f791	2252	Dornava
00050000-55f9-1ed2-f137-70b2872913fc	5294	Dornberk
00050000-55f9-1ed2-f149-c4b0707ecaca	1319	Draga
00050000-55f9-1ed2-9b71-ab7920171138	8343	Dragatuš
00050000-55f9-1ed2-8346-264819a75e80	3222	Dramlje
00050000-55f9-1ed2-08c7-1bd457df0ded	2370	Dravograd
00050000-55f9-1ed2-f3e6-d5515edb06f7	4203	Duplje
00050000-55f9-1ed2-407a-711b7b142410	6221	Dutovlje
00050000-55f9-1ed2-41ad-287d9a02a1e9	8361	Dvor
00050000-55f9-1ed2-3038-e42efc6ded68	2343	Fala
00050000-55f9-1ed2-f11d-7e01b9d7fbb2	9208	Fokovci
00050000-55f9-1ed2-8639-80759693fc37	2313	Fram
00050000-55f9-1ed2-5390-88376c892818	3213	Frankolovo
00050000-55f9-1ed2-b4e7-5272440cd124	1274	Gabrovka
00050000-55f9-1ed2-4343-ba0dfcd8127f	8254	Globoko
00050000-55f9-1ed2-c541-a1d5e9144b78	5275	Godovič
00050000-55f9-1ed2-ea7b-350c3b51fdbf	4204	Golnik
00050000-55f9-1ed2-224b-8080046f1d05	3303	Gomilsko
00050000-55f9-1ed2-fba4-408b95d529aa	4224	Gorenja vas
00050000-55f9-1ed2-f891-174b54b61608	3263	Gorica pri Slivnici
00050000-55f9-1ed2-e331-dc5647beaf5e	2272	Gorišnica
00050000-55f9-1ed2-b62c-4af028ba53ca	9250	Gornja Radgona
00050000-55f9-1ed2-62a5-7c8a0f0ce0ac	3342	Gornji Grad
00050000-55f9-1ed2-fe8f-7fac849b4117	4282	Gozd Martuljek
00050000-55f9-1ed2-6cac-a720b85651e9	6272	Gračišče
00050000-55f9-1ed2-bbe8-34a32f96069b	9264	Grad
00050000-55f9-1ed2-ad59-a090609cccb8	8332	Gradac
00050000-55f9-1ed2-77d8-775388c5a925	1384	Grahovo
00050000-55f9-1ed2-8543-ebb8110bff63	5242	Grahovo ob Bači
00050000-55f9-1ed2-3e2a-c7b93ea57a48	5251	Grgar
00050000-55f9-1ed2-0b5b-d9703958fa32	3302	Griže
00050000-55f9-1ed2-8ad0-4d6833087d52	3231	Grobelno
00050000-55f9-1ed2-c988-495d76222965	1290	Grosuplje
00050000-55f9-1ed2-0757-f1e910d4a580	2288	Hajdina
00050000-55f9-1ed2-c3f9-9952ab97c0c4	8362	Hinje
00050000-55f9-1ed2-e8a0-d97ac4d4d011	2311	Hoče
00050000-55f9-1ed2-51f4-d9fe1daa3ec4	9205	Hodoš/Hodos
00050000-55f9-1ed2-fcb0-46e7f44ed832	1354	Horjul
00050000-55f9-1ed2-18b6-a3d44319edea	1372	Hotedršica
00050000-55f9-1ed2-83ce-c28743d86969	1430	Hrastnik
00050000-55f9-1ed2-97f9-b296f34db7c6	6225	Hruševje
00050000-55f9-1ed2-2336-812fd6b953a0	4276	Hrušica
00050000-55f9-1ed2-c616-4b7ec2c9d895	5280	Idrija
00050000-55f9-1ed2-a49d-e4bd1d0b2776	1292	Ig
00050000-55f9-1ed2-6da1-1d6efbd385f8	6250	Ilirska Bistrica
00050000-55f9-1ed2-a93a-dad75f4b59cb	6251	Ilirska Bistrica-Trnovo
00050000-55f9-1ed2-94c1-bbac10665901	1295	Ivančna Gorica
00050000-55f9-1ed2-ef70-b4a2491acb05	2259	Ivanjkovci
00050000-55f9-1ed2-14de-135b14967090	1411	Izlake
00050000-55f9-1ed2-980f-1ec63dc3f07b	6310	Izola/Isola
00050000-55f9-1ed2-3b76-e969756b8793	2222	Jakobski Dol
00050000-55f9-1ed2-48da-f6e19c92c224	2221	Jarenina
00050000-55f9-1ed2-77c8-2f5f2b7358ba	6254	Jelšane
00050000-55f9-1ed2-bdd7-7c60d88422d3	4270	Jesenice
00050000-55f9-1ed2-288f-5d7cc820dc62	8261	Jesenice na Dolenjskem
00050000-55f9-1ed2-5869-488013d0a438	3273	Jurklošter
00050000-55f9-1ed2-319e-33c42c7f92fe	2223	Jurovski Dol
00050000-55f9-1ed2-1913-8a9905a83c6b	2256	Juršinci
00050000-55f9-1ed2-8b66-357aba3fb3fe	5214	Kal nad Kanalom
00050000-55f9-1ed2-8353-49301e08b9ce	3233	Kalobje
00050000-55f9-1ed2-e6a5-34b39d6b94e1	4246	Kamna Gorica
00050000-55f9-1ed2-2100-487def7c0ebe	2351	Kamnica
00050000-55f9-1ed2-43f7-79be0de851ae	1241	Kamnik
00050000-55f9-1ed2-8bcb-8deba336773b	5213	Kanal
00050000-55f9-1ed2-7c56-3291cdbc4e0d	8258	Kapele
00050000-55f9-1ed2-dc51-450863a0d0c6	2362	Kapla
00050000-55f9-1ed2-9a64-25298fe9bd4e	2325	Kidričevo
00050000-55f9-1ed2-966c-bc2f8f05b855	1412	Kisovec
00050000-55f9-1ed2-a5e2-172eada42761	6253	Knežak
00050000-55f9-1ed2-627c-bda6125ee667	5222	Kobarid
00050000-55f9-1ed2-de5d-426240d540f8	9227	Kobilje
00050000-55f9-1ed2-c212-07d1ef6dfff5	1330	Kočevje
00050000-55f9-1ed2-cad7-a06f0aad1d7e	1338	Kočevska Reka
00050000-55f9-1ed2-135c-f7949767b141	2276	Kog
00050000-55f9-1ed2-8327-d7a0921ca437	5211	Kojsko
00050000-55f9-1ed2-dd4b-058c6a7010b0	6223	Komen
00050000-55f9-1ed2-32aa-adc616db8d7e	1218	Komenda
00050000-55f9-1ed2-fdc4-28616da786e3	6000	Koper/Capodistria 
00050000-55f9-1ed2-cb53-67312f77a041	6001	Koper/Capodistria - poštni predali
00050000-55f9-1ed2-74e8-6395888f5aab	8282	Koprivnica
00050000-55f9-1ed2-c78b-5b0d55411ba6	5296	Kostanjevica na Krasu
00050000-55f9-1ed2-7db5-c9d4755b62a0	8311	Kostanjevica na Krki
00050000-55f9-1ed2-a736-24b6167f47fc	1336	Kostel
00050000-55f9-1ed2-32e6-105a1919213a	6256	Košana
00050000-55f9-1ed2-a3f5-c25a9182ceab	2394	Kotlje
00050000-55f9-1ed2-2c74-cb214e04188d	6240	Kozina
00050000-55f9-1ed2-d831-15c508b8bfcb	3260	Kozje
00050000-55f9-1ed2-a5fa-ab1da9ba12cf	4000	Kranj 
00050000-55f9-1ed2-087e-19c163288589	4001	Kranj - poštni predali
00050000-55f9-1ed2-9fd9-f439a5c19257	4280	Kranjska Gora
00050000-55f9-1ed2-33db-fe734f658314	1281	Kresnice
00050000-55f9-1ed2-f8d8-82af9d0f7b0b	4294	Križe
00050000-55f9-1ed2-6e30-97650958fc5c	9206	Križevci
00050000-55f9-1ed2-0b91-0bcbc5b68e86	9242	Križevci pri Ljutomeru
00050000-55f9-1ed2-b17e-8b339558807f	1301	Krka
00050000-55f9-1ed2-64e5-52ddb60fb043	8296	Krmelj
00050000-55f9-1ed2-3cd5-0b59abc5bab5	4245	Kropa
00050000-55f9-1ed2-bf3d-e5ca8cb61e07	8262	Krška vas
00050000-55f9-1ed2-2a57-5092f2e9b27f	8270	Krško
00050000-55f9-1ed2-67b7-9e987babf9fd	9263	Kuzma
00050000-55f9-1ed2-e153-e6aa97c0e7cf	2318	Laporje
00050000-55f9-1ed2-9c07-3fc25a82f536	3270	Laško
00050000-55f9-1ed2-531d-1feae0f2267e	1219	Laze v Tuhinju
00050000-55f9-1ed2-0b7c-b9d58042061b	2230	Lenart v Slovenskih goricah
00050000-55f9-1ed2-2f24-4bb13de13473	9220	Lendava/Lendva
00050000-55f9-1ed2-b459-292665ee1187	4248	Lesce
00050000-55f9-1ed2-3571-832bc2407dd5	3261	Lesično
00050000-55f9-1ed2-00a9-0e26c712b160	8273	Leskovec pri Krškem
00050000-55f9-1ed2-a1bb-ae5ea918a592	2372	Libeliče
00050000-55f9-1ed2-27da-3c5b56e6d362	2341	Limbuš
00050000-55f9-1ed2-642b-1faffb25bc8e	1270	Litija
00050000-55f9-1ed2-e82e-afd3a2715214	3202	Ljubečna
00050000-55f9-1ed2-3ceb-121be56ec3a3	1000	Ljubljana 
00050000-55f9-1ed2-2ad1-3753094f5d6b	1001	Ljubljana - poštni predali
00050000-55f9-1ed2-98fc-046e6f81c5e5	1231	Ljubljana - Črnuče
00050000-55f9-1ed2-f274-f7e3744474b5	1261	Ljubljana - Dobrunje
00050000-55f9-1ed2-6556-6e6bab2be383	1260	Ljubljana - Polje
00050000-55f9-1ed2-157c-4df67103ded4	1210	Ljubljana - Šentvid
00050000-55f9-1ed2-599e-7860f799bab0	1211	Ljubljana - Šmartno
00050000-55f9-1ed2-84cd-7978273f9ce0	3333	Ljubno ob Savinji
00050000-55f9-1ed2-7763-20959ec84dd5	9240	Ljutomer
00050000-55f9-1ed2-45d2-58aa898f806b	3215	Loče
00050000-55f9-1ed2-9969-cfcea953f70c	5231	Log pod Mangartom
00050000-55f9-1ed2-b5e7-437e3f815f93	1358	Log pri Brezovici
00050000-55f9-1ed2-e93b-435e12971347	1370	Logatec
00050000-55f9-1ed2-e2de-69e8ca1bfffd	1371	Logatec
00050000-55f9-1ed2-c9dc-91759939cbcb	1434	Loka pri Zidanem Mostu
00050000-55f9-1ed2-17e5-93909ec76f3a	3223	Loka pri Žusmu
00050000-55f9-1ed2-3472-1ae5cd80b9e5	6219	Lokev
00050000-55f9-1ed2-c687-15fbe88205b4	1318	Loški Potok
00050000-55f9-1ed2-9090-df6fe6a36e06	2324	Lovrenc na Dravskem polju
00050000-55f9-1ed2-ea42-38121b382bfd	2344	Lovrenc na Pohorju
00050000-55f9-1ed2-33b8-5a67b8b68a37	3334	Luče
00050000-55f9-1ed2-bc26-6b604921b44b	1225	Lukovica
00050000-55f9-1ed2-6e40-6eddfad9e202	9202	Mačkovci
00050000-55f9-1ed2-7b71-27d5217315fa	2322	Majšperk
00050000-55f9-1ed2-1cf8-3f35650a4527	2321	Makole
00050000-55f9-1ed2-e9cd-f0b6c302ef11	9243	Mala Nedelja
00050000-55f9-1ed2-47fd-043d675d7f19	2229	Malečnik
00050000-55f9-1ed2-96a7-f762c2d5343f	6273	Marezige
00050000-55f9-1ed2-606f-5918f698d6ac	2000	Maribor 
00050000-55f9-1ed2-993b-f887b1aa0897	2001	Maribor - poštni predali
00050000-55f9-1ed2-a821-75e90037fcc7	2206	Marjeta na Dravskem polju
00050000-55f9-1ed2-410f-78d514f5de3c	2281	Markovci
00050000-55f9-1ed2-8a47-576c0008973e	9221	Martjanci
00050000-55f9-1ed2-5b9b-5f59bf9a3b19	6242	Materija
00050000-55f9-1ed2-36fd-daa7cb40cada	4211	Mavčiče
00050000-55f9-1ed2-34f1-3eea338825ef	1215	Medvode
00050000-55f9-1ed2-e2b6-dde1653bc019	1234	Mengeš
00050000-55f9-1ed2-9b05-2cf2d5549b36	8330	Metlika
00050000-55f9-1ed2-3c7f-da368e441024	2392	Mežica
00050000-55f9-1ed2-b892-e00bb1f9d0f4	2204	Miklavž na Dravskem polju
00050000-55f9-1ed2-671f-86e10b618872	2275	Miklavž pri Ormožu
00050000-55f9-1ed2-8502-6d013d2598c4	5291	Miren
00050000-55f9-1ed2-e2de-c9af17c77c1d	8233	Mirna
00050000-55f9-1ed2-fa8d-2f6df7ee5be9	8216	Mirna Peč
00050000-55f9-1ed2-0d9a-9f9b65a9c820	2382	Mislinja
00050000-55f9-1ed2-2869-b7f124526842	4281	Mojstrana
00050000-55f9-1ed2-af41-96362aa4a29f	8230	Mokronog
00050000-55f9-1ed2-a1af-32544df34ab9	1251	Moravče
00050000-55f9-1ed2-75e6-342b4057fbb3	9226	Moravske Toplice
00050000-55f9-1ed2-7e7e-74eb421cf943	5216	Most na Soči
00050000-55f9-1ed2-ad20-e222a1d796d8	1221	Motnik
00050000-55f9-1ed2-9b85-bd95752c608b	3330	Mozirje
00050000-55f9-1ed2-9862-43d3cd6659b0	9000	Murska Sobota 
00050000-55f9-1ed2-3b20-172865e208b4	9001	Murska Sobota - poštni predali
00050000-55f9-1ed2-e270-4be0aac7659e	2366	Muta
00050000-55f9-1ed2-73f8-72be6bef748a	4202	Naklo
00050000-55f9-1ed2-9a8e-e3f01fe21be2	3331	Nazarje
00050000-55f9-1ed2-5734-156a554b4be2	1357	Notranje Gorice
00050000-55f9-1ed2-d0ec-b83bff61cb1b	3203	Nova Cerkev
00050000-55f9-1ed2-cb0e-cb3f76d2f5c4	5000	Nova Gorica 
00050000-55f9-1ed2-7999-7241967b4724	5001	Nova Gorica - poštni predali
00050000-55f9-1ed2-5230-2744a9059831	1385	Nova vas
00050000-55f9-1ed2-93ae-786d3b677273	8000	Novo mesto
00050000-55f9-1ed2-6a18-d3c34bf99a33	8001	Novo mesto - poštni predali
00050000-55f9-1ed2-0376-5818e8856859	6243	Obrov
00050000-55f9-1ed2-3fd9-a7cdab7f4dda	9233	Odranci
00050000-55f9-1ed2-ec6a-a222678a448e	2317	Oplotnica
00050000-55f9-1ed2-3042-c1e431a289c6	2312	Orehova vas
00050000-55f9-1ed2-aee4-80760457cf62	2270	Ormož
00050000-55f9-1ed2-9f7c-396268772180	1316	Ortnek
00050000-55f9-1ed2-9d5f-d3dd40678943	1337	Osilnica
00050000-55f9-1ed2-1652-1fd6489c0bdd	8222	Otočec
00050000-55f9-1ed2-b45f-2ab5a2a1d08b	2361	Ožbalt
00050000-55f9-1ed2-0036-84adbcc578e1	2231	Pernica
00050000-55f9-1ed2-a452-3340c8ae66fa	2211	Pesnica pri Mariboru
00050000-55f9-1ed2-00b9-9b93434bb846	9203	Petrovci
00050000-55f9-1ed2-8748-174c61cd6eec	3301	Petrovče
00050000-55f9-1ed2-0349-d24d4547a26f	6330	Piran/Pirano
00050000-55f9-1ed2-6bcc-ba8e45e932fe	8255	Pišece
00050000-55f9-1ed2-0d2d-10beb1ee0752	6257	Pivka
00050000-55f9-1ed2-0bf5-25bff2d157a6	6232	Planina
00050000-55f9-1ed2-4e5d-559bfed75248	3225	Planina pri Sevnici
00050000-55f9-1ed2-06c9-8368bd6d23f9	6276	Pobegi
00050000-55f9-1ed2-a174-35af0852090b	8312	Podbočje
00050000-55f9-1ed2-d745-b796b62df697	5243	Podbrdo
00050000-55f9-1ed2-84d0-82be3a19bcae	3254	Podčetrtek
00050000-55f9-1ed2-cdd0-826d49adf2e7	2273	Podgorci
00050000-55f9-1ed2-6c73-859f1a89520d	6216	Podgorje
00050000-55f9-1ed2-6f66-a82ce3b61837	2381	Podgorje pri Slovenj Gradcu
00050000-55f9-1ed2-cf43-600169ea6b3a	6244	Podgrad
00050000-55f9-1ed2-e1a1-b36ef796bb5f	1414	Podkum
00050000-55f9-1ed2-d798-d10773de509a	2286	Podlehnik
00050000-55f9-1ed2-b1e5-a6b6e8ae90a6	5272	Podnanos
00050000-55f9-1ed2-e8f6-08b59526c9ea	4244	Podnart
00050000-55f9-1ed2-2c36-b295d563948d	3241	Podplat
00050000-55f9-1ed2-a3a3-bf86df7c772e	3257	Podsreda
00050000-55f9-1ed2-4d0d-16640721a387	2363	Podvelka
00050000-55f9-1ed2-5216-089c4fbfbfb7	2208	Pohorje
00050000-55f9-1ed2-c43e-862c6e2a412d	2257	Polenšak
00050000-55f9-1ed2-aa9e-88310e9f28e4	1355	Polhov Gradec
00050000-55f9-1ed2-a4dd-2844a0e47fcb	4223	Poljane nad Škofjo Loko
00050000-55f9-1ed2-979a-8e0541c197cb	2319	Poljčane
00050000-55f9-1ed2-4acb-f5b133f695e9	1272	Polšnik
00050000-55f9-1ed2-9de7-ab852cafa739	3313	Polzela
00050000-55f9-1ed2-868e-78395de468b1	3232	Ponikva
00050000-55f9-1ed2-673c-09a85f905c57	6320	Portorož/Portorose
00050000-55f9-1ed2-8f0b-c247792d4174	6230	Postojna
00050000-55f9-1ed2-c50a-8840b0e15d59	2331	Pragersko
00050000-55f9-1ed2-208a-2e616b6fa84a	3312	Prebold
00050000-55f9-1ed2-5e6c-2455b01c2b6d	4205	Preddvor
00050000-55f9-1ed2-59cd-58e6555f5650	6255	Prem
00050000-55f9-1ed2-a8dd-d52047430e0a	1352	Preserje
00050000-55f9-1ed2-7d42-73f7abd5f9eb	6258	Prestranek
00050000-55f9-1ed2-5da9-dddc21acd9b9	2391	Prevalje
00050000-55f9-1ed2-5009-8fb8bbe2a6e9	3262	Prevorje
00050000-55f9-1ed2-4821-66d0e1690e2c	1276	Primskovo 
00050000-55f9-1ed2-288c-c57be8cc9d72	3253	Pristava pri Mestinju
00050000-55f9-1ed2-1d41-4d4de8681d66	9207	Prosenjakovci/Partosfalva
00050000-55f9-1ed2-b033-9a613a844417	5297	Prvačina
00050000-55f9-1ed2-b716-0d5149c60c59	2250	Ptuj
00050000-55f9-1ed2-c307-0953b641e1b5	2323	Ptujska Gora
00050000-55f9-1ed2-62ae-7cd313f220c8	9201	Puconci
00050000-55f9-1ed2-26f7-452c4603f8f1	2327	Rače
00050000-55f9-1ed2-94fb-1e059b36b7f4	1433	Radeče
00050000-55f9-1ed2-ded1-a808550c9483	9252	Radenci
00050000-55f9-1ed2-92e3-05de8d543415	2360	Radlje ob Dravi
00050000-55f9-1ed2-a2b4-00833456dc5c	1235	Radomlje
00050000-55f9-1ed2-297a-100bfcce9739	4240	Radovljica
00050000-55f9-1ed2-0123-5469e2bc2008	8274	Raka
00050000-55f9-1ed2-56bc-ee96610d4c83	1381	Rakek
00050000-55f9-1ed2-c068-6d07614b8df3	4283	Rateče - Planica
00050000-55f9-1ed2-3a9d-32b57e68f743	2390	Ravne na Koroškem
00050000-55f9-1ed2-a063-b8ddead7f574	9246	Razkrižje
00050000-55f9-1ed2-ab0e-a6278a4b193a	3332	Rečica ob Savinji
00050000-55f9-1ed2-d516-e876de1afe4c	5292	Renče
00050000-55f9-1ed2-ebd7-12f5b490e7e7	1310	Ribnica
00050000-55f9-1ed2-8d3a-bc643572cb01	2364	Ribnica na Pohorju
00050000-55f9-1ed2-7c49-cbe9b2b27d7d	3272	Rimske Toplice
00050000-55f9-1ed2-8771-aca3566bb423	1314	Rob
00050000-55f9-1ed2-c086-2fe9ba18c882	5215	Ročinj
00050000-55f9-1ed2-d62c-967101d2bbb1	3250	Rogaška Slatina
00050000-55f9-1ed2-4b43-f500414a7a06	9262	Rogašovci
00050000-55f9-1ed2-9a59-fa848ab9d9e9	3252	Rogatec
00050000-55f9-1ed2-e9fb-15ad4d9b4819	1373	Rovte
00050000-55f9-1ed2-f086-af414e8c13f3	2342	Ruše
00050000-55f9-1ed2-b4e4-8b402dc32ffe	1282	Sava
00050000-55f9-1ed2-d8f6-c67493f54540	6333	Sečovlje/Sicciole
00050000-55f9-1ed2-87b6-548976eb0e07	4227	Selca
00050000-55f9-1ed2-91c7-45d646973bcd	2352	Selnica ob Dravi
00050000-55f9-1ed2-a6e2-6ead7b5ca986	8333	Semič
00050000-55f9-1ed2-72e8-d07e46f2bd2c	8281	Senovo
00050000-55f9-1ed2-72e7-07deae3027b8	6224	Senožeče
00050000-55f9-1ed2-f976-67eec3b25747	8290	Sevnica
00050000-55f9-1ed2-3700-cd72fd8ec7ea	6210	Sežana
00050000-55f9-1ed2-1de3-bf9633b7d304	2214	Sladki Vrh
00050000-55f9-1ed2-f52e-c4f44e820cb5	5283	Slap ob Idrijci
00050000-55f9-1ed2-a6cb-b5b8a5e0077d	2380	Slovenj Gradec
00050000-55f9-1ed2-5908-8d6d69610a72	2310	Slovenska Bistrica
00050000-55f9-1ed2-e0be-9e5b9a0406a3	3210	Slovenske Konjice
00050000-55f9-1ed2-ec5c-a11e2cdd4bc8	1216	Smlednik
00050000-55f9-1ed2-ce4d-0aebe2b68dbc	5232	Soča
00050000-55f9-1ed2-ae59-952bb369a6bc	1317	Sodražica
00050000-55f9-1ed2-8b38-7405a83ad937	3335	Solčava
00050000-55f9-1ed2-ea32-1b17b4297bec	5250	Solkan
00050000-55f9-1ed2-4295-2749463c5f5c	4229	Sorica
00050000-55f9-1ed2-e4f9-95c4f6b338fe	4225	Sovodenj
00050000-55f9-1ed2-6893-1e98ea073e34	5281	Spodnja Idrija
00050000-55f9-1ed2-5152-63cdaaf1e53e	2241	Spodnji Duplek
00050000-55f9-1ed2-e480-0a85ac0103c8	9245	Spodnji Ivanjci
00050000-55f9-1ed2-6373-bb5344fbb378	2277	Središče ob Dravi
00050000-55f9-1ed2-8990-8a1b2a9ec162	4267	Srednja vas v Bohinju
00050000-55f9-1ed2-e2eb-a05c7f289c20	8256	Sromlje 
00050000-55f9-1ed2-4661-d32df87ff378	5224	Srpenica
00050000-55f9-1ed2-aee6-e6e985880df5	1242	Stahovica
00050000-55f9-1ed2-56bb-ee71e508008f	1332	Stara Cerkev
00050000-55f9-1ed2-039b-b8a4fd869907	8342	Stari trg ob Kolpi
00050000-55f9-1ed2-1f07-effa6a967082	1386	Stari trg pri Ložu
00050000-55f9-1ed2-74fe-24ca0676d790	2205	Starše
00050000-55f9-1ed2-b15e-73f7550cfc05	2289	Stoperce
00050000-55f9-1ed2-0a9c-0f0bc2f679a7	8322	Stopiče
00050000-55f9-1ed2-da67-370e5b148694	3206	Stranice
00050000-55f9-1ed2-3998-491cf6e36c0e	8351	Straža
00050000-55f9-1ed2-2af2-39111c1430ea	1313	Struge
00050000-55f9-1ed2-0b38-ee393483e8f4	8293	Studenec
00050000-55f9-1ed2-d105-9ff74d94a3c7	8331	Suhor
00050000-55f9-1ed2-89d7-dbfefadf7ac1	2233	Sv. Ana v Slovenskih goricah
00050000-55f9-1ed2-9c1f-c38a5d78d2b5	2235	Sv. Trojica v Slovenskih goricah
00050000-55f9-1ed2-e095-2b03fa11dd1b	2353	Sveti Duh na Ostrem Vrhu
00050000-55f9-1ed2-59db-856745be840a	9244	Sveti Jurij ob Ščavnici
00050000-55f9-1ed2-4cad-5f37cdb35ffa	3264	Sveti Štefan
00050000-55f9-1ed2-6fb4-67ea6c05d4fd	2258	Sveti Tomaž
00050000-55f9-1ed2-f035-c1c35d0d523b	9204	Šalovci
00050000-55f9-1ed2-5fb0-abf5ad1f7ffb	5261	Šempas
00050000-55f9-1ed2-8ceb-07dff9a842e8	5290	Šempeter pri Gorici
00050000-55f9-1ed2-50d6-5f2f8df22a6e	3311	Šempeter v Savinjski dolini
00050000-55f9-1ed2-1a1e-bedf40cb0c71	4208	Šenčur
00050000-55f9-1ed2-3368-8e379b8a6831	2212	Šentilj v Slovenskih goricah
00050000-55f9-1ed2-8d03-6d420898217d	8297	Šentjanž
00050000-55f9-1ed2-3b62-2b9191d76377	2373	Šentjanž pri Dravogradu
00050000-55f9-1ed2-426b-73a92f9f3dab	8310	Šentjernej
00050000-55f9-1ed2-deee-9889da4225c2	3230	Šentjur
00050000-55f9-1ed2-8804-78bb3b570beb	3271	Šentrupert
00050000-55f9-1ed2-0582-af31471fca88	8232	Šentrupert
00050000-55f9-1ed2-3644-399152a72fa1	1296	Šentvid pri Stični
00050000-55f9-1ed2-c33d-0d5ec2dfca94	8275	Škocjan
00050000-55f9-1ed2-3f2b-b7330f2676f6	6281	Škofije
00050000-55f9-1ed2-c391-591fa9b65ce7	4220	Škofja Loka
00050000-55f9-1ed2-30bc-7c3ec9f3c6a3	3211	Škofja vas
00050000-55f9-1ed2-d1a1-f2f3a057d42f	1291	Škofljica
00050000-55f9-1ed2-0948-fd45e9f44b2a	6274	Šmarje
00050000-55f9-1ed2-e4f3-aca99776874c	1293	Šmarje - Sap
00050000-55f9-1ed2-7e7e-b4f8a37363e0	3240	Šmarje pri Jelšah
00050000-55f9-1ed2-a243-1131377a71c7	8220	Šmarješke Toplice
00050000-55f9-1ed2-ff91-209ebe6eee13	2315	Šmartno na Pohorju
00050000-55f9-1ed2-bbcc-3ec6a797ca54	3341	Šmartno ob Dreti
00050000-55f9-1ed2-b019-1d570b59f970	3327	Šmartno ob Paki
00050000-55f9-1ed2-544b-4828f879f5da	1275	Šmartno pri Litiji
00050000-55f9-1ed2-5150-07562b80c385	2383	Šmartno pri Slovenj Gradcu
00050000-55f9-1ed2-e929-192214612352	3201	Šmartno v Rožni dolini
00050000-55f9-1ed2-8eb8-d0a94e53fad6	3325	Šoštanj
00050000-55f9-1ed2-149e-f6c4fd02bdca	6222	Štanjel
00050000-55f9-1ed2-703d-24a3ba2c7ed4	3220	Štore
00050000-55f9-1ed2-0ccf-c1a071022bbd	3304	Tabor
00050000-55f9-1ed2-a57d-ea299d3c1f1f	3221	Teharje
00050000-55f9-1ed2-9c3c-46bf73d7d234	9251	Tišina
00050000-55f9-1ed2-294d-92307abd7c3a	5220	Tolmin
00050000-55f9-1ed2-61d9-6b4c6626dd4b	3326	Topolšica
00050000-55f9-1ed2-4e7f-9c08e3e00515	2371	Trbonje
00050000-55f9-1ed2-40b1-5de27e56eaea	1420	Trbovlje
00050000-55f9-1ed2-b3b3-b5886ecc3de6	8231	Trebelno 
00050000-55f9-1ed2-fd9f-3d4f0f4934b7	8210	Trebnje
00050000-55f9-1ed2-ab1e-e36ed4f7bd88	5252	Trnovo pri Gorici
00050000-55f9-1ed2-4ab6-0e70377bd7ba	2254	Trnovska vas
00050000-55f9-1ed2-cb0d-af2686a20e99	1222	Trojane
00050000-55f9-1ed2-41fd-fb0e013fad15	1236	Trzin
00050000-55f9-1ed2-211a-bb5e00561448	4290	Tržič
00050000-55f9-1ed2-4568-992a4e75790d	8295	Tržišče
00050000-55f9-1ed2-9b6c-51fcbf1eb91d	1311	Turjak
00050000-55f9-1ed2-b2c4-67d37025f51f	9224	Turnišče
00050000-55f9-1ed2-0818-a5a86174adc0	8323	Uršna sela
00050000-55f9-1ed2-997b-7f26bb24c5eb	1252	Vače
00050000-55f9-1ed2-49ca-c610a9721871	3320	Velenje 
00050000-55f9-1ed2-92fb-1ab223aa80b4	3322	Velenje - poštni predali
00050000-55f9-1ed2-1bf3-48f1b1933590	8212	Velika Loka
00050000-55f9-1ed2-c153-b5271fc37f41	2274	Velika Nedelja
00050000-55f9-1ed2-4c47-a387678bff8a	9225	Velika Polana
00050000-55f9-1ed2-214c-8ee00a70425d	1315	Velike Lašče
00050000-55f9-1ed2-92f5-1adbad4a0cdb	8213	Veliki Gaber
00050000-55f9-1ed2-f02c-608174c4b8aa	9241	Veržej
00050000-55f9-1ed2-8c7d-373038a80cb7	1312	Videm - Dobrepolje
00050000-55f9-1ed2-2349-9f8b6de9edb5	2284	Videm pri Ptuju
00050000-55f9-1ed2-d3b9-bf50c8368df5	8344	Vinica
00050000-55f9-1ed2-dd63-7e7749c1ff9d	5271	Vipava
00050000-55f9-1ed2-b1c2-d34c4acdb9ec	4212	Visoko
00050000-55f9-1ed2-1715-fbbe203ddffb	1294	Višnja Gora
00050000-55f9-1ed2-04ab-1628d3f4d666	3205	Vitanje
00050000-55f9-1ed2-d413-9732a7669e7f	2255	Vitomarci
00050000-55f9-1ed2-6046-36f642e94126	1217	Vodice
00050000-55f9-1ed2-97e0-d78bdabeabe7	3212	Vojnik\t
00050000-55f9-1ed2-0592-661baacd09d2	5293	Volčja Draga
00050000-55f9-1ed2-f33c-170642a270ca	2232	Voličina
00050000-55f9-1ed2-c946-6ac923c496af	3305	Vransko
00050000-55f9-1ed2-5824-6719de103ec7	6217	Vremski Britof
00050000-55f9-1ed2-6ae6-3bb7decc4dbd	1360	Vrhnika
00050000-55f9-1ed2-61f9-2036c95e8c6a	2365	Vuhred
00050000-55f9-1ed2-849e-d611e4a886d2	2367	Vuzenica
00050000-55f9-1ed2-c84d-87daeb332aaa	8292	Zabukovje 
00050000-55f9-1ed2-fb86-d43a54a51cd4	1410	Zagorje ob Savi
00050000-55f9-1ed2-e0c0-8da6dbe8516f	1303	Zagradec
00050000-55f9-1ed2-6800-c41517832dcd	2283	Zavrč
00050000-55f9-1ed2-370f-1ecea25ee297	8272	Zdole 
00050000-55f9-1ed2-4bf3-27be6a00f59f	4201	Zgornja Besnica
00050000-55f9-1ed2-5deb-e260516ea2ef	2242	Zgornja Korena
00050000-55f9-1ed2-44ad-2489973f1c61	2201	Zgornja Kungota
00050000-55f9-1ed2-5e8f-5be470cddb90	2316	Zgornja Ložnica
00050000-55f9-1ed2-3869-5966e8e9d8ed	2314	Zgornja Polskava
00050000-55f9-1ed2-3420-41c9e715421f	2213	Zgornja Velka
00050000-55f9-1ed2-b058-0a847c849412	4247	Zgornje Gorje
00050000-55f9-1ed2-47ad-1faaf02e1fcb	4206	Zgornje Jezersko
00050000-55f9-1ed2-28c2-1b5059f21813	2285	Zgornji Leskovec
00050000-55f9-1ed2-45db-bcdc8344ead3	1432	Zidani Most
00050000-55f9-1ed2-36f0-8cb969abb4ac	3214	Zreče
00050000-55f9-1ed2-8f0a-2c962b1a9db9	4209	Žabnica
00050000-55f9-1ed2-a21d-25cc979142e7	3310	Žalec
00050000-55f9-1ed2-dfbf-63a54e2d80f3	4228	Železniki
00050000-55f9-1ed2-4dc7-c883df30fb33	2287	Žetale
00050000-55f9-1ed2-9bd0-57a47af77251	4226	Žiri
00050000-55f9-1ed2-7412-2064f7943e11	4274	Žirovnica
00050000-55f9-1ed2-1fc1-6c9b06ffe206	8360	Žužemberk
\.


--
-- TOC entry 2933 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19830029)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19829661)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19829468)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f9-1ed4-00a2-c118422c8fdf	00080000-55f9-1ed3-0059-0edeb2f7df1a	\N	00040000-55f9-1ed2-dfa3-6f4056fff910	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f9-1ed4-e004-5ef8f036ad20	00080000-55f9-1ed3-0059-0edeb2f7df1a	\N	00040000-55f9-1ed2-dfa3-6f4056fff910	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f9-1ed4-f653-d6db074aec3a	00080000-55f9-1ed3-aaaa-7321f967f9ab	\N	00040000-55f9-1ed2-dfa3-6f4056fff910	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2955 (class 0 OID 19829546)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 19829673)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 19830043)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 19830053)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f9-1ed4-751a-062fe67b943f	00080000-55f9-1ed3-b45c-86cb3fc27ec4	0987	AK
00190000-55f9-1ed4-57cd-0bbfb74c39d4	00080000-55f9-1ed3-aaaa-7321f967f9ab	0989	AK
00190000-55f9-1ed4-99ca-54873e5f3e20	00080000-55f9-1ed3-b595-9de1a370ca63	0986	AK
00190000-55f9-1ed4-aab0-11dd8918d96f	00080000-55f9-1ed3-1e0a-67103fd33155	0984	AK
00190000-55f9-1ed4-e34a-aa4e6ef10f39	00080000-55f9-1ed3-1d2d-188b536fa18c	0983	AK
00190000-55f9-1ed4-563c-5616780d898b	00080000-55f9-1ed3-32dc-fa1240e71dc1	0982	AK
00190000-55f9-1ed5-4b37-dfb5f45903da	00080000-55f9-1ed5-96af-c3ac6223100c	1001	AK
\.


--
-- TOC entry 2991 (class 0 OID 19829986)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f9-1ed4-09de-ff4c8429b359	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2995 (class 0 OID 19830061)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19829702)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f9-1ed3-8054-3b6974a5c7b1	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f9-1ed3-96ac-3793931dcd27	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f9-1ed3-22d0-f2ce729c3936	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f9-1ed3-4b43-c757ae1ab7df	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f9-1ed3-9290-c8b08c9ba74c	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f9-1ed3-297b-cb51da435798	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f9-1ed3-910b-683ca103be7f	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2964 (class 0 OID 19829646)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 19829636)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19829839)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19829776)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 19829341)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f9-1ed5-96af-c3ac6223100c	00010000-55f9-1ed3-8a51-bc5c93401396	2015-09-16 09:48:37	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f9-1ed5-1b20-f1b32e70f7da	00010000-55f9-1ed3-8a51-bc5c93401396	2015-09-16 09:48:37	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f9-1ed5-4b37-dfb5f45903da	00010000-55f9-1ed3-8a51-bc5c93401396	2015-09-16 09:48:37	INS	a:0:{}
\.


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2973 (class 0 OID 19829715)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 19829379)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f9-1ed2-d491-92673f107514	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f9-1ed2-0b76-d8e7b70acfb8	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f9-1ed2-8816-4b75390a51d2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f9-1ed2-7a6b-20aaa38d353f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f9-1ed2-f658-d746b1fe181a	planer	Planer dogodkov v koledarju	t
00020000-55f9-1ed2-6775-22739ea13f68	kadrovska	Kadrovska služba	t
00020000-55f9-1ed2-e9da-3197189848d4	arhivar	Ažuriranje arhivalij	t
00020000-55f9-1ed2-f9be-c425bb8e2864	igralec	Igralec	t
00020000-55f9-1ed2-95ea-2cd6f33ba971	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f9-1ed3-1582-e5d99e531103	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2940 (class 0 OID 19829363)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f9-1ed3-2d6f-14e7d5e9dcdf	00020000-55f9-1ed2-8816-4b75390a51d2
00010000-55f9-1ed3-8a51-bc5c93401396	00020000-55f9-1ed2-8816-4b75390a51d2
00010000-55f9-1ed4-9e2e-29931987f9d0	00020000-55f9-1ed3-1582-e5d99e531103
\.


--
-- TOC entry 2975 (class 0 OID 19829729)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19829667)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19829613)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 19829328)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f9-1ed2-224d-0808d6d8a967	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f9-1ed2-e81f-21f9c9c97aea	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f9-1ed2-3fb5-8f7e8a39a414	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f9-1ed2-6e6e-cd7863362d8b	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f9-1ed2-6544-a7add00060c1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2935 (class 0 OID 19829320)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f9-1ed2-2f22-b0bb3ae131fa	00230000-55f9-1ed2-6e6e-cd7863362d8b	popa
00240000-55f9-1ed2-4d57-755ad8a80db9	00230000-55f9-1ed2-6e6e-cd7863362d8b	oseba
00240000-55f9-1ed2-fdf7-d6bae36dca40	00230000-55f9-1ed2-6e6e-cd7863362d8b	sezona
00240000-55f9-1ed2-058c-745fa057132c	00230000-55f9-1ed2-e81f-21f9c9c97aea	prostor
00240000-55f9-1ed2-8a54-d7c15e7b4925	00230000-55f9-1ed2-6e6e-cd7863362d8b	besedilo
00240000-55f9-1ed2-c918-dac7426b27b0	00230000-55f9-1ed2-6e6e-cd7863362d8b	uprizoritev
00240000-55f9-1ed2-1a0d-6cabab70db60	00230000-55f9-1ed2-6e6e-cd7863362d8b	funkcija
00240000-55f9-1ed2-447e-cfdbc9c95427	00230000-55f9-1ed2-6e6e-cd7863362d8b	tipfunkcije
00240000-55f9-1ed2-9be2-473bddfe1e4c	00230000-55f9-1ed2-6e6e-cd7863362d8b	alternacija
00240000-55f9-1ed2-8f69-fd56968a8a83	00230000-55f9-1ed2-224d-0808d6d8a967	pogodba
00240000-55f9-1ed2-dc62-d43f7a18e635	00230000-55f9-1ed2-6e6e-cd7863362d8b	zaposlitev
00240000-55f9-1ed2-1779-74f7ae22ac78	00230000-55f9-1ed2-6e6e-cd7863362d8b	zvrstuprizoritve
00240000-55f9-1ed2-3012-4405c36a55fe	00230000-55f9-1ed2-224d-0808d6d8a967	programdela
00240000-55f9-1ed2-179a-69d3e4cef9d4	00230000-55f9-1ed2-6e6e-cd7863362d8b	zapis
\.


--
-- TOC entry 2934 (class 0 OID 19829315)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
538c522d-0414-4519-a8d6-7e0445fb1e65	00240000-55f9-1ed2-2f22-b0bb3ae131fa	0	1001
\.


--
-- TOC entry 2980 (class 0 OID 19829786)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f9-1ed4-3407-b18c396b6cd2	000e0000-55f9-1ed4-afba-6892ce15be5e	00080000-55f9-1ed3-0059-0edeb2f7df1a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f9-1ed2-f399-d62041194b22
00270000-55f9-1ed4-7b44-a2860d088b7a	000e0000-55f9-1ed4-afba-6892ce15be5e	00080000-55f9-1ed3-0059-0edeb2f7df1a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f9-1ed2-f399-d62041194b22
\.


--
-- TOC entry 2947 (class 0 OID 19829441)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 19829623)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f9-1ed4-6e16-1b27eab3d3fb	00180000-55f9-1ed4-daed-d3ccab5ac244	000c0000-55f9-1ed4-157a-9108406a5e29	00090000-55f9-1ed4-c1d9-3ce541f68c06	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f9-1ed4-782e-ec0aa3028817	00180000-55f9-1ed4-daed-d3ccab5ac244	000c0000-55f9-1ed4-0dfa-e40cae8bd6a9	00090000-55f9-1ed4-de8a-99f9927d61a6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f9-1ed4-16ca-a624467db563	00180000-55f9-1ed4-daed-d3ccab5ac244	000c0000-55f9-1ed4-522b-30e4c45aba1e	00090000-55f9-1ed4-77b5-542503dea75a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f9-1ed4-3608-329d9e02516c	00180000-55f9-1ed4-daed-d3ccab5ac244	000c0000-55f9-1ed4-6edf-90529b901d29	00090000-55f9-1ed4-c6af-de9edaf57f80	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f9-1ed4-9f7f-37222e6aaef1	00180000-55f9-1ed4-daed-d3ccab5ac244	000c0000-55f9-1ed4-c268-175643e7de17	00090000-55f9-1ed4-1ff5-5e9d95197aaa	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f9-1ed4-d3f3-9ae6604f6021	00180000-55f9-1ed4-77e7-2435a7dcdd38	\N	00090000-55f9-1ed4-1ff5-5e9d95197aaa	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2983 (class 0 OID 19829827)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f9-1ed2-8449-0575d41d65a0	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f9-1ed2-27da-4e78f843900f	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f9-1ed2-5e82-fe29a0fc971a	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f9-1ed2-e2e4-9cbb9211c023	04	Režija	Režija	Režija	umetnik
000f0000-55f9-1ed2-7f6f-89015c67f2ef	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f9-1ed2-a1be-3488a864f9e2	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f9-1ed2-fe35-dc10d6db5ef6	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f9-1ed2-11ac-43d5b975187e	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f9-1ed2-3689-5be19590d353	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f9-1ed2-acd5-eed7a5bad387	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f9-1ed2-d76c-2c1b508aca8f	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f9-1ed2-2185-b4de72d5a7e6	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f9-1ed2-b5ab-ee0f9f6da455	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f9-1ed2-4790-73dad5c9672a	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f9-1ed2-5295-4abaa274f9ca	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f9-1ed2-450b-30428ee3cd39	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f9-1ed2-3f31-221e84a21c3e	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f9-1ed2-e191-061657009289	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2996 (class 0 OID 19830071)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f9-1ed2-68d7-18417080aaa3	01	Velika predstava	f	1.00	1.00
002b0000-55f9-1ed2-dd31-2129fff5e788	02	Mala predstava	f	0.50	0.50
002b0000-55f9-1ed2-2318-8fd41cd6e982	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f9-1ed2-f449-54010bdda15e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f9-1ed2-ad01-8da76f17abf4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2952 (class 0 OID 19829503)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 19829350)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f9-1ed3-8a51-bc5c93401396	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROfcq0bztCcuzRvDx7FVbwGIJAZhiJnyy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f9-1ed3-76f5-c29958ba5a88	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f9-1ed3-cf4e-3bafa342eed0	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f9-1ed3-15f7-57b5cfb0c3c7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f9-1ed4-839a-e8656db8ce7d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f9-1ed4-1af3-63bdbb7311dd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f9-1ed4-859e-a5f8727c2510	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f9-1ed4-dd0a-34cbb4a81a8f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f9-1ed4-f358-1087cd6d5782	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f9-1ed4-6c31-e1d37122d442	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f9-1ed4-9e2e-29931987f9d0	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f9-1ed3-2d6f-14e7d5e9dcdf	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 19829876)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f9-1ed4-e215-e36ad4e5e63b	00160000-55f9-1ed3-d274-84173e0ad7ba	\N	00140000-55f9-1ed2-745d-0ca6d0a0cea4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f9-1ed3-9290-c8b08c9ba74c
000e0000-55f9-1ed4-afba-6892ce15be5e	00160000-55f9-1ed3-bf7e-06c181f4974f	\N	00140000-55f9-1ed2-855c-44411740522f	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f9-1ed3-297b-cb51da435798
000e0000-55f9-1ed4-945c-19118fca3fd7	\N	\N	00140000-55f9-1ed2-855c-44411740522f	00190000-55f9-1ed4-751a-062fe67b943f	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f9-1ed3-9290-c8b08c9ba74c
000e0000-55f9-1ed4-c28d-268384cb0bcf	\N	\N	00140000-55f9-1ed2-855c-44411740522f	00190000-55f9-1ed4-751a-062fe67b943f	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f9-1ed3-9290-c8b08c9ba74c
000e0000-55f9-1ed4-5e44-0abd1bd80813	\N	\N	00140000-55f9-1ed2-855c-44411740522f	00190000-55f9-1ed4-751a-062fe67b943f	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f9-1ed3-8054-3b6974a5c7b1
000e0000-55f9-1ed4-a708-e075d3000d48	\N	\N	00140000-55f9-1ed2-855c-44411740522f	00190000-55f9-1ed4-751a-062fe67b943f	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f9-1ed3-8054-3b6974a5c7b1
\.


--
-- TOC entry 2957 (class 0 OID 19829567)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f9-1ed4-7ce4-669cb41eea12	000e0000-55f9-1ed4-afba-6892ce15be5e	\N	1	
00200000-55f9-1ed4-71be-b7000ba97975	000e0000-55f9-1ed4-afba-6892ce15be5e	\N	2	
00200000-55f9-1ed4-4308-e60f22510bc1	000e0000-55f9-1ed4-afba-6892ce15be5e	\N	3	
00200000-55f9-1ed4-3c02-2d428be67f7b	000e0000-55f9-1ed4-afba-6892ce15be5e	\N	4	
00200000-55f9-1ed4-895a-1bfbb9d30a3a	000e0000-55f9-1ed4-afba-6892ce15be5e	\N	5	
\.


--
-- TOC entry 2971 (class 0 OID 19829694)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 19829800)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f9-1ed2-43d0-30b40c983d67	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f9-1ed2-d19f-015a4036d668	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f9-1ed2-870b-3ed302c2c89e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f9-1ed2-4542-28c13483eeb4	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f9-1ed2-b2c2-00afd8e946ae	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f9-1ed2-441e-fe560cf2a5b7	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f9-1ed2-a5ce-3301e2e46932	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f9-1ed2-be30-825d0d55adeb	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f9-1ed2-f399-d62041194b22	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f9-1ed2-acd0-8d29e7e6dc95	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f9-1ed2-72d8-aa89e3f82161	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f9-1ed2-58ac-c2dee642ddd6	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f9-1ed2-0ace-b67bdb38cbea	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f9-1ed2-7893-338defa8a091	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f9-1ed2-7367-ab21a7579ba2	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f9-1ed2-cb32-06468e9a6c29	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f9-1ed2-98d6-4f1b5c6fe62c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f9-1ed2-1e58-b550c15f803e	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f9-1ed2-7a9b-343a5f5f971e	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f9-1ed2-d446-ed37220c3df4	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f9-1ed2-54ee-46c8d7f0114d	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f9-1ed2-b38b-9dd676a634eb	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f9-1ed2-7ca2-f1a9906aca3d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f9-1ed2-0ebc-618da6bcbe16	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f9-1ed2-2372-59b8a6bf5093	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f9-1ed2-6d86-c17a90d84a8d	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f9-1ed2-d153-a7d4cec01ab5	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f9-1ed2-4824-baf62eba932f	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2999 (class 0 OID 19830118)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 19830090)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19830130)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 19829766)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f9-1ed4-ecd0-71662a9351fa	00090000-55f9-1ed4-de8a-99f9927d61a6	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f9-1ed4-8617-f36c404731b9	00090000-55f9-1ed4-77b5-542503dea75a	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f9-1ed4-0d51-4cec9878a733	00090000-55f9-1ed4-c4cd-c99d88c3d670	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f9-1ed4-f341-1130dd64e7cb	00090000-55f9-1ed4-7ae3-68ffe321be80	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f9-1ed4-4167-32dfcfbb3124	00090000-55f9-1ed4-c1d9-3ce541f68c06	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f9-1ed4-1b33-5b2d0d960e4d	00090000-55f9-1ed4-c525-8aaecb4b95fe	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2959 (class 0 OID 19829603)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 19829866)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f9-1ed2-745d-0ca6d0a0cea4	01	Drama	drama (SURS 01)
00140000-55f9-1ed2-e176-5012f4513f25	02	Opera	opera (SURS 02)
00140000-55f9-1ed2-ea5a-be833e9c1b23	03	Balet	balet (SURS 03)
00140000-55f9-1ed2-8bdc-feddc8f2f5f0	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f9-1ed2-28d1-19588940545a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f9-1ed2-855c-44411740522f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f9-1ed2-ffda-d8ecf1aef922	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2977 (class 0 OID 19829756)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2485 (class 2606 OID 19829404)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 19829925)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 19829915)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 19829825)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 19830170)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 19829592)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 19829612)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 19830088)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 19829529)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 19829980)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 19829752)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 19829565)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 19829543)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 19829659)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 19830147)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 19830154)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2725 (class 2606 OID 19830178)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 19829686)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 19829501)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 19829413)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 19829437)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 19829393)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2476 (class 2606 OID 19829378)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 19829692)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 19829728)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 19829861)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 19829465)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 19829489)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 18175937)
-- Name: postavkac2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkac2
    ADD CONSTRAINT postavkac2_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 19830041)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 19829665)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 19829479)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 19829553)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 19829677)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 19830050)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 19830058)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 19830028)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 19830069)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 19829710)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 19829650)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 19829641)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 19829849)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 19829783)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 19829349)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 19829719)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 19829367)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2478 (class 2606 OID 19829387)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 19829737)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 19829672)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 19829621)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 19829337)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 19829325)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 19829319)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 19829796)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 19829446)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 19829632)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 19829836)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 19830081)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 19829514)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 19829362)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 19829894)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 19829575)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 19829700)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 19829808)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 19830128)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 19830112)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 19830136)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 19829774)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 19829607)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 19829874)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 19829764)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 1259 OID 19829601)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2541 (class 1259 OID 19829602)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2542 (class 1259 OID 19829600)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2543 (class 1259 OID 19829599)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2544 (class 1259 OID 19829598)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2625 (class 1259 OID 19829797)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2626 (class 1259 OID 19829798)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 19829799)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2711 (class 1259 OID 19830149)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2712 (class 1259 OID 19830148)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2499 (class 1259 OID 19829467)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2588 (class 1259 OID 19829693)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2698 (class 1259 OID 19830116)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2699 (class 1259 OID 19830115)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2700 (class 1259 OID 19830117)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2701 (class 1259 OID 19830114)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2702 (class 1259 OID 19830113)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2582 (class 1259 OID 19829679)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2583 (class 1259 OID 19829678)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2535 (class 1259 OID 19829576)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19829753)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 19829755)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2614 (class 1259 OID 19829754)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2524 (class 1259 OID 19829545)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2525 (class 1259 OID 19829544)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2689 (class 1259 OID 19830070)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2641 (class 1259 OID 19829863)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 19829864)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2643 (class 1259 OID 19829865)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2708 (class 1259 OID 19830137)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2650 (class 1259 OID 19829899)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2651 (class 1259 OID 19829896)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2652 (class 1259 OID 19829900)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2653 (class 1259 OID 19829898)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2654 (class 1259 OID 19829897)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2514 (class 1259 OID 19829516)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2515 (class 1259 OID 19829515)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2490 (class 1259 OID 19829440)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2600 (class 1259 OID 19829720)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2480 (class 1259 OID 19829394)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2481 (class 1259 OID 19829395)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2605 (class 1259 OID 19829740)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2606 (class 1259 OID 19829739)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2607 (class 1259 OID 19829738)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2528 (class 1259 OID 19829554)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2529 (class 1259 OID 19829555)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2460 (class 1259 OID 19829327)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2562 (class 1259 OID 19829645)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2563 (class 1259 OID 19829643)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2564 (class 1259 OID 19829642)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2565 (class 1259 OID 19829644)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2471 (class 1259 OID 19829368)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2472 (class 1259 OID 19829369)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2591 (class 1259 OID 19829701)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2721 (class 1259 OID 19830171)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2722 (class 1259 OID 19830179)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2723 (class 1259 OID 19830180)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2577 (class 1259 OID 19829666)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2621 (class 1259 OID 19829784)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2622 (class 1259 OID 19829785)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2671 (class 1259 OID 19829985)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2672 (class 1259 OID 19829984)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2673 (class 1259 OID 19829981)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2674 (class 1259 OID 19829982)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2675 (class 1259 OID 19829983)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2503 (class 1259 OID 19829481)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2504 (class 1259 OID 19829480)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2505 (class 1259 OID 19829482)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2594 (class 1259 OID 19829714)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2595 (class 1259 OID 19829713)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2681 (class 1259 OID 19830051)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 19830052)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2664 (class 1259 OID 19829929)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2665 (class 1259 OID 19829930)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2666 (class 1259 OID 19829927)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2667 (class 1259 OID 19829928)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2618 (class 1259 OID 19829775)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2568 (class 1259 OID 19829654)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2569 (class 1259 OID 19829653)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2570 (class 1259 OID 19829651)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2571 (class 1259 OID 19829652)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2660 (class 1259 OID 19829917)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2661 (class 1259 OID 19829916)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2534 (class 1259 OID 19829566)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2678 (class 1259 OID 19830042)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2455 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2697 (class 1259 OID 19830089)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2715 (class 1259 OID 19830155)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2716 (class 1259 OID 19830156)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2486 (class 1259 OID 19829415)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2487 (class 1259 OID 19829414)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2495 (class 1259 OID 19829447)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2496 (class 1259 OID 19829448)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2557 (class 1259 OID 19829635)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 19829634)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2559 (class 1259 OID 19829633)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 19829594)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2546 (class 1259 OID 19829595)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2547 (class 1259 OID 19829593)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2548 (class 1259 OID 19829597)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2549 (class 1259 OID 19829596)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2502 (class 1259 OID 19829466)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19829530)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 19829532)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2522 (class 1259 OID 19829531)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2523 (class 1259 OID 19829533)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2576 (class 1259 OID 19829660)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2646 (class 1259 OID 19829862)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 19829895)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19829837)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 19829838)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2493 (class 1259 OID 19829438)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2494 (class 1259 OID 19829439)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2615 (class 1259 OID 19829765)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 19829338)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2513 (class 1259 OID 19829502)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2463 (class 1259 OID 19829326)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2694 (class 1259 OID 19830082)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 19829712)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2599 (class 1259 OID 19829711)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 19829926)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 19829490)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 19829875)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 19830129)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2687 (class 1259 OID 19830059)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 19830060)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2634 (class 1259 OID 19829826)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2556 (class 1259 OID 19829622)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 19829388)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2754 (class 2606 OID 19830301)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2753 (class 2606 OID 19830306)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2749 (class 2606 OID 19830326)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2755 (class 2606 OID 19830296)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2751 (class 2606 OID 19830316)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2750 (class 2606 OID 19830321)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2752 (class 2606 OID 19830311)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2787 (class 2606 OID 19830476)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2786 (class 2606 OID 19830481)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2785 (class 2606 OID 19830486)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2819 (class 2606 OID 19830651)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2820 (class 2606 OID 19830646)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2737 (class 2606 OID 19830236)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 19830406)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2814 (class 2606 OID 19830631)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2815 (class 2606 OID 19830626)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2813 (class 2606 OID 19830636)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 19830621)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2817 (class 2606 OID 19830616)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2769 (class 2606 OID 19830401)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2770 (class 2606 OID 19830396)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2748 (class 2606 OID 19830291)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2781 (class 2606 OID 19830446)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 19830456)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2780 (class 2606 OID 19830451)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2743 (class 2606 OID 19830271)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2744 (class 2606 OID 19830266)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2767 (class 2606 OID 19830386)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2811 (class 2606 OID 19830606)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2790 (class 2606 OID 19830491)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 19830496)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2788 (class 2606 OID 19830501)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2818 (class 2606 OID 19830641)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2792 (class 2606 OID 19830521)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2795 (class 2606 OID 19830506)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2791 (class 2606 OID 19830526)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2793 (class 2606 OID 19830516)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2794 (class 2606 OID 19830511)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2741 (class 2606 OID 19830261)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 19830256)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2733 (class 2606 OID 19830221)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2734 (class 2606 OID 19830216)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2775 (class 2606 OID 19830426)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2730 (class 2606 OID 19830196)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2729 (class 2606 OID 19830201)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2776 (class 2606 OID 19830441)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2777 (class 2606 OID 19830436)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2778 (class 2606 OID 19830431)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2746 (class 2606 OID 19830276)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2745 (class 2606 OID 19830281)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2726 (class 2606 OID 19830181)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2759 (class 2606 OID 19830361)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2761 (class 2606 OID 19830351)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2762 (class 2606 OID 19830346)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2760 (class 2606 OID 19830356)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 19830186)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2727 (class 2606 OID 19830191)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2772 (class 2606 OID 19830411)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2823 (class 2606 OID 19830666)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2825 (class 2606 OID 19830671)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2824 (class 2606 OID 19830676)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2768 (class 2606 OID 19830391)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2784 (class 2606 OID 19830466)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2783 (class 2606 OID 19830471)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 19830581)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 19830576)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2806 (class 2606 OID 19830561)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2805 (class 2606 OID 19830566)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2804 (class 2606 OID 19830571)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2739 (class 2606 OID 19830246)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 19830241)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 19830251)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2773 (class 2606 OID 19830421)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2774 (class 2606 OID 19830416)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 19830591)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2808 (class 2606 OID 19830596)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2799 (class 2606 OID 19830551)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2798 (class 2606 OID 19830556)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2801 (class 2606 OID 19830541)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2800 (class 2606 OID 19830546)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2782 (class 2606 OID 19830461)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 19830381)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2764 (class 2606 OID 19830376)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2766 (class 2606 OID 19830366)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2765 (class 2606 OID 19830371)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2796 (class 2606 OID 19830536)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 19830531)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2747 (class 2606 OID 19830286)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2807 (class 2606 OID 19830586)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2810 (class 2606 OID 19830601)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2812 (class 2606 OID 19830611)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2822 (class 2606 OID 19830656)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2821 (class 2606 OID 19830661)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2731 (class 2606 OID 19830211)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2732 (class 2606 OID 19830206)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2736 (class 2606 OID 19830226)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2735 (class 2606 OID 19830231)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 19830341)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 19830336)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2758 (class 2606 OID 19830331)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-16 09:48:38 CEST

--
-- PostgreSQL database dump complete
--

