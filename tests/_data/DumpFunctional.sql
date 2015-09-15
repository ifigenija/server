--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-15 15:23:49 CEST

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
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 242
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 19602086)
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
-- TOC entry 226 (class 1259 OID 19602605)
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
-- TOC entry 225 (class 1259 OID 19602588)
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
-- TOC entry 219 (class 1259 OID 19602496)
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
-- TOC entry 240 (class 1259 OID 19602844)
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
-- TOC entry 195 (class 1259 OID 19602264)
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
-- TOC entry 197 (class 1259 OID 19602295)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19602770)
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
-- TOC entry 190 (class 1259 OID 19602207)
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
-- TOC entry 227 (class 1259 OID 19602618)
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
-- TOC entry 213 (class 1259 OID 19602428)
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
-- TOC entry 193 (class 1259 OID 19602243)
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
-- TOC entry 191 (class 1259 OID 19602224)
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
-- TOC entry 202 (class 1259 OID 19602342)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19602825)
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
-- TOC entry 239 (class 1259 OID 19602837)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19602859)
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
-- TOC entry 206 (class 1259 OID 19602367)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19602181)
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
-- TOC entry 182 (class 1259 OID 19602095)
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
-- TOC entry 183 (class 1259 OID 19602106)
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
-- TOC entry 178 (class 1259 OID 19602060)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19602079)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19602374)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19602408)
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
-- TOC entry 222 (class 1259 OID 19602537)
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
-- TOC entry 185 (class 1259 OID 19602139)
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
-- TOC entry 187 (class 1259 OID 19602173)
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
-- TOC entry 229 (class 1259 OID 19602716)
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
-- TOC entry 203 (class 1259 OID 19602348)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19602158)
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
-- TOC entry 192 (class 1259 OID 19602236)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 19602360)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19602730)
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
-- TOC entry 231 (class 1259 OID 19602740)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19602673)
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
-- TOC entry 232 (class 1259 OID 19602748)
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
-- TOC entry 209 (class 1259 OID 19602389)
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
-- TOC entry 201 (class 1259 OID 19602333)
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
-- TOC entry 200 (class 1259 OID 19602323)
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
-- TOC entry 221 (class 1259 OID 19602526)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19602463)
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
-- TOC entry 175 (class 1259 OID 19602031)
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
-- TOC entry 174 (class 1259 OID 19602029)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 19602402)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19602069)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19602053)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19602416)
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
-- TOC entry 204 (class 1259 OID 19602354)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19602300)
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
-- TOC entry 173 (class 1259 OID 19602018)
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
-- TOC entry 172 (class 1259 OID 19602010)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19602005)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19602473)
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
-- TOC entry 184 (class 1259 OID 19602131)
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
-- TOC entry 199 (class 1259 OID 19602310)
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
-- TOC entry 220 (class 1259 OID 19602514)
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
-- TOC entry 233 (class 1259 OID 19602758)
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
-- TOC entry 189 (class 1259 OID 19602193)
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
-- TOC entry 176 (class 1259 OID 19602040)
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
-- TOC entry 224 (class 1259 OID 19602563)
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
-- TOC entry 194 (class 1259 OID 19602254)
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
-- TOC entry 208 (class 1259 OID 19602381)
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
-- TOC entry 218 (class 1259 OID 19602487)
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
-- TOC entry 236 (class 1259 OID 19602805)
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
-- TOC entry 235 (class 1259 OID 19602777)
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
-- TOC entry 237 (class 1259 OID 19602817)
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
-- TOC entry 215 (class 1259 OID 19602453)
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
-- TOC entry 196 (class 1259 OID 19602290)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19602553)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19602443)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 19602034)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2943 (class 0 OID 19602086)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 19602605)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f8-1be3-4c59-ae02391aec74	000d0000-55f8-1be3-588a-bb2477a0d14b	\N	00090000-55f8-1be3-d6c7-3190d648283c	000b0000-55f8-1be3-dbbb-7b606a88db18	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f8-1be3-1a4d-759576c1b1c2	000d0000-55f8-1be3-25bd-f54d204894bd	00100000-55f8-1be3-40c0-c349488bf6f1	00090000-55f8-1be3-3448-aa7f1b4bca5c	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f8-1be3-bb21-46bffd8f9314	000d0000-55f8-1be3-d9cc-5be6701d190e	00100000-55f8-1be3-ecfb-dfa7c0496409	00090000-55f8-1be3-a02d-011761e9dec2	\N	0003	t	\N	2015-09-15	\N	2	t	\N	f	f
000c0000-55f8-1be3-dd72-0cfc8455b604	000d0000-55f8-1be3-5de3-784efda9e04a	\N	00090000-55f8-1be3-592b-92bd316e97d6	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f8-1be3-1fd9-b69705ecb8a8	000d0000-55f8-1be3-3f9e-280ab4b4d984	\N	00090000-55f8-1be3-4e5b-622b9a8f37b5	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f8-1be3-1b2e-52e2dfa69832	000d0000-55f8-1be3-e8e5-55f8c14897e3	\N	00090000-55f8-1be3-7b03-4f194f8ee82d	000b0000-55f8-1be3-c6c8-8da34d37681d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f8-1be3-7690-83decfcaaecf	000d0000-55f8-1be3-901f-2df35efe2f60	00100000-55f8-1be3-21f6-7241a238a06e	00090000-55f8-1be3-3ab4-e8b569128ad9	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f8-1be3-ee28-8c65b2502c16	000d0000-55f8-1be3-3276-6bcf43074d4f	\N	00090000-55f8-1be3-fadc-7155d6f29108	000b0000-55f8-1be3-0dbf-d7f34a2ce7a9	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f8-1be4-e281-3992eca89f13	000d0000-55f8-1be3-901f-2df35efe2f60	00100000-55f8-1be3-3168-519c94b4d0f6	00090000-55f8-1be3-13f4-170465d150e3	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f8-1be4-8518-016c07915c44	000d0000-55f8-1be3-901f-2df35efe2f60	00100000-55f8-1be3-3d21-05afd185cfa4	00090000-55f8-1be3-0dc9-6b7b065d28d6	\N	0010	t	\N	2015-09-15	\N	16	f	\N	f	t
000c0000-55f8-1be4-693e-83fdcfa84ce8	000d0000-55f8-1be3-901f-2df35efe2f60	00100000-55f8-1be3-88b1-cdaf0c211717	00090000-55f8-1be3-5baf-f6dcc0dc0e6e	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f8-1be4-c1cb-3b948e13f51e	000d0000-55f8-1be3-091d-c865795c76a9	\N	00090000-55f8-1be3-3448-aa7f1b4bca5c	000b0000-55f8-1be3-d059-b07db7b57f64	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2987 (class 0 OID 19602588)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 19602496)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f8-1be3-c77a-9a4bfdb4bf27	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f8-1be3-50c0-b54ec7a77e4e	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f8-1be3-dcd2-405151cc46c6	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3002 (class 0 OID 19602844)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 19602264)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f8-1be3-942d-6785259aace1	\N	\N	00200000-55f8-1be3-109f-fc276b4b4bdc	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f8-1be3-155a-c731faa9c7d4	\N	\N	00200000-55f8-1be3-f8e0-3a6996232693	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f8-1be3-7305-0d9bb74b2c53	\N	\N	00200000-55f8-1be3-ae9c-529dd0f0706d	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f8-1be3-e144-42d0cd248af4	\N	\N	00200000-55f8-1be3-06e3-a36909ce8b43	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f8-1be3-491e-cf90b950059b	\N	\N	00200000-55f8-1be3-98c5-16dfad8d3f81	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2959 (class 0 OID 19602295)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 19602770)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 19602207)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f8-1be1-72d1-961de9fad3c6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f8-1be1-c3a8-81ab005e6764	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f8-1be1-d472-38c8da9df06e	AL	ALB	008	Albania 	Albanija	\N
00040000-55f8-1be1-208a-3bc78186b36f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f8-1be1-0ab9-924e00d7c0e7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f8-1be1-bf68-68c0fb5de691	AD	AND	020	Andorra 	Andora	\N
00040000-55f8-1be1-dee1-9ae3c8d3b9f1	AO	AGO	024	Angola 	Angola	\N
00040000-55f8-1be1-b06d-910e38564713	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f8-1be1-ddf9-2e4248ddaf35	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f8-1be1-611d-82662e1df54d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f8-1be1-86b8-e7636538a244	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f8-1be1-3f07-47b1a22c95cd	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f8-1be1-f341-beeedcdff8ec	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f8-1be1-2580-fad6a1ab332b	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f8-1be1-3ab8-661cc86ae94a	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f8-1be1-8e9c-eaae55dd9923	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f8-1be1-1351-bcf388584e39	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f8-1be1-fb2e-6f123b99a319	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f8-1be1-b185-a5e9b8ead06f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f8-1be1-ff04-fefd165797c1	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f8-1be1-4eed-f099a972ecad	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f8-1be1-9be5-6020cc5dde2d	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f8-1be1-47cd-f430c34f508d	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f8-1be1-f594-ddbce9154948	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f8-1be1-4978-956e2e009697	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f8-1be1-91b8-c07165434c56	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f8-1be1-73fe-fb59aa63bdc6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f8-1be1-9362-6687864c4bdb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f8-1be1-8d13-f5e5c3b961ec	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f8-1be1-c9ee-b2bafe274bc8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f8-1be1-7473-b53cd39cd861	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f8-1be1-0f6b-5be86459278f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f8-1be1-f721-1d3d5f9aba9e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f8-1be1-32c8-103e2f5bc694	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f8-1be1-3429-1f1e873b5fec	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f8-1be1-7a6f-0031d2cce440	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f8-1be1-47c1-0a98f33483b8	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f8-1be1-fcb4-30746ea37d76	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f8-1be1-b4a6-601e324908c5	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f8-1be1-8e25-3751d0fc5886	CA	CAN	124	Canada 	Kanada	\N
00040000-55f8-1be1-02b8-e4c3ee31437f	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f8-1be1-f5e6-5741b3aa551e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f8-1be1-de05-e14f9a1ada3b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f8-1be1-83fb-2cf20941bfea	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f8-1be1-ca30-aea82e58c007	CL	CHL	152	Chile 	Čile	\N
00040000-55f8-1be1-1ef6-9ed2f990f6b7	CN	CHN	156	China 	Kitajska	\N
00040000-55f8-1be1-72e6-122e077f1f94	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f8-1be1-5d06-326ae41712ab	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f8-1be1-9f43-7abf064c8bf5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f8-1be1-a89c-71aa497c8a63	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f8-1be1-bec0-eb9744f8590f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f8-1be1-42f1-3a780a851924	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f8-1be1-befc-b7c5d79eced9	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f8-1be1-c0d9-4df824be7ddd	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f8-1be1-c094-c8fcca768203	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f8-1be1-4d14-d8da0db61b13	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f8-1be1-ea9f-d834cbffdf77	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f8-1be1-e53b-3f6cf94bcda5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f8-1be1-2a11-f80340845054	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f8-1be1-5479-fe58eca3998b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f8-1be1-ac0b-a9912d94e59e	DK	DNK	208	Denmark 	Danska	\N
00040000-55f8-1be1-c3a7-14e5caf5c4ad	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f8-1be1-5d42-43f75b1bf909	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f8-1be1-e910-95bff892e709	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f8-1be1-8946-d6959fae1892	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f8-1be1-d991-7b99b323ded4	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f8-1be1-2461-0a846dd92890	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f8-1be1-51d0-7698c857a67a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f8-1be1-e826-c513fba9f3c9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f8-1be1-cdec-3bd414904e2a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f8-1be1-5438-67649529b729	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f8-1be1-0724-2c90c4ceb5fc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f8-1be1-5506-4da1412993a9	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f8-1be1-6d76-b3468cfcf28d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f8-1be1-5d42-1bf0f0d72f39	FI	FIN	246	Finland 	Finska	\N
00040000-55f8-1be1-d312-3cf9bf44ea9c	FR	FRA	250	France 	Francija	\N
00040000-55f8-1be1-2892-16c3cbd7d808	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f8-1be1-f363-da4e59f50714	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f8-1be1-52b7-6d4d8183cc44	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f8-1be1-fe62-74187bb83b66	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f8-1be1-2fa3-7e17207cd6e9	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f8-1be1-d1b9-050006ebe90c	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f8-1be1-21b9-5190dcac2394	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f8-1be1-eb20-c8ffa99b7a8c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f8-1be1-7d79-b1a0a51ce034	GH	GHA	288	Ghana 	Gana	\N
00040000-55f8-1be1-651d-b25dedf4ae83	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f8-1be1-ef3b-68f37f7ca7de	GR	GRC	300	Greece 	Grčija	\N
00040000-55f8-1be1-7aba-8edcaf457366	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f8-1be1-2676-d53b9e2f516c	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f8-1be1-e722-157d8743eff1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f8-1be1-6881-2b0382a218b8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f8-1be1-cd5e-acecb0afc081	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f8-1be1-f8b1-23d6a3b01699	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f8-1be1-3748-86922dabc0aa	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f8-1be1-5066-4f8692167290	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f8-1be1-f0b6-59cd9d3a4ec3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f8-1be1-ae3d-79e47b4431ef	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f8-1be1-58c2-cedba3a6f975	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f8-1be1-7065-ed6272398f3a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f8-1be1-d9e8-e3560b82c22d	HN	HND	340	Honduras 	Honduras	\N
00040000-55f8-1be1-0496-8353102bbaed	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f8-1be1-fdfb-78e4ecdd3b55	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f8-1be1-c5c1-93938c14bd43	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f8-1be1-8c70-6b6a7eaf2b44	IN	IND	356	India 	Indija	\N
00040000-55f8-1be1-421c-eaf41c056f37	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f8-1be1-eb40-ddf6a9ecdc09	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f8-1be1-2048-634f39304e8b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f8-1be1-b758-864dbe1aa584	IE	IRL	372	Ireland 	Irska	\N
00040000-55f8-1be1-4828-fbc42c663a1c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f8-1be1-f637-75d062dc0b63	IL	ISR	376	Israel 	Izrael	\N
00040000-55f8-1be1-b43d-0424bb743143	IT	ITA	380	Italy 	Italija	\N
00040000-55f8-1be1-2972-bb9c89ab4f49	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f8-1be1-440d-0302d9cd3b5e	JP	JPN	392	Japan 	Japonska	\N
00040000-55f8-1be1-4541-3e7998db60c3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f8-1be1-daa3-ed4bfdddd722	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f8-1be1-336e-91c2ed22ea58	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f8-1be1-1b8b-b9643a5f348a	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f8-1be1-c4ce-771ac3cb4d3c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f8-1be1-3fb9-2b99b06723fe	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f8-1be1-2690-6a1b03b8efe7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f8-1be1-3cfe-369e8ae34014	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f8-1be1-bde1-62d4f31762ff	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f8-1be1-b7a8-82e3d9b439bc	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f8-1be1-f0c9-a2f6074043ca	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f8-1be1-f114-029cfbe1b6a0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f8-1be1-4e36-081e61466934	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f8-1be1-1db6-844b70681709	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f8-1be1-40d3-6eae928af29a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f8-1be1-75eb-e66dc63fa3b6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f8-1be1-7631-c8a75c7e986c	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f8-1be1-ed4d-788091fa3427	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f8-1be1-b09a-5355ca632578	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f8-1be1-ffe2-9246b77e138f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f8-1be1-0c34-fcbc8035d457	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f8-1be1-ce4b-d87c51821c6c	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f8-1be1-2a81-003f4c8ecbd4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f8-1be1-c400-8dbaf7fcc6b1	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f8-1be1-8fa5-3c421337f7cb	ML	MLI	466	Mali 	Mali	\N
00040000-55f8-1be1-c0f7-c734e7f93725	MT	MLT	470	Malta 	Malta	\N
00040000-55f8-1be1-4218-bceb4bde26dc	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f8-1be1-13e5-5b643f380948	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f8-1be1-6663-480351cede12	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f8-1be1-bee9-60428e2b8421	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f8-1be1-3454-1b870d11dc4f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f8-1be1-b9a7-87e0517e2cd8	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f8-1be1-0ff7-5885b9925102	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f8-1be1-0bd2-430bd9e88238	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f8-1be1-76a2-f48ecad1d7d4	MC	MCO	492	Monaco 	Monako	\N
00040000-55f8-1be1-8d51-9bbdda145c8a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f8-1be1-0630-4407b4a7764d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f8-1be1-b6c6-9f167e65068e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f8-1be1-ce6d-8abb48c55a0a	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f8-1be1-a9e8-0986fc8ab130	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f8-1be1-f10a-d7ffdc6c43af	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f8-1be1-8933-7295158b6a30	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f8-1be1-3019-da4e48fc4d31	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f8-1be1-bf6a-c03dda5db2f7	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f8-1be1-0529-ad0ea0373cd0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f8-1be1-2c5e-d158b95e7afc	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f8-1be1-845e-77d45349f6a1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f8-1be1-065c-6ce8edbcfb53	NE	NER	562	Niger 	Niger 	\N
00040000-55f8-1be1-f0f1-3030da38160b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f8-1be1-00af-51712a0bf5c0	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f8-1be1-406a-470d8fee630a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f8-1be1-7683-d5b7913fafcd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f8-1be1-d485-958e958b5b8c	NO	NOR	578	Norway 	Norveška	\N
00040000-55f8-1be1-9745-8d56ac5bfb19	OM	OMN	512	Oman 	Oman	\N
00040000-55f8-1be1-adf4-95c0b18f853f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f8-1be1-5b3f-f2126d0e04fc	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f8-1be1-5f6f-e36f11aec1e3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f8-1be1-5b71-e1fc269e1cf7	PA	PAN	591	Panama 	Panama	\N
00040000-55f8-1be1-c75d-4e78fdde229b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f8-1be1-d05e-720b9dc8197c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f8-1be1-8b45-c65ec76f20f6	PE	PER	604	Peru 	Peru	\N
00040000-55f8-1be1-7f6f-f996998a7398	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f8-1be1-abf3-e6a917118c26	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f8-1be1-9ba8-8eb81c606567	PL	POL	616	Poland 	Poljska	\N
00040000-55f8-1be1-5d51-a340fc22e586	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f8-1be1-1a09-6f2a729c9910	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f8-1be1-9ea0-469e32f75287	QA	QAT	634	Qatar 	Katar	\N
00040000-55f8-1be1-5d33-cfaeb5661129	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f8-1be1-4947-a498ca6b6115	RO	ROU	642	Romania 	Romunija	\N
00040000-55f8-1be1-6c41-1e282db453c7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f8-1be1-fbaa-fd657bf4ce63	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f8-1be1-8b02-a65cd97d38ac	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f8-1be1-abb0-d08f153cbbc1	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f8-1be1-8f90-8eaeb27cda91	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f8-1be1-3bcb-af5448c255b8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f8-1be1-5b00-b4aeb9e1fa26	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f8-1be1-9455-a3fa46f76de7	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f8-1be1-66ff-cf9fb030d354	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f8-1be1-26c1-36e6cf179826	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f8-1be1-ace3-82626f0e2b4b	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f8-1be1-b581-0685991eb020	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f8-1be1-d9f5-eade2abd790a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f8-1be1-8f6b-ac512a3dda7f	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f8-1be1-afe4-81ab5c3327b0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f8-1be1-affe-c5326f4928e0	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f8-1be1-18f0-13e7f9cc46d9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f8-1be1-486f-aa019d28cc90	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f8-1be1-5a34-4caea715f6ca	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f8-1be1-f676-a3073a33de7f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f8-1be1-db11-d29606646aad	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f8-1be1-2234-10171ef5bf76	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f8-1be1-2341-09f1abe22aa4	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f8-1be1-cf2c-cd52c9a35ded	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f8-1be1-589e-a51b2c4c1745	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f8-1be1-045a-a3102727987c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f8-1be1-028d-5981c825ded4	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f8-1be1-68a6-da27d81e2291	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f8-1be1-326e-d111e740fcce	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f8-1be1-b750-2b5e05207ee6	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f8-1be1-583c-09b8f4e6d92d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f8-1be1-293a-e1a8068668e7	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f8-1be1-8c99-952be88fb42a	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f8-1be1-f0ad-3312f35ff74d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f8-1be1-f0a1-2290b60c4cf3	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f8-1be1-4f84-ed5d353adc7a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f8-1be1-de57-aa2f148b90f9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f8-1be1-96ef-e5bf5045dac2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f8-1be1-7dde-2d9c40d7eea6	TH	THA	764	Thailand 	Tajska	\N
00040000-55f8-1be1-9e48-2fd2a0014bc4	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f8-1be1-70e6-096c53aa56a6	TG	TGO	768	Togo 	Togo	\N
00040000-55f8-1be1-d572-beff2694773c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f8-1be1-0435-4bdea926b183	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f8-1be1-b4f9-6e990878a190	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f8-1be1-15be-2d130d03eee5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f8-1be1-5d09-586239c5a347	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f8-1be1-1f7b-78c085068049	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f8-1be1-2fb2-08392f2a4cd3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f8-1be1-6233-d59f8ee2bbc4	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f8-1be1-1b67-c326336ad06c	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f8-1be1-87b2-7a0e89a2fbd9	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f8-1be1-bdea-b130117fa4f4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f8-1be1-6a53-e96c0cb755d9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f8-1be1-570c-7c24365e03a4	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f8-1be1-7d7f-8bc34c77a568	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f8-1be1-2aaa-892985dd06a8	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f8-1be1-f8ed-5e88d2b3ce76	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f8-1be1-c4e4-a1d1cef21a87	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f8-1be1-ba52-32c296edb3f9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f8-1be1-4863-964ec464b202	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f8-1be1-846a-ad345e429f70	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f8-1be1-c6d2-82b539a352a4	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f8-1be1-6d52-f6769171e813	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f8-1be1-7aee-79dda44440f4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f8-1be1-5ad4-238d173cad88	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f8-1be1-4711-f56a2014ecdd	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f8-1be1-efa4-0b4d754aad3a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2989 (class 0 OID 19602618)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f8-1be3-8e8f-9c326237e563	000e0000-55f8-1be3-6c87-a2add7847392	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f8-1be1-fb3a-e58d0993efc1	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f8-1be3-20d3-b3d311ef9e0f	000e0000-55f8-1be3-1d06-c13075a97c11	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f8-1be1-9177-7c2d5711ad29	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f8-1be3-4101-b6ab8afddbbf	000e0000-55f8-1be3-e47b-d04719167cd4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f8-1be1-fb3a-e58d0993efc1	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f8-1be3-dbb0-24f91cb7b585	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f8-1be3-50e5-16b5ae9babf0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2975 (class 0 OID 19602428)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f8-1be3-588a-bb2477a0d14b	000e0000-55f8-1be3-1d06-c13075a97c11	000c0000-55f8-1be3-4c59-ae02391aec74	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f8-1be1-79c2-d4260b6a0054
000d0000-55f8-1be3-25bd-f54d204894bd	000e0000-55f8-1be3-1d06-c13075a97c11	000c0000-55f8-1be3-1a4d-759576c1b1c2	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f8-1be1-db10-95dad595043d
000d0000-55f8-1be3-d9cc-5be6701d190e	000e0000-55f8-1be3-1d06-c13075a97c11	000c0000-55f8-1be3-bb21-46bffd8f9314	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f8-1be1-2541-2468d9781d35
000d0000-55f8-1be3-5de3-784efda9e04a	000e0000-55f8-1be3-1d06-c13075a97c11	000c0000-55f8-1be3-dd72-0cfc8455b604	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f8-1be1-807a-a33e1cdfeee4
000d0000-55f8-1be3-3f9e-280ab4b4d984	000e0000-55f8-1be3-1d06-c13075a97c11	000c0000-55f8-1be3-1fd9-b69705ecb8a8	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f8-1be1-807a-a33e1cdfeee4
000d0000-55f8-1be3-e8e5-55f8c14897e3	000e0000-55f8-1be3-1d06-c13075a97c11	000c0000-55f8-1be3-1b2e-52e2dfa69832	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f8-1be1-79c2-d4260b6a0054
000d0000-55f8-1be3-901f-2df35efe2f60	000e0000-55f8-1be3-1d06-c13075a97c11	000c0000-55f8-1be4-e281-3992eca89f13	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f8-1be1-79c2-d4260b6a0054
000d0000-55f8-1be3-3276-6bcf43074d4f	000e0000-55f8-1be3-1d06-c13075a97c11	000c0000-55f8-1be3-ee28-8c65b2502c16	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f8-1be1-beed-b505a0ce1074
000d0000-55f8-1be3-091d-c865795c76a9	000e0000-55f8-1be3-1d06-c13075a97c11	000c0000-55f8-1be4-c1cb-3b948e13f51e	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f8-1be1-3098-517fc4d878f9
\.


