--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-17 08:27:25 CEST

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
-- TOC entry 181 (class 1259 OID 19887364)
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
-- TOC entry 226 (class 1259 OID 19887886)
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
-- TOC entry 225 (class 1259 OID 19887869)
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
-- TOC entry 219 (class 1259 OID 19887777)
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
-- TOC entry 240 (class 1259 OID 19888125)
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
-- TOC entry 195 (class 1259 OID 19887545)
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
-- TOC entry 197 (class 1259 OID 19887576)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19888051)
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
-- TOC entry 190 (class 1259 OID 19887485)
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
-- TOC entry 227 (class 1259 OID 19887899)
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
    prikoproducentu boolean,
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
-- TOC entry 213 (class 1259 OID 19887709)
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
-- TOC entry 193 (class 1259 OID 19887524)
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
-- TOC entry 191 (class 1259 OID 19887502)
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
-- TOC entry 202 (class 1259 OID 19887623)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19888106)
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
-- TOC entry 239 (class 1259 OID 19888118)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19888140)
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
-- TOC entry 206 (class 1259 OID 19887648)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19887459)
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
-- TOC entry 182 (class 1259 OID 19887373)
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
-- TOC entry 183 (class 1259 OID 19887384)
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
-- TOC entry 178 (class 1259 OID 19887338)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19887357)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19887655)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19887689)
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
-- TOC entry 222 (class 1259 OID 19887818)
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
-- TOC entry 185 (class 1259 OID 19887417)
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
-- TOC entry 187 (class 1259 OID 19887451)
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
-- TOC entry 229 (class 1259 OID 19887997)
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
-- TOC entry 203 (class 1259 OID 19887629)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19887436)
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
-- TOC entry 192 (class 1259 OID 19887514)
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
-- TOC entry 205 (class 1259 OID 19887641)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19888011)
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
-- TOC entry 231 (class 1259 OID 19888021)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19887954)
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
-- TOC entry 232 (class 1259 OID 19888029)
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
-- TOC entry 209 (class 1259 OID 19887670)
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
-- TOC entry 201 (class 1259 OID 19887614)
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
-- TOC entry 200 (class 1259 OID 19887604)
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
-- TOC entry 221 (class 1259 OID 19887807)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19887744)
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
-- TOC entry 175 (class 1259 OID 19887309)
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
-- TOC entry 174 (class 1259 OID 19887307)
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
-- TOC entry 210 (class 1259 OID 19887683)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19887347)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19887331)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19887697)
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
-- TOC entry 204 (class 1259 OID 19887635)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19887581)
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
-- TOC entry 173 (class 1259 OID 19887296)
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
-- TOC entry 172 (class 1259 OID 19887288)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19887283)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19887754)
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
-- TOC entry 184 (class 1259 OID 19887409)
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
-- TOC entry 199 (class 1259 OID 19887591)
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
-- TOC entry 220 (class 1259 OID 19887795)
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
-- TOC entry 233 (class 1259 OID 19888039)
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
-- TOC entry 189 (class 1259 OID 19887471)
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
-- TOC entry 176 (class 1259 OID 19887318)
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
-- TOC entry 224 (class 1259 OID 19887844)
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
-- TOC entry 194 (class 1259 OID 19887535)
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
-- TOC entry 208 (class 1259 OID 19887662)
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
-- TOC entry 218 (class 1259 OID 19887768)
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
-- TOC entry 236 (class 1259 OID 19888086)
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
-- TOC entry 235 (class 1259 OID 19888058)
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
-- TOC entry 237 (class 1259 OID 19888098)
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
-- TOC entry 215 (class 1259 OID 19887734)
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
-- TOC entry 196 (class 1259 OID 19887571)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19887834)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19887724)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2195 (class 2604 OID 19887312)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2944 (class 0 OID 19887364)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 19887886)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55fa-5d4b-8875-8b559df0a968	000d0000-55fa-5d4b-a92d-959463fdd4e6	\N	00090000-55fa-5d4b-b62e-9f5024435649	000b0000-55fa-5d4b-ecc1-b4a1fecb2d2b	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55fa-5d4b-b6db-5bb3267b8a0d	000d0000-55fa-5d4b-04b1-deed1b14278f	00100000-55fa-5d4b-b544-de1271d292b4	00090000-55fa-5d4b-39cc-36f4e9f71d0b	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55fa-5d4b-7263-0ad5b5f4fc0d	000d0000-55fa-5d4b-3d92-79e31efd407c	00100000-55fa-5d4b-9efc-58fc6fa104fa	00090000-55fa-5d4b-b252-276858fe562b	\N	0003	t	\N	2015-09-17	\N	2	t	\N	f	f
000c0000-55fa-5d4b-743b-bc01d3e7d1ad	000d0000-55fa-5d4b-d177-841d2c4ce204	\N	00090000-55fa-5d4b-5b96-52d7a9e672a5	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55fa-5d4b-62ca-4d184d23280f	000d0000-55fa-5d4b-626f-3848b2675144	\N	00090000-55fa-5d4b-3148-110c32a7828b	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55fa-5d4b-bf3c-01a497bab9fc	000d0000-55fa-5d4b-e818-d7e525cd133f	\N	00090000-55fa-5d4b-2bf6-64b0e93043ba	000b0000-55fa-5d4b-bd4b-efc130b38831	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55fa-5d4b-e1a7-31ddebc45a4f	000d0000-55fa-5d4b-b2be-fbba9bd92323	00100000-55fa-5d4b-d42b-bceea1736f26	00090000-55fa-5d4b-010b-86ef6ea3475a	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55fa-5d4b-33d0-36acfc6d6b39	000d0000-55fa-5d4b-3cf6-49ee2e89451e	\N	00090000-55fa-5d4b-7c7a-c74d94be3c5e	000b0000-55fa-5d4b-214e-cdae7a399d4d	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55fa-5d4b-bdf5-48d566a76396	000d0000-55fa-5d4b-b2be-fbba9bd92323	00100000-55fa-5d4b-f078-854b5cf323c6	00090000-55fa-5d4b-a945-8c6186c187fc	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55fa-5d4b-4ba8-12ea18e0f888	000d0000-55fa-5d4b-b2be-fbba9bd92323	00100000-55fa-5d4b-88d6-fd403c434a6b	00090000-55fa-5d4b-a095-6a45c8b1da2f	\N	0010	t	\N	2015-09-17	\N	16	f	\N	f	t
000c0000-55fa-5d4b-3b40-e248b4e0324e	000d0000-55fa-5d4b-b2be-fbba9bd92323	00100000-55fa-5d4b-bcda-0d4c31e109ae	00090000-55fa-5d4b-83a5-2fc90b5a2516	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55fa-5d4b-3dde-614721abaaae	000d0000-55fa-5d4b-f9e8-c8050323131e	\N	00090000-55fa-5d4b-39cc-36f4e9f71d0b	000b0000-55fa-5d4b-5ebc-dcf24d376654	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2988 (class 0 OID 19887869)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19887777)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55fa-5d4b-3bac-2a1400d2a1b2	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55fa-5d4b-5941-ff0c653e474b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55fa-5d4b-ce05-228a87da10c3	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3003 (class 0 OID 19888125)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 19887545)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55fa-5d4b-bc7b-c8ca76605cdd	\N	\N	00200000-55fa-5d4b-fd5c-d6317ccbaba2	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55fa-5d4b-b85e-55d311126220	\N	\N	00200000-55fa-5d4b-6412-afcd7fc2b1aa	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55fa-5d4b-7cb2-4f54455483a1	\N	\N	00200000-55fa-5d4b-f8f0-19dadf1057a9	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55fa-5d4b-ed5e-48b618fa8ef7	\N	\N	00200000-55fa-5d4b-ecac-f00fc4b2de6f	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55fa-5d4b-80e8-14999e5a4b5d	\N	\N	00200000-55fa-5d4b-7a41-399cb9ba77e9	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2960 (class 0 OID 19887576)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 19888051)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 19887485)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55fa-5d49-9b79-19958882aa61	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55fa-5d49-ec48-7fc8509bffb6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55fa-5d49-06f4-0a35d7f0612c	AL	ALB	008	Albania 	Albanija	\N
00040000-55fa-5d49-2dfc-83b2394c2078	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55fa-5d49-12db-3e89d1401e31	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55fa-5d49-a987-5fefed930db9	AD	AND	020	Andorra 	Andora	\N
00040000-55fa-5d49-db9c-50f939eb9383	AO	AGO	024	Angola 	Angola	\N
00040000-55fa-5d49-8876-8632f7e512af	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55fa-5d49-d06d-a0e6be27fa6f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55fa-5d49-adf6-afafa1986795	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55fa-5d49-f3c0-0a0f6c776968	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55fa-5d49-930b-1be225331c0d	AM	ARM	051	Armenia 	Armenija	\N
00040000-55fa-5d49-0012-c849d885fc5c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55fa-5d49-4938-a1dd8b6b9058	AU	AUS	036	Australia 	Avstralija	\N
00040000-55fa-5d49-034d-8dd86e90cc4a	AT	AUT	040	Austria 	Avstrija	\N
00040000-55fa-5d49-bc26-14f87a407179	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55fa-5d49-519d-95e7e7033a39	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55fa-5d49-7258-9ddeec15dd36	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55fa-5d49-2ffa-f6a477ebbfe3	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55fa-5d49-1d4c-9cd1a68bb97a	BB	BRB	052	Barbados 	Barbados	\N
00040000-55fa-5d49-e3b0-fa9eea54b34d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55fa-5d49-35c9-8db74313c749	BE	BEL	056	Belgium 	Belgija	\N
00040000-55fa-5d49-a3af-6559c193f3d2	BZ	BLZ	084	Belize 	Belize	\N
00040000-55fa-5d49-d261-ba7f357806da	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55fa-5d49-b236-061556020c85	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55fa-5d49-ca09-9cdd5da87942	BT	BTN	064	Bhutan 	Butan	\N
00040000-55fa-5d49-fa95-481285a43b8f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55fa-5d49-5e11-32860c5d1ec7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55fa-5d49-0c39-230a85caa13d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55fa-5d49-2162-da3c1a8c5a29	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55fa-5d49-bf25-2e8a0cc46604	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55fa-5d49-d0f1-94aa7172bede	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55fa-5d49-9ec9-71a62b542d42	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55fa-5d49-a7d5-67ea6df049b9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55fa-5d49-d53b-f82774fa9c3c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55fa-5d49-3ecc-4c0958e1d8a2	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55fa-5d49-89ef-b57ceae4c562	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55fa-5d49-c5f9-810614b50807	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55fa-5d49-1e82-2dc7cad708b4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55fa-5d49-5103-efa1489509bc	CA	CAN	124	Canada 	Kanada	\N
00040000-55fa-5d49-bc87-cd0313782d82	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55fa-5d49-97ad-6bbfaf7db3e1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55fa-5d49-034d-df157ea8539e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55fa-5d49-63dd-5cbb56ad17a5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55fa-5d49-106c-837bee8eb517	CL	CHL	152	Chile 	Čile	\N
00040000-55fa-5d49-da2e-5751f4e3c83b	CN	CHN	156	China 	Kitajska	\N
00040000-55fa-5d49-2834-9a5de92827ab	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55fa-5d49-f5cd-a085da0111a6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55fa-5d49-1451-09153f06b2de	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55fa-5d49-e091-c75cb5b11dc3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55fa-5d49-db5a-1858d3a92c28	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55fa-5d49-cf5c-f4a3c0e14b3a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55fa-5d49-a236-79e62669ef48	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55fa-5d49-fe02-bb497effbfaa	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55fa-5d49-6e6b-fe5899719ccd	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55fa-5d49-f379-2efa47b4bb08	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55fa-5d49-ee59-9c1de91611cd	CU	CUB	192	Cuba 	Kuba	\N
00040000-55fa-5d49-f15c-a5a34d3aba04	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55fa-5d49-4856-c79d068ca057	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55fa-5d49-7883-dac091d0ef18	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55fa-5d49-b559-bcbe2cf13818	DK	DNK	208	Denmark 	Danska	\N
00040000-55fa-5d49-b5a7-a0eaec669a0a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55fa-5d49-39a5-fc587b82cc50	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55fa-5d49-0148-d88536d39af3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55fa-5d49-e402-fa0e34b6832e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55fa-5d49-584c-55ff4ca0a178	EG	EGY	818	Egypt 	Egipt	\N
00040000-55fa-5d49-d1fb-7901a59fd43a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55fa-5d49-4510-97a5b52f5a27	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55fa-5d49-45a4-05503e75be67	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55fa-5d49-49e7-18b17eaa2ad2	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55fa-5d49-2241-971fbcf55eb6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55fa-5d49-8a3b-6b232219407b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55fa-5d49-4ab5-eada3883fbf7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55fa-5d49-472b-39d9ac0f8760	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55fa-5d49-9348-521b8ac77416	FI	FIN	246	Finland 	Finska	\N
00040000-55fa-5d49-af24-9f0ae4f77577	FR	FRA	250	France 	Francija	\N
00040000-55fa-5d49-b155-208d903ebe03	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55fa-5d49-c6d5-b8f2f75d6d72	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55fa-5d49-2845-7f72a5f96473	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55fa-5d49-0ad2-a4519394a3ab	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55fa-5d49-aadf-f51db248aeff	GA	GAB	266	Gabon 	Gabon	\N
00040000-55fa-5d49-e22d-44b75234f7e4	GM	GMB	270	Gambia 	Gambija	\N
00040000-55fa-5d49-c106-7597f59b7f93	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55fa-5d49-fdc5-f09cdf19f35a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55fa-5d49-7830-53caae46625f	GH	GHA	288	Ghana 	Gana	\N
00040000-55fa-5d49-d2c1-f2c957e77ac2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55fa-5d49-9440-2139ef3796ff	GR	GRC	300	Greece 	Grčija	\N
00040000-55fa-5d49-45c6-cebc43109a62	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55fa-5d49-ecae-8df4fa18aa05	GD	GRD	308	Grenada 	Grenada	\N
00040000-55fa-5d49-d142-5838271f574b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55fa-5d49-c0fe-d7db44252fc8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55fa-5d49-eee7-4d4e42a279d8	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55fa-5d49-bf45-541f068ae2d2	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55fa-5d49-1b22-c09a8ccbf238	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55fa-5d49-222f-6cf6bc6bd0cf	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55fa-5d49-0673-6d6f4db95bc8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55fa-5d49-ec3c-683b28d36ca7	HT	HTI	332	Haiti 	Haiti	\N
00040000-55fa-5d49-ae2a-08c759a8d673	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55fa-5d49-ae50-d713b7a2e745	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55fa-5d49-a61a-4c566a3149f7	HN	HND	340	Honduras 	Honduras	\N
00040000-55fa-5d49-4bb4-19a772c0cd46	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55fa-5d49-76b1-271de59fbd6c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55fa-5d49-85c1-bc9419e562f2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55fa-5d49-e5a1-8326b727c588	IN	IND	356	India 	Indija	\N
00040000-55fa-5d49-12ad-12c62aea3cc2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55fa-5d49-b16f-1c4d2acfb9f8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55fa-5d49-f921-253b7e2d69fa	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55fa-5d49-3d21-c0d190aebb56	IE	IRL	372	Ireland 	Irska	\N
00040000-55fa-5d49-f1d8-cea65ad0d877	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55fa-5d49-a7da-04885689a3eb	IL	ISR	376	Israel 	Izrael	\N
00040000-55fa-5d49-27f5-170523164e02	IT	ITA	380	Italy 	Italija	\N
00040000-55fa-5d49-8ae4-2cbf129c7621	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55fa-5d49-e4da-c503a2686e21	JP	JPN	392	Japan 	Japonska	\N
00040000-55fa-5d49-c2dd-3e3a6e97a52a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55fa-5d49-a816-fbf6021ddab9	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55fa-5d49-7daf-93775369ade8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55fa-5d49-5f85-9093327e554b	KE	KEN	404	Kenya 	Kenija	\N
00040000-55fa-5d49-96da-46b4a7e2de74	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55fa-5d49-9d4b-f686d4043866	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55fa-5d49-c0f0-cc69930016bc	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55fa-5d49-6a21-d299103e7f4d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55fa-5d49-a48f-b1450283177c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55fa-5d49-bd25-9cf3efe77c22	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55fa-5d49-9995-e240b7dc53f9	LV	LVA	428	Latvia 	Latvija	\N
00040000-55fa-5d49-60de-7c450bf96c13	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55fa-5d49-1305-340392945f5f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55fa-5d49-2e8c-095a6b109950	LR	LBR	430	Liberia 	Liberija	\N
00040000-55fa-5d49-a3a2-b6976cf87715	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55fa-5d49-7a17-99f707168fd2	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55fa-5d49-a900-7ac14b32fec4	LT	LTU	440	Lithuania 	Litva	\N
00040000-55fa-5d49-7b9f-882085024460	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55fa-5d49-a4e2-d5b8ada37b92	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55fa-5d49-8058-b23dd4d770ce	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55fa-5d49-e7f3-dbf934b20d1d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55fa-5d49-9410-f00e41fa1308	MW	MWI	454	Malawi 	Malavi	\N
00040000-55fa-5d49-c275-d4acb7b8b0aa	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55fa-5d49-54e1-ab26dcbfb009	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55fa-5d49-27d8-934cb66a6bf2	ML	MLI	466	Mali 	Mali	\N
00040000-55fa-5d49-124e-425596d1f150	MT	MLT	470	Malta 	Malta	\N
00040000-55fa-5d49-8898-cf249a3b9698	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55fa-5d49-3ef8-643e8dd32597	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55fa-5d49-6298-062c9ff8a057	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55fa-5d49-67ed-7f32cd9fc584	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55fa-5d49-b760-6ee362ecbd5b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55fa-5d49-302a-5937c2b91cc0	MX	MEX	484	Mexico 	Mehika	\N
00040000-55fa-5d49-3c75-bfb0c8028ad9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55fa-5d49-4d40-c8f70a7aa5e2	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55fa-5d49-1e90-d6e2f2b35b2d	MC	MCO	492	Monaco 	Monako	\N
00040000-55fa-5d49-aee0-296e76096aa8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55fa-5d49-9d76-1e7bcdf790e7	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55fa-5d49-21fb-f3ea90e17ffb	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55fa-5d49-bd05-9ad4bf11ec12	MA	MAR	504	Morocco 	Maroko	\N
00040000-55fa-5d49-333b-c1e1ab822fae	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55fa-5d49-d098-3953354ea851	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55fa-5d49-58e5-c790f5a8e65f	NA	NAM	516	Namibia 	Namibija	\N
00040000-55fa-5d49-c6be-6f4dfff6325e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55fa-5d49-4d0f-3069a4934a70	NP	NPL	524	Nepal 	Nepal	\N
00040000-55fa-5d49-0048-da12c7db208b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55fa-5d49-0677-96dcc0670a17	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55fa-5d49-22d6-1c2a7da3cc2e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55fa-5d49-4527-75c2900e2b67	NE	NER	562	Niger 	Niger 	\N
00040000-55fa-5d49-5ddf-7ede2b9a8109	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55fa-5d49-6397-6d323ca99647	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55fa-5d49-3e18-df391e4c99a5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55fa-5d49-50f3-9e45870354f0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55fa-5d49-82e7-17b58a3a782f	NO	NOR	578	Norway 	Norveška	\N
00040000-55fa-5d49-9cec-888734894262	OM	OMN	512	Oman 	Oman	\N
00040000-55fa-5d49-c3da-cc86c0c4a6eb	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55fa-5d49-5c53-b63328d9b059	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55fa-5d49-23b0-7fef095cb579	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55fa-5d49-1ddd-cbaaa75f30d4	PA	PAN	591	Panama 	Panama	\N
00040000-55fa-5d49-5964-640f8f6340e1	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55fa-5d49-ba4a-f6abf1a22136	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55fa-5d49-6c2a-c3652c615e8e	PE	PER	604	Peru 	Peru	\N
00040000-55fa-5d49-ac68-8f26a10665a8	PH	PHL	608	Philippines 	Filipini	\N
00040000-55fa-5d49-76d1-ee448d9fe092	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55fa-5d49-f732-e86376a6283c	PL	POL	616	Poland 	Poljska	\N
00040000-55fa-5d49-8e0b-14f952493dc7	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55fa-5d49-6b20-f29a6aef2ac8	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55fa-5d49-9ebc-e15b4d72b4a0	QA	QAT	634	Qatar 	Katar	\N
00040000-55fa-5d49-bdf6-aa1d9cc22a98	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55fa-5d49-f010-a3598cf250b8	RO	ROU	642	Romania 	Romunija	\N
00040000-55fa-5d49-8ab2-f2bdfb531f5c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55fa-5d49-71f4-5c13b75e9d40	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55fa-5d49-739d-31490a0aef9c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55fa-5d49-ce01-01fd1730d891	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55fa-5d49-3e7a-5c92d9861ebe	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55fa-5d49-2f9c-93faf67673fb	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55fa-5d49-d6cc-6e53d037416e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55fa-5d49-8fd5-10658566f58a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55fa-5d49-9a3a-eaf0071cb689	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55fa-5d49-9df2-000470c2847b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55fa-5d49-0964-c2ab4693f5b5	SM	SMR	674	San Marino 	San Marino	\N
00040000-55fa-5d49-0bcc-4aff1292fcde	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55fa-5d49-0cb4-197a51326b3a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55fa-5d49-9de2-2b50a142c77b	SN	SEN	686	Senegal 	Senegal	\N
00040000-55fa-5d49-0981-45749c90c54c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55fa-5d49-0e5e-b69ab2b15ec5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55fa-5d49-87c8-5cb23cc0bd50	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55fa-5d49-672b-7004c2a60453	SG	SGP	702	Singapore 	Singapur	\N
00040000-55fa-5d49-036e-9a8691a7ecc3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55fa-5d49-19fc-24233c4bb941	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55fa-5d49-5a61-917a27c7272a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55fa-5d49-22eb-aa41497c98c9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55fa-5d49-27cd-6e8b20f1cfd0	SO	SOM	706	Somalia 	Somalija	\N
00040000-55fa-5d49-dc8e-2d1bc78abbc1	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55fa-5d49-bf6f-6c9b481c549f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55fa-5d49-fa2e-3ddf12b35dd6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55fa-5d49-df6c-db3c13addec0	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55fa-5d49-f1ce-ccfc72dd0d17	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55fa-5d49-e10a-87342695269b	SD	SDN	729	Sudan 	Sudan	\N
00040000-55fa-5d49-a91c-f5c43aeea97b	SR	SUR	740	Suriname 	Surinam	\N
00040000-55fa-5d49-ad89-f77b8950dc35	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55fa-5d49-bfee-04813ea80bda	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55fa-5d49-b09a-1d9672dd1fa5	SE	SWE	752	Sweden 	Švedska	\N
00040000-55fa-5d49-3728-50b71df62336	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55fa-5d49-cdc9-d6c1891647ac	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55fa-5d49-e1a6-778afb3a8628	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55fa-5d49-7f60-5fa470b2225f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55fa-5d49-9bed-f3fce26c703e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55fa-5d49-121c-5b4703e7eed2	TH	THA	764	Thailand 	Tajska	\N
00040000-55fa-5d49-93b0-8271f3f5ff00	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55fa-5d49-05f4-401b7066d2f5	TG	TGO	768	Togo 	Togo	\N
00040000-55fa-5d49-15f4-84c632e8df1f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55fa-5d49-cdec-3f64420ef5c2	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55fa-5d49-fde2-0d2e6ccce865	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55fa-5d49-9e26-1957f7ee6747	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55fa-5d49-4d2c-1c3ba6fe2001	TR	TUR	792	Turkey 	Turčija	\N
00040000-55fa-5d49-ebbc-f66e7998dcb1	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55fa-5d49-cc08-3508a87a463c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fa-5d49-83a0-284b969a8f3f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55fa-5d49-8ae6-5cbc3e887031	UG	UGA	800	Uganda 	Uganda	\N
00040000-55fa-5d49-5c4c-289ba98d05d8	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55fa-5d49-3e31-51e84f4bc915	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55fa-5d49-2414-de55b133c173	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55fa-5d49-585e-d21c98135675	US	USA	840	United States 	Združene države Amerike	\N
00040000-55fa-5d49-2156-8a6dc0024e95	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55fa-5d49-ddb5-10568b1433a8	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55fa-5d49-535f-33ca654e77da	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55fa-5d49-b37e-85a64c836a19	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55fa-5d49-88a7-bf4ccff0b4a5	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55fa-5d49-c267-11725f916084	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55fa-5d49-aa8b-1da12cecbf4a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fa-5d49-99e0-cc717753d3ef	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55fa-5d49-ce3f-605986923bd9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55fa-5d49-c6da-d11d55fa2a0c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55fa-5d49-bdfb-3bfb79ad3a81	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55fa-5d49-9d93-8fd8f9eca1ac	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55fa-5d49-07a0-02f1c885a9dd	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2990 (class 0 OID 19887899)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55fa-5d4b-f355-8e52885cab91	000e0000-55fa-5d4b-62f9-24eb75329b16	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fa-5d49-cbd9-db7a46dd6f35	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fa-5d4b-d23c-315b2a6b35ed	000e0000-55fa-5d4b-4e52-a706f3398734	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fa-5d49-f11a-81a40e3cff54	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fa-5d4b-bde8-c36210311085	000e0000-55fa-5d4b-f7f0-6f868b42cc02	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fa-5d49-cbd9-db7a46dd6f35	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fa-5d4b-8edd-a6652e514f0e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fa-5d4b-958c-074ccb7bdeef	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2976 (class 0 OID 19887709)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55fa-5d4b-a92d-959463fdd4e6	000e0000-55fa-5d4b-4e52-a706f3398734	000c0000-55fa-5d4b-8875-8b559df0a968	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55fa-5d49-af33-3aaced454ebb
000d0000-55fa-5d4b-04b1-deed1b14278f	000e0000-55fa-5d4b-4e52-a706f3398734	000c0000-55fa-5d4b-b6db-5bb3267b8a0d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55fa-5d49-1d2b-bacfa09be293
000d0000-55fa-5d4b-3d92-79e31efd407c	000e0000-55fa-5d4b-4e52-a706f3398734	000c0000-55fa-5d4b-7263-0ad5b5f4fc0d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55fa-5d49-6fdb-ee1b8f13b4f2
000d0000-55fa-5d4b-d177-841d2c4ce204	000e0000-55fa-5d4b-4e52-a706f3398734	000c0000-55fa-5d4b-743b-bc01d3e7d1ad	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55fa-5d49-32f1-588e7a073e05
000d0000-55fa-5d4b-626f-3848b2675144	000e0000-55fa-5d4b-4e52-a706f3398734	000c0000-55fa-5d4b-62ca-4d184d23280f	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55fa-5d49-32f1-588e7a073e05
000d0000-55fa-5d4b-e818-d7e525cd133f	000e0000-55fa-5d4b-4e52-a706f3398734	000c0000-55fa-5d4b-bf3c-01a497bab9fc	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55fa-5d49-af33-3aaced454ebb
000d0000-55fa-5d4b-b2be-fbba9bd92323	000e0000-55fa-5d4b-4e52-a706f3398734	000c0000-55fa-5d4b-bdf5-48d566a76396	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55fa-5d49-af33-3aaced454ebb
000d0000-55fa-5d4b-3cf6-49ee2e89451e	000e0000-55fa-5d4b-4e52-a706f3398734	000c0000-55fa-5d4b-33d0-36acfc6d6b39	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55fa-5d49-42e0-fa52ebf14e1f
000d0000-55fa-5d4b-f9e8-c8050323131e	000e0000-55fa-5d4b-4e52-a706f3398734	000c0000-55fa-5d4b-3dde-614721abaaae	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55fa-5d49-604b-2fdcfbb1ab28
\.


