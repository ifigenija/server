--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-09 16:27:19 CEST

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
-- TOC entry 181 (class 1259 OID 18236367)
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
-- TOC entry 226 (class 1259 OID 18236886)
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
-- TOC entry 225 (class 1259 OID 18236869)
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
-- TOC entry 219 (class 1259 OID 18236777)
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
-- TOC entry 240 (class 1259 OID 18237124)
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
-- TOC entry 195 (class 1259 OID 18236545)
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
    status character varying(20) DEFAULT NULL::character varying,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 18236576)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 18237050)
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
-- TOC entry 190 (class 1259 OID 18236488)
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
-- TOC entry 227 (class 1259 OID 18236899)
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
-- TOC entry 213 (class 1259 OID 18236709)
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
-- TOC entry 193 (class 1259 OID 18236524)
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
-- TOC entry 191 (class 1259 OID 18236505)
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
-- TOC entry 202 (class 1259 OID 18236623)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 18237105)
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
-- TOC entry 239 (class 1259 OID 18237117)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 18237139)
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
-- TOC entry 206 (class 1259 OID 18236648)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 18236462)
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
-- TOC entry 182 (class 1259 OID 18236376)
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
-- TOC entry 183 (class 1259 OID 18236387)
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
-- TOC entry 178 (class 1259 OID 18236341)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 18236360)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 18236655)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 18236689)
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
-- TOC entry 222 (class 1259 OID 18236818)
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
-- TOC entry 185 (class 1259 OID 18236420)
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
-- TOC entry 187 (class 1259 OID 18236454)
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
-- TOC entry 229 (class 1259 OID 18236997)
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
-- TOC entry 203 (class 1259 OID 18236629)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 18236439)
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
-- TOC entry 192 (class 1259 OID 18236517)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 18236641)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 18237011)
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
-- TOC entry 231 (class 1259 OID 18237021)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 18236954)
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
-- TOC entry 232 (class 1259 OID 18237029)
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
-- TOC entry 209 (class 1259 OID 18236670)
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
-- TOC entry 201 (class 1259 OID 18236614)
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
-- TOC entry 200 (class 1259 OID 18236604)
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
-- TOC entry 221 (class 1259 OID 18236807)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 18236744)
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
-- TOC entry 175 (class 1259 OID 18236312)
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
-- TOC entry 174 (class 1259 OID 18236310)
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
-- TOC entry 210 (class 1259 OID 18236683)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 18236350)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 18236334)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 18236697)
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
-- TOC entry 204 (class 1259 OID 18236635)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 18236581)
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
-- TOC entry 173 (class 1259 OID 18236299)
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
-- TOC entry 172 (class 1259 OID 18236291)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 18236286)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 18236754)
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
-- TOC entry 184 (class 1259 OID 18236412)
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
-- TOC entry 199 (class 1259 OID 18236591)
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
-- TOC entry 220 (class 1259 OID 18236795)
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
-- TOC entry 233 (class 1259 OID 18237039)
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
-- TOC entry 189 (class 1259 OID 18236474)
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
-- TOC entry 176 (class 1259 OID 18236321)
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
-- TOC entry 224 (class 1259 OID 18236844)
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
-- TOC entry 194 (class 1259 OID 18236535)
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
-- TOC entry 208 (class 1259 OID 18236662)
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
-- TOC entry 218 (class 1259 OID 18236768)
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
-- TOC entry 236 (class 1259 OID 18237085)
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
-- TOC entry 235 (class 1259 OID 18237057)
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
-- TOC entry 237 (class 1259 OID 18237097)
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
-- TOC entry 215 (class 1259 OID 18236734)
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
-- TOC entry 196 (class 1259 OID 18236571)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 18236834)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 18236724)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 18236315)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 18236367)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 18236886)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f0-41c5-ce9b-a98e13fd906b	000d0000-55f0-41c5-61fa-d214011dc599	\N	00090000-55f0-41c5-c4f8-f8c41aa4151d	000b0000-55f0-41c5-e1a5-adb2051d7dea	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f0-41c5-44ea-25da9c84d4a7	000d0000-55f0-41c5-497b-e09775bac90b	00100000-55f0-41c5-b287-c25729667ce2	00090000-55f0-41c5-5efc-fb55360857cf	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f0-41c5-0694-e6be45c484b8	000d0000-55f0-41c5-7514-48c6b35eac0b	00100000-55f0-41c5-3e3b-4bfb5a80cfac	00090000-55f0-41c5-220b-86aa3d10ee7f	\N	0003	t	\N	2015-09-09	\N	2	t	\N	f	f
000c0000-55f0-41c5-cc3e-92e0960dbf98	000d0000-55f0-41c5-be26-8fb53cc3b68b	\N	00090000-55f0-41c5-a189-3a3c9d06537e	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f0-41c6-db7f-245deef30eba	000d0000-55f0-41c5-a2ee-429692ac1db0	\N	00090000-55f0-41c5-cfab-3b5fa181b699	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f0-41c6-0478-94d26fd15a97	000d0000-55f0-41c5-9d49-c65ce0051912	\N	00090000-55f0-41c5-6600-b919e24b455b	000b0000-55f0-41c5-0b6d-fd812adbf225	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f0-41c6-fb1c-adb5cabd7c78	000d0000-55f0-41c5-f3de-18308f0a69aa	00100000-55f0-41c5-a5e3-53eedf69d184	00090000-55f0-41c5-7d8d-da83e9a8c042	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f0-41c6-e424-0a6f398b98f7	000d0000-55f0-41c5-c40a-6b81ca294d8d	\N	00090000-55f0-41c5-df0f-a3e0179eb597	000b0000-55f0-41c5-adab-5a94f3047928	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f0-41c6-3fb6-5521c453bf29	000d0000-55f0-41c5-f3de-18308f0a69aa	00100000-55f0-41c5-e971-c73b1456ca13	00090000-55f0-41c5-c77c-0a6023451a58	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f0-41c6-4294-50034c0c88fa	000d0000-55f0-41c5-f3de-18308f0a69aa	00100000-55f0-41c5-86bd-a1e79ad7f7d7	00090000-55f0-41c5-41a5-efe44f64a856	\N	0010	t	\N	2015-09-09	\N	16	f	\N	f	t
000c0000-55f0-41c6-4c08-ede88da5e756	000d0000-55f0-41c5-f3de-18308f0a69aa	00100000-55f0-41c5-79da-96f1283a55e5	00090000-55f0-41c5-284e-7f24da7b8958	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f0-41c6-1aba-ac896070ab9e	000d0000-55f0-41c5-2e1b-6b4d6472996a	\N	00090000-55f0-41c5-5efc-fb55360857cf	000b0000-55f0-41c5-0b05-7edf4cd435b3	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2986 (class 0 OID 18236869)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 18236777)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f0-41c5-8729-79605de8647b	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f0-41c5-e844-1aa8e4170d29	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f0-41c5-b0de-f4bbe0c4ed88	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 18237124)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 18236545)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f0-41c5-f098-e9ea5f8a1266	\N	\N	00200000-55f0-41c5-da7d-8f0ee1812721	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55f0-41c5-6c06-dd4a3c1936b7	\N	\N	00200000-55f0-41c5-dc5c-adb1856964a9	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55f0-41c5-1da9-481f2956cb80	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55f0-41c5-10f1-64ae5e2db2ce	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55f0-41c5-c0f8-115f251807ec	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2958 (class 0 OID 18236576)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 18237050)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 18236488)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f0-41c4-ca8e-5e23cd6b78df	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f0-41c4-5cb1-f64fc13d3a16	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f0-41c4-28d4-a97632e307d1	AL	ALB	008	Albania 	Albanija	\N
00040000-55f0-41c4-fc0f-c4f6a22bed05	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f0-41c4-78ea-e12cdf990f85	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f0-41c4-a296-8d7b28b2379c	AD	AND	020	Andorra 	Andora	\N
00040000-55f0-41c4-975b-1948104a671e	AO	AGO	024	Angola 	Angola	\N
00040000-55f0-41c4-6cbc-dcd4f375a11e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f0-41c4-ccb6-c4c605377bb5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f0-41c4-1f67-30ab2ebf4078	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f0-41c4-5524-fbe77cdc4a4b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f0-41c4-b32e-e50d2e67056d	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f0-41c4-a4f1-3b8d5c796bb6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f0-41c4-7a7d-64e6d87276ea	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f0-41c4-cb2f-95f409313440	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f0-41c4-484b-0bcd02aa20db	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f0-41c4-5fca-4d5e5db40869	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f0-41c4-ae99-97057f33cbe5	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f0-41c4-3081-0981955e4c33	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f0-41c4-ce00-b5565018de62	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f0-41c4-ce4d-9fe623e595de	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f0-41c4-b00b-9e9fd6647c8e	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f0-41c4-8372-e8a5ba0e89a6	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f0-41c4-38fc-00e002028bc4	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f0-41c4-933c-6e3e04ded6f9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f0-41c4-c92c-85e96becc11e	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f0-41c4-d7af-53d7f372efc6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f0-41c4-1e6d-419b7085d479	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f0-41c4-ef9f-9126ac9b4f79	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f0-41c4-fefb-b48d2b9e922d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f0-41c4-ce1f-25eb27244040	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f0-41c4-e8d8-3ada6f37b611	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f0-41c4-8554-db49198d2e42	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f0-41c4-2fbb-2911aa035e46	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f0-41c4-8b59-599cd9e4069c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f0-41c4-5417-2fb818a492f2	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f0-41c4-ebd2-f994885c1856	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f0-41c4-df75-9452565e408a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f0-41c4-c2cd-ea5dc7440d35	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f0-41c4-9c51-459460866617	CA	CAN	124	Canada 	Kanada	\N
00040000-55f0-41c4-38e6-afdd6b2d2413	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f0-41c4-31ee-290abe9eb8d1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f0-41c4-145b-2b55a5473001	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f0-41c4-6a6b-c93814e439de	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f0-41c4-d603-5b2c594be583	CL	CHL	152	Chile 	Čile	\N
00040000-55f0-41c4-6b6d-ada2fd9aacdb	CN	CHN	156	China 	Kitajska	\N
00040000-55f0-41c4-1aa0-1fa08c5483a5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f0-41c4-3477-1de7e28a948e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f0-41c4-64f7-5a9f9ecbe6f5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f0-41c4-0d28-d3eed850d414	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f0-41c4-d53e-8a1cbc55550b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f0-41c4-e92c-b3ad829259c7	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f0-41c4-87f2-ff0c8e748191	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f0-41c4-89a6-10ba96a7c15e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f0-41c4-b100-fad25773df38	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f0-41c4-c373-a4b67e005016	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f0-41c4-488b-3932f7a5a8b8	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f0-41c4-f6d4-1bc4925ae997	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f0-41c4-2d38-3e360d6a0241	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f0-41c4-574a-8db7abb4bf40	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f0-41c4-1086-20998da7d99f	DK	DNK	208	Denmark 	Danska	\N
00040000-55f0-41c4-2054-8fcb852af792	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f0-41c4-7792-be86cd04ce77	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f0-41c4-db3a-48f6dd75d7ac	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f0-41c4-6a7b-34c12b537fdb	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f0-41c4-8718-15c7bf925039	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f0-41c4-196e-2227b403d81f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f0-41c4-7cfb-d89e4aa479d3	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f0-41c4-4043-f4667c632787	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f0-41c4-46a6-71e16a39c8bc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f0-41c4-98c5-6207071c94be	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f0-41c4-f3eb-9f577882c2d7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f0-41c4-a0a9-e924916a9861	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f0-41c4-8dce-ebb7dffe96fc	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f0-41c4-d6d5-baa2a33ba73b	FI	FIN	246	Finland 	Finska	\N
00040000-55f0-41c4-0a11-3c3e5f9c150e	FR	FRA	250	France 	Francija	\N
00040000-55f0-41c4-7621-ce56c90f7be0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f0-41c4-7302-fd62682ac19b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f0-41c4-ab6d-95658a237772	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f0-41c4-ec97-8d74908bb4fc	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f0-41c4-26d0-e9eff8d2a17e	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f0-41c4-aea8-79fbe9113972	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f0-41c4-e7a8-4dfaea7048f9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f0-41c4-9fcf-3179d2482645	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f0-41c4-2633-ef8b28eed6bb	GH	GHA	288	Ghana 	Gana	\N
00040000-55f0-41c4-1611-99462fadc44f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f0-41c4-7a2e-d101069f7c6e	GR	GRC	300	Greece 	Grčija	\N
00040000-55f0-41c4-bc2a-6c855343d38a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f0-41c4-04f6-d56bf3711cd2	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f0-41c4-d11a-a7dc2a4bbc38	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f0-41c4-87c4-489101443360	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f0-41c4-715a-b7dcf464eba5	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f0-41c4-c23a-9679da270e62	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f0-41c4-1604-cae7104ae451	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f0-41c4-0d43-eae6a70a1b3b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f0-41c4-491c-c6d9c670980d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f0-41c4-b4c9-71b8943a228c	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f0-41c4-4c8e-5690f1323412	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f0-41c4-cb4a-1a86155f7a69	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f0-41c4-39db-2f5eaf430712	HN	HND	340	Honduras 	Honduras	\N
00040000-55f0-41c4-da0d-3165270e1994	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f0-41c4-f831-f40d8600242d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f0-41c4-cd5b-518d5bb77ff5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f0-41c4-5d30-bdd91053d44f	IN	IND	356	India 	Indija	\N
00040000-55f0-41c4-3c5e-8892a01f7ebb	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f0-41c4-c6e6-e5fcf858ccf1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f0-41c4-f530-343c414bde83	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f0-41c4-075c-36345694d7ee	IE	IRL	372	Ireland 	Irska	\N
00040000-55f0-41c4-a764-a0e4d962104d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f0-41c4-72aa-ea4070852281	IL	ISR	376	Israel 	Izrael	\N
00040000-55f0-41c4-d0e1-1610c9aa44b5	IT	ITA	380	Italy 	Italija	\N
00040000-55f0-41c4-3e75-0384322dc950	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f0-41c4-e283-a333e83eb4bd	JP	JPN	392	Japan 	Japonska	\N
00040000-55f0-41c4-5d6b-a38baa726f2e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f0-41c4-aa8e-f3f544bd82dd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f0-41c4-799c-3c8c7c50cc73	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f0-41c4-0183-9c385fe45189	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f0-41c4-776a-caece3b1f9fd	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f0-41c4-061d-cb5dcdd2cf75	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f0-41c4-0424-2b42e849bad9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f0-41c4-797f-5b47e11d68b6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f0-41c4-14f7-e8588be51693	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f0-41c4-5a46-0e2c752ec6f1	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f0-41c4-668a-65cb997409aa	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f0-41c4-dd83-9e1d8d17e762	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f0-41c4-8ade-0b730942868a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f0-41c4-e26f-4a3479b87ff0	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f0-41c4-8064-6bef21a3f9e8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f0-41c4-0e0d-548292beaec1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f0-41c4-e2e0-0d9b650e091a	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f0-41c4-aa36-913683e46a79	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f0-41c4-cb29-3ca855bd5e66	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f0-41c4-a2ef-38e61162887b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f0-41c4-7648-2388cc2463fe	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f0-41c4-2df4-47c36ce1f561	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f0-41c4-4f0e-40f9d703d9d9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f0-41c4-b233-5a5fdb87e171	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f0-41c4-8fb5-42429d091e6b	ML	MLI	466	Mali 	Mali	\N
00040000-55f0-41c4-21ee-9b7a10efd516	MT	MLT	470	Malta 	Malta	\N
00040000-55f0-41c4-cd49-d9574fdaa840	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f0-41c4-03d7-671fa1c3e146	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f0-41c4-cd51-df9a37194a84	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f0-41c4-85e4-602ba33d912f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f0-41c4-1a66-38ee5ddb1cb2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f0-41c4-c482-23ac610264e6	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f0-41c4-6285-3ce8fcf5a7e2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f0-41c4-4f57-90eddbc64f97	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f0-41c4-34fd-8ab14aa0afc7	MC	MCO	492	Monaco 	Monako	\N
00040000-55f0-41c4-7f3f-d8b6260b9d42	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f0-41c4-ac1d-180a6ee97371	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f0-41c4-5fcd-b7345b1d73d6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f0-41c4-baa0-7f7d9e257819	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f0-41c4-b730-580cdd5359f4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f0-41c4-6e9a-1738c4707ece	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f0-41c4-8f24-fd2347df7d42	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f0-41c4-8908-fa24d24c03ba	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f0-41c4-c737-994be8301d0b	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f0-41c4-5b6f-ef74ef8af0a0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f0-41c4-fa01-4518ed30f813	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f0-41c4-211d-2ec57e19f4c6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f0-41c4-9eed-10fbb5934762	NE	NER	562	Niger 	Niger 	\N
00040000-55f0-41c4-5198-a565e3a49f5c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f0-41c4-3c6e-ada2d54eb945	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f0-41c4-9e14-f6e7769f5a5f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f0-41c4-19aa-fdada8fbd3f9	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f0-41c4-6959-0ffa7372e342	NO	NOR	578	Norway 	Norveška	\N
00040000-55f0-41c4-d7ed-eb1466fc464b	OM	OMN	512	Oman 	Oman	\N
00040000-55f0-41c4-72fa-cf8dbfae007d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f0-41c4-a990-b48f5e471e46	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f0-41c4-8649-0eb63a4646b7	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f0-41c4-de82-b05947846b83	PA	PAN	591	Panama 	Panama	\N
00040000-55f0-41c4-7735-625b050c6d40	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f0-41c4-a0ff-d59489b65412	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f0-41c4-9b87-de93e7c02d40	PE	PER	604	Peru 	Peru	\N
00040000-55f0-41c4-b9c7-963118f4688d	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f0-41c4-fa6f-a961a2df38e6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f0-41c4-ce3b-9df5dc1ad382	PL	POL	616	Poland 	Poljska	\N
00040000-55f0-41c4-d5ce-da4814aca082	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f0-41c4-b282-33e19959be66	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f0-41c4-d9e8-7c93b66fbc78	QA	QAT	634	Qatar 	Katar	\N
00040000-55f0-41c4-b812-b823d8780d9f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f0-41c4-365d-2d3188807b0c	RO	ROU	642	Romania 	Romunija	\N
00040000-55f0-41c4-e57a-f0893c4e13aa	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f0-41c4-f46c-83548b5bdfd0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f0-41c4-e2fd-1fabc5645b3a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f0-41c4-e116-e17f4e18d520	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f0-41c4-b729-162c300db738	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f0-41c4-9e7f-51694e34474d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f0-41c4-79b0-05f8b69256ad	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f0-41c4-a58c-8672506c29bc	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f0-41c4-2604-426a264bbf69	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f0-41c4-4b06-9ea3b1d66bca	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f0-41c4-1f83-7f697671f637	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f0-41c4-c056-9af7efeb302e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f0-41c4-12f1-b3d4c7a6ddc9	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f0-41c4-e7a7-81ce747f2df6	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f0-41c4-bba6-1a360f51870f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f0-41c4-071b-d1017b3249ce	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f0-41c4-870b-225af26c965e	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f0-41c4-d014-89c6d82d4a94	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f0-41c4-a2af-014ae68d055f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f0-41c4-d389-1bff44f93613	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f0-41c4-9b23-82f696bac755	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f0-41c4-2531-6536ebdd0df5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f0-41c4-cb49-a3051d64408a	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f0-41c4-5244-45aaad21f605	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f0-41c4-ede6-d7ba86a8a880	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f0-41c4-006e-4cf8169aba3f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f0-41c4-02b8-9f8c7e2bd5c8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f0-41c4-4ee3-8fd36c481899	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f0-41c4-a27b-7f2b4e2d10ea	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f0-41c4-21c2-7838efc60161	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f0-41c4-10f6-4aa1de3576f9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f0-41c4-b378-9ad17a876497	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f0-41c4-f877-8b00a1113296	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f0-41c4-90a2-fc112305a4a8	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f0-41c4-05c2-5865ecd8b941	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f0-41c4-a59b-aa3df1a18720	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f0-41c4-c3cc-7bd6b8cf4b4d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f0-41c4-fcda-cd0e5d9b8eaf	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f0-41c4-316d-4bc31cf77944	TH	THA	764	Thailand 	Tajska	\N
00040000-55f0-41c4-ed5e-bf59721dbfa4	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f0-41c4-d2c7-886de2c2dda4	TG	TGO	768	Togo 	Togo	\N
00040000-55f0-41c4-a77b-6566b00b7380	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f0-41c4-322b-190322e07061	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f0-41c4-da5b-c7ba10a0e913	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f0-41c4-862e-ace70318c7d0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f0-41c4-abc1-9989b6e87098	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f0-41c4-2b52-6c257dc66343	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f0-41c4-5bf3-5581648ff743	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f0-41c4-7328-d61570206c67	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f0-41c4-4f15-1b19c5c68d69	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f0-41c4-0bf0-274203b2fd1f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f0-41c4-7866-9b929c8c9ee5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f0-41c4-1730-4d4ed59e4258	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f0-41c4-fcbe-0db9d6fe4e7d	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f0-41c4-7ef9-93ff7969298a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f0-41c4-a57b-29090aee2624	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f0-41c4-bd27-2037ca517764	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f0-41c4-c761-a8a0dbd2f257	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f0-41c4-07e6-d5b66fe03bab	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f0-41c4-6350-e323974d434e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f0-41c4-4ede-3e2738407206	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f0-41c4-abb4-44339b8786ff	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f0-41c4-68d2-66b0b65305c3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f0-41c4-996c-b89c688aba80	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f0-41c4-bc97-41a200ca7f6c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f0-41c4-43af-47924ae43f6f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f0-41c4-01a4-56b95350a97a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2988 (class 0 OID 18236899)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f0-41c5-a26c-521a02007aab	000e0000-55f0-41c5-920b-6dc3edeead75	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f0-41c4-b4c1-4249d748dcc1	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f0-41c5-5be3-3ba71686d8af	000e0000-55f0-41c5-8863-a95e33a7f1da	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f0-41c4-de22-612c76b7d1f4	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f0-41c5-7768-af4b5560127d	000e0000-55f0-41c5-3b91-f2541c182381	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f0-41c4-b4c1-4249d748dcc1	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f0-41c5-a5f1-18aff05c4060	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f0-41c5-d35d-adad99772945	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 18236709)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f0-41c5-61fa-d214011dc599	000e0000-55f0-41c5-8863-a95e33a7f1da	000c0000-55f0-41c5-ce9b-a98e13fd906b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f0-41c4-a69c-babb3559932f
000d0000-55f0-41c5-497b-e09775bac90b	000e0000-55f0-41c5-8863-a95e33a7f1da	000c0000-55f0-41c5-44ea-25da9c84d4a7	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f0-41c4-fd23-b08fee737f22
000d0000-55f0-41c5-7514-48c6b35eac0b	000e0000-55f0-41c5-8863-a95e33a7f1da	000c0000-55f0-41c5-0694-e6be45c484b8	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f0-41c4-ff94-2649bf99b3f6
000d0000-55f0-41c5-be26-8fb53cc3b68b	000e0000-55f0-41c5-8863-a95e33a7f1da	000c0000-55f0-41c5-cc3e-92e0960dbf98	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f0-41c4-39cb-918f2ff8f4ac
000d0000-55f0-41c5-a2ee-429692ac1db0	000e0000-55f0-41c5-8863-a95e33a7f1da	000c0000-55f0-41c6-db7f-245deef30eba	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f0-41c4-39cb-918f2ff8f4ac
000d0000-55f0-41c5-9d49-c65ce0051912	000e0000-55f0-41c5-8863-a95e33a7f1da	000c0000-55f0-41c6-0478-94d26fd15a97	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f0-41c4-a69c-babb3559932f
000d0000-55f0-41c5-f3de-18308f0a69aa	000e0000-55f0-41c5-8863-a95e33a7f1da	000c0000-55f0-41c6-3fb6-5521c453bf29	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f0-41c4-a69c-babb3559932f
000d0000-55f0-41c5-c40a-6b81ca294d8d	000e0000-55f0-41c5-8863-a95e33a7f1da	000c0000-55f0-41c6-e424-0a6f398b98f7	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f0-41c4-a6a4-ed891e11ba8c
000d0000-55f0-41c5-2e1b-6b4d6472996a	000e0000-55f0-41c5-8863-a95e33a7f1da	000c0000-55f0-41c6-1aba-ac896070ab9e	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f0-41c4-bb7c-b5c34a3aa615
\.


