--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-14 17:17:21 CEST

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
-- TOC entry 181 (class 1259 OID 19396086)
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
-- TOC entry 226 (class 1259 OID 19396605)
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
-- TOC entry 225 (class 1259 OID 19396588)
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
-- TOC entry 219 (class 1259 OID 19396496)
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
-- TOC entry 240 (class 1259 OID 19396843)
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
-- TOC entry 195 (class 1259 OID 19396264)
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
-- TOC entry 197 (class 1259 OID 19396295)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19396769)
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
-- TOC entry 190 (class 1259 OID 19396207)
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
-- TOC entry 227 (class 1259 OID 19396618)
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
-- TOC entry 213 (class 1259 OID 19396428)
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
-- TOC entry 193 (class 1259 OID 19396243)
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
-- TOC entry 191 (class 1259 OID 19396224)
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
-- TOC entry 202 (class 1259 OID 19396342)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19396824)
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
-- TOC entry 239 (class 1259 OID 19396836)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19396858)
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
-- TOC entry 206 (class 1259 OID 19396367)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19396181)
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
-- TOC entry 182 (class 1259 OID 19396095)
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
-- TOC entry 183 (class 1259 OID 19396106)
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
-- TOC entry 178 (class 1259 OID 19396060)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19396079)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19396374)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19396408)
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
-- TOC entry 222 (class 1259 OID 19396537)
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
-- TOC entry 185 (class 1259 OID 19396139)
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
-- TOC entry 187 (class 1259 OID 19396173)
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
-- TOC entry 229 (class 1259 OID 19396716)
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
-- TOC entry 203 (class 1259 OID 19396348)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19396158)
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
-- TOC entry 192 (class 1259 OID 19396236)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 19396360)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19396730)
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
-- TOC entry 231 (class 1259 OID 19396740)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19396673)
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
-- TOC entry 232 (class 1259 OID 19396748)
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
-- TOC entry 209 (class 1259 OID 19396389)
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
-- TOC entry 201 (class 1259 OID 19396333)
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
-- TOC entry 200 (class 1259 OID 19396323)
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
-- TOC entry 221 (class 1259 OID 19396526)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19396463)
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
-- TOC entry 175 (class 1259 OID 19396031)
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
-- TOC entry 174 (class 1259 OID 19396029)
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
-- TOC entry 210 (class 1259 OID 19396402)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19396069)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19396053)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19396416)
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
-- TOC entry 204 (class 1259 OID 19396354)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19396300)
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
-- TOC entry 173 (class 1259 OID 19396018)
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
-- TOC entry 172 (class 1259 OID 19396010)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19396005)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19396473)
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
-- TOC entry 184 (class 1259 OID 19396131)
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
-- TOC entry 199 (class 1259 OID 19396310)
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
-- TOC entry 220 (class 1259 OID 19396514)
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
-- TOC entry 233 (class 1259 OID 19396758)
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
-- TOC entry 189 (class 1259 OID 19396193)
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
-- TOC entry 176 (class 1259 OID 19396040)
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
-- TOC entry 224 (class 1259 OID 19396563)
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
-- TOC entry 194 (class 1259 OID 19396254)
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
-- TOC entry 208 (class 1259 OID 19396381)
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
-- TOC entry 218 (class 1259 OID 19396487)
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
-- TOC entry 236 (class 1259 OID 19396804)
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
-- TOC entry 235 (class 1259 OID 19396776)
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
-- TOC entry 237 (class 1259 OID 19396816)
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
-- TOC entry 215 (class 1259 OID 19396453)
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
-- TOC entry 196 (class 1259 OID 19396290)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19396553)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19396443)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 19396034)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 19396086)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 19396605)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f6-e4ff-18c4-94ceeb11ece2	000d0000-55f6-e4ff-1893-dc34ed50bc8f	\N	00090000-55f6-e4ff-524f-b6269bbfe05b	000b0000-55f6-e4ff-f7a4-8f3eb2fa2928	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f6-e4ff-2580-e49d34420b02	000d0000-55f6-e4ff-aa7e-4db2a9def9a7	00100000-55f6-e4ff-ed3a-97e1f82f43dd	00090000-55f6-e4ff-d1d6-f9070c45d1ce	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f6-e4ff-36de-2ed1b6f24729	000d0000-55f6-e4ff-08e5-f86c5438f22f	00100000-55f6-e4ff-ac50-a835a2bf7ddd	00090000-55f6-e4ff-a8a8-108693e11043	\N	0003	t	\N	2015-09-14	\N	2	t	\N	f	f
000c0000-55f6-e4ff-5d5b-5a29131251df	000d0000-55f6-e4ff-89d6-ae3a4eed617f	\N	00090000-55f6-e4ff-66cb-e1d8bbdc2033	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f6-e4ff-bc13-85367cf16cd5	000d0000-55f6-e4ff-803f-7e9451d6448e	\N	00090000-55f6-e4ff-8f37-1e336a9b8737	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f6-e4ff-7098-f29c9f08d316	000d0000-55f6-e4ff-3c72-d07da3dcf0b7	\N	00090000-55f6-e4ff-285c-8ef72e740013	000b0000-55f6-e4ff-8b6d-39d1908601f9	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f6-e4ff-f6d2-8b99e2928450	000d0000-55f6-e4ff-e6fe-a3846abdd463	00100000-55f6-e4ff-6adf-c32fb2d25d11	00090000-55f6-e4ff-c05e-67a84ca4ff39	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f6-e4ff-6890-e1bef9596237	000d0000-55f6-e4ff-3245-d2e66cc6c700	\N	00090000-55f6-e4ff-8f28-1c62a52894d7	000b0000-55f6-e4ff-e03a-0dc7a59a97aa	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f6-e4ff-6268-1339b4def6aa	000d0000-55f6-e4ff-e6fe-a3846abdd463	00100000-55f6-e4ff-0261-ea2a5025635c	00090000-55f6-e4ff-346e-84d6ce080893	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f6-e4ff-a0ed-2826a930e76e	000d0000-55f6-e4ff-e6fe-a3846abdd463	00100000-55f6-e4ff-c9c4-a889c66f10c8	00090000-55f6-e4ff-3dd1-d49bb1c09d93	\N	0010	t	\N	2015-09-14	\N	16	f	\N	f	t
000c0000-55f6-e4ff-c63e-9f786f3caac2	000d0000-55f6-e4ff-e6fe-a3846abdd463	00100000-55f6-e4ff-f86b-8d952f1bedf7	00090000-55f6-e4ff-9b63-e858bdacd58b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f6-e4ff-0a3b-389cc7885b03	000d0000-55f6-e4ff-493a-f6d83135a204	\N	00090000-55f6-e4ff-d1d6-f9070c45d1ce	000b0000-55f6-e4ff-a3d7-e84dc987c280	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2986 (class 0 OID 19396588)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 19396496)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f6-e4fe-0cce-d9aea1a0acc1	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f6-e4fe-e04c-a0baf90e6f29	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f6-e4fe-78cf-66eabf354901	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 19396843)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 19396264)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f6-e4ff-b012-dac73c82898d	\N	\N	00200000-55f6-e4ff-b5a2-bf7a044ba0c0	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f6-e4ff-394b-e17e3f54806f	\N	\N	00200000-55f6-e4ff-5b38-6ca041596e84	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f6-e4ff-4398-4599d853d123	\N	\N	00200000-55f6-e4ff-6b2d-d271ad54c149	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f6-e4ff-92bb-6c3ad31b2b56	\N	\N	00200000-55f6-e4ff-28ca-e6333e75d10a	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f6-e4ff-7263-1c0651f54fba	\N	\N	00200000-55f6-e4ff-8a23-76f9dcf34d0d	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2958 (class 0 OID 19396295)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 19396769)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19396207)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f6-e4fd-80ca-b69dc3be48f3	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f6-e4fd-a2da-18772081c30a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f6-e4fd-0983-cf46d66e570e	AL	ALB	008	Albania 	Albanija	\N
00040000-55f6-e4fd-6c65-f1d86e9f2b4c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f6-e4fd-69ca-d56acf7012d3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f6-e4fd-7051-03d9d162e1be	AD	AND	020	Andorra 	Andora	\N
00040000-55f6-e4fd-3f5a-88ede5df908e	AO	AGO	024	Angola 	Angola	\N
00040000-55f6-e4fd-932e-efd0dc0aad26	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f6-e4fd-ec90-74d7cbbaa775	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f6-e4fd-1b48-05cd20f87dee	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f6-e4fd-0109-e0e66f48c4a1	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f6-e4fd-9925-46d4eb3617d1	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f6-e4fd-3616-f5f3cdff2db2	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f6-e4fd-95a2-c0e0053a65d7	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f6-e4fd-e872-078581c658c6	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f6-e4fd-2959-bd1eb89db5d4	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f6-e4fd-15f1-4ba362cbd807	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f6-e4fd-3f57-79d5cab32c01	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f6-e4fd-82d5-da063cc050eb	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f6-e4fd-fc14-bf95fe6f328c	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f6-e4fd-859b-ca9472814a63	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f6-e4fd-7ccd-37beeec62188	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f6-e4fd-fdcb-445e3ae2bef9	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f6-e4fd-bcb8-b884438e8fcf	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f6-e4fd-7811-b6303585661b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f6-e4fd-3bc1-8be1e919dd05	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f6-e4fd-3243-99ce5f02f9b5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f6-e4fd-d8e4-c901e80c463d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f6-e4fd-a76f-9bf5db5b1d5e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f6-e4fd-a076-45322b2a1bf0	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f6-e4fd-2969-7562e3acf726	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f6-e4fd-2178-c5d2928f24ce	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f6-e4fd-12f9-f5b13a5cad09	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f6-e4fd-29b3-b6b7e33a8f21	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f6-e4fd-bc28-8c9fb293c029	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f6-e4fd-63f3-3168dc073427	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f6-e4fd-1d6f-ba0de1e51ad3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f6-e4fd-310a-e017b44991bd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f6-e4fd-bb6e-1ee587279800	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f6-e4fd-ab95-410bb43e17f0	CA	CAN	124	Canada 	Kanada	\N
00040000-55f6-e4fd-8816-cf3bc2d25fa3	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f6-e4fd-6643-0f6ef5ad37ca	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f6-e4fd-df66-2cc5bb6fb37b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f6-e4fd-7a1f-8348991740e2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f6-e4fd-c2d6-f9215bdbe516	CL	CHL	152	Chile 	Čile	\N
00040000-55f6-e4fd-f032-c15d59b8aaec	CN	CHN	156	China 	Kitajska	\N
00040000-55f6-e4fd-632a-86ca469bc660	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f6-e4fd-7fcb-63aaf1109ec8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f6-e4fd-4992-530a7a9ad89d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f6-e4fd-4e9e-0fa74e3418c7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f6-e4fd-141a-1a013c6ff3b0	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f6-e4fd-8720-68e589045f36	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f6-e4fd-8383-1471b3339cde	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f6-e4fd-6b92-69079e00cc7e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f6-e4fd-372b-18493eaaa62d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f6-e4fd-1191-12c118ed1edf	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f6-e4fd-6171-cfa07af8f3a9	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f6-e4fd-59de-dcc50de43f2e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f6-e4fd-4a60-0a3806273174	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f6-e4fd-f5d2-9a00be69f73a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f6-e4fd-3cdf-2e1a3f67b606	DK	DNK	208	Denmark 	Danska	\N
00040000-55f6-e4fd-e917-054081d68b06	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f6-e4fd-f1a5-fb7149e3cd4b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f6-e4fd-9efc-9a1c1a0eaf44	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f6-e4fd-9906-d2258672d7c9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f6-e4fd-f1a6-d72b04afa055	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f6-e4fd-ead9-4acf64276cf2	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f6-e4fd-d3a1-ebef35176846	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f6-e4fd-a7a0-dd5de151a3b8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f6-e4fd-3e5a-fc34a0c97311	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f6-e4fd-6a79-7efd349d07cd	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f6-e4fd-c7e0-60c39cdfa48e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f6-e4fd-7804-21fa41d594a8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f6-e4fd-0447-05211ea11ed2	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f6-e4fd-d248-4706b3ad7526	FI	FIN	246	Finland 	Finska	\N
00040000-55f6-e4fd-774a-3dfa04578b37	FR	FRA	250	France 	Francija	\N
00040000-55f6-e4fd-d77d-7432c608eac7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f6-e4fd-8a86-421fb62ee6b1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f6-e4fd-149b-a31c5399a70a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f6-e4fd-d6c7-914c723db408	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f6-e4fd-b209-192ebd210b0e	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f6-e4fd-c5e8-3a4d03d3269f	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f6-e4fd-b451-54edcb338d09	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f6-e4fd-c88d-03c2b63258df	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f6-e4fd-39a9-6d64fe4579ec	GH	GHA	288	Ghana 	Gana	\N
00040000-55f6-e4fd-497f-7a754ae61b57	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f6-e4fd-631c-0e4a9f06af40	GR	GRC	300	Greece 	Grčija	\N
00040000-55f6-e4fd-4b47-7f915c66e735	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f6-e4fd-27d0-20dc9c117db5	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f6-e4fd-3cd3-00bed4538c12	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f6-e4fd-e199-84f4d406132f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f6-e4fd-d681-3df0857b202d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f6-e4fd-e38e-214c18e094c0	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f6-e4fd-e0e8-d04a029b0ccf	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f6-e4fd-f4ec-308388800fac	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f6-e4fd-02da-2a50e012ccb6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f6-e4fd-476c-b131b20961ee	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f6-e4fd-da07-a3d6fb958885	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f6-e4fd-0387-4ed8a04f2d52	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f6-e4fd-fb40-17945edb932c	HN	HND	340	Honduras 	Honduras	\N
00040000-55f6-e4fd-691d-9326c10d1e56	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f6-e4fd-71ec-802ad70871a5	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f6-e4fd-5d12-81ce41c3e1ed	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f6-e4fd-b7cb-8dc1c1c8dfee	IN	IND	356	India 	Indija	\N
00040000-55f6-e4fd-c6eb-cc8a51f6f9cc	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f6-e4fd-91bf-6b5d57049629	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f6-e4fd-ff6a-ed565ab98ec1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f6-e4fd-0f27-4ffa1be97f06	IE	IRL	372	Ireland 	Irska	\N
00040000-55f6-e4fd-654b-948a319a9a5a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f6-e4fd-0208-fa54cc8872c0	IL	ISR	376	Israel 	Izrael	\N
00040000-55f6-e4fd-3561-d8a0109cb673	IT	ITA	380	Italy 	Italija	\N
00040000-55f6-e4fd-bbb0-976f1bdefc55	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f6-e4fd-1f07-a53662f6c7bc	JP	JPN	392	Japan 	Japonska	\N
00040000-55f6-e4fd-99da-3fa503c102bc	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f6-e4fd-ae8c-f96b2d7f8a06	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f6-e4fd-adef-375a5f4098ee	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f6-e4fd-5be3-be5960fce140	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f6-e4fd-dab3-170c76bd37eb	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f6-e4fd-4110-f37f195dc413	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f6-e4fd-7603-ca1f3ff73f5d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f6-e4fd-3919-a81fb10e2f9e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f6-e4fd-fbfa-71056bdb5ec9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f6-e4fd-0b1d-a3e90d66ee28	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f6-e4fd-1f8a-8da5775e08eb	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f6-e4fd-08d1-807429fb1425	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f6-e4fd-f88f-d8c65857a8fd	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f6-e4fd-9318-f62407ece53f	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f6-e4fd-efa4-a057168e02a4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f6-e4fd-790b-a3dbd489cb5e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f6-e4fd-cf27-072f6b750370	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f6-e4fd-2e08-ef8f6ffdf683	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f6-e4fd-f5dc-4e5032a496ec	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f6-e4fd-7319-e648ab6ff21d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f6-e4fd-9fef-7496ce458985	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f6-e4fd-1f4e-0ade121b4b09	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f6-e4fd-ae38-284bde7035a2	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f6-e4fd-0fdc-db2818051eb0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f6-e4fd-b000-ad2ed6f7ba50	ML	MLI	466	Mali 	Mali	\N
00040000-55f6-e4fd-17a1-75af180c5d72	MT	MLT	470	Malta 	Malta	\N
00040000-55f6-e4fd-5183-9c21d565f163	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f6-e4fd-944d-7df818145c4a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f6-e4fd-dc93-e74fb62f25be	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f6-e4fd-596e-83f12b4dc241	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f6-e4fd-73f1-d2dd41e3c661	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f6-e4fd-f43e-9370aaeb29e5	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f6-e4fd-d583-deace7f62a06	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f6-e4fd-0248-d39fd1fd0fec	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f6-e4fd-cf84-b02b9cebcb6b	MC	MCO	492	Monaco 	Monako	\N
00040000-55f6-e4fd-5903-2ba74334603f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f6-e4fd-1e73-2beafe939e42	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f6-e4fd-eb96-1b873f28b7f2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f6-e4fd-2cc4-d4703d4032e8	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f6-e4fd-3667-93371b2be223	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f6-e4fd-64b0-2acc5e2088da	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f6-e4fd-1f80-adc8c8a6f016	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f6-e4fd-e397-9526735582b0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f6-e4fd-eb32-9b3b41996b24	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f6-e4fd-34ec-73f636ff8061	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f6-e4fd-ecb5-595df86ee8a8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f6-e4fd-7c5c-41a89ccefe78	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f6-e4fd-9424-d9474516ac9d	NE	NER	562	Niger 	Niger 	\N
00040000-55f6-e4fd-534c-952e5d5d1dd8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f6-e4fd-f367-f5db696e6897	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f6-e4fd-94a2-bf8a5bf7c6bb	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f6-e4fd-65be-252d37b52e56	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f6-e4fd-db18-16ec66a71c0e	NO	NOR	578	Norway 	Norveška	\N
00040000-55f6-e4fd-5047-330d02a746af	OM	OMN	512	Oman 	Oman	\N
00040000-55f6-e4fd-7ef6-85a0cd607b12	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f6-e4fd-a190-7ef0629ddb68	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f6-e4fd-92b8-28fa01e4a240	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f6-e4fd-2b17-55c6d9675b22	PA	PAN	591	Panama 	Panama	\N
00040000-55f6-e4fd-bfaa-9f873e8bc5ae	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f6-e4fd-4a5e-f6af9a36a21c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f6-e4fd-53e0-840b2cd61ae5	PE	PER	604	Peru 	Peru	\N
00040000-55f6-e4fd-ec06-809b11c4d5b1	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f6-e4fd-5455-96c8b144bc64	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f6-e4fd-b850-a05f35ac8300	PL	POL	616	Poland 	Poljska	\N
00040000-55f6-e4fd-e8a7-b75398b9ca3e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f6-e4fd-3ae6-295867c1d5be	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f6-e4fd-73de-9118286d14af	QA	QAT	634	Qatar 	Katar	\N
00040000-55f6-e4fd-bd83-fa39952f0391	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f6-e4fd-0a7d-8bfb52e04491	RO	ROU	642	Romania 	Romunija	\N
00040000-55f6-e4fd-6bd5-fe04fcbce25d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f6-e4fd-ac30-9b8bf4740ae9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f6-e4fd-d8e8-4a21c04bbbed	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f6-e4fd-1f35-5929ea7047d3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f6-e4fd-263d-25cd5f0a584f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f6-e4fd-bde1-5e62db94d99d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f6-e4fd-bf08-8ab46bdf705e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f6-e4fd-5490-ca20e603d487	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f6-e4fd-778b-ffe1067d536e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f6-e4fd-affb-05b43a5677a0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f6-e4fd-8c1c-b8070b0dcbda	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f6-e4fd-e1c8-7ffc13e9c4e9	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f6-e4fd-e559-d31b2f0b6432	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f6-e4fd-645c-048b4fd110e5	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f6-e4fd-1182-68fab19b2fca	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f6-e4fd-550a-278d0d8633a7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f6-e4fd-cb7d-ed210e019d54	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f6-e4fd-8258-33d453e52560	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f6-e4fd-3ea2-af7917803800	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f6-e4fd-67d4-1e9f4df24f42	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f6-e4fd-5ab5-4613e2389a87	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f6-e4fd-ca9d-0c73c61b0360	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f6-e4fd-9a0a-3c4dde203580	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f6-e4fd-2c38-0f22e1cb6154	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f6-e4fd-ed1e-f16ad14ce326	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f6-e4fd-21e0-1a975104535e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f6-e4fd-0dd9-9535faa0534d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f6-e4fd-1c75-36ab13dd96ac	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f6-e4fd-f3ed-beccdb71ef37	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f6-e4fd-5e03-50931b0722ff	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f6-e4fd-8103-d855f6ef4816	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f6-e4fd-a056-b40b349cbfbc	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f6-e4fd-ff6e-9df819d3ca40	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f6-e4fd-e60d-13698cebbd3b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f6-e4fd-b93f-891e1b45779d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f6-e4fd-8768-ca6decdaa248	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f6-e4fd-1ca2-e3fae20ddaad	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f6-e4fd-32c1-816213b1d5d8	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f6-e4fd-9ce4-155925aed148	TH	THA	764	Thailand 	Tajska	\N
00040000-55f6-e4fd-8df2-3bf267463377	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f6-e4fd-a514-fa1e7832384c	TG	TGO	768	Togo 	Togo	\N
00040000-55f6-e4fd-15a6-2ae5948ad4ce	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f6-e4fd-f823-f46742a6b5c4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f6-e4fd-342f-05a0344da152	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f6-e4fd-5823-99c09966f936	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f6-e4fd-2135-a9758fce4d8c	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f6-e4fd-3dfe-9ad49b418cb4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f6-e4fd-7283-0d9fdf7e154f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f6-e4fd-5599-cb01b5c98ce9	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f6-e4fd-790e-8dd28d0b5124	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f6-e4fd-18fd-00820d86d93b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f6-e4fd-9e75-e1866cf815db	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f6-e4fd-42ec-8db7039107c5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f6-e4fd-4d5e-04773ea68f25	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f6-e4fd-bc1f-ef644bb35b32	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f6-e4fd-2105-b09216f0dfa9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f6-e4fd-766f-b518a47ddfc7	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f6-e4fd-648b-1f69c97e2770	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f6-e4fd-efd3-965e5f467563	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f6-e4fd-5a07-ba6926683bd2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f6-e4fd-adba-dc30f524c814	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f6-e4fd-0bf3-05075c979d0d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f6-e4fd-2038-c4ce98042873	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f6-e4fd-0920-f4cd27971bb9	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f6-e4fd-26d9-3cc5e8f3e334	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f6-e4fd-aa8b-bd0f7a0a6d01	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f6-e4fd-5f60-d1e144e14130	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2988 (class 0 OID 19396618)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f6-e4ff-d292-ead608dc2046	000e0000-55f6-e4ff-79e8-c8bc68dfec0d	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-e4fd-51b7-6a776a6e6578	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f6-e4ff-b1f4-ce827a58e291	000e0000-55f6-e4ff-bf98-169bdc4d8654	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-e4fd-f115-91ff8db79c07	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f6-e4ff-8f33-1fe0dcaf462d	000e0000-55f6-e4ff-c0a8-c4bfd9b54802	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-e4fd-51b7-6a776a6e6578	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f6-e4ff-e1e0-a8f486f3c938	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f6-e4ff-7af9-a3ff9fe0ae86	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 19396428)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f6-e4ff-1893-dc34ed50bc8f	000e0000-55f6-e4ff-bf98-169bdc4d8654	000c0000-55f6-e4ff-18c4-94ceeb11ece2	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f6-e4fd-abd9-92587f0d1648
000d0000-55f6-e4ff-aa7e-4db2a9def9a7	000e0000-55f6-e4ff-bf98-169bdc4d8654	000c0000-55f6-e4ff-2580-e49d34420b02	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f6-e4fd-aee0-c23f21724eb8
000d0000-55f6-e4ff-08e5-f86c5438f22f	000e0000-55f6-e4ff-bf98-169bdc4d8654	000c0000-55f6-e4ff-36de-2ed1b6f24729	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f6-e4fd-b77e-8005d5bfdf7a
000d0000-55f6-e4ff-89d6-ae3a4eed617f	000e0000-55f6-e4ff-bf98-169bdc4d8654	000c0000-55f6-e4ff-5d5b-5a29131251df	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f6-e4fd-6018-956d07ce3415
000d0000-55f6-e4ff-803f-7e9451d6448e	000e0000-55f6-e4ff-bf98-169bdc4d8654	000c0000-55f6-e4ff-bc13-85367cf16cd5	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f6-e4fd-6018-956d07ce3415
000d0000-55f6-e4ff-3c72-d07da3dcf0b7	000e0000-55f6-e4ff-bf98-169bdc4d8654	000c0000-55f6-e4ff-7098-f29c9f08d316	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f6-e4fd-abd9-92587f0d1648
000d0000-55f6-e4ff-e6fe-a3846abdd463	000e0000-55f6-e4ff-bf98-169bdc4d8654	000c0000-55f6-e4ff-6268-1339b4def6aa	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f6-e4fd-abd9-92587f0d1648
000d0000-55f6-e4ff-3245-d2e66cc6c700	000e0000-55f6-e4ff-bf98-169bdc4d8654	000c0000-55f6-e4ff-6890-e1bef9596237	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f6-e4fd-d3d8-6551c4edfa2b
000d0000-55f6-e4ff-493a-f6d83135a204	000e0000-55f6-e4ff-bf98-169bdc4d8654	000c0000-55f6-e4ff-0a3b-389cc7885b03	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f6-e4fd-4eb6-0b8d3d26c965
\.


