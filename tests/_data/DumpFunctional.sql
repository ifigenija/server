--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-11 16:09:47 CEST

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
-- TOC entry 181 (class 1259 OID 19017402)
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
-- TOC entry 226 (class 1259 OID 19017921)
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
-- TOC entry 225 (class 1259 OID 19017904)
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
-- TOC entry 219 (class 1259 OID 19017812)
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
-- TOC entry 240 (class 1259 OID 19018159)
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
-- TOC entry 195 (class 1259 OID 19017580)
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
-- TOC entry 197 (class 1259 OID 19017611)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19018085)
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
-- TOC entry 190 (class 1259 OID 19017523)
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
-- TOC entry 227 (class 1259 OID 19017934)
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
-- TOC entry 213 (class 1259 OID 19017744)
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
-- TOC entry 193 (class 1259 OID 19017559)
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
-- TOC entry 191 (class 1259 OID 19017540)
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
-- TOC entry 202 (class 1259 OID 19017658)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19018140)
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
-- TOC entry 239 (class 1259 OID 19018152)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19018174)
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
-- TOC entry 206 (class 1259 OID 19017683)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19017497)
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
-- TOC entry 182 (class 1259 OID 19017411)
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
-- TOC entry 183 (class 1259 OID 19017422)
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
-- TOC entry 178 (class 1259 OID 19017376)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19017395)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19017690)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19017724)
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
-- TOC entry 222 (class 1259 OID 19017853)
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
-- TOC entry 185 (class 1259 OID 19017455)
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
-- TOC entry 187 (class 1259 OID 19017489)
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
-- TOC entry 229 (class 1259 OID 19018032)
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
-- TOC entry 203 (class 1259 OID 19017664)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19017474)
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
-- TOC entry 192 (class 1259 OID 19017552)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 19017676)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19018046)
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
-- TOC entry 231 (class 1259 OID 19018056)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19017989)
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
-- TOC entry 232 (class 1259 OID 19018064)
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
-- TOC entry 209 (class 1259 OID 19017705)
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
-- TOC entry 201 (class 1259 OID 19017649)
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
-- TOC entry 200 (class 1259 OID 19017639)
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
-- TOC entry 221 (class 1259 OID 19017842)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19017779)
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
-- TOC entry 175 (class 1259 OID 19017347)
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
-- TOC entry 174 (class 1259 OID 19017345)
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
-- TOC entry 210 (class 1259 OID 19017718)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19017385)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19017369)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19017732)
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
-- TOC entry 204 (class 1259 OID 19017670)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19017616)
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
-- TOC entry 173 (class 1259 OID 19017334)
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
-- TOC entry 172 (class 1259 OID 19017326)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19017321)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19017789)
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
-- TOC entry 184 (class 1259 OID 19017447)
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
-- TOC entry 199 (class 1259 OID 19017626)
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
-- TOC entry 220 (class 1259 OID 19017830)
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
-- TOC entry 233 (class 1259 OID 19018074)
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
-- TOC entry 189 (class 1259 OID 19017509)
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
-- TOC entry 176 (class 1259 OID 19017356)
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
-- TOC entry 224 (class 1259 OID 19017879)
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
-- TOC entry 194 (class 1259 OID 19017570)
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
-- TOC entry 208 (class 1259 OID 19017697)
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
-- TOC entry 218 (class 1259 OID 19017803)
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
-- TOC entry 236 (class 1259 OID 19018120)
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
-- TOC entry 235 (class 1259 OID 19018092)
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
-- TOC entry 237 (class 1259 OID 19018132)
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
-- TOC entry 215 (class 1259 OID 19017769)
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
-- TOC entry 196 (class 1259 OID 19017606)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19017869)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19017759)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 19017350)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 19017402)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 19017921)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f2-e0aa-0850-ea959490cc12	000d0000-55f2-e0aa-ff95-0b24ddc9d612	\N	00090000-55f2-e0aa-bb7c-b62324cc0b30	000b0000-55f2-e0aa-8e92-4e8820d161ac	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f2-e0aa-bdb5-847c4f082549	000d0000-55f2-e0aa-b4a5-ac8e5ce01dc5	00100000-55f2-e0aa-ba12-bb114d70a656	00090000-55f2-e0aa-1ba7-2352ff3e5c70	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f2-e0aa-182a-e27bd4202c9d	000d0000-55f2-e0aa-84c6-a6583c570c75	00100000-55f2-e0aa-f5ea-17563e83f85d	00090000-55f2-e0aa-8685-d038d5b67903	\N	0003	t	\N	2015-09-11	\N	2	t	\N	f	f
000c0000-55f2-e0aa-9a18-a02b203ddeba	000d0000-55f2-e0aa-daf4-91bb7d4c0677	\N	00090000-55f2-e0aa-1426-a02e17591fc6	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f2-e0aa-0ee7-43b4d932fb22	000d0000-55f2-e0aa-4284-44ac150d7848	\N	00090000-55f2-e0aa-2dc4-ebe078ce74dd	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f2-e0aa-a38c-58f768f41fed	000d0000-55f2-e0aa-9c44-cf43740c7ac6	\N	00090000-55f2-e0aa-95af-7b95137fc412	000b0000-55f2-e0aa-c456-af57fd13ae1b	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f2-e0aa-8e2e-66d77602d951	000d0000-55f2-e0aa-5193-8b1303567eb7	00100000-55f2-e0aa-0239-d19d9cd096f5	00090000-55f2-e0aa-2cac-32c4b7a0ee4c	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f2-e0aa-8741-6ad788ba4210	000d0000-55f2-e0aa-d842-43abcf37f122	\N	00090000-55f2-e0aa-8e7b-63614ab6abaa	000b0000-55f2-e0aa-5dc2-676974d5f853	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f2-e0aa-6be3-5062b753e93a	000d0000-55f2-e0aa-5193-8b1303567eb7	00100000-55f2-e0aa-16d9-bedf52e87ad5	00090000-55f2-e0aa-f53b-cddb08e5fc25	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f2-e0aa-0876-6173fc15a1dc	000d0000-55f2-e0aa-5193-8b1303567eb7	00100000-55f2-e0aa-b7d3-6cbf57bc8640	00090000-55f2-e0aa-d37e-7f8c483d2d36	\N	0010	t	\N	2015-09-11	\N	16	f	\N	f	t
000c0000-55f2-e0aa-0269-0ff71028ab8f	000d0000-55f2-e0aa-5193-8b1303567eb7	00100000-55f2-e0aa-7e0b-0c1a4233f1ba	00090000-55f2-e0aa-a2d2-cd0f92cd09c2	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f2-e0aa-16aa-33ce4cf0061d	000d0000-55f2-e0aa-cb07-2746e7d0905c	\N	00090000-55f2-e0aa-1ba7-2352ff3e5c70	000b0000-55f2-e0aa-e004-2ac1d632e67b	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2986 (class 0 OID 19017904)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 19017812)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f2-e0a9-98eb-431521259c34	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f2-e0a9-cf44-1c52b72bfba6	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f2-e0a9-63b6-c9436d1b52ab	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 19018159)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 19017580)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f2-e0aa-5a42-f9ab5cf7a5e0	\N	\N	00200000-55f2-e0aa-6da5-832b17926695	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f2-e0aa-36d0-dc9ddc36b1ea	\N	\N	00200000-55f2-e0aa-d5f1-e80b3d14f6f0	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f2-e0aa-0907-44eefbf19569	\N	\N	00200000-55f2-e0aa-f442-83b0303e6cc8	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f2-e0aa-c89d-7b1fc5248b58	\N	\N	00200000-55f2-e0aa-8b90-3cc9da29f088	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f2-e0aa-3b10-8b6b74c3ce93	\N	\N	00200000-55f2-e0aa-c03d-735f0fc52465	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2958 (class 0 OID 19017611)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 19018085)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19017523)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f2-e0a8-8611-65475f4e5088	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f2-e0a8-d7a1-32edcd13c0bc	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f2-e0a8-4a80-43432ee26fcf	AL	ALB	008	Albania 	Albanija	\N
00040000-55f2-e0a8-4c65-1aa6595e7729	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f2-e0a8-0dc7-1ccdb5511e05	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f2-e0a8-f3ac-1d8e650073f2	AD	AND	020	Andorra 	Andora	\N
00040000-55f2-e0a8-ee10-d516a362aa70	AO	AGO	024	Angola 	Angola	\N
00040000-55f2-e0a8-976f-f23bb7633ddb	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f2-e0a8-0b18-84a5fd1a55ec	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f2-e0a8-56c1-e8e4e1a48b8e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f2-e0a8-e944-f49f9301b6e9	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f2-e0a8-2cc6-ecf2e966f28a	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f2-e0a8-f5fc-9ace2ff6a8fb	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f2-e0a8-fdc1-1033d8d08f71	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f2-e0a8-3568-a3dea8be34b7	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f2-e0a8-a97a-d6204e27931a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f2-e0a8-59a2-cc5b4b95cd5b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f2-e0a8-a797-a76df7eab132	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f2-e0a8-0d01-cd344816ea55	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f2-e0a8-2f14-7cdfee9f28f3	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f2-e0a8-4f34-7559351da226	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f2-e0a8-d030-5afc6678da3a	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f2-e0a8-e332-345e570cd90f	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f2-e0a8-b8a9-4eb2985dbeb3	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f2-e0a8-545d-aeebc7d385de	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f2-e0a8-fd52-69d12aa3211f	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f2-e0a8-73eb-a4a32b59c8d0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f2-e0a8-3f52-96fbac098cbb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f2-e0a8-ec5e-cad260d15e49	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f2-e0a8-d8ac-74061c3b59cf	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f2-e0a8-d8ca-d10590e7767b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f2-e0a8-f909-b3708a1d3e4f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f2-e0a8-add3-364ae9059a5a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f2-e0a8-e38e-5a72a0fcaff0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f2-e0a8-6d6f-8fcfe84ec46f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f2-e0a8-89d4-ab5a7d84782d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f2-e0a8-317c-04aaf086c899	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f2-e0a8-9e0c-e5a85ba07f34	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f2-e0a8-ebfb-18dee34a986b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f2-e0a8-bfb9-3b8c420b4f92	CA	CAN	124	Canada 	Kanada	\N
00040000-55f2-e0a8-695e-7ce2cdf79aee	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f2-e0a8-bd6c-afa1b80c894f	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f2-e0a8-b115-e9c2dbb5e3df	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f2-e0a8-e6a8-5fdb63071e34	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f2-e0a8-46d5-cf97aa48d992	CL	CHL	152	Chile 	Čile	\N
00040000-55f2-e0a8-2e4d-828796cbfdcc	CN	CHN	156	China 	Kitajska	\N
00040000-55f2-e0a8-429d-74610b98ef8c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f2-e0a8-8593-177c6551e009	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f2-e0a8-36f1-88ad98a6d178	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f2-e0a8-96df-33b6980d046d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f2-e0a8-1dda-299563964afa	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f2-e0a8-7932-b952d03aaac3	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f2-e0a8-3ccf-f4494a6acf54	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f2-e0a8-e578-1465e8e28433	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f2-e0a8-2ee8-911f5e5b73ec	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f2-e0a8-0dff-aeff7a139e39	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f2-e0a8-813f-1074c33afa24	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f2-e0a8-cad3-aac37fdf3244	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f2-e0a8-9355-4da452240dad	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f2-e0a8-f538-dd868ba2df94	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f2-e0a8-44c1-7f113b0ddaaf	DK	DNK	208	Denmark 	Danska	\N
00040000-55f2-e0a8-fa59-6c75f7cd72f8	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f2-e0a8-990c-11562e171f1f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f2-e0a8-e6ab-f5ebaa54df74	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f2-e0a8-88f2-2378ef468a6c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f2-e0a8-3889-196875c78959	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f2-e0a8-daea-dc2a7151edd1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f2-e0a8-b1f2-6853a30a2301	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f2-e0a8-99dd-fde223a84005	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f2-e0a8-8ff9-31a2eed68469	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f2-e0a8-a306-ce888425c6ee	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f2-e0a8-d036-e1c2b1be50b8	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f2-e0a8-e30c-5e4cafa08c78	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f2-e0a8-fdff-faaf04091282	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f2-e0a8-2bb9-1a4996a686e1	FI	FIN	246	Finland 	Finska	\N
00040000-55f2-e0a8-5bb4-66419a0c05a6	FR	FRA	250	France 	Francija	\N
00040000-55f2-e0a8-a446-1c6c12a7d3de	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f2-e0a8-42a4-b2f63916f837	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f2-e0a8-2794-dd95fb929338	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f2-e0a8-f4b4-52f450c65eb0	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f2-e0a8-88c0-8abadbf343e8	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f2-e0a8-c882-ad236bb32ee7	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f2-e0a8-0f2e-96e82b8a4d0a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f2-e0a8-a2c4-e1663606def8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f2-e0a8-b7c5-90a9e9ac8afa	GH	GHA	288	Ghana 	Gana	\N
00040000-55f2-e0a8-35d2-b59e10cff5ab	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f2-e0a8-55ec-8e89a331e124	GR	GRC	300	Greece 	Grčija	\N
00040000-55f2-e0a8-3538-6f4abe916a57	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f2-e0a8-d295-4b860c32ebdf	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f2-e0a8-e21a-1f6ae276ec52	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f2-e0a8-815c-190fe9542dba	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f2-e0a8-1993-72527d5b22fe	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f2-e0a8-08fd-57d173d1c3d8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f2-e0a8-ce6b-0abe8cc535a5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f2-e0a8-23f1-f2654b6737a8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f2-e0a8-4309-a2329632b024	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f2-e0a8-052e-1fa2e1aae544	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f2-e0a8-fd37-5d1c3eadd795	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f2-e0a8-e44e-b356aa015b89	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f2-e0a8-0737-288347975cdf	HN	HND	340	Honduras 	Honduras	\N
00040000-55f2-e0a8-6dcb-0385de078aed	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f2-e0a8-c370-04429d786843	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f2-e0a8-ad3e-3e521d12fcc2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f2-e0a8-bfa2-52703b9de1d5	IN	IND	356	India 	Indija	\N
00040000-55f2-e0a8-54f6-245c748a75b3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f2-e0a8-face-56a89f9c087b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f2-e0a8-870b-5e223c4dda4b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f2-e0a8-0def-0d6adccac0f6	IE	IRL	372	Ireland 	Irska	\N
00040000-55f2-e0a8-faca-9d3d9b52108a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f2-e0a8-3d11-a4e11b044df9	IL	ISR	376	Israel 	Izrael	\N
00040000-55f2-e0a8-773e-ccdf2a01e742	IT	ITA	380	Italy 	Italija	\N
00040000-55f2-e0a8-9cf2-0246e67b1035	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f2-e0a8-3ef9-2f91e8e173c1	JP	JPN	392	Japan 	Japonska	\N
00040000-55f2-e0a8-e863-2dfa1587dd8d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f2-e0a8-9bfc-a7e4848daf23	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f2-e0a8-fed7-a52cafbaf917	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f2-e0a8-b87d-7d7fc5d8b13c	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f2-e0a8-817b-acc6dfdfac70	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f2-e0a8-0f2c-953f327224c5	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f2-e0a8-1fa8-68352d265aea	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f2-e0a8-36fe-7e534a25b488	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f2-e0a8-9cdd-4071ae227be4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f2-e0a8-4bb2-90f64f403c3f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f2-e0a8-7d16-009d2e09008b	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f2-e0a8-0dd5-a316f27a35df	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f2-e0a8-0b65-d62dced30ecd	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f2-e0a8-8055-c46a93b73209	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f2-e0a8-8308-be042de9493e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f2-e0a8-99fb-88617c7e7b75	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f2-e0a8-ca33-305bf6d6bc72	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f2-e0a8-42ac-52ee4947fd6d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f2-e0a8-e131-24337ea68de4	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f2-e0a8-a1cc-0457535bfb16	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f2-e0a8-df7b-cb78eef6d907	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f2-e0a8-4a83-214d5ed86a7c	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f2-e0a8-43d6-2b0cf9f97e5c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f2-e0a8-8053-bdba121a2485	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f2-e0a8-105c-0c7e18bf3d9f	ML	MLI	466	Mali 	Mali	\N
00040000-55f2-e0a8-6f13-049e4e4468b1	MT	MLT	470	Malta 	Malta	\N
00040000-55f2-e0a8-744d-84a51aa04c9a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f2-e0a8-2578-bfa3423bf60c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f2-e0a8-d391-0956bc0c3196	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f2-e0a8-ac38-43079ce3daaf	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f2-e0a8-3f55-e50190534f98	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f2-e0a8-3d71-ddc7819240b2	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f2-e0a8-89ba-f5eb0e7954cf	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f2-e0a8-fe3d-2ee79fcdca6f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f2-e0a8-647e-7e5e05f23be0	MC	MCO	492	Monaco 	Monako	\N
00040000-55f2-e0a8-5362-31f609f8d1f7	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f2-e0a8-0c1c-430b1dff9c0e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f2-e0a8-4189-f9fe5de98ee0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f2-e0a8-a1ca-e2e82088c17b	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f2-e0a8-af7c-a729699f0d29	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f2-e0a8-9479-1a2e1831d26f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f2-e0a8-e290-bd546d6b4020	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f2-e0a8-9bea-2ab6a941226e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f2-e0a8-ef8c-4388ae325831	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f2-e0a8-4120-790e2a8d928b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f2-e0a8-c9d6-00531d65b2be	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f2-e0a8-08b2-cae4e4f7f95d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f2-e0a8-83cd-b963624ca0ae	NE	NER	562	Niger 	Niger 	\N
00040000-55f2-e0a8-64d1-c6a9813f83e4	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f2-e0a8-cece-c767320785b1	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f2-e0a8-65bf-9a0a78f4da7b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f2-e0a8-6169-eca09a62e932	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f2-e0a8-84d6-a98f52d2b2e4	NO	NOR	578	Norway 	Norveška	\N
00040000-55f2-e0a8-1664-b3cb182c140e	OM	OMN	512	Oman 	Oman	\N
00040000-55f2-e0a8-9439-a35089604db8	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f2-e0a8-ee11-77888b42ab19	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f2-e0a8-284b-63de7eff06c0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f2-e0a8-6787-3802d656be2f	PA	PAN	591	Panama 	Panama	\N
00040000-55f2-e0a8-f422-4bd266562a64	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f2-e0a8-df11-8011eee09536	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f2-e0a8-cec6-4493ffe6103a	PE	PER	604	Peru 	Peru	\N
00040000-55f2-e0a8-a9d5-6d1765745f8e	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f2-e0a8-ef02-3aa122591e89	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f2-e0a8-bece-5ca29e6ae366	PL	POL	616	Poland 	Poljska	\N
00040000-55f2-e0a8-56d0-b9ca496c0012	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f2-e0a8-fae2-df106c0ad3c0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f2-e0a8-dfbf-a4137c3b2051	QA	QAT	634	Qatar 	Katar	\N
00040000-55f2-e0a8-063c-3d116ab4c1d3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f2-e0a8-a842-2e338f88992f	RO	ROU	642	Romania 	Romunija	\N
00040000-55f2-e0a8-646a-f5ae3adfa8ea	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f2-e0a8-3d4b-d9c84aa2c0f3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f2-e0a8-51e4-2c5fa89755d5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f2-e0a8-bca2-f0dcc591c681	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f2-e0a8-689b-949000a9585d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f2-e0a8-ddf3-4c1047910a77	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f2-e0a8-49d2-acef4df8dcae	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f2-e0a8-6673-0906e74d258f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f2-e0a8-ca27-bb140c40e8fd	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f2-e0a8-e4c3-8f47090929d4	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f2-e0a8-d32d-76b64c51a91b	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f2-e0a8-8612-824eeee58f19	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f2-e0a8-b146-9604afc967b6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f2-e0a8-6037-06a22456d174	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f2-e0a8-4f04-7b6ca79eab4a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f2-e0a8-caca-dce1bf6184d3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f2-e0a8-66a3-08cdc1c9dc6d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f2-e0a8-8f16-df7ac813b4af	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f2-e0a8-a903-7561945c0fbd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f2-e0a8-c602-c999c8af6896	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f2-e0a8-6c2f-de8367fade71	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f2-e0a8-4fd0-3f240e3079f4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f2-e0a8-9e9e-9b222ad6ee2f	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f2-e0a8-d14b-1ea15079397c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f2-e0a8-5682-7f139e98dfe7	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f2-e0a8-935b-9bfdcb7ed8e2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f2-e0a8-5a10-cf33c89306ce	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f2-e0a8-b4e7-a46abf786944	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f2-e0a8-99c5-3ce5d9f46dee	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f2-e0a8-11d4-da465afd1c5a	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f2-e0a8-f90e-65df53464f2a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f2-e0a8-9707-0dd614466a40	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f2-e0a8-daf8-52f5d4e76eb6	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f2-e0a8-4ae1-59144cb19613	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f2-e0a8-1b1e-b0be2608a0e4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f2-e0a8-876c-cfbee9e61640	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f2-e0a8-e927-c8be9743dd89	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f2-e0a8-6585-5914acf60271	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f2-e0a8-5097-a14a02563fcf	TH	THA	764	Thailand 	Tajska	\N
00040000-55f2-e0a8-fb77-10a1e479be45	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f2-e0a8-3220-6a800eab0637	TG	TGO	768	Togo 	Togo	\N
00040000-55f2-e0a8-7ffd-1f5be22d2089	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f2-e0a8-0edc-d4d8295a639f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f2-e0a8-d1d7-9bd4939e37e5	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f2-e0a8-de0a-9c500162220d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f2-e0a8-5ab2-21258bfc9b93	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f2-e0a8-d2cd-4c2ac188bfec	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f2-e0a8-eb47-6029ca8b62ae	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f2-e0a8-3616-56ca28531f81	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f2-e0a8-8e2c-dbff58aa68f2	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f2-e0a8-1916-fce1ede1d2fd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f2-e0a8-9451-675b387a0719	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f2-e0a8-9d92-40c52a6a229e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f2-e0a8-343a-2057fda3921e	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f2-e0a8-b21a-2a386e186e1c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f2-e0a8-188f-385eeb6b15a2	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f2-e0a8-cfd2-49d2f4f61fc2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f2-e0a8-1f59-8a228983fc09	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f2-e0a8-8288-d82e9c1d7fe4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f2-e0a8-03f8-72677d30bd37	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f2-e0a8-a1d6-41e6681b8292	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f2-e0a8-bf01-534f4dc865e5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f2-e0a8-b836-9ffa4455c68a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f2-e0a8-f7a9-9b93cc7eb20c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f2-e0a8-37f1-62e55035eb25	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f2-e0a8-3b3c-67b639c5208e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f2-e0a8-68c9-2d50466543a6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2988 (class 0 OID 19017934)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f2-e0aa-402a-b6bc1c1db8c0	000e0000-55f2-e0aa-5ce8-43742638863c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f2-e0a8-f9dd-6d7b062248c8	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f2-e0aa-53e1-ad457c4a2c17	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f2-e0a8-0a7c-52fa32ba3186	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f2-e0aa-28f1-d956fe09d0af	000e0000-55f2-e0aa-eba4-d7088a9c1a18	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f2-e0a8-f9dd-6d7b062248c8	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f2-e0aa-df66-68d929ecc282	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f2-e0aa-bd40-5239b1033f28	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 19017744)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f2-e0aa-ff95-0b24ddc9d612	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	000c0000-55f2-e0aa-0850-ea959490cc12	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f2-e0a8-8704-19e3e71b25c1
000d0000-55f2-e0aa-b4a5-ac8e5ce01dc5	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	000c0000-55f2-e0aa-bdb5-847c4f082549	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f2-e0a8-b634-6a9e3a90abb2
000d0000-55f2-e0aa-84c6-a6583c570c75	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	000c0000-55f2-e0aa-182a-e27bd4202c9d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f2-e0a8-11d7-15eab3181510
000d0000-55f2-e0aa-daf4-91bb7d4c0677	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	000c0000-55f2-e0aa-9a18-a02b203ddeba	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f2-e0a8-fabe-3916accdcc40
000d0000-55f2-e0aa-4284-44ac150d7848	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	000c0000-55f2-e0aa-0ee7-43b4d932fb22	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f2-e0a8-fabe-3916accdcc40
000d0000-55f2-e0aa-9c44-cf43740c7ac6	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	000c0000-55f2-e0aa-a38c-58f768f41fed	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f2-e0a8-8704-19e3e71b25c1
000d0000-55f2-e0aa-5193-8b1303567eb7	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	000c0000-55f2-e0aa-6be3-5062b753e93a	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f2-e0a8-8704-19e3e71b25c1
000d0000-55f2-e0aa-d842-43abcf37f122	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	000c0000-55f2-e0aa-8741-6ad788ba4210	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f2-e0a8-6a09-556d485c9a86
000d0000-55f2-e0aa-cb07-2746e7d0905c	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	000c0000-55f2-e0aa-16aa-33ce4cf0061d	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f2-e0a8-78bd-ad103f6a69f0
\.