--
-- TOC entry 2956 (class 0 OID 19887524)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 19887502)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55fa-5d4b-00d1-fb8d5735d666	00080000-55fa-5d4b-f328-26aa90e8a7fa	00090000-55fa-5d4b-a095-6a45c8b1da2f	AK		igralka
\.


--
-- TOC entry 2965 (class 0 OID 19887623)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 19888106)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 19888118)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 19888140)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 19887648)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19887459)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55fa-5d4a-0fe1-595f4f6e5a1c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55fa-5d4a-9468-9df647b0b680	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55fa-5d4a-6c9b-70654f71f697	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55fa-5d4a-b599-34034d2ed627	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55fa-5d4a-96c8-685de1a0fe9c	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55fa-5d4a-5a43-210857456f94	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55fa-5d4a-d5a7-1ac8cea51194	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55fa-5d4a-4ff6-de2a0f991079	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fa-5d4a-55c2-7b3e244df4b4	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fa-5d4a-dd4e-ecbc25bdca9d	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55fa-5d4a-c5ac-a9b3886d0453	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55fa-5d4a-107d-c5f714af1975	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55fa-5d4a-e674-545c07da3ad6	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55fa-5d4a-d31c-382b864ae369	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55fa-5d4b-505b-7a0d01272b53	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55fa-5d4b-9cfe-c9d674427227	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55fa-5d4b-47e3-3683231c48bb	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55fa-5d4b-0a89-fdd2ca24a723	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55fa-5d4b-aac7-9784325b44c0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55fa-5d4c-e8ce-2bc02419365d	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2945 (class 0 OID 19887373)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55fa-5d4b-70ff-8a0fa3b16ce5	00000000-55fa-5d4b-505b-7a0d01272b53	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55fa-5d4b-a18f-a4583d5ea425	00000000-55fa-5d4b-505b-7a0d01272b53	00010000-55fa-5d4a-b274-4a8243401b6d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55fa-5d4b-7fb2-0f0345996bac	00000000-55fa-5d4b-9cfe-c9d674427227	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2946 (class 0 OID 19887384)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55fa-5d4b-b62e-9f5024435649	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55fa-5d4b-5b96-52d7a9e672a5	00010000-55fa-5d4b-963f-75a28361182b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55fa-5d4b-b252-276858fe562b	00010000-55fa-5d4b-de81-e963b2a3cfa9	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55fa-5d4b-a945-8c6186c187fc	00010000-55fa-5d4b-b555-1eab13153c29	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55fa-5d4b-1a1d-badd27395dc9	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55fa-5d4b-2bf6-64b0e93043ba	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55fa-5d4b-83a5-2fc90b5a2516	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55fa-5d4b-010b-86ef6ea3475a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55fa-5d4b-a095-6a45c8b1da2f	00010000-55fa-5d4b-3f79-3fae14ba0ff9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55fa-5d4b-39cc-36f4e9f71d0b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55fa-5d4b-0e09-456c58025e29	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55fa-5d4b-3148-110c32a7828b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55fa-5d4b-7c7a-c74d94be3c5e	00010000-55fa-5d4b-a438-e290adc1331f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 19887338)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55fa-5d4a-1d26-38c43bcdb6e1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55fa-5d4a-c750-c5f5314af9d0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55fa-5d4a-1c05-e534816c5c96	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55fa-5d4a-fc84-a213f54ba3aa	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55fa-5d4a-bafe-b5e56a6a8161	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55fa-5d4a-66de-1e6aab9e9744	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55fa-5d4a-7db0-74f6e19f1ee6	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55fa-5d4a-ed52-7b34c7e439cc	Abonma-read	Abonma - branje	f
00030000-55fa-5d4a-82fd-62b186da0fc8	Abonma-write	Abonma - spreminjanje	f
00030000-55fa-5d4a-8990-bf98dac7ef46	Alternacija-read	Alternacija - branje	f
00030000-55fa-5d4a-a9c1-d457f9792f41	Alternacija-write	Alternacija - spreminjanje	f
00030000-55fa-5d4a-874a-c505f80838f6	Arhivalija-read	Arhivalija - branje	f
00030000-55fa-5d4a-19c9-4b2c878d7af2	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55fa-5d4a-78ed-13fc27d1273f	Besedilo-read	Besedilo - branje	f
00030000-55fa-5d4a-b604-33d8dc0910ec	Besedilo-write	Besedilo - spreminjanje	f
00030000-55fa-5d4a-c240-2e5d0d47466d	DogodekIzven-read	DogodekIzven - branje	f
00030000-55fa-5d4a-5983-ece8eb555553	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55fa-5d4a-431f-b681ef8843cc	Dogodek-read	Dogodek - branje	f
00030000-55fa-5d4a-74d8-ec1494146fa1	Dogodek-write	Dogodek - spreminjanje	f
00030000-55fa-5d4a-2bdc-4e6ee78b1b5e	DrugiVir-read	DrugiVir - branje	f
00030000-55fa-5d4a-8920-7b3d938979de	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55fa-5d4a-82c5-aaa0da99eb3e	Drzava-read	Drzava - branje	f
00030000-55fa-5d4a-d577-1164f7d48b71	Drzava-write	Drzava - spreminjanje	f
00030000-55fa-5d4a-4543-e831a5550b5f	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55fa-5d4a-d169-25666699d365	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55fa-5d4a-f54c-a6048c81cb7f	Funkcija-read	Funkcija - branje	f
00030000-55fa-5d4a-57c6-d5a906843aa9	Funkcija-write	Funkcija - spreminjanje	f
00030000-55fa-5d4a-d1e2-7a3c679a6113	Gostovanje-read	Gostovanje - branje	f
00030000-55fa-5d4a-af13-d662b8e10f1b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55fa-5d4a-a7ac-5016f8426b41	Gostujoca-read	Gostujoca - branje	f
00030000-55fa-5d4a-a14a-3e3a9137ec01	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55fa-5d4a-11e7-2a2e0198caeb	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55fa-5d4a-fb3d-71d08c4a2fa8	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55fa-5d4a-e48b-4af5722f4399	Kupec-read	Kupec - branje	f
00030000-55fa-5d4a-da4c-83d425ab48f0	Kupec-write	Kupec - spreminjanje	f
00030000-55fa-5d4a-567f-e1141d4bcba9	NacinPlacina-read	NacinPlacina - branje	f
00030000-55fa-5d4a-c469-f4eba2eb14df	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55fa-5d4a-d8b1-0a523ca502ee	Option-read	Option - branje	f
00030000-55fa-5d4a-b6e1-5022f335152c	Option-write	Option - spreminjanje	f
00030000-55fa-5d4a-9dbe-432c58a1f6b9	OptionValue-read	OptionValue - branje	f
00030000-55fa-5d4a-7056-34103c32a4bc	OptionValue-write	OptionValue - spreminjanje	f
00030000-55fa-5d4a-6461-1fd0af231e7e	Oseba-read	Oseba - branje	f
00030000-55fa-5d4a-83b6-12fcd98899e4	Oseba-write	Oseba - spreminjanje	f
00030000-55fa-5d4a-00fc-4200876f90d1	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55fa-5d4a-b447-10dbdf3eca59	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55fa-5d4a-f650-214a3bbd05ed	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55fa-5d4a-7935-5a5299d6063e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55fa-5d4a-6865-b6ae595af695	Pogodba-read	Pogodba - branje	f
00030000-55fa-5d4a-a902-f548373b73f2	Pogodba-write	Pogodba - spreminjanje	f
00030000-55fa-5d4a-4b88-41adae37b665	Popa-read	Popa - branje	f
00030000-55fa-5d4a-95ae-36f7fcef0cb3	Popa-write	Popa - spreminjanje	f
00030000-55fa-5d4a-6ad3-22e1f5b75fed	Posta-read	Posta - branje	f
00030000-55fa-5d4a-b519-ab26e6e72a41	Posta-write	Posta - spreminjanje	f
00030000-55fa-5d4a-83f5-8ee57f505424	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55fa-5d4a-6412-a33f4f7cbed4	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55fa-5d4a-91e3-fb7b09fcad06	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55fa-5d4a-8e38-eb2e895fa3e9	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55fa-5d4a-86c1-ff43825254ef	PostniNaslov-read	PostniNaslov - branje	f
00030000-55fa-5d4a-5afa-73762e7c6770	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55fa-5d4a-526f-c315d19ece9b	Predstava-read	Predstava - branje	f
00030000-55fa-5d4a-37c4-ea2e4e700fc7	Predstava-write	Predstava - spreminjanje	f
00030000-55fa-5d4a-6026-3a65715053c2	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55fa-5d4a-dc07-95383373ce23	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55fa-5d4a-48fd-2e2d8af0c52b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55fa-5d4a-7a83-a83381fda8e2	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55fa-5d4a-1a36-f61d931a5682	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55fa-5d4a-2a68-eb9aa74246ed	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55fa-5d4a-2d76-2e8f7a58f5f3	ProgramDela-read	ProgramDela - branje	f
00030000-55fa-5d4a-acb5-c31fa63e0d2f	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55fa-5d4a-efb9-f8ca35330af3	ProgramFestival-read	ProgramFestival - branje	f
00030000-55fa-5d4a-ccc1-a304c7d1b4b4	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55fa-5d4a-d620-263dd76fd8c6	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55fa-5d4a-8e70-c67a425f2fff	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55fa-5d4a-86ef-7e1d6dd79420	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55fa-5d4a-99d6-74605ebbddf8	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55fa-5d4a-6fdb-7f5e501552d8	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55fa-5d4a-f4cc-f94943f18030	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55fa-5d4a-b82e-f4c6c11545d5	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55fa-5d4a-b12e-d4240d64e69e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55fa-5d4a-d72e-67e2d5de5601	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55fa-5d4a-7e10-fcdad0d49278	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55fa-5d4a-5970-36d8040ee7ee	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55fa-5d4a-a9e9-1e2a7abb29de	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55fa-5d4a-3cfc-eb78663cde72	ProgramRazno-read	ProgramRazno - branje	f
00030000-55fa-5d4a-9915-63292a536ea0	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55fa-5d4a-f3d6-d03ea495ca7e	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55fa-5d4a-9475-76e35a0a09b4	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55fa-5d4a-0921-ffcce2b2d527	Prostor-read	Prostor - branje	f
00030000-55fa-5d4a-857d-c397ddd9b6fe	Prostor-write	Prostor - spreminjanje	f
00030000-55fa-5d4a-dc47-0f88b0f8c781	Racun-read	Racun - branje	f
00030000-55fa-5d4a-b592-a0baff12cf08	Racun-write	Racun - spreminjanje	f
00030000-55fa-5d4a-7e23-721a935454b2	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55fa-5d4a-580b-070691fdc67a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55fa-5d4a-f999-3b9de0c475d0	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55fa-5d4a-c2df-fc82772aae0a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55fa-5d4a-2f98-e120ecfb4edc	Rekvizit-read	Rekvizit - branje	f
00030000-55fa-5d4a-ad8d-4e54f9bf8278	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55fa-5d4a-a77e-0921aff7ead9	Revizija-read	Revizija - branje	f
00030000-55fa-5d4a-c113-b4eeda9c817a	Revizija-write	Revizija - spreminjanje	f
00030000-55fa-5d4a-65ad-bb40224f218c	Rezervacija-read	Rezervacija - branje	f
00030000-55fa-5d4a-9ec3-19763f3b99da	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55fa-5d4a-550a-d1e169d9b34f	SedezniRed-read	SedezniRed - branje	f
00030000-55fa-5d4a-5ad1-9f7bcdfa377c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55fa-5d4a-5298-1fba552c8e98	Sedez-read	Sedez - branje	f
00030000-55fa-5d4a-9acb-4535d345c6c9	Sedez-write	Sedez - spreminjanje	f
00030000-55fa-5d4a-89e2-907cb3c75952	Sezona-read	Sezona - branje	f
00030000-55fa-5d4a-a734-1c81253a63c7	Sezona-write	Sezona - spreminjanje	f
00030000-55fa-5d4a-08ea-5309632f7dd8	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55fa-5d4a-6011-290e3f353d9e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55fa-5d4a-00b3-889cec0676b1	Stevilcenje-read	Stevilcenje - branje	f
00030000-55fa-5d4a-1ab1-d9702a7c9a14	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55fa-5d4a-ed66-40474c9c19e7	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55fa-5d4a-0229-dcbd9d4c59b9	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55fa-5d4a-d6ff-c06aa0c8812b	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55fa-5d4a-c629-3a002208fb86	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55fa-5d4a-ccbf-9aa8829156e4	Telefonska-read	Telefonska - branje	f
00030000-55fa-5d4a-ee07-7ace17694a30	Telefonska-write	Telefonska - spreminjanje	f
00030000-55fa-5d4a-3b39-5de3567f3263	TerminStoritve-read	TerminStoritve - branje	f
00030000-55fa-5d4a-5817-8da03339fe52	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55fa-5d4a-626d-b9435421d6ac	TipFunkcije-read	TipFunkcije - branje	f
00030000-55fa-5d4a-46cc-6d88bbf87487	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55fa-5d4a-a1c7-4ea086ec8fc3	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55fa-5d4a-2ab7-d282eb9fadf7	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55fa-5d4a-1ffd-c963ff293cce	Trr-read	Trr - branje	f
00030000-55fa-5d4a-eafd-b02648847e53	Trr-write	Trr - spreminjanje	f
00030000-55fa-5d4a-7d6f-c07396429d48	Uprizoritev-read	Uprizoritev - branje	f
00030000-55fa-5d4a-9421-c3b6af08d7f8	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55fa-5d4a-3fa3-8f18e1d60db5	Vaja-read	Vaja - branje	f
00030000-55fa-5d4a-1107-278ed8368cee	Vaja-write	Vaja - spreminjanje	f
00030000-55fa-5d4a-9aef-e325fffd2d13	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55fa-5d4a-b25e-83c596847601	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55fa-5d4a-3f2e-32e7bf16cad1	VrstaStroska-read	VrstaStroska - branje	f
00030000-55fa-5d4a-d857-da3b20ddb133	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55fa-5d4a-89a3-9c9da23cd620	Zaposlitev-read	Zaposlitev - branje	f
00030000-55fa-5d4a-9b8a-66aef7ff4741	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55fa-5d4a-5f0f-1a0bbb009eea	Zasedenost-read	Zasedenost - branje	f
00030000-55fa-5d4a-95b7-66def9c78870	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55fa-5d4a-bf37-f4090ef4c87e	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55fa-5d4a-299c-de69353c7d77	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55fa-5d4a-604f-60f263d970da	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55fa-5d4a-fb8f-0c35f903acdc	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55fa-5d4a-396c-e7e82a86e6e3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55fa-5d4a-0b26-ab7bea8319c2	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55fa-5d4a-36d3-1bf8dc26b8bc	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55fa-5d4a-81ce-cde0a6cad937	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55fa-5d4a-ba46-68ddbeab5738	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fa-5d4a-2d9a-070bd44f08a4	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fa-5d4a-9be9-ccfa1c90944b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fa-5d4a-8228-cff592870012	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fa-5d4a-b6f4-84ef1f5cc4e0	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55fa-5d4a-1dc3-ab07a0a06ab2	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55fa-5d4a-2ef4-2d5c830f9576	Datoteka-write	Datoteka - spreminjanje	f
00030000-55fa-5d4a-f25d-4eafce1ab6c8	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2943 (class 0 OID 19887357)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55fa-5d4a-d8c5-6b2d32e61ce6	00030000-55fa-5d4a-c750-c5f5314af9d0
00020000-55fa-5d4a-8ad1-9976e01cb170	00030000-55fa-5d4a-82c5-aaa0da99eb3e
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-ed52-7b34c7e439cc
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-82fd-62b186da0fc8
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-8990-bf98dac7ef46
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-a9c1-d457f9792f41
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-874a-c505f80838f6
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-431f-b681ef8843cc
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-fc84-a213f54ba3aa
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-74d8-ec1494146fa1
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-82c5-aaa0da99eb3e
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-d577-1164f7d48b71
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-f54c-a6048c81cb7f
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-57c6-d5a906843aa9
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-d1e2-7a3c679a6113
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-af13-d662b8e10f1b
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-a7ac-5016f8426b41
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-a14a-3e3a9137ec01
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-11e7-2a2e0198caeb
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-fb3d-71d08c4a2fa8
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-d8b1-0a523ca502ee
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-9dbe-432c58a1f6b9
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-6461-1fd0af231e7e
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-83b6-12fcd98899e4
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-4b88-41adae37b665
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-95ae-36f7fcef0cb3
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-6ad3-22e1f5b75fed
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-b519-ab26e6e72a41
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-86c1-ff43825254ef
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-5afa-73762e7c6770
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-526f-c315d19ece9b
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-37c4-ea2e4e700fc7
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-1a36-f61d931a5682
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-2a68-eb9aa74246ed
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-0921-ffcce2b2d527
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-857d-c397ddd9b6fe
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-f999-3b9de0c475d0
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-c2df-fc82772aae0a
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-2f98-e120ecfb4edc
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-ad8d-4e54f9bf8278
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-89e2-907cb3c75952
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-a734-1c81253a63c7
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-626d-b9435421d6ac
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-7d6f-c07396429d48
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-9421-c3b6af08d7f8
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-3fa3-8f18e1d60db5
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-1107-278ed8368cee
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-5f0f-1a0bbb009eea
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-95b7-66def9c78870
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-bf37-f4090ef4c87e
00020000-55fa-5d4a-63b8-31b4b8e938d2	00030000-55fa-5d4a-604f-60f263d970da
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-ed52-7b34c7e439cc
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-874a-c505f80838f6
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-431f-b681ef8843cc
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-82c5-aaa0da99eb3e
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-d1e2-7a3c679a6113
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-a7ac-5016f8426b41
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-11e7-2a2e0198caeb
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-fb3d-71d08c4a2fa8
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-d8b1-0a523ca502ee
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-9dbe-432c58a1f6b9
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-6461-1fd0af231e7e
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-83b6-12fcd98899e4
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-4b88-41adae37b665
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-6ad3-22e1f5b75fed
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-86c1-ff43825254ef
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-5afa-73762e7c6770
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-526f-c315d19ece9b
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-0921-ffcce2b2d527
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-f999-3b9de0c475d0
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-2f98-e120ecfb4edc
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-89e2-907cb3c75952
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-ccbf-9aa8829156e4
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-ee07-7ace17694a30
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-1ffd-c963ff293cce
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-eafd-b02648847e53
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-89a3-9c9da23cd620
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-9b8a-66aef7ff4741
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-bf37-f4090ef4c87e
00020000-55fa-5d4a-04e4-3d032ca22e42	00030000-55fa-5d4a-604f-60f263d970da
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-ed52-7b34c7e439cc
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-8990-bf98dac7ef46
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-874a-c505f80838f6
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-19c9-4b2c878d7af2
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-78ed-13fc27d1273f
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-c240-2e5d0d47466d
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-431f-b681ef8843cc
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-82c5-aaa0da99eb3e
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-f54c-a6048c81cb7f
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-d1e2-7a3c679a6113
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-a7ac-5016f8426b41
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-11e7-2a2e0198caeb
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-d8b1-0a523ca502ee
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-9dbe-432c58a1f6b9
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-6461-1fd0af231e7e
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-4b88-41adae37b665
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-6ad3-22e1f5b75fed
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-526f-c315d19ece9b
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-1a36-f61d931a5682
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-0921-ffcce2b2d527
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-f999-3b9de0c475d0
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-2f98-e120ecfb4edc
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-89e2-907cb3c75952
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-626d-b9435421d6ac
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-3fa3-8f18e1d60db5
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-5f0f-1a0bbb009eea
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-bf37-f4090ef4c87e
00020000-55fa-5d4a-6fd2-360772b43585	00030000-55fa-5d4a-604f-60f263d970da
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-ed52-7b34c7e439cc
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-82fd-62b186da0fc8
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-a9c1-d457f9792f41
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-874a-c505f80838f6
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-431f-b681ef8843cc
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-82c5-aaa0da99eb3e
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-d1e2-7a3c679a6113
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-a7ac-5016f8426b41
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-d8b1-0a523ca502ee
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-9dbe-432c58a1f6b9
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-4b88-41adae37b665
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-6ad3-22e1f5b75fed
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-526f-c315d19ece9b
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-0921-ffcce2b2d527
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-f999-3b9de0c475d0
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-2f98-e120ecfb4edc
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-89e2-907cb3c75952
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-626d-b9435421d6ac
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-bf37-f4090ef4c87e
00020000-55fa-5d4a-89cc-0ae9f66a1791	00030000-55fa-5d4a-604f-60f263d970da
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-ed52-7b34c7e439cc
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-874a-c505f80838f6
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-431f-b681ef8843cc
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-82c5-aaa0da99eb3e
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-d1e2-7a3c679a6113
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-a7ac-5016f8426b41
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-d8b1-0a523ca502ee
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-9dbe-432c58a1f6b9
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-4b88-41adae37b665
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-6ad3-22e1f5b75fed
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-526f-c315d19ece9b
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-0921-ffcce2b2d527
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-f999-3b9de0c475d0
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-2f98-e120ecfb4edc
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-89e2-907cb3c75952
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-3b39-5de3567f3263
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-1c05-e534816c5c96
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-626d-b9435421d6ac
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-bf37-f4090ef4c87e
00020000-55fa-5d4a-54f3-ab1ebd176cf9	00030000-55fa-5d4a-604f-60f263d970da
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-1d26-38c43bcdb6e1
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-c750-c5f5314af9d0
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-1c05-e534816c5c96
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-fc84-a213f54ba3aa
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-bafe-b5e56a6a8161
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-66de-1e6aab9e9744
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-7db0-74f6e19f1ee6
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-ed52-7b34c7e439cc
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-82fd-62b186da0fc8
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-8990-bf98dac7ef46
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-a9c1-d457f9792f41
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-874a-c505f80838f6
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-19c9-4b2c878d7af2
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-78ed-13fc27d1273f
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-b604-33d8dc0910ec
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-c240-2e5d0d47466d
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-5983-ece8eb555553
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-431f-b681ef8843cc
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-74d8-ec1494146fa1
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-82c5-aaa0da99eb3e
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-d577-1164f7d48b71
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-2bdc-4e6ee78b1b5e
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-8920-7b3d938979de
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-4543-e831a5550b5f
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-d169-25666699d365
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-f54c-a6048c81cb7f
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-57c6-d5a906843aa9
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-d1e2-7a3c679a6113
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-af13-d662b8e10f1b
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-a7ac-5016f8426b41
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-a14a-3e3a9137ec01
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-11e7-2a2e0198caeb
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-fb3d-71d08c4a2fa8
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-e48b-4af5722f4399
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-da4c-83d425ab48f0
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-567f-e1141d4bcba9
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-c469-f4eba2eb14df
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-d8b1-0a523ca502ee
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-b6e1-5022f335152c
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-9dbe-432c58a1f6b9
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-7056-34103c32a4bc
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-6461-1fd0af231e7e
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-83b6-12fcd98899e4
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-00fc-4200876f90d1
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-b447-10dbdf3eca59
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-f650-214a3bbd05ed
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-7935-5a5299d6063e
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-6865-b6ae595af695
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-a902-f548373b73f2
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-4b88-41adae37b665
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-95ae-36f7fcef0cb3
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-6ad3-22e1f5b75fed
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-b519-ab26e6e72a41
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-83f5-8ee57f505424
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-6412-a33f4f7cbed4
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-91e3-fb7b09fcad06
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-8e38-eb2e895fa3e9
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-86c1-ff43825254ef
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-5afa-73762e7c6770
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-526f-c315d19ece9b
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-37c4-ea2e4e700fc7
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-6026-3a65715053c2
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-dc07-95383373ce23
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-48fd-2e2d8af0c52b
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-7a83-a83381fda8e2
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-1a36-f61d931a5682
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-2a68-eb9aa74246ed
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-2d76-2e8f7a58f5f3
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-acb5-c31fa63e0d2f
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-efb9-f8ca35330af3
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-ccc1-a304c7d1b4b4
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-d620-263dd76fd8c6
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-8e70-c67a425f2fff
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-86ef-7e1d6dd79420
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-99d6-74605ebbddf8
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-6fdb-7f5e501552d8
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-f4cc-f94943f18030
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-b82e-f4c6c11545d5
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-b12e-d4240d64e69e
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-d72e-67e2d5de5601
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-7e10-fcdad0d49278
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-5970-36d8040ee7ee
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-a9e9-1e2a7abb29de
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-3cfc-eb78663cde72
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-9915-63292a536ea0
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-f3d6-d03ea495ca7e
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-9475-76e35a0a09b4
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-0921-ffcce2b2d527
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-857d-c397ddd9b6fe
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-dc47-0f88b0f8c781
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-b592-a0baff12cf08
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-7e23-721a935454b2
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-580b-070691fdc67a
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-f999-3b9de0c475d0
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-c2df-fc82772aae0a
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-2f98-e120ecfb4edc
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-ad8d-4e54f9bf8278
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-a77e-0921aff7ead9
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-c113-b4eeda9c817a
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-65ad-bb40224f218c
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-9ec3-19763f3b99da
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-550a-d1e169d9b34f
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-5ad1-9f7bcdfa377c
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-5298-1fba552c8e98
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-9acb-4535d345c6c9
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-89e2-907cb3c75952
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-a734-1c81253a63c7
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-08ea-5309632f7dd8
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-6011-290e3f353d9e
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-00b3-889cec0676b1
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-1ab1-d9702a7c9a14
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-ed66-40474c9c19e7
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-0229-dcbd9d4c59b9
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-d6ff-c06aa0c8812b
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-c629-3a002208fb86
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-ccbf-9aa8829156e4
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-ee07-7ace17694a30
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-3b39-5de3567f3263
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-5817-8da03339fe52
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-626d-b9435421d6ac
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-46cc-6d88bbf87487
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-a1c7-4ea086ec8fc3
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-2ab7-d282eb9fadf7
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-1ffd-c963ff293cce
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-eafd-b02648847e53
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-7d6f-c07396429d48
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-9421-c3b6af08d7f8
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-3fa3-8f18e1d60db5
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-1107-278ed8368cee
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-9aef-e325fffd2d13
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-b25e-83c596847601
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-3f2e-32e7bf16cad1
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-d857-da3b20ddb133
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-89a3-9c9da23cd620
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-9b8a-66aef7ff4741
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-5f0f-1a0bbb009eea
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-95b7-66def9c78870
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-bf37-f4090ef4c87e
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-299c-de69353c7d77
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-604f-60f263d970da
00020000-55fa-5d4b-8c06-b2b3677775bc	00030000-55fa-5d4a-fb8f-0c35f903acdc
\.