--
-- TOC entry 2954 (class 0 OID 19396243)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 19396224)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f6-e4ff-8ce4-180f171cc13e	00080000-55f6-e4fe-630b-c5e970bfd506	00090000-55f6-e4ff-3dd1-d49bb1c09d93	AK		igralka
\.


--
-- TOC entry 2963 (class 0 OID 19396342)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 19396824)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19396836)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 19396858)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19396367)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19396181)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f6-e4fd-ca1a-e2ba95e7d3b3	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f6-e4fd-35c5-ed272bb6c589	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f6-e4fd-a8c7-29aef4acafda	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f6-e4fd-3675-9d18b92a9961	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f6-e4fd-f3f2-3a6547831502	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f6-e4fd-071f-834662a9ad52	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f6-e4fd-c0aa-1a668bb271a6	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f6-e4fd-87bb-5bf028146108	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f6-e4fd-2166-877c00547427	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f6-e4fd-fdab-e836a17db11a	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f6-e4fd-d935-81625dbe9e9e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f6-e4fd-e454-694cc03fed0d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f6-e4fd-392b-5aa941a0f0cb	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f6-e4fd-400e-983bf49a192c	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f6-e4ff-7f6b-1d928c68b3cc	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f6-e4ff-f458-8e1b19d79f99	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f6-e4ff-6e7f-3b647b435a5b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f6-e4ff-9a50-346f0fc23880	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f6-e4ff-7537-6635bca0cf6d	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f6-e500-b0ff-397d59003770	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2943 (class 0 OID 19396095)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f6-e4ff-94a6-d33a5ff6a6fa	00000000-55f6-e4ff-7f6b-1d928c68b3cc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f6-e4ff-c6d2-2cc3c826faaf	00000000-55f6-e4ff-7f6b-1d928c68b3cc	00010000-55f6-e4fd-21f6-ff11120b3022	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f6-e4ff-bcff-69d673144c5c	00000000-55f6-e4ff-f458-8e1b19d79f99	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2944 (class 0 OID 19396106)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f6-e4ff-524f-b6269bbfe05b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f6-e4ff-66cb-e1d8bbdc2033	00010000-55f6-e4ff-23ce-6340dde16cd9	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f6-e4ff-a8a8-108693e11043	00010000-55f6-e4ff-cecc-0a4bf650a15c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f6-e4ff-346e-84d6ce080893	00010000-55f6-e4ff-a550-8c492657332b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f6-e4ff-5dcb-c4e80beb4061	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f6-e4ff-285c-8ef72e740013	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f6-e4ff-9b63-e858bdacd58b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f6-e4ff-c05e-67a84ca4ff39	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f6-e4ff-3dd1-d49bb1c09d93	00010000-55f6-e4ff-36f1-9109a8a6828b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f6-e4ff-d1d6-f9070c45d1ce	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f6-e4ff-e45e-4f5f264a7472	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f6-e4ff-8f37-1e336a9b8737	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f6-e4ff-8f28-1c62a52894d7	00010000-55f6-e4ff-7600-cdcb7eecdbe2	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 19396060)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f6-e4fd-d1ab-2faf6bec80bc	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f6-e4fd-1b8a-ed0d1c856ba3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f6-e4fd-9cbe-e6ab9f263a13	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f6-e4fd-e84d-cab2f2207c9b	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f6-e4fd-aed6-72309b94f7e8	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f6-e4fd-4fd5-c09cdb0ad50d	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f6-e4fd-8858-3a135f259403	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f6-e4fd-b715-b6c912c96536	Abonma-read	Abonma - branje	f
00030000-55f6-e4fd-5c4b-d2a570137ca7	Abonma-write	Abonma - spreminjanje	f
00030000-55f6-e4fd-f53a-f6cbdb49c60d	Alternacija-read	Alternacija - branje	f
00030000-55f6-e4fd-ec58-76064b2e7270	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f6-e4fd-3ba4-c5cdb8a50cd6	Arhivalija-read	Arhivalija - branje	f
00030000-55f6-e4fd-bc15-a5a34dc5fb7a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f6-e4fd-f2be-902378a53d45	Besedilo-read	Besedilo - branje	f
00030000-55f6-e4fd-5e2d-debaec221960	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f6-e4fd-606c-644710fe05ec	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f6-e4fd-49a3-eed866eb3e22	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f6-e4fd-eb05-bc9a1f813db9	Dogodek-read	Dogodek - branje	f
00030000-55f6-e4fd-5c4e-042a045788cc	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f6-e4fd-b5af-07762c4ec95c	DrugiVir-read	DrugiVir - branje	f
00030000-55f6-e4fd-2d4c-f92cad2cfce2	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f6-e4fd-b19c-57df4f9e774c	Drzava-read	Drzava - branje	f
00030000-55f6-e4fd-e622-fbc3737930d3	Drzava-write	Drzava - spreminjanje	f
00030000-55f6-e4fd-2921-64c28b08cfc6	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f6-e4fd-1762-72b60251761e	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f6-e4fd-ad06-0c72ba787d7c	Funkcija-read	Funkcija - branje	f
00030000-55f6-e4fd-24f1-144ab26c79ac	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f6-e4fd-ac58-df312fb9d533	Gostovanje-read	Gostovanje - branje	f
00030000-55f6-e4fd-90a8-00134e470f70	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f6-e4fd-9eb4-fbdd9dd24238	Gostujoca-read	Gostujoca - branje	f
00030000-55f6-e4fd-854f-03749c54ee04	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f6-e4fd-d231-363284829775	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f6-e4fd-56ea-71968e070f98	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f6-e4fd-8436-b3a93203decd	Kupec-read	Kupec - branje	f
00030000-55f6-e4fd-f4a7-e2d9ba1a6d39	Kupec-write	Kupec - spreminjanje	f
00030000-55f6-e4fd-9bc4-814dea301cc7	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f6-e4fd-84d3-1e99be2012ec	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f6-e4fd-aa3b-36b45c91ec2e	Option-read	Option - branje	f
00030000-55f6-e4fd-0f47-620a879fbbe0	Option-write	Option - spreminjanje	f
00030000-55f6-e4fd-b19c-bc26fcac5f53	OptionValue-read	OptionValue - branje	f
00030000-55f6-e4fd-547a-91bfbefe7d88	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f6-e4fd-9ef2-a7407f54e6eb	Oseba-read	Oseba - branje	f
00030000-55f6-e4fd-eb14-de737a21f963	Oseba-write	Oseba - spreminjanje	f
00030000-55f6-e4fd-f9d8-6d243f14a9fe	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f6-e4fd-bf22-fa5379d9fe72	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f6-e4fd-7eb3-df52d9f6a140	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f6-e4fd-08bd-6c1bbb0002ac	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f6-e4fd-6810-d43b6bee6962	Pogodba-read	Pogodba - branje	f
00030000-55f6-e4fd-9ba9-63892c2b2e96	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f6-e4fd-56e6-044bc6cb8458	Popa-read	Popa - branje	f
00030000-55f6-e4fd-0045-0da123fc1a79	Popa-write	Popa - spreminjanje	f
00030000-55f6-e4fd-b2b2-e7fd24109c82	Posta-read	Posta - branje	f
00030000-55f6-e4fd-43f7-63dab06f6972	Posta-write	Posta - spreminjanje	f
00030000-55f6-e4fd-13ec-9d6b64fb83a5	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f6-e4fd-153a-83373da250b8	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f6-e4fd-647e-4433fc4e5f05	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f6-e4fd-8a3d-f4ab12cfe63b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f6-e4fd-08ad-4d8b78c627b3	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f6-e4fd-a522-5a061a1f5ae6	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f6-e4fd-196b-d8dccecd4ee1	Predstava-read	Predstava - branje	f
00030000-55f6-e4fd-4eca-cc788e5ad950	Predstava-write	Predstava - spreminjanje	f
00030000-55f6-e4fd-cffa-29e19c74022d	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f6-e4fd-d827-a77adaf139e7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f6-e4fd-603c-40afe10e2a9b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f6-e4fd-89b5-655578688faa	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f6-e4fd-e203-0533373194ac	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f6-e4fd-07c3-577e27bbe260	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f6-e4fd-c233-428609b4cb64	ProgramDela-read	ProgramDela - branje	f
00030000-55f6-e4fd-c9b9-25ebc635cbff	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f6-e4fd-cfbe-69b66fae5c49	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f6-e4fd-b0ee-f3e5d9b6ab05	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f6-e4fd-3f58-820da2bb1d78	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f6-e4fd-2066-4098cd46e1fe	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f6-e4fd-b500-47c727362e25	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f6-e4fd-b5eb-8ae300ec29e3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f6-e4fd-37d8-8848f17652df	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f6-e4fd-0796-3f3730cb06c2	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f6-e4fd-a121-b88968f75e6c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f6-e4fd-b979-f4c80abf44d2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f6-e4fd-0ad6-a09b75ba96e7	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f6-e4fd-83a4-29196958366a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f6-e4fd-3daf-766ff58d7c23	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f6-e4fd-75eb-67887a4faec7	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f6-e4fd-1b8b-67fedeefc0d5	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f6-e4fd-0d4e-2d69d9e46d34	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f6-e4fd-3e44-e44495547365	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f6-e4fd-6ac2-feda3b2d3bc8	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f6-e4fd-bf55-c80e9cd3d466	Prostor-read	Prostor - branje	f
00030000-55f6-e4fd-b462-9f88683e159d	Prostor-write	Prostor - spreminjanje	f
00030000-55f6-e4fd-9362-c715e93090b7	Racun-read	Racun - branje	f
00030000-55f6-e4fd-0944-ae43cee9ac1e	Racun-write	Racun - spreminjanje	f
00030000-55f6-e4fd-387f-7357280e6ed0	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f6-e4fd-3577-94430411642f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f6-e4fd-d48f-b4bccc53510b	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f6-e4fd-7330-45ce2310d165	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f6-e4fd-8716-359d5491e6b3	Rekvizit-read	Rekvizit - branje	f
00030000-55f6-e4fd-180c-54753b15f45f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f6-e4fd-4fce-de1445acd4fe	Revizija-read	Revizija - branje	f
00030000-55f6-e4fd-0f76-1f77c79501c2	Revizija-write	Revizija - spreminjanje	f
00030000-55f6-e4fd-7dd9-85ed642b7898	Rezervacija-read	Rezervacija - branje	f
00030000-55f6-e4fd-4844-3f5d000f19c1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f6-e4fd-749a-fa103c7437ba	SedezniRed-read	SedezniRed - branje	f
00030000-55f6-e4fd-d34d-86ff5d096614	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f6-e4fd-5fe6-7bdc93efcf1d	Sedez-read	Sedez - branje	f
00030000-55f6-e4fd-69b7-0f09b31431aa	Sedez-write	Sedez - spreminjanje	f
00030000-55f6-e4fd-a3f1-0724e32b18fa	Sezona-read	Sezona - branje	f
00030000-55f6-e4fd-7bcb-75818b16aa9a	Sezona-write	Sezona - spreminjanje	f
00030000-55f6-e4fd-535a-27d0d4ab8085	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f6-e4fd-97ef-2f5ec67d0364	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f6-e4fd-e89d-9069650abfde	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f6-e4fd-50d3-3e0269de7f5d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f6-e4fd-8f69-db49e4057dfb	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f6-e4fd-0b6c-dd1071a399df	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f6-e4fd-92da-1d18e0f7fbc4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f6-e4fd-41a5-175e57309749	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f6-e4fd-ea03-beb1f964dd99	Telefonska-read	Telefonska - branje	f
00030000-55f6-e4fd-6e8f-fe3eb2f5c5e8	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f6-e4fd-0594-d08b913b9a13	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f6-e4fd-7575-5ccacc913a36	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f6-e4fd-2737-96a7edc31991	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f6-e4fd-00dc-a016e4b1a756	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f6-e4fd-d343-2d142f5feaa8	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f6-e4fd-d6f0-3f5e8b9bdd54	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f6-e4fd-cac6-67c26dedea35	Trr-read	Trr - branje	f
00030000-55f6-e4fd-e491-3d44ba485e44	Trr-write	Trr - spreminjanje	f
00030000-55f6-e4fd-69cf-c0d28212ccef	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f6-e4fd-7945-316e6b31928a	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f6-e4fd-16d7-95360fba41d8	Vaja-read	Vaja - branje	f
00030000-55f6-e4fd-ffea-217f94816ea1	Vaja-write	Vaja - spreminjanje	f
00030000-55f6-e4fd-7f3f-ee98c0151637	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f6-e4fd-e59f-268312b55bae	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f6-e4fd-2665-97e415793dd4	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f6-e4fd-34c3-4708d9a2efec	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f6-e4fd-0e2f-e2ab70ef92f6	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f6-e4fd-798b-34912e94ee60	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f6-e4fd-ed1b-a739e103dd41	Zasedenost-read	Zasedenost - branje	f
00030000-55f6-e4fd-0779-c85d06a4cad8	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f6-e4fd-1ca8-643ce30a8154	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f6-e4fd-584e-65a15d244316	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f6-e4fd-a0e8-f8b8a6ac6430	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f6-e4fd-8b3c-7d4a65a5a04e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f6-e4fd-604f-26a5e2b3bcce	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f6-e4fd-7e3c-3bd48b7a2c25	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f6-e4fd-42a7-c28e379dbe2f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f6-e4fd-20e8-d1e7a66270b6	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f6-e4fd-06a3-9485a10186ac	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f6-e4fd-0189-3f7cb1f66373	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f6-e4fd-2023-0355e2b35127	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f6-e4fd-2ae0-87e9a64c99a3	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f6-e4fd-0340-6a46a05804d8	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f6-e4fd-06a5-3d80df3f1339	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f6-e4fd-c356-a26646dd7717	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f6-e4fd-a3f8-a5f0b225de20	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2941 (class 0 OID 19396079)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f6-e4fd-d52c-0c228db09606	00030000-55f6-e4fd-1b8a-ed0d1c856ba3
00020000-55f6-e4fd-d0d2-972262fb6ea9	00030000-55f6-e4fd-b19c-57df4f9e774c
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-b715-b6c912c96536
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-5c4b-d2a570137ca7
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-f53a-f6cbdb49c60d
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-ec58-76064b2e7270
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-3ba4-c5cdb8a50cd6
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-eb05-bc9a1f813db9
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-e84d-cab2f2207c9b
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-5c4e-042a045788cc
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-b19c-57df4f9e774c
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-e622-fbc3737930d3
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-ad06-0c72ba787d7c
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-24f1-144ab26c79ac
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-ac58-df312fb9d533
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-90a8-00134e470f70
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-9eb4-fbdd9dd24238
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-854f-03749c54ee04
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-d231-363284829775
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-56ea-71968e070f98
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-aa3b-36b45c91ec2e
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-b19c-bc26fcac5f53
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-9ef2-a7407f54e6eb
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-eb14-de737a21f963
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-56e6-044bc6cb8458
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-0045-0da123fc1a79
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-b2b2-e7fd24109c82
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-43f7-63dab06f6972
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-08ad-4d8b78c627b3
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-a522-5a061a1f5ae6
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-196b-d8dccecd4ee1
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-4eca-cc788e5ad950
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-e203-0533373194ac
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-07c3-577e27bbe260
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-bf55-c80e9cd3d466
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-b462-9f88683e159d
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-d48f-b4bccc53510b
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-7330-45ce2310d165
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-8716-359d5491e6b3
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-180c-54753b15f45f
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-a3f1-0724e32b18fa
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-7bcb-75818b16aa9a
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-2737-96a7edc31991
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-69cf-c0d28212ccef
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-7945-316e6b31928a
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-16d7-95360fba41d8
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-ffea-217f94816ea1
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-ed1b-a739e103dd41
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-0779-c85d06a4cad8
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-1ca8-643ce30a8154
00020000-55f6-e4fd-6f2a-82c5a8669060	00030000-55f6-e4fd-a0e8-f8b8a6ac6430
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-b715-b6c912c96536
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-3ba4-c5cdb8a50cd6
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-eb05-bc9a1f813db9
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-b19c-57df4f9e774c
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-ac58-df312fb9d533
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-9eb4-fbdd9dd24238
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-d231-363284829775
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-56ea-71968e070f98
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-aa3b-36b45c91ec2e
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-b19c-bc26fcac5f53
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-9ef2-a7407f54e6eb
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-eb14-de737a21f963
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-56e6-044bc6cb8458
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-b2b2-e7fd24109c82
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-08ad-4d8b78c627b3
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-a522-5a061a1f5ae6
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-196b-d8dccecd4ee1
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-bf55-c80e9cd3d466
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-d48f-b4bccc53510b
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-8716-359d5491e6b3
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-a3f1-0724e32b18fa
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-ea03-beb1f964dd99
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-6e8f-fe3eb2f5c5e8
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-cac6-67c26dedea35
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-e491-3d44ba485e44
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-0e2f-e2ab70ef92f6
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-798b-34912e94ee60
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-1ca8-643ce30a8154
00020000-55f6-e4fd-50de-5df4b860c540	00030000-55f6-e4fd-a0e8-f8b8a6ac6430
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-b715-b6c912c96536
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-f53a-f6cbdb49c60d
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-3ba4-c5cdb8a50cd6
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-bc15-a5a34dc5fb7a
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-f2be-902378a53d45
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-606c-644710fe05ec
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-eb05-bc9a1f813db9
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-b19c-57df4f9e774c
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-ad06-0c72ba787d7c
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-ac58-df312fb9d533
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-9eb4-fbdd9dd24238
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-d231-363284829775
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-aa3b-36b45c91ec2e
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-b19c-bc26fcac5f53
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-9ef2-a7407f54e6eb
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-56e6-044bc6cb8458
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-b2b2-e7fd24109c82
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-196b-d8dccecd4ee1
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-e203-0533373194ac
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-bf55-c80e9cd3d466
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-d48f-b4bccc53510b
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-8716-359d5491e6b3
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-a3f1-0724e32b18fa
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-2737-96a7edc31991
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-16d7-95360fba41d8
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-ed1b-a739e103dd41
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-1ca8-643ce30a8154
00020000-55f6-e4fd-d9f1-4de35bf48177	00030000-55f6-e4fd-a0e8-f8b8a6ac6430
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-b715-b6c912c96536
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-5c4b-d2a570137ca7
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-ec58-76064b2e7270
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-3ba4-c5cdb8a50cd6
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-eb05-bc9a1f813db9
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-b19c-57df4f9e774c
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-ac58-df312fb9d533
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-9eb4-fbdd9dd24238
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-aa3b-36b45c91ec2e
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-b19c-bc26fcac5f53
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-56e6-044bc6cb8458
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-b2b2-e7fd24109c82
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-196b-d8dccecd4ee1
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-bf55-c80e9cd3d466
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-d48f-b4bccc53510b
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-8716-359d5491e6b3
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-a3f1-0724e32b18fa
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-2737-96a7edc31991
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-1ca8-643ce30a8154
00020000-55f6-e4fd-8450-4257d49bfddb	00030000-55f6-e4fd-a0e8-f8b8a6ac6430
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-b715-b6c912c96536
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-3ba4-c5cdb8a50cd6
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-eb05-bc9a1f813db9
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-b19c-57df4f9e774c
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-ac58-df312fb9d533
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-9eb4-fbdd9dd24238
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-aa3b-36b45c91ec2e
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-b19c-bc26fcac5f53
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-56e6-044bc6cb8458
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-b2b2-e7fd24109c82
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-196b-d8dccecd4ee1
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-bf55-c80e9cd3d466
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-d48f-b4bccc53510b
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-8716-359d5491e6b3
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-a3f1-0724e32b18fa
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-0594-d08b913b9a13
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-9cbe-e6ab9f263a13
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-2737-96a7edc31991
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-1ca8-643ce30a8154
00020000-55f6-e4fd-2d26-13fa436ff45c	00030000-55f6-e4fd-a0e8-f8b8a6ac6430
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-d1ab-2faf6bec80bc
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-1b8a-ed0d1c856ba3
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-9cbe-e6ab9f263a13
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-e84d-cab2f2207c9b
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-aed6-72309b94f7e8
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-4fd5-c09cdb0ad50d
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-8858-3a135f259403
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-b715-b6c912c96536
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-5c4b-d2a570137ca7
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-f53a-f6cbdb49c60d
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-ec58-76064b2e7270
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-3ba4-c5cdb8a50cd6
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-bc15-a5a34dc5fb7a
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-f2be-902378a53d45
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-5e2d-debaec221960
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-606c-644710fe05ec
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-49a3-eed866eb3e22
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-eb05-bc9a1f813db9
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-5c4e-042a045788cc
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-b19c-57df4f9e774c
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-e622-fbc3737930d3
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-b5af-07762c4ec95c
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-2d4c-f92cad2cfce2
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-2921-64c28b08cfc6
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-1762-72b60251761e
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-ad06-0c72ba787d7c
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-24f1-144ab26c79ac
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-ac58-df312fb9d533
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-90a8-00134e470f70
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-9eb4-fbdd9dd24238
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-854f-03749c54ee04
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-d231-363284829775
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-56ea-71968e070f98
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-8436-b3a93203decd
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-f4a7-e2d9ba1a6d39
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-9bc4-814dea301cc7
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-84d3-1e99be2012ec
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-aa3b-36b45c91ec2e
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-0f47-620a879fbbe0
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-b19c-bc26fcac5f53
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-547a-91bfbefe7d88
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-9ef2-a7407f54e6eb
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-eb14-de737a21f963
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-f9d8-6d243f14a9fe
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-bf22-fa5379d9fe72
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-7eb3-df52d9f6a140
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-08bd-6c1bbb0002ac
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-6810-d43b6bee6962
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-9ba9-63892c2b2e96
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-56e6-044bc6cb8458
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-0045-0da123fc1a79
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-b2b2-e7fd24109c82
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-43f7-63dab06f6972
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-13ec-9d6b64fb83a5
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-153a-83373da250b8
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-647e-4433fc4e5f05
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-8a3d-f4ab12cfe63b
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-08ad-4d8b78c627b3
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-a522-5a061a1f5ae6
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-196b-d8dccecd4ee1
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-4eca-cc788e5ad950
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-cffa-29e19c74022d
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-d827-a77adaf139e7
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-603c-40afe10e2a9b
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-89b5-655578688faa
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-e203-0533373194ac
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-07c3-577e27bbe260
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-c233-428609b4cb64
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-c9b9-25ebc635cbff
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-cfbe-69b66fae5c49
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-b0ee-f3e5d9b6ab05
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-3f58-820da2bb1d78
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-2066-4098cd46e1fe
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-b500-47c727362e25
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-b5eb-8ae300ec29e3
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-37d8-8848f17652df
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-0796-3f3730cb06c2
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-a121-b88968f75e6c
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-b979-f4c80abf44d2
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-0ad6-a09b75ba96e7
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-83a4-29196958366a
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-3daf-766ff58d7c23
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-75eb-67887a4faec7
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-1b8b-67fedeefc0d5
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-0d4e-2d69d9e46d34
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-3e44-e44495547365
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-6ac2-feda3b2d3bc8
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-bf55-c80e9cd3d466
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-b462-9f88683e159d
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-9362-c715e93090b7
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-0944-ae43cee9ac1e
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-387f-7357280e6ed0
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-3577-94430411642f
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-d48f-b4bccc53510b
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-7330-45ce2310d165
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-8716-359d5491e6b3
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-180c-54753b15f45f
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-4fce-de1445acd4fe
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-0f76-1f77c79501c2
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-7dd9-85ed642b7898
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-4844-3f5d000f19c1
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-749a-fa103c7437ba
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-d34d-86ff5d096614
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-5fe6-7bdc93efcf1d
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-69b7-0f09b31431aa
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-a3f1-0724e32b18fa
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-7bcb-75818b16aa9a
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-535a-27d0d4ab8085
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-97ef-2f5ec67d0364
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-e89d-9069650abfde
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-50d3-3e0269de7f5d
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-8f69-db49e4057dfb
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-0b6c-dd1071a399df
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-92da-1d18e0f7fbc4
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-41a5-175e57309749
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-ea03-beb1f964dd99
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-6e8f-fe3eb2f5c5e8
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-0594-d08b913b9a13
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-7575-5ccacc913a36
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-2737-96a7edc31991
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-00dc-a016e4b1a756
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-d343-2d142f5feaa8
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-d6f0-3f5e8b9bdd54
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-cac6-67c26dedea35
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-e491-3d44ba485e44
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-69cf-c0d28212ccef
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-7945-316e6b31928a
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-16d7-95360fba41d8
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-ffea-217f94816ea1
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-7f3f-ee98c0151637
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-e59f-268312b55bae
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-2665-97e415793dd4
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-34c3-4708d9a2efec
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-0e2f-e2ab70ef92f6
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-798b-34912e94ee60
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-ed1b-a739e103dd41
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-0779-c85d06a4cad8
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-1ca8-643ce30a8154
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-584e-65a15d244316
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-a0e8-f8b8a6ac6430
00020000-55f6-e4ff-9269-8e11fe04659d	00030000-55f6-e4fd-8b3c-7d4a65a5a04e
\.