--
-- TOC entry 2955 (class 0 OID 19602243)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 19602224)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f8-1be3-7fd6-413def87fe8e	00080000-55f8-1be3-0fe0-9477df6af0d9	00090000-55f8-1be3-0dc9-6b7b065d28d6	AK		igralka
\.


--
-- TOC entry 2964 (class 0 OID 19602342)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19602825)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 19602837)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 19602859)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 19602367)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 19602181)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f8-1be2-9d16-d3e4c28eb2e7	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f8-1be2-ff29-df41f4d627f1	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f8-1be2-5263-e2051b6d711f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f8-1be2-6ed8-fa0c396438ba	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f8-1be2-7b10-ce508db23a3e	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f8-1be2-9464-ce5cc7829829	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f8-1be2-0ee9-1929c37d6a72	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f8-1be2-4d9e-3f6cab80bf60	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f8-1be2-596f-0c5dcae7a758	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f8-1be2-b4b5-b29ac447baaa	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f8-1be2-22b5-045127ff7d86	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f8-1be2-7e47-efc643ff1041	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f8-1be2-bf8f-b25b24eb0c56	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f8-1be2-6ce1-bc1c7e2414ec	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f8-1be3-a111-002fa61adb11	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f8-1be3-f54b-c673202d7584	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f8-1be3-b447-0860868fb403	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f8-1be3-8ac5-2ffd56418cb3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f8-1be3-fb6c-e208f5152dea	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f8-1be4-b3d9-2dfe054ac20e	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2944 (class 0 OID 19602095)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f8-1be3-b09a-8d89f1a921e1	00000000-55f8-1be3-a111-002fa61adb11	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f8-1be3-6ff7-dbe17310060b	00000000-55f8-1be3-a111-002fa61adb11	00010000-55f8-1be2-a4f0-a3edb9219dfc	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f8-1be3-7bf9-a83295af565e	00000000-55f8-1be3-f54b-c673202d7584	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2945 (class 0 OID 19602106)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f8-1be3-d6c7-3190d648283c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f8-1be3-592b-92bd316e97d6	00010000-55f8-1be3-497e-dfcc28badf34	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f8-1be3-a02d-011761e9dec2	00010000-55f8-1be3-8c35-6900bfd881b1	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f8-1be3-13f4-170465d150e3	00010000-55f8-1be3-cc06-3376d03dc13b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f8-1be3-fdb2-e1d67512318f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f8-1be3-7b03-4f194f8ee82d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f8-1be3-5baf-f6dcc0dc0e6e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f8-1be3-3ab4-e8b569128ad9	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f8-1be3-0dc9-6b7b065d28d6	00010000-55f8-1be3-ead9-1dc5f70af77b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f8-1be3-3448-aa7f1b4bca5c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f8-1be3-2e8e-5ada717eaf4c	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f8-1be3-4e5b-622b9a8f37b5	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f8-1be3-fadc-7155d6f29108	00010000-55f8-1be3-4373-d06874deb1eb	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2940 (class 0 OID 19602060)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f8-1be2-b1cc-1769af67b6c4	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f8-1be2-7341-0055011a4a12	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f8-1be2-df6b-dfd8437cc19b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f8-1be2-f3a8-5f3c3e231f5d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f8-1be2-64eb-27f9e2bb4e42	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f8-1be2-757e-7c6aafaf6c16	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f8-1be2-e6c9-ee1610c57065	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f8-1be2-e842-5fc048b4335f	Abonma-read	Abonma - branje	f
00030000-55f8-1be2-fc5f-ef260d229e2c	Abonma-write	Abonma - spreminjanje	f
00030000-55f8-1be2-faa3-48d1155921d0	Alternacija-read	Alternacija - branje	f
00030000-55f8-1be2-8961-05fe61841b83	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f8-1be2-8fa9-683268ffc51c	Arhivalija-read	Arhivalija - branje	f
00030000-55f8-1be2-2492-de5e97e8deb4	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f8-1be2-73a1-4b588edf9fe7	Besedilo-read	Besedilo - branje	f
00030000-55f8-1be2-3c39-dd97e9695d4c	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f8-1be2-4715-650ea580900e	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f8-1be2-4054-769ef3dd25a2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f8-1be2-e02c-7e8f9c6af356	Dogodek-read	Dogodek - branje	f
00030000-55f8-1be2-23e6-e91c25904df9	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f8-1be2-6ceb-b4388526de99	DrugiVir-read	DrugiVir - branje	f
00030000-55f8-1be2-66b4-080289526206	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f8-1be2-8253-c72e181a6549	Drzava-read	Drzava - branje	f
00030000-55f8-1be2-a4ba-8466bcc085cb	Drzava-write	Drzava - spreminjanje	f
00030000-55f8-1be2-d5d3-10df57554773	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f8-1be2-b7b3-9ba9211924ac	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f8-1be2-6a55-263fe7d02295	Funkcija-read	Funkcija - branje	f
00030000-55f8-1be2-7f24-86362d4c0eac	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f8-1be2-751e-f22675b76463	Gostovanje-read	Gostovanje - branje	f
00030000-55f8-1be2-ee92-0d57420c0705	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f8-1be2-0a8a-e1ecbb8d8555	Gostujoca-read	Gostujoca - branje	f
00030000-55f8-1be2-9b29-2b01ae848830	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f8-1be2-bdec-06114a7bfc87	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f8-1be2-ed1e-5ac3d234c949	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f8-1be2-acfe-1e3b71b70803	Kupec-read	Kupec - branje	f
00030000-55f8-1be2-f620-fec03aab8df0	Kupec-write	Kupec - spreminjanje	f
00030000-55f8-1be2-0dd2-7e2f6257b82a	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f8-1be2-58e6-bf6ef9f688f7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f8-1be2-6bad-d0303a78c272	Option-read	Option - branje	f
00030000-55f8-1be2-3891-58e53f7d33bb	Option-write	Option - spreminjanje	f
00030000-55f8-1be2-b783-58c4c0aa5dfd	OptionValue-read	OptionValue - branje	f
00030000-55f8-1be2-74b2-2e841e1b5ddc	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f8-1be2-2530-bc578890bf5f	Oseba-read	Oseba - branje	f
00030000-55f8-1be2-9cd7-be049a558344	Oseba-write	Oseba - spreminjanje	f
00030000-55f8-1be2-6717-68c3a184dee9	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f8-1be2-bdac-3c2858500286	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f8-1be2-4af8-2e4c2b170fcc	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f8-1be2-f9cf-65f664b80cf4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f8-1be2-e609-43c419748e6b	Pogodba-read	Pogodba - branje	f
00030000-55f8-1be2-ab45-94e5a715a73d	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f8-1be2-0b9f-f9727b7439ec	Popa-read	Popa - branje	f
00030000-55f8-1be2-4e51-fd06d640229a	Popa-write	Popa - spreminjanje	f
00030000-55f8-1be2-8883-9c1063d4510a	Posta-read	Posta - branje	f
00030000-55f8-1be2-495c-4e6c65bf35c5	Posta-write	Posta - spreminjanje	f
00030000-55f8-1be2-3b62-be5b52ec95fa	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f8-1be2-4862-14816c5de836	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f8-1be2-1a80-dd54a526f6e6	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f8-1be2-718b-0d8ef2a1e23b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f8-1be2-deae-9319d1ef1a39	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f8-1be2-0bcf-43d7a76696f7	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f8-1be2-0bc6-78b20b4c3c3e	Predstava-read	Predstava - branje	f
00030000-55f8-1be2-bad2-f7742f919a22	Predstava-write	Predstava - spreminjanje	f
00030000-55f8-1be2-ff30-c51dcd2b5e2a	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f8-1be2-6386-a77bf6f9c792	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f8-1be2-6800-05c03b0284a6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f8-1be2-c401-c2016d6b4e3c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f8-1be2-3d5a-828bbbb8f043	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f8-1be2-a2ce-e4b08bd7c67a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f8-1be2-2cac-f34a4af8985e	ProgramDela-read	ProgramDela - branje	f
00030000-55f8-1be2-467b-f9f300a1fea2	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f8-1be2-5014-0a30e18906bb	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f8-1be2-6450-4507442aae27	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f8-1be2-b7fb-5d46fba71cf7	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f8-1be2-03ef-efadd1b958b1	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f8-1be2-4a80-616bc5bee87a	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f8-1be2-1534-a4e0fbc41386	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f8-1be2-c1c8-416631fa47fa	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f8-1be2-4a8a-2c8c410749a4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f8-1be2-ce71-cb013a49396c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f8-1be2-2421-192423a15c08	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f8-1be2-604a-babba21df1fb	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f8-1be2-44a1-ffee4092c7fe	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f8-1be2-4615-70653ec39ac5	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f8-1be2-6847-4bae60493b80	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f8-1be2-6aed-e96b658fc479	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f8-1be2-5c89-6bd394e4c529	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f8-1be2-964b-4c5e03f2d401	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f8-1be2-9e4e-3b59ff539949	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f8-1be2-cff4-4b6bb6ea68d7	Prostor-read	Prostor - branje	f
00030000-55f8-1be2-3c67-0738fb784564	Prostor-write	Prostor - spreminjanje	f
00030000-55f8-1be2-6a0e-5b04a9fa50fe	Racun-read	Racun - branje	f
00030000-55f8-1be2-c9fd-4fc520700f72	Racun-write	Racun - spreminjanje	f
00030000-55f8-1be2-202f-58119557d15f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f8-1be2-69ce-39da69db8936	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f8-1be2-4c88-a6f3ba247e88	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f8-1be2-7f69-da6ba9732c15	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f8-1be2-493f-056e9d24b930	Rekvizit-read	Rekvizit - branje	f
00030000-55f8-1be2-f687-715b46699dad	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f8-1be2-1880-4a9648a2aea5	Revizija-read	Revizija - branje	f
00030000-55f8-1be2-c60b-a62b6ecd3a38	Revizija-write	Revizija - spreminjanje	f
00030000-55f8-1be2-f670-86704eb3b385	Rezervacija-read	Rezervacija - branje	f
00030000-55f8-1be2-b258-928e0b865522	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f8-1be2-2fa4-4577b9d72ec0	SedezniRed-read	SedezniRed - branje	f
00030000-55f8-1be2-5151-967c8c96b7ff	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f8-1be2-fb04-9b497ab70f75	Sedez-read	Sedez - branje	f
00030000-55f8-1be2-e5ef-4e65a8591d96	Sedez-write	Sedez - spreminjanje	f
00030000-55f8-1be2-0932-7144f1c1adc9	Sezona-read	Sezona - branje	f
00030000-55f8-1be2-e547-69671e6e58a9	Sezona-write	Sezona - spreminjanje	f
00030000-55f8-1be2-c145-db641f56601e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f8-1be2-2ac4-1ae263dbb38d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f8-1be2-f39d-7b4d3814f003	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f8-1be2-e539-26b6b06367c7	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f8-1be2-f907-880ee4f29449	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f8-1be2-dd55-51b635cc6254	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f8-1be2-2a57-7211f882b150	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f8-1be2-6060-0957e9b925fc	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f8-1be2-38a5-57fb6641b020	Telefonska-read	Telefonska - branje	f
00030000-55f8-1be2-9a0d-b46d2c86b745	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f8-1be2-c52d-0fe57d4e8408	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f8-1be2-ef3b-2f3432c8c204	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f8-1be2-abf5-480a22737fc1	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f8-1be2-3ce0-68ac7bd1cc21	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f8-1be2-fd6d-3b5e9f4cfc6c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f8-1be2-fb6d-f1f12c3221af	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f8-1be2-1f86-80e399b5f10a	Trr-read	Trr - branje	f
00030000-55f8-1be2-48b8-04b2cf8a8b21	Trr-write	Trr - spreminjanje	f
00030000-55f8-1be2-8754-d1d335e1f1ba	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f8-1be2-bf0a-668b52f16ef0	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f8-1be2-cc09-1b4b3cd8ea77	Vaja-read	Vaja - branje	f
00030000-55f8-1be2-cee8-c3ca5e12b080	Vaja-write	Vaja - spreminjanje	f
00030000-55f8-1be2-e3a3-ea30393bd7ce	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f8-1be2-aa76-6330d0e86194	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f8-1be2-1f50-9d9d93592e68	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f8-1be2-f3c8-df39817a8a79	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f8-1be2-6528-92677a883196	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f8-1be2-5954-8da54682937a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f8-1be2-1e23-57b1bbc64b70	Zasedenost-read	Zasedenost - branje	f
00030000-55f8-1be2-a152-465c61dd678a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f8-1be2-893a-2d1f1de84cfe	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f8-1be2-c612-9e27aaed3b8d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f8-1be2-3c93-a6bc8fb84d75	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f8-1be2-3e9f-125b0049ed3a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f8-1be2-a99a-b07256cec774	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f8-1be2-f3f6-dfe044e63331	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f8-1be2-5b99-641da5a18e2e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f8-1be2-a167-ebe3dcf28e9c	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f8-1be2-5cb5-08ad9cdc01b4	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f8-1be2-3ea8-70e71f5f2cc1	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f8-1be2-5e41-37c50082a873	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f8-1be2-e121-38be655d5f69	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f8-1be2-b68c-27a0947fdfb4	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f8-1be2-3bae-6a61d016f3c7	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f8-1be2-edba-00d2c79098b9	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f8-1be2-71be-e58498ea98b0	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2942 (class 0 OID 19602079)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f8-1be2-ca3f-e3feae9ccf7c	00030000-55f8-1be2-7341-0055011a4a12
00020000-55f8-1be2-d873-5465238746fe	00030000-55f8-1be2-8253-c72e181a6549
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-e842-5fc048b4335f
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-fc5f-ef260d229e2c
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-faa3-48d1155921d0
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-8961-05fe61841b83
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-8fa9-683268ffc51c
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-e02c-7e8f9c6af356
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-f3a8-5f3c3e231f5d
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-23e6-e91c25904df9
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-8253-c72e181a6549
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-a4ba-8466bcc085cb
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-6a55-263fe7d02295
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-7f24-86362d4c0eac
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-751e-f22675b76463
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-ee92-0d57420c0705
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-0a8a-e1ecbb8d8555
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-9b29-2b01ae848830
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-bdec-06114a7bfc87
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-ed1e-5ac3d234c949
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-6bad-d0303a78c272
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-b783-58c4c0aa5dfd
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-2530-bc578890bf5f
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-9cd7-be049a558344
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-0b9f-f9727b7439ec
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-4e51-fd06d640229a
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-8883-9c1063d4510a
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-495c-4e6c65bf35c5
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-deae-9319d1ef1a39
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-0bcf-43d7a76696f7
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-0bc6-78b20b4c3c3e
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-bad2-f7742f919a22
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-3d5a-828bbbb8f043
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-a2ce-e4b08bd7c67a
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-cff4-4b6bb6ea68d7
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-3c67-0738fb784564
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-4c88-a6f3ba247e88
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-7f69-da6ba9732c15
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-493f-056e9d24b930
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-f687-715b46699dad
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-0932-7144f1c1adc9
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-e547-69671e6e58a9
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-abf5-480a22737fc1
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-8754-d1d335e1f1ba
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-bf0a-668b52f16ef0
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-cc09-1b4b3cd8ea77
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-cee8-c3ca5e12b080
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-1e23-57b1bbc64b70
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-a152-465c61dd678a
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-893a-2d1f1de84cfe
00020000-55f8-1be2-a5e6-1e2356e2b05c	00030000-55f8-1be2-3c93-a6bc8fb84d75
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-e842-5fc048b4335f
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-8fa9-683268ffc51c
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-e02c-7e8f9c6af356
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-8253-c72e181a6549
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-751e-f22675b76463
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-0a8a-e1ecbb8d8555
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-bdec-06114a7bfc87
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-ed1e-5ac3d234c949
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-6bad-d0303a78c272
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-b783-58c4c0aa5dfd
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-2530-bc578890bf5f
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-9cd7-be049a558344
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-0b9f-f9727b7439ec
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-8883-9c1063d4510a
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-deae-9319d1ef1a39
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-0bcf-43d7a76696f7
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-0bc6-78b20b4c3c3e
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-cff4-4b6bb6ea68d7
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-4c88-a6f3ba247e88
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-493f-056e9d24b930
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-0932-7144f1c1adc9
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-38a5-57fb6641b020
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-9a0d-b46d2c86b745
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-1f86-80e399b5f10a
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-48b8-04b2cf8a8b21
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-6528-92677a883196
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-5954-8da54682937a
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-893a-2d1f1de84cfe
00020000-55f8-1be2-7aa8-cba57f9f3c8f	00030000-55f8-1be2-3c93-a6bc8fb84d75
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-e842-5fc048b4335f
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-faa3-48d1155921d0
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-8fa9-683268ffc51c
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-2492-de5e97e8deb4
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-73a1-4b588edf9fe7
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-4715-650ea580900e
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-e02c-7e8f9c6af356
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-8253-c72e181a6549
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-6a55-263fe7d02295
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-751e-f22675b76463
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-0a8a-e1ecbb8d8555
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-bdec-06114a7bfc87
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-6bad-d0303a78c272
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-b783-58c4c0aa5dfd
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-2530-bc578890bf5f
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-0b9f-f9727b7439ec
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-8883-9c1063d4510a
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-0bc6-78b20b4c3c3e
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-3d5a-828bbbb8f043
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-cff4-4b6bb6ea68d7
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-4c88-a6f3ba247e88
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-493f-056e9d24b930
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-0932-7144f1c1adc9
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-abf5-480a22737fc1
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-cc09-1b4b3cd8ea77
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-1e23-57b1bbc64b70
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-893a-2d1f1de84cfe
00020000-55f8-1be2-73df-32e8382eeea5	00030000-55f8-1be2-3c93-a6bc8fb84d75
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-e842-5fc048b4335f
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-fc5f-ef260d229e2c
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-8961-05fe61841b83
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-8fa9-683268ffc51c
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-e02c-7e8f9c6af356
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-8253-c72e181a6549
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-751e-f22675b76463
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-0a8a-e1ecbb8d8555
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-6bad-d0303a78c272
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-b783-58c4c0aa5dfd
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-0b9f-f9727b7439ec
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-8883-9c1063d4510a
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-0bc6-78b20b4c3c3e
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-cff4-4b6bb6ea68d7
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-4c88-a6f3ba247e88
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-493f-056e9d24b930
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-0932-7144f1c1adc9
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-abf5-480a22737fc1
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-893a-2d1f1de84cfe
00020000-55f8-1be2-604f-5409d0c7561f	00030000-55f8-1be2-3c93-a6bc8fb84d75
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-e842-5fc048b4335f
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-8fa9-683268ffc51c
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-e02c-7e8f9c6af356
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-8253-c72e181a6549
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-751e-f22675b76463
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-0a8a-e1ecbb8d8555
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-6bad-d0303a78c272
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-b783-58c4c0aa5dfd
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-0b9f-f9727b7439ec
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-8883-9c1063d4510a
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-0bc6-78b20b4c3c3e
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-cff4-4b6bb6ea68d7
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-4c88-a6f3ba247e88
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-493f-056e9d24b930
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-0932-7144f1c1adc9
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-c52d-0fe57d4e8408
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-df6b-dfd8437cc19b
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-abf5-480a22737fc1
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-893a-2d1f1de84cfe
00020000-55f8-1be2-4e77-f22219101273	00030000-55f8-1be2-3c93-a6bc8fb84d75
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-b1cc-1769af67b6c4
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-7341-0055011a4a12
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-df6b-dfd8437cc19b
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-f3a8-5f3c3e231f5d
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-64eb-27f9e2bb4e42
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-757e-7c6aafaf6c16
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-e6c9-ee1610c57065
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-e842-5fc048b4335f
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-fc5f-ef260d229e2c
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-faa3-48d1155921d0
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-8961-05fe61841b83
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-8fa9-683268ffc51c
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-2492-de5e97e8deb4
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-73a1-4b588edf9fe7
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-3c39-dd97e9695d4c
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-4715-650ea580900e
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-4054-769ef3dd25a2
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-e02c-7e8f9c6af356
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-23e6-e91c25904df9
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-8253-c72e181a6549
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-a4ba-8466bcc085cb
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6ceb-b4388526de99
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-66b4-080289526206
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-d5d3-10df57554773
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-b7b3-9ba9211924ac
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6a55-263fe7d02295
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-7f24-86362d4c0eac
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-751e-f22675b76463
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-ee92-0d57420c0705
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-0a8a-e1ecbb8d8555
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-9b29-2b01ae848830
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-bdec-06114a7bfc87
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-ed1e-5ac3d234c949
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-acfe-1e3b71b70803
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-f620-fec03aab8df0
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-0dd2-7e2f6257b82a
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-58e6-bf6ef9f688f7
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6bad-d0303a78c272
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-3891-58e53f7d33bb
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-b783-58c4c0aa5dfd
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-74b2-2e841e1b5ddc
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-2530-bc578890bf5f
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-9cd7-be049a558344
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6717-68c3a184dee9
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-bdac-3c2858500286
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-4af8-2e4c2b170fcc
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-f9cf-65f664b80cf4
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-e609-43c419748e6b
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-ab45-94e5a715a73d
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-0b9f-f9727b7439ec
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-4e51-fd06d640229a
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-8883-9c1063d4510a
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-495c-4e6c65bf35c5
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-3b62-be5b52ec95fa
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-4862-14816c5de836
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-1a80-dd54a526f6e6
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-718b-0d8ef2a1e23b
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-deae-9319d1ef1a39
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-0bcf-43d7a76696f7
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-0bc6-78b20b4c3c3e
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-bad2-f7742f919a22
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-ff30-c51dcd2b5e2a
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6386-a77bf6f9c792
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6800-05c03b0284a6
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-c401-c2016d6b4e3c
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-3d5a-828bbbb8f043
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-a2ce-e4b08bd7c67a
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-2cac-f34a4af8985e
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-467b-f9f300a1fea2
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-5014-0a30e18906bb
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6450-4507442aae27
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-b7fb-5d46fba71cf7
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-03ef-efadd1b958b1
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-4a80-616bc5bee87a
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-1534-a4e0fbc41386
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-c1c8-416631fa47fa
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-4a8a-2c8c410749a4
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-ce71-cb013a49396c
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-2421-192423a15c08
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-604a-babba21df1fb
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-44a1-ffee4092c7fe
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-4615-70653ec39ac5
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6847-4bae60493b80
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6aed-e96b658fc479
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-5c89-6bd394e4c529
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-964b-4c5e03f2d401
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-9e4e-3b59ff539949
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-cff4-4b6bb6ea68d7
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-3c67-0738fb784564
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6a0e-5b04a9fa50fe
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-c9fd-4fc520700f72
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-202f-58119557d15f
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-69ce-39da69db8936
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-4c88-a6f3ba247e88
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-7f69-da6ba9732c15
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-493f-056e9d24b930
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-f687-715b46699dad
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-1880-4a9648a2aea5
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-c60b-a62b6ecd3a38
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-f670-86704eb3b385
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-b258-928e0b865522
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-2fa4-4577b9d72ec0
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-5151-967c8c96b7ff
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-fb04-9b497ab70f75
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-e5ef-4e65a8591d96
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-0932-7144f1c1adc9
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-e547-69671e6e58a9
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-c145-db641f56601e
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-2ac4-1ae263dbb38d
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-f39d-7b4d3814f003
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-e539-26b6b06367c7
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-f907-880ee4f29449
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-dd55-51b635cc6254
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-2a57-7211f882b150
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6060-0957e9b925fc
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-38a5-57fb6641b020
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-9a0d-b46d2c86b745
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-c52d-0fe57d4e8408
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-ef3b-2f3432c8c204
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-abf5-480a22737fc1
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-3ce0-68ac7bd1cc21
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-fd6d-3b5e9f4cfc6c
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-fb6d-f1f12c3221af
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-1f86-80e399b5f10a
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-48b8-04b2cf8a8b21
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-8754-d1d335e1f1ba
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-bf0a-668b52f16ef0
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-cc09-1b4b3cd8ea77
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-cee8-c3ca5e12b080
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-e3a3-ea30393bd7ce
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-aa76-6330d0e86194
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-1f50-9d9d93592e68
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-f3c8-df39817a8a79
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-6528-92677a883196
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-5954-8da54682937a
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-1e23-57b1bbc64b70
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-a152-465c61dd678a
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-893a-2d1f1de84cfe
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-c612-9e27aaed3b8d
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-3c93-a6bc8fb84d75
00020000-55f8-1be3-ddb7-26409512d0cd	00030000-55f8-1be2-3e9f-125b0049ed3a
\.


