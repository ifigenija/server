--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-14 16:40:58 CEST

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
-- TOC entry 181 (class 1259 OID 19356158)
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
-- TOC entry 226 (class 1259 OID 19356677)
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
-- TOC entry 225 (class 1259 OID 19356660)
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
-- TOC entry 219 (class 1259 OID 19356568)
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
-- TOC entry 240 (class 1259 OID 19356915)
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
-- TOC entry 195 (class 1259 OID 19356336)
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
-- TOC entry 197 (class 1259 OID 19356367)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19356841)
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
-- TOC entry 190 (class 1259 OID 19356279)
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
-- TOC entry 227 (class 1259 OID 19356690)
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
-- TOC entry 213 (class 1259 OID 19356500)
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
-- TOC entry 193 (class 1259 OID 19356315)
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
-- TOC entry 191 (class 1259 OID 19356296)
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
-- TOC entry 202 (class 1259 OID 19356414)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19356896)
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
-- TOC entry 239 (class 1259 OID 19356908)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19356930)
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
-- TOC entry 206 (class 1259 OID 19356439)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19356253)
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
-- TOC entry 182 (class 1259 OID 19356167)
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
-- TOC entry 183 (class 1259 OID 19356178)
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
-- TOC entry 178 (class 1259 OID 19356132)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19356151)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19356446)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19356480)
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
-- TOC entry 222 (class 1259 OID 19356609)
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
-- TOC entry 185 (class 1259 OID 19356211)
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
-- TOC entry 187 (class 1259 OID 19356245)
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
-- TOC entry 229 (class 1259 OID 19356788)
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
-- TOC entry 203 (class 1259 OID 19356420)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19356230)
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
-- TOC entry 192 (class 1259 OID 19356308)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 19356432)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19356802)
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
-- TOC entry 231 (class 1259 OID 19356812)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19356745)
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
-- TOC entry 232 (class 1259 OID 19356820)
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
-- TOC entry 209 (class 1259 OID 19356461)
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
-- TOC entry 201 (class 1259 OID 19356405)
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
-- TOC entry 200 (class 1259 OID 19356395)
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
-- TOC entry 221 (class 1259 OID 19356598)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19356535)
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
-- TOC entry 175 (class 1259 OID 19356103)
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
-- TOC entry 174 (class 1259 OID 19356101)
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
-- TOC entry 210 (class 1259 OID 19356474)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19356141)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19356125)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19356488)
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
-- TOC entry 204 (class 1259 OID 19356426)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19356372)
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
-- TOC entry 173 (class 1259 OID 19356090)
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
-- TOC entry 172 (class 1259 OID 19356082)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19356077)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19356545)
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
-- TOC entry 184 (class 1259 OID 19356203)
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
-- TOC entry 199 (class 1259 OID 19356382)
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
-- TOC entry 220 (class 1259 OID 19356586)
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
-- TOC entry 233 (class 1259 OID 19356830)
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
-- TOC entry 189 (class 1259 OID 19356265)
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
-- TOC entry 176 (class 1259 OID 19356112)
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
-- TOC entry 224 (class 1259 OID 19356635)
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
-- TOC entry 194 (class 1259 OID 19356326)
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
-- TOC entry 208 (class 1259 OID 19356453)
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
-- TOC entry 218 (class 1259 OID 19356559)
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
-- TOC entry 236 (class 1259 OID 19356876)
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
-- TOC entry 235 (class 1259 OID 19356848)
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
-- TOC entry 237 (class 1259 OID 19356888)
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
-- TOC entry 215 (class 1259 OID 19356525)
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
-- TOC entry 196 (class 1259 OID 19356362)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19356625)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19356515)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 19356106)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 19356158)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 19356677)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f6-dc78-78cd-326e99e6cb70	000d0000-55f6-dc78-19f0-171e9d8e45ce	\N	00090000-55f6-dc78-f641-d0448233c706	000b0000-55f6-dc78-555f-54779b2c3e38	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f6-dc78-d304-f9289ee9113c	000d0000-55f6-dc78-e5e9-43ade635f874	00100000-55f6-dc78-954d-42de221e065f	00090000-55f6-dc78-d348-706c6c62919e	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f6-dc78-8dc6-a6e6b25ef749	000d0000-55f6-dc78-b654-80c3a05511f6	00100000-55f6-dc78-7c39-a862576b3e3d	00090000-55f6-dc78-bde7-fb90342f7d9a	\N	0003	t	\N	2015-09-14	\N	2	t	\N	f	f
000c0000-55f6-dc78-9765-c3b7763373c2	000d0000-55f6-dc78-d9d6-3bc014cb5c19	\N	00090000-55f6-dc78-c4a8-3c25d96d4a30	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f6-dc78-5fb8-ddc3e171e319	000d0000-55f6-dc78-4a63-4274fc95fc3b	\N	00090000-55f6-dc78-7a9c-827f80f0c16c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f6-dc78-f40f-cb1dd968d591	000d0000-55f6-dc78-566b-37c814fea4d9	\N	00090000-55f6-dc78-eabf-171be5c8d5c1	000b0000-55f6-dc78-bb37-5eeb12caa0f1	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f6-dc78-66b3-b62c226f4fee	000d0000-55f6-dc78-5b9b-b03d13e468d4	00100000-55f6-dc78-1c46-15f6e68b1a41	00090000-55f6-dc78-51ee-2e0cf53447ab	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f6-dc78-af91-9d367927ba7e	000d0000-55f6-dc78-45f9-0744b902520f	\N	00090000-55f6-dc78-9f8c-46cc566e3c37	000b0000-55f6-dc78-aed8-acd8bcc2d555	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f6-dc78-2527-645f60f63b68	000d0000-55f6-dc78-5b9b-b03d13e468d4	00100000-55f6-dc78-8b25-d24d38f29492	00090000-55f6-dc78-55af-f77fb70ab3d6	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f6-dc78-be61-1ca0df8d23fd	000d0000-55f6-dc78-5b9b-b03d13e468d4	00100000-55f6-dc78-4db1-17bb285f3cd1	00090000-55f6-dc78-1e27-ecdc6855cde9	\N	0010	t	\N	2015-09-14	\N	16	f	\N	f	t
000c0000-55f6-dc78-2e27-438758a10dc4	000d0000-55f6-dc78-5b9b-b03d13e468d4	00100000-55f6-dc78-3c0b-c72ca03bffec	00090000-55f6-dc78-305d-730472dc455d	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f6-dc78-41e4-cb69ff336622	000d0000-55f6-dc78-d2ac-883a24afe69d	\N	00090000-55f6-dc78-d348-706c6c62919e	000b0000-55f6-dc78-7b2e-607e107723a0	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2986 (class 0 OID 19356660)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 19356568)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f6-dc77-b490-ba2156aec221	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f6-dc77-e7f8-6538ec56c6c3	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f6-dc77-66bd-52f5a3122934	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 19356915)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 19356336)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f6-dc78-7bd7-ced22eab2ce0	\N	\N	00200000-55f6-dc78-92e7-e61163436131	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f6-dc78-c458-f9fca1b1d5af	\N	\N	00200000-55f6-dc78-3c13-26a6b5a19b6c	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f6-dc78-bfac-d7a1438772f5	\N	\N	00200000-55f6-dc78-e0d4-b77dda0bce19	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f6-dc78-c32e-47a3bd9edf70	\N	\N	00200000-55f6-dc78-8e2f-584dd0ed1776	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f6-dc78-67f9-b5134ee04df8	\N	\N	00200000-55f6-dc78-b61e-422d9a8dabc2	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2958 (class 0 OID 19356367)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 19356841)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19356279)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f6-dc76-f245-1ac30a2f3660	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f6-dc76-967a-e842522d3c10	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f6-dc76-91a3-8661943c09d5	AL	ALB	008	Albania 	Albanija	\N
00040000-55f6-dc76-52ed-9af71c2613a0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f6-dc76-e0b1-f35a540b9cda	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f6-dc76-0693-457ea67d016f	AD	AND	020	Andorra 	Andora	\N
00040000-55f6-dc76-a326-144517e61b15	AO	AGO	024	Angola 	Angola	\N
00040000-55f6-dc76-a169-fa9b30958a25	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f6-dc76-08a4-425e9c2e30eb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f6-dc76-792d-b45d87b78a6e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f6-dc76-968e-fe1a8e037d0d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f6-dc76-ebb2-f8aaaa21a24a	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f6-dc76-7af3-ef3279ef555b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f6-dc76-01b4-df084091d46d	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f6-dc76-7aec-faa8b0300b67	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f6-dc76-c9a3-ec765e272974	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f6-dc76-dd1c-aa13372268bf	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f6-dc76-9ce3-d5e524d446bc	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f6-dc76-05ad-50f827d790d6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f6-dc76-0aa2-3250e7cfcab1	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f6-dc76-770b-5483ca1a707d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f6-dc76-b56c-2dbe4f638da4	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f6-dc76-0d19-9961b558ca47	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f6-dc76-3747-e96f35441528	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f6-dc76-b488-caaef743b34e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f6-dc76-88d6-d0c9fb38f445	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f6-dc76-4c4f-f4cc47313899	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f6-dc76-5a1c-710a629f26fd	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f6-dc76-96bb-77f2f1985800	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f6-dc76-b7f7-7a855d0af4d4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f6-dc76-4a91-cf9d9ca172b4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f6-dc76-2462-6e8806b16fd2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f6-dc76-5257-86f91c0af8f9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f6-dc76-a7f4-23df81cbbdeb	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f6-dc76-9716-c884264d9e65	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f6-dc76-2bbb-b98d5020ecf4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f6-dc76-7c3b-bc1a829cf189	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f6-dc76-0d4b-ccb0a5be0341	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f6-dc76-103b-7e9cf50fe7bc	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f6-dc76-a12a-88c45181d529	CA	CAN	124	Canada 	Kanada	\N
00040000-55f6-dc76-2671-a7b953e3fda0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f6-dc76-c22a-77ce30c4f032	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f6-dc76-10fa-7f140d556f1f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f6-dc76-9988-dc620d01e102	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f6-dc76-3b68-f624314f6a2f	CL	CHL	152	Chile 	Čile	\N
00040000-55f6-dc76-efdb-750577806990	CN	CHN	156	China 	Kitajska	\N
00040000-55f6-dc76-de59-aeca069467ba	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f6-dc76-2d56-6618cb985a11	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f6-dc76-9b45-f4fd1fe6e58d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f6-dc76-6aaf-3871db1bcef2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f6-dc76-75cd-bc6cab0f39e6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f6-dc76-309d-0b9de326747d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f6-dc76-8d9d-69f68a9f0e0b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f6-dc76-8318-6a7c438c09dc	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f6-dc76-e2fe-dc8c69bb0936	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f6-dc76-001d-de561b03396c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f6-dc76-8d57-2b3bf36f2e57	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f6-dc76-3ef5-7357862d7e8f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f6-dc76-9043-6ab9aec18f83	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f6-dc76-1680-5797b8be6acf	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f6-dc76-fe1a-d13688147233	DK	DNK	208	Denmark 	Danska	\N
00040000-55f6-dc76-540b-cc5428af0877	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f6-dc76-648f-bebe75aeaa34	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f6-dc76-fb7c-2c82283634ae	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f6-dc76-2c98-1ccab9769223	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f6-dc76-8717-9da4a9b2e09b	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f6-dc76-eba9-7c74d016795f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f6-dc76-fba2-c732ae661326	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f6-dc76-f1c6-ac74709de6e6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f6-dc76-7254-dbff11c4cdf3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f6-dc76-d516-0f8bd87e8fdf	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f6-dc76-c819-ecc1c201c2e4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f6-dc76-d2ce-6a4d359b8228	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f6-dc76-eabc-eb808c46c6c1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f6-dc76-084b-8815eff3b13b	FI	FIN	246	Finland 	Finska	\N
00040000-55f6-dc76-7961-26d618767ab3	FR	FRA	250	France 	Francija	\N
00040000-55f6-dc76-4267-8b7ced2947ac	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f6-dc76-c88d-f27d09eee531	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f6-dc76-949b-60b4ed8e5ab7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f6-dc76-5305-9b84cce50e23	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f6-dc76-788c-d32a2177a876	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f6-dc76-e13a-5814fa8839c8	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f6-dc76-bf07-95907241aa61	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f6-dc76-0cb9-99da2813024a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f6-dc76-1dd7-1181da537398	GH	GHA	288	Ghana 	Gana	\N
00040000-55f6-dc76-9930-39ceadb2b3b4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f6-dc76-76f2-662480e96efc	GR	GRC	300	Greece 	Grčija	\N
00040000-55f6-dc76-b4b5-6571e965b0e7	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f6-dc76-a009-3f2397a455f7	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f6-dc76-146e-b92e67c810a9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f6-dc76-a78a-dee239f44f09	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f6-dc76-cd01-7e819c6d6b38	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f6-dc76-979c-b3d6847702c7	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f6-dc76-0834-35275ab7cdee	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f6-dc76-c452-239ee3ee1fc2	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f6-dc76-1893-87ec3bec2f9b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f6-dc76-eae6-5185ad5e0257	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f6-dc76-a6ef-aa281c29cd75	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f6-dc76-380f-49bc3f289746	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f6-dc76-adf4-1d274a99a697	HN	HND	340	Honduras 	Honduras	\N
00040000-55f6-dc76-0955-0777d4a305fb	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f6-dc76-60c5-36d27967ef98	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f6-dc76-8be1-fcc0af66b444	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f6-dc76-ffca-867759738ec9	IN	IND	356	India 	Indija	\N
00040000-55f6-dc76-4d2f-e805f7ba6d26	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f6-dc76-5e97-e5a3a4207979	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f6-dc76-d80c-50c19cc6f541	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f6-dc76-3a14-a9b6f12da121	IE	IRL	372	Ireland 	Irska	\N
00040000-55f6-dc76-0f36-a452aa8d23b8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f6-dc76-380a-348a8cc41328	IL	ISR	376	Israel 	Izrael	\N
00040000-55f6-dc76-c175-317a0b37a9ac	IT	ITA	380	Italy 	Italija	\N
00040000-55f6-dc76-cbe0-188172cc88d5	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f6-dc76-9710-d1946eee507e	JP	JPN	392	Japan 	Japonska	\N
00040000-55f6-dc76-8081-ed226b9aefcf	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f6-dc76-ef36-ab8e684d33cb	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f6-dc76-1dc1-a9b4debcde70	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f6-dc76-680e-cec25e295381	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f6-dc76-5c58-bfe073eb2835	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f6-dc76-03e4-377c49e947c8	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f6-dc76-1c65-a979ce143b83	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f6-dc76-e55b-f2779fb23118	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f6-dc76-b4b1-056aed175dc4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f6-dc76-c343-fc4a0a961671	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f6-dc76-53ee-51ff50bee37d	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f6-dc76-44b5-692b955f1563	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f6-dc76-99e8-2575fed0ce44	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f6-dc76-0ee9-1fad95cf1a5f	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f6-dc76-90d3-afcd1cc6533f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f6-dc76-1d64-3f9ea9e54322	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f6-dc76-43b3-04b7868b0541	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f6-dc76-6e53-b728d9ccf610	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f6-dc76-f48b-fdafca1cfbeb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f6-dc76-909b-95a53c877141	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f6-dc76-f921-b89e78466d6d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f6-dc76-b3bf-2ecfb824d50b	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f6-dc76-608b-a88171f9028a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f6-dc76-3e8f-29787d8a7090	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f6-dc76-ee68-6e4e90b26801	ML	MLI	466	Mali 	Mali	\N
00040000-55f6-dc76-4e45-ae18a26ac7b6	MT	MLT	470	Malta 	Malta	\N
00040000-55f6-dc76-14a0-e580b8a5d4b7	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f6-dc76-0804-7c3a5d4a7f52	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f6-dc76-78f7-2e502f3bef96	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f6-dc76-013c-26c1e496826c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f6-dc76-9bc4-a485cf58d9b8	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f6-dc76-5c3d-e6dbae31575c	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f6-dc76-fcb4-25b34e121b69	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f6-dc76-cc86-eac86adafdbe	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f6-dc76-e2cd-70d142d9b70c	MC	MCO	492	Monaco 	Monako	\N
00040000-55f6-dc76-76c1-a2d29891fdd6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f6-dc76-3e05-46a48875e660	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f6-dc76-dafe-2c2272b28c25	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f6-dc76-96f3-a837a8305d2b	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f6-dc76-2451-0d32a96d0692	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f6-dc76-4262-8367a2c29353	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f6-dc76-9797-49e4b167b5e1	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f6-dc76-dfef-79173bd1fe98	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f6-dc76-b5d6-ece7e5a00929	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f6-dc76-ef63-1d27326582a8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f6-dc76-5a20-c822bd8cc416	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f6-dc76-3b93-29af87716d03	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f6-dc76-25c4-cd6e89bb58be	NE	NER	562	Niger 	Niger 	\N
00040000-55f6-dc76-f76e-eb43733b8a3f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f6-dc76-8228-bf1daa6a88a5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f6-dc76-3112-c7f49cead182	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f6-dc76-70c6-63bb8218fd57	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f6-dc76-1b09-cd3bda1e3c6b	NO	NOR	578	Norway 	Norveška	\N
00040000-55f6-dc76-9497-1c2171bbed6d	OM	OMN	512	Oman 	Oman	\N
00040000-55f6-dc76-4f42-a55d8bfd0185	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f6-dc76-43ae-712f60254be0	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f6-dc76-804a-985ee99cb7db	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f6-dc76-0ac7-5987e4762b0a	PA	PAN	591	Panama 	Panama	\N
00040000-55f6-dc76-478a-da89298c84ca	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f6-dc76-1e4d-93f2ebe97a46	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f6-dc76-69b7-4f268f1903c4	PE	PER	604	Peru 	Peru	\N
00040000-55f6-dc76-864d-066801cf71ff	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f6-dc76-80e7-9277e640d0ba	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f6-dc76-d4eb-b37241b35e51	PL	POL	616	Poland 	Poljska	\N
00040000-55f6-dc76-361c-2f4e5e8d119c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f6-dc76-9f01-84320d959f3f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f6-dc76-82fd-10739dbe825a	QA	QAT	634	Qatar 	Katar	\N
00040000-55f6-dc76-efda-25dc28f817d1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f6-dc76-69fb-b0c66b55cda6	RO	ROU	642	Romania 	Romunija	\N
00040000-55f6-dc76-f57b-bdafb9c46d4a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f6-dc76-885b-e21872834f9c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f6-dc76-090b-765049ffa6d4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f6-dc76-0921-dbc0d543dc18	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f6-dc76-8760-8f9ce0c05b1e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f6-dc76-7068-ee4f1723e190	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f6-dc76-580e-52c17fb6f399	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f6-dc76-a63b-424861f2bff3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f6-dc76-7530-e2c5c46013d5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f6-dc76-9400-d350a20f280c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f6-dc76-9ae6-73925d03442c	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f6-dc76-54bf-66c44901892d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f6-dc76-a878-ab087cb0eef0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f6-dc76-2965-35ae3638d483	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f6-dc76-51de-7ecd9acc7d75	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f6-dc76-58d8-647796061f27	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f6-dc76-949f-342bc5e32f0b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f6-dc76-ecac-4c0636ae13a0	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f6-dc76-9544-69eebff36af3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f6-dc76-996b-2eb3f7466418	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f6-dc76-82ad-5b5a1e33e417	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f6-dc76-a1d2-96d58638dd70	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f6-dc76-1c97-6565ffe4ee11	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f6-dc76-4ca5-e3616e10ea08	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f6-dc76-1e3e-d0fd14ad8834	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f6-dc76-d28f-67378ca17020	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f6-dc76-a6b2-a8bb38e9f9bc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f6-dc76-917c-d819983801ce	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f6-dc76-1286-c415916738a2	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f6-dc76-a5ed-689a3b83bb7e	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f6-dc76-9aa1-7121c48890f6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f6-dc76-fe22-37195dce77a0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f6-dc76-7b8a-9615e5246d45	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f6-dc76-1365-301c4626346b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f6-dc76-fb3f-1d08d7da06ce	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f6-dc76-ccf2-bfa9f47b8c05	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f6-dc76-2f8f-c0d72b9f1d10	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f6-dc76-ae8f-b1a8de6ff94a	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f6-dc76-4ead-91c77c20ffa3	TH	THA	764	Thailand 	Tajska	\N
00040000-55f6-dc76-93f7-fd70ce580d20	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f6-dc76-4591-5981989ddadb	TG	TGO	768	Togo 	Togo	\N
00040000-55f6-dc76-aadd-f19ecf15bc8e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f6-dc76-d9da-aa87ced6ed19	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f6-dc76-1720-e88bbbeaf7d9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f6-dc76-c703-0fe030223b4d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f6-dc76-6547-5d21ee01ee60	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f6-dc76-efb4-e2ab3762b4bb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f6-dc76-4616-add404f4bd6b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f6-dc76-389d-d1513b4b94d0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f6-dc76-093d-121d867e9644	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f6-dc76-edf3-27c9992e8c6e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f6-dc76-a97c-7fb7c5dbb60e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f6-dc76-8ee9-50a9dc6e18ea	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f6-dc76-ed40-31785e30a793	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f6-dc76-9f24-566f5fe4f15e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f6-dc76-5f49-90a115af1af7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f6-dc76-b005-7e463a4398d9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f6-dc76-7cf0-cb44f87e7ca4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f6-dc76-5501-cb7c0303a446	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f6-dc76-a0df-91b1b160fd76	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f6-dc76-ad7a-1e9292ce2fa8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f6-dc76-402a-9cfa44562538	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f6-dc76-b63a-c09792d2c404	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f6-dc76-4640-55217e36349b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f6-dc76-c8c2-1205bd00f955	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f6-dc76-c1a4-80f7e0ae1f9b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f6-dc76-7fbc-023b2affc99b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2988 (class 0 OID 19356690)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f6-dc78-1cd3-6bb39775d667	000e0000-55f6-dc78-09d3-0ba06b83f760	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-dc75-489b-dcf8ee6d8f44	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f6-dc78-9b50-e496116a7457	000e0000-55f6-dc78-a1c7-29ebe0e2e231	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-dc75-c22f-4b751b7e8ba5	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f6-dc78-1bca-961d51555eff	000e0000-55f6-dc78-4464-fe442ae99d22	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-dc75-489b-dcf8ee6d8f44	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f6-dc78-5855-9edb2fcde919	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f6-dc78-b820-4d7384d21e4a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 19356500)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f6-dc78-19f0-171e9d8e45ce	000e0000-55f6-dc78-a1c7-29ebe0e2e231	000c0000-55f6-dc78-78cd-326e99e6cb70	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f6-dc76-d72a-c201573d7cc7
000d0000-55f6-dc78-e5e9-43ade635f874	000e0000-55f6-dc78-a1c7-29ebe0e2e231	000c0000-55f6-dc78-d304-f9289ee9113c	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f6-dc76-f444-eab7d86a8038
000d0000-55f6-dc78-b654-80c3a05511f6	000e0000-55f6-dc78-a1c7-29ebe0e2e231	000c0000-55f6-dc78-8dc6-a6e6b25ef749	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f6-dc76-8ef9-67e77082deae
000d0000-55f6-dc78-d9d6-3bc014cb5c19	000e0000-55f6-dc78-a1c7-29ebe0e2e231	000c0000-55f6-dc78-9765-c3b7763373c2	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f6-dc76-77c4-0d58acfaa1f0
000d0000-55f6-dc78-4a63-4274fc95fc3b	000e0000-55f6-dc78-a1c7-29ebe0e2e231	000c0000-55f6-dc78-5fb8-ddc3e171e319	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f6-dc76-77c4-0d58acfaa1f0
000d0000-55f6-dc78-566b-37c814fea4d9	000e0000-55f6-dc78-a1c7-29ebe0e2e231	000c0000-55f6-dc78-f40f-cb1dd968d591	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f6-dc76-d72a-c201573d7cc7
000d0000-55f6-dc78-5b9b-b03d13e468d4	000e0000-55f6-dc78-a1c7-29ebe0e2e231	000c0000-55f6-dc78-2527-645f60f63b68	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f6-dc76-d72a-c201573d7cc7
000d0000-55f6-dc78-45f9-0744b902520f	000e0000-55f6-dc78-a1c7-29ebe0e2e231	000c0000-55f6-dc78-af91-9d367927ba7e	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f6-dc76-91f8-20113e4a88d1
000d0000-55f6-dc78-d2ac-883a24afe69d	000e0000-55f6-dc78-a1c7-29ebe0e2e231	000c0000-55f6-dc78-41e4-cb69ff336622	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f6-dc76-7969-b365be0cddb9
\.