--
-- TOC entry 2954 (class 0 OID 19017559)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 19017540)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f2-e0aa-01c9-cf658cb316ba	00080000-55f2-e0a9-ee4d-a7de7f40a85b	00090000-55f2-e0aa-d37e-7f8c483d2d36	AK		igralka
\.


--
-- TOC entry 2963 (class 0 OID 19017658)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 19018140)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19018152)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 19018174)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19017683)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19017497)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f2-e0a8-334d-724bfaeb45b5	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f2-e0a8-13b2-2192e74d30c7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f2-e0a8-8930-f1e32b77d754	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f2-e0a8-6608-0b4cc5863ad5	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f2-e0a8-e7bc-4b1d75542f01	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f2-e0a8-5670-64f1eeead362	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}s:4:"500s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f2-e0a8-29f1-7af00350a47c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f2-e0a8-c41e-680fd7cbcc74	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f2-e0a8-deba-79ed9ff44e4d	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f2-e0a8-9ac8-abc724a45d9b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f2-e0a8-5c06-de49f6b99031	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f2-e0a8-2e40-a4f98fc534a1	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f2-e0a8-d483-2f7ba2c97929	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f2-e0a9-ebd4-02b66ba2c688	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f2-e0a9-0c39-743b2502a7fb	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f2-e0a9-5052-ceee857cd109	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f2-e0a9-9b3b-f759331dcc28	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f2-e0a9-6dfe-82368dbc265c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f2-e0a9-152e-5816c1af1814	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f2-e0ab-bd42-37ce95913c10	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2943 (class 0 OID 19017411)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f2-e0a9-b1da-06092c6d8e7f	00000000-55f2-e0a9-0c39-743b2502a7fb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f2-e0a9-396a-79c5f76b8160	00000000-55f2-e0a9-0c39-743b2502a7fb	00010000-55f2-e0a8-127b-49034e0c05d8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f2-e0a9-33cb-f765239271c3	00000000-55f2-e0a9-5052-ceee857cd109	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2944 (class 0 OID 19017422)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f2-e0aa-bb7c-b62324cc0b30	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f2-e0aa-1426-a02e17591fc6	00010000-55f2-e0a9-ddfa-37d75a127535	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f2-e0aa-8685-d038d5b67903	00010000-55f2-e0a9-e812-d5c16042068e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f2-e0aa-f53b-cddb08e5fc25	00010000-55f2-e0aa-28b6-d26244672858	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f2-e0aa-2c13-4b05f77e4053	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f2-e0aa-95af-7b95137fc412	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f2-e0aa-a2d2-cd0f92cd09c2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f2-e0aa-2cac-32c4b7a0ee4c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f2-e0aa-d37e-7f8c483d2d36	00010000-55f2-e0aa-fdbb-6d176b26290e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f2-e0aa-1ba7-2352ff3e5c70	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f2-e0aa-e096-00ce48d371b1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f2-e0aa-2dc4-ebe078ce74dd	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f2-e0aa-8e7b-63614ab6abaa	00010000-55f2-e0aa-6f8d-0f51bc422124	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 19017376)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f2-e0a8-9d7f-7372ed669947	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f2-e0a8-31f8-2526d15a677a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f2-e0a8-9a67-800d03aaeef3	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f2-e0a8-a685-2e2c816ee98e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f2-e0a8-bdb4-e9692bffaff4	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f2-e0a8-699c-847185543005	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f2-e0a8-4eaf-4a78847398bc	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f2-e0a8-170b-a23457651d3a	Abonma-read	Abonma - branje	f
00030000-55f2-e0a8-b42b-76fd30d94e76	Abonma-write	Abonma - spreminjanje	f
00030000-55f2-e0a8-d1b4-d55880b2a001	Alternacija-read	Alternacija - branje	f
00030000-55f2-e0a8-2168-b9b7b1da800f	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f2-e0a8-cc3f-2890f4172a02	Arhivalija-read	Arhivalija - branje	f
00030000-55f2-e0a8-3127-688986ebf96e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f2-e0a8-99de-3ba3d6f1c6d8	Besedilo-read	Besedilo - branje	f
00030000-55f2-e0a8-7756-bad076585b7b	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f2-e0a8-4029-76e2f6e123bf	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f2-e0a8-c76e-e1724061a6e4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f2-e0a8-a7ab-dd068054a3fb	Dogodek-read	Dogodek - branje	f
00030000-55f2-e0a8-7073-ceecdc6c93cb	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f2-e0a8-fb9b-b472aeb35328	DrugiVir-read	DrugiVir - branje	f
00030000-55f2-e0a8-9354-344128a93f0a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f2-e0a8-91ec-60171107304a	Drzava-read	Drzava - branje	f
00030000-55f2-e0a8-6cf9-16bd3d0f28d8	Drzava-write	Drzava - spreminjanje	f
00030000-55f2-e0a8-9496-ee98ae25750a	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f2-e0a8-c894-ea270cb2462d	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f2-e0a8-e80a-a159d6f05fd8	Funkcija-read	Funkcija - branje	f
00030000-55f2-e0a8-7171-cfae97729700	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f2-e0a8-2a19-48277cdd9a3a	Gostovanje-read	Gostovanje - branje	f
00030000-55f2-e0a8-8a05-e7abe42d0f20	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f2-e0a8-fa54-836792df0edc	Gostujoca-read	Gostujoca - branje	f
00030000-55f2-e0a8-c17f-cf58dcfb10d5	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f2-e0a8-a190-1cc1e8c3916d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f2-e0a8-df4c-2ef419784f49	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f2-e0a8-598c-f29c2ec2ca38	Kupec-read	Kupec - branje	f
00030000-55f2-e0a8-89f2-4d3d91acebd1	Kupec-write	Kupec - spreminjanje	f
00030000-55f2-e0a8-2bdb-e5131f130e6e	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f2-e0a8-0a76-d4a7aeec308a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f2-e0a8-bbbb-18a6048501a1	Option-read	Option - branje	f
00030000-55f2-e0a8-313a-a25af715cc6f	Option-write	Option - spreminjanje	f
00030000-55f2-e0a8-1ad6-9c100e8657bb	OptionValue-read	OptionValue - branje	f
00030000-55f2-e0a8-6696-7ca788ebe159	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f2-e0a8-5aa0-cf16b2271e5b	Oseba-read	Oseba - branje	f
00030000-55f2-e0a8-6d11-af012bb7b9ba	Oseba-write	Oseba - spreminjanje	f
00030000-55f2-e0a8-becc-dd24ceac6011	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f2-e0a8-e157-7d4716f6bdc3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f2-e0a8-9264-d96158469a24	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f2-e0a8-fbca-e7025df2b5da	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f2-e0a8-8848-fa916c376ca3	Pogodba-read	Pogodba - branje	f
00030000-55f2-e0a8-9a9f-2d1714c86a72	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f2-e0a8-c119-99d046569767	Popa-read	Popa - branje	f
00030000-55f2-e0a8-e1ef-55de08f25b40	Popa-write	Popa - spreminjanje	f
00030000-55f2-e0a8-444f-5f760a7d93db	Posta-read	Posta - branje	f
00030000-55f2-e0a8-57f2-4bda6d7213ff	Posta-write	Posta - spreminjanje	f
00030000-55f2-e0a8-67ea-2c290921d6d6	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f2-e0a8-548a-d6b85f2e2133	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f2-e0a8-a674-33a54958b2c5	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f2-e0a8-de47-cb6200efea63	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f2-e0a8-d63c-7354c5d845a0	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f2-e0a8-5f40-c1e9318238b3	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f2-e0a8-0d87-d8020d8f8ec4	Predstava-read	Predstava - branje	f
00030000-55f2-e0a8-c69b-6e283ba4e9f3	Predstava-write	Predstava - spreminjanje	f
00030000-55f2-e0a8-9c40-1a064e3d9895	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f2-e0a8-19d0-1a78842f2998	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f2-e0a8-6b06-428b14a09c4f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f2-e0a8-e5c6-989b0607dd05	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f2-e0a8-2e5a-9c52b32002dd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f2-e0a8-da0d-1355a72ea597	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f2-e0a8-23b0-bf22febb47aa	ProgramDela-read	ProgramDela - branje	f
00030000-55f2-e0a8-0f3c-6fa1c2f30802	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f2-e0a8-f364-c7d052dc7f54	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f2-e0a8-8415-3f75a5383919	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f2-e0a8-2b5a-cc0c2350810a	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f2-e0a8-2133-d9f45fdbabb9	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f2-e0a8-4779-edb6889fd51c	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f2-e0a8-a47c-834fed09d1bb	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f2-e0a8-90f9-7679f9e76a7d	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f2-e0a8-8d71-98257693d7ce	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f2-e0a8-0f7e-8d9e0340abf2	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f2-e0a8-e331-546a43f995ac	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f2-e0a8-3170-cf4f4e7fdd3a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f2-e0a8-93df-a131ed5b7eef	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f2-e0a8-a038-7534310990e9	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f2-e0a8-a80d-83bcb3c63546	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f2-e0a8-3c08-04bf7f536346	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f2-e0a8-27f2-8ff7cf4d7cae	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f2-e0a8-088f-2eb25c868d0b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f2-e0a8-c816-4a90f1460a0c	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f2-e0a8-3724-2134eb0d8159	Prostor-read	Prostor - branje	f
00030000-55f2-e0a8-c9a0-501d1c6424f7	Prostor-write	Prostor - spreminjanje	f
00030000-55f2-e0a8-34d8-616a17ccf1a0	Racun-read	Racun - branje	f
00030000-55f2-e0a8-426c-1302cc4e3158	Racun-write	Racun - spreminjanje	f
00030000-55f2-e0a8-6be7-97a1050e527f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f2-e0a8-0140-a378c9bcd482	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f2-e0a8-b2e9-2e3609b4e972	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f2-e0a8-ee21-cc3ac989efb6	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f2-e0a8-3672-36c28d718fa0	Rekvizit-read	Rekvizit - branje	f
00030000-55f2-e0a8-9551-206ad5467645	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f2-e0a8-569c-ae72f55f9503	Revizija-read	Revizija - branje	f
00030000-55f2-e0a8-e045-7114295c38e9	Revizija-write	Revizija - spreminjanje	f
00030000-55f2-e0a8-5a0f-b5e27f1c73ca	Rezervacija-read	Rezervacija - branje	f
00030000-55f2-e0a8-e7c5-141a29b8280d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f2-e0a8-d490-ea314cb9a33c	SedezniRed-read	SedezniRed - branje	f
00030000-55f2-e0a8-331b-a1bc57ef1130	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f2-e0a8-f70e-ffd78f31c81d	Sedez-read	Sedez - branje	f
00030000-55f2-e0a8-27f7-25ba9297de05	Sedez-write	Sedez - spreminjanje	f
00030000-55f2-e0a8-40be-025619821605	Sezona-read	Sezona - branje	f
00030000-55f2-e0a8-6193-6e6e4379f446	Sezona-write	Sezona - spreminjanje	f
00030000-55f2-e0a8-724e-9bd9ebc819b1	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f2-e0a8-b852-16a2031cd343	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f2-e0a8-f6f5-2dd7e03751f7	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f2-e0a8-f715-c09d19ebdfb6	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f2-e0a8-ac33-65ead6d28617	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f2-e0a8-97c9-96beb2786eca	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f2-e0a8-b770-dac0e0ccea6d	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f2-e0a8-f847-067ab7310889	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f2-e0a8-31e5-9022ba871506	Telefonska-read	Telefonska - branje	f
00030000-55f2-e0a8-9ac7-a4ae6e0812a8	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f2-e0a8-0275-a7fadc4c5715	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f2-e0a8-95db-76292ee7a680	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f2-e0a8-4bc5-89ea82da6d15	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f2-e0a8-de10-c9a4c094ac56	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f2-e0a8-a7b6-e71e88ffc2d9	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f2-e0a8-9a4f-9ec783285438	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f2-e0a8-b4cd-d5b8ac35fbd8	Trr-read	Trr - branje	f
00030000-55f2-e0a8-bbfa-8aefd5a34357	Trr-write	Trr - spreminjanje	f
00030000-55f2-e0a8-3a56-cd12f689217c	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f2-e0a8-61b1-a82cec1bc7b5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f2-e0a8-f314-e1e6eb5c06de	Vaja-read	Vaja - branje	f
00030000-55f2-e0a8-f904-2137228765b2	Vaja-write	Vaja - spreminjanje	f
00030000-55f2-e0a8-7ff4-7569378d9a6e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f2-e0a8-1774-e8e991b330ff	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f2-e0a8-c87e-e67474281b71	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f2-e0a8-e42c-4dff524e7604	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f2-e0a8-7f77-d933e918ab53	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f2-e0a8-0b8a-317ea0c74d4c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f2-e0a8-5e37-12919aebd566	Zasedenost-read	Zasedenost - branje	f
00030000-55f2-e0a8-f155-7059c482a300	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f2-e0a8-b5eb-f9afb067aa90	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f2-e0a8-9674-2f2c3ab20678	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f2-e0a8-cd42-240a265b282b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f2-e0a8-950c-f24a57e01f29	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f2-e0a8-40ae-9486ec3b2b10	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f2-e0a8-a620-9692b5fef531	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f2-e0a8-175f-6b54dcd19f9d	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f2-e0a8-2e8f-38da233701be	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f2-e0a8-b7af-3dfcf7ac715d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f2-e0a8-af8c-76aa09114a3d	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f2-e0a8-cee7-bb7fd68e51be	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f2-e0a8-e8dc-4055cdef1bdf	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f2-e0a8-290b-68f0cae06f09	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f2-e0a8-1b24-b757e0e80202	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f2-e0a8-746e-6820c11e5d8b	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f2-e0a8-a3aa-b622a52feac6	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2941 (class 0 OID 19017395)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f2-e0a8-6dbe-f71ade934895	00030000-55f2-e0a8-31f8-2526d15a677a
00020000-55f2-e0a8-45d4-5893e2167600	00030000-55f2-e0a8-91ec-60171107304a
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-170b-a23457651d3a
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-b42b-76fd30d94e76
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-d1b4-d55880b2a001
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-2168-b9b7b1da800f
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-cc3f-2890f4172a02
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-a7ab-dd068054a3fb
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-a685-2e2c816ee98e
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-7073-ceecdc6c93cb
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-91ec-60171107304a
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-6cf9-16bd3d0f28d8
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-e80a-a159d6f05fd8
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-7171-cfae97729700
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-2a19-48277cdd9a3a
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-8a05-e7abe42d0f20
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-fa54-836792df0edc
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-c17f-cf58dcfb10d5
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-a190-1cc1e8c3916d
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-df4c-2ef419784f49
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-bbbb-18a6048501a1
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-1ad6-9c100e8657bb
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-5aa0-cf16b2271e5b
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-6d11-af012bb7b9ba
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-c119-99d046569767
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-e1ef-55de08f25b40
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-444f-5f760a7d93db
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-57f2-4bda6d7213ff
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-d63c-7354c5d845a0
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-5f40-c1e9318238b3
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-0d87-d8020d8f8ec4
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-c69b-6e283ba4e9f3
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-2e5a-9c52b32002dd
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-da0d-1355a72ea597
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-3724-2134eb0d8159
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-c9a0-501d1c6424f7
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-b2e9-2e3609b4e972
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-ee21-cc3ac989efb6
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-3672-36c28d718fa0
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-9551-206ad5467645
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-40be-025619821605
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-6193-6e6e4379f446
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-4bc5-89ea82da6d15
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-3a56-cd12f689217c
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-61b1-a82cec1bc7b5
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-f314-e1e6eb5c06de
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-f904-2137228765b2
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-5e37-12919aebd566
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-f155-7059c482a300
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-b5eb-f9afb067aa90
00020000-55f2-e0a8-25ca-6ae0c69e5efb	00030000-55f2-e0a8-cd42-240a265b282b
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-170b-a23457651d3a
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-cc3f-2890f4172a02
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-a7ab-dd068054a3fb
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-91ec-60171107304a
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-2a19-48277cdd9a3a
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-fa54-836792df0edc
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-a190-1cc1e8c3916d
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-df4c-2ef419784f49
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-bbbb-18a6048501a1
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-1ad6-9c100e8657bb
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-5aa0-cf16b2271e5b
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-6d11-af012bb7b9ba
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-c119-99d046569767
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-444f-5f760a7d93db
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-d63c-7354c5d845a0
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-5f40-c1e9318238b3
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-0d87-d8020d8f8ec4
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-3724-2134eb0d8159
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-b2e9-2e3609b4e972
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-3672-36c28d718fa0
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-40be-025619821605
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-31e5-9022ba871506
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-9ac7-a4ae6e0812a8
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-b4cd-d5b8ac35fbd8
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-bbfa-8aefd5a34357
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-7f77-d933e918ab53
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-0b8a-317ea0c74d4c
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-b5eb-f9afb067aa90
00020000-55f2-e0a8-2ed6-0cd279117ec1	00030000-55f2-e0a8-cd42-240a265b282b
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-170b-a23457651d3a
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-d1b4-d55880b2a001
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-cc3f-2890f4172a02
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-3127-688986ebf96e
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-99de-3ba3d6f1c6d8
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-4029-76e2f6e123bf
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-a7ab-dd068054a3fb
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-91ec-60171107304a
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-e80a-a159d6f05fd8
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-2a19-48277cdd9a3a
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-fa54-836792df0edc
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-a190-1cc1e8c3916d
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-bbbb-18a6048501a1
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-1ad6-9c100e8657bb
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-5aa0-cf16b2271e5b
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-c119-99d046569767
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-444f-5f760a7d93db
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-0d87-d8020d8f8ec4
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-2e5a-9c52b32002dd
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-3724-2134eb0d8159
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-b2e9-2e3609b4e972
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-3672-36c28d718fa0
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-40be-025619821605
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-4bc5-89ea82da6d15
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-f314-e1e6eb5c06de
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-5e37-12919aebd566
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-b5eb-f9afb067aa90
00020000-55f2-e0a8-1bab-9d4f91d5940f	00030000-55f2-e0a8-cd42-240a265b282b
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-170b-a23457651d3a
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-b42b-76fd30d94e76
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-2168-b9b7b1da800f
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-cc3f-2890f4172a02
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-a7ab-dd068054a3fb
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-91ec-60171107304a
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-2a19-48277cdd9a3a
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-fa54-836792df0edc
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-bbbb-18a6048501a1
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-1ad6-9c100e8657bb
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-c119-99d046569767
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-444f-5f760a7d93db
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-0d87-d8020d8f8ec4
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-3724-2134eb0d8159
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-b2e9-2e3609b4e972
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-3672-36c28d718fa0
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-40be-025619821605
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-4bc5-89ea82da6d15
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-b5eb-f9afb067aa90
00020000-55f2-e0a8-05e4-a8fb1b691da8	00030000-55f2-e0a8-cd42-240a265b282b
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-170b-a23457651d3a
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-cc3f-2890f4172a02
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-a7ab-dd068054a3fb
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-91ec-60171107304a
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-2a19-48277cdd9a3a
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-fa54-836792df0edc
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-bbbb-18a6048501a1
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-1ad6-9c100e8657bb
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-c119-99d046569767
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-444f-5f760a7d93db
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-0d87-d8020d8f8ec4
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-3724-2134eb0d8159
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-b2e9-2e3609b4e972
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-3672-36c28d718fa0
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-40be-025619821605
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-0275-a7fadc4c5715
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-9a67-800d03aaeef3
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-4bc5-89ea82da6d15
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-b5eb-f9afb067aa90
00020000-55f2-e0a8-833a-85bc60aa087b	00030000-55f2-e0a8-cd42-240a265b282b
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-9d7f-7372ed669947
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-31f8-2526d15a677a
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-9a67-800d03aaeef3
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-a685-2e2c816ee98e
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-bdb4-e9692bffaff4
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-699c-847185543005
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-4eaf-4a78847398bc
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-170b-a23457651d3a
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-b42b-76fd30d94e76
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-d1b4-d55880b2a001
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-2168-b9b7b1da800f
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-cc3f-2890f4172a02
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-3127-688986ebf96e
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-99de-3ba3d6f1c6d8
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-7756-bad076585b7b
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-4029-76e2f6e123bf
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-c76e-e1724061a6e4
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-a7ab-dd068054a3fb
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-7073-ceecdc6c93cb
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-91ec-60171107304a
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-6cf9-16bd3d0f28d8
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-fb9b-b472aeb35328
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-9354-344128a93f0a
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-9496-ee98ae25750a
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-c894-ea270cb2462d
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-e80a-a159d6f05fd8
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-7171-cfae97729700
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-2a19-48277cdd9a3a
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-8a05-e7abe42d0f20
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-fa54-836792df0edc
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-c17f-cf58dcfb10d5
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-a190-1cc1e8c3916d
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-df4c-2ef419784f49
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-598c-f29c2ec2ca38
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-89f2-4d3d91acebd1
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-2bdb-e5131f130e6e
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-0a76-d4a7aeec308a
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-bbbb-18a6048501a1
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-313a-a25af715cc6f
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-1ad6-9c100e8657bb
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-6696-7ca788ebe159
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-5aa0-cf16b2271e5b
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-6d11-af012bb7b9ba
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-becc-dd24ceac6011
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-e157-7d4716f6bdc3
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-9264-d96158469a24
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-fbca-e7025df2b5da
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-8848-fa916c376ca3
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-9a9f-2d1714c86a72
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-c119-99d046569767
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-e1ef-55de08f25b40
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-444f-5f760a7d93db
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-57f2-4bda6d7213ff
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-67ea-2c290921d6d6
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-548a-d6b85f2e2133
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-a674-33a54958b2c5
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-de47-cb6200efea63
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-d63c-7354c5d845a0
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-5f40-c1e9318238b3
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-0d87-d8020d8f8ec4
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-c69b-6e283ba4e9f3
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-9c40-1a064e3d9895
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-19d0-1a78842f2998
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-6b06-428b14a09c4f
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-e5c6-989b0607dd05
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-2e5a-9c52b32002dd
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-da0d-1355a72ea597
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-23b0-bf22febb47aa
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-0f3c-6fa1c2f30802
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-f364-c7d052dc7f54
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-8415-3f75a5383919
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-2b5a-cc0c2350810a
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-2133-d9f45fdbabb9
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-4779-edb6889fd51c
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-a47c-834fed09d1bb
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-90f9-7679f9e76a7d
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-8d71-98257693d7ce
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-0f7e-8d9e0340abf2
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-e331-546a43f995ac
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-3170-cf4f4e7fdd3a
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-93df-a131ed5b7eef
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-a038-7534310990e9
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-a80d-83bcb3c63546
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-3c08-04bf7f536346
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-27f2-8ff7cf4d7cae
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-088f-2eb25c868d0b
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-c816-4a90f1460a0c
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-3724-2134eb0d8159
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-c9a0-501d1c6424f7
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-34d8-616a17ccf1a0
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-426c-1302cc4e3158
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-6be7-97a1050e527f
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-0140-a378c9bcd482
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-b2e9-2e3609b4e972
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-ee21-cc3ac989efb6
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-3672-36c28d718fa0
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-9551-206ad5467645
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-569c-ae72f55f9503
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-e045-7114295c38e9
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-5a0f-b5e27f1c73ca
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-e7c5-141a29b8280d
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-d490-ea314cb9a33c
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-331b-a1bc57ef1130
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-f70e-ffd78f31c81d
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-27f7-25ba9297de05
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-40be-025619821605
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-6193-6e6e4379f446
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-724e-9bd9ebc819b1
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-b852-16a2031cd343
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-f6f5-2dd7e03751f7
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-f715-c09d19ebdfb6
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-ac33-65ead6d28617
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-97c9-96beb2786eca
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-b770-dac0e0ccea6d
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-f847-067ab7310889
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-31e5-9022ba871506
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-9ac7-a4ae6e0812a8
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-0275-a7fadc4c5715
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-95db-76292ee7a680
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-4bc5-89ea82da6d15
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-de10-c9a4c094ac56
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-a7b6-e71e88ffc2d9
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-9a4f-9ec783285438
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-b4cd-d5b8ac35fbd8
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-bbfa-8aefd5a34357
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-3a56-cd12f689217c
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-61b1-a82cec1bc7b5
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-f314-e1e6eb5c06de
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-f904-2137228765b2
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-7ff4-7569378d9a6e
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-1774-e8e991b330ff
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-c87e-e67474281b71
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-e42c-4dff524e7604
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-7f77-d933e918ab53
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-0b8a-317ea0c74d4c
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-5e37-12919aebd566
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-f155-7059c482a300
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-b5eb-f9afb067aa90
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-9674-2f2c3ab20678
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-cd42-240a265b282b
00020000-55f2-e0a9-f814-9c8b6c10740e	00030000-55f2-e0a8-950c-f24a57e01f29
\.