--
-- TOC entry 2969 (class 0 OID 19602374)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 19602408)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19602537)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f8-1be3-dbbb-7b606a88db18	00090000-55f8-1be3-d6c7-3190d648283c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f8-1be3-c6c8-8da34d37681d	00090000-55f8-1be3-7b03-4f194f8ee82d	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f8-1be3-0dbf-d7f34a2ce7a9	00090000-55f8-1be3-fadc-7155d6f29108	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f8-1be3-d059-b07db7b57f64	00090000-55f8-1be3-3448-aa7f1b4bca5c	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2947 (class 0 OID 19602139)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f8-1be3-0fe0-9477df6af0d9	00040000-55f8-1be1-db11-d29606646aad	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-1be3-5cc6-20b3904fac8e	00040000-55f8-1be1-db11-d29606646aad	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f8-1be3-0100-9e0c64ac2567	00040000-55f8-1be1-db11-d29606646aad	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-1be3-8e91-80ed66235693	00040000-55f8-1be1-db11-d29606646aad	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-1be3-a9b5-04b91fa5ce0a	00040000-55f8-1be1-db11-d29606646aad	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-1be3-edea-41b954f47df9	00040000-55f8-1be1-86b8-e7636538a244	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-1be3-b63f-23a8644418dc	00040000-55f8-1be1-4d14-d8da0db61b13	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-1be3-a734-186eedbef536	00040000-55f8-1be1-3ab8-661cc86ae94a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-1be3-e1f1-af2ad4ac5789	00040000-55f8-1be1-eb20-c8ffa99b7a8c	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-1be4-3c1e-3aae3baec840	00040000-55f8-1be1-db11-d29606646aad	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2949 (class 0 OID 19602173)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f8-1be1-f1e8-2728e0c9f23b	8341	Adlešiči
00050000-55f8-1be1-10a7-1167e5f090eb	5270	Ajdovščina
00050000-55f8-1be1-61d3-55d0e5ab9887	6280	Ankaran/Ancarano
00050000-55f8-1be1-da51-dad26fe2f92c	9253	Apače
00050000-55f8-1be1-40af-25327ad1e910	8253	Artiče
00050000-55f8-1be1-2eeb-2ea1cdd47d12	4275	Begunje na Gorenjskem
00050000-55f8-1be1-3dca-c906a0549329	1382	Begunje pri Cerknici
00050000-55f8-1be1-ed39-344711dc2737	9231	Beltinci
00050000-55f8-1be1-8b1f-81f84d126aef	2234	Benedikt
00050000-55f8-1be1-b11f-3e0d7c4f6969	2345	Bistrica ob Dravi
00050000-55f8-1be1-f78f-09ec6a41f062	3256	Bistrica ob Sotli
00050000-55f8-1be1-7022-1e330d7d84cf	8259	Bizeljsko
00050000-55f8-1be1-6797-cc3ce99c87d3	1223	Blagovica
00050000-55f8-1be1-8987-75c3feeda395	8283	Blanca
00050000-55f8-1be1-07d2-bbd9ff0ac6e2	4260	Bled
00050000-55f8-1be1-93a9-197df36ae5a0	4273	Blejska Dobrava
00050000-55f8-1be1-46bf-5446ba0aa924	9265	Bodonci
00050000-55f8-1be1-8361-bb3f77ff7086	9222	Bogojina
00050000-55f8-1be1-6dac-41acdde00328	4263	Bohinjska Bela
00050000-55f8-1be1-811d-766a62db04d9	4264	Bohinjska Bistrica
00050000-55f8-1be1-af2d-491556a56b87	4265	Bohinjsko jezero
00050000-55f8-1be1-253d-0bdf0df15398	1353	Borovnica
00050000-55f8-1be1-241a-a0ed84d54c65	8294	Boštanj
00050000-55f8-1be1-d089-8c3bcb00e021	5230	Bovec
00050000-55f8-1be1-9b60-6c2f027e1b55	5295	Branik
00050000-55f8-1be1-0deb-f04ba2691171	3314	Braslovče
00050000-55f8-1be1-83b6-1b77e6da72f8	5223	Breginj
00050000-55f8-1be1-eb05-388b35061d8f	8280	Brestanica
00050000-55f8-1be1-3c60-0d459985f593	2354	Bresternica
00050000-55f8-1be1-4fd8-603524cfee09	4243	Brezje
00050000-55f8-1be1-8f2d-acd83cee45ab	1351	Brezovica pri Ljubljani
00050000-55f8-1be1-0cdf-74db7f256957	8250	Brežice
00050000-55f8-1be1-51bd-acf6ef47af0d	4210	Brnik - Aerodrom
00050000-55f8-1be1-0cd4-cb6b64458e4c	8321	Brusnice
00050000-55f8-1be1-0145-25a13d2e1141	3255	Buče
00050000-55f8-1be1-aee9-119e52d675c3	8276	Bučka 
00050000-55f8-1be1-84c3-7b45a4ea44a3	9261	Cankova
00050000-55f8-1be1-cf93-713869352fdc	3000	Celje 
00050000-55f8-1be1-ba8a-d7730723bd38	3001	Celje - poštni predali
00050000-55f8-1be1-005c-a50f65a5155f	4207	Cerklje na Gorenjskem
00050000-55f8-1be1-3eaa-aa6904873a7e	8263	Cerklje ob Krki
00050000-55f8-1be1-de00-6be8144eb785	1380	Cerknica
00050000-55f8-1be1-fd7c-4dc523afeafb	5282	Cerkno
00050000-55f8-1be1-802d-a70a37d14443	2236	Cerkvenjak
00050000-55f8-1be1-9a8a-cd93253597a6	2215	Ceršak
00050000-55f8-1be1-80bb-f68a9541cd6f	2326	Cirkovce
00050000-55f8-1be1-b828-ded5c642e354	2282	Cirkulane
00050000-55f8-1be1-25cb-50715da05f00	5273	Col
00050000-55f8-1be1-713a-ce63fe9638a3	8251	Čatež ob Savi
00050000-55f8-1be1-5f06-0784c3b018e5	1413	Čemšenik
00050000-55f8-1be1-0354-733b377326bb	5253	Čepovan
00050000-55f8-1be1-4e76-796a2000104d	9232	Črenšovci
00050000-55f8-1be1-24c6-ded0881e4935	2393	Črna na Koroškem
00050000-55f8-1be1-fd26-3518aaf70fab	6275	Črni Kal
00050000-55f8-1be1-3e6a-e5412ee081ad	5274	Črni Vrh nad Idrijo
00050000-55f8-1be1-1b3b-4c6ed8011b07	5262	Črniče
00050000-55f8-1be1-a080-eef0e9330dc6	8340	Črnomelj
00050000-55f8-1be1-4889-0424a417b0af	6271	Dekani
00050000-55f8-1be1-7f8c-da37fd98d0b1	5210	Deskle
00050000-55f8-1be1-8083-2408b5931ec7	2253	Destrnik
00050000-55f8-1be1-4f5c-0a1ab84f80d7	6215	Divača
00050000-55f8-1be1-ce78-26f6f480225f	1233	Dob
00050000-55f8-1be1-bca7-7bbc6ad44bfe	3224	Dobje pri Planini
00050000-55f8-1be1-16f5-8e75beab045b	8257	Dobova
00050000-55f8-1be1-0a0c-1409a819a7c3	1423	Dobovec
00050000-55f8-1be1-3e8a-0d201b162703	5263	Dobravlje
00050000-55f8-1be1-e7c8-bc11efecf866	3204	Dobrna
00050000-55f8-1be1-f2ad-a8a6097ec668	8211	Dobrnič
00050000-55f8-1be1-bc49-efdfb2809cb9	1356	Dobrova
00050000-55f8-1be1-0648-0a7c382a5e66	9223	Dobrovnik/Dobronak 
00050000-55f8-1be1-f9c5-15e6e1c5f187	5212	Dobrovo v Brdih
00050000-55f8-1be1-cc9c-74613deac6f1	1431	Dol pri Hrastniku
00050000-55f8-1be1-0097-5ff7a2ab9ad1	1262	Dol pri Ljubljani
00050000-55f8-1be1-84ad-cb4b140ab445	1273	Dole pri Litiji
00050000-55f8-1be1-46a5-1f42cd90d0a5	1331	Dolenja vas
00050000-55f8-1be1-b0c0-d985024b43f7	8350	Dolenjske Toplice
00050000-55f8-1be1-6fd6-812d154bf897	1230	Domžale
00050000-55f8-1be1-d82b-df923352c201	2252	Dornava
00050000-55f8-1be1-f5ca-fe0b5818ecd4	5294	Dornberk
00050000-55f8-1be1-0f33-870a3c08205c	1319	Draga
00050000-55f8-1be1-c9e4-f5fdfaf52fcc	8343	Dragatuš
00050000-55f8-1be1-3c0f-6a4ff369ca53	3222	Dramlje
00050000-55f8-1be1-2430-8592822027da	2370	Dravograd
00050000-55f8-1be1-fa24-1c7a51701889	4203	Duplje
00050000-55f8-1be1-46e3-006271206e80	6221	Dutovlje
00050000-55f8-1be1-ec23-d231698b8cc8	8361	Dvor
00050000-55f8-1be1-dfe6-56bb06b21a25	2343	Fala
00050000-55f8-1be1-d823-f10e92ee0d9c	9208	Fokovci
00050000-55f8-1be1-380c-edd335d02ac1	2313	Fram
00050000-55f8-1be1-27d3-df3289aa85a2	3213	Frankolovo
00050000-55f8-1be1-1a59-51fba53cdea9	1274	Gabrovka
00050000-55f8-1be1-f34a-c09d108f94f8	8254	Globoko
00050000-55f8-1be1-4b4d-28947f54e491	5275	Godovič
00050000-55f8-1be1-230a-4e4394e16556	4204	Golnik
00050000-55f8-1be1-1305-c6b36226e89e	3303	Gomilsko
00050000-55f8-1be1-ad4b-6d687ca62277	4224	Gorenja vas
00050000-55f8-1be1-2d11-028cbf2fcb18	3263	Gorica pri Slivnici
00050000-55f8-1be1-443a-57d313b9458f	2272	Gorišnica
00050000-55f8-1be1-b807-1b4e2ff770b9	9250	Gornja Radgona
00050000-55f8-1be1-0699-8a4132a9f83f	3342	Gornji Grad
00050000-55f8-1be1-f0af-6a12e1eb11a3	4282	Gozd Martuljek
00050000-55f8-1be1-b5a4-830f606154fb	6272	Gračišče
00050000-55f8-1be1-a4ea-c40792723a27	9264	Grad
00050000-55f8-1be1-cb80-f84186e20329	8332	Gradac
00050000-55f8-1be1-1aaa-47c5fca17352	1384	Grahovo
00050000-55f8-1be1-b213-a8fde63649ea	5242	Grahovo ob Bači
00050000-55f8-1be1-bb79-5c9fd182d6f0	5251	Grgar
00050000-55f8-1be1-ff9b-a921e68f65b4	3302	Griže
00050000-55f8-1be1-e841-774989452027	3231	Grobelno
00050000-55f8-1be1-d2b9-e12f6550ae5f	1290	Grosuplje
00050000-55f8-1be1-58ab-9cbbc0d6302e	2288	Hajdina
00050000-55f8-1be1-c3df-b818aa2dc68d	8362	Hinje
00050000-55f8-1be1-6e10-b95c1af8d5cf	2311	Hoče
00050000-55f8-1be1-3c90-a4c91f12593f	9205	Hodoš/Hodos
00050000-55f8-1be1-a5ca-ec3ce14e4c1e	1354	Horjul
00050000-55f8-1be1-b663-b06ae1f5320a	1372	Hotedršica
00050000-55f8-1be1-a5ee-b7871da9a1b9	1430	Hrastnik
00050000-55f8-1be1-3ac3-308fcccecd60	6225	Hruševje
00050000-55f8-1be1-6161-11868a9b3c2a	4276	Hrušica
00050000-55f8-1be1-b4c8-9ae525a4c57b	5280	Idrija
00050000-55f8-1be1-4624-75a3f88ee6b0	1292	Ig
00050000-55f8-1be1-90f4-b9171cb8eb31	6250	Ilirska Bistrica
00050000-55f8-1be1-ec59-e127194211d7	6251	Ilirska Bistrica-Trnovo
00050000-55f8-1be1-dfff-a26030688d9c	1295	Ivančna Gorica
00050000-55f8-1be1-8333-6c80a3743af5	2259	Ivanjkovci
00050000-55f8-1be1-bd42-e458995a82e6	1411	Izlake
00050000-55f8-1be1-5ed7-5e08330eaf9c	6310	Izola/Isola
00050000-55f8-1be1-630b-9be8d40eac09	2222	Jakobski Dol
00050000-55f8-1be1-57fc-8243c202f03b	2221	Jarenina
00050000-55f8-1be1-bf10-4bade501c0f7	6254	Jelšane
00050000-55f8-1be1-211a-74a688777e9d	4270	Jesenice
00050000-55f8-1be1-06fd-c867aeb23539	8261	Jesenice na Dolenjskem
00050000-55f8-1be1-ea64-67823f556f5b	3273	Jurklošter
00050000-55f8-1be1-5717-27f7c9ee3ac5	2223	Jurovski Dol
00050000-55f8-1be1-2dbc-b3ef323d4c0a	2256	Juršinci
00050000-55f8-1be1-1f08-3a883130085a	5214	Kal nad Kanalom
00050000-55f8-1be1-7c88-2957e43b07cf	3233	Kalobje
00050000-55f8-1be1-47b2-2616a4740257	4246	Kamna Gorica
00050000-55f8-1be1-078f-68e6c9078dad	2351	Kamnica
00050000-55f8-1be1-680c-388d9f2067c8	1241	Kamnik
00050000-55f8-1be1-2390-8b262b965faf	5213	Kanal
00050000-55f8-1be1-f065-80b0f92ed4e3	8258	Kapele
00050000-55f8-1be1-a0da-8e255a576104	2362	Kapla
00050000-55f8-1be1-a49b-1660935d9702	2325	Kidričevo
00050000-55f8-1be1-f2c1-33b026c9af7c	1412	Kisovec
00050000-55f8-1be1-59e5-7cc84bcc6a50	6253	Knežak
00050000-55f8-1be1-e885-eec964626628	5222	Kobarid
00050000-55f8-1be1-c923-48df56c4c89f	9227	Kobilje
00050000-55f8-1be1-1f9a-ec3b32f491ca	1330	Kočevje
00050000-55f8-1be1-869f-85fdce4230fa	1338	Kočevska Reka
00050000-55f8-1be1-605f-bf30c1200850	2276	Kog
00050000-55f8-1be1-3452-46cf426a0c01	5211	Kojsko
00050000-55f8-1be1-6da5-164ff51b16c6	6223	Komen
00050000-55f8-1be1-8990-3983cdbbaac9	1218	Komenda
00050000-55f8-1be1-cedd-d2e9f3fb0006	6000	Koper/Capodistria 
00050000-55f8-1be1-7c8e-fc21342f6f21	6001	Koper/Capodistria - poštni predali
00050000-55f8-1be1-b673-a3eb7ce63d3c	8282	Koprivnica
00050000-55f8-1be1-f52f-a3e99edd5be8	5296	Kostanjevica na Krasu
00050000-55f8-1be1-af8b-a32d4dbbf098	8311	Kostanjevica na Krki
00050000-55f8-1be1-911e-f49739894723	1336	Kostel
00050000-55f8-1be1-cc0f-f1db9e0957f4	6256	Košana
00050000-55f8-1be1-2961-1f1583240aa7	2394	Kotlje
00050000-55f8-1be1-9d23-982e435bb880	6240	Kozina
00050000-55f8-1be1-f008-f33c7fa34557	3260	Kozje
00050000-55f8-1be1-5283-640d11ac597a	4000	Kranj 
00050000-55f8-1be1-bb9e-1356b60cf14a	4001	Kranj - poštni predali
00050000-55f8-1be1-e2e1-509ea2836cd8	4280	Kranjska Gora
00050000-55f8-1be1-dc49-9c482355bb0a	1281	Kresnice
00050000-55f8-1be1-2cf2-5fba3c69e87c	4294	Križe
00050000-55f8-1be1-420f-d1fd9b40a9b6	9206	Križevci
00050000-55f8-1be1-339c-b2d57d8415fd	9242	Križevci pri Ljutomeru
00050000-55f8-1be1-e7fd-cc53861bdcbe	1301	Krka
00050000-55f8-1be1-f338-be7c5401e88c	8296	Krmelj
00050000-55f8-1be1-c5b1-5c89f8727fc1	4245	Kropa
00050000-55f8-1be1-4242-287139044e67	8262	Krška vas
00050000-55f8-1be1-348d-e4ffb144bc2b	8270	Krško
00050000-55f8-1be1-09c6-cf397f42c5e5	9263	Kuzma
00050000-55f8-1be1-4ab3-995311bf6dde	2318	Laporje
00050000-55f8-1be1-e236-89e0070f2053	3270	Laško
00050000-55f8-1be1-2012-ac75b1494713	1219	Laze v Tuhinju
00050000-55f8-1be1-5715-c92c733560e5	2230	Lenart v Slovenskih goricah
00050000-55f8-1be1-61f2-c77ab5889fbf	9220	Lendava/Lendva
00050000-55f8-1be1-1c83-300bb796d443	4248	Lesce
00050000-55f8-1be1-972a-4f1284bf07ba	3261	Lesično
00050000-55f8-1be1-659f-cc562963f908	8273	Leskovec pri Krškem
00050000-55f8-1be1-fbb0-30a431ec5817	2372	Libeliče
00050000-55f8-1be1-b9cd-5764776fd062	2341	Limbuš
00050000-55f8-1be1-a0b3-52fd7380abc0	1270	Litija
00050000-55f8-1be1-3923-5c6a4052e559	3202	Ljubečna
00050000-55f8-1be1-254a-2cc8cd0c41d0	1000	Ljubljana 
00050000-55f8-1be1-ac7d-c4c6878e983a	1001	Ljubljana - poštni predali
00050000-55f8-1be1-80ce-ef120a6f1e7c	1231	Ljubljana - Črnuče
00050000-55f8-1be1-2336-f09207abda5d	1261	Ljubljana - Dobrunje
00050000-55f8-1be1-d71a-485edd256a48	1260	Ljubljana - Polje
00050000-55f8-1be1-f973-17d848a6560c	1210	Ljubljana - Šentvid
00050000-55f8-1be1-7297-2b6bbfa6d8e5	1211	Ljubljana - Šmartno
00050000-55f8-1be1-aa17-84bf7872a7b1	3333	Ljubno ob Savinji
00050000-55f8-1be1-ab6f-d10c36e07165	9240	Ljutomer
00050000-55f8-1be1-d85c-0ff25415e676	3215	Loče
00050000-55f8-1be1-5585-71e309142d3b	5231	Log pod Mangartom
00050000-55f8-1be1-55db-3e939c9bbcd1	1358	Log pri Brezovici
00050000-55f8-1be1-3164-d24742b1f572	1370	Logatec
00050000-55f8-1be1-a774-a5fba5445571	1371	Logatec
00050000-55f8-1be1-ba7f-d7a8de3bb58c	1434	Loka pri Zidanem Mostu
00050000-55f8-1be1-92c2-abe26a4b5fcd	3223	Loka pri Žusmu
00050000-55f8-1be1-6f71-3c16b5daad35	6219	Lokev
00050000-55f8-1be1-862d-95aa82eb8115	1318	Loški Potok
00050000-55f8-1be1-c1df-db23be5ba116	2324	Lovrenc na Dravskem polju
00050000-55f8-1be1-5166-a234b08bf301	2344	Lovrenc na Pohorju
00050000-55f8-1be1-f37c-81309c45e4fe	3334	Luče
00050000-55f8-1be1-22b0-a189bbb86d09	1225	Lukovica
00050000-55f8-1be1-6fa4-827ac8b1a761	9202	Mačkovci
00050000-55f8-1be1-457f-9fe2b9d1d21a	2322	Majšperk
00050000-55f8-1be1-2f12-c0dc3b12554e	2321	Makole
00050000-55f8-1be1-21d5-2b4792f9cbde	9243	Mala Nedelja
00050000-55f8-1be1-cea0-ca682d8f6cc1	2229	Malečnik
00050000-55f8-1be1-17b4-20207c38e562	6273	Marezige
00050000-55f8-1be1-1ca3-3ac9389b104b	2000	Maribor 
00050000-55f8-1be1-4f42-7d858d17d1f9	2001	Maribor - poštni predali
00050000-55f8-1be1-9241-5beba1214877	2206	Marjeta na Dravskem polju
00050000-55f8-1be1-f280-441b3b4b4c67	2281	Markovci
00050000-55f8-1be1-082f-fdc6228f4e9a	9221	Martjanci
00050000-55f8-1be1-3710-abe4b2ab5830	6242	Materija
00050000-55f8-1be1-a425-5db2ef24aef3	4211	Mavčiče
00050000-55f8-1be1-1d6c-7eca81daf0da	1215	Medvode
00050000-55f8-1be1-130f-3878ddad049d	1234	Mengeš
00050000-55f8-1be1-e6a1-cdae26d3dd7c	8330	Metlika
00050000-55f8-1be1-eaa2-b8207e4c17c7	2392	Mežica
00050000-55f8-1be1-35da-21b05b05b6cf	2204	Miklavž na Dravskem polju
00050000-55f8-1be1-b5b6-e7c693855b4e	2275	Miklavž pri Ormožu
00050000-55f8-1be1-e3f4-1fd4f59a4a9d	5291	Miren
00050000-55f8-1be1-d7fb-219026ddce4e	8233	Mirna
00050000-55f8-1be1-7b27-4aa15ec16e19	8216	Mirna Peč
00050000-55f8-1be1-c445-01059030176b	2382	Mislinja
00050000-55f8-1be1-6c9e-db68032a4444	4281	Mojstrana
00050000-55f8-1be1-ecda-71630a578474	8230	Mokronog
00050000-55f8-1be1-8add-2a7347963545	1251	Moravče
00050000-55f8-1be1-87f7-594a7a3e2f64	9226	Moravske Toplice
00050000-55f8-1be1-3a97-91a26a298985	5216	Most na Soči
00050000-55f8-1be1-cc8b-70707aa3f4a3	1221	Motnik
00050000-55f8-1be1-2c65-df3abb2f58fc	3330	Mozirje
00050000-55f8-1be1-e87d-6fb6575339b2	9000	Murska Sobota 
00050000-55f8-1be1-6429-ba5d5e11b8a5	9001	Murska Sobota - poštni predali
00050000-55f8-1be1-df27-7d063f3b16be	2366	Muta
00050000-55f8-1be1-85ac-e2133668a2b9	4202	Naklo
00050000-55f8-1be1-1923-4c8bcda11191	3331	Nazarje
00050000-55f8-1be1-6c18-0fd09c7acd70	1357	Notranje Gorice
00050000-55f8-1be1-3557-0d5bf41335a6	3203	Nova Cerkev
00050000-55f8-1be1-015a-fbf3c7f25d8d	5000	Nova Gorica 
00050000-55f8-1be1-9428-a968c19f4917	5001	Nova Gorica - poštni predali
00050000-55f8-1be1-b66f-9167bf53674d	1385	Nova vas
00050000-55f8-1be1-816d-c9a7dcaf2dce	8000	Novo mesto
00050000-55f8-1be1-6dd6-916626d91b53	8001	Novo mesto - poštni predali
00050000-55f8-1be1-80b2-96e63c43b363	6243	Obrov
00050000-55f8-1be1-cf8c-554d5e330993	9233	Odranci
00050000-55f8-1be1-e2ce-855e784764ac	2317	Oplotnica
00050000-55f8-1be1-fb90-c65739a9a73e	2312	Orehova vas
00050000-55f8-1be1-e6d1-fa4782833997	2270	Ormož
00050000-55f8-1be1-0248-97099247f0db	1316	Ortnek
00050000-55f8-1be1-9057-6409f61d76fb	1337	Osilnica
00050000-55f8-1be1-42c2-88f4c47271c6	8222	Otočec
00050000-55f8-1be1-676b-eb8c49b2f53a	2361	Ožbalt
00050000-55f8-1be1-efd9-cf809d1f2635	2231	Pernica
00050000-55f8-1be1-7e5c-ae576eeeb8d2	2211	Pesnica pri Mariboru
00050000-55f8-1be1-9e4f-f91516069c2f	9203	Petrovci
00050000-55f8-1be1-360b-abc2a5f7f7c7	3301	Petrovče
00050000-55f8-1be1-7ee5-390b56545dd1	6330	Piran/Pirano
00050000-55f8-1be1-8203-7a853fba8595	8255	Pišece
00050000-55f8-1be1-fb16-0ab5efbc0cb9	6257	Pivka
00050000-55f8-1be1-c924-795119d250e4	6232	Planina
00050000-55f8-1be1-acbd-076a7d422928	3225	Planina pri Sevnici
00050000-55f8-1be1-4a84-444d09c280da	6276	Pobegi
00050000-55f8-1be1-ebb6-662677336bec	8312	Podbočje
00050000-55f8-1be1-36f1-c8098ccb1fe5	5243	Podbrdo
00050000-55f8-1be1-c621-896471daecc6	3254	Podčetrtek
00050000-55f8-1be1-80c8-6febd28b3c91	2273	Podgorci
00050000-55f8-1be1-f654-01249aefa086	6216	Podgorje
00050000-55f8-1be1-5514-7601282c0a7b	2381	Podgorje pri Slovenj Gradcu
00050000-55f8-1be1-9ecd-249bbce7a55e	6244	Podgrad
00050000-55f8-1be1-48e8-b6e199c034e8	1414	Podkum
00050000-55f8-1be1-f37b-b8ca1412661f	2286	Podlehnik
00050000-55f8-1be1-4b9f-0259aa8b2623	5272	Podnanos
00050000-55f8-1be1-d3f4-7653d6457b73	4244	Podnart
00050000-55f8-1be1-4225-2ccda69c89bd	3241	Podplat
00050000-55f8-1be1-df4d-7eeb1cf47fec	3257	Podsreda
00050000-55f8-1be1-d34c-ccd14338867f	2363	Podvelka
00050000-55f8-1be1-b208-e7d962af54fd	2208	Pohorje
00050000-55f8-1be1-b97a-5119fa1cbd3c	2257	Polenšak
00050000-55f8-1be1-cdf8-2c18e26abde7	1355	Polhov Gradec
00050000-55f8-1be1-8197-5f4165e34e58	4223	Poljane nad Škofjo Loko
00050000-55f8-1be1-904f-68a81639eb07	2319	Poljčane
00050000-55f8-1be1-ba5c-190cc57e9a02	1272	Polšnik
00050000-55f8-1be1-e6a5-9ae8b51bbf0b	3313	Polzela
00050000-55f8-1be1-b108-4146125ee767	3232	Ponikva
00050000-55f8-1be1-08cf-8ac7fbea105e	6320	Portorož/Portorose
00050000-55f8-1be1-d877-8989224f2cc3	6230	Postojna
00050000-55f8-1be1-3a63-13cdc80f0445	2331	Pragersko
00050000-55f8-1be1-0e9d-e9da26713e0b	3312	Prebold
00050000-55f8-1be1-992e-fe9681423e31	4205	Preddvor
00050000-55f8-1be1-5dd4-38d4449d48ae	6255	Prem
00050000-55f8-1be1-4d2f-aeff424c1761	1352	Preserje
00050000-55f8-1be1-a037-c50e5377ec65	6258	Prestranek
00050000-55f8-1be1-f18a-d7f63d2fbede	2391	Prevalje
00050000-55f8-1be1-d458-a763ccc5bedd	3262	Prevorje
00050000-55f8-1be1-862a-69d61e9e8c1b	1276	Primskovo 
00050000-55f8-1be1-c961-391a44d4201a	3253	Pristava pri Mestinju
00050000-55f8-1be1-6ae8-0562cde14a9a	9207	Prosenjakovci/Partosfalva
00050000-55f8-1be1-9234-5e0236282e75	5297	Prvačina
00050000-55f8-1be1-fde4-29df72c71787	2250	Ptuj
00050000-55f8-1be1-9755-c081faaea987	2323	Ptujska Gora
00050000-55f8-1be1-d022-b59d893278f1	9201	Puconci
00050000-55f8-1be1-fa6a-10cad9a1b718	2327	Rače
00050000-55f8-1be1-a93c-952b85cc044c	1433	Radeče
00050000-55f8-1be1-06d9-1fbae4067a72	9252	Radenci
00050000-55f8-1be1-b966-5cd6a36a8e96	2360	Radlje ob Dravi
00050000-55f8-1be1-3202-8f15841b4186	1235	Radomlje
00050000-55f8-1be1-4596-2702b7fbff0b	4240	Radovljica
00050000-55f8-1be1-96c6-5bcd63162e2d	8274	Raka
00050000-55f8-1be1-0c71-8ae6517ffcc4	1381	Rakek
00050000-55f8-1be1-d98f-28ace4e8def9	4283	Rateče - Planica
00050000-55f8-1be1-8f1a-9c92ead2de56	2390	Ravne na Koroškem
00050000-55f8-1be1-7a05-ec12617b36d0	9246	Razkrižje
00050000-55f8-1be1-592d-0235d5261210	3332	Rečica ob Savinji
00050000-55f8-1be1-a5bb-0caa4629a3ad	5292	Renče
00050000-55f8-1be1-cd06-2dea4e69a9fc	1310	Ribnica
00050000-55f8-1be1-49ca-64f243197361	2364	Ribnica na Pohorju
00050000-55f8-1be1-d05d-257ea93dd96f	3272	Rimske Toplice
00050000-55f8-1be1-5b8a-fbc486902277	1314	Rob
00050000-55f8-1be1-a123-dfe62ec55838	5215	Ročinj
00050000-55f8-1be1-fdf6-a89001ee1816	3250	Rogaška Slatina
00050000-55f8-1be1-ec15-550a847ae819	9262	Rogašovci
00050000-55f8-1be1-b416-a9d7d76e2593	3252	Rogatec
00050000-55f8-1be1-9957-b5651a6f049a	1373	Rovte
00050000-55f8-1be1-c18a-3e500cae55cc	2342	Ruše
00050000-55f8-1be1-d25b-d2d91d8bc6bb	1282	Sava
00050000-55f8-1be1-0996-c1bcbac2ec1e	6333	Sečovlje/Sicciole
00050000-55f8-1be1-b689-22ac1349723d	4227	Selca
00050000-55f8-1be1-8fb5-7549dce9fe4e	2352	Selnica ob Dravi
00050000-55f8-1be1-3f31-136ae6df61ff	8333	Semič
00050000-55f8-1be1-81c7-103b635dc737	8281	Senovo
00050000-55f8-1be1-3a0d-6c841d405a58	6224	Senožeče
00050000-55f8-1be1-5977-f494b2df59bc	8290	Sevnica
00050000-55f8-1be1-0858-a48851180a2e	6210	Sežana
00050000-55f8-1be1-3ec7-50489d6805d5	2214	Sladki Vrh
00050000-55f8-1be1-06e6-121509854c4d	5283	Slap ob Idrijci
00050000-55f8-1be1-c082-dda7e416356f	2380	Slovenj Gradec
00050000-55f8-1be1-c40e-e89a3b62f009	2310	Slovenska Bistrica
00050000-55f8-1be1-7f65-0757be9bdab7	3210	Slovenske Konjice
00050000-55f8-1be1-8b01-e72a00cec374	1216	Smlednik
00050000-55f8-1be1-e9e1-5489775e58ff	5232	Soča
00050000-55f8-1be1-91dc-0d451230fd72	1317	Sodražica
00050000-55f8-1be1-28e0-19ecbe4b6c8f	3335	Solčava
00050000-55f8-1be1-00f7-520cf96b0f5c	5250	Solkan
00050000-55f8-1be1-f098-ca07cc939954	4229	Sorica
00050000-55f8-1be1-2741-105916c13f6f	4225	Sovodenj
00050000-55f8-1be1-29bb-248165065369	5281	Spodnja Idrija
00050000-55f8-1be1-c6d5-c11ca030da98	2241	Spodnji Duplek
00050000-55f8-1be1-f56a-9793d1de36ba	9245	Spodnji Ivanjci
00050000-55f8-1be1-3ab0-87c50e5a2f0e	2277	Središče ob Dravi
00050000-55f8-1be1-0ec4-b4902c0e4707	4267	Srednja vas v Bohinju
00050000-55f8-1be1-6c41-be4673f0942e	8256	Sromlje 
00050000-55f8-1be1-ec47-691d5dabdc28	5224	Srpenica
00050000-55f8-1be1-d680-197e0fb8b7eb	1242	Stahovica
00050000-55f8-1be1-0fd6-fe521ecdfa3d	1332	Stara Cerkev
00050000-55f8-1be1-216d-f52e0b044b99	8342	Stari trg ob Kolpi
00050000-55f8-1be1-744b-d5d992f5386e	1386	Stari trg pri Ložu
00050000-55f8-1be1-a3c9-cadf9ee2b524	2205	Starše
00050000-55f8-1be1-782c-8cdf0871dfe8	2289	Stoperce
00050000-55f8-1be1-490a-b879b3018292	8322	Stopiče
00050000-55f8-1be1-3fd8-9c2f75be8751	3206	Stranice
00050000-55f8-1be1-0f51-9754f533952e	8351	Straža
00050000-55f8-1be1-ef08-654f1342b8f9	1313	Struge
00050000-55f8-1be1-31ba-a2b9ad850d05	8293	Studenec
00050000-55f8-1be1-69b1-ecb095f42474	8331	Suhor
00050000-55f8-1be1-968f-5e96a4ed5f6d	2233	Sv. Ana v Slovenskih goricah
00050000-55f8-1be1-47bd-594acfbfa8a5	2235	Sv. Trojica v Slovenskih goricah
00050000-55f8-1be1-6091-ce5c496d21ac	2353	Sveti Duh na Ostrem Vrhu
00050000-55f8-1be1-b613-dc431937a19b	9244	Sveti Jurij ob Ščavnici
00050000-55f8-1be1-24dc-804391d6b106	3264	Sveti Štefan
00050000-55f8-1be1-1ecb-4a7e7eff0a76	2258	Sveti Tomaž
00050000-55f8-1be1-c1a6-f363ee1ce45a	9204	Šalovci
00050000-55f8-1be1-5e6c-2e477de4126c	5261	Šempas
00050000-55f8-1be1-20dd-5d0a6d018714	5290	Šempeter pri Gorici
00050000-55f8-1be1-ba28-eb31ca14706a	3311	Šempeter v Savinjski dolini
00050000-55f8-1be1-3eb3-617f25555185	4208	Šenčur
00050000-55f8-1be1-463c-9f98c1cda209	2212	Šentilj v Slovenskih goricah
00050000-55f8-1be1-85d5-7d859d93b252	8297	Šentjanž
00050000-55f8-1be1-d27d-5faefb8d2e00	2373	Šentjanž pri Dravogradu
00050000-55f8-1be1-184a-d2cb4ab789a8	8310	Šentjernej
00050000-55f8-1be1-6fab-e9547c1df84d	3230	Šentjur
00050000-55f8-1be1-349b-74bf8cc55263	3271	Šentrupert
00050000-55f8-1be1-870c-cecafba7fedb	8232	Šentrupert
00050000-55f8-1be1-2cd9-fa7dc2ed1d2e	1296	Šentvid pri Stični
00050000-55f8-1be1-9bf9-72a0936560d3	8275	Škocjan
00050000-55f8-1be1-6ca3-07cb623caa63	6281	Škofije
00050000-55f8-1be1-bde0-391494b73b29	4220	Škofja Loka
00050000-55f8-1be1-7fe6-e3966157163c	3211	Škofja vas
00050000-55f8-1be1-50af-1765cc847717	1291	Škofljica
00050000-55f8-1be1-218f-dc4351c0417d	6274	Šmarje
00050000-55f8-1be1-2e46-aae7b47664ef	1293	Šmarje - Sap
00050000-55f8-1be1-198c-acfbd23770bf	3240	Šmarje pri Jelšah
00050000-55f8-1be1-e3a2-06ec96a3eb7d	8220	Šmarješke Toplice
00050000-55f8-1be1-b53e-8fcca50b5612	2315	Šmartno na Pohorju
00050000-55f8-1be1-55a9-7a9183aada31	3341	Šmartno ob Dreti
00050000-55f8-1be1-d46c-7d3145757aa3	3327	Šmartno ob Paki
00050000-55f8-1be1-7214-fd7af78fa5bc	1275	Šmartno pri Litiji
00050000-55f8-1be1-49bb-9647086760fd	2383	Šmartno pri Slovenj Gradcu
00050000-55f8-1be1-7d94-dd84b3ece43e	3201	Šmartno v Rožni dolini
00050000-55f8-1be1-89be-601023e15921	3325	Šoštanj
00050000-55f8-1be1-e6a7-4230595aa604	6222	Štanjel
00050000-55f8-1be1-a22d-d2520f5df4c1	3220	Štore
00050000-55f8-1be1-672d-11c330ea7278	3304	Tabor
00050000-55f8-1be1-5ae2-787be1d0c3a6	3221	Teharje
00050000-55f8-1be1-9321-40b89b5e7a3c	9251	Tišina
00050000-55f8-1be1-f64b-f0bee1ba1829	5220	Tolmin
00050000-55f8-1be1-2d03-c63527af3802	3326	Topolšica
00050000-55f8-1be1-495d-271483c748a1	2371	Trbonje
00050000-55f8-1be1-46a7-f853db8464ab	1420	Trbovlje
00050000-55f8-1be1-fcfb-9fb03fb1e8c6	8231	Trebelno 
00050000-55f8-1be1-41c7-6727cf9ad232	8210	Trebnje
00050000-55f8-1be1-229f-588f1dc03a9a	5252	Trnovo pri Gorici
00050000-55f8-1be1-698c-53d8a21cb2a5	2254	Trnovska vas
00050000-55f8-1be1-bb70-623144d7d1b3	1222	Trojane
00050000-55f8-1be1-7c5a-bfe41bec956d	1236	Trzin
00050000-55f8-1be1-3b92-a5c61244a7d0	4290	Tržič
00050000-55f8-1be1-28ef-3c4d9ee77fea	8295	Tržišče
00050000-55f8-1be1-8c88-5bdc1abe1840	1311	Turjak
00050000-55f8-1be1-7378-80f3ed920232	9224	Turnišče
00050000-55f8-1be1-39ff-81dd90322e4b	8323	Uršna sela
00050000-55f8-1be1-de6c-0086824fdf5b	1252	Vače
00050000-55f8-1be1-3b83-7f739756582d	3320	Velenje 
00050000-55f8-1be1-21cd-fee3b16ddc73	3322	Velenje - poštni predali
00050000-55f8-1be1-ef12-514748aa458d	8212	Velika Loka
00050000-55f8-1be1-9640-9651a4951e2a	2274	Velika Nedelja
00050000-55f8-1be1-1307-2d7457fc133f	9225	Velika Polana
00050000-55f8-1be1-b260-70b40e01995c	1315	Velike Lašče
00050000-55f8-1be1-48e7-00e9cc15cf79	8213	Veliki Gaber
00050000-55f8-1be1-edb8-c14cb59dce63	9241	Veržej
00050000-55f8-1be1-7485-c981b60cd7d0	1312	Videm - Dobrepolje
00050000-55f8-1be1-343f-a9ed5f68ee22	2284	Videm pri Ptuju
00050000-55f8-1be1-3cd4-92211742d314	8344	Vinica
00050000-55f8-1be1-ccd6-b7b972915d72	5271	Vipava
00050000-55f8-1be1-13d8-8e607b1675ad	4212	Visoko
00050000-55f8-1be1-7031-c61823db6ae6	1294	Višnja Gora
00050000-55f8-1be1-f44f-7d6a0352df83	3205	Vitanje
00050000-55f8-1be1-b625-391fac62aea6	2255	Vitomarci
00050000-55f8-1be1-73e0-3033258538c4	1217	Vodice
00050000-55f8-1be1-a761-8cd49462d124	3212	Vojnik\t
00050000-55f8-1be1-64ca-751a1ffd8872	5293	Volčja Draga
00050000-55f8-1be1-0340-90c27af79d69	2232	Voličina
00050000-55f8-1be1-c168-e37840f27f81	3305	Vransko
00050000-55f8-1be1-2319-acbd5fe235ed	6217	Vremski Britof
00050000-55f8-1be1-a50c-b82655f3ff47	1360	Vrhnika
00050000-55f8-1be1-b7e9-c377e62d6903	2365	Vuhred
00050000-55f8-1be1-f23f-ce0c91f56961	2367	Vuzenica
00050000-55f8-1be1-fe43-c4cbdcab329c	8292	Zabukovje 
00050000-55f8-1be1-c604-b46acdede358	1410	Zagorje ob Savi
00050000-55f8-1be1-3f0b-ae5f4debf8d7	1303	Zagradec
00050000-55f8-1be1-0fff-eb5c1345b01c	2283	Zavrč
00050000-55f8-1be1-81f6-699a7c7f5c4e	8272	Zdole 
00050000-55f8-1be1-1087-1dd61da245b7	4201	Zgornja Besnica
00050000-55f8-1be1-5f19-77dcb22b2aee	2242	Zgornja Korena
00050000-55f8-1be1-cdf6-38667b9b34ec	2201	Zgornja Kungota
00050000-55f8-1be1-d29b-b087d083359f	2316	Zgornja Ložnica
00050000-55f8-1be1-8248-848784ffd1e5	2314	Zgornja Polskava
00050000-55f8-1be1-5c84-fcfd4fae5222	2213	Zgornja Velka
00050000-55f8-1be1-2f1e-cdb4b9f7dc72	4247	Zgornje Gorje
00050000-55f8-1be1-f678-680d4d636b37	4206	Zgornje Jezersko
00050000-55f8-1be1-bc6b-010e1ecc5840	2285	Zgornji Leskovec
00050000-55f8-1be1-4764-8621444f9628	1432	Zidani Most
00050000-55f8-1be1-eb83-c25cbbb314cd	3214	Zreče
00050000-55f8-1be1-e001-315bbc7f1f42	4209	Žabnica
00050000-55f8-1be1-57a7-a8c588558d64	3310	Žalec
00050000-55f8-1be1-0118-d10cee2abe2a	4228	Železniki
00050000-55f8-1be1-f532-637e5e33f530	2287	Žetale
00050000-55f8-1be1-142f-b4b6195e861a	4226	Žiri
00050000-55f8-1be1-ed70-ea9dcee3c084	4274	Žirovnica
00050000-55f8-1be1-5d7b-7aec69815fd0	8360	Žužemberk
\.


