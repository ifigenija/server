--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-16 15:34:10 CEST

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
-- TOC entry 181 (class 1259 OID 19833528)
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
-- TOC entry 226 (class 1259 OID 19834050)
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
-- TOC entry 225 (class 1259 OID 19834033)
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
-- TOC entry 219 (class 1259 OID 19833941)
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
-- TOC entry 240 (class 1259 OID 19834289)
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
-- TOC entry 195 (class 1259 OID 19833709)
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
-- TOC entry 197 (class 1259 OID 19833740)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19834215)
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
-- TOC entry 190 (class 1259 OID 19833649)
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
-- TOC entry 227 (class 1259 OID 19834063)
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
-- TOC entry 213 (class 1259 OID 19833873)
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
-- TOC entry 193 (class 1259 OID 19833688)
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
-- TOC entry 191 (class 1259 OID 19833666)
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
-- TOC entry 202 (class 1259 OID 19833787)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19834270)
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
-- TOC entry 239 (class 1259 OID 19834282)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19834304)
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
-- TOC entry 206 (class 1259 OID 19833812)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19833623)
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
-- TOC entry 182 (class 1259 OID 19833537)
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
-- TOC entry 183 (class 1259 OID 19833548)
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
-- TOC entry 178 (class 1259 OID 19833502)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19833521)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19833819)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19833853)
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
-- TOC entry 222 (class 1259 OID 19833982)
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
-- TOC entry 185 (class 1259 OID 19833581)
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
-- TOC entry 187 (class 1259 OID 19833615)
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
-- TOC entry 229 (class 1259 OID 19834161)
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
-- TOC entry 203 (class 1259 OID 19833793)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19833600)
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
-- TOC entry 192 (class 1259 OID 19833678)
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
-- TOC entry 205 (class 1259 OID 19833805)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19834175)
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
-- TOC entry 231 (class 1259 OID 19834185)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19834118)
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
-- TOC entry 232 (class 1259 OID 19834193)
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
-- TOC entry 209 (class 1259 OID 19833834)
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
-- TOC entry 201 (class 1259 OID 19833778)
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
-- TOC entry 200 (class 1259 OID 19833768)
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
-- TOC entry 221 (class 1259 OID 19833971)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19833908)
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
-- TOC entry 175 (class 1259 OID 19833473)
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
-- TOC entry 174 (class 1259 OID 19833471)
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
-- TOC entry 210 (class 1259 OID 19833847)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19833511)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19833495)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19833861)
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
-- TOC entry 204 (class 1259 OID 19833799)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19833745)
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
-- TOC entry 173 (class 1259 OID 19833460)
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
-- TOC entry 172 (class 1259 OID 19833452)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19833447)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19833918)
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
-- TOC entry 184 (class 1259 OID 19833573)
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
-- TOC entry 199 (class 1259 OID 19833755)
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
-- TOC entry 220 (class 1259 OID 19833959)
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
-- TOC entry 233 (class 1259 OID 19834203)
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
-- TOC entry 189 (class 1259 OID 19833635)
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
-- TOC entry 176 (class 1259 OID 19833482)
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
-- TOC entry 224 (class 1259 OID 19834008)
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
-- TOC entry 194 (class 1259 OID 19833699)
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
-- TOC entry 208 (class 1259 OID 19833826)
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
-- TOC entry 218 (class 1259 OID 19833932)
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
-- TOC entry 236 (class 1259 OID 19834250)
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
-- TOC entry 235 (class 1259 OID 19834222)
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
-- TOC entry 237 (class 1259 OID 19834262)
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
-- TOC entry 215 (class 1259 OID 19833898)
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
-- TOC entry 196 (class 1259 OID 19833735)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19833998)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19833888)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2195 (class 2604 OID 19833476)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2944 (class 0 OID 19833528)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 19834050)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f9-6fd0-d38f-952a9074f857	000d0000-55f9-6fd0-bbab-0edf50d3f57b	\N	00090000-55f9-6fd0-b92d-f735f5f8e412	000b0000-55f9-6fd0-6a48-241cee77f278	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f9-6fd0-6dc9-673beef08091	000d0000-55f9-6fd0-78e5-1d635caacd09	00100000-55f9-6fd0-bd67-337c5e3deb6c	00090000-55f9-6fd0-716f-0dbcb3f3fa5b	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f9-6fd0-42b7-f08769a609b7	000d0000-55f9-6fd0-e08d-884fa275b750	00100000-55f9-6fd0-232a-e9a242fff37d	00090000-55f9-6fd0-c4bf-73dcf2fa746f	\N	0003	t	\N	2015-09-16	\N	2	t	\N	f	f
000c0000-55f9-6fd0-70f2-039b27e733bc	000d0000-55f9-6fd0-9cf8-73dc417e1866	\N	00090000-55f9-6fd0-8239-1cce7177811f	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f9-6fd0-72ee-44593278724f	000d0000-55f9-6fd0-1ae0-8fe3039ba8e0	\N	00090000-55f9-6fd0-893b-89a1da0a5a59	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f9-6fd0-2024-7f9790bd2c91	000d0000-55f9-6fd0-2f5d-d337fdf67303	\N	00090000-55f9-6fd0-c009-124a1bb19802	000b0000-55f9-6fd0-c61f-d7aae2c5744b	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f9-6fd0-7a8d-b0c93262c28f	000d0000-55f9-6fd0-3d10-9f70367269f6	00100000-55f9-6fd0-1c75-810c5770c5ea	00090000-55f9-6fd0-178d-23ed5c7b6244	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f9-6fd0-b440-f67e8751cae3	000d0000-55f9-6fd0-9580-d82bf9a833b2	\N	00090000-55f9-6fd0-a4f7-ed745c43bded	000b0000-55f9-6fd0-84d8-a2eacb49d3e6	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f9-6fd0-0245-a30aaf456601	000d0000-55f9-6fd0-3d10-9f70367269f6	00100000-55f9-6fd0-9742-e827ae2a26b6	00090000-55f9-6fd0-7ed7-1dbaa8f22d25	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f9-6fd0-94a6-47c2a95ce8f3	000d0000-55f9-6fd0-3d10-9f70367269f6	00100000-55f9-6fd0-3734-fe571d440c1e	00090000-55f9-6fd0-1cd9-3b7b5b7a97e8	\N	0010	t	\N	2015-09-16	\N	16	f	\N	f	t
000c0000-55f9-6fd0-297e-b70e14619875	000d0000-55f9-6fd0-3d10-9f70367269f6	00100000-55f9-6fd0-69c2-3c64ab7bc90c	00090000-55f9-6fd0-8d09-2c7e0c3a61c7	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f9-6fd0-0ee8-45f02e75f9a3	000d0000-55f9-6fd0-a85b-6b97bc7c981f	\N	00090000-55f9-6fd0-716f-0dbcb3f3fa5b	000b0000-55f9-6fd0-7841-0e5649e57b56	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2988 (class 0 OID 19834033)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19833941)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f9-6fd0-a543-6bad4b27de7d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f9-6fd0-c594-2ca5409d4c44	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f9-6fd0-82ae-8a44153bd29f	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3003 (class 0 OID 19834289)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 19833709)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f9-6fd0-1fc7-b3d83f8caee2	\N	\N	00200000-55f9-6fd0-2a28-b38c9cbaa72e	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f9-6fd0-bd57-737b5c2de7f3	\N	\N	00200000-55f9-6fd0-888a-180a48677b2e	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f9-6fd0-11b0-cd2b2cb60e46	\N	\N	00200000-55f9-6fd0-6954-38652eefb5f1	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f9-6fd0-64b1-331a27b24f1a	\N	\N	00200000-55f9-6fd0-160d-c6b0a36bc25c	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f9-6fd0-19ec-b2e7f44be978	\N	\N	00200000-55f9-6fd0-0f1f-642ff80f0db1	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2960 (class 0 OID 19833740)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 19834215)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 19833649)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f9-6fcf-db8b-1dbf570f104f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f9-6fcf-87d8-f93e319ba233	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f9-6fcf-cb3a-6a8e89245b15	AL	ALB	008	Albania 	Albanija	\N
00040000-55f9-6fcf-35ff-e24319618902	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f9-6fcf-fcba-e7ae35b7f202	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f9-6fcf-1de8-c98eccd66874	AD	AND	020	Andorra 	Andora	\N
00040000-55f9-6fcf-34b1-00b595ebbc5f	AO	AGO	024	Angola 	Angola	\N
00040000-55f9-6fcf-090c-79f3e30c2e06	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f9-6fcf-862e-2db746667a91	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f9-6fcf-6ecb-af25c76fbecf	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f9-6fcf-e7b6-0c50e9814f9e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f9-6fcf-822f-a7ac7adaf6e1	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f9-6fcf-810e-9b4e5566549d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f9-6fcf-6f5c-67538e02d930	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f9-6fcf-8e02-66a941f9d1af	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f9-6fcf-fb9f-ec219a444571	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f9-6fcf-c4e0-157cff8ddb35	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f9-6fcf-01b6-99b82be86545	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f9-6fcf-4434-6a8415106e53	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f9-6fcf-dee0-94ecb0da609b	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f9-6fcf-5b43-76b292de0a1c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f9-6fcf-1251-b93fe8978667	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f9-6fcf-f794-3e4685d54ed9	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f9-6fcf-6d2b-576c864fd7b1	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f9-6fcf-8684-97f3f09065a6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f9-6fcf-c492-acd92e50dc8b	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f9-6fcf-94af-bf10f17b2d2f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f9-6fcf-3571-bdd5d31266ee	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f9-6fcf-acb3-6c10ecdea55c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f9-6fcf-ca57-61dc4525e0b3	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f9-6fcf-f920-1acce50b1a29	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f9-6fcf-0d69-b595b9166b24	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f9-6fcf-34a9-8f00af60a27a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f9-6fcf-8a6b-501a86c1d282	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f9-6fcf-8b3b-b500a46813f8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f9-6fcf-63d8-a3ca0d79a4c6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f9-6fcf-64ce-a0999b702deb	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f9-6fcf-983a-75b2084f60c2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f9-6fcf-3f8b-4109f9a8aba9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f9-6fcf-4c40-57564656d2b7	CA	CAN	124	Canada 	Kanada	\N
00040000-55f9-6fcf-ef03-d9c54190758f	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f9-6fcf-7287-1810bc56e31e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f9-6fcf-71ff-11e522137c2f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f9-6fcf-e5f6-a91aeaf28b68	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f9-6fcf-7882-1504f5a3858a	CL	CHL	152	Chile 	Čile	\N
00040000-55f9-6fcf-e83a-87b4be7cad18	CN	CHN	156	China 	Kitajska	\N
00040000-55f9-6fcf-522b-a6c321f270a1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f9-6fcf-bb45-50a6ab65203f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f9-6fcf-a1ca-d9efe7beee02	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f9-6fcf-07a6-a278fbf3ea62	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f9-6fcf-b455-53600ba92ad5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f9-6fcf-fada-3f2c18d4eb93	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f9-6fcf-4e6c-4a66b0acc913	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f9-6fcf-4c5f-cdeab9631406	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f9-6fcf-28b7-1290d34716be	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f9-6fcf-f54a-05fa5e4ce45e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f9-6fcf-88f7-369703cb8e05	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f9-6fcf-5e58-a0fe3f8df2df	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f9-6fcf-2956-f61877e127c2	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f9-6fcf-f4ba-67676129a99d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f9-6fcf-0773-de172df8123c	DK	DNK	208	Denmark 	Danska	\N
00040000-55f9-6fcf-5f6f-3873b30149cb	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f9-6fcf-45d4-8922dbf0a8ad	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f9-6fcf-9278-7cd04467b410	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f9-6fcf-de44-0b31a1cb7494	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f9-6fcf-e3fb-3bc2f1ed629e	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f9-6fcf-392b-2f27ac74bf93	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f9-6fcf-0a90-202c8970421c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f9-6fcf-a7ba-ed51378c5b1c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f9-6fcf-37d0-ff0c62e64e67	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f9-6fcf-7937-fcfbba498cbf	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f9-6fcf-9e6b-5c4cc58714e6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f9-6fcf-a24c-e576aca476ad	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f9-6fcf-c5d0-1f38b3ace5c8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f9-6fcf-75ba-28ccb93d41f4	FI	FIN	246	Finland 	Finska	\N
00040000-55f9-6fcf-9e08-6bf352bc02f0	FR	FRA	250	France 	Francija	\N
00040000-55f9-6fcf-fafc-07fd9683e5bc	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f9-6fcf-0f6e-421f30722cfa	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f9-6fcf-b3b7-d1f2d72a2ffb	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f9-6fcf-df15-2f137d08e18b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f9-6fcf-75b2-26d7b4bd32f4	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f9-6fcf-348a-2c15dcfb7221	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f9-6fcf-e476-e841c40955e7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f9-6fcf-98b6-591f59126b98	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f9-6fcf-8d97-698062036053	GH	GHA	288	Ghana 	Gana	\N
00040000-55f9-6fcf-4ae9-9da1e400ba10	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f9-6fcf-ef17-92648f09c4fe	GR	GRC	300	Greece 	Grčija	\N
00040000-55f9-6fcf-4b73-df564e2decb0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f9-6fcf-3d15-023cfaf25b3d	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f9-6fcf-fb62-9e25e3be1569	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f9-6fcf-cd49-95d635a2e2cb	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f9-6fcf-32c3-f006e682fb54	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f9-6fcf-ea8e-7df54c068deb	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f9-6fcf-faef-de0ad5a81ac1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f9-6fcf-8867-91a9af3fe20f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f9-6fcf-0c6f-c8b1b0a2c7df	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f9-6fcf-14d3-35f8c50ebd3d	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f9-6fcf-0f2d-1a21e2642bc3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f9-6fcf-d4d9-f2bb259f3c72	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f9-6fcf-4b33-3ee7b20b5308	HN	HND	340	Honduras 	Honduras	\N
00040000-55f9-6fcf-13fd-d381adc519bb	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f9-6fcf-4416-21ca0ba8a1f0	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f9-6fcf-8d4f-2900e6bebced	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f9-6fcf-951b-ec458d1ba83b	IN	IND	356	India 	Indija	\N
00040000-55f9-6fcf-3e87-2a8fdfd632db	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f9-6fcf-047a-d947f9bea495	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f9-6fcf-5c42-371211769773	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f9-6fcf-adb4-afd479a4011f	IE	IRL	372	Ireland 	Irska	\N
00040000-55f9-6fcf-0011-bb70ebb366bf	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f9-6fcf-5e38-ce6a9b6c0362	IL	ISR	376	Israel 	Izrael	\N
00040000-55f9-6fcf-76ca-4adcc4505cd4	IT	ITA	380	Italy 	Italija	\N
00040000-55f9-6fcf-a2ec-59a18a93f9c6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f9-6fcf-6b30-fddb10a94bbb	JP	JPN	392	Japan 	Japonska	\N
00040000-55f9-6fcf-0634-89987a101bf7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f9-6fcf-6416-b2cd69f3c4e0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f9-6fcf-03fb-7547d75a07a2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f9-6fcf-c68d-29428397c642	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f9-6fcf-4930-0bf79d99ea02	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f9-6fcf-1eaf-8c03daca9447	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f9-6fcf-a019-bc3235ed5374	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f9-6fcf-dfee-201016c5e275	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f9-6fcf-cc70-6439cb544c6e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f9-6fcf-3fe7-8f7d2d3470bc	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f9-6fcf-93f0-93024c84ae6a	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f9-6fcf-8a30-64d2df9fdee7	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f9-6fcf-6cd7-c71249ae9563	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f9-6fcf-0859-a6951d1a7c6d	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f9-6fcf-c269-9340a6dc531a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f9-6fcf-426f-c2be4e2d8044	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f9-6fcf-d12d-44c1b397962a	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f9-6fcf-9854-b6ae6db50bf5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f9-6fcf-d9a8-4c8e61e8ffad	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f9-6fcf-da90-f7700ce28eed	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f9-6fcf-c3f9-de4c063fdc16	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f9-6fcf-4573-b6fa8f568f26	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f9-6fcf-c002-ecdfbc4d305d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f9-6fcf-1bbd-545a75ae71b3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f9-6fcf-9760-bd0688ee186f	ML	MLI	466	Mali 	Mali	\N
00040000-55f9-6fcf-1c61-6b1c9a80b94e	MT	MLT	470	Malta 	Malta	\N
00040000-55f9-6fcf-5a4c-3ae979dc0361	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f9-6fcf-c5ad-6c41972440f8	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f9-6fcf-cb34-c9e32099be16	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f9-6fcf-d67f-3c7a2c630ed1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f9-6fcf-ca5c-6bf4d2ab38f4	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f9-6fcf-a737-5e8ce054edbd	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f9-6fcf-179e-03b9d46e3c62	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f9-6fcf-c15d-be308201acc6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f9-6fcf-bfa5-52362ccc8f60	MC	MCO	492	Monaco 	Monako	\N
00040000-55f9-6fcf-d18a-f5b90de4d488	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f9-6fcf-b408-c3d45657dffc	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f9-6fcf-2d87-695d5790e37c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f9-6fcf-02b3-673115c9ac90	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f9-6fcf-4f2a-b6a3a51f0f29	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f9-6fcf-3fc0-a39c9dc21dce	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f9-6fcf-0a31-3d3e05405e65	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f9-6fcf-1a8e-49709beb8f41	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f9-6fcf-4924-c35439b03350	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f9-6fcf-3e36-32aed8d6e1e7	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f9-6fcf-51b2-4507430916aa	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f9-6fcf-96a2-efc6d6a14c31	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f9-6fcf-f903-182f36a73f91	NE	NER	562	Niger 	Niger 	\N
00040000-55f9-6fcf-cebe-2739bd9f7037	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f9-6fcf-1fda-eb96138ad376	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f9-6fcf-542a-38f816d6450b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f9-6fcf-43a3-5a4f9bc137ee	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f9-6fcf-5ef2-bb55687af1c8	NO	NOR	578	Norway 	Norveška	\N
00040000-55f9-6fcf-f21f-e85849b3fb56	OM	OMN	512	Oman 	Oman	\N
00040000-55f9-6fcf-53d1-18db31f2be87	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f9-6fcf-cb45-234bae084e66	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f9-6fcf-64ea-fdc246746955	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f9-6fcf-d83d-19548470e913	PA	PAN	591	Panama 	Panama	\N
00040000-55f9-6fcf-6288-59cb723503c1	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f9-6fcf-07ae-64c546edad00	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f9-6fcf-0f5b-658cc456b4a6	PE	PER	604	Peru 	Peru	\N
00040000-55f9-6fcf-354f-2803136b97b2	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f9-6fcf-ae12-4a2e1c53a8ed	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f9-6fcf-22ea-496e37d4f1b8	PL	POL	616	Poland 	Poljska	\N
00040000-55f9-6fcf-d412-0894c5564e02	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f9-6fcf-e415-89dbc55e5dcb	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f9-6fcf-6b54-fa2cca2206e6	QA	QAT	634	Qatar 	Katar	\N
00040000-55f9-6fcf-0dd4-cf49975e5545	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f9-6fcf-67de-40235feb63c9	RO	ROU	642	Romania 	Romunija	\N
00040000-55f9-6fcf-0b3d-196b8bee3b40	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f9-6fcf-2d09-9b03784f56c0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f9-6fcf-2eda-a712a089b131	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f9-6fcf-17f0-051a700eaca3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f9-6fcf-c8ca-1ee7178d4d68	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f9-6fcf-e596-c6d1f39736cb	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f9-6fcf-1188-9e6686c6b2bf	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f9-6fcf-c4ca-956815a30414	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f9-6fcf-3fed-469859fffd08	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f9-6fcf-009a-048bcaeb6aba	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f9-6fcf-211f-d2281ab25ffc	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f9-6fcf-fec8-af8f5cb0ec09	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f9-6fcf-eb63-6f0e4c9422b2	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f9-6fcf-a66f-4516b12a9cbf	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f9-6fcf-fac0-e620bf6e74db	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f9-6fcf-883b-cf6cc244bdbf	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f9-6fcf-c29f-c8b5305b7a5b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f9-6fcf-9c4d-034e93798fed	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f9-6fcf-d7eb-2237b0a9ed1e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f9-6fcf-0a47-19254c05399b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f9-6fcf-2c73-bae35129c2c9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f9-6fcf-f23b-1a6f809dec9c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f9-6fcf-1e00-0cc05988f605	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f9-6fcf-4b42-15f49433477c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f9-6fcf-c2d3-0b3361926190	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f9-6fcf-2068-7071bec8cff2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f9-6fcf-c3fd-76a84a17b8ef	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f9-6fcf-04f3-a08a8c976d0d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f9-6fcf-4e9b-22cbc0b1f0c5	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f9-6fcf-6038-4dad82892af6	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f9-6fcf-8efb-3220d41af6cf	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f9-6fcf-f2ed-59d79b4382b4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f9-6fcf-30c6-3640f95f9e6b	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f9-6fcf-4353-a09000301f7a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f9-6fcf-9825-58de92c36380	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f9-6fcf-8e08-fb8a7d9c8199	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f9-6fcf-85e6-5cc6a6d9a58f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f9-6fcf-99b3-8b87cc1b3226	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f9-6fcf-45af-2242d56f17c5	TH	THA	764	Thailand 	Tajska	\N
00040000-55f9-6fcf-d1f4-d8b3c55f68a7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f9-6fcf-2082-bf15b202ed2a	TG	TGO	768	Togo 	Togo	\N
00040000-55f9-6fcf-9312-2379da4e5418	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f9-6fcf-38c1-0d91ff1e2ce6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f9-6fcf-2416-dc8cf6a83a37	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f9-6fcf-2acc-6b4ebad4db02	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f9-6fcf-011e-89e765b2d659	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f9-6fcf-7883-9133d1e54195	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f9-6fcf-b504-654c0771d3e3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f9-6fcf-fca2-6cf9c2bb79a7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f9-6fcf-2f62-12946df7796b	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f9-6fcf-85de-e947beb9c8c0	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f9-6fcf-b539-b1f77742c669	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f9-6fcf-b27f-a85cc03ac874	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f9-6fcf-469e-7b0aa1f5de4a	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f9-6fcf-97e1-cbc93f4f018a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f9-6fcf-fc2a-a2ac0e0130e5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f9-6fcf-6458-5d3028091165	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f9-6fcf-992c-e4427cca6f43	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f9-6fcf-8b79-00bcf2dd8eb0	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f9-6fcf-a7b1-cb997dc60c68	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f9-6fcf-6032-5e65dca339cd	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f9-6fcf-d6bc-cc773da571d5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f9-6fcf-6987-95955e308ee6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f9-6fcf-c9ad-f95d0a03db3f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f9-6fcf-9fd8-a6c39a4d67ac	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f9-6fcf-2377-265d193cda1a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f9-6fcf-a704-5c4e09b90ce1	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2990 (class 0 OID 19834063)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f9-6fd0-fe32-7327453cac13	000e0000-55f9-6fd0-ae89-b79cdcb3e683	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f9-6fcf-1a2f-6b545fe471f0	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f9-6fd0-f6ef-e2e661faecc7	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f9-6fcf-219d-4e7f2574cf9e	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f9-6fd0-70f8-aed50ba04906	000e0000-55f9-6fd0-9eca-baa1ccc257e7	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f9-6fcf-1a2f-6b545fe471f0	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f9-6fd0-01ca-7191fb48d707	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f9-6fd0-63b7-b6d1460ef367	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2976 (class 0 OID 19833873)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f9-6fd0-bbab-0edf50d3f57b	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	000c0000-55f9-6fd0-d38f-952a9074f857	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f9-6fcf-abd3-1952f02f1fa4
000d0000-55f9-6fd0-78e5-1d635caacd09	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	000c0000-55f9-6fd0-6dc9-673beef08091	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f9-6fcf-9674-d76a5daaae5b
000d0000-55f9-6fd0-e08d-884fa275b750	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	000c0000-55f9-6fd0-42b7-f08769a609b7	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f9-6fcf-1612-5be2ba7812d2
000d0000-55f9-6fd0-9cf8-73dc417e1866	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	000c0000-55f9-6fd0-70f2-039b27e733bc	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f9-6fcf-78e7-851769c25a3b
000d0000-55f9-6fd0-1ae0-8fe3039ba8e0	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	000c0000-55f9-6fd0-72ee-44593278724f	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f9-6fcf-78e7-851769c25a3b
000d0000-55f9-6fd0-2f5d-d337fdf67303	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	000c0000-55f9-6fd0-2024-7f9790bd2c91	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f9-6fcf-abd3-1952f02f1fa4
000d0000-55f9-6fd0-3d10-9f70367269f6	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	000c0000-55f9-6fd0-0245-a30aaf456601	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f9-6fcf-abd3-1952f02f1fa4
000d0000-55f9-6fd0-9580-d82bf9a833b2	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	000c0000-55f9-6fd0-b440-f67e8751cae3	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f9-6fcf-fd3f-e7a3aa0ee222
000d0000-55f9-6fd0-a85b-6b97bc7c981f	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	000c0000-55f9-6fd0-0ee8-45f02e75f9a3	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f9-6fcf-9f5f-05dcc816df21
\.