--
-- TOC entry 2970 (class 0 OID 19887655)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 19887689)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 19887818)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55fa-5d4b-ecc1-b4a1fecb2d2b	00090000-55fa-5d4b-b62e-9f5024435649	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55fa-5d4b-bd4b-efc130b38831	00090000-55fa-5d4b-2bf6-64b0e93043ba	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55fa-5d4b-214e-cdae7a399d4d	00090000-55fa-5d4b-7c7a-c74d94be3c5e	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55fa-5d4b-5ebc-dcf24d376654	00090000-55fa-5d4b-39cc-36f4e9f71d0b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2948 (class 0 OID 19887417)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55fa-5d4b-f328-26aa90e8a7fa	00040000-55fa-5d49-5a61-917a27c7272a	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-5d4b-2ce4-a8b24e554159	00040000-55fa-5d49-5a61-917a27c7272a	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55fa-5d4b-23f1-94ff88a44d26	00040000-55fa-5d49-5a61-917a27c7272a	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-5d4b-f3ef-5a44a4c53796	00040000-55fa-5d49-5a61-917a27c7272a	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-5d4b-c2c5-314876895e3e	00040000-55fa-5d49-5a61-917a27c7272a	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-5d4b-24f0-cb3d8a99b251	00040000-55fa-5d49-f3c0-0a0f6c776968	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-5d4b-a06e-2305a41ba44e	00040000-55fa-5d49-f379-2efa47b4bb08	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-5d4b-bd77-a579ca1ea8b6	00040000-55fa-5d49-034d-8dd86e90cc4a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-5d4b-f364-a7208a5e5420	00040000-55fa-5d49-fdc5-f09cdf19f35a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fa-5d4c-1c71-35db935075fa	00040000-55fa-5d49-5a61-917a27c7272a	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2950 (class 0 OID 19887451)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55fa-5d49-9a30-0e594752bc8a	8341	Adlešiči
00050000-55fa-5d49-30f7-dd6291ecd289	5270	Ajdovščina
00050000-55fa-5d49-ba7c-64060dd35083	6280	Ankaran/Ancarano
00050000-55fa-5d49-b8e3-5a2abde98bdc	9253	Apače
00050000-55fa-5d49-147e-2b2488bd54ae	8253	Artiče
00050000-55fa-5d49-0a3d-fd63b6b697a3	4275	Begunje na Gorenjskem
00050000-55fa-5d49-073b-6d7b3039c97f	1382	Begunje pri Cerknici
00050000-55fa-5d49-a9c0-d9e65b737ad4	9231	Beltinci
00050000-55fa-5d49-da29-a23cace13f67	2234	Benedikt
00050000-55fa-5d49-bd40-f13ef669d6d3	2345	Bistrica ob Dravi
00050000-55fa-5d49-1bec-ba09e888af1f	3256	Bistrica ob Sotli
00050000-55fa-5d49-67c2-d8c17ded732d	8259	Bizeljsko
00050000-55fa-5d49-c7b6-f21179cc2288	1223	Blagovica
00050000-55fa-5d49-55ab-b283fe3dd190	8283	Blanca
00050000-55fa-5d49-665c-2f1f8ccffb32	4260	Bled
00050000-55fa-5d49-1967-5e62c742a555	4273	Blejska Dobrava
00050000-55fa-5d49-43c5-b5259afaa13f	9265	Bodonci
00050000-55fa-5d49-781f-1aadfdd2dc50	9222	Bogojina
00050000-55fa-5d49-f520-2da8b6bf97d7	4263	Bohinjska Bela
00050000-55fa-5d49-7ce9-b5fc9a4d3745	4264	Bohinjska Bistrica
00050000-55fa-5d49-9038-9840e18f9c2d	4265	Bohinjsko jezero
00050000-55fa-5d49-7c71-cee6d6df861e	1353	Borovnica
00050000-55fa-5d49-65b7-f63b1c0adb02	8294	Boštanj
00050000-55fa-5d49-4c3e-64162ff383a6	5230	Bovec
00050000-55fa-5d49-0b9a-e44675297ae4	5295	Branik
00050000-55fa-5d49-5a5b-a47d7b9fff0c	3314	Braslovče
00050000-55fa-5d49-6a55-2aa748d5bd17	5223	Breginj
00050000-55fa-5d49-a289-ecd341767f9f	8280	Brestanica
00050000-55fa-5d49-93d5-bfb5c1b567b5	2354	Bresternica
00050000-55fa-5d49-3e6e-fab0fe5db34e	4243	Brezje
00050000-55fa-5d49-6651-2bd848596fc7	1351	Brezovica pri Ljubljani
00050000-55fa-5d49-2398-4b49486058ef	8250	Brežice
00050000-55fa-5d49-b036-3d2b234d89c8	4210	Brnik - Aerodrom
00050000-55fa-5d49-2c31-3c634fccdf60	8321	Brusnice
00050000-55fa-5d49-6497-72d9e26d3ce6	3255	Buče
00050000-55fa-5d49-3035-501299279584	8276	Bučka 
00050000-55fa-5d49-9677-8a9dd29cab31	9261	Cankova
00050000-55fa-5d49-997d-2ce61a9b885c	3000	Celje 
00050000-55fa-5d49-014d-9e895159085f	3001	Celje - poštni predali
00050000-55fa-5d49-685e-c0a02501e651	4207	Cerklje na Gorenjskem
00050000-55fa-5d49-4283-698d500ed2de	8263	Cerklje ob Krki
00050000-55fa-5d49-895a-c44b6f25bc61	1380	Cerknica
00050000-55fa-5d49-8c83-cda4513e592a	5282	Cerkno
00050000-55fa-5d49-cd6c-37893cfe9abb	2236	Cerkvenjak
00050000-55fa-5d49-01a4-314e86c4f597	2215	Ceršak
00050000-55fa-5d49-67bb-3cc1aeb75cc1	2326	Cirkovce
00050000-55fa-5d49-1c9e-407c4beaf0ec	2282	Cirkulane
00050000-55fa-5d49-15fe-fb7e75855090	5273	Col
00050000-55fa-5d49-0112-0d28d2ded596	8251	Čatež ob Savi
00050000-55fa-5d49-60e0-82fa8fbd222f	1413	Čemšenik
00050000-55fa-5d49-05e9-512babd2a21b	5253	Čepovan
00050000-55fa-5d49-10a4-16593ea8cf96	9232	Črenšovci
00050000-55fa-5d49-96b8-773538f5b95f	2393	Črna na Koroškem
00050000-55fa-5d49-22f7-5c4b91914ea5	6275	Črni Kal
00050000-55fa-5d49-ff56-495113ad297e	5274	Črni Vrh nad Idrijo
00050000-55fa-5d49-ecf2-71790dfd624f	5262	Črniče
00050000-55fa-5d49-1da9-6b5675106313	8340	Črnomelj
00050000-55fa-5d49-82ed-e25c03ee987f	6271	Dekani
00050000-55fa-5d49-cb69-1d052d42f8d5	5210	Deskle
00050000-55fa-5d49-50b1-34a239de8677	2253	Destrnik
00050000-55fa-5d49-4301-e75bec458d1f	6215	Divača
00050000-55fa-5d49-39c1-20cd4e1d85b4	1233	Dob
00050000-55fa-5d49-42d6-9787251b08b3	3224	Dobje pri Planini
00050000-55fa-5d49-5f1f-c8b5a2023fab	8257	Dobova
00050000-55fa-5d49-0ce0-11a7394993bc	1423	Dobovec
00050000-55fa-5d49-1ebd-7e56d271ad1f	5263	Dobravlje
00050000-55fa-5d49-5629-660234fe2cb9	3204	Dobrna
00050000-55fa-5d49-1b6e-41686f23eed2	8211	Dobrnič
00050000-55fa-5d49-a06c-051b9f16699a	1356	Dobrova
00050000-55fa-5d49-2219-37fb573604ae	9223	Dobrovnik/Dobronak 
00050000-55fa-5d49-10f3-54a61d2f14d1	5212	Dobrovo v Brdih
00050000-55fa-5d49-84ac-1d6da2d6c3c8	1431	Dol pri Hrastniku
00050000-55fa-5d49-2d73-4867ac3a8b7f	1262	Dol pri Ljubljani
00050000-55fa-5d49-724a-2515600e3e7d	1273	Dole pri Litiji
00050000-55fa-5d49-2b56-d6d8e0754a3b	1331	Dolenja vas
00050000-55fa-5d49-9c93-ba2f8f14a791	8350	Dolenjske Toplice
00050000-55fa-5d49-c32f-95c9e76ccaf5	1230	Domžale
00050000-55fa-5d49-d00c-e007667b7f19	2252	Dornava
00050000-55fa-5d49-d7e8-13f5f5b1dece	5294	Dornberk
00050000-55fa-5d49-c0b4-8f7b7b517659	1319	Draga
00050000-55fa-5d49-f6cc-7d31c89ebe04	8343	Dragatuš
00050000-55fa-5d49-3bf2-1d530317091a	3222	Dramlje
00050000-55fa-5d49-0466-3c4e83ee3fec	2370	Dravograd
00050000-55fa-5d49-f2e5-8b4c430cac9b	4203	Duplje
00050000-55fa-5d49-6e01-25bd063a81ad	6221	Dutovlje
00050000-55fa-5d49-b3b0-a2fae5d95daf	8361	Dvor
00050000-55fa-5d49-1140-1e508a07eead	2343	Fala
00050000-55fa-5d49-7710-9193c4dab620	9208	Fokovci
00050000-55fa-5d49-3655-ad71cee126eb	2313	Fram
00050000-55fa-5d49-db4a-246397e96b35	3213	Frankolovo
00050000-55fa-5d49-14d0-2094c8fda394	1274	Gabrovka
00050000-55fa-5d49-829e-8eb66c57fba1	8254	Globoko
00050000-55fa-5d49-0f28-c3809c123201	5275	Godovič
00050000-55fa-5d49-8892-8f9fe898e074	4204	Golnik
00050000-55fa-5d49-86f9-681bbaa6b06a	3303	Gomilsko
00050000-55fa-5d49-3a30-e3f3ed28ab86	4224	Gorenja vas
00050000-55fa-5d49-2b99-da70a81baf54	3263	Gorica pri Slivnici
00050000-55fa-5d49-51d7-6c11d51bcdce	2272	Gorišnica
00050000-55fa-5d49-ef38-8ec3485afcb3	9250	Gornja Radgona
00050000-55fa-5d49-18ff-b18c97b0e04c	3342	Gornji Grad
00050000-55fa-5d49-da4c-05ef66d25fc7	4282	Gozd Martuljek
00050000-55fa-5d49-1848-689aebddeb7d	6272	Gračišče
00050000-55fa-5d49-2631-75c9b82b2a10	9264	Grad
00050000-55fa-5d49-6543-5c9a13e7374a	8332	Gradac
00050000-55fa-5d49-4a9c-2d3cc02c68f7	1384	Grahovo
00050000-55fa-5d49-0547-5b2c2398df24	5242	Grahovo ob Bači
00050000-55fa-5d49-dcb8-bfb75d6c5680	5251	Grgar
00050000-55fa-5d49-06a7-0dacf715f6e3	3302	Griže
00050000-55fa-5d49-d684-b3e72dfe540a	3231	Grobelno
00050000-55fa-5d49-8d61-bb985cc8c954	1290	Grosuplje
00050000-55fa-5d49-711b-744af8c61887	2288	Hajdina
00050000-55fa-5d49-e757-57513d5baae7	8362	Hinje
00050000-55fa-5d49-7345-d57e74358713	2311	Hoče
00050000-55fa-5d49-0bd4-79f0d150f439	9205	Hodoš/Hodos
00050000-55fa-5d49-e00a-4d0ec0f243dd	1354	Horjul
00050000-55fa-5d49-4243-d550b3f9b0fc	1372	Hotedršica
00050000-55fa-5d49-9d36-daf73d2f453f	1430	Hrastnik
00050000-55fa-5d49-ff32-13582f78ad77	6225	Hruševje
00050000-55fa-5d49-314d-778706582697	4276	Hrušica
00050000-55fa-5d49-be56-19d21f3be619	5280	Idrija
00050000-55fa-5d49-7c1d-ea7e2cafa317	1292	Ig
00050000-55fa-5d49-646c-2d660ce3eab6	6250	Ilirska Bistrica
00050000-55fa-5d49-7149-f6483381e0af	6251	Ilirska Bistrica-Trnovo
00050000-55fa-5d49-3a38-b16a3f5c9ab2	1295	Ivančna Gorica
00050000-55fa-5d49-39b2-485ec1be90aa	2259	Ivanjkovci
00050000-55fa-5d49-ccda-0b91909637bc	1411	Izlake
00050000-55fa-5d49-4b24-8e77a220b0b7	6310	Izola/Isola
00050000-55fa-5d49-c9cf-4c89cd271654	2222	Jakobski Dol
00050000-55fa-5d49-6a4c-5bccfe036ac8	2221	Jarenina
00050000-55fa-5d49-fc69-daea1fff3f89	6254	Jelšane
00050000-55fa-5d49-72b9-63854bfa8a32	4270	Jesenice
00050000-55fa-5d49-1a95-4e6a3cb557d2	8261	Jesenice na Dolenjskem
00050000-55fa-5d49-b3f8-a7ea7815b74d	3273	Jurklošter
00050000-55fa-5d49-1df9-ea2be9a8d517	2223	Jurovski Dol
00050000-55fa-5d49-e8d8-9e6a6bc23080	2256	Juršinci
00050000-55fa-5d49-3397-fb41fc2f767c	5214	Kal nad Kanalom
00050000-55fa-5d49-8115-f96d9a2568e7	3233	Kalobje
00050000-55fa-5d49-a45d-79c3a1535110	4246	Kamna Gorica
00050000-55fa-5d49-7b32-c6ecdf3aa5af	2351	Kamnica
00050000-55fa-5d49-38f6-6e5f2cc2f5ec	1241	Kamnik
00050000-55fa-5d49-3a85-57294de40b65	5213	Kanal
00050000-55fa-5d49-ee4f-ec66b2f7e852	8258	Kapele
00050000-55fa-5d49-5054-75c196ba5476	2362	Kapla
00050000-55fa-5d49-a972-3229b4b60382	2325	Kidričevo
00050000-55fa-5d49-a750-a7adf7a08da2	1412	Kisovec
00050000-55fa-5d49-434a-766130c5d2f5	6253	Knežak
00050000-55fa-5d49-7e14-f732578ae4cf	5222	Kobarid
00050000-55fa-5d49-7f36-5ec923229cbb	9227	Kobilje
00050000-55fa-5d49-e306-2e512de765d9	1330	Kočevje
00050000-55fa-5d49-e2bb-408c18fc9664	1338	Kočevska Reka
00050000-55fa-5d49-2af4-fea3465446fd	2276	Kog
00050000-55fa-5d49-4acf-88048810f329	5211	Kojsko
00050000-55fa-5d49-4b25-35a663ec6986	6223	Komen
00050000-55fa-5d49-64e3-25c91841471a	1218	Komenda
00050000-55fa-5d49-c431-a20cca452d9f	6000	Koper/Capodistria 
00050000-55fa-5d49-0964-8de484f2076e	6001	Koper/Capodistria - poštni predali
00050000-55fa-5d49-be79-2e2f31b42523	8282	Koprivnica
00050000-55fa-5d49-5ad4-b5309d5c087f	5296	Kostanjevica na Krasu
00050000-55fa-5d49-8482-24baf95ebb09	8311	Kostanjevica na Krki
00050000-55fa-5d49-670b-d607c226bfb8	1336	Kostel
00050000-55fa-5d49-2df9-f100f85742a8	6256	Košana
00050000-55fa-5d49-98bf-c91db7f11760	2394	Kotlje
00050000-55fa-5d49-b861-2741e97f5ef3	6240	Kozina
00050000-55fa-5d49-d191-32d87045cafe	3260	Kozje
00050000-55fa-5d49-0250-2e69cdfac6d1	4000	Kranj 
00050000-55fa-5d49-4bfe-e02aff5d030e	4001	Kranj - poštni predali
00050000-55fa-5d49-b041-76a6d51b3649	4280	Kranjska Gora
00050000-55fa-5d49-223f-9a8eaa53a5ee	1281	Kresnice
00050000-55fa-5d49-a653-8875a1162b92	4294	Križe
00050000-55fa-5d49-e73a-12015fac220b	9206	Križevci
00050000-55fa-5d49-a39b-1e5632dfcd36	9242	Križevci pri Ljutomeru
00050000-55fa-5d49-efe6-b5178a61fd9e	1301	Krka
00050000-55fa-5d49-2041-6f9b9755220d	8296	Krmelj
00050000-55fa-5d49-65c1-9d3f5c2b5d7d	4245	Kropa
00050000-55fa-5d49-c219-33816320a892	8262	Krška vas
00050000-55fa-5d49-a220-0f86d557eb6b	8270	Krško
00050000-55fa-5d49-315c-ee1fadd8e87a	9263	Kuzma
00050000-55fa-5d49-7557-38be249fa836	2318	Laporje
00050000-55fa-5d49-12d2-ea60224dbe5d	3270	Laško
00050000-55fa-5d49-dcba-2e9237d2a6aa	1219	Laze v Tuhinju
00050000-55fa-5d49-5bc6-facd2d78a4cd	2230	Lenart v Slovenskih goricah
00050000-55fa-5d49-a68c-2aa2780d01c8	9220	Lendava/Lendva
00050000-55fa-5d49-074e-2c5d6a4765ab	4248	Lesce
00050000-55fa-5d49-0255-93e4d9bc47bb	3261	Lesično
00050000-55fa-5d49-3070-6e1d670705b4	8273	Leskovec pri Krškem
00050000-55fa-5d49-33bb-533d97b01d8b	2372	Libeliče
00050000-55fa-5d49-4a09-9e1efbb78f80	2341	Limbuš
00050000-55fa-5d49-03da-15d20047ab40	1270	Litija
00050000-55fa-5d49-b4bd-661d957c8673	3202	Ljubečna
00050000-55fa-5d49-88ad-8baf3d25a9ec	1000	Ljubljana 
00050000-55fa-5d49-92fc-a2d44117f38f	1001	Ljubljana - poštni predali
00050000-55fa-5d49-9d0c-b35ad72b97c5	1231	Ljubljana - Črnuče
00050000-55fa-5d49-d767-f5db583dbfca	1261	Ljubljana - Dobrunje
00050000-55fa-5d49-5114-6be69526a1ba	1260	Ljubljana - Polje
00050000-55fa-5d49-63a8-9d7e71224bbd	1210	Ljubljana - Šentvid
00050000-55fa-5d49-7e08-f59c11416683	1211	Ljubljana - Šmartno
00050000-55fa-5d49-58cb-f604a739bd0d	3333	Ljubno ob Savinji
00050000-55fa-5d49-b741-402f63490299	9240	Ljutomer
00050000-55fa-5d49-35e2-578ac911966d	3215	Loče
00050000-55fa-5d49-b44f-6bbe3e0d5ce1	5231	Log pod Mangartom
00050000-55fa-5d49-56b5-1bf46427e4d4	1358	Log pri Brezovici
00050000-55fa-5d49-25a1-a4b66d66f0df	1370	Logatec
00050000-55fa-5d49-7a0e-73168550862c	1371	Logatec
00050000-55fa-5d49-3341-e107f2742825	1434	Loka pri Zidanem Mostu
00050000-55fa-5d49-0d7b-dca17a70d7ad	3223	Loka pri Žusmu
00050000-55fa-5d49-87bc-0dee1a584667	6219	Lokev
00050000-55fa-5d49-df96-c9dde4715068	1318	Loški Potok
00050000-55fa-5d49-b89a-1629794bc5f9	2324	Lovrenc na Dravskem polju
00050000-55fa-5d49-ecdd-b7845305bb63	2344	Lovrenc na Pohorju
00050000-55fa-5d49-d182-9e602cd4145c	3334	Luče
00050000-55fa-5d49-d295-dd50b7ec1ef2	1225	Lukovica
00050000-55fa-5d49-507b-26768cc7b276	9202	Mačkovci
00050000-55fa-5d49-11cd-26c5d495753b	2322	Majšperk
00050000-55fa-5d49-7b61-e64798e45da9	2321	Makole
00050000-55fa-5d49-eca9-b5e2d08ce1cd	9243	Mala Nedelja
00050000-55fa-5d49-7e2a-f510bed4f821	2229	Malečnik
00050000-55fa-5d49-4f68-c8dc93ee382f	6273	Marezige
00050000-55fa-5d49-a2a3-0e7ef089ce6c	2000	Maribor 
00050000-55fa-5d49-b8d4-128452d56abe	2001	Maribor - poštni predali
00050000-55fa-5d49-b655-48c500510610	2206	Marjeta na Dravskem polju
00050000-55fa-5d49-41c6-c411d72a57bb	2281	Markovci
00050000-55fa-5d49-8d91-260706b8ce07	9221	Martjanci
00050000-55fa-5d49-5f25-32e57912655f	6242	Materija
00050000-55fa-5d49-3d9e-b511573210f5	4211	Mavčiče
00050000-55fa-5d49-1684-513a8d89a5fd	1215	Medvode
00050000-55fa-5d49-aa51-1370aba16082	1234	Mengeš
00050000-55fa-5d49-ee60-0596bc7ffadc	8330	Metlika
00050000-55fa-5d49-e511-8c5089e2c78e	2392	Mežica
00050000-55fa-5d49-45c4-801ba0b407d2	2204	Miklavž na Dravskem polju
00050000-55fa-5d49-90e0-25a49ac87d9f	2275	Miklavž pri Ormožu
00050000-55fa-5d49-5e05-4fbb401f4197	5291	Miren
00050000-55fa-5d49-f89a-1790a01432e2	8233	Mirna
00050000-55fa-5d49-02c6-8e80dcb1ba4f	8216	Mirna Peč
00050000-55fa-5d49-8e1d-ffe41635743c	2382	Mislinja
00050000-55fa-5d49-2869-f0245687110b	4281	Mojstrana
00050000-55fa-5d49-9b7e-cd42599996ae	8230	Mokronog
00050000-55fa-5d49-53f4-425f705fd935	1251	Moravče
00050000-55fa-5d49-80e1-3ccd057425df	9226	Moravske Toplice
00050000-55fa-5d49-9aec-dc8c2b2e9ea9	5216	Most na Soči
00050000-55fa-5d49-4e93-234c5ab5d2fc	1221	Motnik
00050000-55fa-5d49-cb3c-46c6e5f368bc	3330	Mozirje
00050000-55fa-5d49-d829-80c7d6d947ca	9000	Murska Sobota 
00050000-55fa-5d49-0774-81dac4f009e9	9001	Murska Sobota - poštni predali
00050000-55fa-5d49-a6d1-ba0ab5585253	2366	Muta
00050000-55fa-5d49-8fa0-d6acf4f93909	4202	Naklo
00050000-55fa-5d49-8d63-12ac650f3e88	3331	Nazarje
00050000-55fa-5d49-36ca-1b1a3fae6bc5	1357	Notranje Gorice
00050000-55fa-5d49-1556-c309dbaa8851	3203	Nova Cerkev
00050000-55fa-5d49-6992-258b63931bc8	5000	Nova Gorica 
00050000-55fa-5d49-d505-2b9fe47cebdd	5001	Nova Gorica - poštni predali
00050000-55fa-5d49-78e8-d95557573fb5	1385	Nova vas
00050000-55fa-5d49-ab59-9e326506f860	8000	Novo mesto
00050000-55fa-5d49-a351-212b487d71b9	8001	Novo mesto - poštni predali
00050000-55fa-5d49-3ee0-d00766effd0d	6243	Obrov
00050000-55fa-5d49-77a2-14e196f43516	9233	Odranci
00050000-55fa-5d49-81a6-a418f11066dd	2317	Oplotnica
00050000-55fa-5d49-3ad3-8558674e9b83	2312	Orehova vas
00050000-55fa-5d49-1005-90ebdd52f7a4	2270	Ormož
00050000-55fa-5d49-35ec-723e19c77462	1316	Ortnek
00050000-55fa-5d49-7e43-3fa46d577373	1337	Osilnica
00050000-55fa-5d49-9af5-95fd24dae0da	8222	Otočec
00050000-55fa-5d49-c29e-10658e4bff77	2361	Ožbalt
00050000-55fa-5d49-6f62-1fc1d5806a02	2231	Pernica
00050000-55fa-5d49-daca-88a6d016c416	2211	Pesnica pri Mariboru
00050000-55fa-5d49-6e87-3779b5e0f5ff	9203	Petrovci
00050000-55fa-5d49-9c68-3970f591a6a4	3301	Petrovče
00050000-55fa-5d49-d3e2-a56d74697a35	6330	Piran/Pirano
00050000-55fa-5d49-2795-05b11ec0b6e3	8255	Pišece
00050000-55fa-5d49-d7bd-1fbc17ec27e0	6257	Pivka
00050000-55fa-5d49-4008-672e36f6bc09	6232	Planina
00050000-55fa-5d49-90d9-7a68710f7586	3225	Planina pri Sevnici
00050000-55fa-5d49-55b3-fdc8f52a609f	6276	Pobegi
00050000-55fa-5d49-7996-238649a97240	8312	Podbočje
00050000-55fa-5d49-660b-c514d3e915a1	5243	Podbrdo
00050000-55fa-5d49-9cd9-4d488e821ab9	3254	Podčetrtek
00050000-55fa-5d49-99eb-1f02e41510e4	2273	Podgorci
00050000-55fa-5d49-3cfa-0c33f74cd5fd	6216	Podgorje
00050000-55fa-5d49-595b-703e30fbbb21	2381	Podgorje pri Slovenj Gradcu
00050000-55fa-5d49-e8ab-c24351ff09a6	6244	Podgrad
00050000-55fa-5d49-20f4-ab7870aa6b0d	1414	Podkum
00050000-55fa-5d49-0628-2c211122c6fa	2286	Podlehnik
00050000-55fa-5d49-45e5-0166ddd2e487	5272	Podnanos
00050000-55fa-5d49-c59c-3b9d0cddcec5	4244	Podnart
00050000-55fa-5d49-cfd3-e40160eae2e3	3241	Podplat
00050000-55fa-5d49-ff48-ee9d7851409e	3257	Podsreda
00050000-55fa-5d49-e12b-c6521c1493eb	2363	Podvelka
00050000-55fa-5d49-01f5-c658139c72f5	2208	Pohorje
00050000-55fa-5d49-63bd-f3ecc0d0f4cd	2257	Polenšak
00050000-55fa-5d49-ca0a-e438b6c6b4c8	1355	Polhov Gradec
00050000-55fa-5d49-a156-8a14e1f7a50c	4223	Poljane nad Škofjo Loko
00050000-55fa-5d49-36d1-d04b58eb7e70	2319	Poljčane
00050000-55fa-5d49-b641-6a0c42d89b7d	1272	Polšnik
00050000-55fa-5d49-771a-134d19533bd1	3313	Polzela
00050000-55fa-5d49-7452-c43b24274327	3232	Ponikva
00050000-55fa-5d49-bb37-a8c2b388acb0	6320	Portorož/Portorose
00050000-55fa-5d49-dbc1-83e254413933	6230	Postojna
00050000-55fa-5d49-9c7f-bf7739dc3d4f	2331	Pragersko
00050000-55fa-5d49-51bd-120d9df7130f	3312	Prebold
00050000-55fa-5d49-f999-625f2e8a76eb	4205	Preddvor
00050000-55fa-5d49-38f5-44357c4015ff	6255	Prem
00050000-55fa-5d49-28d1-bc18e1cebe9f	1352	Preserje
00050000-55fa-5d49-22c7-18b0e5266ee8	6258	Prestranek
00050000-55fa-5d49-f76e-2332f2eae3d1	2391	Prevalje
00050000-55fa-5d49-e76e-2c9e9e48735e	3262	Prevorje
00050000-55fa-5d49-9a69-e97d7b7ee203	1276	Primskovo 
00050000-55fa-5d49-c699-76dc10b576ea	3253	Pristava pri Mestinju
00050000-55fa-5d49-da55-1580ab1497f7	9207	Prosenjakovci/Partosfalva
00050000-55fa-5d49-92b4-233875dd2d64	5297	Prvačina
00050000-55fa-5d49-961d-3139b50709cd	2250	Ptuj
00050000-55fa-5d49-70b7-a52a7e859e11	2323	Ptujska Gora
00050000-55fa-5d49-c6c6-5fd6228e7823	9201	Puconci
00050000-55fa-5d49-61be-18ca07ae0cf4	2327	Rače
00050000-55fa-5d49-d70a-d8c64331c48b	1433	Radeče
00050000-55fa-5d49-45f1-0117ea704864	9252	Radenci
00050000-55fa-5d49-82a9-9033fb21e315	2360	Radlje ob Dravi
00050000-55fa-5d49-248c-0c0374decbbc	1235	Radomlje
00050000-55fa-5d49-19a7-07ec47604caa	4240	Radovljica
00050000-55fa-5d49-af10-1ae218517b9f	8274	Raka
00050000-55fa-5d49-8119-048cc91b661c	1381	Rakek
00050000-55fa-5d49-13a7-7f0d3a50df46	4283	Rateče - Planica
00050000-55fa-5d49-4c71-ed67801ed3ba	2390	Ravne na Koroškem
00050000-55fa-5d49-60c4-6fa0fe7b6eec	9246	Razkrižje
00050000-55fa-5d49-0dab-ac531255dd06	3332	Rečica ob Savinji
00050000-55fa-5d49-8e89-36acdf0af9eb	5292	Renče
00050000-55fa-5d49-059c-fd8af5d8e748	1310	Ribnica
00050000-55fa-5d49-45e2-0b657e8a78ef	2364	Ribnica na Pohorju
00050000-55fa-5d49-1512-c24e98a0dd5e	3272	Rimske Toplice
00050000-55fa-5d49-8ee0-59d5113b3aeb	1314	Rob
00050000-55fa-5d49-0528-38cce344e5b1	5215	Ročinj
00050000-55fa-5d49-7135-02154562c27a	3250	Rogaška Slatina
00050000-55fa-5d49-25b9-d2bad5d9bd4d	9262	Rogašovci
00050000-55fa-5d49-dabc-93a04e1df3a2	3252	Rogatec
00050000-55fa-5d49-0a18-fad154003b08	1373	Rovte
00050000-55fa-5d49-60bc-d8886638b12a	2342	Ruše
00050000-55fa-5d49-fb59-cb887c35e98b	1282	Sava
00050000-55fa-5d49-2525-cd2a2456c6fd	6333	Sečovlje/Sicciole
00050000-55fa-5d49-cf0e-db70b9d31d13	4227	Selca
00050000-55fa-5d49-23ec-e3662690f464	2352	Selnica ob Dravi
00050000-55fa-5d49-f94c-ce5412bf085c	8333	Semič
00050000-55fa-5d49-5471-e88803b5e226	8281	Senovo
00050000-55fa-5d49-64a6-275c13a575bd	6224	Senožeče
00050000-55fa-5d49-bcd4-ee6efee731a6	8290	Sevnica
00050000-55fa-5d49-1be3-4d3db9e6f99f	6210	Sežana
00050000-55fa-5d49-6cea-13e4e5e0daa1	2214	Sladki Vrh
00050000-55fa-5d49-e3e3-85f6b1d001c0	5283	Slap ob Idrijci
00050000-55fa-5d49-2ceb-158a1c89b448	2380	Slovenj Gradec
00050000-55fa-5d49-8033-1560e7f93a45	2310	Slovenska Bistrica
00050000-55fa-5d49-f840-5d217170e60a	3210	Slovenske Konjice
00050000-55fa-5d49-c006-db8eed7f0609	1216	Smlednik
00050000-55fa-5d49-9a72-574effc91c8a	5232	Soča
00050000-55fa-5d49-f8ed-ce3b66ba7b67	1317	Sodražica
00050000-55fa-5d49-d5a8-bb7dc901b2c6	3335	Solčava
00050000-55fa-5d49-979c-54fae7410df0	5250	Solkan
00050000-55fa-5d49-55b7-9e71130dcc19	4229	Sorica
00050000-55fa-5d49-61f9-a7a1f8879b0e	4225	Sovodenj
00050000-55fa-5d49-d343-b8bb79e2ef38	5281	Spodnja Idrija
00050000-55fa-5d49-05f8-63698bb3fc12	2241	Spodnji Duplek
00050000-55fa-5d49-47c6-5acbccea9c54	9245	Spodnji Ivanjci
00050000-55fa-5d49-c965-5b5839a26b05	2277	Središče ob Dravi
00050000-55fa-5d49-8d0f-96d8acd5d7c0	4267	Srednja vas v Bohinju
00050000-55fa-5d49-40dc-46f34720cddd	8256	Sromlje 
00050000-55fa-5d49-ed03-119354e824c0	5224	Srpenica
00050000-55fa-5d49-0f37-699ae6816365	1242	Stahovica
00050000-55fa-5d49-3707-0d3bf94b40f9	1332	Stara Cerkev
00050000-55fa-5d49-72ed-296a94f5378e	8342	Stari trg ob Kolpi
00050000-55fa-5d49-3eff-f35a0544dcd1	1386	Stari trg pri Ložu
00050000-55fa-5d49-ab7f-0d5cd9b3aaa8	2205	Starše
00050000-55fa-5d49-04cb-94a4e345ca4f	2289	Stoperce
00050000-55fa-5d49-8af6-f99e2e37aa3c	8322	Stopiče
00050000-55fa-5d49-62b8-d69802cf86f7	3206	Stranice
00050000-55fa-5d49-873e-65e9b74009c7	8351	Straža
00050000-55fa-5d49-e5b2-895ad328f124	1313	Struge
00050000-55fa-5d49-9246-1db8c102c2e6	8293	Studenec
00050000-55fa-5d49-abb9-347e56ad82d9	8331	Suhor
00050000-55fa-5d49-75c6-b907719d3b53	2233	Sv. Ana v Slovenskih goricah
00050000-55fa-5d49-266b-3b286886daa6	2235	Sv. Trojica v Slovenskih goricah
00050000-55fa-5d49-1d42-7e653295dd3a	2353	Sveti Duh na Ostrem Vrhu
00050000-55fa-5d49-7d6e-1ebb8a4c61a3	9244	Sveti Jurij ob Ščavnici
00050000-55fa-5d49-9dc0-a644a230620d	3264	Sveti Štefan
00050000-55fa-5d49-ae72-b550a2510500	2258	Sveti Tomaž
00050000-55fa-5d49-cb5a-be8111a266c4	9204	Šalovci
00050000-55fa-5d49-a01d-5e1c6fad0440	5261	Šempas
00050000-55fa-5d49-7d18-3df4a973dab5	5290	Šempeter pri Gorici
00050000-55fa-5d49-7bbe-d2db5b10ca07	3311	Šempeter v Savinjski dolini
00050000-55fa-5d49-3b01-666594e15c5f	4208	Šenčur
00050000-55fa-5d49-4070-29d5105ba186	2212	Šentilj v Slovenskih goricah
00050000-55fa-5d49-09b0-3741360260ec	8297	Šentjanž
00050000-55fa-5d49-7405-b776ad152986	2373	Šentjanž pri Dravogradu
00050000-55fa-5d49-27a6-4c351c840fb7	8310	Šentjernej
00050000-55fa-5d49-9305-a15c28f9e121	3230	Šentjur
00050000-55fa-5d49-04f2-9b8c9f955fef	3271	Šentrupert
00050000-55fa-5d49-3b5f-6c9809b2623d	8232	Šentrupert
00050000-55fa-5d49-9791-bd719852f320	1296	Šentvid pri Stični
00050000-55fa-5d49-0b1b-9826d5eba509	8275	Škocjan
00050000-55fa-5d49-8026-43a87a0b891e	6281	Škofije
00050000-55fa-5d49-28f3-e33c72c661df	4220	Škofja Loka
00050000-55fa-5d49-8ad4-dd256a21ce0f	3211	Škofja vas
00050000-55fa-5d49-54b0-dfdd51fa53c6	1291	Škofljica
00050000-55fa-5d49-7ef3-cef880588de7	6274	Šmarje
00050000-55fa-5d49-7d5c-4454be1a552a	1293	Šmarje - Sap
00050000-55fa-5d49-62ff-7e3145588bec	3240	Šmarje pri Jelšah
00050000-55fa-5d49-6e83-8fa122d107e9	8220	Šmarješke Toplice
00050000-55fa-5d49-b89f-9e2ea69fad93	2315	Šmartno na Pohorju
00050000-55fa-5d49-3ff5-8a08fbc56683	3341	Šmartno ob Dreti
00050000-55fa-5d49-1b4c-39662d363d6d	3327	Šmartno ob Paki
00050000-55fa-5d49-33e2-96dc27fdf753	1275	Šmartno pri Litiji
00050000-55fa-5d49-5924-4924391f6127	2383	Šmartno pri Slovenj Gradcu
00050000-55fa-5d49-92ff-4da95e6d01b0	3201	Šmartno v Rožni dolini
00050000-55fa-5d49-ee05-5c49af07d572	3325	Šoštanj
00050000-55fa-5d49-b728-75e4fd0f430c	6222	Štanjel
00050000-55fa-5d49-a44f-3bb789ad127a	3220	Štore
00050000-55fa-5d49-aa74-87d0b0ac5fcc	3304	Tabor
00050000-55fa-5d49-8afc-4cf2a87f5765	3221	Teharje
00050000-55fa-5d49-ae96-2d97182ff2fd	9251	Tišina
00050000-55fa-5d49-fcef-e237d8003bf5	5220	Tolmin
00050000-55fa-5d49-8044-e2c4eafb4ddc	3326	Topolšica
00050000-55fa-5d49-ab30-a8b2487b3628	2371	Trbonje
00050000-55fa-5d49-66c5-63bbd292b51d	1420	Trbovlje
00050000-55fa-5d49-e1cd-2e5644b8cf67	8231	Trebelno 
00050000-55fa-5d49-e89d-08c70a7f6070	8210	Trebnje
00050000-55fa-5d49-dfe0-77b433513971	5252	Trnovo pri Gorici
00050000-55fa-5d49-a2b9-9d82def9a10a	2254	Trnovska vas
00050000-55fa-5d49-c3d2-b43f0bd9c990	1222	Trojane
00050000-55fa-5d49-9f91-e21e22bde34f	1236	Trzin
00050000-55fa-5d49-05df-ff6044b4f36f	4290	Tržič
00050000-55fa-5d49-032a-a9aff823d98c	8295	Tržišče
00050000-55fa-5d49-fa80-564ac6370618	1311	Turjak
00050000-55fa-5d49-8885-88123ebc3b05	9224	Turnišče
00050000-55fa-5d49-c95e-61ffabcd3c27	8323	Uršna sela
00050000-55fa-5d49-5403-a577166abb44	1252	Vače
00050000-55fa-5d49-f99f-f8b629e7d94a	3320	Velenje 
00050000-55fa-5d49-0bfd-abc4fbf3805c	3322	Velenje - poštni predali
00050000-55fa-5d49-d11b-19d029cae852	8212	Velika Loka
00050000-55fa-5d49-90ec-a3e5190b22c4	2274	Velika Nedelja
00050000-55fa-5d49-9083-0482df8db835	9225	Velika Polana
00050000-55fa-5d49-ac28-159b79107f1a	1315	Velike Lašče
00050000-55fa-5d49-73f5-77f8231abf35	8213	Veliki Gaber
00050000-55fa-5d49-00fa-326538eceda7	9241	Veržej
00050000-55fa-5d49-f4c1-fa26056c629e	1312	Videm - Dobrepolje
00050000-55fa-5d49-2ec7-ce6adcb6ef32	2284	Videm pri Ptuju
00050000-55fa-5d49-e04e-c735ba741cff	8344	Vinica
00050000-55fa-5d49-4ccf-a720fe4258dc	5271	Vipava
00050000-55fa-5d49-5c97-9bc0111d5987	4212	Visoko
00050000-55fa-5d49-5012-e8645305a2cd	1294	Višnja Gora
00050000-55fa-5d49-6a52-a83f9749cd82	3205	Vitanje
00050000-55fa-5d49-7a80-8ef15d606789	2255	Vitomarci
00050000-55fa-5d49-07df-42cd3834f109	1217	Vodice
00050000-55fa-5d49-dcda-0dc0e9f420eb	3212	Vojnik\t
00050000-55fa-5d49-0f17-00eff67360ab	5293	Volčja Draga
00050000-55fa-5d49-af16-023a2e79b365	2232	Voličina
00050000-55fa-5d49-4c94-b887bae3deaf	3305	Vransko
00050000-55fa-5d49-1609-6438cbff4261	6217	Vremski Britof
00050000-55fa-5d49-edcc-2287ca9d397b	1360	Vrhnika
00050000-55fa-5d49-5897-96724d1a458d	2365	Vuhred
00050000-55fa-5d49-aab5-b0b42de4462e	2367	Vuzenica
00050000-55fa-5d49-a48d-b7a0230dcda8	8292	Zabukovje 
00050000-55fa-5d49-4abe-9188ece6bc88	1410	Zagorje ob Savi
00050000-55fa-5d49-3590-bd4836b64eb1	1303	Zagradec
00050000-55fa-5d49-b4d9-8173ff5e9a99	2283	Zavrč
00050000-55fa-5d49-7ad4-ab34e6e3f651	8272	Zdole 
00050000-55fa-5d49-8144-73ca0525e016	4201	Zgornja Besnica
00050000-55fa-5d49-439a-2ad2ad4d0c9c	2242	Zgornja Korena
00050000-55fa-5d49-dbf8-66ecf2aad580	2201	Zgornja Kungota
00050000-55fa-5d49-c235-4f532578a41a	2316	Zgornja Ložnica
00050000-55fa-5d49-be32-6c7e2337f82d	2314	Zgornja Polskava
00050000-55fa-5d49-0650-dfb1c4f769b0	2213	Zgornja Velka
00050000-55fa-5d49-5db9-fde0f33412e8	4247	Zgornje Gorje
00050000-55fa-5d49-c5a8-62eef34cb1bc	4206	Zgornje Jezersko
00050000-55fa-5d49-6951-4543136cdba1	2285	Zgornji Leskovec
00050000-55fa-5d49-4354-d66d688b91dc	1432	Zidani Most
00050000-55fa-5d49-d09d-323351510b46	3214	Zreče
00050000-55fa-5d49-2bc1-d3bca85a2bcf	4209	Žabnica
00050000-55fa-5d49-57cf-686b49c45071	3310	Žalec
00050000-55fa-5d49-792a-1cf082051487	4228	Železniki
00050000-55fa-5d49-1924-35cd267ba1a9	2287	Žetale
00050000-55fa-5d49-859b-4144c0aaacef	4226	Žiri
00050000-55fa-5d49-28b5-c856dbbfb757	4274	Žirovnica
00050000-55fa-5d49-1f9c-0c263fe6460a	8360	Žužemberk
\.