--
-- TOC entry 2932 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19602716)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19602348)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 19602158)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f8-1be3-a7d5-7e8df1c07fba	00080000-55f8-1be3-0fe0-9477df6af0d9	\N	00040000-55f8-1be1-db11-d29606646aad	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f8-1be3-08ee-405ce8a2d41a	00080000-55f8-1be3-0fe0-9477df6af0d9	\N	00040000-55f8-1be1-db11-d29606646aad	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f8-1be3-c1c0-84a4d2610a74	00080000-55f8-1be3-5cc6-20b3904fac8e	\N	00040000-55f8-1be1-db11-d29606646aad	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2954 (class 0 OID 19602236)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19602360)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19602730)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 19602740)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f8-1be3-5e59-35bf23ba7d3b	00080000-55f8-1be3-0100-9e0c64ac2567	0987	AK
00190000-55f8-1be3-eea0-5c3c49db171a	00080000-55f8-1be3-5cc6-20b3904fac8e	0989	AK
00190000-55f8-1be3-4593-5b377daaa164	00080000-55f8-1be3-8e91-80ed66235693	0986	AK
00190000-55f8-1be3-7085-9c1bf4281fba	00080000-55f8-1be3-edea-41b954f47df9	0984	AK
00190000-55f8-1be3-4dba-59afd7f42b39	00080000-55f8-1be3-b63f-23a8644418dc	0983	AK
00190000-55f8-1be3-beea-39ac93520fcf	00080000-55f8-1be3-a734-186eedbef536	0982	AK
00190000-55f8-1be4-01fd-6d24266d8aff	00080000-55f8-1be4-3c1e-3aae3baec840	1001	AK
\.