--
-- TOC entry 2968 (class 0 OID 19396374)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19396408)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 19396537)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f6-e4ff-f7a4-8f3eb2fa2928	00090000-55f6-e4ff-524f-b6269bbfe05b	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f6-e4ff-8b6d-39d1908601f9	00090000-55f6-e4ff-285c-8ef72e740013	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f6-e4ff-e03a-0dc7a59a97aa	00090000-55f6-e4ff-8f28-1c62a52894d7	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f6-e4ff-a3d7-e84dc987c280	00090000-55f6-e4ff-d1d6-f9070c45d1ce	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2946 (class 0 OID 19396139)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f6-e4fe-630b-c5e970bfd506	00040000-55f6-e4fd-5ab5-4613e2389a87	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-e4fe-7711-101f180e458e	00040000-55f6-e4fd-5ab5-4613e2389a87	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f6-e4fe-be5f-a846aeb9ef71	00040000-55f6-e4fd-5ab5-4613e2389a87	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-e4fe-3db1-ef90a378f752	00040000-55f6-e4fd-5ab5-4613e2389a87	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-e4fe-3e92-8566abaef0e2	00040000-55f6-e4fd-5ab5-4613e2389a87	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-e4fe-a64e-bee4192db7db	00040000-55f6-e4fd-0109-e0e66f48c4a1	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-e4fe-c29c-f718ac16b922	00040000-55f6-e4fd-1191-12c118ed1edf	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-e4fe-95b7-8674c43bb47e	00040000-55f6-e4fd-e872-078581c658c6	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-e4ff-79b8-f2514b904669	00040000-55f6-e4fd-c88d-03c2b63258df	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-e500-03a7-0d314ab26925	00040000-55f6-e4fd-5ab5-4613e2389a87	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2948 (class 0 OID 19396173)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f6-e4fc-1d4c-f33fe7072393	8341	Adlešiči
00050000-55f6-e4fc-6ff6-6ceb7f95bd11	5270	Ajdovščina
00050000-55f6-e4fc-985b-1cf6f9fe3b83	6280	Ankaran/Ancarano
00050000-55f6-e4fc-a33e-69eb4878ed5f	9253	Apače
00050000-55f6-e4fc-a9ab-52d45b865c17	8253	Artiče
00050000-55f6-e4fc-0556-a1b58260f61f	4275	Begunje na Gorenjskem
00050000-55f6-e4fc-ac6f-006c998520c8	1382	Begunje pri Cerknici
00050000-55f6-e4fc-aa44-651b3d48dbe8	9231	Beltinci
00050000-55f6-e4fc-ec32-c50ceafb082a	2234	Benedikt
00050000-55f6-e4fc-8c27-b9471fbde059	2345	Bistrica ob Dravi
00050000-55f6-e4fc-89d2-0fb814c677b0	3256	Bistrica ob Sotli
00050000-55f6-e4fc-b58b-b181af9bfc20	8259	Bizeljsko
00050000-55f6-e4fc-643d-25decb4e3a9a	1223	Blagovica
00050000-55f6-e4fc-11ae-d85507e401ce	8283	Blanca
00050000-55f6-e4fc-9ae6-2289f66bae22	4260	Bled
00050000-55f6-e4fc-f3a5-094a1a68f99c	4273	Blejska Dobrava
00050000-55f6-e4fc-d62b-0744d6419785	9265	Bodonci
00050000-55f6-e4fc-ff84-3903fb84b6ff	9222	Bogojina
00050000-55f6-e4fc-0b6a-99d7c9cd0ac7	4263	Bohinjska Bela
00050000-55f6-e4fc-964b-61c53fe0cccd	4264	Bohinjska Bistrica
00050000-55f6-e4fc-42ab-0853db6f5033	4265	Bohinjsko jezero
00050000-55f6-e4fc-8cce-60d671bf88ec	1353	Borovnica
00050000-55f6-e4fc-a34e-84f918b0597a	8294	Boštanj
00050000-55f6-e4fc-0637-cc996d5b3031	5230	Bovec
00050000-55f6-e4fc-8e28-12955d73d7fe	5295	Branik
00050000-55f6-e4fc-6a47-eac1bca7aea3	3314	Braslovče
00050000-55f6-e4fc-68e0-97e3d4a78156	5223	Breginj
00050000-55f6-e4fc-76ee-a8e419c3597c	8280	Brestanica
00050000-55f6-e4fc-f61d-9d4f13e07c69	2354	Bresternica
00050000-55f6-e4fc-504f-fcf36d4a029c	4243	Brezje
00050000-55f6-e4fc-51e7-6f82915a67f2	1351	Brezovica pri Ljubljani
00050000-55f6-e4fc-702f-a2ffcaebe334	8250	Brežice
00050000-55f6-e4fc-1e75-1b7d56722fee	4210	Brnik - Aerodrom
00050000-55f6-e4fc-99f1-3542ac945b0c	8321	Brusnice
00050000-55f6-e4fc-6bfe-7d03c4f4cb04	3255	Buče
00050000-55f6-e4fc-c21a-00fad9a6656e	8276	Bučka 
00050000-55f6-e4fc-1dd3-0119585506d5	9261	Cankova
00050000-55f6-e4fc-c696-86f9c2f6a754	3000	Celje 
00050000-55f6-e4fc-f33d-9005e3d5ddb5	3001	Celje - poštni predali
00050000-55f6-e4fc-8120-12f805de171e	4207	Cerklje na Gorenjskem
00050000-55f6-e4fc-c152-60e2def65c17	8263	Cerklje ob Krki
00050000-55f6-e4fc-3842-5baa79ac70f5	1380	Cerknica
00050000-55f6-e4fc-9a19-a5db08713d45	5282	Cerkno
00050000-55f6-e4fc-1167-21f6c75b13df	2236	Cerkvenjak
00050000-55f6-e4fc-244f-3fdd7a78ff58	2215	Ceršak
00050000-55f6-e4fc-dc97-cc3d7fc12758	2326	Cirkovce
00050000-55f6-e4fc-8540-4331ef1b5db5	2282	Cirkulane
00050000-55f6-e4fc-3231-9a54e45246e1	5273	Col
00050000-55f6-e4fc-61a9-a7c154c555e0	8251	Čatež ob Savi
00050000-55f6-e4fc-af78-5cbd43731fe6	1413	Čemšenik
00050000-55f6-e4fc-b11b-eccc5a8b9a00	5253	Čepovan
00050000-55f6-e4fc-d83e-060a186df2d8	9232	Črenšovci
00050000-55f6-e4fc-d342-c33e280b19c7	2393	Črna na Koroškem
00050000-55f6-e4fc-c0e2-3239e9246647	6275	Črni Kal
00050000-55f6-e4fc-54f7-30d4cb6c825d	5274	Črni Vrh nad Idrijo
00050000-55f6-e4fc-9b3e-ab1f92c89711	5262	Črniče
00050000-55f6-e4fc-b162-a7ef47b2f7e5	8340	Črnomelj
00050000-55f6-e4fc-13d5-1db61b41ffa7	6271	Dekani
00050000-55f6-e4fc-3084-4f8971872944	5210	Deskle
00050000-55f6-e4fc-cc8c-f232e9e90c96	2253	Destrnik
00050000-55f6-e4fc-10ed-6df81ddeae9e	6215	Divača
00050000-55f6-e4fc-e2a4-a8c63e69b215	1233	Dob
00050000-55f6-e4fc-8d53-b2c0b67e94a6	3224	Dobje pri Planini
00050000-55f6-e4fc-68a4-9ca1e8c21578	8257	Dobova
00050000-55f6-e4fc-dcfe-b46880abae64	1423	Dobovec
00050000-55f6-e4fc-4f4c-91f2bf39ebcf	5263	Dobravlje
00050000-55f6-e4fc-35a6-82db182f471d	3204	Dobrna
00050000-55f6-e4fc-0bb3-580674838ee8	8211	Dobrnič
00050000-55f6-e4fc-4af8-b350f67a892e	1356	Dobrova
00050000-55f6-e4fc-1716-f6bbf593ec6c	9223	Dobrovnik/Dobronak 
00050000-55f6-e4fc-f3f5-011d1c4eebd5	5212	Dobrovo v Brdih
00050000-55f6-e4fc-d1f7-b920113467f1	1431	Dol pri Hrastniku
00050000-55f6-e4fc-e750-1c84e2c85043	1262	Dol pri Ljubljani
00050000-55f6-e4fc-cb9b-e9e2e794ffdd	1273	Dole pri Litiji
00050000-55f6-e4fc-ffd3-03c025de0f6d	1331	Dolenja vas
00050000-55f6-e4fc-4a44-25f0a8239edd	8350	Dolenjske Toplice
00050000-55f6-e4fc-2530-f2c0846cbbdc	1230	Domžale
00050000-55f6-e4fc-bf1a-2a5c1e2f5eab	2252	Dornava
00050000-55f6-e4fc-f865-16fa1f7a187c	5294	Dornberk
00050000-55f6-e4fc-9e66-a193ccbf2155	1319	Draga
00050000-55f6-e4fc-6a68-b59ed8ee332a	8343	Dragatuš
00050000-55f6-e4fc-aa2d-0f2e3e0cb52e	3222	Dramlje
00050000-55f6-e4fc-b925-217c293b401f	2370	Dravograd
00050000-55f6-e4fc-6a61-9af7ee728494	4203	Duplje
00050000-55f6-e4fc-b089-b7d85f6da73c	6221	Dutovlje
00050000-55f6-e4fc-dd50-24785c34a15a	8361	Dvor
00050000-55f6-e4fc-a10f-e6d62d39247c	2343	Fala
00050000-55f6-e4fc-6dee-7933cb47ecf3	9208	Fokovci
00050000-55f6-e4fc-7a99-be7257d4274e	2313	Fram
00050000-55f6-e4fc-8f7c-5909bb28a7e6	3213	Frankolovo
00050000-55f6-e4fc-b3c0-d213f5ba0a5d	1274	Gabrovka
00050000-55f6-e4fc-9228-296bc0122cf6	8254	Globoko
00050000-55f6-e4fc-d1a2-210b938d086e	5275	Godovič
00050000-55f6-e4fc-dc12-d6b97c6057e4	4204	Golnik
00050000-55f6-e4fc-94ec-20162747386c	3303	Gomilsko
00050000-55f6-e4fc-7478-c2d06cfbdafc	4224	Gorenja vas
00050000-55f6-e4fc-f1e1-9a7abcad870e	3263	Gorica pri Slivnici
00050000-55f6-e4fc-bf01-3d38be029c97	2272	Gorišnica
00050000-55f6-e4fc-9f1f-6cbb8481db37	9250	Gornja Radgona
00050000-55f6-e4fc-2bd4-edab5c21982b	3342	Gornji Grad
00050000-55f6-e4fc-8cfd-1e96b53d7364	4282	Gozd Martuljek
00050000-55f6-e4fc-77b4-e88bdaa19860	6272	Gračišče
00050000-55f6-e4fc-8ba5-d85db2618b88	9264	Grad
00050000-55f6-e4fc-71bf-8fdbcd13f4a1	8332	Gradac
00050000-55f6-e4fc-69cc-b99e29c49e52	1384	Grahovo
00050000-55f6-e4fc-6f46-5265c6559243	5242	Grahovo ob Bači
00050000-55f6-e4fc-3c34-6fc7776bda18	5251	Grgar
00050000-55f6-e4fc-3c05-7ef175f812b4	3302	Griže
00050000-55f6-e4fc-ecf6-726a6e3f7112	3231	Grobelno
00050000-55f6-e4fc-320b-c00e77554d01	1290	Grosuplje
00050000-55f6-e4fc-1234-a901df46cf95	2288	Hajdina
00050000-55f6-e4fc-f9ae-b0f2c4cd2e5b	8362	Hinje
00050000-55f6-e4fc-1e74-53fd206523c6	2311	Hoče
00050000-55f6-e4fc-7e72-c765cdfec4d4	9205	Hodoš/Hodos
00050000-55f6-e4fc-07ff-bf3442baa224	1354	Horjul
00050000-55f6-e4fc-200b-d4c926b88351	1372	Hotedršica
00050000-55f6-e4fc-f720-7cb9ae1452f6	1430	Hrastnik
00050000-55f6-e4fc-85a3-8fc8c8d285fe	6225	Hruševje
00050000-55f6-e4fc-cb65-dd0147f72bfc	4276	Hrušica
00050000-55f6-e4fc-b1aa-490da8bd495e	5280	Idrija
00050000-55f6-e4fc-dd01-c2c295757694	1292	Ig
00050000-55f6-e4fc-ed5e-5cd5e4a8bb6e	6250	Ilirska Bistrica
00050000-55f6-e4fc-ff33-446062b0cbdf	6251	Ilirska Bistrica-Trnovo
00050000-55f6-e4fc-ae95-cce060bc8d1d	1295	Ivančna Gorica
00050000-55f6-e4fc-0338-249d44e6eb91	2259	Ivanjkovci
00050000-55f6-e4fc-1276-a20486ad094e	1411	Izlake
00050000-55f6-e4fc-e5d6-285637979106	6310	Izola/Isola
00050000-55f6-e4fc-cd35-03958f248e41	2222	Jakobski Dol
00050000-55f6-e4fc-7975-426b4f2b590c	2221	Jarenina
00050000-55f6-e4fc-7336-bf4f15d446f0	6254	Jelšane
00050000-55f6-e4fc-da32-3d1e457d1397	4270	Jesenice
00050000-55f6-e4fc-9b57-660674bd4015	8261	Jesenice na Dolenjskem
00050000-55f6-e4fc-0ce4-68375f16aeb6	3273	Jurklošter
00050000-55f6-e4fc-cec1-387fc3503053	2223	Jurovski Dol
00050000-55f6-e4fc-bbf7-37538ee1dc21	2256	Juršinci
00050000-55f6-e4fc-18f1-fa3c45488925	5214	Kal nad Kanalom
00050000-55f6-e4fc-bca2-9f3b32809072	3233	Kalobje
00050000-55f6-e4fc-de89-3c4037c7b632	4246	Kamna Gorica
00050000-55f6-e4fc-5f6d-bde7bdfdb919	2351	Kamnica
00050000-55f6-e4fc-a799-40e3e25be2c4	1241	Kamnik
00050000-55f6-e4fc-c6f1-dd410295e7e6	5213	Kanal
00050000-55f6-e4fc-775e-6e6e3c50d0bf	8258	Kapele
00050000-55f6-e4fc-0eb8-ce6d26740218	2362	Kapla
00050000-55f6-e4fc-a09e-8836e9ef615f	2325	Kidričevo
00050000-55f6-e4fc-ce87-128c9641d19c	1412	Kisovec
00050000-55f6-e4fc-1896-f6044b5093d9	6253	Knežak
00050000-55f6-e4fc-e471-a29e894d4d12	5222	Kobarid
00050000-55f6-e4fc-0423-3056df7df88e	9227	Kobilje
00050000-55f6-e4fc-a53f-ea9af2778388	1330	Kočevje
00050000-55f6-e4fc-b423-d9ce9cf59ad4	1338	Kočevska Reka
00050000-55f6-e4fc-7b93-1ee3c9b86818	2276	Kog
00050000-55f6-e4fc-3652-72e79a19e0c6	5211	Kojsko
00050000-55f6-e4fc-2bd5-67a0370d0592	6223	Komen
00050000-55f6-e4fc-e25c-fff601a0e486	1218	Komenda
00050000-55f6-e4fc-331e-db96d489a57d	6000	Koper/Capodistria 
00050000-55f6-e4fc-fe84-a3223700fb1e	6001	Koper/Capodistria - poštni predali
00050000-55f6-e4fc-67b5-cdb1acc51976	8282	Koprivnica
00050000-55f6-e4fc-7bc5-4acbfaef4391	5296	Kostanjevica na Krasu
00050000-55f6-e4fc-88d2-585137833aa2	8311	Kostanjevica na Krki
00050000-55f6-e4fc-c897-8249e4c2d163	1336	Kostel
00050000-55f6-e4fc-8bd8-a7bc683c20d7	6256	Košana
00050000-55f6-e4fc-13af-c5e97e96db9f	2394	Kotlje
00050000-55f6-e4fc-ecfa-4abef512ef87	6240	Kozina
00050000-55f6-e4fc-5774-7e9ea6de88cf	3260	Kozje
00050000-55f6-e4fc-673d-5fc157004814	4000	Kranj 
00050000-55f6-e4fc-9908-c4485fe7acfe	4001	Kranj - poštni predali
00050000-55f6-e4fc-426f-70bb9dc7dc48	4280	Kranjska Gora
00050000-55f6-e4fc-2dfd-382fca78bcc0	1281	Kresnice
00050000-55f6-e4fc-521e-a0cf372d51a5	4294	Križe
00050000-55f6-e4fc-ef88-5e6e206be93c	9206	Križevci
00050000-55f6-e4fc-8682-4016a4e9d239	9242	Križevci pri Ljutomeru
00050000-55f6-e4fc-549b-4cb2191746ea	1301	Krka
00050000-55f6-e4fc-bf0a-989ea4efbfa6	8296	Krmelj
00050000-55f6-e4fc-4dc1-28cdb028d798	4245	Kropa
00050000-55f6-e4fc-04b8-4bd33c95ef43	8262	Krška vas
00050000-55f6-e4fc-6d49-c33f9f6fbabc	8270	Krško
00050000-55f6-e4fc-bb35-92c9ed512552	9263	Kuzma
00050000-55f6-e4fc-a633-f24c42d06794	2318	Laporje
00050000-55f6-e4fc-30bd-eb73b84364fb	3270	Laško
00050000-55f6-e4fc-2e9c-b5cc45039bce	1219	Laze v Tuhinju
00050000-55f6-e4fc-b543-8bf6b9073603	2230	Lenart v Slovenskih goricah
00050000-55f6-e4fc-ea0d-cd96fa9d0a94	9220	Lendava/Lendva
00050000-55f6-e4fc-9cd0-c02b8fecfbb5	4248	Lesce
00050000-55f6-e4fc-1c55-db126ff174b0	3261	Lesično
00050000-55f6-e4fc-a9b4-9d72401ddf4e	8273	Leskovec pri Krškem
00050000-55f6-e4fc-d030-09f0f7bd32b1	2372	Libeliče
00050000-55f6-e4fc-272e-1dce571fa8cc	2341	Limbuš
00050000-55f6-e4fc-4694-7e234a9bbc4c	1270	Litija
00050000-55f6-e4fc-fb5a-020c91974d69	3202	Ljubečna
00050000-55f6-e4fc-3073-411ab6648ca1	1000	Ljubljana 
00050000-55f6-e4fc-34ec-dda63b677eb7	1001	Ljubljana - poštni predali
00050000-55f6-e4fc-b121-40fb35ef2b6c	1231	Ljubljana - Črnuče
00050000-55f6-e4fc-f508-eb26f011e162	1261	Ljubljana - Dobrunje
00050000-55f6-e4fc-f0ee-cb04762f29c4	1260	Ljubljana - Polje
00050000-55f6-e4fc-c42e-88391d1f5c37	1210	Ljubljana - Šentvid
00050000-55f6-e4fc-acf7-cfdb8d7d4e75	1211	Ljubljana - Šmartno
00050000-55f6-e4fc-698d-b1dffbaf771c	3333	Ljubno ob Savinji
00050000-55f6-e4fc-65f5-0e92d41de9b2	9240	Ljutomer
00050000-55f6-e4fc-17b9-8d3ba3492c0c	3215	Loče
00050000-55f6-e4fc-fd40-1cca973e3669	5231	Log pod Mangartom
00050000-55f6-e4fc-1010-b68023e23e9b	1358	Log pri Brezovici
00050000-55f6-e4fc-53e8-ad59c344f0ca	1370	Logatec
00050000-55f6-e4fc-32ab-4ce6a6c88537	1371	Logatec
00050000-55f6-e4fc-1d58-1fbdc540a881	1434	Loka pri Zidanem Mostu
00050000-55f6-e4fc-90db-5d6022b0ec12	3223	Loka pri Žusmu
00050000-55f6-e4fc-9ae4-2eec060a7ba7	6219	Lokev
00050000-55f6-e4fc-e956-e7f5f43305b3	1318	Loški Potok
00050000-55f6-e4fc-60ba-da22533eb2f9	2324	Lovrenc na Dravskem polju
00050000-55f6-e4fc-957c-0101a48320e3	2344	Lovrenc na Pohorju
00050000-55f6-e4fc-7f64-e24f47935b8e	3334	Luče
00050000-55f6-e4fc-3b92-348f143385e6	1225	Lukovica
00050000-55f6-e4fc-8ced-0926f03fbb0f	9202	Mačkovci
00050000-55f6-e4fc-84d8-c3265e665beb	2322	Majšperk
00050000-55f6-e4fc-10ab-fafc0e801213	2321	Makole
00050000-55f6-e4fc-04cc-55e3e83838b7	9243	Mala Nedelja
00050000-55f6-e4fc-0156-72d4050b0a2b	2229	Malečnik
00050000-55f6-e4fc-3088-42e98e5119b9	6273	Marezige
00050000-55f6-e4fc-f12f-1d2adb799d66	2000	Maribor 
00050000-55f6-e4fc-f83e-4e40155aff8d	2001	Maribor - poštni predali
00050000-55f6-e4fc-2dc5-7704cc4d07a2	2206	Marjeta na Dravskem polju
00050000-55f6-e4fc-23c1-7e2be0ef51c3	2281	Markovci
00050000-55f6-e4fc-561b-80ff4a604b26	9221	Martjanci
00050000-55f6-e4fc-4bb4-49622d706315	6242	Materija
00050000-55f6-e4fc-c71e-f5b3eb423b40	4211	Mavčiče
00050000-55f6-e4fc-43e6-f2261676116f	1215	Medvode
00050000-55f6-e4fc-db4b-c21eae0142b2	1234	Mengeš
00050000-55f6-e4fc-3969-4af89a9046ab	8330	Metlika
00050000-55f6-e4fc-6009-91f85dbb1c72	2392	Mežica
00050000-55f6-e4fc-cd5a-efd478fb2112	2204	Miklavž na Dravskem polju
00050000-55f6-e4fc-7b94-6110d6b089f3	2275	Miklavž pri Ormožu
00050000-55f6-e4fc-4401-096514c06374	5291	Miren
00050000-55f6-e4fc-6ee2-d8fa2d5711da	8233	Mirna
00050000-55f6-e4fc-85f0-3c9ea3f8d025	8216	Mirna Peč
00050000-55f6-e4fc-aa43-81d11ab6492d	2382	Mislinja
00050000-55f6-e4fc-210e-2503951867d6	4281	Mojstrana
00050000-55f6-e4fc-fa95-5e8a426663bd	8230	Mokronog
00050000-55f6-e4fc-5a6a-f7e37cdab8e3	1251	Moravče
00050000-55f6-e4fc-6eaa-57d56b496e67	9226	Moravske Toplice
00050000-55f6-e4fc-fcb8-077743994099	5216	Most na Soči
00050000-55f6-e4fc-7cc6-07a906d2e0b6	1221	Motnik
00050000-55f6-e4fc-16f9-1c6e9a698e83	3330	Mozirje
00050000-55f6-e4fc-7ba0-9c22a7d07cc0	9000	Murska Sobota 
00050000-55f6-e4fc-d8a9-9220e8145a75	9001	Murska Sobota - poštni predali
00050000-55f6-e4fc-3f27-3e280f39e527	2366	Muta
00050000-55f6-e4fc-0524-c8c600581c35	4202	Naklo
00050000-55f6-e4fc-11de-59c7bfb36bab	3331	Nazarje
00050000-55f6-e4fc-c5dc-24589c10efe9	1357	Notranje Gorice
00050000-55f6-e4fc-0629-cb093754a76d	3203	Nova Cerkev
00050000-55f6-e4fc-6067-1ea412a65c0f	5000	Nova Gorica 
00050000-55f6-e4fc-dab2-d2118538dab2	5001	Nova Gorica - poštni predali
00050000-55f6-e4fc-7d70-e6fd6895e1be	1385	Nova vas
00050000-55f6-e4fc-46c1-417efedc6237	8000	Novo mesto
00050000-55f6-e4fc-7856-e491f08beb7e	8001	Novo mesto - poštni predali
00050000-55f6-e4fc-c116-53014ae4fdb7	6243	Obrov
00050000-55f6-e4fc-0b2e-d8b3003e8e53	9233	Odranci
00050000-55f6-e4fc-4287-f55294c6fffb	2317	Oplotnica
00050000-55f6-e4fc-517d-e79cdc6ca0cb	2312	Orehova vas
00050000-55f6-e4fc-b76a-49843738ed02	2270	Ormož
00050000-55f6-e4fc-5031-32336f69196c	1316	Ortnek
00050000-55f6-e4fc-1d67-321c11d61b82	1337	Osilnica
00050000-55f6-e4fc-6662-c285484b7c9b	8222	Otočec
00050000-55f6-e4fc-8d17-bbe0d54f627f	2361	Ožbalt
00050000-55f6-e4fc-a40d-ae731962909d	2231	Pernica
00050000-55f6-e4fc-2152-380e9024a0e0	2211	Pesnica pri Mariboru
00050000-55f6-e4fc-cb44-d91429ac55bd	9203	Petrovci
00050000-55f6-e4fc-8e86-8db5e293af82	3301	Petrovče
00050000-55f6-e4fc-3529-8745dd4cf804	6330	Piran/Pirano
00050000-55f6-e4fc-e71d-afaf0b2f8480	8255	Pišece
00050000-55f6-e4fc-27e3-3b3d6a1c951e	6257	Pivka
00050000-55f6-e4fc-ed52-fe2b573b2b61	6232	Planina
00050000-55f6-e4fc-a38a-d8f46dca7bd4	3225	Planina pri Sevnici
00050000-55f6-e4fc-12f5-bbedc6cb4712	6276	Pobegi
00050000-55f6-e4fc-d608-17d1ebdfc5b4	8312	Podbočje
00050000-55f6-e4fc-81d9-c09efecfab51	5243	Podbrdo
00050000-55f6-e4fc-3b03-e3664ff41254	3254	Podčetrtek
00050000-55f6-e4fc-5ead-3b52b9aea259	2273	Podgorci
00050000-55f6-e4fc-e23b-037374607acc	6216	Podgorje
00050000-55f6-e4fc-b0c5-2bf76526fbf6	2381	Podgorje pri Slovenj Gradcu
00050000-55f6-e4fc-62f6-814dabc37029	6244	Podgrad
00050000-55f6-e4fc-2526-ec6495b2100f	1414	Podkum
00050000-55f6-e4fc-feae-de2c1517e3b9	2286	Podlehnik
00050000-55f6-e4fc-5c58-d114955c10ad	5272	Podnanos
00050000-55f6-e4fc-5408-3b5a8573734c	4244	Podnart
00050000-55f6-e4fc-d14c-769e6e02bc28	3241	Podplat
00050000-55f6-e4fc-87f2-97245496a06c	3257	Podsreda
00050000-55f6-e4fc-59fe-4a5a74c66987	2363	Podvelka
00050000-55f6-e4fc-4036-fbd7d4c8ce5c	2208	Pohorje
00050000-55f6-e4fc-56e4-1470ce2ae7b5	2257	Polenšak
00050000-55f6-e4fc-80f3-32fd3df65ef8	1355	Polhov Gradec
00050000-55f6-e4fc-ece0-4af37624d4db	4223	Poljane nad Škofjo Loko
00050000-55f6-e4fc-5ab2-034f8356cfdf	2319	Poljčane
00050000-55f6-e4fc-7316-c3ef74cc95e6	1272	Polšnik
00050000-55f6-e4fc-c028-fd68eb942dbe	3313	Polzela
00050000-55f6-e4fc-fbef-5aed065329ca	3232	Ponikva
00050000-55f6-e4fc-bb36-3bb934120b2b	6320	Portorož/Portorose
00050000-55f6-e4fc-da1e-9aea4bfb1b00	6230	Postojna
00050000-55f6-e4fc-c55a-ca6bbc38afc0	2331	Pragersko
00050000-55f6-e4fc-8706-9e32cd718ada	3312	Prebold
00050000-55f6-e4fc-f1b5-5acc045d69df	4205	Preddvor
00050000-55f6-e4fc-fc51-09cea7d810fc	6255	Prem
00050000-55f6-e4fc-0a1a-ed64519dcb38	1352	Preserje
00050000-55f6-e4fc-d4ab-a68aaf85639d	6258	Prestranek
00050000-55f6-e4fc-c2a2-644b94c5ecd5	2391	Prevalje
00050000-55f6-e4fc-e10d-2449e4733af3	3262	Prevorje
00050000-55f6-e4fc-066e-d656250089b7	1276	Primskovo 
00050000-55f6-e4fc-af09-0700b69b4acb	3253	Pristava pri Mestinju
00050000-55f6-e4fc-d3dc-98376721af65	9207	Prosenjakovci/Partosfalva
00050000-55f6-e4fc-9ef4-909d38da2e93	5297	Prvačina
00050000-55f6-e4fc-c61f-1aaf3e7e3241	2250	Ptuj
00050000-55f6-e4fc-3e51-3da11fe755af	2323	Ptujska Gora
00050000-55f6-e4fc-f8cb-818aa033f55f	9201	Puconci
00050000-55f6-e4fc-770d-5d8e0fe487f0	2327	Rače
00050000-55f6-e4fc-e419-dff40ed48688	1433	Radeče
00050000-55f6-e4fc-d762-475ebec223c3	9252	Radenci
00050000-55f6-e4fc-1c22-d233975fa2b4	2360	Radlje ob Dravi
00050000-55f6-e4fc-1e54-50bff25124bc	1235	Radomlje
00050000-55f6-e4fc-a7ed-bd691cdc9311	4240	Radovljica
00050000-55f6-e4fc-c025-97a628127f08	8274	Raka
00050000-55f6-e4fc-daab-ff468e30d2c4	1381	Rakek
00050000-55f6-e4fc-7f06-a7dd70d8fa02	4283	Rateče - Planica
00050000-55f6-e4fc-0169-0da5a1b312e2	2390	Ravne na Koroškem
00050000-55f6-e4fc-cc01-ca1142d46bb2	9246	Razkrižje
00050000-55f6-e4fc-8229-be2cf2204f0b	3332	Rečica ob Savinji
00050000-55f6-e4fc-1b33-0d70fc811bca	5292	Renče
00050000-55f6-e4fc-9d6d-19c3a94b105a	1310	Ribnica
00050000-55f6-e4fc-b9a7-d532dbebb9ec	2364	Ribnica na Pohorju
00050000-55f6-e4fc-a6e0-fb123758ca5d	3272	Rimske Toplice
00050000-55f6-e4fc-0b04-01a2462a4244	1314	Rob
00050000-55f6-e4fc-d48d-ce5007813a96	5215	Ročinj
00050000-55f6-e4fc-c71c-df15818438bd	3250	Rogaška Slatina
00050000-55f6-e4fc-cdf3-3bd4a0a503e4	9262	Rogašovci
00050000-55f6-e4fc-da89-77b15e9a44d8	3252	Rogatec
00050000-55f6-e4fc-d339-66f7619d17fb	1373	Rovte
00050000-55f6-e4fc-6d51-67295c80b41d	2342	Ruše
00050000-55f6-e4fc-fe16-65648b20fb69	1282	Sava
00050000-55f6-e4fc-0fbd-aa9ebb51d194	6333	Sečovlje/Sicciole
00050000-55f6-e4fc-1a96-a37963eca789	4227	Selca
00050000-55f6-e4fc-b0c0-cdd3a1731a56	2352	Selnica ob Dravi
00050000-55f6-e4fc-9c41-afbca108d0ca	8333	Semič
00050000-55f6-e4fc-87b3-da24081df0e4	8281	Senovo
00050000-55f6-e4fc-65ed-6f28ef79668a	6224	Senožeče
00050000-55f6-e4fc-e316-1f38f06a60db	8290	Sevnica
00050000-55f6-e4fc-85ac-5f1d97328cb9	6210	Sežana
00050000-55f6-e4fc-d8af-1491f141671f	2214	Sladki Vrh
00050000-55f6-e4fc-0f91-f10fa5f0963b	5283	Slap ob Idrijci
00050000-55f6-e4fc-73f4-ecacb4ab219a	2380	Slovenj Gradec
00050000-55f6-e4fc-d179-cd5da3796a62	2310	Slovenska Bistrica
00050000-55f6-e4fc-d064-dc77572563ed	3210	Slovenske Konjice
00050000-55f6-e4fc-e8a2-abe78b9457f4	1216	Smlednik
00050000-55f6-e4fc-c345-f30a924ed0ec	5232	Soča
00050000-55f6-e4fc-a51b-26fc647ba471	1317	Sodražica
00050000-55f6-e4fc-d88d-7510f36cf647	3335	Solčava
00050000-55f6-e4fc-ab09-a5df89bc6746	5250	Solkan
00050000-55f6-e4fc-f6c4-f2e44ac7d9d7	4229	Sorica
00050000-55f6-e4fc-ba2c-38d608687d32	4225	Sovodenj
00050000-55f6-e4fc-d6b3-c41be3ce0fe6	5281	Spodnja Idrija
00050000-55f6-e4fc-e862-07540f2457bf	2241	Spodnji Duplek
00050000-55f6-e4fc-acec-137a67c06757	9245	Spodnji Ivanjci
00050000-55f6-e4fc-350d-31a3944dba63	2277	Središče ob Dravi
00050000-55f6-e4fc-409b-7a001a97687f	4267	Srednja vas v Bohinju
00050000-55f6-e4fc-96e7-47300baebe8f	8256	Sromlje 
00050000-55f6-e4fc-835f-1a9df80a7c9b	5224	Srpenica
00050000-55f6-e4fc-a3ae-896617a58cea	1242	Stahovica
00050000-55f6-e4fc-4a0e-661b39d03f6d	1332	Stara Cerkev
00050000-55f6-e4fc-6dac-303573cb79dd	8342	Stari trg ob Kolpi
00050000-55f6-e4fc-1cac-df7b61c2efb5	1386	Stari trg pri Ložu
00050000-55f6-e4fc-be92-27a58c6090b8	2205	Starše
00050000-55f6-e4fc-8695-f04f372a8cc2	2289	Stoperce
00050000-55f6-e4fc-f6dd-1f8c156fdaa2	8322	Stopiče
00050000-55f6-e4fc-3467-7b09d2e2bea7	3206	Stranice
00050000-55f6-e4fc-b5a3-56785c1cc87a	8351	Straža
00050000-55f6-e4fc-1d18-9a4c82b91a17	1313	Struge
00050000-55f6-e4fc-c57a-fbde9520326d	8293	Studenec
00050000-55f6-e4fc-4c5f-fe1211c8215f	8331	Suhor
00050000-55f6-e4fc-556b-8cf346586c89	2233	Sv. Ana v Slovenskih goricah
00050000-55f6-e4fc-62d8-d299b583e33c	2235	Sv. Trojica v Slovenskih goricah
00050000-55f6-e4fc-9ba9-9fb622932272	2353	Sveti Duh na Ostrem Vrhu
00050000-55f6-e4fc-4b83-0a87dbb8a501	9244	Sveti Jurij ob Ščavnici
00050000-55f6-e4fc-a941-76fbdc6dd662	3264	Sveti Štefan
00050000-55f6-e4fc-7280-8f0583e4e37c	2258	Sveti Tomaž
00050000-55f6-e4fc-2c51-e8602a06c2a0	9204	Šalovci
00050000-55f6-e4fc-96af-d98bb7350127	5261	Šempas
00050000-55f6-e4fc-8263-f24b2f7a4b11	5290	Šempeter pri Gorici
00050000-55f6-e4fc-698b-ae929e2a09d1	3311	Šempeter v Savinjski dolini
00050000-55f6-e4fd-5020-ffbb190d1586	4208	Šenčur
00050000-55f6-e4fd-ea4e-7a559fe70e84	2212	Šentilj v Slovenskih goricah
00050000-55f6-e4fd-62db-575d98c1958b	8297	Šentjanž
00050000-55f6-e4fd-c10a-9cdf1e3eb6b4	2373	Šentjanž pri Dravogradu
00050000-55f6-e4fd-7b10-c6ad3a51e865	8310	Šentjernej
00050000-55f6-e4fd-913e-31d54104a15e	3230	Šentjur
00050000-55f6-e4fd-0ed2-3aebd1032e2c	3271	Šentrupert
00050000-55f6-e4fd-c566-fe63638d549a	8232	Šentrupert
00050000-55f6-e4fd-5ce1-c8c3d4181b86	1296	Šentvid pri Stični
00050000-55f6-e4fd-2702-5848d043dedb	8275	Škocjan
00050000-55f6-e4fd-c857-f175f2191c69	6281	Škofije
00050000-55f6-e4fd-37a1-22e239e90d64	4220	Škofja Loka
00050000-55f6-e4fd-525f-cfe2bd5c66ac	3211	Škofja vas
00050000-55f6-e4fd-dae0-f04ee2ab18ef	1291	Škofljica
00050000-55f6-e4fd-1786-35b2894a8e65	6274	Šmarje
00050000-55f6-e4fd-f7ee-77cd9165b535	1293	Šmarje - Sap
00050000-55f6-e4fd-d2c4-6da4454eadac	3240	Šmarje pri Jelšah
00050000-55f6-e4fd-37e5-44e65c1d8d6c	8220	Šmarješke Toplice
00050000-55f6-e4fd-743d-a78c5432a8c9	2315	Šmartno na Pohorju
00050000-55f6-e4fd-1db9-41a873e80f0e	3341	Šmartno ob Dreti
00050000-55f6-e4fd-8e6d-666d8f40b468	3327	Šmartno ob Paki
00050000-55f6-e4fd-afc8-2408993898d8	1275	Šmartno pri Litiji
00050000-55f6-e4fd-0a6e-a67b2bf6f670	2383	Šmartno pri Slovenj Gradcu
00050000-55f6-e4fd-40a3-4aaf7b4035c4	3201	Šmartno v Rožni dolini
00050000-55f6-e4fd-f93b-62d7a734a443	3325	Šoštanj
00050000-55f6-e4fd-1bcb-e820033a47c0	6222	Štanjel
00050000-55f6-e4fd-4a3c-f23131fd7b49	3220	Štore
00050000-55f6-e4fd-eeb1-43c1a57cc2b2	3304	Tabor
00050000-55f6-e4fd-8e97-1cc173f2a2eb	3221	Teharje
00050000-55f6-e4fd-ac43-88237cf9ae46	9251	Tišina
00050000-55f6-e4fd-c242-ee9d5436dc92	5220	Tolmin
00050000-55f6-e4fd-a15d-5afe47fb66d8	3326	Topolšica
00050000-55f6-e4fd-69ed-07e138cd5584	2371	Trbonje
00050000-55f6-e4fd-8172-1db5f11e6d7a	1420	Trbovlje
00050000-55f6-e4fd-1533-cdf1ded0c177	8231	Trebelno 
00050000-55f6-e4fd-a998-0f2944c8b291	8210	Trebnje
00050000-55f6-e4fd-6d22-c649eb85367d	5252	Trnovo pri Gorici
00050000-55f6-e4fd-403e-f5cea59f69d5	2254	Trnovska vas
00050000-55f6-e4fd-8e17-5fbc341f2101	1222	Trojane
00050000-55f6-e4fd-68e4-2351ee03a106	1236	Trzin
00050000-55f6-e4fd-6a9b-77ec5f2355f6	4290	Tržič
00050000-55f6-e4fd-8ec2-e27054ff13b7	8295	Tržišče
00050000-55f6-e4fd-9a51-927be47fb673	1311	Turjak
00050000-55f6-e4fd-552b-c899c44249b3	9224	Turnišče
00050000-55f6-e4fd-1444-0f872abf80dd	8323	Uršna sela
00050000-55f6-e4fd-679f-13f1fab01654	1252	Vače
00050000-55f6-e4fd-1a5b-36ee9f6c9f31	3320	Velenje 
00050000-55f6-e4fd-67bb-32ba586eaa03	3322	Velenje - poštni predali
00050000-55f6-e4fd-7040-cf6ab42a4deb	8212	Velika Loka
00050000-55f6-e4fd-76ca-46ad7b496276	2274	Velika Nedelja
00050000-55f6-e4fd-f26d-ac714cf82c33	9225	Velika Polana
00050000-55f6-e4fd-86ce-ae32d1a6df76	1315	Velike Lašče
00050000-55f6-e4fd-148d-9406e2401a4c	8213	Veliki Gaber
00050000-55f6-e4fd-c49d-2ecd072d86cb	9241	Veržej
00050000-55f6-e4fd-9645-d8cc21b612fc	1312	Videm - Dobrepolje
00050000-55f6-e4fd-c511-c82136f15007	2284	Videm pri Ptuju
00050000-55f6-e4fd-a4dc-202166cf69e4	8344	Vinica
00050000-55f6-e4fd-cbbd-1e5c7c7b033f	5271	Vipava
00050000-55f6-e4fd-162c-e20dba2f6c62	4212	Visoko
00050000-55f6-e4fd-5928-5380bb983d0e	1294	Višnja Gora
00050000-55f6-e4fd-874b-1575eba2999f	3205	Vitanje
00050000-55f6-e4fd-d893-ce97174f61cf	2255	Vitomarci
00050000-55f6-e4fd-f0d5-043fbd3e2dcd	1217	Vodice
00050000-55f6-e4fd-efa7-44f48bc50180	3212	Vojnik\t
00050000-55f6-e4fd-622e-43b7c0244094	5293	Volčja Draga
00050000-55f6-e4fd-5be0-e6ad5adcacda	2232	Voličina
00050000-55f6-e4fd-ed29-4baef86fdfb8	3305	Vransko
00050000-55f6-e4fd-8e3a-ca48f0db9834	6217	Vremski Britof
00050000-55f6-e4fd-d748-a01c57aeae1a	1360	Vrhnika
00050000-55f6-e4fd-81d3-57cb9360f2d0	2365	Vuhred
00050000-55f6-e4fd-8dcf-7e79150ecddc	2367	Vuzenica
00050000-55f6-e4fd-75b9-98f0c463b40f	8292	Zabukovje 
00050000-55f6-e4fd-99e0-fdde659cb0ea	1410	Zagorje ob Savi
00050000-55f6-e4fd-7996-48e9547d757b	1303	Zagradec
00050000-55f6-e4fd-2c88-aa6a8e2e5364	2283	Zavrč
00050000-55f6-e4fd-348d-e6817bb68f83	8272	Zdole 
00050000-55f6-e4fd-0bdb-465cd3747c50	4201	Zgornja Besnica
00050000-55f6-e4fd-c5a4-32e3860c413d	2242	Zgornja Korena
00050000-55f6-e4fd-2d1b-fabc590d15d9	2201	Zgornja Kungota
00050000-55f6-e4fd-e347-93fbbb749b7d	2316	Zgornja Ložnica
00050000-55f6-e4fd-44e1-55dc926a3adf	2314	Zgornja Polskava
00050000-55f6-e4fd-bf1c-673d9a9a69a4	2213	Zgornja Velka
00050000-55f6-e4fd-7481-aa2a11b5a90c	4247	Zgornje Gorje
00050000-55f6-e4fd-cd9e-4f613c1b3df0	4206	Zgornje Jezersko
00050000-55f6-e4fd-a5e6-040f0505ce8e	2285	Zgornji Leskovec
00050000-55f6-e4fd-e4f5-29c8d01aa254	1432	Zidani Most
00050000-55f6-e4fd-9a1e-b4e109a657bb	3214	Zreče
00050000-55f6-e4fd-8962-9ee8740d5b09	4209	Žabnica
00050000-55f6-e4fd-f090-abfa133c7a68	3310	Žalec
00050000-55f6-e4fd-08c4-57cc75950cc2	4228	Železniki
00050000-55f6-e4fd-5625-ec1cb6d505d9	2287	Žetale
00050000-55f6-e4fd-dbd7-aefa9be8ab6d	4226	Žiri
00050000-55f6-e4fd-d08c-749b784f5d6f	4274	Žirovnica
00050000-55f6-e4fd-05ca-c50a7f8ab401	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 19396716)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 19396348)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 19396158)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f6-e4ff-1f1f-9fc6a9c34bd8	00080000-55f6-e4fe-630b-c5e970bfd506	\N	00040000-55f6-e4fd-5ab5-4613e2389a87	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f6-e4ff-7665-e354e5c6dd66	00080000-55f6-e4fe-630b-c5e970bfd506	\N	00040000-55f6-e4fd-5ab5-4613e2389a87	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f6-e4ff-b2d9-b9cd39c5922f	00080000-55f6-e4fe-7711-101f180e458e	\N	00040000-55f6-e4fd-5ab5-4613e2389a87	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 19396236)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19396360)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19396730)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19396740)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f6-e4ff-0e1b-151ea72f1979	00080000-55f6-e4fe-be5f-a846aeb9ef71	0987	AK
00190000-55f6-e4ff-69d4-37ba714e4399	00080000-55f6-e4fe-7711-101f180e458e	0989	AK
00190000-55f6-e4ff-0833-47297f760125	00080000-55f6-e4fe-3db1-ef90a378f752	0986	AK
00190000-55f6-e4ff-33cd-0bfc95c2cb17	00080000-55f6-e4fe-a64e-bee4192db7db	0984	AK
00190000-55f6-e4ff-5579-123fc9ad2c06	00080000-55f6-e4fe-c29c-f718ac16b922	0983	AK
00190000-55f6-e4ff-8b04-fc891f7f087c	00080000-55f6-e4fe-95b7-8674c43bb47e	0982	AK
00190000-55f6-e500-2b42-87c3dafd957a	00080000-55f6-e500-03a7-0d314ab26925	1001	AK
\.