--
-- TOC entry 2956 (class 0 OID 19833688)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 19833666)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f9-6fd0-a827-7a2107bc98cf	00080000-55f9-6fd0-9837-f8853536f13f	00090000-55f9-6fd0-1cd9-3b7b5b7a97e8	AK		igralka
\.


--
-- TOC entry 2965 (class 0 OID 19833787)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 19834270)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 19834282)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 19834304)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 19833812)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19833623)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f9-6fcf-cfa3-472ff6b4b590	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f9-6fcf-f66b-ceb856083ffe	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f9-6fcf-14da-c03ae46ce4fb	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f9-6fcf-df83-efcbdecb2133	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f9-6fcf-5ab5-53420e2f7250	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f9-6fcf-d929-a9a26119b7ee	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f9-6fcf-b44c-bf1f8eb6d75f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f9-6fcf-0ffb-9bb3875edabf	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f9-6fcf-7585-d2dd1dc3e4f4	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f9-6fcf-6dfd-302b1168d669	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f9-6fcf-2ec5-6be676feb12f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f9-6fcf-e860-ccef8723c587	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f9-6fcf-2ced-5e3240d756dd	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f9-6fcf-7ea2-5aebfe7ac480	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f9-6fd0-d2e5-e4d602ce0633	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f9-6fd0-9e15-1438a3bb5d69	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f9-6fd0-e54a-5fcdd4c6f25c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f9-6fd0-39cd-2cb95a3feccc	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f9-6fd0-17dd-0e9cf4219e5c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f9-6fd1-399f-2cbf7db8b114	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2945 (class 0 OID 19833537)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f9-6fd0-5945-b59ab6bff584	00000000-55f9-6fd0-d2e5-e4d602ce0633	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f9-6fd0-2f4a-fe17afbe8972	00000000-55f9-6fd0-d2e5-e4d602ce0633	00010000-55f9-6fcf-cdd4-35590c61708c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f9-6fd0-9260-b29eb15ccce8	00000000-55f9-6fd0-9e15-1438a3bb5d69	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2946 (class 0 OID 19833548)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f9-6fd0-b92d-f735f5f8e412	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f9-6fd0-8239-1cce7177811f	00010000-55f9-6fd0-e722-b2be53b70bb8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f9-6fd0-c4bf-73dcf2fa746f	00010000-55f9-6fd0-1658-da0519c0803a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f9-6fd0-7ed7-1dbaa8f22d25	00010000-55f9-6fd0-78ee-8adb240560be	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f9-6fd0-0272-677058ef8ddd	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f9-6fd0-c009-124a1bb19802	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f9-6fd0-8d09-2c7e0c3a61c7	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f9-6fd0-178d-23ed5c7b6244	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f9-6fd0-1cd9-3b7b5b7a97e8	00010000-55f9-6fd0-65de-15c247e59739	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f9-6fd0-716f-0dbcb3f3fa5b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f9-6fd0-0747-0c1ff779ce07	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f9-6fd0-893b-89a1da0a5a59	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f9-6fd0-a4f7-ed745c43bded	00010000-55f9-6fd0-a0bf-1f33124dcf31	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 19833502)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f9-6fcf-d49b-009776b69d13	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f9-6fcf-2bb5-bb60bac52400	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f9-6fcf-c63a-56eda665542d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f9-6fcf-c18a-f7d73baf867d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f9-6fcf-c949-cf57d2ce26e2	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f9-6fcf-e0a2-437a23ff9222	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f9-6fcf-79de-53656155e878	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f9-6fcf-1f35-426f8c32afaf	Abonma-read	Abonma - branje	f
00030000-55f9-6fcf-7bba-43e5d4145d5d	Abonma-write	Abonma - spreminjanje	f
00030000-55f9-6fcf-c867-396b683955d8	Alternacija-read	Alternacija - branje	f
00030000-55f9-6fcf-6d27-42e12ab8975b	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f9-6fcf-03f9-f406af3e54e3	Arhivalija-read	Arhivalija - branje	f
00030000-55f9-6fcf-1b5c-44e9dd954b0d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f9-6fcf-8e77-92504e8b1694	Besedilo-read	Besedilo - branje	f
00030000-55f9-6fcf-7287-5004199467e4	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f9-6fcf-7f6f-1139eced759d	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f9-6fcf-b5f9-e9bbb7b1560d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f9-6fcf-ec83-1f79ab4db566	Dogodek-read	Dogodek - branje	f
00030000-55f9-6fcf-5177-5424507d1a2e	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f9-6fcf-4d6e-4d332b2adf33	DrugiVir-read	DrugiVir - branje	f
00030000-55f9-6fcf-89ed-22faefbbe56a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f9-6fcf-2c13-daa8fe6a673a	Drzava-read	Drzava - branje	f
00030000-55f9-6fcf-5df2-5e2fcc566da0	Drzava-write	Drzava - spreminjanje	f
00030000-55f9-6fcf-6351-f0d3ac1cc0db	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f9-6fcf-71ae-ef47fcabc55d	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f9-6fcf-b466-3f982499f32b	Funkcija-read	Funkcija - branje	f
00030000-55f9-6fcf-fd46-044357e7bfdf	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f9-6fcf-0d26-39494397f007	Gostovanje-read	Gostovanje - branje	f
00030000-55f9-6fcf-3068-0aa3174528eb	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f9-6fcf-4bfb-37cf96384d8f	Gostujoca-read	Gostujoca - branje	f
00030000-55f9-6fcf-fe37-aed53c2055b2	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f9-6fcf-b187-37a4e870dbd6	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f9-6fcf-9df6-be73582494b2	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f9-6fcf-a3df-3d7a77de6629	Kupec-read	Kupec - branje	f
00030000-55f9-6fcf-f8ab-d9fdfa0827a1	Kupec-write	Kupec - spreminjanje	f
00030000-55f9-6fcf-8aa1-31010f0aafa4	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f9-6fcf-dd10-b4e486af618e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f9-6fcf-6e12-54ecae5c14ce	Option-read	Option - branje	f
00030000-55f9-6fcf-c198-3b7c55d34db9	Option-write	Option - spreminjanje	f
00030000-55f9-6fcf-caad-4d6606b96ded	OptionValue-read	OptionValue - branje	f
00030000-55f9-6fcf-4ac6-40b11efdbaed	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f9-6fcf-39ed-ee6b78a0c229	Oseba-read	Oseba - branje	f
00030000-55f9-6fcf-b24d-92278c4fd013	Oseba-write	Oseba - spreminjanje	f
00030000-55f9-6fcf-e793-8203af6a999d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f9-6fcf-bc60-97d4fa3a71c8	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f9-6fcf-eec9-a1f5b5dbb8e6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f9-6fcf-bf0a-e3a97408a2a6	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f9-6fcf-7772-340ce6457854	Pogodba-read	Pogodba - branje	f
00030000-55f9-6fcf-a58d-9448bb3bda20	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f9-6fcf-a419-352541304793	Popa-read	Popa - branje	f
00030000-55f9-6fcf-f39e-f2102049352c	Popa-write	Popa - spreminjanje	f
00030000-55f9-6fcf-019d-696de90b5a6b	Posta-read	Posta - branje	f
00030000-55f9-6fcf-1cbf-eb038f616b6a	Posta-write	Posta - spreminjanje	f
00030000-55f9-6fcf-41e3-6f05957d3fae	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f9-6fcf-2ecb-bd78714b29d8	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f9-6fcf-ddaf-1edde72a1e13	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f9-6fcf-b63b-750e8196c374	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f9-6fcf-67c1-13c25360bffe	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f9-6fcf-7bc1-196e602c03e4	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f9-6fcf-4314-122fd039c0cd	Predstava-read	Predstava - branje	f
00030000-55f9-6fcf-7a95-0230daefc2f4	Predstava-write	Predstava - spreminjanje	f
00030000-55f9-6fcf-1c02-fefa4507e1a1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f9-6fcf-cdb5-07d2260ac348	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f9-6fcf-8d25-6028bc2e68fa	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f9-6fcf-d592-1bd14f173b24	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f9-6fcf-cd80-b43fcdfd7aae	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f9-6fcf-8bda-590f2ad3a91f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f9-6fcf-74e2-4cf8d577aead	ProgramDela-read	ProgramDela - branje	f
00030000-55f9-6fcf-6320-80bf4de60955	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f9-6fcf-fbaf-9d64964c1dfa	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f9-6fcf-3c1b-e2fd4b1902b1	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f9-6fcf-b7d7-c05a801593c5	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f9-6fcf-54b8-3d116b05edcb	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f9-6fcf-abb9-f071cea936c5	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f9-6fcf-1f0d-7e3faf122f16	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f9-6fcf-23f9-b6ba66e5aa55	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f9-6fcf-8eb4-ae115234b19a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f9-6fcf-714c-769f510b163f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f9-6fcf-d006-24551001f8e0	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f9-6fcf-3780-882af7a6948a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f9-6fcf-0b78-ac7619267855	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f9-6fcf-7272-03a296642abb	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f9-6fcf-fa17-05d06d0ef959	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f9-6fcf-ab1c-829c2b42fe56	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f9-6fcf-c398-49687cc1b118	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f9-6fcf-ea30-956724a899a2	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f9-6fcf-6409-e38290d7c7ed	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f9-6fcf-4546-cf6c8e42edbf	Prostor-read	Prostor - branje	f
00030000-55f9-6fcf-6d51-92433d01f148	Prostor-write	Prostor - spreminjanje	f
00030000-55f9-6fcf-2dc6-2fdc298191ba	Racun-read	Racun - branje	f
00030000-55f9-6fcf-1a55-4988d71404e4	Racun-write	Racun - spreminjanje	f
00030000-55f9-6fcf-2318-dbde2aef1550	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f9-6fcf-c5ce-d6b8c5ce15d1	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f9-6fcf-ac20-96a18b6a2ab4	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f9-6fcf-bc34-c3f9c7d583a1	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f9-6fcf-0a74-b09b70924548	Rekvizit-read	Rekvizit - branje	f
00030000-55f9-6fcf-05a0-f196e80693a4	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f9-6fcf-490d-82e96f13dc7a	Revizija-read	Revizija - branje	f
00030000-55f9-6fcf-8f07-e9ec89982069	Revizija-write	Revizija - spreminjanje	f
00030000-55f9-6fcf-9b28-7f6e211a4a12	Rezervacija-read	Rezervacija - branje	f
00030000-55f9-6fcf-db41-14ea1aada7fd	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f9-6fcf-b1a1-3b671f414f8a	SedezniRed-read	SedezniRed - branje	f
00030000-55f9-6fcf-08cb-63c8148855b8	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f9-6fcf-f93b-7c30dc3c8ed2	Sedez-read	Sedez - branje	f
00030000-55f9-6fcf-f93e-34a281c04cb9	Sedez-write	Sedez - spreminjanje	f
00030000-55f9-6fcf-8805-46387399d9c7	Sezona-read	Sezona - branje	f
00030000-55f9-6fcf-be88-00a0c1746f73	Sezona-write	Sezona - spreminjanje	f
00030000-55f9-6fcf-7c80-dc0225c2d43f	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f9-6fcf-fb1d-349aaabc13ab	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f9-6fcf-ee7a-160512ff96cc	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f9-6fcf-8b31-77f494ae034a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f9-6fcf-67e6-5182e40a3b34	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f9-6fcf-99e4-a1c78ccefb20	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f9-6fcf-f8f7-d2f3b3a1ee56	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f9-6fcf-0182-7c0d12b3d12d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f9-6fcf-1ea2-be6a008dc496	Telefonska-read	Telefonska - branje	f
00030000-55f9-6fcf-1647-1cdc4f7388ec	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f9-6fcf-898f-1934069e6655	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f9-6fcf-5de3-94f1f7092e22	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f9-6fcf-8620-8f4bd03db7a9	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f9-6fcf-279c-312db3eea3a1	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f9-6fcf-ac58-7c16f53fbab7	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f9-6fcf-028d-cff39ada0f63	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f9-6fcf-1d45-d3d10ce09f5a	Trr-read	Trr - branje	f
00030000-55f9-6fcf-6d2f-b1c1b4ac32b7	Trr-write	Trr - spreminjanje	f
00030000-55f9-6fcf-269b-0e4a6a8340fa	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f9-6fcf-3c17-607777dfd900	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f9-6fcf-7510-74f6518e264f	Vaja-read	Vaja - branje	f
00030000-55f9-6fcf-d4f4-8d4754563670	Vaja-write	Vaja - spreminjanje	f
00030000-55f9-6fcf-328c-173b8eefa6dc	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f9-6fcf-e37d-ef436172b727	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f9-6fcf-19da-6fc5f17f8940	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f9-6fcf-aa14-0c1808436495	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f9-6fcf-7f58-404f04bba07e	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f9-6fcf-077b-4dde8b925a5d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f9-6fcf-8198-7e7f10e84023	Zasedenost-read	Zasedenost - branje	f
00030000-55f9-6fcf-3372-86009de040ec	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f9-6fcf-2ed2-d0aff6bf9a99	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f9-6fcf-de8c-88fdd04d3fd4	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f9-6fcf-2bdf-423378874757	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f9-6fcf-f18f-a30923c5d44d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f9-6fcf-1c54-ebf0f9b51445	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f9-6fcf-9fab-2a54b6ed8a14	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f9-6fcf-6dcf-084c9651bbf7	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f9-6fcf-3908-f1de0d8c9fbd	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f9-6fcf-ca31-755c1c2a6131	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f9-6fcf-38cb-5c097ca62a7a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f9-6fcf-3dff-2204e3e375fb	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f9-6fcf-cc5b-b4a77964f0f8	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f9-6fcf-039c-4134c644e8cf	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f9-6fcf-87aa-122ab87eb301	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f9-6fcf-fb37-980e2c68c704	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f9-6fcf-f79a-8d5af706fdde	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2943 (class 0 OID 19833521)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f9-6fcf-1832-bf450595d42b	00030000-55f9-6fcf-2bb5-bb60bac52400
00020000-55f9-6fcf-2ab0-8561d69a1646	00030000-55f9-6fcf-2c13-daa8fe6a673a
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-1f35-426f8c32afaf
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-7bba-43e5d4145d5d
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-c867-396b683955d8
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-6d27-42e12ab8975b
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-03f9-f406af3e54e3
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-ec83-1f79ab4db566
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-c18a-f7d73baf867d
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-5177-5424507d1a2e
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-2c13-daa8fe6a673a
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-5df2-5e2fcc566da0
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-b466-3f982499f32b
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-fd46-044357e7bfdf
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-0d26-39494397f007
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-3068-0aa3174528eb
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-4bfb-37cf96384d8f
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-fe37-aed53c2055b2
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-b187-37a4e870dbd6
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-9df6-be73582494b2
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-6e12-54ecae5c14ce
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-caad-4d6606b96ded
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-39ed-ee6b78a0c229
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-b24d-92278c4fd013
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-a419-352541304793
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-f39e-f2102049352c
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-019d-696de90b5a6b
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-1cbf-eb038f616b6a
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-67c1-13c25360bffe
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-7bc1-196e602c03e4
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-4314-122fd039c0cd
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-7a95-0230daefc2f4
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-cd80-b43fcdfd7aae
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-8bda-590f2ad3a91f
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-4546-cf6c8e42edbf
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-6d51-92433d01f148
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-ac20-96a18b6a2ab4
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-bc34-c3f9c7d583a1
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-0a74-b09b70924548
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-05a0-f196e80693a4
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-8805-46387399d9c7
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-be88-00a0c1746f73
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-8620-8f4bd03db7a9
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-269b-0e4a6a8340fa
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-3c17-607777dfd900
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-7510-74f6518e264f
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-d4f4-8d4754563670
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-8198-7e7f10e84023
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-3372-86009de040ec
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-2ed2-d0aff6bf9a99
00020000-55f9-6fcf-3b0d-519616771dba	00030000-55f9-6fcf-2bdf-423378874757
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-1f35-426f8c32afaf
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-03f9-f406af3e54e3
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-ec83-1f79ab4db566
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-2c13-daa8fe6a673a
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-0d26-39494397f007
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-4bfb-37cf96384d8f
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-b187-37a4e870dbd6
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-9df6-be73582494b2
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-6e12-54ecae5c14ce
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-caad-4d6606b96ded
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-39ed-ee6b78a0c229
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-b24d-92278c4fd013
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-a419-352541304793
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-019d-696de90b5a6b
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-67c1-13c25360bffe
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-7bc1-196e602c03e4
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-4314-122fd039c0cd
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-4546-cf6c8e42edbf
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-ac20-96a18b6a2ab4
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-0a74-b09b70924548
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-8805-46387399d9c7
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-1ea2-be6a008dc496
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-1647-1cdc4f7388ec
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-1d45-d3d10ce09f5a
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-6d2f-b1c1b4ac32b7
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-7f58-404f04bba07e
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-077b-4dde8b925a5d
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-2ed2-d0aff6bf9a99
00020000-55f9-6fcf-5bb0-893a9022367d	00030000-55f9-6fcf-2bdf-423378874757
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-1f35-426f8c32afaf
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-c867-396b683955d8
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-03f9-f406af3e54e3
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-1b5c-44e9dd954b0d
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-8e77-92504e8b1694
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-7f6f-1139eced759d
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-ec83-1f79ab4db566
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-2c13-daa8fe6a673a
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-b466-3f982499f32b
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-0d26-39494397f007
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-4bfb-37cf96384d8f
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-b187-37a4e870dbd6
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-6e12-54ecae5c14ce
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-caad-4d6606b96ded
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-39ed-ee6b78a0c229
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-a419-352541304793
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-019d-696de90b5a6b
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-4314-122fd039c0cd
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-cd80-b43fcdfd7aae
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-4546-cf6c8e42edbf
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-ac20-96a18b6a2ab4
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-0a74-b09b70924548
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-8805-46387399d9c7
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-8620-8f4bd03db7a9
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-7510-74f6518e264f
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-8198-7e7f10e84023
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-2ed2-d0aff6bf9a99
00020000-55f9-6fcf-c0fc-ace257155634	00030000-55f9-6fcf-2bdf-423378874757
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-1f35-426f8c32afaf
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-7bba-43e5d4145d5d
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-6d27-42e12ab8975b
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-03f9-f406af3e54e3
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-ec83-1f79ab4db566
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-2c13-daa8fe6a673a
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-0d26-39494397f007
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-4bfb-37cf96384d8f
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-6e12-54ecae5c14ce
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-caad-4d6606b96ded
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-a419-352541304793
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-019d-696de90b5a6b
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-4314-122fd039c0cd
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-4546-cf6c8e42edbf
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-ac20-96a18b6a2ab4
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-0a74-b09b70924548
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-8805-46387399d9c7
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-8620-8f4bd03db7a9
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-2ed2-d0aff6bf9a99
00020000-55f9-6fcf-fc32-d61d6b68f9f0	00030000-55f9-6fcf-2bdf-423378874757
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-1f35-426f8c32afaf
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-03f9-f406af3e54e3
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-ec83-1f79ab4db566
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-2c13-daa8fe6a673a
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-0d26-39494397f007
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-4bfb-37cf96384d8f
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-6e12-54ecae5c14ce
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-caad-4d6606b96ded
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-a419-352541304793
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-019d-696de90b5a6b
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-4314-122fd039c0cd
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-4546-cf6c8e42edbf
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-ac20-96a18b6a2ab4
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-0a74-b09b70924548
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-8805-46387399d9c7
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-898f-1934069e6655
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-c63a-56eda665542d
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-8620-8f4bd03db7a9
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-2ed2-d0aff6bf9a99
00020000-55f9-6fcf-1c4e-552a793cbf57	00030000-55f9-6fcf-2bdf-423378874757
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-d49b-009776b69d13
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-2bb5-bb60bac52400
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-c63a-56eda665542d
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-c18a-f7d73baf867d
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-c949-cf57d2ce26e2
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-e0a2-437a23ff9222
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-79de-53656155e878
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-1f35-426f8c32afaf
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-7bba-43e5d4145d5d
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-c867-396b683955d8
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-6d27-42e12ab8975b
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-03f9-f406af3e54e3
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-1b5c-44e9dd954b0d
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-8e77-92504e8b1694
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-7287-5004199467e4
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-7f6f-1139eced759d
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-b5f9-e9bbb7b1560d
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-ec83-1f79ab4db566
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-5177-5424507d1a2e
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-2c13-daa8fe6a673a
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-5df2-5e2fcc566da0
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-4d6e-4d332b2adf33
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-89ed-22faefbbe56a
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-6351-f0d3ac1cc0db
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-71ae-ef47fcabc55d
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-b466-3f982499f32b
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-fd46-044357e7bfdf
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-0d26-39494397f007
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-3068-0aa3174528eb
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-4bfb-37cf96384d8f
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-fe37-aed53c2055b2
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-b187-37a4e870dbd6
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-9df6-be73582494b2
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-a3df-3d7a77de6629
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-f8ab-d9fdfa0827a1
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-8aa1-31010f0aafa4
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-dd10-b4e486af618e
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-6e12-54ecae5c14ce
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-c198-3b7c55d34db9
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-caad-4d6606b96ded
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-4ac6-40b11efdbaed
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-39ed-ee6b78a0c229
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-b24d-92278c4fd013
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-e793-8203af6a999d
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-bc60-97d4fa3a71c8
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-eec9-a1f5b5dbb8e6
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-bf0a-e3a97408a2a6
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-7772-340ce6457854
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-a58d-9448bb3bda20
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-a419-352541304793
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-f39e-f2102049352c
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-019d-696de90b5a6b
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-1cbf-eb038f616b6a
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-41e3-6f05957d3fae
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-2ecb-bd78714b29d8
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-ddaf-1edde72a1e13
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-b63b-750e8196c374
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-67c1-13c25360bffe
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-7bc1-196e602c03e4
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-4314-122fd039c0cd
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-7a95-0230daefc2f4
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-1c02-fefa4507e1a1
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-cdb5-07d2260ac348
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-8d25-6028bc2e68fa
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-d592-1bd14f173b24
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-cd80-b43fcdfd7aae
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-8bda-590f2ad3a91f
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-74e2-4cf8d577aead
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-6320-80bf4de60955
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-fbaf-9d64964c1dfa
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-3c1b-e2fd4b1902b1
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-b7d7-c05a801593c5
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-54b8-3d116b05edcb
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-abb9-f071cea936c5
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-1f0d-7e3faf122f16
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-23f9-b6ba66e5aa55
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-8eb4-ae115234b19a
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-714c-769f510b163f
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-d006-24551001f8e0
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-3780-882af7a6948a
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-0b78-ac7619267855
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-7272-03a296642abb
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-fa17-05d06d0ef959
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-ab1c-829c2b42fe56
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-c398-49687cc1b118
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-ea30-956724a899a2
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-6409-e38290d7c7ed
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-4546-cf6c8e42edbf
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-6d51-92433d01f148
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-2dc6-2fdc298191ba
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-1a55-4988d71404e4
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-2318-dbde2aef1550
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-c5ce-d6b8c5ce15d1
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-ac20-96a18b6a2ab4
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-bc34-c3f9c7d583a1
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-0a74-b09b70924548
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-05a0-f196e80693a4
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-490d-82e96f13dc7a
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-8f07-e9ec89982069
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-9b28-7f6e211a4a12
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-db41-14ea1aada7fd
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-b1a1-3b671f414f8a
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-08cb-63c8148855b8
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-f93b-7c30dc3c8ed2
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-f93e-34a281c04cb9
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-8805-46387399d9c7
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-be88-00a0c1746f73
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-7c80-dc0225c2d43f
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-fb1d-349aaabc13ab
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-ee7a-160512ff96cc
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-8b31-77f494ae034a
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-67e6-5182e40a3b34
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-99e4-a1c78ccefb20
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-f8f7-d2f3b3a1ee56
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-0182-7c0d12b3d12d
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-1ea2-be6a008dc496
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-1647-1cdc4f7388ec
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-898f-1934069e6655
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-5de3-94f1f7092e22
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-8620-8f4bd03db7a9
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-279c-312db3eea3a1
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-ac58-7c16f53fbab7
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-028d-cff39ada0f63
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-1d45-d3d10ce09f5a
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-6d2f-b1c1b4ac32b7
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-269b-0e4a6a8340fa
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-3c17-607777dfd900
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-7510-74f6518e264f
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-d4f4-8d4754563670
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-328c-173b8eefa6dc
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-e37d-ef436172b727
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-19da-6fc5f17f8940
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-aa14-0c1808436495
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-7f58-404f04bba07e
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-077b-4dde8b925a5d
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-8198-7e7f10e84023
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-3372-86009de040ec
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-2ed2-d0aff6bf9a99
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-de8c-88fdd04d3fd4
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-2bdf-423378874757
00020000-55f9-6fd0-792c-8a9f56424cc6	00030000-55f9-6fcf-f18f-a30923c5d44d
\.