--
-- TOC entry 2990 (class 0 OID 19602673)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f8-1be3-39bc-ba592807cbc9	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2994 (class 0 OID 19602748)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 19602389)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f8-1be3-0455-8c7a55fb75a9	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f8-1be3-07ee-575d693db68d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f8-1be3-7580-6446d6a42c13	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f8-1be3-2e26-c89c0fb97148	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f8-1be3-816b-c4d55b12da91	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f8-1be3-2bd2-24a82eb525a4	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f8-1be3-ca17-3c0b9a6bc697	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2963 (class 0 OID 19602333)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 19602323)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 19602526)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 19602463)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 19602031)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f8-1be4-3c1e-3aae3baec840	00010000-55f8-1be2-4621-6c0953bdf2cf	2015-09-15 15:23:48	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f8-1be4-b3d9-2dfe054ac20e	00010000-55f8-1be2-4621-6c0953bdf2cf	2015-09-15 15:23:48	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f8-1be4-01fd-6d24266d8aff	00010000-55f8-1be2-4621-6c0953bdf2cf	2015-09-15 15:23:48	INS	a:0:{}
\.


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2972 (class 0 OID 19602402)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 19602069)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f8-1be2-ca3f-e3feae9ccf7c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f8-1be2-d873-5465238746fe	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f8-1be2-3a61-5fe5c798fc8f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f8-1be2-bd95-a07a9d950cb1	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f8-1be2-a5e6-1e2356e2b05c	planer	Planer dogodkov v koledarju	t
00020000-55f8-1be2-7aa8-cba57f9f3c8f	kadrovska	Kadrovska služba	t
00020000-55f8-1be2-73df-32e8382eeea5	arhivar	Ažuriranje arhivalij	t
00020000-55f8-1be2-604f-5409d0c7561f	igralec	Igralec	t
00020000-55f8-1be2-4e77-f22219101273	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f8-1be3-ddb7-26409512d0cd	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2939 (class 0 OID 19602053)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f8-1be2-a4f0-a3edb9219dfc	00020000-55f8-1be2-3a61-5fe5c798fc8f
00010000-55f8-1be2-4621-6c0953bdf2cf	00020000-55f8-1be2-3a61-5fe5c798fc8f
00010000-55f8-1be3-4416-f8c191eea2c7	00020000-55f8-1be3-ddb7-26409512d0cd
\.