--
-- TOC entry 2968 (class 0 OID 19017690)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19017724)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 19017853)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f2-e0aa-8e92-4e8820d161ac	00090000-55f2-e0aa-bb7c-b62324cc0b30	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f2-e0aa-c456-af57fd13ae1b	00090000-55f2-e0aa-95af-7b95137fc412	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f2-e0aa-5dc2-676974d5f853	00090000-55f2-e0aa-8e7b-63614ab6abaa	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f2-e0aa-e004-2ac1d632e67b	00090000-55f2-e0aa-1ba7-2352ff3e5c70	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2946 (class 0 OID 19017455)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f2-e0a9-ee4d-a7de7f40a85b	00040000-55f2-e0a8-6c2f-de8367fade71	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-e0a9-52b4-30d58429ac35	00040000-55f2-e0a8-6c2f-de8367fade71	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f2-e0a9-c7b6-55cda3e08808	00040000-55f2-e0a8-6c2f-de8367fade71	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-e0a9-646c-3fd99ff3af23	00040000-55f2-e0a8-6c2f-de8367fade71	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-e0a9-e7f3-52f9d20a04aa	00040000-55f2-e0a8-6c2f-de8367fade71	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-e0a9-1d3e-259a6601a38f	00040000-55f2-e0a8-e944-f49f9301b6e9	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-e0a9-fb23-f2d11fbd8a92	00040000-55f2-e0a8-0dff-aeff7a139e39	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-e0a9-5549-2114b9f7d0e8	00040000-55f2-e0a8-3568-a3dea8be34b7	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-e0a9-c94a-c4b43f67c35a	00040000-55f2-e0a8-a2c4-e1663606def8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f2-e0ab-9223-f76810bd6429	00040000-55f2-e0a8-6c2f-de8367fade71	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2948 (class 0 OID 19017489)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f2-e0a8-f28d-880166e9fb05	8341	Adlešiči
00050000-55f2-e0a8-449d-37b67e3f4105	5270	Ajdovščina
00050000-55f2-e0a8-6fb8-1fde0215f74d	6280	Ankaran/Ancarano
00050000-55f2-e0a8-fe28-27bcb3c91827	9253	Apače
00050000-55f2-e0a8-4571-1d8f249b6b54	8253	Artiče
00050000-55f2-e0a8-8c4c-b747ba248d99	4275	Begunje na Gorenjskem
00050000-55f2-e0a8-ec92-1947d1f07761	1382	Begunje pri Cerknici
00050000-55f2-e0a8-98b4-22400386796f	9231	Beltinci
00050000-55f2-e0a8-b535-93e18f2ae0d8	2234	Benedikt
00050000-55f2-e0a8-5097-89078e55a45a	2345	Bistrica ob Dravi
00050000-55f2-e0a8-bb65-9c72e8fde32e	3256	Bistrica ob Sotli
00050000-55f2-e0a8-ca35-d20aeac372d5	8259	Bizeljsko
00050000-55f2-e0a8-825d-0c3aae4611f3	1223	Blagovica
00050000-55f2-e0a8-7597-1ae625c0097f	8283	Blanca
00050000-55f2-e0a8-2b60-a86648e98ecc	4260	Bled
00050000-55f2-e0a8-8c70-f3f974879dac	4273	Blejska Dobrava
00050000-55f2-e0a8-4d32-3ea02329e763	9265	Bodonci
00050000-55f2-e0a8-19ae-362880815541	9222	Bogojina
00050000-55f2-e0a8-96ec-1798e9c2638c	4263	Bohinjska Bela
00050000-55f2-e0a8-a4bc-407ff8bdac13	4264	Bohinjska Bistrica
00050000-55f2-e0a8-6184-87f1ac6d6863	4265	Bohinjsko jezero
00050000-55f2-e0a8-e2f6-0cf2862f1291	1353	Borovnica
00050000-55f2-e0a8-b98f-dbfbf09f46ce	8294	Boštanj
00050000-55f2-e0a8-49db-a30dc6db686e	5230	Bovec
00050000-55f2-e0a8-d942-72295ac28bb6	5295	Branik
00050000-55f2-e0a8-b67f-192f2d840fa9	3314	Braslovče
00050000-55f2-e0a8-2992-8effc91dde0e	5223	Breginj
00050000-55f2-e0a8-aad0-1c23f3c6bcab	8280	Brestanica
00050000-55f2-e0a8-1ea7-e803f5d56bc0	2354	Bresternica
00050000-55f2-e0a8-6e88-44321e8cb5f2	4243	Brezje
00050000-55f2-e0a8-3ec8-36ad42af8d9b	1351	Brezovica pri Ljubljani
00050000-55f2-e0a8-544b-a213fe1968d8	8250	Brežice
00050000-55f2-e0a8-f73c-320010a30c29	4210	Brnik - Aerodrom
00050000-55f2-e0a8-a2f7-247f01c1512f	8321	Brusnice
00050000-55f2-e0a8-84cf-6cd848f90993	3255	Buče
00050000-55f2-e0a8-6e8d-ffb9b92e5481	8276	Bučka 
00050000-55f2-e0a8-7519-1223b65ce2ec	9261	Cankova
00050000-55f2-e0a8-6633-7cf022e4a462	3000	Celje 
00050000-55f2-e0a8-d6fa-9070c703cf01	3001	Celje - poštni predali
00050000-55f2-e0a8-4418-5b11c2672aa7	4207	Cerklje na Gorenjskem
00050000-55f2-e0a8-582d-900be24b1bc2	8263	Cerklje ob Krki
00050000-55f2-e0a8-e999-0c8af864c5a7	1380	Cerknica
00050000-55f2-e0a8-4681-18698d051ef3	5282	Cerkno
00050000-55f2-e0a8-0228-aca6201c8bad	2236	Cerkvenjak
00050000-55f2-e0a8-ca67-58bd9df97487	2215	Ceršak
00050000-55f2-e0a8-d5b0-83e740619773	2326	Cirkovce
00050000-55f2-e0a8-3fcf-56ea08dbb0cf	2282	Cirkulane
00050000-55f2-e0a8-61ec-6268c8edfc49	5273	Col
00050000-55f2-e0a8-6162-2ecde2d2c9fe	8251	Čatež ob Savi
00050000-55f2-e0a8-0168-d2e6bdec1299	1413	Čemšenik
00050000-55f2-e0a8-80b9-cd34444f73f8	5253	Čepovan
00050000-55f2-e0a8-38c9-d28758750b5c	9232	Črenšovci
00050000-55f2-e0a8-235b-7adcb1f2a5db	2393	Črna na Koroškem
00050000-55f2-e0a8-fa5d-c2af0a4a0779	6275	Črni Kal
00050000-55f2-e0a8-9256-9930c890be1f	5274	Črni Vrh nad Idrijo
00050000-55f2-e0a8-68ea-8eb7144bde36	5262	Črniče
00050000-55f2-e0a8-b764-3b10e3d0e33a	8340	Črnomelj
00050000-55f2-e0a8-92e3-76c0016e1751	6271	Dekani
00050000-55f2-e0a8-fd5c-8c4b30ac0d8d	5210	Deskle
00050000-55f2-e0a8-6a6a-5e47aaf0b3aa	2253	Destrnik
00050000-55f2-e0a8-dd93-1ece569fb179	6215	Divača
00050000-55f2-e0a8-a99c-b38e4803c671	1233	Dob
00050000-55f2-e0a8-ad57-20f1f205ca8b	3224	Dobje pri Planini
00050000-55f2-e0a8-6785-5791e102e69c	8257	Dobova
00050000-55f2-e0a8-1230-fa8b8e23a088	1423	Dobovec
00050000-55f2-e0a8-c3b9-7397c3f3824f	5263	Dobravlje
00050000-55f2-e0a8-a636-869562da09c5	3204	Dobrna
00050000-55f2-e0a8-04a4-2bd6a8a04289	8211	Dobrnič
00050000-55f2-e0a8-a13f-8f9426640fb2	1356	Dobrova
00050000-55f2-e0a8-0ab8-7f6b972589b9	9223	Dobrovnik/Dobronak 
00050000-55f2-e0a8-4be4-90204ea741e5	5212	Dobrovo v Brdih
00050000-55f2-e0a8-f258-d8f41d84d694	1431	Dol pri Hrastniku
00050000-55f2-e0a8-04e8-dc0d7cc421ed	1262	Dol pri Ljubljani
00050000-55f2-e0a8-eb0f-fc5729588ea3	1273	Dole pri Litiji
00050000-55f2-e0a8-a1ca-566c41cf0ba8	1331	Dolenja vas
00050000-55f2-e0a8-0b49-b3dd35bbc885	8350	Dolenjske Toplice
00050000-55f2-e0a8-b940-e5d17d7a5688	1230	Domžale
00050000-55f2-e0a8-8cb9-5253d40df195	2252	Dornava
00050000-55f2-e0a8-8d3c-f23ee84b7fc7	5294	Dornberk
00050000-55f2-e0a8-5d4f-e3fc6cbb7ad2	1319	Draga
00050000-55f2-e0a8-aaa4-26b7a3f9e989	8343	Dragatuš
00050000-55f2-e0a8-8c57-ed3901a80b0d	3222	Dramlje
00050000-55f2-e0a8-29cd-e9115fe56604	2370	Dravograd
00050000-55f2-e0a8-3ba7-c683f86cab1f	4203	Duplje
00050000-55f2-e0a8-832a-755a28ec7a24	6221	Dutovlje
00050000-55f2-e0a8-88f7-4aeb7d25bb6f	8361	Dvor
00050000-55f2-e0a8-524d-7f11f9dc9b2a	2343	Fala
00050000-55f2-e0a8-6241-b9df51501bbc	9208	Fokovci
00050000-55f2-e0a8-9942-d9e8c626e3bf	2313	Fram
00050000-55f2-e0a8-3b4b-64270073d544	3213	Frankolovo
00050000-55f2-e0a8-9a65-6e9a16b0066c	1274	Gabrovka
00050000-55f2-e0a8-bd2d-081208bdb2d3	8254	Globoko
00050000-55f2-e0a8-52f5-ec3ff1e36e16	5275	Godovič
00050000-55f2-e0a8-9d83-9b0692dd24e3	4204	Golnik
00050000-55f2-e0a8-8d84-85376004b21d	3303	Gomilsko
00050000-55f2-e0a8-7848-c7701f8f01da	4224	Gorenja vas
00050000-55f2-e0a8-fb83-277e53b6021d	3263	Gorica pri Slivnici
00050000-55f2-e0a8-8cb2-f51bff61515f	2272	Gorišnica
00050000-55f2-e0a8-af3d-a08a62393d31	9250	Gornja Radgona
00050000-55f2-e0a8-8738-94fe3ec030fb	3342	Gornji Grad
00050000-55f2-e0a8-38d9-69f1bd4bf6b3	4282	Gozd Martuljek
00050000-55f2-e0a8-f810-44e842c91dbe	6272	Gračišče
00050000-55f2-e0a8-251b-9704000da29b	9264	Grad
00050000-55f2-e0a8-a0e2-c94d1227ca90	8332	Gradac
00050000-55f2-e0a8-d7a9-2dd824f10cf5	1384	Grahovo
00050000-55f2-e0a8-b396-9609eb5a3154	5242	Grahovo ob Bači
00050000-55f2-e0a8-8ddf-a2e870d2ff5a	5251	Grgar
00050000-55f2-e0a8-ec94-3887507f09d5	3302	Griže
00050000-55f2-e0a8-d121-b21329cfeb7e	3231	Grobelno
00050000-55f2-e0a8-8f2a-88da8bc471c6	1290	Grosuplje
00050000-55f2-e0a8-77c1-27336dbc2cb7	2288	Hajdina
00050000-55f2-e0a8-e8c9-663ed134f4c2	8362	Hinje
00050000-55f2-e0a8-766c-c034f945ed90	2311	Hoče
00050000-55f2-e0a8-ded2-5bbd6a88734a	9205	Hodoš/Hodos
00050000-55f2-e0a8-8213-8f179b474c93	1354	Horjul
00050000-55f2-e0a8-214e-2ce987d1b190	1372	Hotedršica
00050000-55f2-e0a8-5a15-6f58db0809bd	1430	Hrastnik
00050000-55f2-e0a8-ae41-63c893d3e3d4	6225	Hruševje
00050000-55f2-e0a8-721d-997ee53b9bba	4276	Hrušica
00050000-55f2-e0a8-e067-1f9d93dfdb5c	5280	Idrija
00050000-55f2-e0a8-2596-31162d0533c8	1292	Ig
00050000-55f2-e0a8-0ee3-3aa75101b8e2	6250	Ilirska Bistrica
00050000-55f2-e0a8-8418-9d77f150b2ad	6251	Ilirska Bistrica-Trnovo
00050000-55f2-e0a8-2fe5-3fa0a9e4b91e	1295	Ivančna Gorica
00050000-55f2-e0a8-4daf-7fb095950bdc	2259	Ivanjkovci
00050000-55f2-e0a8-f835-43e4db3bd9a3	1411	Izlake
00050000-55f2-e0a8-5683-ec2bcc00b876	6310	Izola/Isola
00050000-55f2-e0a8-deb3-c3370ab47743	2222	Jakobski Dol
00050000-55f2-e0a8-74d2-2e7eb7b37689	2221	Jarenina
00050000-55f2-e0a8-6229-d14578cb5e20	6254	Jelšane
00050000-55f2-e0a8-d2fd-9b9db262b972	4270	Jesenice
00050000-55f2-e0a8-eeb6-21142473f996	8261	Jesenice na Dolenjskem
00050000-55f2-e0a8-5376-dcbb016bffc2	3273	Jurklošter
00050000-55f2-e0a8-692f-fab7b0c5afdf	2223	Jurovski Dol
00050000-55f2-e0a8-a4b9-f124819ed8f9	2256	Juršinci
00050000-55f2-e0a8-24aa-d3a49ceb3a7a	5214	Kal nad Kanalom
00050000-55f2-e0a8-c2db-62ee2ba901e4	3233	Kalobje
00050000-55f2-e0a8-b7c9-6cdfe2229c4f	4246	Kamna Gorica
00050000-55f2-e0a8-a8f0-cc107369c08e	2351	Kamnica
00050000-55f2-e0a8-341d-af6eb2ddd83b	1241	Kamnik
00050000-55f2-e0a8-fde1-14a860afc6cf	5213	Kanal
00050000-55f2-e0a8-32be-9fbb98900aac	8258	Kapele
00050000-55f2-e0a8-76ae-1375127dfe90	2362	Kapla
00050000-55f2-e0a8-465b-22df9d7fa407	2325	Kidričevo
00050000-55f2-e0a8-f81a-e3c9b6f01309	1412	Kisovec
00050000-55f2-e0a8-7b8b-c05005db4290	6253	Knežak
00050000-55f2-e0a8-2370-7806c390c38d	5222	Kobarid
00050000-55f2-e0a8-9b02-28b1afed184c	9227	Kobilje
00050000-55f2-e0a8-68c3-295cb8ca1860	1330	Kočevje
00050000-55f2-e0a8-6faf-b059bd476d6e	1338	Kočevska Reka
00050000-55f2-e0a8-f074-4e857de85503	2276	Kog
00050000-55f2-e0a8-5b3c-de89717d4a39	5211	Kojsko
00050000-55f2-e0a8-b3fc-bfc87ca0da08	6223	Komen
00050000-55f2-e0a8-0a11-28dad2a1741d	1218	Komenda
00050000-55f2-e0a8-34dc-f21c4990a9cc	6000	Koper/Capodistria 
00050000-55f2-e0a8-9d68-061c386f21b1	6001	Koper/Capodistria - poštni predali
00050000-55f2-e0a8-9654-28f2d7afffc2	8282	Koprivnica
00050000-55f2-e0a8-7f6a-d99f8ce9a033	5296	Kostanjevica na Krasu
00050000-55f2-e0a8-be9e-9d92ebeea3b0	8311	Kostanjevica na Krki
00050000-55f2-e0a8-a026-f136384b8da4	1336	Kostel
00050000-55f2-e0a8-e0fd-34e86d805b7f	6256	Košana
00050000-55f2-e0a8-e64e-dceebeeebe64	2394	Kotlje
00050000-55f2-e0a8-b570-d4c709546f0c	6240	Kozina
00050000-55f2-e0a8-bfe1-941ef088ac14	3260	Kozje
00050000-55f2-e0a8-5274-496f45f81fca	4000	Kranj 
00050000-55f2-e0a8-bcdb-6b4a056e92cf	4001	Kranj - poštni predali
00050000-55f2-e0a8-be33-b9481795186e	4280	Kranjska Gora
00050000-55f2-e0a8-a19a-034d8cef4cb5	1281	Kresnice
00050000-55f2-e0a8-7c19-3d7cb088a180	4294	Križe
00050000-55f2-e0a8-377e-bba9bae3b49c	9206	Križevci
00050000-55f2-e0a8-beba-7d23f6def6c7	9242	Križevci pri Ljutomeru
00050000-55f2-e0a8-93db-ab93765fd136	1301	Krka
00050000-55f2-e0a8-8a4f-15c31f047c18	8296	Krmelj
00050000-55f2-e0a8-bd8a-f59678b116df	4245	Kropa
00050000-55f2-e0a8-8f1a-df5383d5fa1a	8262	Krška vas
00050000-55f2-e0a8-1c12-d03083681160	8270	Krško
00050000-55f2-e0a8-348a-e8fb2b65f0f7	9263	Kuzma
00050000-55f2-e0a8-f366-e63f1bcdb6a0	2318	Laporje
00050000-55f2-e0a8-0b59-60fde02fbf55	3270	Laško
00050000-55f2-e0a8-1da9-82090012b832	1219	Laze v Tuhinju
00050000-55f2-e0a8-43d6-11eb37975a65	2230	Lenart v Slovenskih goricah
00050000-55f2-e0a8-c829-d0649cf7870d	9220	Lendava/Lendva
00050000-55f2-e0a8-b7ac-0d1ccf800be9	4248	Lesce
00050000-55f2-e0a8-45d1-323f851ba21e	3261	Lesično
00050000-55f2-e0a8-e53a-0c83d5d5a5c7	8273	Leskovec pri Krškem
00050000-55f2-e0a8-1aed-d571dd527c8b	2372	Libeliče
00050000-55f2-e0a8-c613-bd2a0d3d0f9b	2341	Limbuš
00050000-55f2-e0a8-84eb-ff958c680ba9	1270	Litija
00050000-55f2-e0a8-3d07-139835ba85cf	3202	Ljubečna
00050000-55f2-e0a8-f9fa-1755cc787b9d	1000	Ljubljana 
00050000-55f2-e0a8-3589-f2ca874fb1a9	1001	Ljubljana - poštni predali
00050000-55f2-e0a8-89c1-70649d048838	1231	Ljubljana - Črnuče
00050000-55f2-e0a8-26aa-4842e9aa720e	1261	Ljubljana - Dobrunje
00050000-55f2-e0a8-831f-6ce8ebc0ddec	1260	Ljubljana - Polje
00050000-55f2-e0a8-9f8c-ff01e3980221	1210	Ljubljana - Šentvid
00050000-55f2-e0a8-2d6a-18c2e75732b6	1211	Ljubljana - Šmartno
00050000-55f2-e0a8-106e-e1773a22b84f	3333	Ljubno ob Savinji
00050000-55f2-e0a8-19a1-c5d4eabacd3d	9240	Ljutomer
00050000-55f2-e0a8-85c9-9a8ae767722e	3215	Loče
00050000-55f2-e0a8-ab5c-101586640016	5231	Log pod Mangartom
00050000-55f2-e0a8-51ec-5c85fc8a9262	1358	Log pri Brezovici
00050000-55f2-e0a8-6f05-1e421f0c0833	1370	Logatec
00050000-55f2-e0a8-91c4-b01e47d4f3b4	1371	Logatec
00050000-55f2-e0a8-d23b-61df7b2760ba	1434	Loka pri Zidanem Mostu
00050000-55f2-e0a8-073b-221d6e23556a	3223	Loka pri Žusmu
00050000-55f2-e0a8-d28e-5cc58de43229	6219	Lokev
00050000-55f2-e0a8-3bc7-49687beacc4d	1318	Loški Potok
00050000-55f2-e0a8-4ce3-66ca65cd417b	2324	Lovrenc na Dravskem polju
00050000-55f2-e0a8-f591-bcdb28d15018	2344	Lovrenc na Pohorju
00050000-55f2-e0a8-dc54-23e336f9fcbc	3334	Luče
00050000-55f2-e0a8-f159-2823159a609f	1225	Lukovica
00050000-55f2-e0a8-3eb3-fe9cc507c5ee	9202	Mačkovci
00050000-55f2-e0a8-e8ef-c3269a1bd205	2322	Majšperk
00050000-55f2-e0a8-4eb9-604d50c0d08c	2321	Makole
00050000-55f2-e0a8-5703-cbc187f76b88	9243	Mala Nedelja
00050000-55f2-e0a8-d77f-00a896f9b359	2229	Malečnik
00050000-55f2-e0a8-8a6d-e22508f28af9	6273	Marezige
00050000-55f2-e0a8-e818-f87fd8f5dd59	2000	Maribor 
00050000-55f2-e0a8-345f-26c96fc4ebcb	2001	Maribor - poštni predali
00050000-55f2-e0a8-b076-3c1a77a97ba5	2206	Marjeta na Dravskem polju
00050000-55f2-e0a8-0277-640e20056a59	2281	Markovci
00050000-55f2-e0a8-203f-dd325a50417d	9221	Martjanci
00050000-55f2-e0a8-5755-5a1bc7959e09	6242	Materija
00050000-55f2-e0a8-0dcb-3f7dfae5c3f4	4211	Mavčiče
00050000-55f2-e0a8-cbf3-ab1b8ec9155c	1215	Medvode
00050000-55f2-e0a8-094a-92f062a91b9c	1234	Mengeš
00050000-55f2-e0a8-c8d5-36686ea3ff0e	8330	Metlika
00050000-55f2-e0a8-f063-1d65d7264532	2392	Mežica
00050000-55f2-e0a8-0859-5fdfb0c965ff	2204	Miklavž na Dravskem polju
00050000-55f2-e0a8-6cc8-95db7703a0a7	2275	Miklavž pri Ormožu
00050000-55f2-e0a8-c412-fbebb5d43e75	5291	Miren
00050000-55f2-e0a8-b19d-b0ed5cd1cd37	8233	Mirna
00050000-55f2-e0a8-4fa5-51878c27beb2	8216	Mirna Peč
00050000-55f2-e0a8-400f-03bbbefe8d3d	2382	Mislinja
00050000-55f2-e0a8-2d25-260a3b6e097a	4281	Mojstrana
00050000-55f2-e0a8-496e-0643664170a8	8230	Mokronog
00050000-55f2-e0a8-e684-2c6f1ba26835	1251	Moravče
00050000-55f2-e0a8-c0a6-35fb437302f0	9226	Moravske Toplice
00050000-55f2-e0a8-c988-7f565c947fdf	5216	Most na Soči
00050000-55f2-e0a8-f487-ec0c7bec3a9d	1221	Motnik
00050000-55f2-e0a8-5426-8046b50d87e5	3330	Mozirje
00050000-55f2-e0a8-360e-3277e493b1df	9000	Murska Sobota 
00050000-55f2-e0a8-f597-89364ec13bd0	9001	Murska Sobota - poštni predali
00050000-55f2-e0a8-40bb-1b8f022190d4	2366	Muta
00050000-55f2-e0a8-e945-a81f363715bf	4202	Naklo
00050000-55f2-e0a8-9c4e-5123c18d724b	3331	Nazarje
00050000-55f2-e0a8-e580-d332331665db	1357	Notranje Gorice
00050000-55f2-e0a8-faf2-00403ad424ad	3203	Nova Cerkev
00050000-55f2-e0a8-28ea-88db3d8fa934	5000	Nova Gorica 
00050000-55f2-e0a8-3934-3050c3851168	5001	Nova Gorica - poštni predali
00050000-55f2-e0a8-6198-234561d1b791	1385	Nova vas
00050000-55f2-e0a8-b611-4491b407fcbb	8000	Novo mesto
00050000-55f2-e0a8-3acb-419a82031ded	8001	Novo mesto - poštni predali
00050000-55f2-e0a8-266b-4a9c8a007408	6243	Obrov
00050000-55f2-e0a8-acba-5979c52fcca4	9233	Odranci
00050000-55f2-e0a8-c011-f23578e36755	2317	Oplotnica
00050000-55f2-e0a8-eb11-344f6fb85c58	2312	Orehova vas
00050000-55f2-e0a8-ddf9-6d2f134c3e81	2270	Ormož
00050000-55f2-e0a8-8a3a-b1e8ca8ee589	1316	Ortnek
00050000-55f2-e0a8-50c7-4044a20aed97	1337	Osilnica
00050000-55f2-e0a8-f2c6-f367a3647dd2	8222	Otočec
00050000-55f2-e0a8-02c9-10216d5fe8c1	2361	Ožbalt
00050000-55f2-e0a8-090d-f3312661c4e7	2231	Pernica
00050000-55f2-e0a8-5f73-a6465add48bf	2211	Pesnica pri Mariboru
00050000-55f2-e0a8-d710-d6efce4796a1	9203	Petrovci
00050000-55f2-e0a8-8245-f1fb42df6457	3301	Petrovče
00050000-55f2-e0a8-4e53-2600b78c653e	6330	Piran/Pirano
00050000-55f2-e0a8-13fb-95d972847e2b	8255	Pišece
00050000-55f2-e0a8-0614-0a2cbe694311	6257	Pivka
00050000-55f2-e0a8-1dd6-8dcc73768f60	6232	Planina
00050000-55f2-e0a8-05c7-e124fbd47a7e	3225	Planina pri Sevnici
00050000-55f2-e0a8-a732-ae0f3550c28e	6276	Pobegi
00050000-55f2-e0a8-f65a-7a373605757c	8312	Podbočje
00050000-55f2-e0a8-7b5d-97fb6493d73a	5243	Podbrdo
00050000-55f2-e0a8-f446-41b98ada8030	3254	Podčetrtek
00050000-55f2-e0a8-6d0a-3925602431b1	2273	Podgorci
00050000-55f2-e0a8-aee7-4c024b431615	6216	Podgorje
00050000-55f2-e0a8-543b-1d770bf206d8	2381	Podgorje pri Slovenj Gradcu
00050000-55f2-e0a8-e7b7-25b1293f63dd	6244	Podgrad
00050000-55f2-e0a8-1a2d-29ab62948b88	1414	Podkum
00050000-55f2-e0a8-a4b8-db65159dedf9	2286	Podlehnik
00050000-55f2-e0a8-6f0f-31f7d802d89c	5272	Podnanos
00050000-55f2-e0a8-21c2-2179e7bf37a1	4244	Podnart
00050000-55f2-e0a8-9dd5-d436c1300660	3241	Podplat
00050000-55f2-e0a8-9c85-bba778ff5324	3257	Podsreda
00050000-55f2-e0a8-142e-5552bdc328b4	2363	Podvelka
00050000-55f2-e0a8-7504-40267991e4d8	2208	Pohorje
00050000-55f2-e0a8-522b-72ccf047d246	2257	Polenšak
00050000-55f2-e0a8-cb42-478d9ea1ff05	1355	Polhov Gradec
00050000-55f2-e0a8-ebd4-e811c86c5457	4223	Poljane nad Škofjo Loko
00050000-55f2-e0a8-c16d-fa260a6fa6c2	2319	Poljčane
00050000-55f2-e0a8-cd2d-6032115fa71e	1272	Polšnik
00050000-55f2-e0a8-f94b-3e4ef54a0028	3313	Polzela
00050000-55f2-e0a8-0225-18d13e88e896	3232	Ponikva
00050000-55f2-e0a8-a2a4-5ead374aa1bb	6320	Portorož/Portorose
00050000-55f2-e0a8-a36e-d6d0e89e1570	6230	Postojna
00050000-55f2-e0a8-39c1-76f037e7d47d	2331	Pragersko
00050000-55f2-e0a8-58dd-a517d9ca2d63	3312	Prebold
00050000-55f2-e0a8-f130-0827b2d9fddd	4205	Preddvor
00050000-55f2-e0a8-6d92-715bc51236b3	6255	Prem
00050000-55f2-e0a8-c4a3-092b89c81f72	1352	Preserje
00050000-55f2-e0a8-3079-c0290a44d20d	6258	Prestranek
00050000-55f2-e0a8-bce4-4b675ea80d3f	2391	Prevalje
00050000-55f2-e0a8-a84e-b66c7b13b2ef	3262	Prevorje
00050000-55f2-e0a8-9b51-0b66a9da0432	1276	Primskovo 
00050000-55f2-e0a8-aadb-5fa66f2ba17b	3253	Pristava pri Mestinju
00050000-55f2-e0a8-4b7e-274fbccfdaa4	9207	Prosenjakovci/Partosfalva
00050000-55f2-e0a8-c301-fd63d00b7404	5297	Prvačina
00050000-55f2-e0a8-b02a-88a73017ec91	2250	Ptuj
00050000-55f2-e0a8-8557-a72875e0f9d1	2323	Ptujska Gora
00050000-55f2-e0a8-55ba-135e5c004811	9201	Puconci
00050000-55f2-e0a8-300f-1869461022b6	2327	Rače
00050000-55f2-e0a8-4d45-275ae7a69d3a	1433	Radeče
00050000-55f2-e0a8-c753-7e66d57a355c	9252	Radenci
00050000-55f2-e0a8-fc6b-8612a7629284	2360	Radlje ob Dravi
00050000-55f2-e0a8-ecb2-a8962fbeb077	1235	Radomlje
00050000-55f2-e0a8-702c-21e45b23e725	4240	Radovljica
00050000-55f2-e0a8-8645-b01f8cb3221d	8274	Raka
00050000-55f2-e0a8-4f0f-f80480caaa9a	1381	Rakek
00050000-55f2-e0a8-00b0-0fe812226354	4283	Rateče - Planica
00050000-55f2-e0a8-1ba7-7c9eb211922a	2390	Ravne na Koroškem
00050000-55f2-e0a8-71a1-d1c12cb279b7	9246	Razkrižje
00050000-55f2-e0a8-34da-ed9f893bb688	3332	Rečica ob Savinji
00050000-55f2-e0a8-50ae-f2b92dcf8f69	5292	Renče
00050000-55f2-e0a8-a027-68cce2d4d20c	1310	Ribnica
00050000-55f2-e0a8-77f8-08d5c701d452	2364	Ribnica na Pohorju
00050000-55f2-e0a8-ad7d-09be928aba2c	3272	Rimske Toplice
00050000-55f2-e0a8-a651-1147a8def959	1314	Rob
00050000-55f2-e0a8-e201-616f37fefaa3	5215	Ročinj
00050000-55f2-e0a8-bdc5-292467ffc669	3250	Rogaška Slatina
00050000-55f2-e0a8-dc20-d152cbeafef7	9262	Rogašovci
00050000-55f2-e0a8-1737-6ceb4d7b526b	3252	Rogatec
00050000-55f2-e0a8-a445-a9b232a7f12f	1373	Rovte
00050000-55f2-e0a8-d10f-7cccd1c7e447	2342	Ruše
00050000-55f2-e0a8-7a88-070e60bcb750	1282	Sava
00050000-55f2-e0a8-2c95-312c1c6736ba	6333	Sečovlje/Sicciole
00050000-55f2-e0a8-2c61-dcac8568be74	4227	Selca
00050000-55f2-e0a8-f14a-11f9973c3b31	2352	Selnica ob Dravi
00050000-55f2-e0a8-e8c1-69271bf1577c	8333	Semič
00050000-55f2-e0a8-5989-d0767eb29f8c	8281	Senovo
00050000-55f2-e0a8-700a-b4e597b10c2c	6224	Senožeče
00050000-55f2-e0a8-9b35-e6224ae5a2df	8290	Sevnica
00050000-55f2-e0a8-d125-286a8b497af4	6210	Sežana
00050000-55f2-e0a8-00df-6d8a8b1dd722	2214	Sladki Vrh
00050000-55f2-e0a8-79ab-cfdc63c6a0b0	5283	Slap ob Idrijci
00050000-55f2-e0a8-5389-3c51edaafc86	2380	Slovenj Gradec
00050000-55f2-e0a8-dccd-7040c436dab4	2310	Slovenska Bistrica
00050000-55f2-e0a8-5f01-99d353cbc584	3210	Slovenske Konjice
00050000-55f2-e0a8-9120-267eb18e0d2a	1216	Smlednik
00050000-55f2-e0a8-46b3-7095ddf47c8b	5232	Soča
00050000-55f2-e0a8-3037-9e119ef30715	1317	Sodražica
00050000-55f2-e0a8-1986-ae9d6cc4bedc	3335	Solčava
00050000-55f2-e0a8-a19e-19d8c0f6b6fa	5250	Solkan
00050000-55f2-e0a8-0f3a-b404e3e077e4	4229	Sorica
00050000-55f2-e0a8-22e8-0287c1818524	4225	Sovodenj
00050000-55f2-e0a8-3b9d-9fa6784e0461	5281	Spodnja Idrija
00050000-55f2-e0a8-341d-43b639451c4c	2241	Spodnji Duplek
00050000-55f2-e0a8-ea90-aee363a0270a	9245	Spodnji Ivanjci
00050000-55f2-e0a8-1055-c3ac5c1ac7ff	2277	Središče ob Dravi
00050000-55f2-e0a8-1b53-b67b5bc56f9c	4267	Srednja vas v Bohinju
00050000-55f2-e0a8-bb19-a9615dd846e9	8256	Sromlje 
00050000-55f2-e0a8-794f-a0a790798e39	5224	Srpenica
00050000-55f2-e0a8-747c-f37720d36775	1242	Stahovica
00050000-55f2-e0a8-ab96-858d75a84860	1332	Stara Cerkev
00050000-55f2-e0a8-002a-276feebefa80	8342	Stari trg ob Kolpi
00050000-55f2-e0a8-4740-e2a89b2fdb04	1386	Stari trg pri Ložu
00050000-55f2-e0a8-aeb0-fe34b3314e5b	2205	Starše
00050000-55f2-e0a8-9790-fddfa07195de	2289	Stoperce
00050000-55f2-e0a8-dd0f-33e7bec6814b	8322	Stopiče
00050000-55f2-e0a8-2b0a-e69b7ccbb36b	3206	Stranice
00050000-55f2-e0a8-8094-252a81537f62	8351	Straža
00050000-55f2-e0a8-64d1-eb1dca1f012e	1313	Struge
00050000-55f2-e0a8-8532-5d6e088c7baf	8293	Studenec
00050000-55f2-e0a8-cbd4-040dac4ca51a	8331	Suhor
00050000-55f2-e0a8-403e-e66689ef05a1	2233	Sv. Ana v Slovenskih goricah
00050000-55f2-e0a8-0a8d-9787949b1447	2235	Sv. Trojica v Slovenskih goricah
00050000-55f2-e0a8-2241-2593856b9619	2353	Sveti Duh na Ostrem Vrhu
00050000-55f2-e0a8-9eb2-ad93412e768f	9244	Sveti Jurij ob Ščavnici
00050000-55f2-e0a8-ea17-50ed1140356f	3264	Sveti Štefan
00050000-55f2-e0a8-d64d-51997a0626e3	2258	Sveti Tomaž
00050000-55f2-e0a8-2f25-5fc84f2758b1	9204	Šalovci
00050000-55f2-e0a8-dfd8-cfa92a664d04	5261	Šempas
00050000-55f2-e0a8-4986-12be8decc559	5290	Šempeter pri Gorici
00050000-55f2-e0a8-0077-ae040db2dd9b	3311	Šempeter v Savinjski dolini
00050000-55f2-e0a8-7aed-00d8fa52fdf2	4208	Šenčur
00050000-55f2-e0a8-ff5d-7b547af7193f	2212	Šentilj v Slovenskih goricah
00050000-55f2-e0a8-ff7a-58e0c9500783	8297	Šentjanž
00050000-55f2-e0a8-c66a-df6edbca1997	2373	Šentjanž pri Dravogradu
00050000-55f2-e0a8-c777-cbed4d022610	8310	Šentjernej
00050000-55f2-e0a8-7d93-e10db2563325	3230	Šentjur
00050000-55f2-e0a8-693e-a0627aa310dc	3271	Šentrupert
00050000-55f2-e0a8-86ff-d7457563314d	8232	Šentrupert
00050000-55f2-e0a8-2190-5285a1ffe835	1296	Šentvid pri Stični
00050000-55f2-e0a8-aee3-1b66c521e6a0	8275	Škocjan
00050000-55f2-e0a8-9c86-a808030d2e22	6281	Škofije
00050000-55f2-e0a8-b00f-dc859528436d	4220	Škofja Loka
00050000-55f2-e0a8-a142-f9cbe02b8e69	3211	Škofja vas
00050000-55f2-e0a8-ee59-949899a7d1c3	1291	Škofljica
00050000-55f2-e0a8-063d-fe5422d8326d	6274	Šmarje
00050000-55f2-e0a8-35ba-8dd8068095ef	1293	Šmarje - Sap
00050000-55f2-e0a8-f3c8-640ad7f45c4a	3240	Šmarje pri Jelšah
00050000-55f2-e0a8-7c98-21222b22ac63	8220	Šmarješke Toplice
00050000-55f2-e0a8-8989-715ccfa08c1c	2315	Šmartno na Pohorju
00050000-55f2-e0a8-f82f-2f90506ef3ac	3341	Šmartno ob Dreti
00050000-55f2-e0a8-05c4-f01fd37965d9	3327	Šmartno ob Paki
00050000-55f2-e0a8-58c9-70eeb3fa69ad	1275	Šmartno pri Litiji
00050000-55f2-e0a8-903b-0e655865d5ad	2383	Šmartno pri Slovenj Gradcu
00050000-55f2-e0a8-8430-24c316967c9c	3201	Šmartno v Rožni dolini
00050000-55f2-e0a8-baf7-4d60b20d0786	3325	Šoštanj
00050000-55f2-e0a8-4671-e7d28fd87af0	6222	Štanjel
00050000-55f2-e0a8-4217-299e85cd6d60	3220	Štore
00050000-55f2-e0a8-7afc-ef39eef7adfd	3304	Tabor
00050000-55f2-e0a8-3855-b94686b5b0dc	3221	Teharje
00050000-55f2-e0a8-8de7-d3d45b457071	9251	Tišina
00050000-55f2-e0a8-ddc3-092df5241182	5220	Tolmin
00050000-55f2-e0a8-f479-399b71344544	3326	Topolšica
00050000-55f2-e0a8-05aa-b1271a548df1	2371	Trbonje
00050000-55f2-e0a8-1ac8-375d02ed6448	1420	Trbovlje
00050000-55f2-e0a8-5c27-ead6cde9b565	8231	Trebelno 
00050000-55f2-e0a8-c739-a92d18b003d4	8210	Trebnje
00050000-55f2-e0a8-1bbc-de5e3b7e1b62	5252	Trnovo pri Gorici
00050000-55f2-e0a8-1cfd-419fada009f7	2254	Trnovska vas
00050000-55f2-e0a8-3811-b79e0fbbc737	1222	Trojane
00050000-55f2-e0a8-c1ca-c80c6f1fc94b	1236	Trzin
00050000-55f2-e0a8-4a1a-7c2842a80516	4290	Tržič
00050000-55f2-e0a8-ced4-2bbed532dc8a	8295	Tržišče
00050000-55f2-e0a8-8c7f-16210d79ca1e	1311	Turjak
00050000-55f2-e0a8-7c03-71ad18aaf6cb	9224	Turnišče
00050000-55f2-e0a8-6f34-b24c6f6ef3d0	8323	Uršna sela
00050000-55f2-e0a8-a120-78121b068e7b	1252	Vače
00050000-55f2-e0a8-d4e8-1e1af927b807	3320	Velenje 
00050000-55f2-e0a8-2522-963319399588	3322	Velenje - poštni predali
00050000-55f2-e0a8-7150-70dccda9bc98	8212	Velika Loka
00050000-55f2-e0a8-464e-9b92aec51a1c	2274	Velika Nedelja
00050000-55f2-e0a8-808a-9b877aca6f2b	9225	Velika Polana
00050000-55f2-e0a8-6771-131d1e6ea907	1315	Velike Lašče
00050000-55f2-e0a8-504b-e3ae941c9172	8213	Veliki Gaber
00050000-55f2-e0a8-69ad-24146a926af4	9241	Veržej
00050000-55f2-e0a8-8d6c-eaedf1fe8362	1312	Videm - Dobrepolje
00050000-55f2-e0a8-ce53-4228301b4d2c	2284	Videm pri Ptuju
00050000-55f2-e0a8-4da4-bff3c000ddd4	8344	Vinica
00050000-55f2-e0a8-9908-d7663abf7f5d	5271	Vipava
00050000-55f2-e0a8-8c92-dd75caf92bd1	4212	Visoko
00050000-55f2-e0a8-4443-16b71a2b7c07	1294	Višnja Gora
00050000-55f2-e0a8-0d86-b63148566839	3205	Vitanje
00050000-55f2-e0a8-90d3-739ba4d0805c	2255	Vitomarci
00050000-55f2-e0a8-2dd6-5e9fc6f105f7	1217	Vodice
00050000-55f2-e0a8-9643-48076311c2bd	3212	Vojnik\t
00050000-55f2-e0a8-88bb-ada2d3732da9	5293	Volčja Draga
00050000-55f2-e0a8-d283-df41eefa7e4a	2232	Voličina
00050000-55f2-e0a8-f7b3-55c21f8cafb6	3305	Vransko
00050000-55f2-e0a8-f7ac-0c788c51565e	6217	Vremski Britof
00050000-55f2-e0a8-8dc2-a35794eeb273	1360	Vrhnika
00050000-55f2-e0a8-4c99-c17309c37d55	2365	Vuhred
00050000-55f2-e0a8-0332-e83031a76298	2367	Vuzenica
00050000-55f2-e0a8-f6bd-99d4f8222a16	8292	Zabukovje 
00050000-55f2-e0a8-16ea-520564c3423a	1410	Zagorje ob Savi
00050000-55f2-e0a8-4a7e-b97101aac881	1303	Zagradec
00050000-55f2-e0a8-dd15-33b646aaf9e2	2283	Zavrč
00050000-55f2-e0a8-57e5-339d6fb06dce	8272	Zdole 
00050000-55f2-e0a8-f9bc-eb7afd5fc2dd	4201	Zgornja Besnica
00050000-55f2-e0a8-04df-d0bb7eccf2fd	2242	Zgornja Korena
00050000-55f2-e0a8-59e3-e51c0a60b79e	2201	Zgornja Kungota
00050000-55f2-e0a8-98af-3f236482009e	2316	Zgornja Ložnica
00050000-55f2-e0a8-adc8-07bae13dd6f9	2314	Zgornja Polskava
00050000-55f2-e0a8-b888-79aa27aadbe2	2213	Zgornja Velka
00050000-55f2-e0a8-8735-1320ef1bb326	4247	Zgornje Gorje
00050000-55f2-e0a8-45dc-38a2ec187211	4206	Zgornje Jezersko
00050000-55f2-e0a8-8bb3-5829f79b3b65	2285	Zgornji Leskovec
00050000-55f2-e0a8-4750-94d60d5695d6	1432	Zidani Most
00050000-55f2-e0a8-e18e-2cf3ad8fe60d	3214	Zreče
00050000-55f2-e0a8-74b3-15afa1c31faa	4209	Žabnica
00050000-55f2-e0a8-94dc-a906873d72d6	3310	Žalec
00050000-55f2-e0a8-bb37-06f9e3f03945	4228	Železniki
00050000-55f2-e0a8-d5c4-b6f415ecea56	2287	Žetale
00050000-55f2-e0a8-2b1a-367473b9fa48	4226	Žiri
00050000-55f2-e0a8-50f1-623a4f880550	4274	Žirovnica
00050000-55f2-e0a8-a663-27194d2e68eb	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 19018032)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 19017664)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 19017474)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f2-e0aa-c8e8-835567d6ab11	00080000-55f2-e0a9-ee4d-a7de7f40a85b	\N	00040000-55f2-e0a8-6c2f-de8367fade71	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f2-e0aa-0c3f-06b7f53df1ff	00080000-55f2-e0a9-ee4d-a7de7f40a85b	\N	00040000-55f2-e0a8-6c2f-de8367fade71	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f2-e0aa-980a-9ef10738fc15	00080000-55f2-e0a9-52b4-30d58429ac35	\N	00040000-55f2-e0a8-6c2f-de8367fade71	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 19017552)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19017676)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19018046)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19018056)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f2-e0aa-30d1-5fa2deae1cb7	00080000-55f2-e0a9-c7b6-55cda3e08808	0987	AK
00190000-55f2-e0aa-fa15-b662374cd917	00080000-55f2-e0a9-52b4-30d58429ac35	0989	AK
00190000-55f2-e0aa-7203-42b375f537fb	00080000-55f2-e0a9-646c-3fd99ff3af23	0986	AK
00190000-55f2-e0aa-7d39-c5ee7a947940	00080000-55f2-e0a9-1d3e-259a6601a38f	0984	AK
00190000-55f2-e0aa-fc44-393a017a8f70	00080000-55f2-e0a9-fb23-f2d11fbd8a92	0983	AK
00190000-55f2-e0aa-a88f-2195cb0c36fe	00080000-55f2-e0a9-5549-2114b9f7d0e8	0982	AK
00190000-55f2-e0ab-2a93-2c6ec749d398	00080000-55f2-e0ab-9223-f76810bd6429	1001	AK
\.