--
-- TOC entry 2970 (class 0 OID 19833819)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 19833853)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 19833982)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f9-6fd0-6a48-241cee77f278	00090000-55f9-6fd0-b92d-f735f5f8e412	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f9-6fd0-c61f-d7aae2c5744b	00090000-55f9-6fd0-c009-124a1bb19802	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f9-6fd0-84d8-a2eacb49d3e6	00090000-55f9-6fd0-a4f7-ed745c43bded	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f9-6fd0-7841-0e5649e57b56	00090000-55f9-6fd0-716f-0dbcb3f3fa5b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2948 (class 0 OID 19833581)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f9-6fd0-9837-f8853536f13f	00040000-55f9-6fcf-2c73-bae35129c2c9	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-6fd0-095a-1923b6b1f44b	00040000-55f9-6fcf-2c73-bae35129c2c9	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f9-6fd0-59ed-2d2706648ba5	00040000-55f9-6fcf-2c73-bae35129c2c9	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-6fd0-088a-2143b30e88a9	00040000-55f9-6fcf-2c73-bae35129c2c9	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-6fd0-50d4-324546ff4371	00040000-55f9-6fcf-2c73-bae35129c2c9	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-6fd0-bb7d-49de8362bb7b	00040000-55f9-6fcf-e7b6-0c50e9814f9e	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-6fd0-033b-849b9e91d8c9	00040000-55f9-6fcf-f54a-05fa5e4ce45e	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-6fd0-ffa0-565bc9de21a3	00040000-55f9-6fcf-8e02-66a941f9d1af	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-6fd0-94ca-f8009020cba2	00040000-55f9-6fcf-98b6-591f59126b98	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f9-6fd1-b5d1-25ba8c733e20	00040000-55f9-6fcf-2c73-bae35129c2c9	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2950 (class 0 OID 19833615)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f9-6fce-0726-ddbeab698143	8341	Adlešiči
00050000-55f9-6fce-f0a1-d4ec104dd688	5270	Ajdovščina
00050000-55f9-6fce-414a-867409c52684	6280	Ankaran/Ancarano
00050000-55f9-6fce-553c-93bbb2720463	9253	Apače
00050000-55f9-6fce-39e3-a11fde5d2bef	8253	Artiče
00050000-55f9-6fce-93ea-7ef089a56019	4275	Begunje na Gorenjskem
00050000-55f9-6fce-bb2e-b90a1f2bc57a	1382	Begunje pri Cerknici
00050000-55f9-6fce-1366-5b0fbf0ac895	9231	Beltinci
00050000-55f9-6fce-ac79-e0b12eadde78	2234	Benedikt
00050000-55f9-6fce-23ca-b681f8fa39b8	2345	Bistrica ob Dravi
00050000-55f9-6fce-5fb0-d76044e5ddb7	3256	Bistrica ob Sotli
00050000-55f9-6fce-53d4-7996d3da7172	8259	Bizeljsko
00050000-55f9-6fce-4f03-4b4f1e3bafb3	1223	Blagovica
00050000-55f9-6fce-c901-2cdd53137691	8283	Blanca
00050000-55f9-6fce-614a-e8a3cf6df404	4260	Bled
00050000-55f9-6fce-5349-375c5f9ffa3d	4273	Blejska Dobrava
00050000-55f9-6fce-a1b0-78a0f4832618	9265	Bodonci
00050000-55f9-6fce-acbe-d1a0f07e1cb8	9222	Bogojina
00050000-55f9-6fce-98e6-eaf2c9f54919	4263	Bohinjska Bela
00050000-55f9-6fce-6b8f-b4c0c55b7b6d	4264	Bohinjska Bistrica
00050000-55f9-6fce-53e4-f212df28dcc9	4265	Bohinjsko jezero
00050000-55f9-6fce-c5ef-80ae33498591	1353	Borovnica
00050000-55f9-6fce-cf00-a03f55b8ff24	8294	Boštanj
00050000-55f9-6fce-e54b-7c3ee2aaaf72	5230	Bovec
00050000-55f9-6fce-73ae-3cd335c8a4d8	5295	Branik
00050000-55f9-6fce-1219-3ce00d5ab5bd	3314	Braslovče
00050000-55f9-6fce-e7c1-8435d67bd714	5223	Breginj
00050000-55f9-6fce-eced-904963be4026	8280	Brestanica
00050000-55f9-6fce-cf66-04fa7b73a63d	2354	Bresternica
00050000-55f9-6fce-478c-da8e28d8fd20	4243	Brezje
00050000-55f9-6fce-95d2-4379cd7b9dec	1351	Brezovica pri Ljubljani
00050000-55f9-6fce-f5e5-ca3c96f0f129	8250	Brežice
00050000-55f9-6fce-1d1a-2dbb234f0f42	4210	Brnik - Aerodrom
00050000-55f9-6fce-3c78-3ef2e66c1c78	8321	Brusnice
00050000-55f9-6fce-1cb6-a6eefc691d1e	3255	Buče
00050000-55f9-6fce-6430-b4a5d936fc31	8276	Bučka 
00050000-55f9-6fce-a947-f31b8eaf7f40	9261	Cankova
00050000-55f9-6fce-cada-94a8466dc664	3000	Celje 
00050000-55f9-6fce-2506-7eab31281453	3001	Celje - poštni predali
00050000-55f9-6fce-5ef6-d1e7a68a3cc8	4207	Cerklje na Gorenjskem
00050000-55f9-6fce-1768-35bb042c085a	8263	Cerklje ob Krki
00050000-55f9-6fce-b99f-b08e38a40c6a	1380	Cerknica
00050000-55f9-6fce-3f96-1b85d4179635	5282	Cerkno
00050000-55f9-6fce-4fc3-d18c6dd92ed1	2236	Cerkvenjak
00050000-55f9-6fce-b8fc-5b54dcab7821	2215	Ceršak
00050000-55f9-6fce-b8a3-6a5bfaf1aac4	2326	Cirkovce
00050000-55f9-6fce-4e82-792e92705c22	2282	Cirkulane
00050000-55f9-6fce-373c-8eba504eeb84	5273	Col
00050000-55f9-6fce-0d14-f17b98f2bcf9	8251	Čatež ob Savi
00050000-55f9-6fce-753d-c834b0134e17	1413	Čemšenik
00050000-55f9-6fce-3d20-6e59a5ad9706	5253	Čepovan
00050000-55f9-6fce-f28c-98432dd4c49b	9232	Črenšovci
00050000-55f9-6fce-921f-4ee1d1cb0919	2393	Črna na Koroškem
00050000-55f9-6fce-2148-0ef09534dea1	6275	Črni Kal
00050000-55f9-6fce-5e51-208229b76e0d	5274	Črni Vrh nad Idrijo
00050000-55f9-6fce-51c4-2297d4a10a09	5262	Črniče
00050000-55f9-6fce-3c41-483f80c5863c	8340	Črnomelj
00050000-55f9-6fce-169b-4f755f213587	6271	Dekani
00050000-55f9-6fce-20fd-2d680929a48b	5210	Deskle
00050000-55f9-6fce-39b2-07bb6347e7dd	2253	Destrnik
00050000-55f9-6fce-9b71-a9199411adbf	6215	Divača
00050000-55f9-6fce-ae7e-d93194a4882e	1233	Dob
00050000-55f9-6fce-5f02-ff22304b6fde	3224	Dobje pri Planini
00050000-55f9-6fce-664c-94428333b594	8257	Dobova
00050000-55f9-6fce-2480-ec7c8f46c7c8	1423	Dobovec
00050000-55f9-6fce-ed86-92d9ce17f431	5263	Dobravlje
00050000-55f9-6fce-8fff-c497e2edb137	3204	Dobrna
00050000-55f9-6fce-a2ba-7444ec32dfd9	8211	Dobrnič
00050000-55f9-6fce-0c88-7ff99cbd152e	1356	Dobrova
00050000-55f9-6fce-d9b5-1a77e74896e2	9223	Dobrovnik/Dobronak 
00050000-55f9-6fce-3be1-772c17887b03	5212	Dobrovo v Brdih
00050000-55f9-6fce-db0b-46c1e30c54ac	1431	Dol pri Hrastniku
00050000-55f9-6fce-58cc-396419198a4c	1262	Dol pri Ljubljani
00050000-55f9-6fce-9038-1f40885a50c9	1273	Dole pri Litiji
00050000-55f9-6fce-a782-6e16bad5d5c6	1331	Dolenja vas
00050000-55f9-6fce-7782-384b337475c3	8350	Dolenjske Toplice
00050000-55f9-6fce-f35c-57e4eede60d6	1230	Domžale
00050000-55f9-6fce-1a35-f6e3383f85ef	2252	Dornava
00050000-55f9-6fce-0d7c-8a7d15cea020	5294	Dornberk
00050000-55f9-6fce-0cb5-ee9957f00ebf	1319	Draga
00050000-55f9-6fce-37b5-358a8ee33122	8343	Dragatuš
00050000-55f9-6fce-b18a-dbbd7944d117	3222	Dramlje
00050000-55f9-6fce-429b-4ae6e22df6fb	2370	Dravograd
00050000-55f9-6fce-c66f-18812dab1ad4	4203	Duplje
00050000-55f9-6fce-d905-b6a8f93980a1	6221	Dutovlje
00050000-55f9-6fce-851f-9df3d8cee0ed	8361	Dvor
00050000-55f9-6fce-271a-f872ce05d217	2343	Fala
00050000-55f9-6fce-3ef0-db178868c715	9208	Fokovci
00050000-55f9-6fce-5ed1-3e3fe71af46f	2313	Fram
00050000-55f9-6fce-5fe2-867dabdad3fd	3213	Frankolovo
00050000-55f9-6fce-996d-e91428d7ab4a	1274	Gabrovka
00050000-55f9-6fce-243d-012e59316f53	8254	Globoko
00050000-55f9-6fce-0610-c06823db1283	5275	Godovič
00050000-55f9-6fce-28fa-96f9c91f6aa5	4204	Golnik
00050000-55f9-6fce-d5c8-ffe9c4c0833f	3303	Gomilsko
00050000-55f9-6fce-5fb4-50da2c5b4f50	4224	Gorenja vas
00050000-55f9-6fce-93ed-82d68f1f5844	3263	Gorica pri Slivnici
00050000-55f9-6fce-6685-b7afc50c03fe	2272	Gorišnica
00050000-55f9-6fce-322c-c2571041000b	9250	Gornja Radgona
00050000-55f9-6fce-9ace-2824296a612c	3342	Gornji Grad
00050000-55f9-6fce-94ef-d631082fa3b5	4282	Gozd Martuljek
00050000-55f9-6fce-43c1-ad72f61d4218	6272	Gračišče
00050000-55f9-6fce-61dd-e5c9a96a2e73	9264	Grad
00050000-55f9-6fce-16dd-018c8995caa2	8332	Gradac
00050000-55f9-6fce-f683-58b981414c11	1384	Grahovo
00050000-55f9-6fce-9d68-9b61cb71a3c1	5242	Grahovo ob Bači
00050000-55f9-6fce-e69d-184bf406b142	5251	Grgar
00050000-55f9-6fce-f2b2-ce0a470dc1e6	3302	Griže
00050000-55f9-6fce-2f53-fcc2d1297f1e	3231	Grobelno
00050000-55f9-6fce-b85f-e6554fc6e649	1290	Grosuplje
00050000-55f9-6fce-ba8b-57d048254851	2288	Hajdina
00050000-55f9-6fce-bc89-e5ee13421718	8362	Hinje
00050000-55f9-6fce-9729-bf3ce86947ce	2311	Hoče
00050000-55f9-6fce-6739-778c35585152	9205	Hodoš/Hodos
00050000-55f9-6fce-3df6-6c136cb6f1f8	1354	Horjul
00050000-55f9-6fce-1839-f874736b98db	1372	Hotedršica
00050000-55f9-6fce-a88a-d3454bc4ce29	1430	Hrastnik
00050000-55f9-6fce-dbb1-5b7c7f3f3cdc	6225	Hruševje
00050000-55f9-6fce-b8c1-b3a479a2d28f	4276	Hrušica
00050000-55f9-6fce-79b1-06fcf33c1a99	5280	Idrija
00050000-55f9-6fce-8043-a30f8f1eee85	1292	Ig
00050000-55f9-6fce-10c9-25dafef89329	6250	Ilirska Bistrica
00050000-55f9-6fce-2b32-caff2b83e0ba	6251	Ilirska Bistrica-Trnovo
00050000-55f9-6fce-0339-a8ed53c3d91f	1295	Ivančna Gorica
00050000-55f9-6fce-5df4-a6e3d86abfac	2259	Ivanjkovci
00050000-55f9-6fce-81a1-67d99393012a	1411	Izlake
00050000-55f9-6fce-a96b-a6aa876f7409	6310	Izola/Isola
00050000-55f9-6fce-905f-6e57059a700c	2222	Jakobski Dol
00050000-55f9-6fce-29bd-506c7ab4643a	2221	Jarenina
00050000-55f9-6fce-2808-d00b890cdf9c	6254	Jelšane
00050000-55f9-6fce-ef2b-d479b6c5ab8a	4270	Jesenice
00050000-55f9-6fce-9e89-7bb91c6fb049	8261	Jesenice na Dolenjskem
00050000-55f9-6fce-96c4-5d448033c4d9	3273	Jurklošter
00050000-55f9-6fce-e3fe-257989426cc1	2223	Jurovski Dol
00050000-55f9-6fce-ac3d-63a39d3d4235	2256	Juršinci
00050000-55f9-6fce-819c-49da9c270a4d	5214	Kal nad Kanalom
00050000-55f9-6fce-5bf4-2274f41d32f6	3233	Kalobje
00050000-55f9-6fce-af59-ae3d977628d9	4246	Kamna Gorica
00050000-55f9-6fce-b316-024134abad7d	2351	Kamnica
00050000-55f9-6fce-2219-617151a4e174	1241	Kamnik
00050000-55f9-6fce-c163-3b653d9a3371	5213	Kanal
00050000-55f9-6fce-097d-4ee2e3a6980a	8258	Kapele
00050000-55f9-6fce-81e3-2da00ec7a427	2362	Kapla
00050000-55f9-6fce-467a-bf0bfb353b75	2325	Kidričevo
00050000-55f9-6fce-b622-1ebf7e69a7fb	1412	Kisovec
00050000-55f9-6fce-3c6c-cf4f9771b48a	6253	Knežak
00050000-55f9-6fce-719c-1e3cdf38ca12	5222	Kobarid
00050000-55f9-6fce-81cf-659b35e6cb3b	9227	Kobilje
00050000-55f9-6fce-2baf-74cc58aba4d3	1330	Kočevje
00050000-55f9-6fce-2449-1292d594cc80	1338	Kočevska Reka
00050000-55f9-6fce-dc12-be28ad0c5d45	2276	Kog
00050000-55f9-6fce-6398-6e7c61874739	5211	Kojsko
00050000-55f9-6fce-a49b-f39e8a198cb7	6223	Komen
00050000-55f9-6fce-0cba-ab38ea7919e4	1218	Komenda
00050000-55f9-6fce-e819-399a46cee6bb	6000	Koper/Capodistria 
00050000-55f9-6fce-b7a4-ae7622cc2074	6001	Koper/Capodistria - poštni predali
00050000-55f9-6fce-847a-7af156b7078c	8282	Koprivnica
00050000-55f9-6fce-eeb9-e5b629872b58	5296	Kostanjevica na Krasu
00050000-55f9-6fce-1deb-745e9a265832	8311	Kostanjevica na Krki
00050000-55f9-6fce-043e-618c4292b7a5	1336	Kostel
00050000-55f9-6fce-c46c-f909b0ba2f45	6256	Košana
00050000-55f9-6fce-7e1b-65fd8caae74c	2394	Kotlje
00050000-55f9-6fce-61c9-acbfd096b0ec	6240	Kozina
00050000-55f9-6fce-ec6e-156dea67bcea	3260	Kozje
00050000-55f9-6fce-afc6-d48b4b2f902b	4000	Kranj 
00050000-55f9-6fce-fa50-bc9160203d42	4001	Kranj - poštni predali
00050000-55f9-6fce-3b30-73d1c72a5bec	4280	Kranjska Gora
00050000-55f9-6fce-bbe1-1c3661864d00	1281	Kresnice
00050000-55f9-6fce-5e60-5d00c5082797	4294	Križe
00050000-55f9-6fce-733f-bf73597b70a9	9206	Križevci
00050000-55f9-6fce-af1c-e3419f382c78	9242	Križevci pri Ljutomeru
00050000-55f9-6fce-e822-5d19518d1e34	1301	Krka
00050000-55f9-6fce-bf97-4efd48114754	8296	Krmelj
00050000-55f9-6fce-fc3b-2de0af427dfb	4245	Kropa
00050000-55f9-6fce-5224-b8a6a3ee7115	8262	Krška vas
00050000-55f9-6fce-eafe-7f00adcc759d	8270	Krško
00050000-55f9-6fce-db4d-3eee1b1ec8dc	9263	Kuzma
00050000-55f9-6fce-bc48-8910920f9206	2318	Laporje
00050000-55f9-6fce-1804-fb22cb3b6413	3270	Laško
00050000-55f9-6fce-3275-78658cde6fc5	1219	Laze v Tuhinju
00050000-55f9-6fce-224e-8dbd18438993	2230	Lenart v Slovenskih goricah
00050000-55f9-6fce-1e77-8a3c5f605231	9220	Lendava/Lendva
00050000-55f9-6fce-5917-caa7f4433ba3	4248	Lesce
00050000-55f9-6fce-f4f9-ef9d0f352df0	3261	Lesično
00050000-55f9-6fce-f9e8-2bb318a41a59	8273	Leskovec pri Krškem
00050000-55f9-6fce-b73c-66a7f0ddabff	2372	Libeliče
00050000-55f9-6fce-aa5b-e45611c228ee	2341	Limbuš
00050000-55f9-6fce-a02d-5e06f5f8c8ad	1270	Litija
00050000-55f9-6fce-21aa-4bc00a73ab92	3202	Ljubečna
00050000-55f9-6fce-55b7-9753aa065056	1000	Ljubljana 
00050000-55f9-6fce-45c2-66699ba1b478	1001	Ljubljana - poštni predali
00050000-55f9-6fce-7ff7-20d98e0fd3e2	1231	Ljubljana - Črnuče
00050000-55f9-6fce-6991-dee082eebe35	1261	Ljubljana - Dobrunje
00050000-55f9-6fce-aa32-cf3d137abe66	1260	Ljubljana - Polje
00050000-55f9-6fce-ed93-b05eee07a32c	1210	Ljubljana - Šentvid
00050000-55f9-6fce-a2a8-fc1e2f37d39a	1211	Ljubljana - Šmartno
00050000-55f9-6fce-fda8-edc0493cff0f	3333	Ljubno ob Savinji
00050000-55f9-6fce-3b84-3e3542ac0d48	9240	Ljutomer
00050000-55f9-6fce-b97e-69a35184b3d6	3215	Loče
00050000-55f9-6fce-088d-2c699e94bc37	5231	Log pod Mangartom
00050000-55f9-6fce-fa19-3b59c5a429fc	1358	Log pri Brezovici
00050000-55f9-6fce-76a1-f95062d6fa50	1370	Logatec
00050000-55f9-6fce-32fb-f6d5224046c1	1371	Logatec
00050000-55f9-6fce-9803-036122d45596	1434	Loka pri Zidanem Mostu
00050000-55f9-6fce-f4f1-a8210167d798	3223	Loka pri Žusmu
00050000-55f9-6fce-aee4-80f9655ee3dd	6219	Lokev
00050000-55f9-6fce-2ddc-b019657a4da4	1318	Loški Potok
00050000-55f9-6fce-dc96-55a8c46f62d5	2324	Lovrenc na Dravskem polju
00050000-55f9-6fce-b4ee-3be7cd3ab84a	2344	Lovrenc na Pohorju
00050000-55f9-6fce-a630-3f694d5146af	3334	Luče
00050000-55f9-6fce-0eef-f1f4b0fcd05d	1225	Lukovica
00050000-55f9-6fce-759a-e32828dd7928	9202	Mačkovci
00050000-55f9-6fce-cd24-eb5177236dff	2322	Majšperk
00050000-55f9-6fce-0d1b-3dac40feb6d7	2321	Makole
00050000-55f9-6fce-80ab-6e0eebeee695	9243	Mala Nedelja
00050000-55f9-6fce-f1cf-11d82030cf6c	2229	Malečnik
00050000-55f9-6fce-16c7-85fe8a9a53dd	6273	Marezige
00050000-55f9-6fce-2df3-bab6fa247c03	2000	Maribor 
00050000-55f9-6fce-816b-cf4c61201136	2001	Maribor - poštni predali
00050000-55f9-6fce-da00-4c0f34b38f03	2206	Marjeta na Dravskem polju
00050000-55f9-6fce-f034-4de4e16cae2b	2281	Markovci
00050000-55f9-6fce-7f26-2fd35fab5bd1	9221	Martjanci
00050000-55f9-6fce-e72f-63eb3296b63a	6242	Materija
00050000-55f9-6fce-616b-bd15d53e33c0	4211	Mavčiče
00050000-55f9-6fce-7e91-60910fb1f951	1215	Medvode
00050000-55f9-6fce-fa72-b6efad40458e	1234	Mengeš
00050000-55f9-6fce-f18d-27388e1722f2	8330	Metlika
00050000-55f9-6fce-b202-78134e3db551	2392	Mežica
00050000-55f9-6fce-a846-27aa198e4674	2204	Miklavž na Dravskem polju
00050000-55f9-6fce-cc72-91188a462cae	2275	Miklavž pri Ormožu
00050000-55f9-6fce-3d01-0d91dce026d5	5291	Miren
00050000-55f9-6fce-4cac-101bb109aa14	8233	Mirna
00050000-55f9-6fce-ac26-7bd42d94c53f	8216	Mirna Peč
00050000-55f9-6fce-df6d-8a6267c62f19	2382	Mislinja
00050000-55f9-6fce-1e76-48ae76ca8686	4281	Mojstrana
00050000-55f9-6fce-6d0c-ecf7cb31d1f4	8230	Mokronog
00050000-55f9-6fce-b2db-91a401b2ae66	1251	Moravče
00050000-55f9-6fce-45e2-2b5aefee783a	9226	Moravske Toplice
00050000-55f9-6fce-15d9-a583311359b1	5216	Most na Soči
00050000-55f9-6fce-2194-c8989fa451e9	1221	Motnik
00050000-55f9-6fce-4998-df792f42333c	3330	Mozirje
00050000-55f9-6fce-1c93-65c37ee8fa3f	9000	Murska Sobota 
00050000-55f9-6fce-0dfb-9d876d7b8ad9	9001	Murska Sobota - poštni predali
00050000-55f9-6fce-8cee-460fa2e54448	2366	Muta
00050000-55f9-6fce-47ce-3d849822f488	4202	Naklo
00050000-55f9-6fce-9dda-8df3e1b00242	3331	Nazarje
00050000-55f9-6fce-aefe-4fb7e5f013fb	1357	Notranje Gorice
00050000-55f9-6fce-cf4f-9154e677bfb8	3203	Nova Cerkev
00050000-55f9-6fce-03e8-0a2862329fbe	5000	Nova Gorica 
00050000-55f9-6fce-ec07-987e482b7dab	5001	Nova Gorica - poštni predali
00050000-55f9-6fce-a72d-7ca0909194d0	1385	Nova vas
00050000-55f9-6fce-e11e-865d21b621d2	8000	Novo mesto
00050000-55f9-6fce-2ab2-3b471e3afc3c	8001	Novo mesto - poštni predali
00050000-55f9-6fce-9ef0-ce2c333c77c2	6243	Obrov
00050000-55f9-6fce-bdf0-dee034cb34c7	9233	Odranci
00050000-55f9-6fce-8034-1055c541d373	2317	Oplotnica
00050000-55f9-6fce-e59d-6cf1705e6e51	2312	Orehova vas
00050000-55f9-6fce-1943-19ccbd963723	2270	Ormož
00050000-55f9-6fce-ed96-b25da909d4bf	1316	Ortnek
00050000-55f9-6fce-2173-aa449891a37c	1337	Osilnica
00050000-55f9-6fce-c168-d10430e61c8b	8222	Otočec
00050000-55f9-6fce-dc18-65cb824d425c	2361	Ožbalt
00050000-55f9-6fce-28b3-fe0a4d53a17f	2231	Pernica
00050000-55f9-6fce-5404-a3ac4b0af944	2211	Pesnica pri Mariboru
00050000-55f9-6fce-66ab-7f286d8b3a8d	9203	Petrovci
00050000-55f9-6fce-37ea-46b056b5dff1	3301	Petrovče
00050000-55f9-6fce-ee78-89838faaeab1	6330	Piran/Pirano
00050000-55f9-6fce-d1e5-a169b95a418b	8255	Pišece
00050000-55f9-6fce-8127-9c4ee4ccde84	6257	Pivka
00050000-55f9-6fce-3e9b-f27c24e2e27a	6232	Planina
00050000-55f9-6fce-477e-ec57a1f4b974	3225	Planina pri Sevnici
00050000-55f9-6fce-22dc-a9e906a1650f	6276	Pobegi
00050000-55f9-6fce-05f8-4b913530718f	8312	Podbočje
00050000-55f9-6fce-be93-0beb679d074e	5243	Podbrdo
00050000-55f9-6fce-4e58-38673a41da1e	3254	Podčetrtek
00050000-55f9-6fce-132a-466cfb76f463	2273	Podgorci
00050000-55f9-6fce-976e-e427d64a5143	6216	Podgorje
00050000-55f9-6fce-c926-021186cf6ac9	2381	Podgorje pri Slovenj Gradcu
00050000-55f9-6fce-583f-24668982450c	6244	Podgrad
00050000-55f9-6fce-f59b-ba0c372b0b55	1414	Podkum
00050000-55f9-6fce-c626-54f1615712cd	2286	Podlehnik
00050000-55f9-6fce-ff9f-73bfc9d6c0c3	5272	Podnanos
00050000-55f9-6fce-de70-b9abc42c6572	4244	Podnart
00050000-55f9-6fce-b7f0-7b7985c97080	3241	Podplat
00050000-55f9-6fce-e1c4-9faa17c4715f	3257	Podsreda
00050000-55f9-6fce-d4b1-9370c43dbb15	2363	Podvelka
00050000-55f9-6fce-7196-bb48ff65ae71	2208	Pohorje
00050000-55f9-6fce-7e51-3faa3ff28897	2257	Polenšak
00050000-55f9-6fce-0d30-5b9d9d0d1fa5	1355	Polhov Gradec
00050000-55f9-6fce-f5bf-8a7093ce8bc0	4223	Poljane nad Škofjo Loko
00050000-55f9-6fce-e717-7ba315b0004e	2319	Poljčane
00050000-55f9-6fce-099a-3c9a4be1ae05	1272	Polšnik
00050000-55f9-6fce-2caa-84bfbff1c723	3313	Polzela
00050000-55f9-6fce-d351-c9e9b78e1a15	3232	Ponikva
00050000-55f9-6fce-02fb-df112bae792f	6320	Portorož/Portorose
00050000-55f9-6fce-feb0-e323e3760981	6230	Postojna
00050000-55f9-6fce-edea-6e2df65ece51	2331	Pragersko
00050000-55f9-6fce-3887-293c3e33339b	3312	Prebold
00050000-55f9-6fce-999e-e412946cfcb1	4205	Preddvor
00050000-55f9-6fce-0e51-a2e8a44a9913	6255	Prem
00050000-55f9-6fce-ef2a-488368619d21	1352	Preserje
00050000-55f9-6fce-0512-c667ac7b0568	6258	Prestranek
00050000-55f9-6fce-8e93-b939de451c5b	2391	Prevalje
00050000-55f9-6fce-485d-bf10fd8a6a5f	3262	Prevorje
00050000-55f9-6fce-3cb9-822c7450886d	1276	Primskovo 
00050000-55f9-6fce-8113-5c97eeefb59f	3253	Pristava pri Mestinju
00050000-55f9-6fce-efdc-e83c5aecf580	9207	Prosenjakovci/Partosfalva
00050000-55f9-6fce-55ba-7647ffe1a436	5297	Prvačina
00050000-55f9-6fce-ab09-398c6f0b3fe8	2250	Ptuj
00050000-55f9-6fce-be32-fd29863889ff	2323	Ptujska Gora
00050000-55f9-6fce-4adb-775f71d60acc	9201	Puconci
00050000-55f9-6fce-8bce-d582320df6d2	2327	Rače
00050000-55f9-6fce-7829-9553b8fee2d5	1433	Radeče
00050000-55f9-6fce-c1cb-3a39e58b202f	9252	Radenci
00050000-55f9-6fce-472b-5d47adbae5ea	2360	Radlje ob Dravi
00050000-55f9-6fce-67c4-bf1a4e955935	1235	Radomlje
00050000-55f9-6fce-81ed-15b2186af2d1	4240	Radovljica
00050000-55f9-6fce-55b4-1e57dc1549d5	8274	Raka
00050000-55f9-6fce-5e36-821e46ffe2dc	1381	Rakek
00050000-55f9-6fce-d5ef-78adc7735102	4283	Rateče - Planica
00050000-55f9-6fce-966f-3f439d4c22bb	2390	Ravne na Koroškem
00050000-55f9-6fce-85da-c6af306961d7	9246	Razkrižje
00050000-55f9-6fce-49fc-6d416111bb51	3332	Rečica ob Savinji
00050000-55f9-6fce-a6c4-6b243154e908	5292	Renče
00050000-55f9-6fce-f84c-738b4e6ec17d	1310	Ribnica
00050000-55f9-6fce-d008-9f5c2cda8961	2364	Ribnica na Pohorju
00050000-55f9-6fce-dfbc-76d0ad5ff3aa	3272	Rimske Toplice
00050000-55f9-6fce-9b62-82a2ef80d04c	1314	Rob
00050000-55f9-6fce-e162-5813bccad235	5215	Ročinj
00050000-55f9-6fce-bcb0-473f7adb0bf8	3250	Rogaška Slatina
00050000-55f9-6fce-062d-4a8fe31a1d0a	9262	Rogašovci
00050000-55f9-6fce-78e1-a9b3742fc9b0	3252	Rogatec
00050000-55f9-6fce-bdd9-acc71d2492fe	1373	Rovte
00050000-55f9-6fce-36ca-48e98a810d7e	2342	Ruše
00050000-55f9-6fce-a9b0-d746e7af75de	1282	Sava
00050000-55f9-6fce-a936-53bed3576a23	6333	Sečovlje/Sicciole
00050000-55f9-6fce-2f77-7581f10d231e	4227	Selca
00050000-55f9-6fce-4e61-a4beff61988f	2352	Selnica ob Dravi
00050000-55f9-6fce-92a5-944910570f15	8333	Semič
00050000-55f9-6fce-babc-ee9f678abc4d	8281	Senovo
00050000-55f9-6fce-3caf-426bdffaf7a4	6224	Senožeče
00050000-55f9-6fce-4fc5-d7efc272f8d8	8290	Sevnica
00050000-55f9-6fce-f5f9-c59df0d36792	6210	Sežana
00050000-55f9-6fce-c59c-1bfa2aca0b8e	2214	Sladki Vrh
00050000-55f9-6fce-34c3-e53cab1061e4	5283	Slap ob Idrijci
00050000-55f9-6fce-09a5-f7ed9f24fd88	2380	Slovenj Gradec
00050000-55f9-6fce-63fd-e1da2d13b66c	2310	Slovenska Bistrica
00050000-55f9-6fce-0c99-d69f05906d98	3210	Slovenske Konjice
00050000-55f9-6fce-c380-c53594f883ce	1216	Smlednik
00050000-55f9-6fce-ad1e-d17bb2c49e88	5232	Soča
00050000-55f9-6fce-8448-68cad468ab5f	1317	Sodražica
00050000-55f9-6fce-b816-de8ea370739c	3335	Solčava
00050000-55f9-6fce-d031-f89465eeb9ec	5250	Solkan
00050000-55f9-6fce-a24d-c60e99ab7c9f	4229	Sorica
00050000-55f9-6fce-3f84-c11f8a9edbf0	4225	Sovodenj
00050000-55f9-6fce-d9b3-ed4cff2a89e6	5281	Spodnja Idrija
00050000-55f9-6fce-dcdb-18aed3e9882c	2241	Spodnji Duplek
00050000-55f9-6fce-f494-0fa817497f50	9245	Spodnji Ivanjci
00050000-55f9-6fce-8900-b728ea67da90	2277	Središče ob Dravi
00050000-55f9-6fce-165e-69ab7bf988e6	4267	Srednja vas v Bohinju
00050000-55f9-6fce-3499-92e7acf4e576	8256	Sromlje 
00050000-55f9-6fce-40c6-59f14ba6c99f	5224	Srpenica
00050000-55f9-6fce-0b9d-485a4e9963e0	1242	Stahovica
00050000-55f9-6fce-b6ee-111e09d09f04	1332	Stara Cerkev
00050000-55f9-6fce-177c-9fe4aa954ce5	8342	Stari trg ob Kolpi
00050000-55f9-6fce-7654-9172aeffd202	1386	Stari trg pri Ložu
00050000-55f9-6fce-9537-a6964d128020	2205	Starše
00050000-55f9-6fce-cb2e-7bfa5946c155	2289	Stoperce
00050000-55f9-6fce-9503-5500e3d66baa	8322	Stopiče
00050000-55f9-6fce-7cff-9a3e09969b4b	3206	Stranice
00050000-55f9-6fce-357e-2550200cdf47	8351	Straža
00050000-55f9-6fce-365e-75fd47629b53	1313	Struge
00050000-55f9-6fce-8133-0994032c3e88	8293	Studenec
00050000-55f9-6fce-30ad-9e277896994d	8331	Suhor
00050000-55f9-6fce-d0dd-6b59c35923a0	2233	Sv. Ana v Slovenskih goricah
00050000-55f9-6fce-4c75-d0e356f9f852	2235	Sv. Trojica v Slovenskih goricah
00050000-55f9-6fce-ae76-8aa670110147	2353	Sveti Duh na Ostrem Vrhu
00050000-55f9-6fce-4da6-185fa89fa115	9244	Sveti Jurij ob Ščavnici
00050000-55f9-6fce-18f0-9ffc9e48af1d	3264	Sveti Štefan
00050000-55f9-6fce-10e3-499b2c1eaa9d	2258	Sveti Tomaž
00050000-55f9-6fce-bc66-36ac4d738ffd	9204	Šalovci
00050000-55f9-6fce-6ec1-3166e71c81a3	5261	Šempas
00050000-55f9-6fce-4adf-a56ad8d29981	5290	Šempeter pri Gorici
00050000-55f9-6fce-a376-1d8d243bbb6b	3311	Šempeter v Savinjski dolini
00050000-55f9-6fce-6bec-00ec6b2f9770	4208	Šenčur
00050000-55f9-6fce-b1e2-b422934972fe	2212	Šentilj v Slovenskih goricah
00050000-55f9-6fce-b345-3227b1325876	8297	Šentjanž
00050000-55f9-6fce-36a8-a33c933e143a	2373	Šentjanž pri Dravogradu
00050000-55f9-6fce-6e59-b6d4850a9336	8310	Šentjernej
00050000-55f9-6fce-0d49-14021d71ce96	3230	Šentjur
00050000-55f9-6fce-e4e8-b866ca20d3a8	3271	Šentrupert
00050000-55f9-6fce-b837-4ee48908db00	8232	Šentrupert
00050000-55f9-6fce-8012-e8ae78ff7ea0	1296	Šentvid pri Stični
00050000-55f9-6fce-4336-6afc76e331b0	8275	Škocjan
00050000-55f9-6fce-80a9-c4d80e18435f	6281	Škofije
00050000-55f9-6fce-977d-3b9dc084acfa	4220	Škofja Loka
00050000-55f9-6fcf-e475-d376221a2a9c	3211	Škofja vas
00050000-55f9-6fcf-993e-5dc1d7def4a3	1291	Škofljica
00050000-55f9-6fcf-826d-565c33acc718	6274	Šmarje
00050000-55f9-6fcf-eeef-4a1aa75e6975	1293	Šmarje - Sap
00050000-55f9-6fcf-6006-c3bb2388a117	3240	Šmarje pri Jelšah
00050000-55f9-6fcf-1215-9df28783749b	8220	Šmarješke Toplice
00050000-55f9-6fcf-236f-674373cf360d	2315	Šmartno na Pohorju
00050000-55f9-6fcf-c6c4-e74519c458eb	3341	Šmartno ob Dreti
00050000-55f9-6fcf-bdb2-e66d794165e9	3327	Šmartno ob Paki
00050000-55f9-6fcf-443d-4186fc2b4066	1275	Šmartno pri Litiji
00050000-55f9-6fcf-a85a-0b36e6728a61	2383	Šmartno pri Slovenj Gradcu
00050000-55f9-6fcf-e715-016bc923802a	3201	Šmartno v Rožni dolini
00050000-55f9-6fcf-bbc9-7f8b4c88c150	3325	Šoštanj
00050000-55f9-6fcf-1511-eca36167a9ef	6222	Štanjel
00050000-55f9-6fcf-777e-1b1485f47a44	3220	Štore
00050000-55f9-6fcf-1da7-558ea487469d	3304	Tabor
00050000-55f9-6fcf-ba3f-dea108bac718	3221	Teharje
00050000-55f9-6fcf-fcce-f425f44f13e6	9251	Tišina
00050000-55f9-6fcf-2bf8-04c018ac3c93	5220	Tolmin
00050000-55f9-6fcf-b12a-a5e9e45db04b	3326	Topolšica
00050000-55f9-6fcf-d696-676f7eb6eb93	2371	Trbonje
00050000-55f9-6fcf-4678-7158aaab3f32	1420	Trbovlje
00050000-55f9-6fcf-2cfc-bf1171416542	8231	Trebelno 
00050000-55f9-6fcf-af26-5ac3fc00a9c7	8210	Trebnje
00050000-55f9-6fcf-daca-da6bdeded80c	5252	Trnovo pri Gorici
00050000-55f9-6fcf-9e23-df5938f5661f	2254	Trnovska vas
00050000-55f9-6fcf-059a-26350d84b107	1222	Trojane
00050000-55f9-6fcf-913e-c857ac5e7efb	1236	Trzin
00050000-55f9-6fcf-7a37-df07e91e8b47	4290	Tržič
00050000-55f9-6fcf-ab8c-0be885a4a8f7	8295	Tržišče
00050000-55f9-6fcf-9b03-7b5cc18fa01b	1311	Turjak
00050000-55f9-6fcf-511c-e28d80138394	9224	Turnišče
00050000-55f9-6fcf-4187-0850eb1f978d	8323	Uršna sela
00050000-55f9-6fcf-8880-b7b03019aef4	1252	Vače
00050000-55f9-6fcf-b873-89e40e91ddf0	3320	Velenje 
00050000-55f9-6fcf-0849-6a7de872c123	3322	Velenje - poštni predali
00050000-55f9-6fcf-73bd-65227f1988d9	8212	Velika Loka
00050000-55f9-6fcf-7e93-d54b1de557d1	2274	Velika Nedelja
00050000-55f9-6fcf-1878-b16c74df15b9	9225	Velika Polana
00050000-55f9-6fcf-148d-06d9af92a2a7	1315	Velike Lašče
00050000-55f9-6fcf-a5f3-027be93ae2ce	8213	Veliki Gaber
00050000-55f9-6fcf-eea9-15b1e34b4658	9241	Veržej
00050000-55f9-6fcf-cc47-3567daf0b65f	1312	Videm - Dobrepolje
00050000-55f9-6fcf-e50a-402220f1782f	2284	Videm pri Ptuju
00050000-55f9-6fcf-c699-74fe2a34e7c4	8344	Vinica
00050000-55f9-6fcf-e7d9-4edbf256ffb8	5271	Vipava
00050000-55f9-6fcf-74e0-e781fa38b462	4212	Visoko
00050000-55f9-6fcf-c0c7-339101496b2e	1294	Višnja Gora
00050000-55f9-6fcf-941c-015c23cadd85	3205	Vitanje
00050000-55f9-6fcf-6546-56dd2cae3143	2255	Vitomarci
00050000-55f9-6fcf-c41b-c61f1f326ea3	1217	Vodice
00050000-55f9-6fcf-b9ac-e581e93b5803	3212	Vojnik\t
00050000-55f9-6fcf-e4bf-528ca77b5851	5293	Volčja Draga
00050000-55f9-6fcf-54d4-6bb7e6fbbbdf	2232	Voličina
00050000-55f9-6fcf-8e68-92e7b666d42b	3305	Vransko
00050000-55f9-6fcf-9736-a709b91e5493	6217	Vremski Britof
00050000-55f9-6fcf-34cd-b8033d947cb7	1360	Vrhnika
00050000-55f9-6fcf-ee45-ee0d9ecf8074	2365	Vuhred
00050000-55f9-6fcf-bc73-fcee29c6b496	2367	Vuzenica
00050000-55f9-6fcf-7264-a4573523c2f1	8292	Zabukovje 
00050000-55f9-6fcf-e1e5-39bd0e51c004	1410	Zagorje ob Savi
00050000-55f9-6fcf-bcea-27608713af23	1303	Zagradec
00050000-55f9-6fcf-2db8-b400359a5716	2283	Zavrč
00050000-55f9-6fcf-c641-863870054ebb	8272	Zdole 
00050000-55f9-6fcf-c041-1f668fee2677	4201	Zgornja Besnica
00050000-55f9-6fcf-492f-70e87a375f1c	2242	Zgornja Korena
00050000-55f9-6fcf-41c0-fb71a7158bf2	2201	Zgornja Kungota
00050000-55f9-6fcf-5590-52bafec244a5	2316	Zgornja Ložnica
00050000-55f9-6fcf-59dd-de17e6abf20f	2314	Zgornja Polskava
00050000-55f9-6fcf-1a16-065482e9e2b2	2213	Zgornja Velka
00050000-55f9-6fcf-4934-304f529c3619	4247	Zgornje Gorje
00050000-55f9-6fcf-9067-e61058241e95	4206	Zgornje Jezersko
00050000-55f9-6fcf-2930-e26cc51b4e37	2285	Zgornji Leskovec
00050000-55f9-6fcf-522b-fa375720fb5a	1432	Zidani Most
00050000-55f9-6fcf-4707-4842579f50a6	3214	Zreče
00050000-55f9-6fcf-3308-0694e492821c	4209	Žabnica
00050000-55f9-6fcf-f38c-88cd26a67bd1	3310	Žalec
00050000-55f9-6fcf-0db5-e3862ebfb599	4228	Železniki
00050000-55f9-6fcf-08b6-6083ef271ef7	2287	Žetale
00050000-55f9-6fcf-1e19-5296d1f3a819	4226	Žiri
00050000-55f9-6fcf-bdb0-1c7aa450fa3c	4274	Žirovnica
00050000-55f9-6fcf-f847-b541be7ed00f	8360	Žužemberk
\.