--
-- TOC entry 2933 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19887997)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19887629)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19887436)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55fa-5d4b-edff-24bfa604df7d	00080000-55fa-5d4b-f328-26aa90e8a7fa	\N	00040000-55fa-5d49-5a61-917a27c7272a	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55fa-5d4b-27a0-5bf64b82c359	00080000-55fa-5d4b-f328-26aa90e8a7fa	\N	00040000-55fa-5d49-5a61-917a27c7272a	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55fa-5d4b-9db3-0c82a8aa02af	00080000-55fa-5d4b-2ce4-a8b24e554159	\N	00040000-55fa-5d49-5a61-917a27c7272a	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2955 (class 0 OID 19887514)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 19887641)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 19888011)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 19888021)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55fa-5d4b-7d94-a53065a84a2f	00080000-55fa-5d4b-23f1-94ff88a44d26	0987	AK
00190000-55fa-5d4b-f3f7-d7f0d61671de	00080000-55fa-5d4b-2ce4-a8b24e554159	0989	AK
00190000-55fa-5d4b-d4d4-b737926d9a2e	00080000-55fa-5d4b-f3ef-5a44a4c53796	0986	AK
00190000-55fa-5d4b-1f4e-d7e105c5f4b0	00080000-55fa-5d4b-24f0-cb3d8a99b251	0984	AK
00190000-55fa-5d4b-6b75-455b9fcad35c	00080000-55fa-5d4b-a06e-2305a41ba44e	0983	AK
00190000-55fa-5d4b-0c20-59f3208fee7d	00080000-55fa-5d4b-bd77-a579ca1ea8b6	0982	AK
00190000-55fa-5d4c-35c8-36d69f912060	00080000-55fa-5d4c-1c71-35db935075fa	1001	AK
\.