--
-- TOC entry 2954 (class 0 OID 19356315)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 19356296)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f6-dc78-5b7e-b0bf37c20d21	00080000-55f6-dc77-0068-c31e709265bc	00090000-55f6-dc78-1e27-ecdc6855cde9	AK		igralka
\.


--
-- TOC entry 2963 (class 0 OID 19356414)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 19356896)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19356908)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 19356930)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19356439)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19356253)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f6-dc76-8595-e51a2b7e2dc8	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f6-dc76-0406-8f709e2a0fd5	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f6-dc76-3c4e-d4c1eb29fde3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f6-dc76-f86d-e4774f66e1e4	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f6-dc76-ed6f-d8ee00178707	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f6-dc76-b610-167cde30c7a7	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f6-dc76-bf9e-17932c67aef4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f6-dc76-4d91-a344ed41f220	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f6-dc76-a0b7-dbc95d48bc7f	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f6-dc76-1a6e-b036a9286199	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f6-dc76-2f53-525b6ac31bf4	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f6-dc76-a690-26bf85aa996c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f6-dc76-eb42-dcd7adededd3	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f6-dc76-3ee1-1c586c86ad28	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f6-dc77-bb2f-feb7f0e01b63	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f6-dc77-968b-a353378585f1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f6-dc78-f4a5-9dc6eaefa980	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f6-dc78-0785-21a503cc9e88	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f6-dc78-a6c4-5b42ae6857c4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f6-dc79-6dff-1f4e518cea61	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2943 (class 0 OID 19356167)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f6-dc77-efc1-259d761bf6e7	00000000-55f6-dc77-bb2f-feb7f0e01b63	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f6-dc77-d29d-59962cc9edb1	00000000-55f6-dc77-bb2f-feb7f0e01b63	00010000-55f6-dc76-94dd-aa6d5823921c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f6-dc77-3e20-87024e39c2e8	00000000-55f6-dc77-968b-a353378585f1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2944 (class 0 OID 19356178)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f6-dc78-f641-d0448233c706	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f6-dc78-c4a8-3c25d96d4a30	00010000-55f6-dc78-d26b-ba995aa259df	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f6-dc78-bde7-fb90342f7d9a	00010000-55f6-dc78-7ee2-7a7524a55c7e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f6-dc78-55af-f77fb70ab3d6	00010000-55f6-dc78-a236-c693551e942b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f6-dc78-60d0-c46a8b928223	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f6-dc78-eabf-171be5c8d5c1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f6-dc78-305d-730472dc455d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f6-dc78-51ee-2e0cf53447ab	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f6-dc78-1e27-ecdc6855cde9	00010000-55f6-dc78-d4fe-33021fcda03f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f6-dc78-d348-706c6c62919e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f6-dc78-1ced-3a2ef06a5f90	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f6-dc78-7a9c-827f80f0c16c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f6-dc78-9f8c-46cc566e3c37	00010000-55f6-dc78-ea68-90246b830d76	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 19356132)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f6-dc76-dd6e-ff27a0293501	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f6-dc76-4d7a-4c3bb444dc84	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f6-dc76-3782-dbfd32089436	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f6-dc76-bcd8-2e9ed9bb2361	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f6-dc76-db47-93fa2dbaa22e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f6-dc76-c48a-d50e7cb05bc4	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f6-dc76-551a-47e3afded77c	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f6-dc76-89d2-aa347adb58f9	Abonma-read	Abonma - branje	f
00030000-55f6-dc76-87cd-bf52f5c67ac1	Abonma-write	Abonma - spreminjanje	f
00030000-55f6-dc76-5093-ef8595092f32	Alternacija-read	Alternacija - branje	f
00030000-55f6-dc76-582e-d271e6a3ff91	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f6-dc76-e958-bd9ef546c358	Arhivalija-read	Arhivalija - branje	f
00030000-55f6-dc76-736d-524de2ef1e7a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f6-dc76-9ed8-448549909ac4	Besedilo-read	Besedilo - branje	f
00030000-55f6-dc76-80b9-dbf559fb1d34	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f6-dc76-9a41-76edc64e1ebe	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f6-dc76-23b1-9d0377d553f4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f6-dc76-cc08-1f4e6b8f2b14	Dogodek-read	Dogodek - branje	f
00030000-55f6-dc76-290f-9227cb4b381f	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f6-dc76-444e-678c5a82cc07	DrugiVir-read	DrugiVir - branje	f
00030000-55f6-dc76-de66-0deeaa7e9493	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f6-dc76-3ac8-4ecd7aaa12f2	Drzava-read	Drzava - branje	f
00030000-55f6-dc76-747b-7486d554982b	Drzava-write	Drzava - spreminjanje	f
00030000-55f6-dc76-c29b-b0dac5a05329	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f6-dc76-5897-05254d4a8334	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f6-dc76-ee7d-fd5dcffd592b	Funkcija-read	Funkcija - branje	f
00030000-55f6-dc76-cc50-55fb80ec91b1	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f6-dc76-7398-67bd2dd3ad37	Gostovanje-read	Gostovanje - branje	f
00030000-55f6-dc76-7360-5c9f1754fa8c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f6-dc76-01e3-475dfd983832	Gostujoca-read	Gostujoca - branje	f
00030000-55f6-dc76-46a8-7b4934e394d4	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f6-dc76-3ef5-98a363c27835	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f6-dc76-732a-d6718106206b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f6-dc76-dc60-b7cb79ff304a	Kupec-read	Kupec - branje	f
00030000-55f6-dc76-c1a2-c8dc099ed4ae	Kupec-write	Kupec - spreminjanje	f
00030000-55f6-dc76-d768-6344c3364c70	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f6-dc76-4504-85f1fb529a65	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f6-dc76-4856-98b153738584	Option-read	Option - branje	f
00030000-55f6-dc76-1fff-60f005b56278	Option-write	Option - spreminjanje	f
00030000-55f6-dc76-ef1b-9d450805bde0	OptionValue-read	OptionValue - branje	f
00030000-55f6-dc76-7edf-220d7c0cc283	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f6-dc76-8c62-4e3aa7205750	Oseba-read	Oseba - branje	f
00030000-55f6-dc76-3077-36def50d8ec4	Oseba-write	Oseba - spreminjanje	f
00030000-55f6-dc76-afb3-f195729413ec	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f6-dc76-e031-d0a6153a5fe2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f6-dc76-684f-24b0cad9db4a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f6-dc76-9c40-aec26d66836b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f6-dc76-045a-e88f53439a55	Pogodba-read	Pogodba - branje	f
00030000-55f6-dc76-e80d-4129c0ed1c42	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f6-dc76-1437-2f41d4b16b98	Popa-read	Popa - branje	f
00030000-55f6-dc76-251b-e4d0d6dca163	Popa-write	Popa - spreminjanje	f
00030000-55f6-dc76-c2bc-00401f5730bd	Posta-read	Posta - branje	f
00030000-55f6-dc76-9aea-7bdb2df7c86a	Posta-write	Posta - spreminjanje	f
00030000-55f6-dc76-a44f-25212ef6720b	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f6-dc76-fcd0-aaeb8b3098cb	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f6-dc76-fc1d-247e42ebace5	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f6-dc76-43f5-02f2b19677cd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f6-dc76-79ff-92b2f2c13633	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f6-dc76-be4e-231f24645ec2	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f6-dc76-2fa8-89615831cfa0	Predstava-read	Predstava - branje	f
00030000-55f6-dc76-2fe7-63e66c1db5ad	Predstava-write	Predstava - spreminjanje	f
00030000-55f6-dc76-25a0-ec672afd04c5	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f6-dc76-d561-82e5df952b5f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f6-dc76-c03a-b2b9db61ee10	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f6-dc76-682e-336513636afd	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f6-dc76-e066-e42238707e83	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f6-dc76-2317-fe9a1af4db02	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f6-dc76-be61-56a0c658f00b	ProgramDela-read	ProgramDela - branje	f
00030000-55f6-dc76-c294-83580fb80a1c	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f6-dc76-8d52-798f9d023097	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f6-dc76-f317-68ea062d331f	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f6-dc76-cb49-33687e042a86	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f6-dc76-6777-45d5a6113e62	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f6-dc76-63a7-90a4e0a81d53	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f6-dc76-3183-cdd0907819b4	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f6-dc76-cb48-72ba65cc11a3	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f6-dc76-bdc1-00aaaafef923	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f6-dc76-0b3d-59433e432c49	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f6-dc76-ff18-98297be052df	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f6-dc76-5473-5fda431cdb0f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f6-dc76-9d71-b20e31136bd9	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f6-dc76-6559-7fa1651e85d8	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f6-dc76-da72-f13768c35d4d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f6-dc76-a3df-81bc51133085	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f6-dc76-8adb-8a91dce5e380	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f6-dc76-547c-7fe20f73d156	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f6-dc76-19a7-b294b553258d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f6-dc76-c958-11c0843123c0	Prostor-read	Prostor - branje	f
00030000-55f6-dc76-6d20-e967917346c5	Prostor-write	Prostor - spreminjanje	f
00030000-55f6-dc76-58ce-bb230ab74fac	Racun-read	Racun - branje	f
00030000-55f6-dc76-1902-0a1a20df8960	Racun-write	Racun - spreminjanje	f
00030000-55f6-dc76-b9d8-609077fb773d	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f6-dc76-b098-3b128ceb49e5	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f6-dc76-9434-3e76cecb5779	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f6-dc76-0499-ffa14cf938c9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f6-dc76-e6ed-efdf67e4e90e	Rekvizit-read	Rekvizit - branje	f
00030000-55f6-dc76-86b4-c5eafd7bbcb9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f6-dc76-e559-07a004b5247f	Revizija-read	Revizija - branje	f
00030000-55f6-dc76-45a2-024fdd121bc5	Revizija-write	Revizija - spreminjanje	f
00030000-55f6-dc76-3b2a-01cf4dd14e7f	Rezervacija-read	Rezervacija - branje	f
00030000-55f6-dc76-0621-62f7fca1ea96	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f6-dc76-8abd-dfe9442c900a	SedezniRed-read	SedezniRed - branje	f
00030000-55f6-dc76-fead-d6aa4e77ded2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f6-dc76-4568-416b2887b78c	Sedez-read	Sedez - branje	f
00030000-55f6-dc76-d301-8be912b4ae7b	Sedez-write	Sedez - spreminjanje	f
00030000-55f6-dc76-d72b-f8ff72d5d726	Sezona-read	Sezona - branje	f
00030000-55f6-dc76-b6df-1192189f3b24	Sezona-write	Sezona - spreminjanje	f
00030000-55f6-dc76-fd82-c167fb8954f7	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f6-dc76-531c-bdc08128b347	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f6-dc76-ef99-7f1382f1d3be	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f6-dc76-d755-8fb709c0dcca	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f6-dc76-221b-2597180bf23e	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f6-dc76-6ad2-5fa35aa42577	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f6-dc76-cef9-59c5062c44f4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f6-dc76-1da3-d6d2c5bc8d58	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f6-dc76-e793-687ad3752362	Telefonska-read	Telefonska - branje	f
00030000-55f6-dc76-ea6d-691e7ff26b3b	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f6-dc76-2354-9f9f42310ae6	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f6-dc76-4581-6678e12a441a	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f6-dc76-94be-406569762190	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f6-dc76-634e-f6e5273481dc	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f6-dc76-a844-a3f0e84f5133	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f6-dc76-ea93-9534c01d4d91	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f6-dc76-18c9-3209024ae3bd	Trr-read	Trr - branje	f
00030000-55f6-dc76-ab29-ee10a08feca9	Trr-write	Trr - spreminjanje	f
00030000-55f6-dc76-0485-387cfadc8a40	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f6-dc76-fe92-e209500dfe45	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f6-dc76-9084-6ec62255e2bd	Vaja-read	Vaja - branje	f
00030000-55f6-dc76-3550-072a815cfa11	Vaja-write	Vaja - spreminjanje	f
00030000-55f6-dc76-6c86-98e1bbb15298	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f6-dc76-da78-c43a3dbb76aa	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f6-dc76-6179-12eeecd110aa	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f6-dc76-ef73-6b5e890dfa95	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f6-dc76-08ee-38d8d630a41f	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f6-dc76-758f-a4733cf05bd7	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f6-dc76-8365-1749f6b45b6e	Zasedenost-read	Zasedenost - branje	f
00030000-55f6-dc76-add0-2cb8a2cb8ccc	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f6-dc76-97cf-a36676261794	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f6-dc76-566f-df933bd2ba4d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f6-dc76-0a26-23e6924ea9e0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f6-dc76-0875-bf30edb02cd3	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f6-dc76-2de5-0d87720ef17a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f6-dc76-ac3c-c2e8853039d8	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f6-dc76-df38-9bd13106989b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f6-dc76-9541-2ed45ef4eee6	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f6-dc76-c772-e22fb1aca9ab	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f6-dc76-5e02-700b649dc843	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f6-dc76-31b4-9f891a6a0a69	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f6-dc76-c3df-d534418951de	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f6-dc76-a8c1-4f561c4e5171	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f6-dc76-67e3-c07d97e31ce3	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f6-dc76-f767-12d8795bf0c8	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f6-dc76-49eb-fd05bc730444	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2941 (class 0 OID 19356151)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f6-dc76-f67d-9603031c567f	00030000-55f6-dc76-4d7a-4c3bb444dc84
00020000-55f6-dc76-44bd-7313dc357879	00030000-55f6-dc76-3ac8-4ecd7aaa12f2
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-89d2-aa347adb58f9
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-87cd-bf52f5c67ac1
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-5093-ef8595092f32
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-582e-d271e6a3ff91
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-e958-bd9ef546c358
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-cc08-1f4e6b8f2b14
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-bcd8-2e9ed9bb2361
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-290f-9227cb4b381f
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-3ac8-4ecd7aaa12f2
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-747b-7486d554982b
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-ee7d-fd5dcffd592b
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-cc50-55fb80ec91b1
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-7398-67bd2dd3ad37
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-7360-5c9f1754fa8c
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-01e3-475dfd983832
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-46a8-7b4934e394d4
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-3ef5-98a363c27835
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-732a-d6718106206b
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-4856-98b153738584
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-ef1b-9d450805bde0
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-8c62-4e3aa7205750
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-3077-36def50d8ec4
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-1437-2f41d4b16b98
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-251b-e4d0d6dca163
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-c2bc-00401f5730bd
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-9aea-7bdb2df7c86a
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-79ff-92b2f2c13633
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-be4e-231f24645ec2
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-2fa8-89615831cfa0
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-2fe7-63e66c1db5ad
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-e066-e42238707e83
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-2317-fe9a1af4db02
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-c958-11c0843123c0
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-6d20-e967917346c5
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-9434-3e76cecb5779
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-0499-ffa14cf938c9
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-e6ed-efdf67e4e90e
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-86b4-c5eafd7bbcb9
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-d72b-f8ff72d5d726
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-b6df-1192189f3b24
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-94be-406569762190
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-0485-387cfadc8a40
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-fe92-e209500dfe45
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-9084-6ec62255e2bd
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-3550-072a815cfa11
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-8365-1749f6b45b6e
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-add0-2cb8a2cb8ccc
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-97cf-a36676261794
00020000-55f6-dc76-3d4f-139a56d6ed8b	00030000-55f6-dc76-0a26-23e6924ea9e0
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-89d2-aa347adb58f9
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-e958-bd9ef546c358
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-cc08-1f4e6b8f2b14
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-3ac8-4ecd7aaa12f2
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-7398-67bd2dd3ad37
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-01e3-475dfd983832
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-3ef5-98a363c27835
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-732a-d6718106206b
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-4856-98b153738584
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-ef1b-9d450805bde0
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-8c62-4e3aa7205750
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-3077-36def50d8ec4
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-1437-2f41d4b16b98
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-c2bc-00401f5730bd
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-79ff-92b2f2c13633
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-be4e-231f24645ec2
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-2fa8-89615831cfa0
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-c958-11c0843123c0
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-9434-3e76cecb5779
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-e6ed-efdf67e4e90e
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-d72b-f8ff72d5d726
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-e793-687ad3752362
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-ea6d-691e7ff26b3b
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-18c9-3209024ae3bd
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-ab29-ee10a08feca9
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-08ee-38d8d630a41f
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-758f-a4733cf05bd7
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-97cf-a36676261794
00020000-55f6-dc76-e558-58ee3d4ad859	00030000-55f6-dc76-0a26-23e6924ea9e0
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-89d2-aa347adb58f9
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-5093-ef8595092f32
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-e958-bd9ef546c358
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-736d-524de2ef1e7a
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-9ed8-448549909ac4
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-9a41-76edc64e1ebe
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-cc08-1f4e6b8f2b14
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-3ac8-4ecd7aaa12f2
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-ee7d-fd5dcffd592b
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-7398-67bd2dd3ad37
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-01e3-475dfd983832
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-3ef5-98a363c27835
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-4856-98b153738584
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-ef1b-9d450805bde0
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-8c62-4e3aa7205750
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-1437-2f41d4b16b98
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-c2bc-00401f5730bd
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-2fa8-89615831cfa0
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-e066-e42238707e83
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-c958-11c0843123c0
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-9434-3e76cecb5779
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-e6ed-efdf67e4e90e
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-d72b-f8ff72d5d726
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-94be-406569762190
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-9084-6ec62255e2bd
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-8365-1749f6b45b6e
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-97cf-a36676261794
00020000-55f6-dc76-a925-0317fea82aa3	00030000-55f6-dc76-0a26-23e6924ea9e0
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-89d2-aa347adb58f9
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-87cd-bf52f5c67ac1
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-582e-d271e6a3ff91
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-e958-bd9ef546c358
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-cc08-1f4e6b8f2b14
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-3ac8-4ecd7aaa12f2
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-7398-67bd2dd3ad37
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-01e3-475dfd983832
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-4856-98b153738584
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-ef1b-9d450805bde0
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-1437-2f41d4b16b98
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-c2bc-00401f5730bd
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-2fa8-89615831cfa0
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-c958-11c0843123c0
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-9434-3e76cecb5779
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-e6ed-efdf67e4e90e
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-d72b-f8ff72d5d726
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-94be-406569762190
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-97cf-a36676261794
00020000-55f6-dc76-aa22-f28e8b6e52a5	00030000-55f6-dc76-0a26-23e6924ea9e0
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-89d2-aa347adb58f9
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-e958-bd9ef546c358
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-cc08-1f4e6b8f2b14
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-3ac8-4ecd7aaa12f2
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-7398-67bd2dd3ad37
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-01e3-475dfd983832
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-4856-98b153738584
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-ef1b-9d450805bde0
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-1437-2f41d4b16b98
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-c2bc-00401f5730bd
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-2fa8-89615831cfa0
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-c958-11c0843123c0
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-9434-3e76cecb5779
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-e6ed-efdf67e4e90e
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-d72b-f8ff72d5d726
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-2354-9f9f42310ae6
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-3782-dbfd32089436
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-94be-406569762190
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-97cf-a36676261794
00020000-55f6-dc76-a14b-9748f010235a	00030000-55f6-dc76-0a26-23e6924ea9e0
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-dd6e-ff27a0293501
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-4d7a-4c3bb444dc84
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-3782-dbfd32089436
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-bcd8-2e9ed9bb2361
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-db47-93fa2dbaa22e
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-c48a-d50e7cb05bc4
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-551a-47e3afded77c
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-89d2-aa347adb58f9
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-87cd-bf52f5c67ac1
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-5093-ef8595092f32
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-582e-d271e6a3ff91
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-e958-bd9ef546c358
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-736d-524de2ef1e7a
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-9ed8-448549909ac4
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-80b9-dbf559fb1d34
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-9a41-76edc64e1ebe
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-23b1-9d0377d553f4
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-cc08-1f4e6b8f2b14
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-290f-9227cb4b381f
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-3ac8-4ecd7aaa12f2
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-747b-7486d554982b
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-444e-678c5a82cc07
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-de66-0deeaa7e9493
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-c29b-b0dac5a05329
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-5897-05254d4a8334
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-ee7d-fd5dcffd592b
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-cc50-55fb80ec91b1
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-7398-67bd2dd3ad37
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-7360-5c9f1754fa8c
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-01e3-475dfd983832
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-46a8-7b4934e394d4
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-3ef5-98a363c27835
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-732a-d6718106206b
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-dc60-b7cb79ff304a
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-c1a2-c8dc099ed4ae
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-d768-6344c3364c70
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-4504-85f1fb529a65
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-4856-98b153738584
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-1fff-60f005b56278
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-ef1b-9d450805bde0
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-7edf-220d7c0cc283
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-8c62-4e3aa7205750
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-3077-36def50d8ec4
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-afb3-f195729413ec
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-e031-d0a6153a5fe2
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-684f-24b0cad9db4a
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-9c40-aec26d66836b
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-045a-e88f53439a55
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-e80d-4129c0ed1c42
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-1437-2f41d4b16b98
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-251b-e4d0d6dca163
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-c2bc-00401f5730bd
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-9aea-7bdb2df7c86a
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-a44f-25212ef6720b
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-fcd0-aaeb8b3098cb
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-fc1d-247e42ebace5
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-43f5-02f2b19677cd
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-79ff-92b2f2c13633
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-be4e-231f24645ec2
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-2fa8-89615831cfa0
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-2fe7-63e66c1db5ad
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-25a0-ec672afd04c5
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-d561-82e5df952b5f
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-c03a-b2b9db61ee10
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-682e-336513636afd
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-e066-e42238707e83
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-2317-fe9a1af4db02
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-be61-56a0c658f00b
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-c294-83580fb80a1c
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-8d52-798f9d023097
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-f317-68ea062d331f
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-cb49-33687e042a86
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-6777-45d5a6113e62
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-63a7-90a4e0a81d53
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-3183-cdd0907819b4
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-cb48-72ba65cc11a3
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-bdc1-00aaaafef923
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-0b3d-59433e432c49
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-ff18-98297be052df
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-5473-5fda431cdb0f
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-9d71-b20e31136bd9
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-6559-7fa1651e85d8
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-da72-f13768c35d4d
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-a3df-81bc51133085
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-8adb-8a91dce5e380
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-547c-7fe20f73d156
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-19a7-b294b553258d
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-c958-11c0843123c0
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-6d20-e967917346c5
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-58ce-bb230ab74fac
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-1902-0a1a20df8960
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-b9d8-609077fb773d
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-b098-3b128ceb49e5
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-9434-3e76cecb5779
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-0499-ffa14cf938c9
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-e6ed-efdf67e4e90e
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-86b4-c5eafd7bbcb9
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-e559-07a004b5247f
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-45a2-024fdd121bc5
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-3b2a-01cf4dd14e7f
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-0621-62f7fca1ea96
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-8abd-dfe9442c900a
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-fead-d6aa4e77ded2
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-4568-416b2887b78c
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-d301-8be912b4ae7b
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-d72b-f8ff72d5d726
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-b6df-1192189f3b24
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-fd82-c167fb8954f7
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-531c-bdc08128b347
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-ef99-7f1382f1d3be
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-d755-8fb709c0dcca
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-221b-2597180bf23e
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-6ad2-5fa35aa42577
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-cef9-59c5062c44f4
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-1da3-d6d2c5bc8d58
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-e793-687ad3752362
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-ea6d-691e7ff26b3b
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-2354-9f9f42310ae6
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-4581-6678e12a441a
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-94be-406569762190
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-634e-f6e5273481dc
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-a844-a3f0e84f5133
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-ea93-9534c01d4d91
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-18c9-3209024ae3bd
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-ab29-ee10a08feca9
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-0485-387cfadc8a40
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-fe92-e209500dfe45
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-9084-6ec62255e2bd
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-3550-072a815cfa11
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-6c86-98e1bbb15298
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-da78-c43a3dbb76aa
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-6179-12eeecd110aa
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-ef73-6b5e890dfa95
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-08ee-38d8d630a41f
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-758f-a4733cf05bd7
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-8365-1749f6b45b6e
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-add0-2cb8a2cb8ccc
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-97cf-a36676261794
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-566f-df933bd2ba4d
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-0a26-23e6924ea9e0
00020000-55f6-dc77-b287-9f53807235b2	00030000-55f6-dc76-0875-bf30edb02cd3
\.