--
-- TOC entry 2933 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19834161)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19833793)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19833600)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f9-6fd0-fd9c-ef495ec8ae69	00080000-55f9-6fd0-9837-f8853536f13f	\N	00040000-55f9-6fcf-2c73-bae35129c2c9	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f9-6fd0-b72a-9f973d45d659	00080000-55f9-6fd0-9837-f8853536f13f	\N	00040000-55f9-6fcf-2c73-bae35129c2c9	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f9-6fd0-0c62-c7444a23781e	00080000-55f9-6fd0-095a-1923b6b1f44b	\N	00040000-55f9-6fcf-2c73-bae35129c2c9	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2955 (class 0 OID 19833678)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 19833805)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 19834175)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 19834185)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f9-6fd0-2828-eb012a93f618	00080000-55f9-6fd0-59ed-2d2706648ba5	0987	AK
00190000-55f9-6fd0-cc2a-a4aa70c0f3c7	00080000-55f9-6fd0-095a-1923b6b1f44b	0989	AK
00190000-55f9-6fd0-b479-e548795ac0e8	00080000-55f9-6fd0-088a-2143b30e88a9	0986	AK
00190000-55f9-6fd0-3334-e770600096f5	00080000-55f9-6fd0-bb7d-49de8362bb7b	0984	AK
00190000-55f9-6fd0-b245-876d8b57283c	00080000-55f9-6fd0-033b-849b9e91d8c9	0983	AK
00190000-55f9-6fd0-07f0-b1d8d7f234ea	00080000-55f9-6fd0-ffa0-565bc9de21a3	0982	AK
00190000-55f9-6fd1-886c-791e58a248ff	00080000-55f9-6fd1-b5d1-25ba8c733e20	1001	AK
\.