--
-- TOC entry 2974 (class 0 OID 19602416)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19602354)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 19602300)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 19602018)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f8-1be1-4c04-ec8504459000	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f8-1be1-8c9a-1c80f9a50f6e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f8-1be1-f8bf-31de8e3f67e4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f8-1be1-0b27-24e61d93eb04	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f8-1be1-f253-ca292b661082	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2934 (class 0 OID 19602010)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f8-1be1-5a30-28643eaa46b8	00230000-55f8-1be1-0b27-24e61d93eb04	popa
00240000-55f8-1be1-c33f-879958b294c1	00230000-55f8-1be1-0b27-24e61d93eb04	oseba
00240000-55f8-1be1-306a-2722097fe582	00230000-55f8-1be1-0b27-24e61d93eb04	sezona
00240000-55f8-1be1-2f15-aaf5c887a4b5	00230000-55f8-1be1-8c9a-1c80f9a50f6e	prostor
00240000-55f8-1be1-067b-8db325ae6451	00230000-55f8-1be1-0b27-24e61d93eb04	besedilo
00240000-55f8-1be1-c632-aa3a2c39f93f	00230000-55f8-1be1-0b27-24e61d93eb04	uprizoritev
00240000-55f8-1be1-a38c-bf5971c65331	00230000-55f8-1be1-0b27-24e61d93eb04	funkcija
00240000-55f8-1be1-2d88-30dd3389e110	00230000-55f8-1be1-0b27-24e61d93eb04	tipfunkcije
00240000-55f8-1be1-97e9-4495d1162eb7	00230000-55f8-1be1-0b27-24e61d93eb04	alternacija
00240000-55f8-1be1-3bf5-b59e92da3b39	00230000-55f8-1be1-4c04-ec8504459000	pogodba
00240000-55f8-1be1-1c6f-7f224b6e575a	00230000-55f8-1be1-0b27-24e61d93eb04	zaposlitev
00240000-55f8-1be1-1f2d-41556a154d7d	00230000-55f8-1be1-0b27-24e61d93eb04	zvrstuprizoritve
00240000-55f8-1be1-dee6-58e01d2198b3	00230000-55f8-1be1-4c04-ec8504459000	programdela
00240000-55f8-1be1-9d44-acbf81a7fd2d	00230000-55f8-1be1-0b27-24e61d93eb04	zapis
\.