--
-- TOC entry 2968 (class 0 OID 19356446)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19356480)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 19356609)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f6-dc78-555f-54779b2c3e38	00090000-55f6-dc78-f641-d0448233c706	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f6-dc78-bb37-5eeb12caa0f1	00090000-55f6-dc78-eabf-171be5c8d5c1	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f6-dc78-aed8-acd8bcc2d555	00090000-55f6-dc78-9f8c-46cc566e3c37	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f6-dc78-7b2e-607e107723a0	00090000-55f6-dc78-d348-706c6c62919e	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2946 (class 0 OID 19356211)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f6-dc77-0068-c31e709265bc	00040000-55f6-dc76-82ad-5b5a1e33e417	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-dc77-bab9-42f6c39d68fd	00040000-55f6-dc76-82ad-5b5a1e33e417	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f6-dc77-9f5a-e2a3f90c15db	00040000-55f6-dc76-82ad-5b5a1e33e417	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-dc77-96c5-244985a9f4ea	00040000-55f6-dc76-82ad-5b5a1e33e417	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-dc77-4b17-2f1cd7819619	00040000-55f6-dc76-82ad-5b5a1e33e417	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-dc77-54d1-0568a0ab938b	00040000-55f6-dc76-968e-fe1a8e037d0d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-dc77-1ede-e20a10620f47	00040000-55f6-dc76-001d-de561b03396c	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-dc77-80f4-b74d91720afb	00040000-55f6-dc76-7aec-faa8b0300b67	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-dc77-dbbd-ff154d42ffc8	00040000-55f6-dc76-0cb9-99da2813024a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-dc79-876e-fc23a2c8f37c	00040000-55f6-dc76-82ad-5b5a1e33e417	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2948 (class 0 OID 19356245)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f6-dc75-b15f-1bbcf84ab98f	8341	Adlešiči
00050000-55f6-dc75-c683-68bceb2d5344	5270	Ajdovščina
00050000-55f6-dc75-b7c5-2b4c046cbbb5	6280	Ankaran/Ancarano
00050000-55f6-dc75-42b4-0ad835a0ae16	9253	Apače
00050000-55f6-dc75-35f2-1b94f05e0cb5	8253	Artiče
00050000-55f6-dc75-fc2f-cd1e5ea4f4c3	4275	Begunje na Gorenjskem
00050000-55f6-dc75-f4c5-1304db973c65	1382	Begunje pri Cerknici
00050000-55f6-dc75-b85e-081dbdeddcee	9231	Beltinci
00050000-55f6-dc75-0645-e9a91782e571	2234	Benedikt
00050000-55f6-dc75-1c3c-521ddefafe76	2345	Bistrica ob Dravi
00050000-55f6-dc75-5838-215d5c4da7a7	3256	Bistrica ob Sotli
00050000-55f6-dc75-189f-39fc48446f6d	8259	Bizeljsko
00050000-55f6-dc75-b89c-dc34972d74f1	1223	Blagovica
00050000-55f6-dc75-5ce9-c7a48242737f	8283	Blanca
00050000-55f6-dc75-1fa4-0969fa5d6c4b	4260	Bled
00050000-55f6-dc75-d1ee-541ab4aa2604	4273	Blejska Dobrava
00050000-55f6-dc75-7e64-1861b1c99b3e	9265	Bodonci
00050000-55f6-dc75-cc1d-d0c677482028	9222	Bogojina
00050000-55f6-dc75-3804-ce6f1ef43f0d	4263	Bohinjska Bela
00050000-55f6-dc75-454f-a030285902ec	4264	Bohinjska Bistrica
00050000-55f6-dc75-e42d-7e959ace895e	4265	Bohinjsko jezero
00050000-55f6-dc75-d4c3-de0df4682563	1353	Borovnica
00050000-55f6-dc75-a6eb-ca0ee30cced0	8294	Boštanj
00050000-55f6-dc75-77e1-f259dc3df448	5230	Bovec
00050000-55f6-dc75-f92d-c874558f8112	5295	Branik
00050000-55f6-dc75-4f52-13bb1e256444	3314	Braslovče
00050000-55f6-dc75-d138-03b391ce76b4	5223	Breginj
00050000-55f6-dc75-944e-13006a01c6a7	8280	Brestanica
00050000-55f6-dc75-5e65-c7c0924f4450	2354	Bresternica
00050000-55f6-dc75-ef10-86ba0baa0b69	4243	Brezje
00050000-55f6-dc75-1601-a1c128b16b1e	1351	Brezovica pri Ljubljani
00050000-55f6-dc75-acd3-772757513552	8250	Brežice
00050000-55f6-dc75-5f48-6a926a74f913	4210	Brnik - Aerodrom
00050000-55f6-dc75-4b2b-1d9c17b13f16	8321	Brusnice
00050000-55f6-dc75-144b-5ebee74364b1	3255	Buče
00050000-55f6-dc75-e6a0-585d8ec2ecd2	8276	Bučka 
00050000-55f6-dc75-bbd5-e5453cfc4d54	9261	Cankova
00050000-55f6-dc75-6515-88250b0af8bf	3000	Celje 
00050000-55f6-dc75-c9f5-9bdd3b536c38	3001	Celje - poštni predali
00050000-55f6-dc75-e1f8-a6e61c2c2f95	4207	Cerklje na Gorenjskem
00050000-55f6-dc75-0097-ff939f4fb39f	8263	Cerklje ob Krki
00050000-55f6-dc75-7fd8-4f67b8dcfa95	1380	Cerknica
00050000-55f6-dc75-6da1-e0a8d93fa2e0	5282	Cerkno
00050000-55f6-dc75-10a9-ec4da0b6c2c2	2236	Cerkvenjak
00050000-55f6-dc75-0619-8c3b34709403	2215	Ceršak
00050000-55f6-dc75-61b0-adc9f6329969	2326	Cirkovce
00050000-55f6-dc75-1d56-f3762a4c0c9e	2282	Cirkulane
00050000-55f6-dc75-2326-d0cbbfe80368	5273	Col
00050000-55f6-dc75-64b0-fa8ef8368c7a	8251	Čatež ob Savi
00050000-55f6-dc75-981b-b80953915fd5	1413	Čemšenik
00050000-55f6-dc75-1e01-51bcc27a8f63	5253	Čepovan
00050000-55f6-dc75-cc68-a536b7754d16	9232	Črenšovci
00050000-55f6-dc75-992f-a6855669081f	2393	Črna na Koroškem
00050000-55f6-dc75-50d1-fc82117c65f9	6275	Črni Kal
00050000-55f6-dc75-48e1-d98ea6234286	5274	Črni Vrh nad Idrijo
00050000-55f6-dc75-59ff-423d3d31c54a	5262	Črniče
00050000-55f6-dc75-2a4b-6c3ed086ebdb	8340	Črnomelj
00050000-55f6-dc75-2097-1cbf97d11f7e	6271	Dekani
00050000-55f6-dc75-874c-9aeec150ce6c	5210	Deskle
00050000-55f6-dc75-889a-c1c53461b58b	2253	Destrnik
00050000-55f6-dc75-43a8-196b204b1f23	6215	Divača
00050000-55f6-dc75-6990-b657b3945031	1233	Dob
00050000-55f6-dc75-732b-3fb6e82a3f8a	3224	Dobje pri Planini
00050000-55f6-dc75-3704-e1d17a0a05cd	8257	Dobova
00050000-55f6-dc75-468d-920723f9d17e	1423	Dobovec
00050000-55f6-dc75-cb84-ccd45a86cffc	5263	Dobravlje
00050000-55f6-dc75-f8d3-354909398398	3204	Dobrna
00050000-55f6-dc75-a178-4cca1536f43d	8211	Dobrnič
00050000-55f6-dc75-bc8c-1073c8ae1a05	1356	Dobrova
00050000-55f6-dc75-0c23-ede178ebcfd1	9223	Dobrovnik/Dobronak 
00050000-55f6-dc75-4989-8920c2b60d93	5212	Dobrovo v Brdih
00050000-55f6-dc75-d2c7-716eb8c8c6fb	1431	Dol pri Hrastniku
00050000-55f6-dc75-4de7-8694119418a1	1262	Dol pri Ljubljani
00050000-55f6-dc75-6669-904702ea6f85	1273	Dole pri Litiji
00050000-55f6-dc75-7dd0-70644bf825ad	1331	Dolenja vas
00050000-55f6-dc75-4bac-072c20724b1b	8350	Dolenjske Toplice
00050000-55f6-dc75-7491-be1a2600d0f4	1230	Domžale
00050000-55f6-dc75-0fcd-004457e972de	2252	Dornava
00050000-55f6-dc75-c1d0-bda49b3c3887	5294	Dornberk
00050000-55f6-dc75-eb48-a539ac6d7805	1319	Draga
00050000-55f6-dc75-320d-4f2c6113aa7e	8343	Dragatuš
00050000-55f6-dc75-ae7d-deaed3a2c1f5	3222	Dramlje
00050000-55f6-dc75-d908-6f579dcbc356	2370	Dravograd
00050000-55f6-dc75-0814-7d5dd76a163e	4203	Duplje
00050000-55f6-dc75-9759-4773f42a9bbc	6221	Dutovlje
00050000-55f6-dc75-4477-dcb17043bd65	8361	Dvor
00050000-55f6-dc75-532e-5a570724a191	2343	Fala
00050000-55f6-dc75-9655-5accf880ca88	9208	Fokovci
00050000-55f6-dc75-e420-5142072705c6	2313	Fram
00050000-55f6-dc75-69d4-6723c35fc670	3213	Frankolovo
00050000-55f6-dc75-19f4-abafc8e6ccae	1274	Gabrovka
00050000-55f6-dc75-433c-5fc3598465f5	8254	Globoko
00050000-55f6-dc75-afbe-4f87bc677af2	5275	Godovič
00050000-55f6-dc75-3812-7acf2a064f9f	4204	Golnik
00050000-55f6-dc75-dfc4-5a0355711279	3303	Gomilsko
00050000-55f6-dc75-2d45-345702387c75	4224	Gorenja vas
00050000-55f6-dc75-da1a-9485fea38d44	3263	Gorica pri Slivnici
00050000-55f6-dc75-a44f-515a24b91b66	2272	Gorišnica
00050000-55f6-dc75-2397-fb7179e1c478	9250	Gornja Radgona
00050000-55f6-dc75-3676-2e0ce9204226	3342	Gornji Grad
00050000-55f6-dc75-5eb2-29a5e9e8a2d8	4282	Gozd Martuljek
00050000-55f6-dc75-c4b6-7863dfb6f84e	6272	Gračišče
00050000-55f6-dc75-6707-2aa9f44d3038	9264	Grad
00050000-55f6-dc75-903e-8d48fec2c43a	8332	Gradac
00050000-55f6-dc75-6ffd-6b1ff21b15ea	1384	Grahovo
00050000-55f6-dc75-7dea-e4f0b16108d0	5242	Grahovo ob Bači
00050000-55f6-dc75-76ea-0a7ce198ba77	5251	Grgar
00050000-55f6-dc75-53de-b252cd3f515a	3302	Griže
00050000-55f6-dc75-a81f-755080b78b8d	3231	Grobelno
00050000-55f6-dc75-9e32-cdd7e3927ece	1290	Grosuplje
00050000-55f6-dc75-98fa-1b2d7fbed9bc	2288	Hajdina
00050000-55f6-dc75-eb70-5ba904521e1a	8362	Hinje
00050000-55f6-dc75-54b5-91afd7dec445	2311	Hoče
00050000-55f6-dc75-84a8-bf273c6c6399	9205	Hodoš/Hodos
00050000-55f6-dc75-a4f6-fcf82127ee75	1354	Horjul
00050000-55f6-dc75-72bb-3ebe10784849	1372	Hotedršica
00050000-55f6-dc75-eda6-694de87d2612	1430	Hrastnik
00050000-55f6-dc75-745a-54b3ecdc6223	6225	Hruševje
00050000-55f6-dc75-0128-29e18a38d479	4276	Hrušica
00050000-55f6-dc75-fe47-0155c6dfc21d	5280	Idrija
00050000-55f6-dc75-582b-48c04c47ba45	1292	Ig
00050000-55f6-dc75-6f3c-859736832f72	6250	Ilirska Bistrica
00050000-55f6-dc75-7071-77f54c21da5a	6251	Ilirska Bistrica-Trnovo
00050000-55f6-dc75-71b0-9002497a7c16	1295	Ivančna Gorica
00050000-55f6-dc75-2f32-a56cceb6e041	2259	Ivanjkovci
00050000-55f6-dc75-3400-9c2a5253bae0	1411	Izlake
00050000-55f6-dc75-f1b8-a088fc56f50a	6310	Izola/Isola
00050000-55f6-dc75-50a3-44308e7b14bb	2222	Jakobski Dol
00050000-55f6-dc75-d2c6-c48d4187cf11	2221	Jarenina
00050000-55f6-dc75-d891-0df957ccec99	6254	Jelšane
00050000-55f6-dc75-f41f-bc2d2419308e	4270	Jesenice
00050000-55f6-dc75-84b7-095ab8f9b1c9	8261	Jesenice na Dolenjskem
00050000-55f6-dc75-a6aa-cd791ada1678	3273	Jurklošter
00050000-55f6-dc75-3dff-6faf7816538a	2223	Jurovski Dol
00050000-55f6-dc75-56fd-ed397606d232	2256	Juršinci
00050000-55f6-dc75-0b00-5774882a58a1	5214	Kal nad Kanalom
00050000-55f6-dc75-b4aa-83ee434bc850	3233	Kalobje
00050000-55f6-dc75-f89c-7a3dcdd68df0	4246	Kamna Gorica
00050000-55f6-dc75-545e-21a8655e16f0	2351	Kamnica
00050000-55f6-dc75-9d8b-be2f79a3287d	1241	Kamnik
00050000-55f6-dc75-e150-5ac97883d76d	5213	Kanal
00050000-55f6-dc75-9dc2-d2ebdeb66f10	8258	Kapele
00050000-55f6-dc75-3619-0a8695cf4c73	2362	Kapla
00050000-55f6-dc75-364d-e4c679cb985c	2325	Kidričevo
00050000-55f6-dc75-38e4-f01593e15186	1412	Kisovec
00050000-55f6-dc75-e831-c755589826fc	6253	Knežak
00050000-55f6-dc75-ea65-30052065e215	5222	Kobarid
00050000-55f6-dc75-c990-84c460b07c28	9227	Kobilje
00050000-55f6-dc75-3016-28b1c63aed9d	1330	Kočevje
00050000-55f6-dc75-bd50-0b6619c8cdc8	1338	Kočevska Reka
00050000-55f6-dc75-0bed-47dd156418c0	2276	Kog
00050000-55f6-dc75-18bf-8a90e4a23aa2	5211	Kojsko
00050000-55f6-dc75-96e2-2b9b59ad1509	6223	Komen
00050000-55f6-dc75-9388-2a876cdc9c3b	1218	Komenda
00050000-55f6-dc75-88fc-6447d8a22a17	6000	Koper/Capodistria 
00050000-55f6-dc75-aad2-689ec677d251	6001	Koper/Capodistria - poštni predali
00050000-55f6-dc75-2e95-a4c6031eb6d1	8282	Koprivnica
00050000-55f6-dc75-bcca-372dd5326216	5296	Kostanjevica na Krasu
00050000-55f6-dc75-6348-0932fff85496	8311	Kostanjevica na Krki
00050000-55f6-dc75-a376-64260a3bd707	1336	Kostel
00050000-55f6-dc75-25c5-c66bd0401d33	6256	Košana
00050000-55f6-dc75-69ed-6362123db4bb	2394	Kotlje
00050000-55f6-dc75-384d-f9081af8f9ed	6240	Kozina
00050000-55f6-dc75-2ab6-b45293abc793	3260	Kozje
00050000-55f6-dc75-26ea-7b175487f289	4000	Kranj 
00050000-55f6-dc75-1f14-a2ef58f9b9e2	4001	Kranj - poštni predali
00050000-55f6-dc75-538b-1cc513e0d0c9	4280	Kranjska Gora
00050000-55f6-dc75-562f-a17ee95fe925	1281	Kresnice
00050000-55f6-dc75-4c95-eff4c1232cbc	4294	Križe
00050000-55f6-dc75-a4ef-1aa82ad0dff1	9206	Križevci
00050000-55f6-dc75-ba5a-81add6fd6b94	9242	Križevci pri Ljutomeru
00050000-55f6-dc75-e93a-f911fc9aceb3	1301	Krka
00050000-55f6-dc75-1f6c-3f64e2b6e10e	8296	Krmelj
00050000-55f6-dc75-8981-e39bba0febef	4245	Kropa
00050000-55f6-dc75-a437-f9097a09425f	8262	Krška vas
00050000-55f6-dc75-6299-e898241f11cf	8270	Krško
00050000-55f6-dc75-9eed-f2ec58f83fe7	9263	Kuzma
00050000-55f6-dc75-9fbe-05a7e728ae39	2318	Laporje
00050000-55f6-dc75-231f-8bfc200c108d	3270	Laško
00050000-55f6-dc75-8bad-118d6e7f8e22	1219	Laze v Tuhinju
00050000-55f6-dc75-44ac-fe9dcc192df4	2230	Lenart v Slovenskih goricah
00050000-55f6-dc75-9dd4-77cc0e5b4b43	9220	Lendava/Lendva
00050000-55f6-dc75-8417-3ff68502c1b0	4248	Lesce
00050000-55f6-dc75-224b-ad7c2ac7d3e1	3261	Lesično
00050000-55f6-dc75-cb30-ef88c5993fc7	8273	Leskovec pri Krškem
00050000-55f6-dc75-cc69-4254b75eb2b9	2372	Libeliče
00050000-55f6-dc75-1c0f-1e78b5d553b7	2341	Limbuš
00050000-55f6-dc75-1d1f-0a8e68977685	1270	Litija
00050000-55f6-dc75-5eb0-11e74b9e76e1	3202	Ljubečna
00050000-55f6-dc75-423f-d779e0d20766	1000	Ljubljana 
00050000-55f6-dc75-871b-46720ea68bcd	1001	Ljubljana - poštni predali
00050000-55f6-dc75-f999-09f37a434a4b	1231	Ljubljana - Črnuče
00050000-55f6-dc75-ae00-d85ea83704ad	1261	Ljubljana - Dobrunje
00050000-55f6-dc75-a75f-3a8a1223ab58	1260	Ljubljana - Polje
00050000-55f6-dc75-3442-e4548bfff484	1210	Ljubljana - Šentvid
00050000-55f6-dc75-cf22-2c8eceadea38	1211	Ljubljana - Šmartno
00050000-55f6-dc75-6da7-b4a963c80fc4	3333	Ljubno ob Savinji
00050000-55f6-dc75-c95c-a1f2b539b04c	9240	Ljutomer
00050000-55f6-dc75-f270-55c7d4fd268f	3215	Loče
00050000-55f6-dc75-3837-24c28be04ca6	5231	Log pod Mangartom
00050000-55f6-dc75-5cea-37e1fb368fbb	1358	Log pri Brezovici
00050000-55f6-dc75-e9a2-34a7bf840093	1370	Logatec
00050000-55f6-dc75-7d33-6ec9fb6157e6	1371	Logatec
00050000-55f6-dc75-5b62-2f6f5b06df6f	1434	Loka pri Zidanem Mostu
00050000-55f6-dc75-8515-e61d5d5e1f1a	3223	Loka pri Žusmu
00050000-55f6-dc75-797c-f720ffb640e9	6219	Lokev
00050000-55f6-dc75-fd66-2db3a91f3be9	1318	Loški Potok
00050000-55f6-dc75-2c50-1b17e9e57b36	2324	Lovrenc na Dravskem polju
00050000-55f6-dc75-ae52-450a13ce107f	2344	Lovrenc na Pohorju
00050000-55f6-dc75-7348-9847c634f421	3334	Luče
00050000-55f6-dc75-0875-f8204f2b7b12	1225	Lukovica
00050000-55f6-dc75-9174-b302d1651d48	9202	Mačkovci
00050000-55f6-dc75-e1bc-c0379cf4d6da	2322	Majšperk
00050000-55f6-dc75-6ca3-54d9da5726b3	2321	Makole
00050000-55f6-dc75-26b2-226203725a78	9243	Mala Nedelja
00050000-55f6-dc75-e30b-d2839e8dbd48	2229	Malečnik
00050000-55f6-dc75-d7cf-f11091882656	6273	Marezige
00050000-55f6-dc75-b40e-b7d776981320	2000	Maribor 
00050000-55f6-dc75-d9f2-090ebe83a4bb	2001	Maribor - poštni predali
00050000-55f6-dc75-151c-c776c1d72c1f	2206	Marjeta na Dravskem polju
00050000-55f6-dc75-ef9c-3304b59cf634	2281	Markovci
00050000-55f6-dc75-9dd7-8bf6add078d4	9221	Martjanci
00050000-55f6-dc75-2e42-8fdf803aeef3	6242	Materija
00050000-55f6-dc75-189b-51eb59c3dd74	4211	Mavčiče
00050000-55f6-dc75-1946-8e5766c61cb2	1215	Medvode
00050000-55f6-dc75-91f9-26dc35bb5d2d	1234	Mengeš
00050000-55f6-dc75-e115-fb8e4bb03ece	8330	Metlika
00050000-55f6-dc75-944a-241e3ecbcf52	2392	Mežica
00050000-55f6-dc75-0771-7fc68f507ffa	2204	Miklavž na Dravskem polju
00050000-55f6-dc75-e91a-73ef5ed16ba3	2275	Miklavž pri Ormožu
00050000-55f6-dc75-268a-db60025dcea5	5291	Miren
00050000-55f6-dc75-afc3-81f4cb4eb937	8233	Mirna
00050000-55f6-dc75-9a8f-786168180164	8216	Mirna Peč
00050000-55f6-dc75-794a-8bf2c8485935	2382	Mislinja
00050000-55f6-dc75-45ab-90483a5cf2d1	4281	Mojstrana
00050000-55f6-dc75-c1ec-d054eba9f6b4	8230	Mokronog
00050000-55f6-dc75-0584-fc48d6c12e9f	1251	Moravče
00050000-55f6-dc75-ffff-f1a0ec7b026c	9226	Moravske Toplice
00050000-55f6-dc75-fc89-d9b11e7b0cb9	5216	Most na Soči
00050000-55f6-dc75-6778-966b8331b831	1221	Motnik
00050000-55f6-dc75-0b3d-a7f1520f80b8	3330	Mozirje
00050000-55f6-dc75-3c72-3dbd0112571a	9000	Murska Sobota 
00050000-55f6-dc75-059e-ab42bab5d700	9001	Murska Sobota - poštni predali
00050000-55f6-dc75-b3f7-1f6797561f52	2366	Muta
00050000-55f6-dc75-cd48-cabfefef66cc	4202	Naklo
00050000-55f6-dc75-3167-a7a36e7709e2	3331	Nazarje
00050000-55f6-dc75-23a4-74f6f79898e1	1357	Notranje Gorice
00050000-55f6-dc75-247f-00668daefc4a	3203	Nova Cerkev
00050000-55f6-dc75-b569-2171f06857f2	5000	Nova Gorica 
00050000-55f6-dc75-b59d-b5964ad05e0c	5001	Nova Gorica - poštni predali
00050000-55f6-dc75-78fe-9e3ab485e90e	1385	Nova vas
00050000-55f6-dc75-d18e-c93a702b720b	8000	Novo mesto
00050000-55f6-dc75-c20f-82445a9980e2	8001	Novo mesto - poštni predali
00050000-55f6-dc75-bc66-25d4cafffc55	6243	Obrov
00050000-55f6-dc75-018a-91b39b98c7c7	9233	Odranci
00050000-55f6-dc75-ee86-c3754e08d74a	2317	Oplotnica
00050000-55f6-dc75-64a9-99534a88e0fb	2312	Orehova vas
00050000-55f6-dc75-1d28-6709b02fd4b7	2270	Ormož
00050000-55f6-dc75-bebb-23658c41b638	1316	Ortnek
00050000-55f6-dc75-764c-3b405733bb5f	1337	Osilnica
00050000-55f6-dc75-5850-a75c63d7ac9c	8222	Otočec
00050000-55f6-dc75-4818-9aee4c55fdd1	2361	Ožbalt
00050000-55f6-dc75-bbae-d64012bc487d	2231	Pernica
00050000-55f6-dc75-704a-b62e9a020342	2211	Pesnica pri Mariboru
00050000-55f6-dc75-1efe-a179405d07e3	9203	Petrovci
00050000-55f6-dc75-b869-4228785526ca	3301	Petrovče
00050000-55f6-dc75-ce9f-0f0b78454842	6330	Piran/Pirano
00050000-55f6-dc75-865e-00ca5d56ce08	8255	Pišece
00050000-55f6-dc75-c292-9f424384594b	6257	Pivka
00050000-55f6-dc75-67e9-1156c4d051a3	6232	Planina
00050000-55f6-dc75-5909-c926411a01d0	3225	Planina pri Sevnici
00050000-55f6-dc75-06bd-ed868d9b19b9	6276	Pobegi
00050000-55f6-dc75-658d-dd10e4efcb9e	8312	Podbočje
00050000-55f6-dc75-ac73-d9c4e84b9556	5243	Podbrdo
00050000-55f6-dc75-9740-e6f1971361ba	3254	Podčetrtek
00050000-55f6-dc75-356a-4a04fd0c7773	2273	Podgorci
00050000-55f6-dc75-ab19-61cb904686d0	6216	Podgorje
00050000-55f6-dc75-60f9-7911fb344bea	2381	Podgorje pri Slovenj Gradcu
00050000-55f6-dc75-fec8-6723f49f78b2	6244	Podgrad
00050000-55f6-dc75-91f1-09f2caf89fe2	1414	Podkum
00050000-55f6-dc75-5281-37e173817eff	2286	Podlehnik
00050000-55f6-dc75-a5ae-1d230b62258c	5272	Podnanos
00050000-55f6-dc75-9821-0f62234f6fa5	4244	Podnart
00050000-55f6-dc75-e3e3-5e6538ed3be3	3241	Podplat
00050000-55f6-dc75-a779-490fa7647889	3257	Podsreda
00050000-55f6-dc75-716f-01a5177d69bc	2363	Podvelka
00050000-55f6-dc75-dd30-64bbbc525c9f	2208	Pohorje
00050000-55f6-dc75-ac44-7b91358ce926	2257	Polenšak
00050000-55f6-dc75-7346-9fc232009b13	1355	Polhov Gradec
00050000-55f6-dc75-a275-1777766018d6	4223	Poljane nad Škofjo Loko
00050000-55f6-dc75-af53-d6a81b132174	2319	Poljčane
00050000-55f6-dc75-14d3-e43475e44380	1272	Polšnik
00050000-55f6-dc75-ca87-ddda0a95f7df	3313	Polzela
00050000-55f6-dc75-3935-48caa0b1db29	3232	Ponikva
00050000-55f6-dc75-69da-4eb1619641c7	6320	Portorož/Portorose
00050000-55f6-dc75-d2e9-ec7956a2439a	6230	Postojna
00050000-55f6-dc75-0743-8ea1bbabf8eb	2331	Pragersko
00050000-55f6-dc75-0f32-55cb053f851e	3312	Prebold
00050000-55f6-dc75-c8aa-73d14c6812b9	4205	Preddvor
00050000-55f6-dc75-5982-28c365c2d23f	6255	Prem
00050000-55f6-dc75-6530-99243974b243	1352	Preserje
00050000-55f6-dc75-9faf-0e5ab085933b	6258	Prestranek
00050000-55f6-dc75-e186-575687289bb0	2391	Prevalje
00050000-55f6-dc75-55c7-3f19c3875d99	3262	Prevorje
00050000-55f6-dc75-8005-6c334b1c2548	1276	Primskovo 
00050000-55f6-dc75-b1aa-4a6c4379b666	3253	Pristava pri Mestinju
00050000-55f6-dc75-d202-aada7194d00c	9207	Prosenjakovci/Partosfalva
00050000-55f6-dc75-e480-faabbc105541	5297	Prvačina
00050000-55f6-dc75-898f-0715f7467ada	2250	Ptuj
00050000-55f6-dc75-48e2-b273ba02b20f	2323	Ptujska Gora
00050000-55f6-dc75-4413-8a3d9df66873	9201	Puconci
00050000-55f6-dc75-93c8-25fe98f49cfa	2327	Rače
00050000-55f6-dc75-f6c8-57dd5df5b097	1433	Radeče
00050000-55f6-dc75-9b78-ece4c18f9a65	9252	Radenci
00050000-55f6-dc75-6cb4-3c6ebf4d564d	2360	Radlje ob Dravi
00050000-55f6-dc75-0227-116bac0193d8	1235	Radomlje
00050000-55f6-dc75-9021-6a7ce4ce2f8a	4240	Radovljica
00050000-55f6-dc75-f8c0-59992265d59f	8274	Raka
00050000-55f6-dc75-fbfc-0432053e2abd	1381	Rakek
00050000-55f6-dc75-a1f1-6746df82784c	4283	Rateče - Planica
00050000-55f6-dc75-7add-b3e1bdd917af	2390	Ravne na Koroškem
00050000-55f6-dc75-bf4a-6d04b1473b65	9246	Razkrižje
00050000-55f6-dc75-e620-9001400aed33	3332	Rečica ob Savinji
00050000-55f6-dc75-b41f-00156803321a	5292	Renče
00050000-55f6-dc75-d273-2ceb89ade06a	1310	Ribnica
00050000-55f6-dc75-a878-af7ec6198410	2364	Ribnica na Pohorju
00050000-55f6-dc75-b119-f3e757771079	3272	Rimske Toplice
00050000-55f6-dc75-857b-926f79b5dafd	1314	Rob
00050000-55f6-dc75-6388-b04da304b3ab	5215	Ročinj
00050000-55f6-dc75-bbfd-33835a8a9a23	3250	Rogaška Slatina
00050000-55f6-dc75-ed73-ae3f7b9473cf	9262	Rogašovci
00050000-55f6-dc75-738b-c7a137dd74a3	3252	Rogatec
00050000-55f6-dc75-5bc8-5e2337126c62	1373	Rovte
00050000-55f6-dc75-13ee-f63f7cc0440f	2342	Ruše
00050000-55f6-dc75-330a-0a285b0f7654	1282	Sava
00050000-55f6-dc75-52c9-b71da939c8f1	6333	Sečovlje/Sicciole
00050000-55f6-dc75-8132-e54b287fc818	4227	Selca
00050000-55f6-dc75-f846-9a677e48ad56	2352	Selnica ob Dravi
00050000-55f6-dc75-d8d5-cb830f419e47	8333	Semič
00050000-55f6-dc75-b3ab-4b46809e5e4b	8281	Senovo
00050000-55f6-dc75-106b-0de9d9cd3dae	6224	Senožeče
00050000-55f6-dc75-1b67-d1c298ef0810	8290	Sevnica
00050000-55f6-dc75-92d8-55950e289802	6210	Sežana
00050000-55f6-dc75-caf3-e626d2c98b7a	2214	Sladki Vrh
00050000-55f6-dc75-65c2-c994b2d99c84	5283	Slap ob Idrijci
00050000-55f6-dc75-7458-66544844afc9	2380	Slovenj Gradec
00050000-55f6-dc75-fc69-37db9247aef3	2310	Slovenska Bistrica
00050000-55f6-dc75-2017-f2d14da6b231	3210	Slovenske Konjice
00050000-55f6-dc75-09ed-9c842f4b7e01	1216	Smlednik
00050000-55f6-dc75-ae83-d74396e08cce	5232	Soča
00050000-55f6-dc75-e41f-c5fcc80726ba	1317	Sodražica
00050000-55f6-dc75-b872-92760c654840	3335	Solčava
00050000-55f6-dc75-2286-88a92e159e71	5250	Solkan
00050000-55f6-dc75-12c8-53b55be5c208	4229	Sorica
00050000-55f6-dc75-6788-37e0fcf74157	4225	Sovodenj
00050000-55f6-dc75-86c2-4354735ac251	5281	Spodnja Idrija
00050000-55f6-dc75-07b2-5e108cd1eeff	2241	Spodnji Duplek
00050000-55f6-dc75-054f-e08198a3257c	9245	Spodnji Ivanjci
00050000-55f6-dc75-760f-e9bc615ed97a	2277	Središče ob Dravi
00050000-55f6-dc75-5e81-34d767f289bd	4267	Srednja vas v Bohinju
00050000-55f6-dc75-0ef2-575840f16419	8256	Sromlje 
00050000-55f6-dc75-67f7-e9e27831ea06	5224	Srpenica
00050000-55f6-dc75-812b-33f7c29bc72e	1242	Stahovica
00050000-55f6-dc75-7964-38043f747b80	1332	Stara Cerkev
00050000-55f6-dc75-9eb1-7b051062ac63	8342	Stari trg ob Kolpi
00050000-55f6-dc75-a1e1-ef24c0cd1f38	1386	Stari trg pri Ložu
00050000-55f6-dc75-3eae-62e6d8244037	2205	Starše
00050000-55f6-dc75-c736-2283401bbd99	2289	Stoperce
00050000-55f6-dc75-c383-017eaff8b4b5	8322	Stopiče
00050000-55f6-dc75-2693-72a0a62269b4	3206	Stranice
00050000-55f6-dc75-96d9-077de63f9995	8351	Straža
00050000-55f6-dc75-7fef-f6a02e717660	1313	Struge
00050000-55f6-dc75-4b9c-9c8c14d07914	8293	Studenec
00050000-55f6-dc75-beba-93a2b2f59c9b	8331	Suhor
00050000-55f6-dc75-b626-62f550dbfb38	2233	Sv. Ana v Slovenskih goricah
00050000-55f6-dc75-78ea-4122abc251ed	2235	Sv. Trojica v Slovenskih goricah
00050000-55f6-dc75-9686-a6e35b9f7d9c	2353	Sveti Duh na Ostrem Vrhu
00050000-55f6-dc75-4e4a-79547671c04b	9244	Sveti Jurij ob Ščavnici
00050000-55f6-dc75-c037-fc3bbb95a1a3	3264	Sveti Štefan
00050000-55f6-dc75-e3c1-2cc12ceec795	2258	Sveti Tomaž
00050000-55f6-dc75-d570-10beb8ad26df	9204	Šalovci
00050000-55f6-dc75-1d86-74bcff4c827a	5261	Šempas
00050000-55f6-dc75-1a1e-aec6f2ccf97a	5290	Šempeter pri Gorici
00050000-55f6-dc75-b588-2853125d98a4	3311	Šempeter v Savinjski dolini
00050000-55f6-dc75-66f8-ed07ad9cb039	4208	Šenčur
00050000-55f6-dc75-cafd-e9266868f1f1	2212	Šentilj v Slovenskih goricah
00050000-55f6-dc75-fa55-8be90f9c839a	8297	Šentjanž
00050000-55f6-dc75-e523-50d24be3570d	2373	Šentjanž pri Dravogradu
00050000-55f6-dc75-738c-d05587e6d312	8310	Šentjernej
00050000-55f6-dc75-017d-2b9ec58f73b4	3230	Šentjur
00050000-55f6-dc75-5db1-670eb281bdef	3271	Šentrupert
00050000-55f6-dc75-8136-a2ca9b1c6f9e	8232	Šentrupert
00050000-55f6-dc75-6f15-ffecbfbf797e	1296	Šentvid pri Stični
00050000-55f6-dc75-34ce-88c7e562fb65	8275	Škocjan
00050000-55f6-dc75-bf56-6e90e6a8926e	6281	Škofije
00050000-55f6-dc75-b94d-7bd1a2d5fac0	4220	Škofja Loka
00050000-55f6-dc75-ece6-c942646a15de	3211	Škofja vas
00050000-55f6-dc75-c1c0-7b7014d4379a	1291	Škofljica
00050000-55f6-dc75-c9b9-b7c08990b543	6274	Šmarje
00050000-55f6-dc75-bf55-b877ed44b35a	1293	Šmarje - Sap
00050000-55f6-dc75-5913-1b7bb935aee7	3240	Šmarje pri Jelšah
00050000-55f6-dc75-c936-a11fa462076d	8220	Šmarješke Toplice
00050000-55f6-dc75-8382-f4a5779833f1	2315	Šmartno na Pohorju
00050000-55f6-dc75-beb5-25fc3b602166	3341	Šmartno ob Dreti
00050000-55f6-dc75-b6b4-8d96a26d0b74	3327	Šmartno ob Paki
00050000-55f6-dc75-69a3-9ab55f2702c4	1275	Šmartno pri Litiji
00050000-55f6-dc75-2182-413c25587142	2383	Šmartno pri Slovenj Gradcu
00050000-55f6-dc75-1078-91691e945bdc	3201	Šmartno v Rožni dolini
00050000-55f6-dc75-1066-5872833b42c4	3325	Šoštanj
00050000-55f6-dc75-4b21-f711e9e7d04e	6222	Štanjel
00050000-55f6-dc75-b3e8-fb63b94469a8	3220	Štore
00050000-55f6-dc75-37c4-d0d376d07540	3304	Tabor
00050000-55f6-dc75-3d79-9c1e96f95422	3221	Teharje
00050000-55f6-dc75-195d-8e3f3d96a32b	9251	Tišina
00050000-55f6-dc75-7133-3751f27aefd3	5220	Tolmin
00050000-55f6-dc75-77d7-ac4dac8cff7c	3326	Topolšica
00050000-55f6-dc75-088c-a1606f65f3fa	2371	Trbonje
00050000-55f6-dc75-05fb-ce7997d91a3c	1420	Trbovlje
00050000-55f6-dc75-cbe6-4036f00114ac	8231	Trebelno 
00050000-55f6-dc75-d177-bbf5fd8b1171	8210	Trebnje
00050000-55f6-dc75-9c0f-69bc1ff117b8	5252	Trnovo pri Gorici
00050000-55f6-dc75-9b45-f96c863d007e	2254	Trnovska vas
00050000-55f6-dc75-ba4c-300403c14ca1	1222	Trojane
00050000-55f6-dc75-7758-51a8c431d956	1236	Trzin
00050000-55f6-dc75-44ec-c466ec9c77ab	4290	Tržič
00050000-55f6-dc75-1071-3193b55a234b	8295	Tržišče
00050000-55f6-dc75-3fc1-ed7a747b4523	1311	Turjak
00050000-55f6-dc75-6fb0-a13f7dc26a10	9224	Turnišče
00050000-55f6-dc75-038b-9290f844d89e	8323	Uršna sela
00050000-55f6-dc75-af9c-7686174679cc	1252	Vače
00050000-55f6-dc75-b183-9fc7f3e62ad0	3320	Velenje 
00050000-55f6-dc75-6329-b3dad50bd55d	3322	Velenje - poštni predali
00050000-55f6-dc75-071d-30f4342a8b5d	8212	Velika Loka
00050000-55f6-dc75-fbd9-6d96ff04fb29	2274	Velika Nedelja
00050000-55f6-dc75-a208-9e57491c1214	9225	Velika Polana
00050000-55f6-dc75-e4a3-36aaa137deca	1315	Velike Lašče
00050000-55f6-dc75-e729-c8484f747863	8213	Veliki Gaber
00050000-55f6-dc75-37f5-7a32dc52a0a0	9241	Veržej
00050000-55f6-dc75-acf1-aa29d6c55914	1312	Videm - Dobrepolje
00050000-55f6-dc75-bfe7-905e81f77401	2284	Videm pri Ptuju
00050000-55f6-dc75-b822-3e04fde1926f	8344	Vinica
00050000-55f6-dc75-b8b4-c1b918068117	5271	Vipava
00050000-55f6-dc75-8b0f-c65c75806b78	4212	Visoko
00050000-55f6-dc75-18b1-e91ec41216c7	1294	Višnja Gora
00050000-55f6-dc75-ebb5-c60080d218c4	3205	Vitanje
00050000-55f6-dc75-f68b-4adad453f205	2255	Vitomarci
00050000-55f6-dc75-74a0-53d87ad0ef03	1217	Vodice
00050000-55f6-dc75-47df-dffc54b4b79e	3212	Vojnik\t
00050000-55f6-dc75-5ea0-1214033f6bd1	5293	Volčja Draga
00050000-55f6-dc75-9a3e-828b343f3e25	2232	Voličina
00050000-55f6-dc75-bc25-499aa33d18da	3305	Vransko
00050000-55f6-dc75-ca19-023b9492b6b4	6217	Vremski Britof
00050000-55f6-dc75-4f77-449847680804	1360	Vrhnika
00050000-55f6-dc75-ee81-e8fadd6edaa8	2365	Vuhred
00050000-55f6-dc75-cd64-f8aa9a1b2675	2367	Vuzenica
00050000-55f6-dc75-689e-0db72adb6a7f	8292	Zabukovje 
00050000-55f6-dc75-7c65-c9ec0e88ab76	1410	Zagorje ob Savi
00050000-55f6-dc75-7225-739c986ace61	1303	Zagradec
00050000-55f6-dc75-de14-648167b2ad08	2283	Zavrč
00050000-55f6-dc75-3a1d-8a7b29df1d90	8272	Zdole 
00050000-55f6-dc75-030a-8fa3350c9ec2	4201	Zgornja Besnica
00050000-55f6-dc75-7d6e-623c52f3bb40	2242	Zgornja Korena
00050000-55f6-dc75-d433-309b67336fd5	2201	Zgornja Kungota
00050000-55f6-dc75-5675-e3efaa6fe76b	2316	Zgornja Ložnica
00050000-55f6-dc75-6cc6-8b04c6ecc766	2314	Zgornja Polskava
00050000-55f6-dc75-b8d6-2840dbf8d4ce	2213	Zgornja Velka
00050000-55f6-dc75-620a-ce21b49f0e76	4247	Zgornje Gorje
00050000-55f6-dc75-77d2-f4467fa931b0	4206	Zgornje Jezersko
00050000-55f6-dc75-e8f1-7b9fbfeef7e4	2285	Zgornji Leskovec
00050000-55f6-dc75-351e-e5c4bf1ddb96	1432	Zidani Most
00050000-55f6-dc75-80d7-4741e030d714	3214	Zreče
00050000-55f6-dc75-d986-ac65386f5fd6	4209	Žabnica
00050000-55f6-dc75-0e84-acd2b5c60d3c	3310	Žalec
00050000-55f6-dc75-cbe2-e3f136114683	4228	Železniki
00050000-55f6-dc75-7800-0285138efe1f	2287	Žetale
00050000-55f6-dc75-83cf-603f121aa76b	4226	Žiri
00050000-55f6-dc75-4fc4-9aec167c81c2	4274	Žirovnica
00050000-55f6-dc75-c026-b248b4c83aa0	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 19356788)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 19356420)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 19356230)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f6-dc78-e9fe-0d36176ecbeb	00080000-55f6-dc77-0068-c31e709265bc	\N	00040000-55f6-dc76-82ad-5b5a1e33e417	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f6-dc78-7eb2-1d02c92d2b3f	00080000-55f6-dc77-0068-c31e709265bc	\N	00040000-55f6-dc76-82ad-5b5a1e33e417	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f6-dc78-7e8c-6925855682b3	00080000-55f6-dc77-bab9-42f6c39d68fd	\N	00040000-55f6-dc76-82ad-5b5a1e33e417	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 19356308)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19356432)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19356802)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19356812)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f6-dc78-bdb8-13b73de67e47	00080000-55f6-dc77-9f5a-e2a3f90c15db	0987	AK
00190000-55f6-dc78-f745-c4d65bbbf659	00080000-55f6-dc77-bab9-42f6c39d68fd	0989	AK
00190000-55f6-dc78-104e-4fad9d4eb461	00080000-55f6-dc77-96c5-244985a9f4ea	0986	AK
00190000-55f6-dc78-6a63-9f035dde4e77	00080000-55f6-dc77-54d1-0568a0ab938b	0984	AK
00190000-55f6-dc78-1528-9d2877462139	00080000-55f6-dc77-1ede-e20a10620f47	0983	AK
00190000-55f6-dc78-746c-4a2e08fbe9ce	00080000-55f6-dc77-80f4-b74d91720afb	0982	AK
00190000-55f6-dc79-8cdf-94d63a8fb292	00080000-55f6-dc79-876e-fc23a2c8f37c	1001	AK
\.