--
-- TOC entry 2991 (class 0 OID 19834118)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f9-6fd0-4fcc-3046d43dcc94	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2995 (class 0 OID 19834193)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19833834)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f9-6fd0-b9bc-877211375bc9	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f9-6fd0-93d9-3d37632adf78	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f9-6fd0-75be-f1e77b170342	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f9-6fd0-a082-2c98abb3dfa3	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f9-6fd0-d950-93b1d8a2791c	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f9-6fd0-4e08-10fdb906e66e	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f9-6fd0-6b5e-30a83bda3bf2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2964 (class 0 OID 19833778)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 19833768)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19833971)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19833908)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 19833473)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f9-6fd1-b5d1-25ba8c733e20	00010000-55f9-6fcf-e28f-675764969e59	2015-09-16 15:34:09	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f9-6fd1-399f-2cbf7db8b114	00010000-55f9-6fcf-e28f-675764969e59	2015-09-16 15:34:09	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f9-6fd1-886c-791e58a248ff	00010000-55f9-6fcf-e28f-675764969e59	2015-09-16 15:34:09	INS	a:0:{}
\.


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2973 (class 0 OID 19833847)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 19833511)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f9-6fcf-1832-bf450595d42b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f9-6fcf-2ab0-8561d69a1646	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f9-6fcf-bd27-a5c39ae444a1	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f9-6fcf-ad90-936ac2b93761	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f9-6fcf-3b0d-519616771dba	planer	Planer dogodkov v koledarju	t
00020000-55f9-6fcf-5bb0-893a9022367d	kadrovska	Kadrovska služba	t
00020000-55f9-6fcf-c0fc-ace257155634	arhivar	Ažuriranje arhivalij	t
00020000-55f9-6fcf-fc32-d61d6b68f9f0	igralec	Igralec	t
00020000-55f9-6fcf-1c4e-552a793cbf57	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f9-6fd0-792c-8a9f56424cc6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2940 (class 0 OID 19833495)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f9-6fcf-cdd4-35590c61708c	00020000-55f9-6fcf-bd27-a5c39ae444a1
00010000-55f9-6fcf-e28f-675764969e59	00020000-55f9-6fcf-bd27-a5c39ae444a1
00010000-55f9-6fd0-472c-5ac34cb584c7	00020000-55f9-6fd0-792c-8a9f56424cc6
\.