--
-- TOC entry 2989 (class 0 OID 19017989)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f2-e0aa-e79b-efd883ae76a1	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2993 (class 0 OID 19018064)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 19017705)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f2-e0a9-c81d-b40be7fd3e77	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f2-e0a9-fe91-b0fb54df89a7	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f2-e0a9-eddb-cf35d9933af3	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f2-e0a9-b59c-e5e028bf76b5	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f2-e0a9-2f3e-3cb25d9c5d08	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f2-e0a9-95a9-6a6069488523	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f2-e0a9-b270-87792b9d19e2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2962 (class 0 OID 19017649)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19017639)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19017842)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19017779)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 19017347)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f2-e0ab-9223-f76810bd6429	00010000-55f2-e0a8-4f7b-abe9cf33d8ae	2015-09-11 16:09:47	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f2-e0ab-bd42-37ce95913c10	00010000-55f2-e0a8-4f7b-abe9cf33d8ae	2015-09-11 16:09:47	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f2-e0ab-2a93-2c6ec749d398	00010000-55f2-e0a8-4f7b-abe9cf33d8ae	2015-09-11 16:09:47	INS	a:0:{}
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2971 (class 0 OID 19017718)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 19017385)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f2-e0a8-6dbe-f71ade934895	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f2-e0a8-45d4-5893e2167600	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f2-e0a8-7192-3ae3c4846ac3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f2-e0a8-c56c-25deaf983ac5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f2-e0a8-25ca-6ae0c69e5efb	planer	Planer dogodkov v koledarju	t
00020000-55f2-e0a8-2ed6-0cd279117ec1	kadrovska	Kadrovska služba	t
00020000-55f2-e0a8-1bab-9d4f91d5940f	arhivar	Ažuriranje arhivalij	t
00020000-55f2-e0a8-05e4-a8fb1b691da8	igralec	Igralec	t
00020000-55f2-e0a8-833a-85bc60aa087b	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f2-e0a9-f814-9c8b6c10740e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2938 (class 0 OID 19017369)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f2-e0a8-127b-49034e0c05d8	00020000-55f2-e0a8-7192-3ae3c4846ac3
00010000-55f2-e0a8-4f7b-abe9cf33d8ae	00020000-55f2-e0a8-7192-3ae3c4846ac3
00010000-55f2-e0aa-14f1-58a591b2be6a	00020000-55f2-e0a9-f814-9c8b6c10740e
\.