--
-- TOC entry 2954 (class 0 OID 18236524)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 18236505)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f0-41c5-6f31-091bd25fe287	00080000-55f0-41c5-b1a8-57cf2c88925a	00090000-55f0-41c5-41a5-efe44f64a856	AK		igralka
\.


--
-- TOC entry 2963 (class 0 OID 18236623)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 18237105)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 18237117)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 18237139)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 18236648)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 18236462)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f0-41c4-a006-7db6fd07d87c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f0-41c4-7411-6c39068b1924	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f0-41c4-3aee-4c03c3d2ec78	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f0-41c4-f59f-09f6a63bcd1c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f0-41c4-d255-c25fcf95eaa0	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f0-41c4-1e2b-dc8779cbb0c5	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f0-41c4-43aa-cbce8fabdd6d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f0-41c4-7aee-f7052a79bb23	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f0-41c4-3383-2f91044bdf6e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f0-41c4-1337-e3191d8176dc	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f0-41c4-6e2f-3e5bebe85e43	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f0-41c4-b73a-b0b6a4353848	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f0-41c4-6e37-01d7ddf4bf11	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f0-41c4-7e78-612f5ba04c7a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f0-41c5-ff19-2288e216d696	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f0-41c5-2aba-c89e1c2b283f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f0-41c5-8f8b-3fb9b1fdda74	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f0-41c5-9d55-10324429e80f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f0-41c5-76d6-e2200a56f733	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f0-41c6-66ea-95211c69a37b	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2943 (class 0 OID 18236376)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f0-41c5-83ed-1a3c6968ad6d	00000000-55f0-41c5-ff19-2288e216d696	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f0-41c5-8fb5-7e3f448f7229	00000000-55f0-41c5-ff19-2288e216d696	00010000-55f0-41c4-c8c5-b8325ee663e3	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f0-41c5-e5be-31caa76b5636	00000000-55f0-41c5-2aba-c89e1c2b283f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2944 (class 0 OID 18236387)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f0-41c5-c4f8-f8c41aa4151d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f0-41c5-a189-3a3c9d06537e	00010000-55f0-41c5-7f4d-65887def7d00	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f0-41c5-220b-86aa3d10ee7f	00010000-55f0-41c5-28e5-3c8971a0ed97	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f0-41c5-c77c-0a6023451a58	00010000-55f0-41c5-dc1a-4775f43772d2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f0-41c5-e6d1-2b7190e43048	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f0-41c5-6600-b919e24b455b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f0-41c5-284e-7f24da7b8958	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f0-41c5-7d8d-da83e9a8c042	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f0-41c5-41a5-efe44f64a856	00010000-55f0-41c5-3047-2844deae15dc	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f0-41c5-5efc-fb55360857cf	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f0-41c5-f4a1-4a4d56b02297	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f0-41c5-cfab-3b5fa181b699	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f0-41c5-df0f-a3e0179eb597	00010000-55f0-41c5-f296-7dc61d8a0668	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 18236341)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f0-41c4-5043-3cdc9c5dda35	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f0-41c4-8d96-eb9acc58fb0b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f0-41c4-3f2c-0b7cf18f124a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f0-41c4-6937-d545adbe3da1	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f0-41c4-cb7f-21e0241dc077	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f0-41c4-5120-b4d9ead6f5ed	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f0-41c4-a3f6-6568d34c707d	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f0-41c4-c713-6b73948c0cfc	Abonma-read	Abonma - branje	f
00030000-55f0-41c4-ac4e-18749189c643	Abonma-write	Abonma - spreminjanje	f
00030000-55f0-41c4-3b43-46440cc38357	Alternacija-read	Alternacija - branje	f
00030000-55f0-41c4-4145-3dea120bf3d9	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f0-41c4-8f0f-f005137bc637	Arhivalija-read	Arhivalija - branje	f
00030000-55f0-41c4-9bbd-e7930bcdb413	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f0-41c4-8c46-d7f9853852ca	Besedilo-read	Besedilo - branje	f
00030000-55f0-41c4-bfe4-96c9572d3c55	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f0-41c4-7462-f53bb737873a	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f0-41c4-10f6-c2acb3affa06	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f0-41c4-6343-f94036b81274	Dogodek-read	Dogodek - branje	f
00030000-55f0-41c4-94c4-fd8a513d7ef2	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f0-41c4-58c8-b440ce752376	DrugiVir-read	DrugiVir - branje	f
00030000-55f0-41c4-f9ce-b2fb19f48d64	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f0-41c4-a9b8-979ae8cf6959	Drzava-read	Drzava - branje	f
00030000-55f0-41c4-538f-abef4043182e	Drzava-write	Drzava - spreminjanje	f
00030000-55f0-41c4-94b1-e8e918269d83	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f0-41c4-0ff7-04774cd05ed2	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f0-41c4-79e1-48571c8a8e8d	Funkcija-read	Funkcija - branje	f
00030000-55f0-41c4-c59e-d8600de9150d	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f0-41c4-3c6a-5d9a2a90e44b	Gostovanje-read	Gostovanje - branje	f
00030000-55f0-41c4-1357-069f8ca36fd4	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f0-41c4-c851-e8985381878d	Gostujoca-read	Gostujoca - branje	f
00030000-55f0-41c4-771b-eb3d11d1e1cc	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f0-41c4-e8c9-37042f903198	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f0-41c4-24de-c0cdc20dcaed	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f0-41c4-2e4c-54c252d4ef0d	Kupec-read	Kupec - branje	f
00030000-55f0-41c4-8434-360f2108c219	Kupec-write	Kupec - spreminjanje	f
00030000-55f0-41c4-e7ab-ccd8339d0b7c	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f0-41c4-745e-77da6aef74bc	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f0-41c4-2dc9-cf4a8def936a	Option-read	Option - branje	f
00030000-55f0-41c4-f872-fe717c33a8de	Option-write	Option - spreminjanje	f
00030000-55f0-41c4-43f5-2a035a9d9aef	OptionValue-read	OptionValue - branje	f
00030000-55f0-41c4-b631-e8ef72976a53	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f0-41c4-469b-273f38a7ec9c	Oseba-read	Oseba - branje	f
00030000-55f0-41c4-910a-a33b10985d03	Oseba-write	Oseba - spreminjanje	f
00030000-55f0-41c4-dabc-d5458df367b1	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f0-41c4-6168-c7cc1fadfc31	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f0-41c4-7505-ac35ba1636b5	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f0-41c4-654d-8145f6452a33	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f0-41c4-54f1-5c0c39003790	Pogodba-read	Pogodba - branje	f
00030000-55f0-41c4-66de-a1fe69402caf	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f0-41c4-1b71-65a9ddafe3c8	Popa-read	Popa - branje	f
00030000-55f0-41c4-f9ee-804c4edd8a8f	Popa-write	Popa - spreminjanje	f
00030000-55f0-41c4-0ec3-9c624e85bd32	Posta-read	Posta - branje	f
00030000-55f0-41c4-d273-291152be7e87	Posta-write	Posta - spreminjanje	f
00030000-55f0-41c4-16cc-7e07905aee25	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f0-41c4-fe14-ef1d2b900520	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f0-41c4-5e35-f41a12b74aa7	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f0-41c4-e7e3-ebf1ca1b8446	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f0-41c4-c8ab-2929cbec0f99	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f0-41c4-d1fa-bea50dfbe1a5	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f0-41c4-67cf-c133d0d1fe93	Predstava-read	Predstava - branje	f
00030000-55f0-41c4-5d2c-cef9d601dcc2	Predstava-write	Predstava - spreminjanje	f
00030000-55f0-41c4-becf-a8a3156ec490	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f0-41c4-3d6b-b97117958945	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f0-41c4-d6ce-4270414c5cfa	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f0-41c4-d946-8f2548f0a706	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f0-41c4-f408-6a719297a556	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f0-41c4-c4d5-98e8f44f4054	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f0-41c4-5d7f-0302823f5e62	ProgramDela-read	ProgramDela - branje	f
00030000-55f0-41c4-be68-80f23e9459fc	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f0-41c4-e518-01acae855035	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f0-41c4-8a24-153517a99483	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f0-41c4-03b8-6c45734bdd3f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f0-41c4-ff45-b54f474c0ab6	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f0-41c4-0ee7-64fa8c48a4f2	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f0-41c4-616e-ee6d55e3902c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f0-41c4-5e68-673227938d36	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f0-41c4-9bca-ddfc654953ee	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f0-41c4-77cf-016f8edb4064	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f0-41c4-1db4-17ffc4c5a902	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f0-41c4-2dab-c531b0de3fba	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f0-41c4-aff2-c68b71c50e4b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f0-41c4-9bc4-8ad98c7ed1e7	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f0-41c4-da33-3a2789806743	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f0-41c4-bfdd-0ddf5682adce	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f0-41c4-9ea7-1c4b836aa733	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f0-41c4-e7af-c815838637dc	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f0-41c4-8782-ca62ba2f6dfb	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f0-41c4-9b83-5812d1a22930	Prostor-read	Prostor - branje	f
00030000-55f0-41c4-cee0-895abe23953b	Prostor-write	Prostor - spreminjanje	f
00030000-55f0-41c4-fed4-d8393e553b7b	Racun-read	Racun - branje	f
00030000-55f0-41c4-bc83-bcbf06f147b3	Racun-write	Racun - spreminjanje	f
00030000-55f0-41c4-068c-c996af8d70c0	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f0-41c4-6766-ad5fb9167153	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f0-41c4-4f91-698aaa4d8bb2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f0-41c4-12c0-2123cdf54922	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f0-41c4-836d-910c6cbfb2a3	Rekvizit-read	Rekvizit - branje	f
00030000-55f0-41c4-fe6d-5c5747e8efde	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f0-41c4-54d5-449dd8c3f681	Revizija-read	Revizija - branje	f
00030000-55f0-41c4-2314-ef210281c14d	Revizija-write	Revizija - spreminjanje	f
00030000-55f0-41c4-aa25-4985c6611f5b	Rezervacija-read	Rezervacija - branje	f
00030000-55f0-41c4-172b-65358fb6ffc6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f0-41c4-bb49-0a64fb75da06	SedezniRed-read	SedezniRed - branje	f
00030000-55f0-41c4-b1d6-c5071ecc9d94	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f0-41c4-84c5-5ea5b91b61e9	Sedez-read	Sedez - branje	f
00030000-55f0-41c4-db20-b082891701be	Sedez-write	Sedez - spreminjanje	f
00030000-55f0-41c4-dbed-57bb6a9f8c18	Sezona-read	Sezona - branje	f
00030000-55f0-41c4-39fb-765cd1a0d78c	Sezona-write	Sezona - spreminjanje	f
00030000-55f0-41c4-fb76-c6b9a569cbb4	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f0-41c4-f2e7-a66042e5d54a	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f0-41c4-c51d-acbc0cb2b55c	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f0-41c4-fdc9-04a441952183	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f0-41c4-256b-88938e9a0040	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f0-41c4-e8a7-11ed4562b968	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f0-41c4-e0f7-816ab556f86c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f0-41c4-945d-cd48c4f4dcef	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f0-41c4-ae2e-1786a3e23fb7	Telefonska-read	Telefonska - branje	f
00030000-55f0-41c4-7bc4-312649b74bac	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f0-41c4-63e5-fffce9c7adae	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f0-41c4-8c3a-ce4d244eae08	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f0-41c4-59c3-e5ca3f501f57	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f0-41c4-5a3b-8109b522fcaf	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f0-41c4-3525-7b9b20b75896	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f0-41c4-88ee-2c1e52b502d9	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f0-41c4-b6c6-9a7866402654	Trr-read	Trr - branje	f
00030000-55f0-41c4-7bd4-ee7f2363e987	Trr-write	Trr - spreminjanje	f
00030000-55f0-41c4-f1c2-11665c1cc864	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f0-41c4-5fae-a47a0fa67211	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f0-41c4-cfc1-a571ee6ebc8c	Vaja-read	Vaja - branje	f
00030000-55f0-41c4-ec64-65874f9ecb40	Vaja-write	Vaja - spreminjanje	f
00030000-55f0-41c4-2e6a-5ded8d50f099	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f0-41c4-b3ac-7d3dee7f6e0a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f0-41c4-432b-183de3c5c318	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f0-41c4-ca81-4b8c4cf18d6e	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f0-41c4-34f7-db87af646789	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f0-41c4-d0d4-979e7fe9fff8	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f0-41c4-f6bf-0fc2366397d5	Zasedenost-read	Zasedenost - branje	f
00030000-55f0-41c4-9e1a-289893b8791f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f0-41c4-ab6a-8c6c0fe4ad2e	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f0-41c4-3456-b8845b2876f7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f0-41c4-1146-b41cdc92c8d6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f0-41c4-7981-1a744a6adbc9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f0-41c4-8246-ef1f5f1201e1	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f0-41c4-1070-b0c436b468cf	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f0-41c4-ac84-777a6ace20c8	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f0-41c4-5c0f-b64b466fcdbe	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f0-41c4-a2d1-4ce75303f13d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f0-41c4-8ccf-5bfc7da9d824	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f0-41c4-09de-69d02280aac9	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f0-41c4-b50f-0ac7c2fabf8c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f0-41c4-86e5-d919b63f745c	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f0-41c4-4fc6-1f6a8a56f392	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f0-41c4-3280-95f0dc93b006	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f0-41c4-38dd-35218822981b	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2941 (class 0 OID 18236360)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f0-41c4-e13f-860719f7eca0	00030000-55f0-41c4-8d96-eb9acc58fb0b
00020000-55f0-41c4-ce16-fc443518a3ae	00030000-55f0-41c4-a9b8-979ae8cf6959
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-c713-6b73948c0cfc
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-ac4e-18749189c643
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-3b43-46440cc38357
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-4145-3dea120bf3d9
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-8f0f-f005137bc637
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-6343-f94036b81274
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-6937-d545adbe3da1
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-94c4-fd8a513d7ef2
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-a9b8-979ae8cf6959
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-538f-abef4043182e
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-79e1-48571c8a8e8d
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-c59e-d8600de9150d
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-3c6a-5d9a2a90e44b
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-1357-069f8ca36fd4
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-c851-e8985381878d
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-771b-eb3d11d1e1cc
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-e8c9-37042f903198
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-24de-c0cdc20dcaed
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-2dc9-cf4a8def936a
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-43f5-2a035a9d9aef
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-469b-273f38a7ec9c
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-910a-a33b10985d03
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-1b71-65a9ddafe3c8
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-f9ee-804c4edd8a8f
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-0ec3-9c624e85bd32
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-d273-291152be7e87
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-c8ab-2929cbec0f99
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-d1fa-bea50dfbe1a5
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-67cf-c133d0d1fe93
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-5d2c-cef9d601dcc2
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-f408-6a719297a556
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-c4d5-98e8f44f4054
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-9b83-5812d1a22930
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-cee0-895abe23953b
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-4f91-698aaa4d8bb2
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-12c0-2123cdf54922
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-836d-910c6cbfb2a3
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-fe6d-5c5747e8efde
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-dbed-57bb6a9f8c18
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-39fb-765cd1a0d78c
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-59c3-e5ca3f501f57
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-f1c2-11665c1cc864
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-5fae-a47a0fa67211
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-cfc1-a571ee6ebc8c
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-ec64-65874f9ecb40
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-f6bf-0fc2366397d5
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-9e1a-289893b8791f
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-ab6a-8c6c0fe4ad2e
00020000-55f0-41c4-88f6-87f82bb29583	00030000-55f0-41c4-1146-b41cdc92c8d6
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-c713-6b73948c0cfc
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-8f0f-f005137bc637
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-6343-f94036b81274
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-a9b8-979ae8cf6959
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-3c6a-5d9a2a90e44b
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-c851-e8985381878d
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-e8c9-37042f903198
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-24de-c0cdc20dcaed
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-2dc9-cf4a8def936a
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-43f5-2a035a9d9aef
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-469b-273f38a7ec9c
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-910a-a33b10985d03
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-1b71-65a9ddafe3c8
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-0ec3-9c624e85bd32
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-c8ab-2929cbec0f99
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-d1fa-bea50dfbe1a5
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-67cf-c133d0d1fe93
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-9b83-5812d1a22930
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-4f91-698aaa4d8bb2
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-836d-910c6cbfb2a3
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-dbed-57bb6a9f8c18
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-ae2e-1786a3e23fb7
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-7bc4-312649b74bac
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-b6c6-9a7866402654
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-7bd4-ee7f2363e987
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-34f7-db87af646789
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-d0d4-979e7fe9fff8
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-ab6a-8c6c0fe4ad2e
00020000-55f0-41c4-0bef-1731d647ca93	00030000-55f0-41c4-1146-b41cdc92c8d6
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-c713-6b73948c0cfc
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-3b43-46440cc38357
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-8f0f-f005137bc637
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-9bbd-e7930bcdb413
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-8c46-d7f9853852ca
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-7462-f53bb737873a
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-6343-f94036b81274
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-a9b8-979ae8cf6959
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-79e1-48571c8a8e8d
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-3c6a-5d9a2a90e44b
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-c851-e8985381878d
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-e8c9-37042f903198
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-2dc9-cf4a8def936a
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-43f5-2a035a9d9aef
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-469b-273f38a7ec9c
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-1b71-65a9ddafe3c8
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-0ec3-9c624e85bd32
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-67cf-c133d0d1fe93
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-f408-6a719297a556
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-9b83-5812d1a22930
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-4f91-698aaa4d8bb2
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-836d-910c6cbfb2a3
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-dbed-57bb6a9f8c18
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-59c3-e5ca3f501f57
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-cfc1-a571ee6ebc8c
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-f6bf-0fc2366397d5
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-ab6a-8c6c0fe4ad2e
00020000-55f0-41c4-eff0-7982cac8887e	00030000-55f0-41c4-1146-b41cdc92c8d6
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-c713-6b73948c0cfc
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-ac4e-18749189c643
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-4145-3dea120bf3d9
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-8f0f-f005137bc637
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-6343-f94036b81274
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-a9b8-979ae8cf6959
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-3c6a-5d9a2a90e44b
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-c851-e8985381878d
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-2dc9-cf4a8def936a
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-43f5-2a035a9d9aef
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-1b71-65a9ddafe3c8
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-0ec3-9c624e85bd32
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-67cf-c133d0d1fe93
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-9b83-5812d1a22930
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-4f91-698aaa4d8bb2
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-836d-910c6cbfb2a3
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-dbed-57bb6a9f8c18
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-59c3-e5ca3f501f57
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-ab6a-8c6c0fe4ad2e
00020000-55f0-41c4-7b8b-5271bde7f7e2	00030000-55f0-41c4-1146-b41cdc92c8d6
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-c713-6b73948c0cfc
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-8f0f-f005137bc637
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-6343-f94036b81274
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-a9b8-979ae8cf6959
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-3c6a-5d9a2a90e44b
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-c851-e8985381878d
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-2dc9-cf4a8def936a
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-43f5-2a035a9d9aef
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-1b71-65a9ddafe3c8
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-0ec3-9c624e85bd32
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-67cf-c133d0d1fe93
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-9b83-5812d1a22930
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-4f91-698aaa4d8bb2
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-836d-910c6cbfb2a3
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-dbed-57bb6a9f8c18
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-63e5-fffce9c7adae
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-3f2c-0b7cf18f124a
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-59c3-e5ca3f501f57
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-ab6a-8c6c0fe4ad2e
00020000-55f0-41c4-1d34-4d1b3c8fbc22	00030000-55f0-41c4-1146-b41cdc92c8d6
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-5043-3cdc9c5dda35
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-8d96-eb9acc58fb0b
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-3f2c-0b7cf18f124a
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-6937-d545adbe3da1
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-cb7f-21e0241dc077
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-5120-b4d9ead6f5ed
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-a3f6-6568d34c707d
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-c713-6b73948c0cfc
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-ac4e-18749189c643
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-3b43-46440cc38357
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-4145-3dea120bf3d9
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-8f0f-f005137bc637
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-9bbd-e7930bcdb413
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-8c46-d7f9853852ca
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-bfe4-96c9572d3c55
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-7462-f53bb737873a
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-10f6-c2acb3affa06
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-6343-f94036b81274
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-94c4-fd8a513d7ef2
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-a9b8-979ae8cf6959
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-538f-abef4043182e
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-58c8-b440ce752376
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-f9ce-b2fb19f48d64
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-94b1-e8e918269d83
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-0ff7-04774cd05ed2
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-79e1-48571c8a8e8d
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-c59e-d8600de9150d
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-3c6a-5d9a2a90e44b
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-1357-069f8ca36fd4
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-c851-e8985381878d
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-771b-eb3d11d1e1cc
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-e8c9-37042f903198
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-24de-c0cdc20dcaed
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-2e4c-54c252d4ef0d
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-8434-360f2108c219
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-e7ab-ccd8339d0b7c
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-745e-77da6aef74bc
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-2dc9-cf4a8def936a
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-f872-fe717c33a8de
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-43f5-2a035a9d9aef
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-b631-e8ef72976a53
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-469b-273f38a7ec9c
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-910a-a33b10985d03
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-dabc-d5458df367b1
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-6168-c7cc1fadfc31
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-7505-ac35ba1636b5
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-654d-8145f6452a33
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-54f1-5c0c39003790
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-66de-a1fe69402caf
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-1b71-65a9ddafe3c8
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-f9ee-804c4edd8a8f
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-0ec3-9c624e85bd32
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-d273-291152be7e87
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-5e35-f41a12b74aa7
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-e7e3-ebf1ca1b8446
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-c8ab-2929cbec0f99
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-d1fa-bea50dfbe1a5
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-67cf-c133d0d1fe93
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-5d2c-cef9d601dcc2
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-becf-a8a3156ec490
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-3d6b-b97117958945
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-d6ce-4270414c5cfa
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-d946-8f2548f0a706
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-f408-6a719297a556
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-c4d5-98e8f44f4054
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-5d7f-0302823f5e62
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-be68-80f23e9459fc
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-e518-01acae855035
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-8a24-153517a99483
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-03b8-6c45734bdd3f
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-ff45-b54f474c0ab6
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-0ee7-64fa8c48a4f2
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-616e-ee6d55e3902c
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-5e68-673227938d36
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-9bca-ddfc654953ee
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-77cf-016f8edb4064
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-1db4-17ffc4c5a902
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-2dab-c531b0de3fba
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-aff2-c68b71c50e4b
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-9bc4-8ad98c7ed1e7
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-da33-3a2789806743
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-bfdd-0ddf5682adce
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-9ea7-1c4b836aa733
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-e7af-c815838637dc
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-8782-ca62ba2f6dfb
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-9b83-5812d1a22930
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-cee0-895abe23953b
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-fed4-d8393e553b7b
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-bc83-bcbf06f147b3
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-068c-c996af8d70c0
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-6766-ad5fb9167153
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-4f91-698aaa4d8bb2
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-12c0-2123cdf54922
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-836d-910c6cbfb2a3
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-fe6d-5c5747e8efde
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-54d5-449dd8c3f681
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-2314-ef210281c14d
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-aa25-4985c6611f5b
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-172b-65358fb6ffc6
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-bb49-0a64fb75da06
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-b1d6-c5071ecc9d94
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-84c5-5ea5b91b61e9
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-db20-b082891701be
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-dbed-57bb6a9f8c18
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-39fb-765cd1a0d78c
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-fb76-c6b9a569cbb4
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-f2e7-a66042e5d54a
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-c51d-acbc0cb2b55c
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-fdc9-04a441952183
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-256b-88938e9a0040
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-e8a7-11ed4562b968
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-e0f7-816ab556f86c
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-945d-cd48c4f4dcef
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-ae2e-1786a3e23fb7
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-7bc4-312649b74bac
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-63e5-fffce9c7adae
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-8c3a-ce4d244eae08
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-59c3-e5ca3f501f57
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-5a3b-8109b522fcaf
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-3525-7b9b20b75896
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-88ee-2c1e52b502d9
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-b6c6-9a7866402654
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-7bd4-ee7f2363e987
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-f1c2-11665c1cc864
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-5fae-a47a0fa67211
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-cfc1-a571ee6ebc8c
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-ec64-65874f9ecb40
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-2e6a-5ded8d50f099
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-b3ac-7d3dee7f6e0a
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-432b-183de3c5c318
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-ca81-4b8c4cf18d6e
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-34f7-db87af646789
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-d0d4-979e7fe9fff8
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-f6bf-0fc2366397d5
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-9e1a-289893b8791f
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-ab6a-8c6c0fe4ad2e
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-3456-b8845b2876f7
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-1146-b41cdc92c8d6
00020000-55f0-41c5-8d64-25dfcdcf45ae	00030000-55f0-41c4-7981-1a744a6adbc9
\.