--
-- TOC entry 2991 (class 0 OID 19887954)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55fa-5d4b-bbc7-0d305a4cdf22	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2995 (class 0 OID 19888029)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19887670)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55fa-5d4b-efd6-07e149283d1c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55fa-5d4b-9980-656ec8065a22	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55fa-5d4b-2c63-eba5a3ff9202	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55fa-5d4b-341d-09911f148120	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55fa-5d4b-fbe5-d7c8e66a2e04	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55fa-5d4b-b012-370bde3a4cb4	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55fa-5d4b-8057-cd2972166482	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2964 (class 0 OID 19887614)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 19887604)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19887807)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19887744)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 19887309)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55fa-5d4c-1c71-35db935075fa	00010000-55fa-5d4a-d8d9-1c88c0d1329d	2015-09-17 08:27:24	INS	a:0:{}
2	App\\Entity\\Option	00000000-55fa-5d4c-e8ce-2bc02419365d	00010000-55fa-5d4a-d8d9-1c88c0d1329d	2015-09-17 08:27:24	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55fa-5d4c-35c8-36d69f912060	00010000-55fa-5d4a-d8d9-1c88c0d1329d	2015-09-17 08:27:24	INS	a:0:{}
\.


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2973 (class 0 OID 19887683)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 19887347)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55fa-5d4a-d8c5-6b2d32e61ce6	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55fa-5d4a-8ad1-9976e01cb170	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55fa-5d4a-f590-aa739e1b2536	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55fa-5d4a-a40f-7b9ed6d366fc	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55fa-5d4a-63b8-31b4b8e938d2	planer	Planer dogodkov v koledarju	t
00020000-55fa-5d4a-04e4-3d032ca22e42	kadrovska	Kadrovska služba	t
00020000-55fa-5d4a-6fd2-360772b43585	arhivar	Ažuriranje arhivalij	t
00020000-55fa-5d4a-89cc-0ae9f66a1791	igralec	Igralec	t
00020000-55fa-5d4a-54f3-ab1ebd176cf9	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55fa-5d4b-8c06-b2b3677775bc	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2940 (class 0 OID 19887331)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55fa-5d4a-b274-4a8243401b6d	00020000-55fa-5d4a-f590-aa739e1b2536
00010000-55fa-5d4a-d8d9-1c88c0d1329d	00020000-55fa-5d4a-f590-aa739e1b2536
00010000-55fa-5d4b-a822-eccae228e2fe	00020000-55fa-5d4b-8c06-b2b3677775bc
\.