--
-- TOC entry 2989 (class 0 OID 19356745)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f6-dc78-a5e7-405894e0150b	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2993 (class 0 OID 19356820)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 19356461)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f6-dc77-b20e-b241c5b10b74	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f6-dc77-92a2-e0977d40cdfb	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f6-dc77-0356-49981e2977f5	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f6-dc77-37d2-940c4454818b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f6-dc77-2eca-c38cbfa73093	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f6-dc77-d7a9-88efd6f2da9d	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f6-dc77-49d8-cce571cc279b	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2962 (class 0 OID 19356405)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19356395)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19356598)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19356535)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 19356103)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f6-dc79-876e-fc23a2c8f37c	00010000-55f6-dc76-05f3-e626ab7d01a7	2015-09-14 16:40:57	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f6-dc79-6dff-1f4e518cea61	00010000-55f6-dc76-05f3-e626ab7d01a7	2015-09-14 16:40:57	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f6-dc79-8cdf-94d63a8fb292	00010000-55f6-dc76-05f3-e626ab7d01a7	2015-09-14 16:40:57	INS	a:0:{}
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2971 (class 0 OID 19356474)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 19356141)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f6-dc76-f67d-9603031c567f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f6-dc76-44bd-7313dc357879	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f6-dc76-690e-b3f891b60a3f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f6-dc76-906e-dde1ef51ccc6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f6-dc76-3d4f-139a56d6ed8b	planer	Planer dogodkov v koledarju	t
00020000-55f6-dc76-e558-58ee3d4ad859	kadrovska	Kadrovska služba	t
00020000-55f6-dc76-a925-0317fea82aa3	arhivar	Ažuriranje arhivalij	t
00020000-55f6-dc76-aa22-f28e8b6e52a5	igralec	Igralec	t
00020000-55f6-dc76-a14b-9748f010235a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f6-dc77-b287-9f53807235b2	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2938 (class 0 OID 19356125)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f6-dc76-94dd-aa6d5823921c	00020000-55f6-dc76-690e-b3f891b60a3f
00010000-55f6-dc76-05f3-e626ab7d01a7	00020000-55f6-dc76-690e-b3f891b60a3f
00010000-55f6-dc78-e3d9-26cd566196e9	00020000-55f6-dc77-b287-9f53807235b2
\.