--
-- TOC entry 2968 (class 0 OID 18236655)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 18236689)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 18236818)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f0-41c5-e1a5-adb2051d7dea	00090000-55f0-41c5-c4f8-f8c41aa4151d	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f0-41c5-0b6d-fd812adbf225	00090000-55f0-41c5-6600-b919e24b455b	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f0-41c5-adab-5a94f3047928	00090000-55f0-41c5-df0f-a3e0179eb597	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f0-41c5-0b05-7edf4cd435b3	00090000-55f0-41c5-5efc-fb55360857cf	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2946 (class 0 OID 18236420)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f0-41c5-b1a8-57cf2c88925a	00040000-55f0-41c4-9b23-82f696bac755	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f0-41c5-1852-ad2759b6165d	00040000-55f0-41c4-9b23-82f696bac755	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f0-41c5-42c9-866388dd7ede	00040000-55f0-41c4-9b23-82f696bac755	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f0-41c5-5f58-9945124e61fc	00040000-55f0-41c4-9b23-82f696bac755	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f0-41c5-49f6-dca763992128	00040000-55f0-41c4-9b23-82f696bac755	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f0-41c5-61d2-e0dbbe0aa056	00040000-55f0-41c4-5524-fbe77cdc4a4b	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f0-41c5-3b0a-8cd90e81c4d8	00040000-55f0-41c4-c373-a4b67e005016	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f0-41c5-fb0c-32d69c2c8d02	00040000-55f0-41c4-cb2f-95f409313440	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f0-41c5-c59f-6633baf9f724	00040000-55f0-41c4-9fcf-3179d2482645	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f0-41c6-2e04-42c7443563d0	00040000-55f0-41c4-9b23-82f696bac755	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2948 (class 0 OID 18236454)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f0-41c3-9b9a-484cfa4203e4	8341	Adlešiči
00050000-55f0-41c3-d1c9-6b8a281ec101	5270	Ajdovščina
00050000-55f0-41c3-1615-804250062afd	6280	Ankaran/Ancarano
00050000-55f0-41c3-6bd4-23b2e14123b5	9253	Apače
00050000-55f0-41c3-3f11-f2921896a59a	8253	Artiče
00050000-55f0-41c3-34fc-56840f275cb2	4275	Begunje na Gorenjskem
00050000-55f0-41c3-4c6b-0c1722a4dfe4	1382	Begunje pri Cerknici
00050000-55f0-41c3-a1e0-b2898823cb93	9231	Beltinci
00050000-55f0-41c3-40e7-48b177311554	2234	Benedikt
00050000-55f0-41c3-f4f7-272830eec539	2345	Bistrica ob Dravi
00050000-55f0-41c3-3036-dfe313f3d74d	3256	Bistrica ob Sotli
00050000-55f0-41c3-67a0-68a56341fee8	8259	Bizeljsko
00050000-55f0-41c3-def4-f2b08bc546e1	1223	Blagovica
00050000-55f0-41c3-eae4-59865ffa650a	8283	Blanca
00050000-55f0-41c3-e8fd-3f5d322a29ff	4260	Bled
00050000-55f0-41c3-bcc3-15b9fa8d3615	4273	Blejska Dobrava
00050000-55f0-41c3-30d3-79120f88300c	9265	Bodonci
00050000-55f0-41c3-e094-9bf625e09438	9222	Bogojina
00050000-55f0-41c3-a506-f9d312c06426	4263	Bohinjska Bela
00050000-55f0-41c3-6ea1-017b2db5edc4	4264	Bohinjska Bistrica
00050000-55f0-41c3-2f06-899650d7d26e	4265	Bohinjsko jezero
00050000-55f0-41c3-cc2b-75106b19d646	1353	Borovnica
00050000-55f0-41c3-e586-3df41bd1f5dd	8294	Boštanj
00050000-55f0-41c3-a446-e4fe29707baa	5230	Bovec
00050000-55f0-41c3-7d63-b33ebfe39638	5295	Branik
00050000-55f0-41c3-7903-c2399a8bedd3	3314	Braslovče
00050000-55f0-41c3-887e-c48923e1e275	5223	Breginj
00050000-55f0-41c3-0d26-bc83bec55a94	8280	Brestanica
00050000-55f0-41c3-a70c-2333a683a5a6	2354	Bresternica
00050000-55f0-41c3-ec05-012035271f58	4243	Brezje
00050000-55f0-41c3-9564-cdb6c28eb293	1351	Brezovica pri Ljubljani
00050000-55f0-41c3-6686-2869fed60e0e	8250	Brežice
00050000-55f0-41c3-e5a3-d8b072bf1e1c	4210	Brnik - Aerodrom
00050000-55f0-41c3-8507-400b6f181b2b	8321	Brusnice
00050000-55f0-41c3-ee32-8c404163fd4b	3255	Buče
00050000-55f0-41c3-1d34-2b12e84a0626	8276	Bučka 
00050000-55f0-41c3-3469-1636a7a0286f	9261	Cankova
00050000-55f0-41c3-ef4f-17354a08802b	3000	Celje 
00050000-55f0-41c3-2054-2b6a26b23e11	3001	Celje - poštni predali
00050000-55f0-41c3-50c1-ce670d301a33	4207	Cerklje na Gorenjskem
00050000-55f0-41c3-9c18-dda4a6aa9cd9	8263	Cerklje ob Krki
00050000-55f0-41c3-cc35-568b9c1d443f	1380	Cerknica
00050000-55f0-41c3-90de-673ebd58124d	5282	Cerkno
00050000-55f0-41c3-1700-e19ee734f252	2236	Cerkvenjak
00050000-55f0-41c3-9dfa-76da117f54fa	2215	Ceršak
00050000-55f0-41c3-09ba-9e94dd4752d9	2326	Cirkovce
00050000-55f0-41c3-9a39-b9f533a9dff3	2282	Cirkulane
00050000-55f0-41c3-ba9b-e0492f9f21d3	5273	Col
00050000-55f0-41c3-11e3-77a7fdf0ba1d	8251	Čatež ob Savi
00050000-55f0-41c3-d601-4bbe48b59275	1413	Čemšenik
00050000-55f0-41c3-22b0-8bb6e9da8a4f	5253	Čepovan
00050000-55f0-41c3-6fe5-2d22baf30b8d	9232	Črenšovci
00050000-55f0-41c3-027c-c20933aaa3b8	2393	Črna na Koroškem
00050000-55f0-41c3-fc2e-b1ab80e8b016	6275	Črni Kal
00050000-55f0-41c3-e844-ad678d9e4081	5274	Črni Vrh nad Idrijo
00050000-55f0-41c3-0321-c6fcc6231dfb	5262	Črniče
00050000-55f0-41c3-42bd-6ca836abac4d	8340	Črnomelj
00050000-55f0-41c3-178a-cbda901cad8e	6271	Dekani
00050000-55f0-41c3-9782-5de572fa79f6	5210	Deskle
00050000-55f0-41c3-f500-57c861b29fe8	2253	Destrnik
00050000-55f0-41c3-9dbf-6658727feacd	6215	Divača
00050000-55f0-41c3-edc5-a9bd5ade740a	1233	Dob
00050000-55f0-41c3-da5e-bc33b052c8ae	3224	Dobje pri Planini
00050000-55f0-41c3-38d9-2a649b0706ad	8257	Dobova
00050000-55f0-41c3-338e-71c8b7381dda	1423	Dobovec
00050000-55f0-41c3-2782-8ca6469adfca	5263	Dobravlje
00050000-55f0-41c3-257e-9b2717b0f2df	3204	Dobrna
00050000-55f0-41c3-0717-bc7d348f9f0c	8211	Dobrnič
00050000-55f0-41c3-1198-28c32a2b4550	1356	Dobrova
00050000-55f0-41c3-921b-a495f5a36ac5	9223	Dobrovnik/Dobronak 
00050000-55f0-41c3-a402-aebc0929bb4c	5212	Dobrovo v Brdih
00050000-55f0-41c3-f606-6ea95e15ee9d	1431	Dol pri Hrastniku
00050000-55f0-41c3-14e5-71a2cc406d76	1262	Dol pri Ljubljani
00050000-55f0-41c3-c721-7c6df292f023	1273	Dole pri Litiji
00050000-55f0-41c3-a849-c96c93f2df49	1331	Dolenja vas
00050000-55f0-41c3-7302-984a282b14fd	8350	Dolenjske Toplice
00050000-55f0-41c3-3b98-2fc4f12f5e87	1230	Domžale
00050000-55f0-41c3-a3b3-998261b32951	2252	Dornava
00050000-55f0-41c3-482f-fa721dd1c298	5294	Dornberk
00050000-55f0-41c3-1d2e-c0b59462a50b	1319	Draga
00050000-55f0-41c3-7ed9-2f390e4d0ed4	8343	Dragatuš
00050000-55f0-41c3-98ac-1c8c1c86a47f	3222	Dramlje
00050000-55f0-41c3-bfe0-f7926c0c5306	2370	Dravograd
00050000-55f0-41c3-54bd-8625fa9c5884	4203	Duplje
00050000-55f0-41c3-48c3-fd2793852902	6221	Dutovlje
00050000-55f0-41c3-a2a8-28d08c64041b	8361	Dvor
00050000-55f0-41c3-3e4c-fc9175ff35d3	2343	Fala
00050000-55f0-41c3-911a-3cb7da827970	9208	Fokovci
00050000-55f0-41c3-8dfd-500a85203d48	2313	Fram
00050000-55f0-41c3-b1f0-c2834ff5be0a	3213	Frankolovo
00050000-55f0-41c3-a966-01cbded91aef	1274	Gabrovka
00050000-55f0-41c3-09e8-8dbbc71f831d	8254	Globoko
00050000-55f0-41c3-e560-e542774b01b6	5275	Godovič
00050000-55f0-41c3-f44d-6809aef1d02e	4204	Golnik
00050000-55f0-41c3-b0f8-515328a2e843	3303	Gomilsko
00050000-55f0-41c3-5214-76e0945461f4	4224	Gorenja vas
00050000-55f0-41c3-4e19-079d0c11a383	3263	Gorica pri Slivnici
00050000-55f0-41c3-4186-51886dc84bd3	2272	Gorišnica
00050000-55f0-41c3-ac5a-163a339c98b7	9250	Gornja Radgona
00050000-55f0-41c3-1241-a1d5ddb5ddca	3342	Gornji Grad
00050000-55f0-41c3-3bbf-18ad56de118d	4282	Gozd Martuljek
00050000-55f0-41c3-2515-6b4fc4276a78	6272	Gračišče
00050000-55f0-41c3-0608-574b467f18b4	9264	Grad
00050000-55f0-41c3-fb51-d633722f22ef	8332	Gradac
00050000-55f0-41c3-5917-52de7ba0f31d	1384	Grahovo
00050000-55f0-41c3-9752-f7d3f44ae120	5242	Grahovo ob Bači
00050000-55f0-41c3-2e68-c7d77b060b62	5251	Grgar
00050000-55f0-41c3-a63f-fae64c941ceb	3302	Griže
00050000-55f0-41c3-5960-b972329948f3	3231	Grobelno
00050000-55f0-41c3-4b50-0da7e0657813	1290	Grosuplje
00050000-55f0-41c3-8d5a-575021cb2cd3	2288	Hajdina
00050000-55f0-41c3-cafc-43b6d54aecdc	8362	Hinje
00050000-55f0-41c3-fc17-a7aea9606b45	2311	Hoče
00050000-55f0-41c3-613f-f0d534f425e8	9205	Hodoš/Hodos
00050000-55f0-41c3-eba8-cf41512551d0	1354	Horjul
00050000-55f0-41c3-3303-6c9761292843	1372	Hotedršica
00050000-55f0-41c3-7d0e-05913f770ac0	1430	Hrastnik
00050000-55f0-41c3-de18-7c576bb68b5a	6225	Hruševje
00050000-55f0-41c3-457a-445141cbd7d0	4276	Hrušica
00050000-55f0-41c3-4d2b-45be860011ec	5280	Idrija
00050000-55f0-41c3-6ea5-d01bdd37de2c	1292	Ig
00050000-55f0-41c3-3579-9bf2ddffc732	6250	Ilirska Bistrica
00050000-55f0-41c3-5238-b4422538195c	6251	Ilirska Bistrica-Trnovo
00050000-55f0-41c3-411e-c7ab20982d6c	1295	Ivančna Gorica
00050000-55f0-41c3-6976-2b6569c76ea5	2259	Ivanjkovci
00050000-55f0-41c3-4d01-b5044d50db43	1411	Izlake
00050000-55f0-41c3-c63f-02cc3383effe	6310	Izola/Isola
00050000-55f0-41c3-822a-7a0e3bd70ca6	2222	Jakobski Dol
00050000-55f0-41c3-7b7e-d725131d2236	2221	Jarenina
00050000-55f0-41c3-1935-0e47bddb379d	6254	Jelšane
00050000-55f0-41c3-050a-7b0919f75e69	4270	Jesenice
00050000-55f0-41c3-d365-11a9a1a60874	8261	Jesenice na Dolenjskem
00050000-55f0-41c3-6434-8f872ca3aa26	3273	Jurklošter
00050000-55f0-41c3-5f6d-66d9e230217e	2223	Jurovski Dol
00050000-55f0-41c3-e3f7-e7efd372ce8d	2256	Juršinci
00050000-55f0-41c3-e783-7239ed4b5c10	5214	Kal nad Kanalom
00050000-55f0-41c3-9412-f0d615d1f703	3233	Kalobje
00050000-55f0-41c3-f34c-0fec29dbfdb9	4246	Kamna Gorica
00050000-55f0-41c3-629a-f5083616a3fa	2351	Kamnica
00050000-55f0-41c3-39f9-cccd0172c30a	1241	Kamnik
00050000-55f0-41c3-d0c3-4f5e12f69672	5213	Kanal
00050000-55f0-41c3-c18b-7d95b8c0bdf2	8258	Kapele
00050000-55f0-41c3-97a8-148a24711729	2362	Kapla
00050000-55f0-41c3-a24e-ad813f32550d	2325	Kidričevo
00050000-55f0-41c3-98af-92bed780e410	1412	Kisovec
00050000-55f0-41c3-93aa-45c087d8ed83	6253	Knežak
00050000-55f0-41c3-7fd7-e3375127e77a	5222	Kobarid
00050000-55f0-41c3-bb5c-bf27fce7c35d	9227	Kobilje
00050000-55f0-41c3-9a89-1461e5b7d2e0	1330	Kočevje
00050000-55f0-41c3-19b7-dbdc332ca5d0	1338	Kočevska Reka
00050000-55f0-41c3-644d-f2e6fe2f9f21	2276	Kog
00050000-55f0-41c3-f522-e7bb192c104c	5211	Kojsko
00050000-55f0-41c3-0b9a-1c8c778937a2	6223	Komen
00050000-55f0-41c3-9733-4d03f3a41372	1218	Komenda
00050000-55f0-41c3-844e-d93cbe815987	6000	Koper/Capodistria 
00050000-55f0-41c3-6e46-42242c72dd5b	6001	Koper/Capodistria - poštni predali
00050000-55f0-41c3-bba8-cad1b09ec4a1	8282	Koprivnica
00050000-55f0-41c3-7bf8-fdb754e8468a	5296	Kostanjevica na Krasu
00050000-55f0-41c3-1c25-ddc1f7395abe	8311	Kostanjevica na Krki
00050000-55f0-41c3-4e05-32d3ceb0ff6a	1336	Kostel
00050000-55f0-41c3-5b8c-7fa7cdc5a4c5	6256	Košana
00050000-55f0-41c3-c8f4-21d8c25a828f	2394	Kotlje
00050000-55f0-41c3-6629-61ede8de875c	6240	Kozina
00050000-55f0-41c3-0fab-5d6858a44206	3260	Kozje
00050000-55f0-41c3-9208-a88d5c5c2436	4000	Kranj 
00050000-55f0-41c3-95f6-9880e40d993c	4001	Kranj - poštni predali
00050000-55f0-41c3-2421-f5160d23ad20	4280	Kranjska Gora
00050000-55f0-41c3-1857-25b74be6d05c	1281	Kresnice
00050000-55f0-41c3-937f-63b98b5ad4a3	4294	Križe
00050000-55f0-41c3-24c3-2047bd5cc63e	9206	Križevci
00050000-55f0-41c3-ac5a-e3b15ba38e48	9242	Križevci pri Ljutomeru
00050000-55f0-41c3-8db4-2dffae722aaf	1301	Krka
00050000-55f0-41c3-43c4-73a026594844	8296	Krmelj
00050000-55f0-41c3-0963-d2aecf33f38a	4245	Kropa
00050000-55f0-41c3-d3c1-0d9ed62d246a	8262	Krška vas
00050000-55f0-41c3-008d-12c621ad43d4	8270	Krško
00050000-55f0-41c3-509b-aecd2a4eace5	9263	Kuzma
00050000-55f0-41c3-af4f-784a1a48a9d2	2318	Laporje
00050000-55f0-41c3-d5b0-c2cc1389d345	3270	Laško
00050000-55f0-41c3-4c4e-cdbdffca9efe	1219	Laze v Tuhinju
00050000-55f0-41c3-4fc8-a9f5ecbbe9f9	2230	Lenart v Slovenskih goricah
00050000-55f0-41c3-d8e6-58658568d918	9220	Lendava/Lendva
00050000-55f0-41c3-ef54-f7ecdd792f86	4248	Lesce
00050000-55f0-41c3-70db-1b5863ff2c69	3261	Lesično
00050000-55f0-41c3-8e2e-aeb7e7a101c8	8273	Leskovec pri Krškem
00050000-55f0-41c3-48b5-a4ebaa8fabb7	2372	Libeliče
00050000-55f0-41c3-d0d8-d0bc9b357e0a	2341	Limbuš
00050000-55f0-41c3-fbbf-4015cc693033	1270	Litija
00050000-55f0-41c3-c756-d109104ac296	3202	Ljubečna
00050000-55f0-41c3-b604-6d1b1513d170	1000	Ljubljana 
00050000-55f0-41c3-4f76-3932c973aea6	1001	Ljubljana - poštni predali
00050000-55f0-41c3-a973-650f5ebe08b4	1231	Ljubljana - Črnuče
00050000-55f0-41c3-5421-5abe742378b7	1261	Ljubljana - Dobrunje
00050000-55f0-41c3-9de2-bff992ca6236	1260	Ljubljana - Polje
00050000-55f0-41c3-8568-e71dc1dd22eb	1210	Ljubljana - Šentvid
00050000-55f0-41c3-d240-4d4893c4589b	1211	Ljubljana - Šmartno
00050000-55f0-41c3-67a7-ebf883c14051	3333	Ljubno ob Savinji
00050000-55f0-41c3-eb78-dc06d60feef2	9240	Ljutomer
00050000-55f0-41c3-4968-919bab8336a3	3215	Loče
00050000-55f0-41c3-9bac-b3c39e455fec	5231	Log pod Mangartom
00050000-55f0-41c3-1913-c10df5f17034	1358	Log pri Brezovici
00050000-55f0-41c3-dd48-1505bebaa3b1	1370	Logatec
00050000-55f0-41c3-1adf-e303e8a6bd45	1371	Logatec
00050000-55f0-41c3-294b-27bb78bea245	1434	Loka pri Zidanem Mostu
00050000-55f0-41c3-9eac-0ed8e5e98e25	3223	Loka pri Žusmu
00050000-55f0-41c3-79c6-51b92c47c365	6219	Lokev
00050000-55f0-41c3-b782-1c3c703d5b18	1318	Loški Potok
00050000-55f0-41c3-8c1f-b45561a1b2d8	2324	Lovrenc na Dravskem polju
00050000-55f0-41c3-daae-7f02230f34f4	2344	Lovrenc na Pohorju
00050000-55f0-41c3-f7b5-355024bec3ef	3334	Luče
00050000-55f0-41c3-a455-cdc079014638	1225	Lukovica
00050000-55f0-41c3-51dc-fe305435ef3c	9202	Mačkovci
00050000-55f0-41c3-99eb-4b4464061697	2322	Majšperk
00050000-55f0-41c3-48a1-6e175c027a91	2321	Makole
00050000-55f0-41c3-97ba-2a895cff8748	9243	Mala Nedelja
00050000-55f0-41c3-ebcf-2d4eb57ae342	2229	Malečnik
00050000-55f0-41c3-bf45-a7253d10b008	6273	Marezige
00050000-55f0-41c3-8db5-fddff87f0265	2000	Maribor 
00050000-55f0-41c3-fb51-18e0fe844c1c	2001	Maribor - poštni predali
00050000-55f0-41c3-ba20-86fc9b6dfaa8	2206	Marjeta na Dravskem polju
00050000-55f0-41c3-19a9-6b37c23b0107	2281	Markovci
00050000-55f0-41c3-63a7-8a5ad08e9138	9221	Martjanci
00050000-55f0-41c3-c25e-bada01c33356	6242	Materija
00050000-55f0-41c3-8e91-229b2fa73197	4211	Mavčiče
00050000-55f0-41c3-0606-d44f49fd026d	1215	Medvode
00050000-55f0-41c3-5a7d-184231affa57	1234	Mengeš
00050000-55f0-41c3-1903-a96578076d2b	8330	Metlika
00050000-55f0-41c3-b60e-8f4615af2659	2392	Mežica
00050000-55f0-41c3-e81c-6f403889926c	2204	Miklavž na Dravskem polju
00050000-55f0-41c3-eb67-b4a1ad596372	2275	Miklavž pri Ormožu
00050000-55f0-41c3-fcde-add5856b114e	5291	Miren
00050000-55f0-41c3-57ab-80790f8d0293	8233	Mirna
00050000-55f0-41c3-48d0-05e28903c2d5	8216	Mirna Peč
00050000-55f0-41c3-3516-37d1d16c4372	2382	Mislinja
00050000-55f0-41c3-2552-9302607ba74d	4281	Mojstrana
00050000-55f0-41c3-6166-e39723f85cb4	8230	Mokronog
00050000-55f0-41c3-4df1-e600602df12e	1251	Moravče
00050000-55f0-41c3-3050-b6758abc6b42	9226	Moravske Toplice
00050000-55f0-41c3-1d0d-09980ad98854	5216	Most na Soči
00050000-55f0-41c3-e356-3a99062661f6	1221	Motnik
00050000-55f0-41c3-1710-c0f38e2adb1a	3330	Mozirje
00050000-55f0-41c3-5c11-2bcd88cb6bc1	9000	Murska Sobota 
00050000-55f0-41c3-3dd6-8983bb565b8f	9001	Murska Sobota - poštni predali
00050000-55f0-41c3-a3b4-07e71fae09d7	2366	Muta
00050000-55f0-41c3-1c57-7ee3df0dc406	4202	Naklo
00050000-55f0-41c3-e1f0-b92ef6e8ad86	3331	Nazarje
00050000-55f0-41c3-c456-ec10e959c1d4	1357	Notranje Gorice
00050000-55f0-41c3-d1f3-a4c07d9b062a	3203	Nova Cerkev
00050000-55f0-41c3-0b66-e4fae2aa909e	5000	Nova Gorica 
00050000-55f0-41c3-c064-091afb3c8da5	5001	Nova Gorica - poštni predali
00050000-55f0-41c3-da9b-6aebb865913e	1385	Nova vas
00050000-55f0-41c3-08a9-a6fe00890add	8000	Novo mesto
00050000-55f0-41c3-494f-16045fa7f300	8001	Novo mesto - poštni predali
00050000-55f0-41c3-e267-c5d82745e987	6243	Obrov
00050000-55f0-41c3-14b2-d1526728de82	9233	Odranci
00050000-55f0-41c3-a05b-8c5a3d88d960	2317	Oplotnica
00050000-55f0-41c3-b51e-4a200374209a	2312	Orehova vas
00050000-55f0-41c3-efc6-73cd43f9a5db	2270	Ormož
00050000-55f0-41c3-001c-8d9b4e1360aa	1316	Ortnek
00050000-55f0-41c3-37e4-ebb0cebbc52f	1337	Osilnica
00050000-55f0-41c3-e992-9862c398e26d	8222	Otočec
00050000-55f0-41c3-0af7-99ce039daec5	2361	Ožbalt
00050000-55f0-41c3-0040-46e847fc45e2	2231	Pernica
00050000-55f0-41c3-ed91-2ff21f6601ff	2211	Pesnica pri Mariboru
00050000-55f0-41c3-7d59-8d626bea3ba0	9203	Petrovci
00050000-55f0-41c3-b3df-8ca482932149	3301	Petrovče
00050000-55f0-41c3-c87b-db7ebf9abe9a	6330	Piran/Pirano
00050000-55f0-41c3-300d-6af88552e894	8255	Pišece
00050000-55f0-41c3-94ec-e7e6468f055a	6257	Pivka
00050000-55f0-41c3-d3db-76687bfa0cdd	6232	Planina
00050000-55f0-41c3-4160-05c99f8e87d7	3225	Planina pri Sevnici
00050000-55f0-41c3-6a9e-e08baccce497	6276	Pobegi
00050000-55f0-41c3-5c12-8194828fcd58	8312	Podbočje
00050000-55f0-41c3-eaa8-7f9c84ca33cc	5243	Podbrdo
00050000-55f0-41c3-ad04-3d15e513b4ff	3254	Podčetrtek
00050000-55f0-41c3-7b09-4429c5121b6f	2273	Podgorci
00050000-55f0-41c3-b270-4fa560626797	6216	Podgorje
00050000-55f0-41c3-1be9-1c331d7ffe15	2381	Podgorje pri Slovenj Gradcu
00050000-55f0-41c3-0bb8-d8bb64fce458	6244	Podgrad
00050000-55f0-41c3-e29b-68f4b906e870	1414	Podkum
00050000-55f0-41c3-0e65-f72aa7294fce	2286	Podlehnik
00050000-55f0-41c3-9825-814dd6b876f7	5272	Podnanos
00050000-55f0-41c3-cb07-240874780bdd	4244	Podnart
00050000-55f0-41c3-292e-136d97e638ec	3241	Podplat
00050000-55f0-41c3-8000-057028e526bf	3257	Podsreda
00050000-55f0-41c3-1ff7-96522122a45f	2363	Podvelka
00050000-55f0-41c3-c091-ed629b43f81a	2208	Pohorje
00050000-55f0-41c3-83db-ecd4e51e5d9a	2257	Polenšak
00050000-55f0-41c3-796e-f5a1a6e2a4b5	1355	Polhov Gradec
00050000-55f0-41c3-b74f-730c6f0702b4	4223	Poljane nad Škofjo Loko
00050000-55f0-41c3-bf2b-4d74d0e01ecd	2319	Poljčane
00050000-55f0-41c3-7dbe-dccd0aed416a	1272	Polšnik
00050000-55f0-41c3-ddef-732216eea885	3313	Polzela
00050000-55f0-41c3-729b-0c5cb1d827b7	3232	Ponikva
00050000-55f0-41c3-4877-ca3b7018f45f	6320	Portorož/Portorose
00050000-55f0-41c3-9d1b-d2b3fd59f4a2	6230	Postojna
00050000-55f0-41c3-cbe1-89f764286b71	2331	Pragersko
00050000-55f0-41c3-563d-de39b4d65ab7	3312	Prebold
00050000-55f0-41c3-70c2-aaff27e070f4	4205	Preddvor
00050000-55f0-41c3-5728-a34cd8b06af0	6255	Prem
00050000-55f0-41c3-e466-408f44c99a2e	1352	Preserje
00050000-55f0-41c3-1e94-74b9e60bbb92	6258	Prestranek
00050000-55f0-41c3-1ece-5892bfd5af55	2391	Prevalje
00050000-55f0-41c3-a8d7-65e5a7c2a5a9	3262	Prevorje
00050000-55f0-41c3-fe7e-3ec7ec2eeb79	1276	Primskovo 
00050000-55f0-41c3-3322-9fcf321dc3fa	3253	Pristava pri Mestinju
00050000-55f0-41c3-c41f-874efd2c2d36	9207	Prosenjakovci/Partosfalva
00050000-55f0-41c3-1ad4-2f8463c96a68	5297	Prvačina
00050000-55f0-41c3-6775-09825df8917d	2250	Ptuj
00050000-55f0-41c3-c47b-6c7ecd1bf18b	2323	Ptujska Gora
00050000-55f0-41c3-1c52-bbea30178e4e	9201	Puconci
00050000-55f0-41c3-4ffb-d58c9c02057a	2327	Rače
00050000-55f0-41c3-9830-6766a965257d	1433	Radeče
00050000-55f0-41c3-1934-a4f3d9d91123	9252	Radenci
00050000-55f0-41c3-465b-cb7b2a1a0e69	2360	Radlje ob Dravi
00050000-55f0-41c3-17de-566833750ecc	1235	Radomlje
00050000-55f0-41c3-e017-bb10cdd684b1	4240	Radovljica
00050000-55f0-41c3-2d54-acb8c3fca7eb	8274	Raka
00050000-55f0-41c3-1884-92f44c1ea5a4	1381	Rakek
00050000-55f0-41c3-9fc8-220e17c759b9	4283	Rateče - Planica
00050000-55f0-41c3-db1b-0b15b2118bb1	2390	Ravne na Koroškem
00050000-55f0-41c3-667d-513e8b32d7d2	9246	Razkrižje
00050000-55f0-41c3-a50b-de805cd4b223	3332	Rečica ob Savinji
00050000-55f0-41c3-d369-9e88cfcebd13	5292	Renče
00050000-55f0-41c3-6faa-30b6646f1f3c	1310	Ribnica
00050000-55f0-41c3-a92f-459b2eb35874	2364	Ribnica na Pohorju
00050000-55f0-41c3-98cd-e5a629954f9c	3272	Rimske Toplice
00050000-55f0-41c3-7f92-431f3eb4140d	1314	Rob
00050000-55f0-41c3-b2ce-8eca836d6335	5215	Ročinj
00050000-55f0-41c3-de7a-c38b762be67f	3250	Rogaška Slatina
00050000-55f0-41c3-4d1f-c072e6370935	9262	Rogašovci
00050000-55f0-41c3-f0ff-4acf4dcd9d4d	3252	Rogatec
00050000-55f0-41c3-4353-6d126aaa7024	1373	Rovte
00050000-55f0-41c3-a7c4-1e8604229ec2	2342	Ruše
00050000-55f0-41c3-10b3-492e8b618fea	1282	Sava
00050000-55f0-41c3-4dae-2bd2b58ea15f	6333	Sečovlje/Sicciole
00050000-55f0-41c3-31da-269e4b8f81fc	4227	Selca
00050000-55f0-41c3-9a0c-378437438463	2352	Selnica ob Dravi
00050000-55f0-41c3-ec82-fa6531c7a6af	8333	Semič
00050000-55f0-41c3-8e41-348d0b306320	8281	Senovo
00050000-55f0-41c3-a307-d93aa8ab1516	6224	Senožeče
00050000-55f0-41c3-6f60-e8c58363e94e	8290	Sevnica
00050000-55f0-41c3-00f4-6c4134455e04	6210	Sežana
00050000-55f0-41c3-1ec0-93f1888f400e	2214	Sladki Vrh
00050000-55f0-41c3-27be-624ada7ecb87	5283	Slap ob Idrijci
00050000-55f0-41c3-b76f-c419763f8b98	2380	Slovenj Gradec
00050000-55f0-41c3-b3d7-a1e75c88ce9f	2310	Slovenska Bistrica
00050000-55f0-41c3-4b27-3c277684102a	3210	Slovenske Konjice
00050000-55f0-41c3-9a78-8617b8cfb150	1216	Smlednik
00050000-55f0-41c3-1e64-effaebe002dd	5232	Soča
00050000-55f0-41c3-0298-dd296c20a9cc	1317	Sodražica
00050000-55f0-41c3-104f-5845f922f463	3335	Solčava
00050000-55f0-41c3-bccb-36008ac56707	5250	Solkan
00050000-55f0-41c3-e20b-20320cce3972	4229	Sorica
00050000-55f0-41c3-e083-2cf299365992	4225	Sovodenj
00050000-55f0-41c3-d524-3ef33f177f3c	5281	Spodnja Idrija
00050000-55f0-41c3-834b-923614beb149	2241	Spodnji Duplek
00050000-55f0-41c3-ada7-5a7db586697a	9245	Spodnji Ivanjci
00050000-55f0-41c3-56a8-00a81ef0dfbb	2277	Središče ob Dravi
00050000-55f0-41c3-4b8c-42489250b51b	4267	Srednja vas v Bohinju
00050000-55f0-41c3-9f6b-db5d537a7e76	8256	Sromlje 
00050000-55f0-41c3-5e98-37631b53a53b	5224	Srpenica
00050000-55f0-41c3-a9ce-b8ed3ae9b63f	1242	Stahovica
00050000-55f0-41c3-07be-f2defd905e07	1332	Stara Cerkev
00050000-55f0-41c3-de39-b0a68d3a1b59	8342	Stari trg ob Kolpi
00050000-55f0-41c3-59f6-7553326696d4	1386	Stari trg pri Ložu
00050000-55f0-41c3-6ae7-6141db99ed4d	2205	Starše
00050000-55f0-41c3-5481-45dd11153a1a	2289	Stoperce
00050000-55f0-41c3-e88e-d95d7159cf9a	8322	Stopiče
00050000-55f0-41c3-105c-a54852338439	3206	Stranice
00050000-55f0-41c3-4a91-9188276678b6	8351	Straža
00050000-55f0-41c3-2efc-22131fa02eac	1313	Struge
00050000-55f0-41c3-1674-298ee7b208cc	8293	Studenec
00050000-55f0-41c3-bf17-b98594e1691e	8331	Suhor
00050000-55f0-41c3-f91a-f707b29db896	2233	Sv. Ana v Slovenskih goricah
00050000-55f0-41c3-bbc5-6e8a33d3617f	2235	Sv. Trojica v Slovenskih goricah
00050000-55f0-41c3-85c4-fe5731b5de59	2353	Sveti Duh na Ostrem Vrhu
00050000-55f0-41c3-fcee-5b81c4198413	9244	Sveti Jurij ob Ščavnici
00050000-55f0-41c3-a3d8-f545037cfdfc	3264	Sveti Štefan
00050000-55f0-41c3-c22e-985b3129b989	2258	Sveti Tomaž
00050000-55f0-41c3-fc60-afbe3b38b452	9204	Šalovci
00050000-55f0-41c3-dcb3-25935e6bacef	5261	Šempas
00050000-55f0-41c3-9db2-266466200b8c	5290	Šempeter pri Gorici
00050000-55f0-41c3-2527-b5b4a307c75a	3311	Šempeter v Savinjski dolini
00050000-55f0-41c3-d4b5-9b3b6740a750	4208	Šenčur
00050000-55f0-41c3-c2c7-77e8b9cf36df	2212	Šentilj v Slovenskih goricah
00050000-55f0-41c3-e549-57614d9d3f54	8297	Šentjanž
00050000-55f0-41c3-5ee9-ee3b8769efe9	2373	Šentjanž pri Dravogradu
00050000-55f0-41c3-0320-7e0ea641648c	8310	Šentjernej
00050000-55f0-41c3-4a36-83e6869af183	3230	Šentjur
00050000-55f0-41c3-ffbb-d05ef25b9cb6	3271	Šentrupert
00050000-55f0-41c3-9b5f-059d3591db4a	8232	Šentrupert
00050000-55f0-41c3-4844-c980001c630e	1296	Šentvid pri Stični
00050000-55f0-41c3-cfae-1ba88e32d8e8	8275	Škocjan
00050000-55f0-41c3-6f8d-b9e638273cf3	6281	Škofije
00050000-55f0-41c3-e184-084bc4ffef4a	4220	Škofja Loka
00050000-55f0-41c3-1b0c-cfe0c3015c6d	3211	Škofja vas
00050000-55f0-41c3-3f73-301d113f8f14	1291	Škofljica
00050000-55f0-41c3-65ab-832f85e8e97d	6274	Šmarje
00050000-55f0-41c3-b128-8d929a6f84db	1293	Šmarje - Sap
00050000-55f0-41c3-caa7-99e9d52d408d	3240	Šmarje pri Jelšah
00050000-55f0-41c3-0356-fca71f3cb78f	8220	Šmarješke Toplice
00050000-55f0-41c3-3833-a15e8a3e61a0	2315	Šmartno na Pohorju
00050000-55f0-41c3-3bab-e298aebf1aeb	3341	Šmartno ob Dreti
00050000-55f0-41c3-2b06-0513d6fae1c5	3327	Šmartno ob Paki
00050000-55f0-41c3-d18c-98153f176957	1275	Šmartno pri Litiji
00050000-55f0-41c3-be24-6cddd3b1c276	2383	Šmartno pri Slovenj Gradcu
00050000-55f0-41c3-6822-6fdff93d9726	3201	Šmartno v Rožni dolini
00050000-55f0-41c3-9da2-8585689efeae	3325	Šoštanj
00050000-55f0-41c3-9358-4bffb62522ec	6222	Štanjel
00050000-55f0-41c3-0a8f-79f38c8994d0	3220	Štore
00050000-55f0-41c3-4d4f-fa353e0f4a3b	3304	Tabor
00050000-55f0-41c3-ee3d-39a808ab6cee	3221	Teharje
00050000-55f0-41c3-24a1-c233ba1be001	9251	Tišina
00050000-55f0-41c3-b224-623e413d1ce9	5220	Tolmin
00050000-55f0-41c3-5a04-a5331fae13c0	3326	Topolšica
00050000-55f0-41c3-eca0-71f177e115dd	2371	Trbonje
00050000-55f0-41c3-9c86-415ccaa1e960	1420	Trbovlje
00050000-55f0-41c3-b123-61697136a42b	8231	Trebelno 
00050000-55f0-41c3-30de-f6faec6daa87	8210	Trebnje
00050000-55f0-41c3-d85b-6102a50aef04	5252	Trnovo pri Gorici
00050000-55f0-41c3-bd28-310064bb8699	2254	Trnovska vas
00050000-55f0-41c3-6695-c785dca947cf	1222	Trojane
00050000-55f0-41c3-69b3-219609e45aba	1236	Trzin
00050000-55f0-41c3-74a3-3ef918e298e2	4290	Tržič
00050000-55f0-41c3-ceb6-f0e45a600fdc	8295	Tržišče
00050000-55f0-41c3-1570-f65de29e6c14	1311	Turjak
00050000-55f0-41c3-673b-caa8962ddd9d	9224	Turnišče
00050000-55f0-41c3-72d8-b9a0fc044438	8323	Uršna sela
00050000-55f0-41c3-f8b8-35b3da03aa50	1252	Vače
00050000-55f0-41c3-ea38-3ac4ca108e1c	3320	Velenje 
00050000-55f0-41c3-9513-5b9b6c517a43	3322	Velenje - poštni predali
00050000-55f0-41c3-1fd2-ad97c009d3ca	8212	Velika Loka
00050000-55f0-41c3-1934-30411ab1888d	2274	Velika Nedelja
00050000-55f0-41c3-dd1e-c34c0e2c0511	9225	Velika Polana
00050000-55f0-41c3-2be4-518f7f8fad55	1315	Velike Lašče
00050000-55f0-41c3-c962-709328b24ddc	8213	Veliki Gaber
00050000-55f0-41c3-a6b0-ca17df8ebac7	9241	Veržej
00050000-55f0-41c3-c7f9-d43e11b4e4ec	1312	Videm - Dobrepolje
00050000-55f0-41c3-d2dd-40abd3a06f74	2284	Videm pri Ptuju
00050000-55f0-41c3-51ab-74979728df4f	8344	Vinica
00050000-55f0-41c4-3c82-d3709c9095aa	5271	Vipava
00050000-55f0-41c4-9bfd-015e81a40df3	4212	Visoko
00050000-55f0-41c4-85b8-0a4b1277e0d7	1294	Višnja Gora
00050000-55f0-41c4-2e9d-1751ffcd9f14	3205	Vitanje
00050000-55f0-41c4-948d-b621a910f377	2255	Vitomarci
00050000-55f0-41c4-6e4c-ac92c55e8623	1217	Vodice
00050000-55f0-41c4-c7d9-4b4c2c0fd992	3212	Vojnik\t
00050000-55f0-41c4-78af-262fc97f1975	5293	Volčja Draga
00050000-55f0-41c4-8e29-28b15f9c8e5b	2232	Voličina
00050000-55f0-41c4-5950-06861f70ad7f	3305	Vransko
00050000-55f0-41c4-e187-16648fa2dea3	6217	Vremski Britof
00050000-55f0-41c4-4329-a0a5bdc6f6fe	1360	Vrhnika
00050000-55f0-41c4-2f47-dfe88465fad9	2365	Vuhred
00050000-55f0-41c4-042c-4d2844eefb59	2367	Vuzenica
00050000-55f0-41c4-8ea8-4acd5a64d797	8292	Zabukovje 
00050000-55f0-41c4-c5c0-72ac196cf356	1410	Zagorje ob Savi
00050000-55f0-41c4-81d4-121ad0cc78a5	1303	Zagradec
00050000-55f0-41c4-3a98-bd3eda48e6af	2283	Zavrč
00050000-55f0-41c4-c68e-4ff9707e054a	8272	Zdole 
00050000-55f0-41c4-f8fe-b127aa8b95f5	4201	Zgornja Besnica
00050000-55f0-41c4-6caa-e53561ffabd2	2242	Zgornja Korena
00050000-55f0-41c4-de7d-3e43e6e836fa	2201	Zgornja Kungota
00050000-55f0-41c4-9c6b-ce2a939225d0	2316	Zgornja Ložnica
00050000-55f0-41c4-8288-9d7cdd336842	2314	Zgornja Polskava
00050000-55f0-41c4-570b-3ad8155a0f7d	2213	Zgornja Velka
00050000-55f0-41c4-b284-01eb42b13ecf	4247	Zgornje Gorje
00050000-55f0-41c4-58fe-11238d81aed8	4206	Zgornje Jezersko
00050000-55f0-41c4-3394-7b5b08a86612	2285	Zgornji Leskovec
00050000-55f0-41c4-d66b-91c0110eaeea	1432	Zidani Most
00050000-55f0-41c4-a261-64873d654fac	3214	Zreče
00050000-55f0-41c4-76c2-c8c4ebd60299	4209	Žabnica
00050000-55f0-41c4-95ef-e07be3fd501c	3310	Žalec
00050000-55f0-41c4-e5df-4e645852ca21	4228	Železniki
00050000-55f0-41c4-d6a6-d4cf45674d91	2287	Žetale
00050000-55f0-41c4-d977-66d216740d1f	4226	Žiri
00050000-55f0-41c4-b613-e285e270e981	4274	Žirovnica
00050000-55f0-41c4-3232-93f3c0f01437	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 18236997)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 18236629)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 18236439)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f0-41c5-4027-ce69e14fffea	00080000-55f0-41c5-b1a8-57cf2c88925a	\N	00040000-55f0-41c4-9b23-82f696bac755	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f0-41c5-652e-520a88199854	00080000-55f0-41c5-b1a8-57cf2c88925a	\N	00040000-55f0-41c4-9b23-82f696bac755	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f0-41c5-3988-6b6ba3bf9d78	00080000-55f0-41c5-1852-ad2759b6165d	\N	00040000-55f0-41c4-9b23-82f696bac755	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 18236517)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 18236641)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 18237011)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 18237021)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f0-41c5-0a13-770e050aa095	00080000-55f0-41c5-42c9-866388dd7ede	0987	AK
00190000-55f0-41c5-b300-8ca2377e401d	00080000-55f0-41c5-1852-ad2759b6165d	0989	AK
00190000-55f0-41c5-9c40-d4d00339e490	00080000-55f0-41c5-5f58-9945124e61fc	0986	AK
00190000-55f0-41c5-05b5-4cda6239cfa9	00080000-55f0-41c5-61d2-e0dbbe0aa056	0984	AK
00190000-55f0-41c5-1bc5-50a9cab6a1fa	00080000-55f0-41c5-3b0a-8cd90e81c4d8	0983	AK
00190000-55f0-41c5-827a-26c6f083b4a3	00080000-55f0-41c5-fb0c-32d69c2c8d02	0982	AK
00190000-55f0-41c6-cf52-35943e7680a3	00080000-55f0-41c6-2e04-42c7443563d0	1001	AK
\.