--
-- TOC entry 2973 (class 0 OID 19017732)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19017670)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 19017616)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 19017334)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f2-e0a8-abcb-f3bf0db0dd57	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f2-e0a8-4c41-218ead9bb450	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f2-e0a8-6214-985be3d664e5	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f2-e0a8-dd10-c36c79ea982a	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f2-e0a8-b4fc-c4052a45f866	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2933 (class 0 OID 19017326)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f2-e0a8-144d-156ed049ad0c	00230000-55f2-e0a8-dd10-c36c79ea982a	popa
00240000-55f2-e0a8-81b9-5dc5ed830b73	00230000-55f2-e0a8-dd10-c36c79ea982a	oseba
00240000-55f2-e0a8-caa3-1a9c9896c179	00230000-55f2-e0a8-dd10-c36c79ea982a	sezona
00240000-55f2-e0a8-6472-504383610132	00230000-55f2-e0a8-4c41-218ead9bb450	prostor
00240000-55f2-e0a8-ce24-616704bade82	00230000-55f2-e0a8-dd10-c36c79ea982a	besedilo
00240000-55f2-e0a8-21d5-0b924f0016e0	00230000-55f2-e0a8-dd10-c36c79ea982a	uprizoritev
00240000-55f2-e0a8-b5c8-a76391aaeeb8	00230000-55f2-e0a8-dd10-c36c79ea982a	funkcija
00240000-55f2-e0a8-b622-a7ec9bfe9217	00230000-55f2-e0a8-dd10-c36c79ea982a	tipfunkcije
00240000-55f2-e0a8-282a-71473d7831d9	00230000-55f2-e0a8-dd10-c36c79ea982a	alternacija
00240000-55f2-e0a8-e58a-bd76e1771527	00230000-55f2-e0a8-abcb-f3bf0db0dd57	pogodba
00240000-55f2-e0a8-6428-0d193b2ca643	00230000-55f2-e0a8-dd10-c36c79ea982a	zaposlitev
00240000-55f2-e0a8-9ed0-bcce6da7835c	00230000-55f2-e0a8-dd10-c36c79ea982a	zvrstuprizoritve
00240000-55f2-e0a8-4934-3dc8eb0ab632	00230000-55f2-e0a8-abcb-f3bf0db0dd57	programdela
00240000-55f2-e0a8-512f-035af78b328b	00230000-55f2-e0a8-dd10-c36c79ea982a	zapis
\.