--
-- TOC entry 2933 (class 0 OID 19602005)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
8af17237-1ac8-4b9d-8d8c-e2d76de38930	00240000-55f8-1be1-5a30-28643eaa46b8	0	1001
\.


--
-- TOC entry 2979 (class 0 OID 19602473)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f8-1be3-0610-847d699ad372	000e0000-55f8-1be3-1d06-c13075a97c11	00080000-55f8-1be3-0fe0-9477df6af0d9	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f8-1be2-4fa9-3b5fcbdbabe0
00270000-55f8-1be3-30b0-93c85bdcedc8	000e0000-55f8-1be3-1d06-c13075a97c11	00080000-55f8-1be3-0fe0-9477df6af0d9	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f8-1be2-4fa9-3b5fcbdbabe0
\.


--
-- TOC entry 2946 (class 0 OID 19602131)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19602310)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f8-1be4-4338-6ee488aa17e1	00180000-55f8-1be3-942d-6785259aace1	000c0000-55f8-1be3-4c59-ae02391aec74	00090000-55f8-1be3-0dc9-6b7b065d28d6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f8-1be4-8d6a-8b23bf3f92c3	00180000-55f8-1be3-942d-6785259aace1	000c0000-55f8-1be3-1a4d-759576c1b1c2	00090000-55f8-1be3-3448-aa7f1b4bca5c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f8-1be4-1c28-76e99d79d0d4	00180000-55f8-1be3-942d-6785259aace1	000c0000-55f8-1be3-bb21-46bffd8f9314	00090000-55f8-1be3-a02d-011761e9dec2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f8-1be4-36fd-449a8805211b	00180000-55f8-1be3-942d-6785259aace1	000c0000-55f8-1be3-dd72-0cfc8455b604	00090000-55f8-1be3-592b-92bd316e97d6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f8-1be4-6b41-c5f377d0f2de	00180000-55f8-1be3-942d-6785259aace1	000c0000-55f8-1be3-1fd9-b69705ecb8a8	00090000-55f8-1be3-4e5b-622b9a8f37b5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f8-1be4-05b4-f8b29e9e4035	00180000-55f8-1be3-7305-0d9bb74b2c53	\N	00090000-55f8-1be3-4e5b-622b9a8f37b5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2982 (class 0 OID 19602514)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f8-1be1-3098-517fc4d878f9	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f8-1be1-f927-5fccc941216c	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f8-1be1-8f21-233d3071c522	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f8-1be1-db10-95dad595043d	04	Režija	Režija	Režija	umetnik
000f0000-55f8-1be1-b4e9-2876ae1d5ffb	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f8-1be1-e43f-33b94232a63c	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f8-1be1-2b9d-ecdba83f5895	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f8-1be1-dc61-9980a5827894	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f8-1be1-12b0-cb4242335dbd	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f8-1be1-6a35-db433b1dd7e1	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f8-1be1-beed-b505a0ce1074	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f8-1be1-6597-cec32ec1f011	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f8-1be1-68e2-699f1abe403a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f8-1be1-e36b-07a3952292b3	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f8-1be1-79c2-d4260b6a0054	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f8-1be1-85a8-50e71589cdbc	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f8-1be1-807a-a33e1cdfeee4	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f8-1be1-2541-2468d9781d35	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2995 (class 0 OID 19602758)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f8-1be1-e5a5-f96fb9b3ed45	01	Velika predstava	f	1.00	1.00
002b0000-55f8-1be1-af99-c93a63dee465	02	Mala predstava	f	0.50	0.50
002b0000-55f8-1be1-f0c2-e31dada73c72	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f8-1be1-fb3a-e58d0993efc1	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f8-1be1-9177-7c2d5711ad29	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2951 (class 0 OID 19602193)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 19602040)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f8-1be2-4621-6c0953bdf2cf	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROF8dq9HKM1jhxqJ5/tdhQQLq7QPnTiza	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f8-1be3-8c35-6900bfd881b1	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f8-1be3-497e-dfcc28badf34	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f8-1be3-ead9-1dc5f70af77b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f8-1be3-4373-d06874deb1eb	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f8-1be3-cc06-3376d03dc13b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f8-1be3-8e9b-c6f9485388cd	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f8-1be3-0b6a-f0d2df506525	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f8-1be3-219b-2a6b81e2848b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f8-1be3-1486-f7e31ea0c65b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f8-1be3-4416-f8c191eea2c7	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f8-1be2-a4f0-a3edb9219dfc	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2986 (class 0 OID 19602563)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f8-1be3-6c87-a2add7847392	00160000-55f8-1be3-c77a-9a4bfdb4bf27	\N	00140000-55f8-1be1-a065-5c50011578c6	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f8-1be3-816b-c4d55b12da91
000e0000-55f8-1be3-1d06-c13075a97c11	00160000-55f8-1be3-dcd2-405151cc46c6	\N	00140000-55f8-1be1-80f7-f8a5002bb6df	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f8-1be3-2bd2-24a82eb525a4
000e0000-55f8-1be3-e47b-d04719167cd4	\N	\N	00140000-55f8-1be1-80f7-f8a5002bb6df	00190000-55f8-1be3-5e59-35bf23ba7d3b	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f8-1be3-816b-c4d55b12da91
000e0000-55f8-1be3-2e0a-da529415cffa	\N	\N	00140000-55f8-1be1-80f7-f8a5002bb6df	00190000-55f8-1be3-5e59-35bf23ba7d3b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f8-1be3-816b-c4d55b12da91
000e0000-55f8-1be3-35d2-009d0fde1ee0	\N	\N	00140000-55f8-1be1-80f7-f8a5002bb6df	00190000-55f8-1be3-5e59-35bf23ba7d3b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f8-1be3-0455-8c7a55fb75a9
000e0000-55f8-1be3-edb2-131733ebb5af	\N	\N	00140000-55f8-1be1-80f7-f8a5002bb6df	00190000-55f8-1be3-5e59-35bf23ba7d3b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f8-1be3-0455-8c7a55fb75a9
\.