--
-- TOC entry 2989 (class 0 OID 19396673)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f6-e4ff-aa4c-316db5c2e0f4	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2993 (class 0 OID 19396748)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 19396389)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f6-e4fe-d957-f3f0fb08b19d	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f6-e4fe-0e96-7acbbe8b533b	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f6-e4fe-0c18-3fa39834c17a	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f6-e4fe-f6ee-7b53cce0e289	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f6-e4fe-8237-ae95daf96034	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f6-e4fe-3c83-6b7f87f66b2b	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f6-e4fe-a786-21703b3ace3c	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2962 (class 0 OID 19396333)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19396323)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19396526)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19396463)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 19396031)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f6-e500-03a7-0d314ab26925	00010000-55f6-e4fd-d575-515c80d81a1d	2015-09-14 17:17:20	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f6-e500-b0ff-397d59003770	00010000-55f6-e4fd-d575-515c80d81a1d	2015-09-14 17:17:20	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f6-e500-2b42-87c3dafd957a	00010000-55f6-e4fd-d575-515c80d81a1d	2015-09-14 17:17:20	INS	a:0:{}
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2971 (class 0 OID 19396402)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 19396069)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f6-e4fd-d52c-0c228db09606	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f6-e4fd-d0d2-972262fb6ea9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f6-e4fd-1a08-df72c2e14fae	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f6-e4fd-e3be-e66fd02114dc	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f6-e4fd-6f2a-82c5a8669060	planer	Planer dogodkov v koledarju	t
00020000-55f6-e4fd-50de-5df4b860c540	kadrovska	Kadrovska služba	t
00020000-55f6-e4fd-d9f1-4de35bf48177	arhivar	Ažuriranje arhivalij	t
00020000-55f6-e4fd-8450-4257d49bfddb	igralec	Igralec	t
00020000-55f6-e4fd-2d26-13fa436ff45c	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f6-e4ff-9269-8e11fe04659d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2938 (class 0 OID 19396053)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f6-e4fd-21f6-ff11120b3022	00020000-55f6-e4fd-1a08-df72c2e14fae
00010000-55f6-e4fd-d575-515c80d81a1d	00020000-55f6-e4fd-1a08-df72c2e14fae
00010000-55f6-e4ff-8b0a-29fb3fd7e77f	00020000-55f6-e4ff-9269-8e11fe04659d
\.