--
-- TOC entry 2975 (class 0 OID 19887697)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19887635)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19887581)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 19887296)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55fa-5d49-0152-f40455866155	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55fa-5d49-db25-6d0a504f5ef9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55fa-5d49-e621-466f9d61d3cf	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55fa-5d49-0788-b3ad3fdcc39c	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55fa-5d49-f1aa-3fd2bafc7a19	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2935 (class 0 OID 19887288)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55fa-5d49-dd04-0bbcc7bf54c3	00230000-55fa-5d49-0788-b3ad3fdcc39c	popa
00240000-55fa-5d49-40c7-e0db34e5fd80	00230000-55fa-5d49-0788-b3ad3fdcc39c	oseba
00240000-55fa-5d49-b8b4-796cfe4e7612	00230000-55fa-5d49-0788-b3ad3fdcc39c	sezona
00240000-55fa-5d49-9e64-66784cad1cc8	00230000-55fa-5d49-db25-6d0a504f5ef9	prostor
00240000-55fa-5d49-97de-f01d2bff6b21	00230000-55fa-5d49-0788-b3ad3fdcc39c	besedilo
00240000-55fa-5d49-f10c-183b468925cb	00230000-55fa-5d49-0788-b3ad3fdcc39c	uprizoritev
00240000-55fa-5d49-7584-8d785e41ea5d	00230000-55fa-5d49-0788-b3ad3fdcc39c	funkcija
00240000-55fa-5d49-3e04-c5fe27a3ff07	00230000-55fa-5d49-0788-b3ad3fdcc39c	tipfunkcije
00240000-55fa-5d49-7532-296fc4a4c00c	00230000-55fa-5d49-0788-b3ad3fdcc39c	alternacija
00240000-55fa-5d49-ac58-0c4231409b2b	00230000-55fa-5d49-0152-f40455866155	pogodba
00240000-55fa-5d49-ea73-b2c6a6827371	00230000-55fa-5d49-0788-b3ad3fdcc39c	zaposlitev
00240000-55fa-5d49-7530-5f7224fe96f0	00230000-55fa-5d49-0788-b3ad3fdcc39c	zvrstuprizoritve
00240000-55fa-5d49-21de-50950676d59b	00230000-55fa-5d49-0152-f40455866155	programdela
00240000-55fa-5d49-1547-7c0bfad7cf15	00230000-55fa-5d49-0788-b3ad3fdcc39c	zapis
\.