--
-- TOC entry 2975 (class 0 OID 19833861)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19833799)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19833745)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 19833460)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f9-6fcf-3d1d-08cdf4481db8	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f9-6fcf-4e78-e7441c7bd5b2	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f9-6fcf-da14-5544faa2e356	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f9-6fcf-421f-6d6707177256	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f9-6fcf-5475-497271a089f4	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2935 (class 0 OID 19833452)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f9-6fcf-de6e-2c35f52067b0	00230000-55f9-6fcf-421f-6d6707177256	popa
00240000-55f9-6fcf-65b2-c7371b63c123	00230000-55f9-6fcf-421f-6d6707177256	oseba
00240000-55f9-6fcf-ff7f-566f5e1e8039	00230000-55f9-6fcf-421f-6d6707177256	sezona
00240000-55f9-6fcf-65a9-642813aa4d1d	00230000-55f9-6fcf-4e78-e7441c7bd5b2	prostor
00240000-55f9-6fcf-5fe4-051407acc58c	00230000-55f9-6fcf-421f-6d6707177256	besedilo
00240000-55f9-6fcf-2250-9dced63eb141	00230000-55f9-6fcf-421f-6d6707177256	uprizoritev
00240000-55f9-6fcf-5bde-346146e7fd08	00230000-55f9-6fcf-421f-6d6707177256	funkcija
00240000-55f9-6fcf-4b37-6942813b1340	00230000-55f9-6fcf-421f-6d6707177256	tipfunkcije
00240000-55f9-6fcf-8d4d-59431e6314e5	00230000-55f9-6fcf-421f-6d6707177256	alternacija
00240000-55f9-6fcf-f498-17f7a49845b5	00230000-55f9-6fcf-3d1d-08cdf4481db8	pogodba
00240000-55f9-6fcf-b0cf-5488f238f641	00230000-55f9-6fcf-421f-6d6707177256	zaposlitev
00240000-55f9-6fcf-a74a-9d56c653ed4a	00230000-55f9-6fcf-421f-6d6707177256	zvrstuprizoritve
00240000-55f9-6fcf-7cdb-491af2b16bd1	00230000-55f9-6fcf-3d1d-08cdf4481db8	programdela
00240000-55f9-6fcf-7432-7277fb658b8d	00230000-55f9-6fcf-421f-6d6707177256	zapis
\.