--
-- TOC entry 2989 (class 0 OID 18236954)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f0-41c5-21f9-533f562caa40	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2993 (class 0 OID 18237029)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 18236670)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f0-41c5-b250-28a563a5a632	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f0-41c5-e6cd-b21db584f39d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f0-41c5-4feb-f49f1f2b0d57	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f0-41c5-4eb3-61a965268ce9	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f0-41c5-fcb6-8f2cbb9bd947	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f0-41c5-f3ce-111605fc29c4	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f0-41c5-62bc-d2f213b71b13	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2962 (class 0 OID 18236614)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 18236604)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 18236807)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 18236744)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 18236312)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f0-41c6-2e04-42c7443563d0	00010000-55f0-41c4-e185-8fb4d4c41047	2015-09-09 16:27:18	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f0-41c6-66ea-95211c69a37b	00010000-55f0-41c4-e185-8fb4d4c41047	2015-09-09 16:27:18	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f0-41c6-cf52-35943e7680a3	00010000-55f0-41c4-e185-8fb4d4c41047	2015-09-09 16:27:18	INS	a:0:{}
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2971 (class 0 OID 18236683)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 18236350)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f0-41c4-e13f-860719f7eca0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f0-41c4-ce16-fc443518a3ae	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f0-41c4-c57a-9649026751be	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f0-41c4-9c1e-e45af45a2a4b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f0-41c4-88f6-87f82bb29583	planer	Planer dogodkov v koledarju	t
00020000-55f0-41c4-0bef-1731d647ca93	kadrovska	Kadrovska služba	t
00020000-55f0-41c4-eff0-7982cac8887e	arhivar	Ažuriranje arhivalij	t
00020000-55f0-41c4-7b8b-5271bde7f7e2	igralec	Igralec	t
00020000-55f0-41c4-1d34-4d1b3c8fbc22	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f0-41c5-8d64-25dfcdcf45ae	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2938 (class 0 OID 18236334)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f0-41c4-c8c5-b8325ee663e3	00020000-55f0-41c4-c57a-9649026751be
00010000-55f0-41c4-e185-8fb4d4c41047	00020000-55f0-41c4-c57a-9649026751be
00010000-55f0-41c5-a92d-8ef24313ce84	00020000-55f0-41c5-8d64-25dfcdcf45ae
\.