--
-- TOC entry 2934 (class 0 OID 19887283)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
9ba25bbc-0165-40db-ac5a-54db20e421ab	00240000-55fa-5d49-dd04-0bbcc7bf54c3	0	1001
\.


--
-- TOC entry 2980 (class 0 OID 19887754)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55fa-5d4b-3544-3243d9868926	000e0000-55fa-5d4b-4e52-a706f3398734	00080000-55fa-5d4b-f328-26aa90e8a7fa	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55fa-5d49-7c6e-ee658ca77ab1
00270000-55fa-5d4b-fc4f-499c9b1eb400	000e0000-55fa-5d4b-4e52-a706f3398734	00080000-55fa-5d4b-f328-26aa90e8a7fa	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55fa-5d49-7c6e-ee658ca77ab1
\.


--
-- TOC entry 2947 (class 0 OID 19887409)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 19887591)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55fa-5d4b-3da6-fe2e339988cf	00180000-55fa-5d4b-bc7b-c8ca76605cdd	000c0000-55fa-5d4b-8875-8b559df0a968	00090000-55fa-5d4b-a095-6a45c8b1da2f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-5d4b-5a16-6db287c0aff0	00180000-55fa-5d4b-bc7b-c8ca76605cdd	000c0000-55fa-5d4b-b6db-5bb3267b8a0d	00090000-55fa-5d4b-39cc-36f4e9f71d0b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-5d4b-22a1-8325e2bf8725	00180000-55fa-5d4b-bc7b-c8ca76605cdd	000c0000-55fa-5d4b-7263-0ad5b5f4fc0d	00090000-55fa-5d4b-b252-276858fe562b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-5d4b-08f1-4e2becf13892	00180000-55fa-5d4b-bc7b-c8ca76605cdd	000c0000-55fa-5d4b-743b-bc01d3e7d1ad	00090000-55fa-5d4b-5b96-52d7a9e672a5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-5d4b-094d-f125c46977d0	00180000-55fa-5d4b-bc7b-c8ca76605cdd	000c0000-55fa-5d4b-62ca-4d184d23280f	00090000-55fa-5d4b-3148-110c32a7828b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fa-5d4b-de87-db091ecd37e1	00180000-55fa-5d4b-7cb2-4f54455483a1	\N	00090000-55fa-5d4b-3148-110c32a7828b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2983 (class 0 OID 19887795)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55fa-5d49-604b-2fdcfbb1ab28	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55fa-5d49-612e-aa33fd1d7768	02	Priredba	Priredba	Priredba	umetnik
000f0000-55fa-5d49-bcb9-654c8d3fbe0e	03	Prevod	Prevod	Prevod	umetnik
000f0000-55fa-5d49-1d2b-bacfa09be293	04	Režija	Režija	Režija	umetnik
000f0000-55fa-5d49-b9f2-0c91c6fd9b9b	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55fa-5d49-94e1-037ff7b813ec	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55fa-5d49-e327-61cee716c103	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55fa-5d49-7bd7-3619af67d2b2	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55fa-5d49-46e5-7fa68574fe42	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55fa-5d49-be5d-f3989e0ecabe	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55fa-5d49-42e0-fa52ebf14e1f	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55fa-5d49-06b0-b80f2eac514d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55fa-5d49-bf80-fab2fc6376bd	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55fa-5d49-3fa9-a8f359ac075e	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55fa-5d49-af33-3aaced454ebb	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55fa-5d49-baca-6cdc97bd1604	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55fa-5d49-32f1-588e7a073e05	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55fa-5d49-6fdb-ee1b8f13b4f2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2996 (class 0 OID 19888039)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55fa-5d49-02b7-ed47065b035b	01	Velika predstava	f	1.00	1.00
002b0000-55fa-5d49-c823-e3595f4c202c	02	Mala predstava	f	0.50	0.50
002b0000-55fa-5d49-0553-1c1d3946378c	03	Mala koprodukcija	t	0.40	1.00
002b0000-55fa-5d49-cbd9-db7a46dd6f35	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55fa-5d49-f11a-81a40e3cff54	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2952 (class 0 OID 19887471)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 19887318)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55fa-5d4a-d8d9-1c88c0d1329d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROW3Q0nNwTrmEhyVOU9Z0Rw/a9a8vCW5G	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55fa-5d4b-de81-e963b2a3cfa9	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55fa-5d4b-963f-75a28361182b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55fa-5d4b-3f79-3fae14ba0ff9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55fa-5d4b-a438-e290adc1331f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55fa-5d4b-b555-1eab13153c29	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55fa-5d4b-22f7-d6ceb6166ffd	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55fa-5d4b-9d46-df91320ed5ad	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55fa-5d4b-b0a3-8514c4ca4afd	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55fa-5d4b-9679-598e3a70ce64	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55fa-5d4b-a822-eccae228e2fe	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55fa-5d4a-b274-4a8243401b6d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 19887844)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55fa-5d4b-62f9-24eb75329b16	00160000-55fa-5d4b-3bac-2a1400d2a1b2	\N	00140000-55fa-5d49-aa1d-33ba5c44bfac	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55fa-5d4b-fbe5-d7c8e66a2e04
000e0000-55fa-5d4b-4e52-a706f3398734	00160000-55fa-5d4b-ce05-228a87da10c3	\N	00140000-55fa-5d49-864c-98ad935e81de	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55fa-5d4b-b012-370bde3a4cb4
000e0000-55fa-5d4b-f7f0-6f868b42cc02	\N	\N	00140000-55fa-5d49-864c-98ad935e81de	00190000-55fa-5d4b-7d94-a53065a84a2f	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55fa-5d4b-fbe5-d7c8e66a2e04
000e0000-55fa-5d4b-1b5d-1601a778c93a	\N	\N	00140000-55fa-5d49-864c-98ad935e81de	00190000-55fa-5d4b-7d94-a53065a84a2f	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55fa-5d4b-fbe5-d7c8e66a2e04
000e0000-55fa-5d4b-0b60-fe851f0e5d65	\N	\N	00140000-55fa-5d49-864c-98ad935e81de	00190000-55fa-5d4b-7d94-a53065a84a2f	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55fa-5d4b-efd6-07e149283d1c
000e0000-55fa-5d4b-a9bf-3554b69f185c	\N	\N	00140000-55fa-5d49-864c-98ad935e81de	00190000-55fa-5d4b-7d94-a53065a84a2f	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55fa-5d4b-efd6-07e149283d1c
\.