--
-- TOC entry 2956 (class 0 OID 19602254)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f8-1be3-109f-fc276b4b4bdc	000e0000-55f8-1be3-1d06-c13075a97c11	\N	1	
00200000-55f8-1be3-f8e0-3a6996232693	000e0000-55f8-1be3-1d06-c13075a97c11	\N	2	
00200000-55f8-1be3-ae9c-529dd0f0706d	000e0000-55f8-1be3-1d06-c13075a97c11	\N	3	
00200000-55f8-1be3-06e3-a36909ce8b43	000e0000-55f8-1be3-1d06-c13075a97c11	\N	4	
00200000-55f8-1be3-98c5-16dfad8d3f81	000e0000-55f8-1be3-1d06-c13075a97c11	\N	5	
\.


--
-- TOC entry 2970 (class 0 OID 19602381)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 19602487)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f8-1be2-6152-fbc82da1b0ed	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f8-1be2-26d4-f2c76dded03a	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f8-1be2-38f8-22e0f405d502	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f8-1be2-07cd-2a328aaf8136	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f8-1be2-d3c3-5cce762a2d6f	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f8-1be2-b8d0-cb1a9607d914	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f8-1be2-7428-d2a2a971b2a5	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f8-1be2-78ca-d0d80baa8794	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f8-1be2-4fa9-3b5fcbdbabe0	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f8-1be2-833f-7718a63724fe	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f8-1be2-d211-37067c78ed2f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f8-1be2-b9fe-f0bd8aa6bb47	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f8-1be2-5543-2b66f517011a	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f8-1be2-749e-eb73fa2263b3	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f8-1be2-9f92-9baf77426a17	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f8-1be2-f8f4-2521e6026cd7	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f8-1be2-2541-a5c322d02321	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f8-1be2-bea8-0bea4402a241	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f8-1be2-29d7-85559b9f57d1	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f8-1be2-3d17-a0938abb93bc	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f8-1be2-fd3b-9f19ac7f7b3d	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f8-1be2-4ba4-f90095055fc6	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f8-1be2-096b-4a189a225669	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f8-1be2-b73c-8a9d6724b086	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f8-1be2-26ac-1ae58764d9b5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f8-1be2-8538-4c37601fc03d	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f8-1be2-fea2-b8a2df3fe6b0	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f8-1be2-0595-a8379e0e0622	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2998 (class 0 OID 19602805)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 19602777)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 19602817)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19602453)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f8-1be3-40c0-c349488bf6f1	00090000-55f8-1be3-3448-aa7f1b4bca5c	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f8-1be3-ecfb-dfa7c0496409	00090000-55f8-1be3-a02d-011761e9dec2	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f8-1be3-21f6-7241a238a06e	00090000-55f8-1be3-3ab4-e8b569128ad9	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f8-1be3-3168-519c94b4d0f6	00090000-55f8-1be3-13f4-170465d150e3	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f8-1be3-3d21-05afd185cfa4	00090000-55f8-1be3-0dc9-6b7b065d28d6	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f8-1be3-88b1-cdaf0c211717	00090000-55f8-1be3-5baf-f6dcc0dc0e6e	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2958 (class 0 OID 19602290)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 19602553)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f8-1be1-a065-5c50011578c6	01	Drama	drama (SURS 01)
00140000-55f8-1be1-e76e-c620557fe5e2	02	Opera	opera (SURS 02)
00140000-55f8-1be1-f472-668d24d4f5f0	03	Balet	balet (SURS 03)
00140000-55f8-1be1-28b2-9dc0a4474f26	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f8-1be1-e3b0-bbb545d7322c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f8-1be1-80f7-f8a5002bb6df	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f8-1be1-e075-c8b3ee9d42b3	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2976 (class 0 OID 19602443)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 19602094)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 19602612)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 19602602)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 19602512)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 19602857)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 19602279)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 19602299)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 19602775)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19602219)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 19602667)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 19602439)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 19602252)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 19602233)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 19602346)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 19602834)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 19602841)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2724 (class 2606 OID 19602865)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 19602373)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 19602191)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 19602103)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 19602127)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 19602083)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 19602068)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 19602379)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 19602415)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 19602548)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19602155)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19602179)
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
-- TOC entry 2679 (class 2606 OID 19602728)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 19602352)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 19602169)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19602240)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 19602364)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 19602737)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 19602745)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 19602715)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 19602756)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 19602397)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 19602337)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 19602328)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 19602536)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 19602470)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 19602039)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 19602406)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 19602057)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 19602077)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 19602424)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 19602359)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 19602308)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 19602027)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19602015)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 19602009)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 19602483)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 19602136)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 19602319)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 19602523)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 19602768)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 19602204)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 19602052)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 19602581)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 19602262)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 19602387)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 19602495)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 19602815)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 19602799)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 19602823)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 19602461)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 19602294)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 19602561)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 19602451)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 19602288)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 19602289)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 19602287)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 19602286)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 19602285)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2624 (class 1259 OID 19602484)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 19602485)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 19602486)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2710 (class 1259 OID 19602836)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2711 (class 1259 OID 19602835)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 19602157)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 19602380)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2697 (class 1259 OID 19602803)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2698 (class 1259 OID 19602802)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2699 (class 1259 OID 19602804)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2700 (class 1259 OID 19602801)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2701 (class 1259 OID 19602800)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 19602366)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 19602365)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 19602263)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 19602440)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19602442)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 19602441)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 19602235)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 19602234)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 19602757)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 19602550)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 19602551)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 19602552)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2707 (class 1259 OID 19602824)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 19602586)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 19602583)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 19602587)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 19602585)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 19602584)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 19602206)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 19602205)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 19602130)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 19602407)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 19602084)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 19602085)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 19602427)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 19602426)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 19602425)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 19602241)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 19602242)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 19602017)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 19602332)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 19602330)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 19602329)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 19602331)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 19602058)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 19602059)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 19602388)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2720 (class 1259 OID 19602858)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2721 (class 1259 OID 19602866)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2722 (class 1259 OID 19602867)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 19602353)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 19602471)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 19602472)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 19602672)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 19602671)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 19602668)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 19602669)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 19602670)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 19602171)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 19602170)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 19602172)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 19602401)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 19602400)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 19602738)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 19602739)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 19602616)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 19602617)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 19602614)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 19602615)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 19602462)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 19602341)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 19602340)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 19602338)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 19602339)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 19602604)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 19602603)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 19602253)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 19602729)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2696 (class 1259 OID 19602776)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2714 (class 1259 OID 19602842)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2715 (class 1259 OID 19602843)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 19602105)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 19602104)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 19602137)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19602138)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 19602322)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 19602321)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 19602320)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 19602281)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2545 (class 1259 OID 19602282)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2546 (class 1259 OID 19602280)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2547 (class 1259 OID 19602284)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2548 (class 1259 OID 19602283)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 19602156)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 19602220)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19602222)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 19602221)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 19602223)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 19602347)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 19602549)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 19602582)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 19602524)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19602525)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 19602128)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 19602129)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 19602452)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 19602028)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19602192)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 19602016)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2693 (class 1259 OID 19602769)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 19602399)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 19602398)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 19602613)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 19602180)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 19602562)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 19602816)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 19602746)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 19602747)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 19602513)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 19602309)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 19602078)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2753 (class 2606 OID 19602988)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2752 (class 2606 OID 19602993)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2748 (class 2606 OID 19603013)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2754 (class 2606 OID 19602983)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2750 (class 2606 OID 19603003)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2749 (class 2606 OID 19603008)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2751 (class 2606 OID 19602998)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2786 (class 2606 OID 19603163)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2785 (class 2606 OID 19603168)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2784 (class 2606 OID 19603173)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2818 (class 2606 OID 19603338)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2819 (class 2606 OID 19603333)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2736 (class 2606 OID 19602923)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2770 (class 2606 OID 19603093)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2813 (class 2606 OID 19603318)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 19603313)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2812 (class 2606 OID 19603323)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2815 (class 2606 OID 19603308)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2816 (class 2606 OID 19603303)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2768 (class 2606 OID 19603088)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2769 (class 2606 OID 19603083)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2747 (class 2606 OID 19602978)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2780 (class 2606 OID 19603133)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2778 (class 2606 OID 19603143)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2779 (class 2606 OID 19603138)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2742 (class 2606 OID 19602958)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2743 (class 2606 OID 19602953)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 19603073)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 19603293)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2789 (class 2606 OID 19603178)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 19603183)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2787 (class 2606 OID 19603188)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2817 (class 2606 OID 19603328)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2791 (class 2606 OID 19603208)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2794 (class 2606 OID 19603193)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2790 (class 2606 OID 19603213)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2792 (class 2606 OID 19603203)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2793 (class 2606 OID 19603198)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2740 (class 2606 OID 19602948)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2741 (class 2606 OID 19602943)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 19602908)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2733 (class 2606 OID 19602903)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2774 (class 2606 OID 19603113)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2729 (class 2606 OID 19602883)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2728 (class 2606 OID 19602888)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2775 (class 2606 OID 19603128)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2776 (class 2606 OID 19603123)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2777 (class 2606 OID 19603118)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2745 (class 2606 OID 19602963)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2744 (class 2606 OID 19602968)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2725 (class 2606 OID 19602868)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2758 (class 2606 OID 19603048)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2760 (class 2606 OID 19603038)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2761 (class 2606 OID 19603033)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2759 (class 2606 OID 19603043)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2727 (class 2606 OID 19602873)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2726 (class 2606 OID 19602878)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2771 (class 2606 OID 19603098)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2822 (class 2606 OID 19603353)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2824 (class 2606 OID 19603358)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2823 (class 2606 OID 19603363)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2767 (class 2606 OID 19603078)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2783 (class 2606 OID 19603153)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2782 (class 2606 OID 19603158)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2801 (class 2606 OID 19603268)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2802 (class 2606 OID 19603263)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 19603248)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 19603253)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2803 (class 2606 OID 19603258)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2738 (class 2606 OID 19602933)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2739 (class 2606 OID 19602928)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 19602938)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2772 (class 2606 OID 19603108)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2773 (class 2606 OID 19603103)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2808 (class 2606 OID 19603278)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2807 (class 2606 OID 19603283)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2798 (class 2606 OID 19603238)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2797 (class 2606 OID 19603243)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2800 (class 2606 OID 19603228)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2799 (class 2606 OID 19603233)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2781 (class 2606 OID 19603148)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2762 (class 2606 OID 19603068)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2763 (class 2606 OID 19603063)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2765 (class 2606 OID 19603053)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2764 (class 2606 OID 19603058)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2795 (class 2606 OID 19603223)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2796 (class 2606 OID 19603218)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2746 (class 2606 OID 19602973)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2806 (class 2606 OID 19603273)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2809 (class 2606 OID 19603288)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2811 (class 2606 OID 19603298)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2821 (class 2606 OID 19603343)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2820 (class 2606 OID 19603348)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2730 (class 2606 OID 19602898)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2731 (class 2606 OID 19602893)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2735 (class 2606 OID 19602913)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2734 (class 2606 OID 19602918)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2755 (class 2606 OID 19603028)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2756 (class 2606 OID 19603023)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2757 (class 2606 OID 19603018)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-15 15:23:49 CEST

--
-- PostgreSQL database dump complete
--