--
-- TOC entry 2973 (class 0 OID 18236697)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 18236635)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 18236581)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 18236299)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f0-41c4-7267-b51f63aa3c18	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f0-41c4-9c95-fc2fcd618f6a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f0-41c4-7f61-d74ce3016c0d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f0-41c4-9142-83fc23470269	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f0-41c4-7d0c-68bdb1b726c9	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2933 (class 0 OID 18236291)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f0-41c4-b19f-e5d327ffc0d5	00230000-55f0-41c4-9142-83fc23470269	popa
00240000-55f0-41c4-d9b9-969750cc1488	00230000-55f0-41c4-9142-83fc23470269	oseba
00240000-55f0-41c4-84b8-a70d37de12da	00230000-55f0-41c4-9142-83fc23470269	sezona
00240000-55f0-41c4-d479-572a1b81f69c	00230000-55f0-41c4-9c95-fc2fcd618f6a	prostor
00240000-55f0-41c4-8848-632630aa0c32	00230000-55f0-41c4-9142-83fc23470269	besedilo
00240000-55f0-41c4-d4d6-178bd0ebdb9a	00230000-55f0-41c4-9142-83fc23470269	uprizoritev
00240000-55f0-41c4-819b-d2f3308922cf	00230000-55f0-41c4-9142-83fc23470269	funkcija
00240000-55f0-41c4-f34a-c4a25a85e1ca	00230000-55f0-41c4-9142-83fc23470269	tipfunkcije
00240000-55f0-41c4-cd44-394c5f78fffb	00230000-55f0-41c4-9142-83fc23470269	alternacija
00240000-55f0-41c4-9556-28cca78c8a45	00230000-55f0-41c4-7267-b51f63aa3c18	pogodba
00240000-55f0-41c4-3fa8-2668c1e7f296	00230000-55f0-41c4-9142-83fc23470269	zaposlitev
00240000-55f0-41c4-9453-ee0f0e3fd57b	00230000-55f0-41c4-9142-83fc23470269	zvrstuprizoritve
00240000-55f0-41c4-a362-064f2581b5b9	00230000-55f0-41c4-7267-b51f63aa3c18	programdela
00240000-55f0-41c4-ef64-91706f66b65a	00230000-55f0-41c4-9142-83fc23470269	zapis
\.