--
-- TOC entry 2973 (class 0 OID 19396416)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19396354)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 19396300)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 19396018)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f6-e4fd-f5b3-e94c6b2bfdf1	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f6-e4fd-ee40-93ee95667eab	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f6-e4fd-5191-8687a8e323e6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f6-e4fd-c9c7-16c29f6eb171	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f6-e4fd-aa0e-34ca7a2a1cc1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2933 (class 0 OID 19396010)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f6-e4fd-dd87-d0d2f35e9590	00230000-55f6-e4fd-c9c7-16c29f6eb171	popa
00240000-55f6-e4fd-06aa-30ab51d120ce	00230000-55f6-e4fd-c9c7-16c29f6eb171	oseba
00240000-55f6-e4fd-104a-bb1c8de854ae	00230000-55f6-e4fd-c9c7-16c29f6eb171	sezona
00240000-55f6-e4fd-e86b-66c662d1bcaf	00230000-55f6-e4fd-ee40-93ee95667eab	prostor
00240000-55f6-e4fd-b7db-5039f44efd3a	00230000-55f6-e4fd-c9c7-16c29f6eb171	besedilo
00240000-55f6-e4fd-e3ef-16055cf01bba	00230000-55f6-e4fd-c9c7-16c29f6eb171	uprizoritev
00240000-55f6-e4fd-2e9d-eef951e15b2a	00230000-55f6-e4fd-c9c7-16c29f6eb171	funkcija
00240000-55f6-e4fd-8245-1001b0f987f9	00230000-55f6-e4fd-c9c7-16c29f6eb171	tipfunkcije
00240000-55f6-e4fd-d0ff-ece383cb020a	00230000-55f6-e4fd-c9c7-16c29f6eb171	alternacija
00240000-55f6-e4fd-ce9a-a7ce19aebfdb	00230000-55f6-e4fd-f5b3-e94c6b2bfdf1	pogodba
00240000-55f6-e4fd-c0eb-0688d97e675a	00230000-55f6-e4fd-c9c7-16c29f6eb171	zaposlitev
00240000-55f6-e4fd-448b-7897348420be	00230000-55f6-e4fd-c9c7-16c29f6eb171	zvrstuprizoritve
00240000-55f6-e4fd-65ad-3623f745dcf9	00230000-55f6-e4fd-f5b3-e94c6b2bfdf1	programdela
00240000-55f6-e4fd-524c-1c05a4dd4eeb	00230000-55f6-e4fd-c9c7-16c29f6eb171	zapis
\.