--
-- TOC entry 2973 (class 0 OID 19356488)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19356426)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 19356372)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 19356090)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f6-dc76-f8f6-918e487b0a40	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f6-dc76-5a13-6692f60f30a6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f6-dc76-d924-1a860092f6c3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f6-dc76-488e-111c8c7b6392	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f6-dc76-1cbf-afab667a532c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2933 (class 0 OID 19356082)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f6-dc76-fd9c-0be89f36fa17	00230000-55f6-dc76-488e-111c8c7b6392	popa
00240000-55f6-dc76-7bff-74c77ee089c6	00230000-55f6-dc76-488e-111c8c7b6392	oseba
00240000-55f6-dc76-f332-306066be9772	00230000-55f6-dc76-488e-111c8c7b6392	sezona
00240000-55f6-dc76-ef9d-5c7cb449ce41	00230000-55f6-dc76-5a13-6692f60f30a6	prostor
00240000-55f6-dc76-7524-1124feaa3e26	00230000-55f6-dc76-488e-111c8c7b6392	besedilo
00240000-55f6-dc76-4737-bce9bff47e6d	00230000-55f6-dc76-488e-111c8c7b6392	uprizoritev
00240000-55f6-dc76-65d3-5893a847a1b4	00230000-55f6-dc76-488e-111c8c7b6392	funkcija
00240000-55f6-dc76-e7ea-c7fbee2d56b7	00230000-55f6-dc76-488e-111c8c7b6392	tipfunkcije
00240000-55f6-dc76-0d2f-5841fe7e9a38	00230000-55f6-dc76-488e-111c8c7b6392	alternacija
00240000-55f6-dc76-71ee-af1da4616eca	00230000-55f6-dc76-f8f6-918e487b0a40	pogodba
00240000-55f6-dc76-4237-e33f12fcaf9f	00230000-55f6-dc76-488e-111c8c7b6392	zaposlitev
00240000-55f6-dc76-4d1f-38979c58b197	00230000-55f6-dc76-488e-111c8c7b6392	zvrstuprizoritve
00240000-55f6-dc76-b6bc-ad41abb7a3c6	00230000-55f6-dc76-f8f6-918e487b0a40	programdela
00240000-55f6-dc76-3dd6-e88dbc0711f6	00230000-55f6-dc76-488e-111c8c7b6392	zapis
\.