--
-- TOC entry 2932 (class 0 OID 18236286)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
bba34aa0-f1b1-4edc-b7ee-edbfc3ef2edd	00240000-55f0-41c4-b19f-e5d327ffc0d5	0	1001
\.


--
-- TOC entry 2978 (class 0 OID 18236754)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f0-41c5-e70a-b2c2fb1912b2	000e0000-55f0-41c5-8863-a95e33a7f1da	00080000-55f0-41c5-b1a8-57cf2c88925a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f0-41c4-87f7-987750f2fb6a
00270000-55f0-41c5-e422-912d534deb5a	000e0000-55f0-41c5-8863-a95e33a7f1da	00080000-55f0-41c5-b1a8-57cf2c88925a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f0-41c4-87f7-987750f2fb6a
\.


--
-- TOC entry 2945 (class 0 OID 18236412)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 18236591)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f0-41c6-a6c9-0781bde2e4e7	00180000-55f0-41c5-f098-e9ea5f8a1266	000c0000-55f0-41c5-ce9b-a98e13fd906b	00090000-55f0-41c5-41a5-efe44f64a856	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f0-41c6-1e11-cdd38ac6e954	00180000-55f0-41c5-f098-e9ea5f8a1266	000c0000-55f0-41c5-44ea-25da9c84d4a7	00090000-55f0-41c5-5efc-fb55360857cf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f0-41c6-f77b-ab81f66d654d	00180000-55f0-41c5-f098-e9ea5f8a1266	000c0000-55f0-41c5-0694-e6be45c484b8	00090000-55f0-41c5-220b-86aa3d10ee7f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f0-41c6-49fc-15eadda7d347	00180000-55f0-41c5-f098-e9ea5f8a1266	000c0000-55f0-41c5-cc3e-92e0960dbf98	00090000-55f0-41c5-a189-3a3c9d06537e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f0-41c6-b026-3f3bab10e9ea	00180000-55f0-41c5-f098-e9ea5f8a1266	000c0000-55f0-41c6-db7f-245deef30eba	00090000-55f0-41c5-cfab-3b5fa181b699	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f0-41c6-0b11-5be773691aa9	00180000-55f0-41c5-1da9-481f2956cb80	\N	00090000-55f0-41c5-cfab-3b5fa181b699	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2981 (class 0 OID 18236795)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f0-41c4-bb7c-b5c34a3aa615	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f0-41c4-d8eb-52a029ff788a	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f0-41c4-a37e-091dc3d19b88	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f0-41c4-fd23-b08fee737f22	04	Režija	Režija	Režija	umetnik
000f0000-55f0-41c4-fa89-736f1701639c	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f0-41c4-ff3a-dce74cb891cb	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f0-41c4-9f6a-f4e168551b5f	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f0-41c4-ee2a-71272e4598a4	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f0-41c4-4dd2-953dee8b0a8e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f0-41c4-214e-e774ee769f72	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f0-41c4-a6a4-ed891e11ba8c	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f0-41c4-8891-7d31df26d8a5	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f0-41c4-86cc-410f28b11555	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f0-41c4-64d2-15be7406ad99	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f0-41c4-a69c-babb3559932f	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f0-41c4-85e2-836d52f5e745	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f0-41c4-39cb-918f2ff8f4ac	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f0-41c4-ff94-2649bf99b3f6	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2994 (class 0 OID 18237039)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f0-41c4-2e9c-a3719b762d52	01	Velika predstava	f	1.00	1.00
002b0000-55f0-41c4-0c1e-a455688b94bb	02	Mala predstava	f	0.50	0.50
002b0000-55f0-41c4-b364-8e28af83f32c	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f0-41c4-b4c1-4249d748dcc1	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f0-41c4-de22-612c76b7d1f4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2950 (class 0 OID 18236474)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 18236321)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f0-41c4-e185-8fb4d4c41047	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROitxIXbCrP1OxU2B6FfCSAbB39.ULaKa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f0-41c5-28e5-3c8971a0ed97	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f0-41c5-7f4d-65887def7d00	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f0-41c5-3047-2844deae15dc	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f0-41c5-f296-7dc61d8a0668	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f0-41c5-dc1a-4775f43772d2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f0-41c5-50e4-52442e20644b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f0-41c5-9dec-9e7e776dfaa0	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f0-41c5-2921-42f7f3c8b1e7	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f0-41c5-9d40-931af29ab4f5	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f0-41c5-a92d-8ef24313ce84	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f0-41c4-c8c5-b8325ee663e3	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2985 (class 0 OID 18236844)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f0-41c5-920b-6dc3edeead75	00160000-55f0-41c5-8729-79605de8647b	\N	00140000-55f0-41c4-6f9b-2ffcc2689980	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f0-41c5-fcb6-8f2cbb9bd947
000e0000-55f0-41c5-8863-a95e33a7f1da	00160000-55f0-41c5-b0de-f4bbe0c4ed88	\N	00140000-55f0-41c4-a470-65b267001e1f	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f0-41c5-f3ce-111605fc29c4
000e0000-55f0-41c5-3b91-f2541c182381	\N	\N	00140000-55f0-41c4-a470-65b267001e1f	00190000-55f0-41c5-0a13-770e050aa095	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f0-41c5-fcb6-8f2cbb9bd947
000e0000-55f0-41c5-09f6-f6c7abb77c61	\N	\N	00140000-55f0-41c4-a470-65b267001e1f	00190000-55f0-41c5-0a13-770e050aa095	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f0-41c5-fcb6-8f2cbb9bd947
000e0000-55f0-41c5-e94e-b38b77671c7c	\N	\N	00140000-55f0-41c4-a470-65b267001e1f	00190000-55f0-41c5-0a13-770e050aa095	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f0-41c5-b250-28a563a5a632
000e0000-55f0-41c5-e64e-6d86d34b71ec	\N	\N	00140000-55f0-41c4-a470-65b267001e1f	00190000-55f0-41c5-0a13-770e050aa095	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f0-41c5-b250-28a563a5a632
\.