--
-- TOC entry 2932 (class 0 OID 19396005)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
7b609a5d-a36d-413e-94de-08c21eacc346	00240000-55f6-e4fd-dd87-d0d2f35e9590	0	1001
\.


--
-- TOC entry 2978 (class 0 OID 19396473)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f6-e4ff-fccb-1191cde9a0df	000e0000-55f6-e4ff-bf98-169bdc4d8654	00080000-55f6-e4fe-630b-c5e970bfd506	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f6-e4fd-8276-a3a1d6efbf41
00270000-55f6-e4ff-217f-c071ed9a00f9	000e0000-55f6-e4ff-bf98-169bdc4d8654	00080000-55f6-e4fe-630b-c5e970bfd506	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f6-e4fd-8276-a3a1d6efbf41
\.


--
-- TOC entry 2945 (class 0 OID 19396131)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 19396310)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f6-e4ff-4792-9562a9f40a66	00180000-55f6-e4ff-b012-dac73c82898d	000c0000-55f6-e4ff-18c4-94ceeb11ece2	00090000-55f6-e4ff-3dd1-d49bb1c09d93	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-e4ff-af84-ce7d94688b5c	00180000-55f6-e4ff-b012-dac73c82898d	000c0000-55f6-e4ff-2580-e49d34420b02	00090000-55f6-e4ff-d1d6-f9070c45d1ce	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-e4ff-fe04-8c4567e1257e	00180000-55f6-e4ff-b012-dac73c82898d	000c0000-55f6-e4ff-36de-2ed1b6f24729	00090000-55f6-e4ff-a8a8-108693e11043	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-e4ff-eaa1-62404dfdcd01	00180000-55f6-e4ff-b012-dac73c82898d	000c0000-55f6-e4ff-5d5b-5a29131251df	00090000-55f6-e4ff-66cb-e1d8bbdc2033	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-e4ff-5b61-a8547f25fadc	00180000-55f6-e4ff-b012-dac73c82898d	000c0000-55f6-e4ff-bc13-85367cf16cd5	00090000-55f6-e4ff-8f37-1e336a9b8737	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-e4ff-2a46-df2e1c8e9290	00180000-55f6-e4ff-4398-4599d853d123	\N	00090000-55f6-e4ff-8f37-1e336a9b8737	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2981 (class 0 OID 19396514)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f6-e4fd-4eb6-0b8d3d26c965	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f6-e4fd-0659-d947a5455409	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f6-e4fd-cb18-4c5d32fd066e	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f6-e4fd-aee0-c23f21724eb8	04	Režija	Režija	Režija	umetnik
000f0000-55f6-e4fd-1edb-8df75849fb9d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f6-e4fd-3bdc-ae55054aa58d	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f6-e4fd-a5c6-03cbf4a86da0	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f6-e4fd-f83a-0b73d877e6ef	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f6-e4fd-79b8-06e32896163d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f6-e4fd-9461-19ad10d41370	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f6-e4fd-d3d8-6551c4edfa2b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f6-e4fd-a6d0-a738458b7193	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f6-e4fd-f997-d4557c2dc1c5	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f6-e4fd-c2e8-5322f312f4c8	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f6-e4fd-abd9-92587f0d1648	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f6-e4fd-0334-dd4e12174773	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f6-e4fd-6018-956d07ce3415	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f6-e4fd-b77e-8005d5bfdf7a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2994 (class 0 OID 19396758)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f6-e4fd-43cb-a7e75049775d	01	Velika predstava	f	1.00	1.00
002b0000-55f6-e4fd-8df3-19c2085f3617	02	Mala predstava	f	0.50	0.50
002b0000-55f6-e4fd-cb9a-4ca53eb652e6	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f6-e4fd-51b7-6a776a6e6578	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f6-e4fd-f115-91ff8db79c07	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2950 (class 0 OID 19396193)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 19396040)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f6-e4fd-d575-515c80d81a1d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO16TVcTrU3UAzC9Givy71mmREuFHRUMC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f6-e4ff-cecc-0a4bf650a15c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f6-e4ff-23ce-6340dde16cd9	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f6-e4ff-36f1-9109a8a6828b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f6-e4ff-7600-cdcb7eecdbe2	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f6-e4ff-a550-8c492657332b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f6-e4ff-0378-247764f4b30b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f6-e4ff-3fd0-6e990ba9777b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f6-e4ff-9c6c-a01756799998	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f6-e4ff-6cb6-cde3a23ed46e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f6-e4ff-8b0a-29fb3fd7e77f	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f6-e4fd-21f6-ff11120b3022	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2985 (class 0 OID 19396563)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f6-e4ff-79e8-c8bc68dfec0d	00160000-55f6-e4fe-0cce-d9aea1a0acc1	\N	00140000-55f6-e4fd-c5bf-806f5d6475ea	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f6-e4fe-8237-ae95daf96034
000e0000-55f6-e4ff-bf98-169bdc4d8654	00160000-55f6-e4fe-78cf-66eabf354901	\N	00140000-55f6-e4fd-ed24-841a41ca3cc4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f6-e4fe-3c83-6b7f87f66b2b
000e0000-55f6-e4ff-c0a8-c4bfd9b54802	\N	\N	00140000-55f6-e4fd-ed24-841a41ca3cc4	00190000-55f6-e4ff-0e1b-151ea72f1979	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f6-e4fe-8237-ae95daf96034
000e0000-55f6-e4ff-3bde-e760bb0cea26	\N	\N	00140000-55f6-e4fd-ed24-841a41ca3cc4	00190000-55f6-e4ff-0e1b-151ea72f1979	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f6-e4fe-8237-ae95daf96034
000e0000-55f6-e4ff-5534-49589c62af54	\N	\N	00140000-55f6-e4fd-ed24-841a41ca3cc4	00190000-55f6-e4ff-0e1b-151ea72f1979	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f6-e4fe-d957-f3f0fb08b19d
000e0000-55f6-e4ff-7903-5f0c00640b25	\N	\N	00140000-55f6-e4fd-ed24-841a41ca3cc4	00190000-55f6-e4ff-0e1b-151ea72f1979	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f6-e4fe-d957-f3f0fb08b19d
\.