--
-- TOC entry 2934 (class 0 OID 19833447)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
027aa74d-a8cb-456b-9e40-ce0dbd4667dd	00240000-55f9-6fcf-de6e-2c35f52067b0	0	1001
\.


--
-- TOC entry 2980 (class 0 OID 19833918)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f9-6fd0-fc90-4d853e6b173f	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	00080000-55f9-6fd0-9837-f8853536f13f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f9-6fcf-f72c-1eed831800ac
00270000-55f9-6fd0-81af-83900fad9a5d	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	00080000-55f9-6fd0-9837-f8853536f13f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f9-6fcf-f72c-1eed831800ac
\.


--
-- TOC entry 2947 (class 0 OID 19833573)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 19833755)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f9-6fd1-e87a-a866900b6517	00180000-55f9-6fd0-1fc7-b3d83f8caee2	000c0000-55f9-6fd0-d38f-952a9074f857	00090000-55f9-6fd0-1cd9-3b7b5b7a97e8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f9-6fd1-ae7e-9028274719b8	00180000-55f9-6fd0-1fc7-b3d83f8caee2	000c0000-55f9-6fd0-6dc9-673beef08091	00090000-55f9-6fd0-716f-0dbcb3f3fa5b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f9-6fd1-de0c-a94015904a48	00180000-55f9-6fd0-1fc7-b3d83f8caee2	000c0000-55f9-6fd0-42b7-f08769a609b7	00090000-55f9-6fd0-c4bf-73dcf2fa746f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f9-6fd1-d608-0f63473978e0	00180000-55f9-6fd0-1fc7-b3d83f8caee2	000c0000-55f9-6fd0-70f2-039b27e733bc	00090000-55f9-6fd0-8239-1cce7177811f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f9-6fd1-f633-0a865e9fcbe5	00180000-55f9-6fd0-1fc7-b3d83f8caee2	000c0000-55f9-6fd0-72ee-44593278724f	00090000-55f9-6fd0-893b-89a1da0a5a59	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f9-6fd1-7bce-77730899be2a	00180000-55f9-6fd0-11b0-cd2b2cb60e46	\N	00090000-55f9-6fd0-893b-89a1da0a5a59	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2983 (class 0 OID 19833959)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f9-6fcf-9f5f-05dcc816df21	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f9-6fcf-6083-c1f97b93dcf2	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f9-6fcf-835c-a6ba3fece82a	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f9-6fcf-9674-d76a5daaae5b	04	Režija	Režija	Režija	umetnik
000f0000-55f9-6fcf-1474-8ddb2b022881	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f9-6fcf-26da-7d5a72f3236e	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f9-6fcf-6599-9ad734628aba	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f9-6fcf-1f07-15daef7376da	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f9-6fcf-b9ba-6c3ae17a3161	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f9-6fcf-e8e2-cdfc5bff2089	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f9-6fcf-fd3f-e7a3aa0ee222	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f9-6fcf-e53c-423627a5c053	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f9-6fcf-e29d-d65cc2d7f2b6	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f9-6fcf-5067-a61857a9fffc	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f9-6fcf-abd3-1952f02f1fa4	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f9-6fcf-ffcb-f147675b9a33	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f9-6fcf-78e7-851769c25a3b	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f9-6fcf-1612-5be2ba7812d2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2996 (class 0 OID 19834203)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f9-6fcf-7b54-03922cdd0902	01	Velika predstava	f	1.00	1.00
002b0000-55f9-6fcf-ad81-9a3805fa5eaf	02	Mala predstava	f	0.50	0.50
002b0000-55f9-6fcf-93a9-46b198fbef05	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f9-6fcf-1a2f-6b545fe471f0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f9-6fcf-219d-4e7f2574cf9e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2952 (class 0 OID 19833635)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 19833482)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f9-6fcf-e28f-675764969e59	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO4JMFndoNNEJbOnth2iRUkyq4RS2Ea32	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f9-6fd0-1658-da0519c0803a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f9-6fd0-e722-b2be53b70bb8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f9-6fd0-65de-15c247e59739	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f9-6fd0-a0bf-1f33124dcf31	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f9-6fd0-78ee-8adb240560be	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f9-6fd0-1959-e56bd4d6161a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f9-6fd0-8e5b-a2ff9896cdd9	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f9-6fd0-8b0a-590644e8d9f6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f9-6fd0-d96d-594f8fe587b9	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f9-6fd0-472c-5ac34cb584c7	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f9-6fcf-cdd4-35590c61708c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 19834008)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f9-6fd0-ae89-b79cdcb3e683	00160000-55f9-6fd0-a543-6bad4b27de7d	\N	00140000-55f9-6fcf-51ff-55a33b3fad0c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f9-6fd0-d950-93b1d8a2791c
000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	00160000-55f9-6fd0-82ae-8a44153bd29f	\N	00140000-55f9-6fcf-d93e-a1ecd329e747	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f9-6fd0-4e08-10fdb906e66e
000e0000-55f9-6fd0-9eca-baa1ccc257e7	\N	\N	00140000-55f9-6fcf-d93e-a1ecd329e747	00190000-55f9-6fd0-2828-eb012a93f618	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f9-6fd0-d950-93b1d8a2791c
000e0000-55f9-6fd0-d19c-57b9d22b332f	\N	\N	00140000-55f9-6fcf-d93e-a1ecd329e747	00190000-55f9-6fd0-2828-eb012a93f618	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f9-6fd0-d950-93b1d8a2791c
000e0000-55f9-6fd0-1741-2aa6e0cbdf71	\N	\N	00140000-55f9-6fcf-d93e-a1ecd329e747	00190000-55f9-6fd0-2828-eb012a93f618	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f9-6fd0-b9bc-877211375bc9
000e0000-55f9-6fd0-cf07-525884c47e68	\N	\N	00140000-55f9-6fcf-d93e-a1ecd329e747	00190000-55f9-6fd0-2828-eb012a93f618	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f9-6fd0-b9bc-877211375bc9
\.