--
-- TOC entry 2957 (class 0 OID 19887535)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55fa-5d4b-fd5c-d6317ccbaba2	000e0000-55fa-5d4b-4e52-a706f3398734	\N	1	
00200000-55fa-5d4b-6412-afcd7fc2b1aa	000e0000-55fa-5d4b-4e52-a706f3398734	\N	2	
00200000-55fa-5d4b-f8f0-19dadf1057a9	000e0000-55fa-5d4b-4e52-a706f3398734	\N	3	
00200000-55fa-5d4b-ecac-f00fc4b2de6f	000e0000-55fa-5d4b-4e52-a706f3398734	\N	4	
00200000-55fa-5d4b-7a41-399cb9ba77e9	000e0000-55fa-5d4b-4e52-a706f3398734	\N	5	
\.


--
-- TOC entry 2971 (class 0 OID 19887662)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 19887768)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55fa-5d49-aa4c-b57729cedbf1	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55fa-5d49-abfe-daafae348fd5	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55fa-5d49-7f19-431ec3e4166c	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55fa-5d49-6158-58fdb1114b88	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55fa-5d49-12c8-b57604d50560	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55fa-5d49-5231-9139aed9c157	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55fa-5d49-96ad-32e8bf40f909	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55fa-5d49-f1d2-f82b34ec3c2a	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55fa-5d49-7c6e-ee658ca77ab1	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55fa-5d49-6dc9-fe75b2b5c0b1	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55fa-5d49-2176-0aedcf187a97	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55fa-5d49-6eac-49d9ba10bae4	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55fa-5d49-30ad-678d095d900a	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55fa-5d49-e8a2-0b97d6dba014	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55fa-5d49-e50d-94a1fdc4b15b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55fa-5d49-c3a8-3bc13d813b9e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55fa-5d49-3873-78df5b432dd2	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55fa-5d49-99f0-143e2b19737e	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55fa-5d49-23a0-b64e05added3	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55fa-5d49-6c25-1ad54eb7ba22	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55fa-5d49-ba5c-6698af3da71e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55fa-5d49-2cee-92916b1ef399	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55fa-5d49-c914-1ae5dab34352	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55fa-5d49-2548-7d5070b4caa7	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55fa-5d49-04a0-46fddda2803a	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55fa-5d49-d69d-1732efce4638	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55fa-5d49-9613-1685bd41245e	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55fa-5d49-6077-dbe63197daad	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2999 (class 0 OID 19888086)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 19888058)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19888098)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 19887734)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55fa-5d4b-b544-de1271d292b4	00090000-55fa-5d4b-39cc-36f4e9f71d0b	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-5d4b-9efc-58fc6fa104fa	00090000-55fa-5d4b-b252-276858fe562b	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-5d4b-d42b-bceea1736f26	00090000-55fa-5d4b-010b-86ef6ea3475a	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-5d4b-f078-854b5cf323c6	00090000-55fa-5d4b-a945-8c6186c187fc	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-5d4b-88d6-fd403c434a6b	00090000-55fa-5d4b-a095-6a45c8b1da2f	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fa-5d4b-bcda-0d4c31e109ae	00090000-55fa-5d4b-83a5-2fc90b5a2516	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2959 (class 0 OID 19887571)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 19887834)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55fa-5d49-aa1d-33ba5c44bfac	01	Drama	drama (SURS 01)
00140000-55fa-5d49-da11-4fe77f0f147c	02	Opera	opera (SURS 02)
00140000-55fa-5d49-dd14-f45a3d91cb25	03	Balet	balet (SURS 03)
00140000-55fa-5d49-e435-ea8c7363f531	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55fa-5d49-443e-e4c30b8285eb	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55fa-5d49-864c-98ad935e81de	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55fa-5d49-c9b9-9bafc1b34c8f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2977 (class 0 OID 19887724)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2485 (class 2606 OID 19887372)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 19887893)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 19887883)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 19887793)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 19888138)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 19887560)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 19887580)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 19888056)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 19887497)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 19887948)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 19887720)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 19887533)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 19887511)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 19887627)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 19888115)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 19888122)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2725 (class 2606 OID 19888146)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 19887654)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 19887469)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 19887381)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 19887405)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 19887361)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2476 (class 2606 OID 19887346)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 19887660)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 19887696)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 19887829)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 19887433)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 19887457)
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
-- TOC entry 2680 (class 2606 OID 19888009)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 19887633)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 19887447)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 19887521)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 19887645)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 19888018)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 19888026)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 19887996)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 19888037)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 19887678)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 19887618)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 19887609)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 19887817)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 19887751)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 19887317)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 19887687)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 19887335)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2478 (class 2606 OID 19887355)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 19887705)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 19887640)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 19887589)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 19887305)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 19887293)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 19887287)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 19887764)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 19887414)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 19887600)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 19887804)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 19888049)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 19887482)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 19887330)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 19887862)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 19887543)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 19887668)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 19887776)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 19888096)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 19888080)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 19888104)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 19887742)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 19887575)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 19887842)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 19887732)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 1259 OID 19887569)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2541 (class 1259 OID 19887570)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2542 (class 1259 OID 19887568)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2543 (class 1259 OID 19887567)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2544 (class 1259 OID 19887566)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2625 (class 1259 OID 19887765)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2626 (class 1259 OID 19887766)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 19887767)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2711 (class 1259 OID 19888117)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2712 (class 1259 OID 19888116)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2499 (class 1259 OID 19887435)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2588 (class 1259 OID 19887661)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2698 (class 1259 OID 19888084)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2699 (class 1259 OID 19888083)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2700 (class 1259 OID 19888085)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2701 (class 1259 OID 19888082)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2702 (class 1259 OID 19888081)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2582 (class 1259 OID 19887647)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2583 (class 1259 OID 19887646)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2535 (class 1259 OID 19887544)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19887721)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 19887723)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2614 (class 1259 OID 19887722)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2524 (class 1259 OID 19887513)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2525 (class 1259 OID 19887512)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2689 (class 1259 OID 19888038)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2641 (class 1259 OID 19887831)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 19887832)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2643 (class 1259 OID 19887833)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2708 (class 1259 OID 19888105)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2650 (class 1259 OID 19887867)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2651 (class 1259 OID 19887864)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2652 (class 1259 OID 19887868)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2653 (class 1259 OID 19887866)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2654 (class 1259 OID 19887865)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2514 (class 1259 OID 19887484)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2515 (class 1259 OID 19887483)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2490 (class 1259 OID 19887408)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2600 (class 1259 OID 19887688)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2480 (class 1259 OID 19887362)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2481 (class 1259 OID 19887363)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2605 (class 1259 OID 19887708)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2606 (class 1259 OID 19887707)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2607 (class 1259 OID 19887706)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2528 (class 1259 OID 19887522)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2529 (class 1259 OID 19887523)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2460 (class 1259 OID 19887295)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2562 (class 1259 OID 19887613)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2563 (class 1259 OID 19887611)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2564 (class 1259 OID 19887610)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2565 (class 1259 OID 19887612)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2471 (class 1259 OID 19887336)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2472 (class 1259 OID 19887337)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2591 (class 1259 OID 19887669)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2721 (class 1259 OID 19888139)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2722 (class 1259 OID 19888147)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2723 (class 1259 OID 19888148)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2577 (class 1259 OID 19887634)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2621 (class 1259 OID 19887752)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2622 (class 1259 OID 19887753)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2671 (class 1259 OID 19887953)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2672 (class 1259 OID 19887952)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2673 (class 1259 OID 19887949)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2674 (class 1259 OID 19887950)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2675 (class 1259 OID 19887951)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2503 (class 1259 OID 19887449)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2504 (class 1259 OID 19887448)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2505 (class 1259 OID 19887450)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2594 (class 1259 OID 19887682)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2595 (class 1259 OID 19887681)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2681 (class 1259 OID 19888019)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 19888020)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2664 (class 1259 OID 19887897)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2665 (class 1259 OID 19887898)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2666 (class 1259 OID 19887895)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2667 (class 1259 OID 19887896)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2618 (class 1259 OID 19887743)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2568 (class 1259 OID 19887622)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2569 (class 1259 OID 19887621)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2570 (class 1259 OID 19887619)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2571 (class 1259 OID 19887620)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2660 (class 1259 OID 19887885)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2661 (class 1259 OID 19887884)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2534 (class 1259 OID 19887534)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2678 (class 1259 OID 19888010)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2455 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2697 (class 1259 OID 19888057)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2715 (class 1259 OID 19888123)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2716 (class 1259 OID 19888124)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2486 (class 1259 OID 19887383)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2487 (class 1259 OID 19887382)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2495 (class 1259 OID 19887415)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2496 (class 1259 OID 19887416)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2557 (class 1259 OID 19887603)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 19887602)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2559 (class 1259 OID 19887601)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 19887562)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2546 (class 1259 OID 19887563)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2547 (class 1259 OID 19887561)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2548 (class 1259 OID 19887565)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2549 (class 1259 OID 19887564)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2502 (class 1259 OID 19887434)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19887498)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 19887500)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2522 (class 1259 OID 19887499)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2523 (class 1259 OID 19887501)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2576 (class 1259 OID 19887628)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2646 (class 1259 OID 19887830)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 19887863)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19887805)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 19887806)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2493 (class 1259 OID 19887406)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2494 (class 1259 OID 19887407)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2615 (class 1259 OID 19887733)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 19887306)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2513 (class 1259 OID 19887470)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2463 (class 1259 OID 19887294)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2694 (class 1259 OID 19888050)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 19887680)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2599 (class 1259 OID 19887679)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 19887894)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 19887458)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 19887843)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 19888097)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2687 (class 1259 OID 19888027)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 19888028)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2634 (class 1259 OID 19887794)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2556 (class 1259 OID 19887590)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 19887356)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2754 (class 2606 OID 19888269)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2753 (class 2606 OID 19888274)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2749 (class 2606 OID 19888294)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2755 (class 2606 OID 19888264)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2751 (class 2606 OID 19888284)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2750 (class 2606 OID 19888289)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2752 (class 2606 OID 19888279)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2787 (class 2606 OID 19888444)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2786 (class 2606 OID 19888449)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2785 (class 2606 OID 19888454)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2819 (class 2606 OID 19888619)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2820 (class 2606 OID 19888614)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2737 (class 2606 OID 19888204)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 19888374)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2814 (class 2606 OID 19888599)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2815 (class 2606 OID 19888594)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2813 (class 2606 OID 19888604)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 19888589)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2817 (class 2606 OID 19888584)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2769 (class 2606 OID 19888369)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2770 (class 2606 OID 19888364)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2748 (class 2606 OID 19888259)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2781 (class 2606 OID 19888414)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 19888424)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2780 (class 2606 OID 19888419)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2743 (class 2606 OID 19888239)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2744 (class 2606 OID 19888234)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2767 (class 2606 OID 19888354)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2811 (class 2606 OID 19888574)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2790 (class 2606 OID 19888459)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 19888464)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2788 (class 2606 OID 19888469)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2818 (class 2606 OID 19888609)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2792 (class 2606 OID 19888489)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2795 (class 2606 OID 19888474)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2791 (class 2606 OID 19888494)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2793 (class 2606 OID 19888484)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2794 (class 2606 OID 19888479)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2741 (class 2606 OID 19888229)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 19888224)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2733 (class 2606 OID 19888189)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2734 (class 2606 OID 19888184)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2775 (class 2606 OID 19888394)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2730 (class 2606 OID 19888164)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2729 (class 2606 OID 19888169)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2776 (class 2606 OID 19888409)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2777 (class 2606 OID 19888404)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2778 (class 2606 OID 19888399)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2746 (class 2606 OID 19888244)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2745 (class 2606 OID 19888249)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2726 (class 2606 OID 19888149)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2759 (class 2606 OID 19888329)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2761 (class 2606 OID 19888319)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2762 (class 2606 OID 19888314)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2760 (class 2606 OID 19888324)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 19888154)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2727 (class 2606 OID 19888159)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2772 (class 2606 OID 19888379)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2823 (class 2606 OID 19888634)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2825 (class 2606 OID 19888639)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2824 (class 2606 OID 19888644)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2768 (class 2606 OID 19888359)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2784 (class 2606 OID 19888434)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2783 (class 2606 OID 19888439)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 19888549)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 19888544)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2806 (class 2606 OID 19888529)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2805 (class 2606 OID 19888534)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2804 (class 2606 OID 19888539)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2739 (class 2606 OID 19888214)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 19888209)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 19888219)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2773 (class 2606 OID 19888389)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2774 (class 2606 OID 19888384)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 19888559)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2808 (class 2606 OID 19888564)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2799 (class 2606 OID 19888519)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2798 (class 2606 OID 19888524)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2801 (class 2606 OID 19888509)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2800 (class 2606 OID 19888514)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2782 (class 2606 OID 19888429)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 19888349)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2764 (class 2606 OID 19888344)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2766 (class 2606 OID 19888334)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2765 (class 2606 OID 19888339)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2796 (class 2606 OID 19888504)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 19888499)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2747 (class 2606 OID 19888254)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2807 (class 2606 OID 19888554)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2810 (class 2606 OID 19888569)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2812 (class 2606 OID 19888579)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2822 (class 2606 OID 19888624)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2821 (class 2606 OID 19888629)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2731 (class 2606 OID 19888179)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2732 (class 2606 OID 19888174)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2736 (class 2606 OID 19888194)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2735 (class 2606 OID 19888199)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 19888309)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 19888304)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2758 (class 2606 OID 19888299)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-17 08:27:25 CEST

--
-- PostgreSQL database dump complete
--