--
-- TOC entry 2955 (class 0 OID 19396254)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f6-e4ff-b5a2-bf7a044ba0c0	000e0000-55f6-e4ff-bf98-169bdc4d8654	\N	1	
00200000-55f6-e4ff-5b38-6ca041596e84	000e0000-55f6-e4ff-bf98-169bdc4d8654	\N	2	
00200000-55f6-e4ff-6b2d-d271ad54c149	000e0000-55f6-e4ff-bf98-169bdc4d8654	\N	3	
00200000-55f6-e4ff-28ca-e6333e75d10a	000e0000-55f6-e4ff-bf98-169bdc4d8654	\N	4	
00200000-55f6-e4ff-8a23-76f9dcf34d0d	000e0000-55f6-e4ff-bf98-169bdc4d8654	\N	5	
\.


--
-- TOC entry 2969 (class 0 OID 19396381)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19396487)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f6-e4fd-9c08-ab6afde97207	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f6-e4fd-0b85-7fe6f0b224fc	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f6-e4fd-17f3-30da510f8ee8	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f6-e4fd-11dc-dbef85fe6a55	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f6-e4fd-11e7-d575237ab719	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f6-e4fd-8160-5dd5967dacf4	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f6-e4fd-a94d-758c39c9d1d1	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f6-e4fd-5c2c-afb4f0ca6ef9	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f6-e4fd-8276-a3a1d6efbf41	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f6-e4fd-c242-2a09e66e1566	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f6-e4fd-2abc-b8a9e4b42fe0	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f6-e4fd-bec9-e70ca845e1a8	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f6-e4fd-adbb-6f63cbd5651a	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f6-e4fd-29cc-c66b91c7aeff	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f6-e4fd-5759-452a9310ab63	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f6-e4fd-44da-ae43add4763f	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f6-e4fd-0cf0-b83c5614b70f	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f6-e4fd-ceda-94b87645e39f	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f6-e4fd-0eed-096f8bcfb629	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f6-e4fd-5227-b1fc48ffa641	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f6-e4fd-f62f-7ea515ffa4bb	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f6-e4fd-5e03-e9845e481235	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f6-e4fd-2503-c26d002ed241	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f6-e4fd-9c04-b08c78ab98a0	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f6-e4fd-da0f-c4db60fbe6f2	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f6-e4fd-4b59-b7bb72767bd2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f6-e4fd-e4e0-5c82dc847f6e	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f6-e4fd-2d3c-fb71b8d6484e	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2997 (class 0 OID 19396804)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 19396776)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 19396816)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 19396453)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f6-e4ff-ed3a-97e1f82f43dd	00090000-55f6-e4ff-d1d6-f9070c45d1ce	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-e4ff-ac50-a835a2bf7ddd	00090000-55f6-e4ff-a8a8-108693e11043	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-e4ff-6adf-c32fb2d25d11	00090000-55f6-e4ff-c05e-67a84ca4ff39	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-e4ff-0261-ea2a5025635c	00090000-55f6-e4ff-346e-84d6ce080893	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-e4ff-c9c4-a889c66f10c8	00090000-55f6-e4ff-3dd1-d49bb1c09d93	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-e4ff-f86b-8d952f1bedf7	00090000-55f6-e4ff-9b63-e858bdacd58b	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2957 (class 0 OID 19396290)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19396553)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f6-e4fd-c5bf-806f5d6475ea	01	Drama	drama (SURS 01)
00140000-55f6-e4fd-e1da-6ad724d2da9b	02	Opera	opera (SURS 02)
00140000-55f6-e4fd-58a3-7af64baaedac	03	Balet	balet (SURS 03)
00140000-55f6-e4fd-a937-037847eb84b0	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f6-e4fd-36d7-277c99d03aaa	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f6-e4fd-ed24-841a41ca3cc4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f6-e4fd-1667-2f882e03b8f6	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2975 (class 0 OID 19396443)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 19396094)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 19396612)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 19396602)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 19396512)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 19396856)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 19396279)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 19396299)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 19396774)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19396219)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 19396667)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 19396439)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 19396252)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 19396233)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 19396346)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 19396833)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 19396840)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 19396864)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 19396373)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 19396191)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 19396103)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 19396127)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 19396083)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 19396068)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 19396379)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 19396415)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 19396548)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19396155)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19396179)
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
-- TOC entry 2679 (class 2606 OID 19396728)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 19396352)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 19396169)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19396240)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 19396364)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 19396737)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 19396745)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 19396715)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 19396756)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 19396397)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 19396337)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 19396328)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 19396536)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 19396470)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 19396039)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 19396406)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 19396057)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 19396077)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 19396424)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 19396359)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 19396308)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 19396027)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19396015)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 19396009)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 19396483)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 19396136)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 19396319)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 19396523)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 19396768)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 19396204)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 19396052)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 19396581)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 19396262)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 19396387)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 19396495)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 19396814)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 19396798)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 19396822)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 19396461)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 19396294)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 19396561)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 19396451)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 19396288)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 19396289)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 19396287)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 19396286)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 19396285)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2624 (class 1259 OID 19396484)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 19396485)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 19396486)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 19396835)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 19396834)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 19396157)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 19396380)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 19396802)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 19396801)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 19396803)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 19396800)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 19396799)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 19396366)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 19396365)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 19396263)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 19396440)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19396442)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 19396441)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 19396235)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 19396234)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 19396757)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 19396550)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 19396551)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 19396552)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 19396823)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 19396586)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 19396583)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 19396587)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 19396585)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 19396584)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 19396206)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 19396205)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 19396130)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 19396407)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 19396084)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 19396085)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 19396427)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 19396426)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 19396425)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 19396241)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 19396242)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 19396017)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 19396332)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 19396330)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 19396329)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 19396331)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 19396058)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 19396059)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 19396388)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 19396857)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 19396865)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 19396866)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 19396353)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 19396471)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 19396472)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 19396672)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 19396671)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 19396668)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 19396669)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 19396670)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 19396171)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 19396170)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 19396172)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 19396401)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 19396400)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 19396738)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 19396739)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 19396616)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 19396617)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 19396614)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 19396615)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 19396462)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 19396341)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 19396340)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 19396338)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 19396339)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 19396604)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 19396603)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 19396253)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 19396729)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 19396775)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 19396841)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 19396842)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 19396105)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 19396104)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 19396137)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19396138)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 19396322)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 19396321)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 19396320)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 19396281)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2545 (class 1259 OID 19396282)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2546 (class 1259 OID 19396280)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2547 (class 1259 OID 19396284)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2548 (class 1259 OID 19396283)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 19396156)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 19396220)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19396222)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 19396221)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 19396223)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 19396347)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 19396549)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 19396582)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 19396524)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19396525)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 19396128)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 19396129)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 19396452)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 19396028)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19396192)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 19396016)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2597 (class 1259 OID 19396399)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 19396398)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 19396613)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 19396180)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 19396562)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 19396815)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 19396746)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 19396747)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 19396513)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 19396309)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 19396078)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 19396987)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 19396992)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 19397012)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 19396982)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 19397002)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 19397007)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 19396997)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2785 (class 2606 OID 19397162)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2784 (class 2606 OID 19397167)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2783 (class 2606 OID 19397172)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 19397337)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2818 (class 2606 OID 19397332)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 19396922)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 19397092)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2812 (class 2606 OID 19397317)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 19397312)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 19397322)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 19397307)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2815 (class 2606 OID 19397302)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2767 (class 2606 OID 19397087)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 19397082)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 19396977)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 19397132)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 19397142)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 19397137)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 19396957)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 19396952)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 19397072)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 19397292)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 19397177)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 19397182)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 19397187)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2816 (class 2606 OID 19397327)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2790 (class 2606 OID 19397207)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2793 (class 2606 OID 19397192)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2789 (class 2606 OID 19397212)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2791 (class 2606 OID 19397202)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2792 (class 2606 OID 19397197)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 19396947)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 19396942)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 19396907)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 19396902)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 19397112)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 19396882)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 19396887)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2774 (class 2606 OID 19397127)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 19397122)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 19397117)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 19396962)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 19396967)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 19396867)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2757 (class 2606 OID 19397047)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2759 (class 2606 OID 19397037)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2760 (class 2606 OID 19397032)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2758 (class 2606 OID 19397042)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 19396872)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 19396877)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 19397097)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2821 (class 2606 OID 19397352)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 19397357)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2822 (class 2606 OID 19397362)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 19397077)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2782 (class 2606 OID 19397152)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2781 (class 2606 OID 19397157)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 19397267)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 19397262)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 19397247)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 19397252)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2802 (class 2606 OID 19397257)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 19396932)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 19396927)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 19396937)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 19397107)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2772 (class 2606 OID 19397102)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2807 (class 2606 OID 19397277)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2806 (class 2606 OID 19397282)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2797 (class 2606 OID 19397237)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 19397242)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2799 (class 2606 OID 19397227)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2798 (class 2606 OID 19397232)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 19397147)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 19397067)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2762 (class 2606 OID 19397062)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 19397052)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2763 (class 2606 OID 19397057)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 19397222)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2795 (class 2606 OID 19397217)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 19396972)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 19397272)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2808 (class 2606 OID 19397287)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 19397297)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 19397342)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 19397347)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 19396897)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 19396892)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 19396912)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 19396917)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 19397027)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 19397022)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 19397017)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-14 17:17:22 CEST

--
-- PostgreSQL database dump complete
--