--
-- TOC entry 2957 (class 0 OID 19833699)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f9-6fd0-2a28-b38c9cbaa72e	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	\N	1	
00200000-55f9-6fd0-888a-180a48677b2e	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	\N	2	
00200000-55f9-6fd0-6954-38652eefb5f1	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	\N	3	
00200000-55f9-6fd0-160d-c6b0a36bc25c	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	\N	4	
00200000-55f9-6fd0-0f1f-642ff80f0db1	000e0000-55f9-6fd0-16db-ca7dd3f6ca3c	\N	5	
\.


--
-- TOC entry 2971 (class 0 OID 19833826)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 19833932)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f9-6fcf-4f44-d9b4fe12617e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f9-6fcf-dc6a-da7b65302231	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f9-6fcf-ef02-628ecf8cfb91	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f9-6fcf-74a7-1000777e026a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f9-6fcf-ed11-49e6c76725ac	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f9-6fcf-35bc-14313acfce55	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f9-6fcf-e23c-28571e6cf7ed	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f9-6fcf-13b8-097ba4e9ed44	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f9-6fcf-f72c-1eed831800ac	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f9-6fcf-2aa9-22cdb15e6f09	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f9-6fcf-fa02-2a2cac099d2b	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f9-6fcf-dc85-0c1765bca2f9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f9-6fcf-83e3-a01a1dcb89b6	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f9-6fcf-a38d-9ff701c62974	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f9-6fcf-2bf3-eea2e4a0d116	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f9-6fcf-0624-c1c015f42a36	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f9-6fcf-c438-cab5daa2b2cf	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f9-6fcf-5a21-42c43736a30f	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f9-6fcf-59af-2be4729a0209	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f9-6fcf-ba4c-8599c30dec62	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f9-6fcf-28e4-f9ea203d7b55	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f9-6fcf-f287-34b0f289493b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f9-6fcf-5243-aa2a029340ab	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f9-6fcf-967c-e5966071fd3a	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f9-6fcf-48e1-1e6e3bff1230	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f9-6fcf-5d64-67050dd2c050	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f9-6fcf-447e-648cf5595f88	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f9-6fcf-73d5-7ebc2aa9610a	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2999 (class 0 OID 19834250)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 19834222)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19834262)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 19833898)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f9-6fd0-bd67-337c5e3deb6c	00090000-55f9-6fd0-716f-0dbcb3f3fa5b	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f9-6fd0-232a-e9a242fff37d	00090000-55f9-6fd0-c4bf-73dcf2fa746f	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f9-6fd0-1c75-810c5770c5ea	00090000-55f9-6fd0-178d-23ed5c7b6244	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f9-6fd0-9742-e827ae2a26b6	00090000-55f9-6fd0-7ed7-1dbaa8f22d25	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f9-6fd0-3734-fe571d440c1e	00090000-55f9-6fd0-1cd9-3b7b5b7a97e8	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f9-6fd0-69c2-3c64ab7bc90c	00090000-55f9-6fd0-8d09-2c7e0c3a61c7	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2959 (class 0 OID 19833735)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 19833998)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f9-6fcf-51ff-55a33b3fad0c	01	Drama	drama (SURS 01)
00140000-55f9-6fcf-fa81-67ce877c806e	02	Opera	opera (SURS 02)
00140000-55f9-6fcf-c08e-47194d1be9b3	03	Balet	balet (SURS 03)
00140000-55f9-6fcf-cbea-828494d22986	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f9-6fcf-07cf-bd3c8b041659	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f9-6fcf-d93e-a1ecd329e747	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f9-6fcf-e1bd-74e368bec124	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2977 (class 0 OID 19833888)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2485 (class 2606 OID 19833536)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 19834057)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 19834047)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 19833957)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 19834302)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 19833724)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 19833744)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 19834220)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 19833661)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 19834112)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 19833884)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 19833697)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 19833675)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 19833791)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 19834279)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 19834286)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2725 (class 2606 OID 19834310)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 19833818)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 19833633)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 19833545)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 19833569)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 19833525)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2476 (class 2606 OID 19833510)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 19833824)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 19833860)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 19833993)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 19833597)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 19833621)
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
-- TOC entry 2680 (class 2606 OID 19834173)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 19833797)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 19833611)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 19833685)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 19833809)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 19834182)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 19834190)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 19834160)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 19834201)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 19833842)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 19833782)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 19833773)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 19833981)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 19833915)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 19833481)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 19833851)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 19833499)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2478 (class 2606 OID 19833519)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 19833869)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 19833804)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 19833753)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 19833469)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 19833457)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 19833451)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 19833928)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 19833578)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 19833764)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 19833968)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 19834213)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 19833646)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 19833494)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 19834026)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 19833707)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 19833832)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 19833940)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 19834260)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 19834244)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 19834268)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 19833906)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 19833739)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 19834006)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 19833896)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 1259 OID 19833733)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2541 (class 1259 OID 19833734)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2542 (class 1259 OID 19833732)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2543 (class 1259 OID 19833731)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2544 (class 1259 OID 19833730)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2625 (class 1259 OID 19833929)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2626 (class 1259 OID 19833930)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 19833931)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2711 (class 1259 OID 19834281)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2712 (class 1259 OID 19834280)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2499 (class 1259 OID 19833599)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2588 (class 1259 OID 19833825)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2698 (class 1259 OID 19834248)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2699 (class 1259 OID 19834247)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2700 (class 1259 OID 19834249)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2701 (class 1259 OID 19834246)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2702 (class 1259 OID 19834245)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2582 (class 1259 OID 19833811)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2583 (class 1259 OID 19833810)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2535 (class 1259 OID 19833708)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19833885)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 19833887)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2614 (class 1259 OID 19833886)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2524 (class 1259 OID 19833677)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2525 (class 1259 OID 19833676)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2689 (class 1259 OID 19834202)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2641 (class 1259 OID 19833995)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 19833996)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2643 (class 1259 OID 19833997)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2708 (class 1259 OID 19834269)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2650 (class 1259 OID 19834031)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2651 (class 1259 OID 19834028)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2652 (class 1259 OID 19834032)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2653 (class 1259 OID 19834030)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2654 (class 1259 OID 19834029)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2514 (class 1259 OID 19833648)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2515 (class 1259 OID 19833647)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2490 (class 1259 OID 19833572)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2600 (class 1259 OID 19833852)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2480 (class 1259 OID 19833526)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2481 (class 1259 OID 19833527)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2605 (class 1259 OID 19833872)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2606 (class 1259 OID 19833871)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2607 (class 1259 OID 19833870)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2528 (class 1259 OID 19833686)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2529 (class 1259 OID 19833687)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2460 (class 1259 OID 19833459)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2562 (class 1259 OID 19833777)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2563 (class 1259 OID 19833775)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2564 (class 1259 OID 19833774)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2565 (class 1259 OID 19833776)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2471 (class 1259 OID 19833500)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2472 (class 1259 OID 19833501)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2591 (class 1259 OID 19833833)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2721 (class 1259 OID 19834303)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2722 (class 1259 OID 19834311)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2723 (class 1259 OID 19834312)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2577 (class 1259 OID 19833798)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2621 (class 1259 OID 19833916)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2622 (class 1259 OID 19833917)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2671 (class 1259 OID 19834117)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2672 (class 1259 OID 19834116)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2673 (class 1259 OID 19834113)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2674 (class 1259 OID 19834114)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2675 (class 1259 OID 19834115)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2503 (class 1259 OID 19833613)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2504 (class 1259 OID 19833612)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2505 (class 1259 OID 19833614)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2594 (class 1259 OID 19833846)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2595 (class 1259 OID 19833845)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2681 (class 1259 OID 19834183)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 19834184)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2664 (class 1259 OID 19834061)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2665 (class 1259 OID 19834062)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2666 (class 1259 OID 19834059)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2667 (class 1259 OID 19834060)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2618 (class 1259 OID 19833907)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2568 (class 1259 OID 19833786)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2569 (class 1259 OID 19833785)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2570 (class 1259 OID 19833783)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2571 (class 1259 OID 19833784)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2660 (class 1259 OID 19834049)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2661 (class 1259 OID 19834048)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2534 (class 1259 OID 19833698)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2678 (class 1259 OID 19834174)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2455 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2697 (class 1259 OID 19834221)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2715 (class 1259 OID 19834287)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2716 (class 1259 OID 19834288)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2486 (class 1259 OID 19833547)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2487 (class 1259 OID 19833546)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2495 (class 1259 OID 19833579)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2496 (class 1259 OID 19833580)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2557 (class 1259 OID 19833767)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 19833766)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2559 (class 1259 OID 19833765)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 19833726)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2546 (class 1259 OID 19833727)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2547 (class 1259 OID 19833725)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2548 (class 1259 OID 19833729)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2549 (class 1259 OID 19833728)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2502 (class 1259 OID 19833598)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19833662)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 19833664)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2522 (class 1259 OID 19833663)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2523 (class 1259 OID 19833665)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2576 (class 1259 OID 19833792)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2646 (class 1259 OID 19833994)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 19834027)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19833969)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 19833970)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2493 (class 1259 OID 19833570)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2494 (class 1259 OID 19833571)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2615 (class 1259 OID 19833897)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 19833470)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2513 (class 1259 OID 19833634)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2463 (class 1259 OID 19833458)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2694 (class 1259 OID 19834214)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 19833844)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2599 (class 1259 OID 19833843)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 19834058)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 19833622)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 19834007)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 19834261)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2687 (class 1259 OID 19834191)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 19834192)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2634 (class 1259 OID 19833958)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2556 (class 1259 OID 19833754)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 19833520)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2754 (class 2606 OID 19834433)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2753 (class 2606 OID 19834438)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2749 (class 2606 OID 19834458)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2755 (class 2606 OID 19834428)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2751 (class 2606 OID 19834448)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2750 (class 2606 OID 19834453)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2752 (class 2606 OID 19834443)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2787 (class 2606 OID 19834608)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2786 (class 2606 OID 19834613)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2785 (class 2606 OID 19834618)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2819 (class 2606 OID 19834783)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2820 (class 2606 OID 19834778)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2737 (class 2606 OID 19834368)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 19834538)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2814 (class 2606 OID 19834763)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2815 (class 2606 OID 19834758)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2813 (class 2606 OID 19834768)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 19834753)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2817 (class 2606 OID 19834748)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2769 (class 2606 OID 19834533)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2770 (class 2606 OID 19834528)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2748 (class 2606 OID 19834423)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2781 (class 2606 OID 19834578)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 19834588)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2780 (class 2606 OID 19834583)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2743 (class 2606 OID 19834403)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2744 (class 2606 OID 19834398)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2767 (class 2606 OID 19834518)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2811 (class 2606 OID 19834738)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2790 (class 2606 OID 19834623)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 19834628)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2788 (class 2606 OID 19834633)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2818 (class 2606 OID 19834773)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2792 (class 2606 OID 19834653)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2795 (class 2606 OID 19834638)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2791 (class 2606 OID 19834658)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2793 (class 2606 OID 19834648)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2794 (class 2606 OID 19834643)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2741 (class 2606 OID 19834393)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 19834388)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2733 (class 2606 OID 19834353)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2734 (class 2606 OID 19834348)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2775 (class 2606 OID 19834558)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2730 (class 2606 OID 19834328)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2729 (class 2606 OID 19834333)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2776 (class 2606 OID 19834573)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2777 (class 2606 OID 19834568)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2778 (class 2606 OID 19834563)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2746 (class 2606 OID 19834408)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2745 (class 2606 OID 19834413)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2726 (class 2606 OID 19834313)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2759 (class 2606 OID 19834493)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2761 (class 2606 OID 19834483)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2762 (class 2606 OID 19834478)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2760 (class 2606 OID 19834488)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 19834318)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2727 (class 2606 OID 19834323)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2772 (class 2606 OID 19834543)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2823 (class 2606 OID 19834798)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2825 (class 2606 OID 19834803)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2824 (class 2606 OID 19834808)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2768 (class 2606 OID 19834523)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2784 (class 2606 OID 19834598)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2783 (class 2606 OID 19834603)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 19834713)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 19834708)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2806 (class 2606 OID 19834693)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2805 (class 2606 OID 19834698)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2804 (class 2606 OID 19834703)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2739 (class 2606 OID 19834378)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 19834373)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 19834383)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2773 (class 2606 OID 19834553)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2774 (class 2606 OID 19834548)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 19834723)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2808 (class 2606 OID 19834728)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2799 (class 2606 OID 19834683)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2798 (class 2606 OID 19834688)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2801 (class 2606 OID 19834673)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2800 (class 2606 OID 19834678)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2782 (class 2606 OID 19834593)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 19834513)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2764 (class 2606 OID 19834508)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2766 (class 2606 OID 19834498)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2765 (class 2606 OID 19834503)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2796 (class 2606 OID 19834668)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 19834663)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2747 (class 2606 OID 19834418)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2807 (class 2606 OID 19834718)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2810 (class 2606 OID 19834733)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2812 (class 2606 OID 19834743)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2822 (class 2606 OID 19834788)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2821 (class 2606 OID 19834793)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2731 (class 2606 OID 19834343)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2732 (class 2606 OID 19834338)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2736 (class 2606 OID 19834358)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2735 (class 2606 OID 19834363)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 19834473)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 19834468)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2758 (class 2606 OID 19834463)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-16 15:34:10 CEST

--
-- PostgreSQL database dump complete
--