--
-- TOC entry 2932 (class 0 OID 19017321)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
96774869-f1ba-4eed-b593-c820797beb20	00240000-55f2-e0a8-144d-156ed049ad0c	0	1001
\.


--
-- TOC entry 2978 (class 0 OID 19017789)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f2-e0aa-461f-9004bddad877	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	00080000-55f2-e0a9-ee4d-a7de7f40a85b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f2-e0a8-f370-c0288a83fe1d
00270000-55f2-e0aa-2bc9-312b1e7f4337	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	00080000-55f2-e0a9-ee4d-a7de7f40a85b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f2-e0a8-f370-c0288a83fe1d
\.


--
-- TOC entry 2945 (class 0 OID 19017447)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 19017626)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f2-e0aa-9855-cca383b77802	00180000-55f2-e0aa-5a42-f9ab5cf7a5e0	000c0000-55f2-e0aa-0850-ea959490cc12	00090000-55f2-e0aa-d37e-7f8c483d2d36	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f2-e0aa-267f-fda90383c51b	00180000-55f2-e0aa-5a42-f9ab5cf7a5e0	000c0000-55f2-e0aa-bdb5-847c4f082549	00090000-55f2-e0aa-1ba7-2352ff3e5c70	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f2-e0aa-3136-5ca66ba46bc1	00180000-55f2-e0aa-5a42-f9ab5cf7a5e0	000c0000-55f2-e0aa-182a-e27bd4202c9d	00090000-55f2-e0aa-8685-d038d5b67903	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f2-e0aa-dc1a-26a8d8ac7581	00180000-55f2-e0aa-5a42-f9ab5cf7a5e0	000c0000-55f2-e0aa-9a18-a02b203ddeba	00090000-55f2-e0aa-1426-a02e17591fc6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f2-e0aa-bbcd-73fd0dcf80c9	00180000-55f2-e0aa-5a42-f9ab5cf7a5e0	000c0000-55f2-e0aa-0ee7-43b4d932fb22	00090000-55f2-e0aa-2dc4-ebe078ce74dd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f2-e0aa-2090-3319c0a8d729	00180000-55f2-e0aa-0907-44eefbf19569	\N	00090000-55f2-e0aa-2dc4-ebe078ce74dd	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2981 (class 0 OID 19017830)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f2-e0a8-78bd-ad103f6a69f0	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f2-e0a8-dfc5-33e9baf6a841	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f2-e0a8-deec-d7eb9cc4d6fc	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f2-e0a8-b634-6a9e3a90abb2	04	Režija	Režija	Režija	umetnik
000f0000-55f2-e0a8-dfe9-ad0a3265a7d2	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f2-e0a8-7e9b-701890edcac3	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f2-e0a8-f036-c7f9148ecd52	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f2-e0a8-bbec-54ceffb77bb4	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f2-e0a8-497c-bea899b34f3a	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f2-e0a8-08aa-55e6c2cd6c4f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f2-e0a8-6a09-556d485c9a86	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f2-e0a8-d19c-d622d7879a37	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f2-e0a8-d0f2-ce5967a2b49d	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f2-e0a8-ede4-4a58ab2761f6	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f2-e0a8-8704-19e3e71b25c1	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f2-e0a8-d06e-e6c4f95bd0f0	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f2-e0a8-fabe-3916accdcc40	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f2-e0a8-11d7-15eab3181510	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2994 (class 0 OID 19018074)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f2-e0a8-8147-94309e4ebe77	01	Velika predstava	f	1.00	1.00
002b0000-55f2-e0a8-3676-767314b80f43	02	Mala predstava	f	0.50	0.50
002b0000-55f2-e0a8-8a17-27ff3ddf29a4	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f2-e0a8-f9dd-6d7b062248c8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f2-e0a8-0a7c-52fa32ba3186	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2950 (class 0 OID 19017509)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 19017356)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f2-e0a8-4f7b-abe9cf33d8ae	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROA/MHYybzZxPzgWOrIaIY53PFTQuOyOm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f2-e0a9-e812-d5c16042068e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f2-e0a9-ddfa-37d75a127535	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f2-e0aa-fdbb-6d176b26290e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f2-e0aa-6f8d-0f51bc422124	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f2-e0aa-28b6-d26244672858	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f2-e0aa-34ce-21a489fe1341	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f2-e0aa-4bf9-7f591671981e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f2-e0aa-57df-40bb6c94c47c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f2-e0aa-127e-afc341b76660	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f2-e0aa-14f1-58a591b2be6a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f2-e0a8-127b-49034e0c05d8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2985 (class 0 OID 19017879)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f2-e0aa-5ce8-43742638863c	00160000-55f2-e0a9-98eb-431521259c34	\N	00140000-55f2-e0a8-5b5d-6e1a59894757	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f2-e0a9-2f3e-3cb25d9c5d08
000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	00160000-55f2-e0a9-63b6-c9436d1b52ab	\N	00140000-55f2-e0a8-b722-500903a9d512	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f2-e0a9-95a9-6a6069488523
000e0000-55f2-e0aa-eba4-d7088a9c1a18	\N	\N	00140000-55f2-e0a8-b722-500903a9d512	00190000-55f2-e0aa-30d1-5fa2deae1cb7	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f2-e0a9-2f3e-3cb25d9c5d08
000e0000-55f2-e0aa-040d-d6d2efc25116	\N	\N	00140000-55f2-e0a8-b722-500903a9d512	00190000-55f2-e0aa-30d1-5fa2deae1cb7	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f2-e0a9-2f3e-3cb25d9c5d08
000e0000-55f2-e0aa-0075-95c1cb4dd791	\N	\N	00140000-55f2-e0a8-b722-500903a9d512	00190000-55f2-e0aa-30d1-5fa2deae1cb7	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f2-e0a9-c81d-b40be7fd3e77
000e0000-55f2-e0aa-45af-e977c9dad621	\N	\N	00140000-55f2-e0a8-b722-500903a9d512	00190000-55f2-e0aa-30d1-5fa2deae1cb7	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f2-e0a9-c81d-b40be7fd3e77
\.