--
-- TOC entry 2955 (class 0 OID 18236535)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f0-41c5-da7d-8f0ee1812721	000e0000-55f0-41c5-8863-a95e33a7f1da	\N	1	
00200000-55f0-41c5-dc5c-adb1856964a9	000e0000-55f0-41c5-8863-a95e33a7f1da	\N	2	
\.


--
-- TOC entry 2969 (class 0 OID 18236662)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 18236768)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f0-41c4-f67a-36ef08fdc676	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f0-41c4-4e8e-ce8a4f4b7b3d	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f0-41c4-cff9-04ced13b03a9	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f0-41c4-dd3f-19b872210bbf	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f0-41c4-e004-cd4e2a96afbe	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f0-41c4-605e-4e37711a79ad	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f0-41c4-ecde-d4a99a1e5e0f	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f0-41c4-2def-b40a31665173	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f0-41c4-87f7-987750f2fb6a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f0-41c4-b68b-79d6d386436b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f0-41c4-7719-a2cebda6217c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f0-41c4-c637-9614b1b1337a	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f0-41c4-1dcd-208aca43d455	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f0-41c4-1dcf-b6de6ff93362	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f0-41c4-5b1d-76c85652ab81	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f0-41c4-b5a1-30a45186ebed	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f0-41c4-719f-eecbb152094d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f0-41c4-1ec8-d593caadd816	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f0-41c4-38dd-aa20497e9a96	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f0-41c4-cb3c-ef38777b88c0	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f0-41c4-6be3-b9fd32b4baa2	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f0-41c4-e966-e92c1c500f87	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f0-41c4-8c16-9c800b7c37ad	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f0-41c4-766c-ad894d178cc9	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f0-41c4-3403-c0cec451aa10	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f0-41c4-232e-0a5177efcf64	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f0-41c4-2ece-77c0521d7902	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f0-41c4-2012-1a2d05fa6c62	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2997 (class 0 OID 18237085)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 18237057)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 18237097)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 18236734)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f0-41c5-b287-c25729667ce2	00090000-55f0-41c5-5efc-fb55360857cf	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f0-41c5-3e3b-4bfb5a80cfac	00090000-55f0-41c5-220b-86aa3d10ee7f	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f0-41c5-a5e3-53eedf69d184	00090000-55f0-41c5-7d8d-da83e9a8c042	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f0-41c5-e971-c73b1456ca13	00090000-55f0-41c5-c77c-0a6023451a58	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f0-41c5-86bd-a1e79ad7f7d7	00090000-55f0-41c5-41a5-efe44f64a856	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f0-41c5-79da-96f1283a55e5	00090000-55f0-41c5-284e-7f24da7b8958	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2957 (class 0 OID 18236571)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 18236834)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f0-41c4-6f9b-2ffcc2689980	01	Drama	drama (SURS 01)
00140000-55f0-41c4-9d68-f2282dd0f00e	02	Opera	opera (SURS 02)
00140000-55f0-41c4-3ce8-52b8417c9c2c	03	Balet	balet (SURS 03)
00140000-55f0-41c4-cf9c-3ecd313b3bba	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f0-41c4-90e3-2b2a877d1f0c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f0-41c4-a470-65b267001e1f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f0-41c4-9657-b355703cab9a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2975 (class 0 OID 18236724)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 18236375)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 18236893)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 18236883)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 18236793)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 18237137)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 18236560)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 18236580)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 18237055)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 18236500)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 18236948)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 18236720)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 18236533)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 18236514)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 18236627)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 18237114)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 18237121)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 18237145)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 18236654)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 18236472)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 18236384)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 18236408)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 18236364)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 18236349)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 18236660)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 18236696)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 18236829)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 18236436)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 18236460)
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
-- TOC entry 2679 (class 2606 OID 18237009)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 18236633)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 18236450)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 18236521)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 18236645)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 18237018)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 18237026)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 18236996)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 18237037)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 18236678)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 18236618)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 18236609)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 18236817)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 18236751)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 18236320)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 18236687)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 18236338)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 18236358)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 18236705)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 18236640)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 18236589)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 18236308)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 18236296)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 18236290)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 18236764)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 18236417)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 18236600)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 18236804)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 18237049)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 18236485)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 18236333)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 18236862)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 18236543)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 18236668)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 18236776)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 18237095)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 18237079)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 18237103)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 18236742)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 18236575)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 18236842)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 18236732)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 18236569)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 18236570)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 18236568)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 18236567)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2624 (class 1259 OID 18236765)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 18236766)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 18236767)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 18237116)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 18237115)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 18236438)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 18236661)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 18237083)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 18237082)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 18237084)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 18237081)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 18237080)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 18236647)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 18236646)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 18236544)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 18236721)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 18236723)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 18236722)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 18236516)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 18236515)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 18237038)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 18236831)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 18236832)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 18236833)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 18237104)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 18236867)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 18236864)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 18236868)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 18236866)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 18236865)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 18236487)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 18236486)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 18236411)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 18236688)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 18236365)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 18236366)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 18236708)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 18236707)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 18236706)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 18236522)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 18236523)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 18236298)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 18236613)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 18236611)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 18236610)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 18236612)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 18236339)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 18236340)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 18236669)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 18237138)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 18237146)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 18237147)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 18236634)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 18236752)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 18236753)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 18236953)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 18236952)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 18236949)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 18236950)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 18236951)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 18236452)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 18236451)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 18236453)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 18236682)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 18236681)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 18237019)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 18237020)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 18236897)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 18236898)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 18236895)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 18236896)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 18236743)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 18236622)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 18236621)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 18236619)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 18236620)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 18236885)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 18236884)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 18236534)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 18237010)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 18237056)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 18237122)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 18237123)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 18236386)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 18236385)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 18236418)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 18236419)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 18236603)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 18236602)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 18236601)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2543 (class 1259 OID 18236562)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2544 (class 1259 OID 18236563)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2545 (class 1259 OID 18236561)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2546 (class 1259 OID 18236565)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2547 (class 1259 OID 18236566)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2548 (class 1259 OID 18236564)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 18236437)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 18236501)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 18236503)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 18236502)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 18236504)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 18236628)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 18236830)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 18236863)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 18236805)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 18236806)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 18236409)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 18236410)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 18236733)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 18236309)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 18236473)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 18236297)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2597 (class 1259 OID 18236680)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 18236679)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 18236894)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 18236461)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 18236843)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 18237096)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 18237027)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 18237028)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 18236794)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 18236590)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 18236359)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 18237268)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 18237273)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 18237293)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 18237263)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 18237283)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 18237288)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 18237278)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2785 (class 2606 OID 18237443)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2784 (class 2606 OID 18237448)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2783 (class 2606 OID 18237453)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 18237618)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2818 (class 2606 OID 18237613)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 18237203)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 18237373)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2812 (class 2606 OID 18237598)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 18237593)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 18237603)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 18237588)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2815 (class 2606 OID 18237583)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2767 (class 2606 OID 18237368)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 18237363)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 18237258)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 18237413)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 18237423)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 18237418)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 18237238)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 18237233)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 18237353)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 18237573)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 18237458)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 18237463)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 18237468)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2816 (class 2606 OID 18237608)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2790 (class 2606 OID 18237488)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2793 (class 2606 OID 18237473)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2789 (class 2606 OID 18237493)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2791 (class 2606 OID 18237483)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2792 (class 2606 OID 18237478)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 18237228)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 18237223)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 18237188)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 18237183)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 18237393)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 18237163)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 18237168)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2774 (class 2606 OID 18237408)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 18237403)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 18237398)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 18237243)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 18237248)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 18237148)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2757 (class 2606 OID 18237328)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2759 (class 2606 OID 18237318)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2760 (class 2606 OID 18237313)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2758 (class 2606 OID 18237323)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 18237153)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 18237158)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 18237378)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2821 (class 2606 OID 18237633)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 18237638)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2822 (class 2606 OID 18237643)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 18237358)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2782 (class 2606 OID 18237433)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2781 (class 2606 OID 18237438)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 18237548)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 18237543)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 18237528)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 18237533)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2802 (class 2606 OID 18237538)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 18237213)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 18237208)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 18237218)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 18237388)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2772 (class 2606 OID 18237383)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2807 (class 2606 OID 18237558)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2806 (class 2606 OID 18237563)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2797 (class 2606 OID 18237518)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 18237523)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2799 (class 2606 OID 18237508)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2798 (class 2606 OID 18237513)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 18237428)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 18237348)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2762 (class 2606 OID 18237343)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 18237333)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2763 (class 2606 OID 18237338)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 18237503)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2795 (class 2606 OID 18237498)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 18237253)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 18237553)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2808 (class 2606 OID 18237568)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 18237578)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 18237623)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 18237628)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 18237178)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 18237173)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 18237193)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 18237198)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 18237308)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 18237303)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 18237298)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-09 16:27:20 CEST

--
-- PostgreSQL database dump complete
--