--
-- TOC entry 2932 (class 0 OID 19356077)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
bad6a770-3b35-4f19-9eee-3944d0ca9a6e	00240000-55f6-dc76-fd9c-0be89f36fa17	0	1001
\.


--
-- TOC entry 2978 (class 0 OID 19356545)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f6-dc78-fc4c-b5ad7ea5e69d	000e0000-55f6-dc78-a1c7-29ebe0e2e231	00080000-55f6-dc77-0068-c31e709265bc	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f6-dc76-c617-e3de7bb7dc93
00270000-55f6-dc78-2d90-951374b8e72b	000e0000-55f6-dc78-a1c7-29ebe0e2e231	00080000-55f6-dc77-0068-c31e709265bc	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f6-dc76-c617-e3de7bb7dc93
\.


--
-- TOC entry 2945 (class 0 OID 19356203)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 19356382)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f6-dc78-2993-da2ee386c311	00180000-55f6-dc78-7bd7-ced22eab2ce0	000c0000-55f6-dc78-78cd-326e99e6cb70	00090000-55f6-dc78-1e27-ecdc6855cde9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-dc78-3e7c-ab68d6ab3819	00180000-55f6-dc78-7bd7-ced22eab2ce0	000c0000-55f6-dc78-d304-f9289ee9113c	00090000-55f6-dc78-d348-706c6c62919e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-dc78-8176-8ff696fc103f	00180000-55f6-dc78-7bd7-ced22eab2ce0	000c0000-55f6-dc78-8dc6-a6e6b25ef749	00090000-55f6-dc78-bde7-fb90342f7d9a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-dc78-eb03-92fc01543bb2	00180000-55f6-dc78-7bd7-ced22eab2ce0	000c0000-55f6-dc78-9765-c3b7763373c2	00090000-55f6-dc78-c4a8-3c25d96d4a30	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-dc78-2023-d987742d0621	00180000-55f6-dc78-7bd7-ced22eab2ce0	000c0000-55f6-dc78-5fb8-ddc3e171e319	00090000-55f6-dc78-7a9c-827f80f0c16c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-dc78-2ace-afbf7a092b77	00180000-55f6-dc78-bfac-d7a1438772f5	\N	00090000-55f6-dc78-7a9c-827f80f0c16c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2981 (class 0 OID 19356586)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f6-dc76-7969-b365be0cddb9	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f6-dc76-ef98-e596a820c0be	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f6-dc76-9e4d-4a0760913220	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f6-dc76-f444-eab7d86a8038	04	Režija	Režija	Režija	umetnik
000f0000-55f6-dc76-1447-9a9e326eaa70	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f6-dc76-263f-903338c26f9d	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f6-dc76-77ce-4f6ff6d1f9d6	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f6-dc76-c1b1-95cd041b8ab6	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f6-dc76-6669-e1868a2f5419	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f6-dc76-6d7e-8d2692e5e5c1	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f6-dc76-91f8-20113e4a88d1	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f6-dc76-7b25-21f94bb3b209	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f6-dc76-67af-44feb85d2106	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f6-dc76-2106-3f83e24524ef	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f6-dc76-d72a-c201573d7cc7	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f6-dc76-86dc-f961ba9238a3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f6-dc76-77c4-0d58acfaa1f0	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f6-dc76-8ef9-67e77082deae	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2994 (class 0 OID 19356830)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f6-dc75-193a-23ffe041af58	01	Velika predstava	f	1.00	1.00
002b0000-55f6-dc75-033e-0f8280334d68	02	Mala predstava	f	0.50	0.50
002b0000-55f6-dc75-6f0f-0340dd91a99d	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f6-dc75-489b-dcf8ee6d8f44	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f6-dc75-c22f-4b751b7e8ba5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2950 (class 0 OID 19356265)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 19356112)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f6-dc76-05f3-e626ab7d01a7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROJBAOFPu1J3xftBybLw1B8vRnyOHmkVK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f6-dc78-7ee2-7a7524a55c7e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f6-dc78-d26b-ba995aa259df	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f6-dc78-d4fe-33021fcda03f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f6-dc78-ea68-90246b830d76	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f6-dc78-a236-c693551e942b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f6-dc78-cdfa-dc788d99fcf2	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f6-dc78-c3a5-1ce7f1c3efea	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f6-dc78-9753-895f3163ecdc	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f6-dc78-de93-ddbd2b135dae	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f6-dc78-e3d9-26cd566196e9	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f6-dc76-94dd-aa6d5823921c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2985 (class 0 OID 19356635)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f6-dc78-09d3-0ba06b83f760	00160000-55f6-dc77-b490-ba2156aec221	\N	00140000-55f6-dc76-8f69-2e3e58b42a7f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f6-dc77-2eca-c38cbfa73093
000e0000-55f6-dc78-a1c7-29ebe0e2e231	00160000-55f6-dc77-66bd-52f5a3122934	\N	00140000-55f6-dc76-6da4-21924de787f3	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f6-dc77-d7a9-88efd6f2da9d
000e0000-55f6-dc78-4464-fe442ae99d22	\N	\N	00140000-55f6-dc76-6da4-21924de787f3	00190000-55f6-dc78-bdb8-13b73de67e47	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f6-dc77-2eca-c38cbfa73093
000e0000-55f6-dc78-d7b8-d595f41f4002	\N	\N	00140000-55f6-dc76-6da4-21924de787f3	00190000-55f6-dc78-bdb8-13b73de67e47	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f6-dc77-2eca-c38cbfa73093
000e0000-55f6-dc78-7834-b7acb3e0fe08	\N	\N	00140000-55f6-dc76-6da4-21924de787f3	00190000-55f6-dc78-bdb8-13b73de67e47	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f6-dc77-b20e-b241c5b10b74
000e0000-55f6-dc78-c381-d9f3222ea7d3	\N	\N	00140000-55f6-dc76-6da4-21924de787f3	00190000-55f6-dc78-bdb8-13b73de67e47	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f6-dc77-b20e-b241c5b10b74
\.