--
-- TOC entry 2955 (class 0 OID 19017570)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f2-e0aa-6da5-832b17926695	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	\N	1	
00200000-55f2-e0aa-d5f1-e80b3d14f6f0	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	\N	2	
00200000-55f2-e0aa-f442-83b0303e6cc8	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	\N	3	
00200000-55f2-e0aa-8b90-3cc9da29f088	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	\N	4	
00200000-55f2-e0aa-c03d-735f0fc52465	000e0000-55f2-e0aa-3f83-ef8d4e51e2d1	\N	5	
\.


--
-- TOC entry 2969 (class 0 OID 19017697)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19017803)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f2-e0a8-7184-c93f1c53235d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f2-e0a8-9e6b-62efcbb81456	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f2-e0a8-acb5-fc00534134d8	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f2-e0a8-0956-1bee33552335	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f2-e0a8-f423-d98df717b7c0	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f2-e0a8-b618-4aeb33d390d3	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f2-e0a8-142a-2c9ba5129701	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f2-e0a8-c36b-f874aaf4e7e8	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f2-e0a8-f370-c0288a83fe1d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f2-e0a8-ba67-d47f2bd5d2a2	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f2-e0a8-a49b-29dbef90a7f6	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f2-e0a8-0260-d52719f58953	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f2-e0a8-f83a-bf45a6bca90f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f2-e0a8-8adc-6ef2c87c6124	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f2-e0a8-bb08-d1c9d4f79922	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f2-e0a8-ccd8-05f36665103d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f2-e0a8-309a-4c3a2b11a7a9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f2-e0a8-1a97-d54d06fef766	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f2-e0a8-98f4-019723601ee6	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f2-e0a8-054f-a9aaaaec6256	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f2-e0a8-4538-64f138135b81	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f2-e0a8-0c74-6db73e8134ee	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f2-e0a8-a448-01316abcf1cb	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f2-e0a8-0e70-d10954f16227	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f2-e0a8-13da-9a1830f38478	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f2-e0a8-42ed-524d6c34089f	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f2-e0a8-2140-bfad35fe1865	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f2-e0a8-81aa-d27c2922157a	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2997 (class 0 OID 19018120)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 19018092)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 19018132)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 19017769)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f2-e0aa-ba12-bb114d70a656	00090000-55f2-e0aa-1ba7-2352ff3e5c70	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f2-e0aa-f5ea-17563e83f85d	00090000-55f2-e0aa-8685-d038d5b67903	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f2-e0aa-0239-d19d9cd096f5	00090000-55f2-e0aa-2cac-32c4b7a0ee4c	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f2-e0aa-16d9-bedf52e87ad5	00090000-55f2-e0aa-f53b-cddb08e5fc25	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f2-e0aa-b7d3-6cbf57bc8640	00090000-55f2-e0aa-d37e-7f8c483d2d36	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f2-e0aa-7e0b-0c1a4233f1ba	00090000-55f2-e0aa-a2d2-cd0f92cd09c2	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2957 (class 0 OID 19017606)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19017869)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f2-e0a8-5b5d-6e1a59894757	01	Drama	drama (SURS 01)
00140000-55f2-e0a8-57c5-cf2fdbeb5956	02	Opera	opera (SURS 02)
00140000-55f2-e0a8-95ed-c8a8512a88d3	03	Balet	balet (SURS 03)
00140000-55f2-e0a8-8bf6-e81591ce5a71	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f2-e0a8-870e-9be64f573cae	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f2-e0a8-b722-500903a9d512	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f2-e0a8-85da-30ebf5f0e49c	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2975 (class 0 OID 19017759)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 19017410)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 19017928)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 19017918)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 19017828)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 19018172)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 19017595)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 19017615)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 19018090)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19017535)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 19017983)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 19017755)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 19017568)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 19017549)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 19017662)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 19018149)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 19018156)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 19018180)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 19017689)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 19017507)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 19017419)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 19017443)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 19017399)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 19017384)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 19017695)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 19017731)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 19017864)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19017471)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19017495)
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
-- TOC entry 2679 (class 2606 OID 19018044)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 19017668)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 19017485)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19017556)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 19017680)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 19018053)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 19018061)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 19018031)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 19018072)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 19017713)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 19017653)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 19017644)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 19017852)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 19017786)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 19017355)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 19017722)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 19017373)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 19017393)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 19017740)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 19017675)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 19017624)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 19017343)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19017331)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 19017325)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 19017799)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 19017452)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 19017635)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 19017839)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 19018084)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 19017520)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 19017368)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 19017897)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 19017578)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 19017703)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 19017811)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 19018130)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 19018114)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 19018138)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 19017777)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 19017610)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 19017877)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 19017767)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 19017604)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 19017605)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 19017603)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 19017602)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 19017601)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2624 (class 1259 OID 19017800)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 19017801)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 19017802)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 19018151)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 19018150)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 19017473)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 19017696)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 19018118)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 19018117)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 19018119)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 19018116)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 19018115)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 19017682)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 19017681)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 19017579)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 19017756)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19017758)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 19017757)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 19017551)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 19017550)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 19018073)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 19017866)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 19017867)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 19017868)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 19018139)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 19017902)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 19017899)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 19017903)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 19017901)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 19017900)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 19017522)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 19017521)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 19017446)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 19017723)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 19017400)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 19017401)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 19017743)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 19017742)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 19017741)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 19017557)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 19017558)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 19017333)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 19017648)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 19017646)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 19017645)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 19017647)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 19017374)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 19017375)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 19017704)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 19018173)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 19018181)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 19018182)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 19017669)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 19017787)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 19017788)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 19017988)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 19017987)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 19017984)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 19017985)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 19017986)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 19017487)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 19017486)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 19017488)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 19017717)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 19017716)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 19018054)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 19018055)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 19017932)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 19017933)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 19017930)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 19017931)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 19017778)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 19017657)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 19017656)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 19017654)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 19017655)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 19017920)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 19017919)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 19017569)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 19018045)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 19018091)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 19018157)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 19018158)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 19017421)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 19017420)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 19017453)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19017454)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 19017638)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 19017637)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 19017636)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 19017597)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2545 (class 1259 OID 19017598)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2546 (class 1259 OID 19017596)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2547 (class 1259 OID 19017600)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2548 (class 1259 OID 19017599)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 19017472)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 19017536)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19017538)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 19017537)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 19017539)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 19017663)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 19017865)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 19017898)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 19017840)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19017841)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 19017444)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 19017445)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 19017768)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 19017344)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19017508)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 19017332)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2597 (class 1259 OID 19017715)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 19017714)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 19017929)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 19017496)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 19017878)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 19018131)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 19018062)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 19018063)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 19017829)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 19017625)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 19017394)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 19018303)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 19018308)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 19018328)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 19018298)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 19018318)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 19018323)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 19018313)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2785 (class 2606 OID 19018478)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2784 (class 2606 OID 19018483)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2783 (class 2606 OID 19018488)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 19018653)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2818 (class 2606 OID 19018648)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 19018238)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 19018408)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2812 (class 2606 OID 19018633)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 19018628)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 19018638)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 19018623)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2815 (class 2606 OID 19018618)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2767 (class 2606 OID 19018403)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 19018398)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 19018293)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 19018448)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 19018458)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 19018453)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 19018273)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 19018268)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 19018388)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 19018608)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 19018493)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 19018498)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 19018503)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2816 (class 2606 OID 19018643)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2790 (class 2606 OID 19018523)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2793 (class 2606 OID 19018508)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2789 (class 2606 OID 19018528)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2791 (class 2606 OID 19018518)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2792 (class 2606 OID 19018513)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 19018263)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 19018258)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 19018223)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 19018218)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 19018428)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 19018198)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 19018203)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2774 (class 2606 OID 19018443)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 19018438)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 19018433)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 19018278)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 19018283)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 19018183)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2757 (class 2606 OID 19018363)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2759 (class 2606 OID 19018353)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2760 (class 2606 OID 19018348)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2758 (class 2606 OID 19018358)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 19018188)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 19018193)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 19018413)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2821 (class 2606 OID 19018668)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 19018673)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2822 (class 2606 OID 19018678)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 19018393)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2782 (class 2606 OID 19018468)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2781 (class 2606 OID 19018473)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 19018583)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 19018578)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 19018563)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 19018568)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2802 (class 2606 OID 19018573)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 19018248)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 19018243)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 19018253)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 19018423)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2772 (class 2606 OID 19018418)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2807 (class 2606 OID 19018593)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2806 (class 2606 OID 19018598)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2797 (class 2606 OID 19018553)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 19018558)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2799 (class 2606 OID 19018543)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2798 (class 2606 OID 19018548)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 19018463)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 19018383)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2762 (class 2606 OID 19018378)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 19018368)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2763 (class 2606 OID 19018373)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 19018538)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2795 (class 2606 OID 19018533)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 19018288)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 19018588)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2808 (class 2606 OID 19018603)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 19018613)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 19018658)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 19018663)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 19018213)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 19018208)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 19018228)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 19018233)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 19018343)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 19018338)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 19018333)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-11 16:09:48 CEST

--
-- PostgreSQL database dump complete
--