--
-- TOC entry 2955 (class 0 OID 19356326)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f6-dc78-92e7-e61163436131	000e0000-55f6-dc78-a1c7-29ebe0e2e231	\N	1	
00200000-55f6-dc78-3c13-26a6b5a19b6c	000e0000-55f6-dc78-a1c7-29ebe0e2e231	\N	2	
00200000-55f6-dc78-e0d4-b77dda0bce19	000e0000-55f6-dc78-a1c7-29ebe0e2e231	\N	3	
00200000-55f6-dc78-8e2f-584dd0ed1776	000e0000-55f6-dc78-a1c7-29ebe0e2e231	\N	4	
00200000-55f6-dc78-b61e-422d9a8dabc2	000e0000-55f6-dc78-a1c7-29ebe0e2e231	\N	5	
\.


--
-- TOC entry 2969 (class 0 OID 19356453)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19356559)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f6-dc76-99a8-66be68995209	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f6-dc76-bd4c-e57f43c76700	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f6-dc76-ca4f-d63f90970051	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f6-dc76-8625-664be183e45d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f6-dc76-a068-e61fbda77112	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f6-dc76-5da6-49b344d03ffd	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f6-dc76-78b3-1cb81bc3625e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f6-dc76-b69c-e7286b1fca14	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f6-dc76-c617-e3de7bb7dc93	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f6-dc76-0c45-12b6eeb3ada4	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f6-dc76-7bd0-21b43b90f4aa	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f6-dc76-f7bc-1b099226e711	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f6-dc76-0fd5-5b50ab2e22f7	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f6-dc76-a3b7-4537a6ab7b54	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f6-dc76-61e6-78345ee25e32	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f6-dc76-5b97-873509d21d9f	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f6-dc76-a37b-3a564cfb12cd	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f6-dc76-8902-b4b6dce652b1	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f6-dc76-9349-970b6af5cca4	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f6-dc76-9733-25e7c320aaf1	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f6-dc76-696e-8c2d9ba741de	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f6-dc76-4b38-3743f4000a5b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f6-dc76-932b-59bc57de9acb	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f6-dc76-c700-ff118aecad8e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f6-dc76-adf3-ffdcb3525b69	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f6-dc76-9f88-ec24b603a849	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f6-dc76-adce-f1a08331290a	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f6-dc76-ee60-6ce850c5ceeb	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2997 (class 0 OID 19356876)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 19356848)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 19356888)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 19356525)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f6-dc78-954d-42de221e065f	00090000-55f6-dc78-d348-706c6c62919e	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-dc78-7c39-a862576b3e3d	00090000-55f6-dc78-bde7-fb90342f7d9a	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-dc78-1c46-15f6e68b1a41	00090000-55f6-dc78-51ee-2e0cf53447ab	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-dc78-8b25-d24d38f29492	00090000-55f6-dc78-55af-f77fb70ab3d6	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-dc78-4db1-17bb285f3cd1	00090000-55f6-dc78-1e27-ecdc6855cde9	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-dc78-3c0b-c72ca03bffec	00090000-55f6-dc78-305d-730472dc455d	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2957 (class 0 OID 19356362)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19356625)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f6-dc76-8f69-2e3e58b42a7f	01	Drama	drama (SURS 01)
00140000-55f6-dc76-8d3b-59a3fedbff03	02	Opera	opera (SURS 02)
00140000-55f6-dc76-a2fe-d25fb6ff999a	03	Balet	balet (SURS 03)
00140000-55f6-dc76-8059-c0a6d65c7414	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f6-dc76-bee5-590229a56d4b	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f6-dc76-6da4-21924de787f3	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f6-dc76-96b8-b9b30e6e66c9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2975 (class 0 OID 19356515)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 19356166)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 19356684)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 19356674)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 19356584)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 19356928)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 19356351)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 19356371)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 19356846)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19356291)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 19356739)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 19356511)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 19356324)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 19356305)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 19356418)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 19356905)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 19356912)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 19356936)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 19356445)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 19356263)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 19356175)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 19356199)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 19356155)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 19356140)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 19356451)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 19356487)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 19356620)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19356227)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19356251)
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
-- TOC entry 2679 (class 2606 OID 19356800)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 19356424)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 19356241)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19356312)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 19356436)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 19356809)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 19356817)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 19356787)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 19356828)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 19356469)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 19356409)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 19356400)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 19356608)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 19356542)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 19356111)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 19356478)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 19356129)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 19356149)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 19356496)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 19356431)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 19356380)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 19356099)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19356087)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 19356081)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 19356555)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 19356208)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 19356391)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 19356595)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 19356840)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 19356276)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 19356124)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 19356653)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 19356334)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 19356459)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 19356567)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 19356886)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 19356870)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 19356894)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 19356533)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 19356366)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 19356633)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 19356523)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 19356360)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 19356361)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 19356359)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 19356358)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 19356357)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2624 (class 1259 OID 19356556)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 19356557)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 19356558)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 19356907)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 19356906)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 19356229)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 19356452)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 19356874)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 19356873)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 19356875)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 19356872)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 19356871)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 19356438)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 19356437)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 19356335)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 19356512)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19356514)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 19356513)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 19356307)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 19356306)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 19356829)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 19356622)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 19356623)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 19356624)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 19356895)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 19356658)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 19356655)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 19356659)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 19356657)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 19356656)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 19356278)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 19356277)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 19356202)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 19356479)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 19356156)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 19356157)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 19356499)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 19356498)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 19356497)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 19356313)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 19356314)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 19356089)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 19356404)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 19356402)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 19356401)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 19356403)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 19356130)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 19356131)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 19356460)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 19356929)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 19356937)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 19356938)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 19356425)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 19356543)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 19356544)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 19356744)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 19356743)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 19356740)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 19356741)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 19356742)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 19356243)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 19356242)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 19356244)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 19356473)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 19356472)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 19356810)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 19356811)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 19356688)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 19356689)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 19356686)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 19356687)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 19356534)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 19356413)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 19356412)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 19356410)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 19356411)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 19356676)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 19356675)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 19356325)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 19356801)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 19356847)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 19356913)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 19356914)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 19356177)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 19356176)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 19356209)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19356210)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 19356394)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 19356393)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 19356392)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 19356353)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2545 (class 1259 OID 19356354)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2546 (class 1259 OID 19356352)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2547 (class 1259 OID 19356356)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2548 (class 1259 OID 19356355)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 19356228)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 19356292)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19356294)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 19356293)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 19356295)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 19356419)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 19356621)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 19356654)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 19356596)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19356597)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 19356200)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 19356201)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 19356524)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 19356100)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19356264)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 19356088)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2597 (class 1259 OID 19356471)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 19356470)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 19356685)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 19356252)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 19356634)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 19356887)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 19356818)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 19356819)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 19356585)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 19356381)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 19356150)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 19357059)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 19357064)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 19357084)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 19357054)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 19357074)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 19357079)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 19357069)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2785 (class 2606 OID 19357234)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2784 (class 2606 OID 19357239)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2783 (class 2606 OID 19357244)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 19357409)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2818 (class 2606 OID 19357404)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 19356994)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 19357164)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2812 (class 2606 OID 19357389)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 19357384)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 19357394)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 19357379)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2815 (class 2606 OID 19357374)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2767 (class 2606 OID 19357159)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 19357154)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 19357049)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 19357204)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 19357214)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 19357209)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 19357029)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 19357024)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 19357144)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 19357364)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 19357249)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 19357254)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 19357259)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2816 (class 2606 OID 19357399)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2790 (class 2606 OID 19357279)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2793 (class 2606 OID 19357264)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2789 (class 2606 OID 19357284)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2791 (class 2606 OID 19357274)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2792 (class 2606 OID 19357269)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 19357019)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 19357014)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 19356979)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 19356974)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 19357184)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 19356954)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 19356959)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2774 (class 2606 OID 19357199)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 19357194)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 19357189)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 19357034)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 19357039)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 19356939)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2757 (class 2606 OID 19357119)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2759 (class 2606 OID 19357109)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2760 (class 2606 OID 19357104)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2758 (class 2606 OID 19357114)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 19356944)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 19356949)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 19357169)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2821 (class 2606 OID 19357424)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 19357429)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2822 (class 2606 OID 19357434)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 19357149)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2782 (class 2606 OID 19357224)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2781 (class 2606 OID 19357229)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 19357339)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 19357334)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 19357319)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 19357324)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2802 (class 2606 OID 19357329)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 19357004)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 19356999)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 19357009)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 19357179)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2772 (class 2606 OID 19357174)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2807 (class 2606 OID 19357349)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2806 (class 2606 OID 19357354)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2797 (class 2606 OID 19357309)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 19357314)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2799 (class 2606 OID 19357299)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2798 (class 2606 OID 19357304)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 19357219)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 19357139)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2762 (class 2606 OID 19357134)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 19357124)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2763 (class 2606 OID 19357129)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 19357294)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2795 (class 2606 OID 19357289)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 19357044)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 19357344)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2808 (class 2606 OID 19357359)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 19357369)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 19357414)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 19357419)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 19356969)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 19356964)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 19356984)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 19356989)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 19357099)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 19357094)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 19357089)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-14 16:40:58 CEST

--
-- PostgreSQL database dump complete
--

