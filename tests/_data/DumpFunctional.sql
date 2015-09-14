--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-14 13:43:59 CEST

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
-- TOC entry 181 (class 1259 OID 19184768)
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
-- TOC entry 226 (class 1259 OID 19185287)
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
-- TOC entry 225 (class 1259 OID 19185270)
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
-- TOC entry 219 (class 1259 OID 19185178)
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
-- TOC entry 240 (class 1259 OID 19185525)
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
-- TOC entry 195 (class 1259 OID 19184946)
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
-- TOC entry 197 (class 1259 OID 19184977)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19185451)
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
-- TOC entry 190 (class 1259 OID 19184889)
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
-- TOC entry 227 (class 1259 OID 19185300)
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
-- TOC entry 213 (class 1259 OID 19185110)
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
-- TOC entry 193 (class 1259 OID 19184925)
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
-- TOC entry 191 (class 1259 OID 19184906)
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
-- TOC entry 202 (class 1259 OID 19185024)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19185506)
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
-- TOC entry 239 (class 1259 OID 19185518)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19185540)
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
-- TOC entry 206 (class 1259 OID 19185049)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19184863)
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
-- TOC entry 182 (class 1259 OID 19184777)
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
-- TOC entry 183 (class 1259 OID 19184788)
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
-- TOC entry 178 (class 1259 OID 19184742)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19184761)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19185056)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19185090)
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
-- TOC entry 222 (class 1259 OID 19185219)
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
-- TOC entry 185 (class 1259 OID 19184821)
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
-- TOC entry 187 (class 1259 OID 19184855)
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
-- TOC entry 229 (class 1259 OID 19185398)
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
-- TOC entry 203 (class 1259 OID 19185030)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19184840)
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
-- TOC entry 192 (class 1259 OID 19184918)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 19185042)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19185412)
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
-- TOC entry 231 (class 1259 OID 19185422)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19185355)
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
-- TOC entry 232 (class 1259 OID 19185430)
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
-- TOC entry 209 (class 1259 OID 19185071)
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
-- TOC entry 201 (class 1259 OID 19185015)
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
-- TOC entry 200 (class 1259 OID 19185005)
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
-- TOC entry 221 (class 1259 OID 19185208)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19185145)
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
-- TOC entry 175 (class 1259 OID 19184713)
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
-- TOC entry 174 (class 1259 OID 19184711)
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
-- TOC entry 210 (class 1259 OID 19185084)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19184751)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19184735)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19185098)
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
-- TOC entry 204 (class 1259 OID 19185036)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19184982)
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
-- TOC entry 173 (class 1259 OID 19184700)
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
-- TOC entry 172 (class 1259 OID 19184692)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19184687)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19185155)
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
-- TOC entry 184 (class 1259 OID 19184813)
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
-- TOC entry 199 (class 1259 OID 19184992)
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
-- TOC entry 220 (class 1259 OID 19185196)
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
-- TOC entry 233 (class 1259 OID 19185440)
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
-- TOC entry 189 (class 1259 OID 19184875)
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
-- TOC entry 176 (class 1259 OID 19184722)
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
-- TOC entry 224 (class 1259 OID 19185245)
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
-- TOC entry 194 (class 1259 OID 19184936)
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
-- TOC entry 208 (class 1259 OID 19185063)
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
-- TOC entry 218 (class 1259 OID 19185169)
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
-- TOC entry 236 (class 1259 OID 19185486)
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
-- TOC entry 235 (class 1259 OID 19185458)
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
-- TOC entry 237 (class 1259 OID 19185498)
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
-- TOC entry 215 (class 1259 OID 19185135)
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
-- TOC entry 196 (class 1259 OID 19184972)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19185235)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19185125)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 19184716)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 19184768)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 19185287)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f6-b2fc-7c92-a83b38c72fd8	000d0000-55f6-b2fc-84a2-2a0295b261ad	\N	00090000-55f6-b2fc-1941-75fda3ab7a04	000b0000-55f6-b2fc-a96b-f28cc0f8ceef	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f6-b2fc-f28b-786026dde004	000d0000-55f6-b2fc-fb10-461647e2f5d0	00100000-55f6-b2fc-29ab-34f6c8517775	00090000-55f6-b2fc-a668-2ca8e6f68035	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f6-b2fc-4a7d-a5e64a7f256b	000d0000-55f6-b2fc-000e-42b48363349a	00100000-55f6-b2fc-a1ee-b5732d3393bd	00090000-55f6-b2fc-d242-b91fadb57c14	\N	0003	t	\N	2015-09-14	\N	2	t	\N	f	f
000c0000-55f6-b2fc-5e3b-430fbb5c2e76	000d0000-55f6-b2fc-ef4d-154013aeeb17	\N	00090000-55f6-b2fc-00c1-d4e84c38720b	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f6-b2fc-387c-57d9e53da421	000d0000-55f6-b2fc-e4fe-5cea6edf9000	\N	00090000-55f6-b2fc-5d8c-85e255f66f13	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f6-b2fc-62d0-c57c5ce621bd	000d0000-55f6-b2fc-2514-8d1c539564e5	\N	00090000-55f6-b2fc-5b3d-f79080a0e42a	000b0000-55f6-b2fc-a013-3a000a254f1a	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f6-b2fc-61d8-c847717cb65f	000d0000-55f6-b2fc-6dbf-895a71805b91	00100000-55f6-b2fc-3453-8adb032513a3	00090000-55f6-b2fc-71e8-35b0e955e75c	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f6-b2fc-b8da-262a0815b43c	000d0000-55f6-b2fc-6918-96442450f937	\N	00090000-55f6-b2fc-96d6-399d4ac4511e	000b0000-55f6-b2fc-bb69-a8f54cf0ff0c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f6-b2fc-066d-3a04104d992a	000d0000-55f6-b2fc-6dbf-895a71805b91	00100000-55f6-b2fc-50c2-1908cca3abd2	00090000-55f6-b2fc-612d-80554a2bcf85	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f6-b2fc-8a4c-d477fd8c8bbd	000d0000-55f6-b2fc-6dbf-895a71805b91	00100000-55f6-b2fc-542b-131046ff1143	00090000-55f6-b2fc-99fc-632d9a38d0f5	\N	0010	t	\N	2015-09-14	\N	16	f	\N	f	t
000c0000-55f6-b2fc-af52-575ab6085153	000d0000-55f6-b2fc-6dbf-895a71805b91	00100000-55f6-b2fc-59b6-52939345f81b	00090000-55f6-b2fc-51ce-b6d813a963a7	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f6-b2fc-4c23-383580d1ea17	000d0000-55f6-b2fc-8944-4bd8a3deef0a	\N	00090000-55f6-b2fc-a668-2ca8e6f68035	000b0000-55f6-b2fc-15f3-50fb70c45474	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2986 (class 0 OID 19185270)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 19185178)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f6-b2fb-b356-9616870f058d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f6-b2fb-896f-a1f4835a7507	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f6-b2fb-591a-ed1d07a288ca	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 19185525)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 19184946)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f6-b2fc-e254-c908bf4715e8	\N	\N	00200000-55f6-b2fc-cbba-7f7ce0dd4905	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f6-b2fc-5955-1c068bec2d2a	\N	\N	00200000-55f6-b2fc-a311-82865c8d3a5b	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f6-b2fc-6c09-4b8cdcf76688	\N	\N	00200000-55f6-b2fc-6ca2-c73b37cf6cf7	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f6-b2fc-fa0c-a05361695de0	\N	\N	00200000-55f6-b2fc-fb66-89cf00fbbc1e	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f6-b2fc-a158-ea6bce75cc87	\N	\N	00200000-55f6-b2fc-372c-bf2922069ce8	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2958 (class 0 OID 19184977)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 19185451)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19184889)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f6-b2f9-607b-0b144752cc00	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f6-b2f9-7a55-ded5ba2e3f5f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f6-b2f9-96eb-ec5ac7132662	AL	ALB	008	Albania 	Albanija	\N
00040000-55f6-b2f9-8a50-56009fc1ff6e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f6-b2f9-ccdb-a5114893574d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f6-b2f9-64a7-0ddb10e5da84	AD	AND	020	Andorra 	Andora	\N
00040000-55f6-b2f9-289c-f2672aa6b18c	AO	AGO	024	Angola 	Angola	\N
00040000-55f6-b2f9-4afd-c4762edd1e37	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f6-b2f9-73c4-aa2548b37348	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f6-b2f9-436f-97da3ee77cf5	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f6-b2f9-cfbb-13f876424593	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f6-b2f9-92e2-f2aac5514cca	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f6-b2f9-1948-e640537c8e63	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f6-b2f9-c850-40d7f8d670e1	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f6-b2f9-d1e3-1a3f7fb7e57f	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f6-b2f9-4ff8-c84e0b04a4f7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f6-b2f9-a1e0-ff69957d4caf	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f6-b2f9-f1b1-6d4f23439856	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f6-b2f9-bb0a-9692b865611e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f6-b2f9-40b8-02f60f044bcd	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f6-b2f9-7a39-1a08ae89185b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f6-b2f9-4978-de91fbc6c670	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f6-b2f9-97c8-679146ef902b	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f6-b2f9-31cd-ced9362ddd43	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f6-b2f9-377a-710ddd7c6513	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f6-b2f9-db0f-a8c757074db2	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f6-b2f9-4397-7592bb31e66c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f6-b2f9-4d37-f4c682c39f53	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f6-b2f9-1440-cb8a64fb74e8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f6-b2f9-c977-f2857d883c32	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f6-b2f9-bf5f-ea96ec130b98	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f6-b2f9-666e-9c365ee9556e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f6-b2f9-ff41-66ffdc862fbe	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f6-b2f9-279b-6659707390de	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f6-b2f9-e245-2aeaef9382a6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f6-b2f9-074c-9217b9779fb0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f6-b2f9-cfb4-fc1d1aa62070	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f6-b2f9-240d-1c8d123a7c50	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f6-b2f9-b8d5-a7c5bf3380a9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f6-b2f9-66d2-41a143607d42	CA	CAN	124	Canada 	Kanada	\N
00040000-55f6-b2f9-ca5d-6caf102417d8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f6-b2f9-8999-fd6d6e993add	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f6-b2f9-fcc3-30d93df449a0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f6-b2f9-abf0-4952361c48e7	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f6-b2f9-6eef-cb03c30e68cf	CL	CHL	152	Chile 	Čile	\N
00040000-55f6-b2f9-5620-b098d6e710be	CN	CHN	156	China 	Kitajska	\N
00040000-55f6-b2f9-8983-d4477fd0a972	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f6-b2f9-066b-2c6c0633c54d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f6-b2f9-d401-f16d1574eebf	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f6-b2f9-1202-45add3ac6121	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f6-b2f9-12f9-3d2d651d062a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f6-b2f9-e827-b8b45060a183	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f6-b2f9-665f-6d7625c54c68	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f6-b2f9-c065-255177a8d6c2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f6-b2f9-38d5-88d996c78eaa	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f6-b2f9-837c-616ab4b7ac3e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f6-b2f9-0d2e-d20058377024	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f6-b2f9-5dca-2024749737e0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f6-b2f9-b008-ccd5dc092090	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f6-b2f9-9fd3-a58aeb503064	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f6-b2f9-6a46-7b834625f590	DK	DNK	208	Denmark 	Danska	\N
00040000-55f6-b2f9-e155-0581d35683c3	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f6-b2f9-88d6-348d1205888f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f6-b2f9-ca45-5d7c2c8aa611	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f6-b2f9-f328-ebd860710533	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f6-b2f9-d181-d6c107aa3cbe	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f6-b2f9-66d7-b6b6aa7d2181	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f6-b2f9-d508-0f6a0d7f98d6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f6-b2f9-08c0-0d13091a8a06	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f6-b2f9-b2e4-ba962825cf97	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f6-b2f9-d07d-dd45009aeb22	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f6-b2f9-f0d7-4f882d977e24	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f6-b2f9-d01b-021f322376f3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f6-b2f9-1d36-42759264a911	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f6-b2f9-c1bd-66e0d396449f	FI	FIN	246	Finland 	Finska	\N
00040000-55f6-b2f9-90c0-fc612fb0fe3c	FR	FRA	250	France 	Francija	\N
00040000-55f6-b2f9-2b1e-3818fb05ba37	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f6-b2f9-6e00-7b35a9e3db99	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f6-b2f9-55e9-051eff330cf1	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f6-b2f9-53f2-13818ddac11c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f6-b2f9-332d-268b6b4f12fe	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f6-b2f9-174c-082c9ee8d4c6	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f6-b2f9-fd38-fb1b94f860e7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f6-b2f9-00cf-9c3e284e2ca2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f6-b2f9-4323-274804a6f00d	GH	GHA	288	Ghana 	Gana	\N
00040000-55f6-b2f9-568d-93984fa12a7d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f6-b2f9-55d6-fd44bb761b29	GR	GRC	300	Greece 	Grčija	\N
00040000-55f6-b2f9-2ff3-8a0d6db3bb3b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f6-b2f9-64b6-f1c52346e2ab	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f6-b2f9-7cd5-8f8e982e8d82	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f6-b2f9-4123-625feb428414	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f6-b2f9-9384-95ba08495ffa	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f6-b2f9-4056-2aea6fad9963	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f6-b2f9-67df-ea3f9e2083df	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f6-b2f9-5ff2-c60d1368190b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f6-b2f9-96c1-bf889b503ad1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f6-b2f9-b0b6-a7708ab72757	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f6-b2f9-e278-2177993ad214	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f6-b2f9-1f6e-a22b7c6a1fb6	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f6-b2f9-5f6d-613d334c5bdc	HN	HND	340	Honduras 	Honduras	\N
00040000-55f6-b2f9-e60a-6681dda2af62	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f6-b2f9-a4e2-ace3362f8641	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f6-b2f9-4829-f1e335a90558	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f6-b2f9-4262-01765e14bc4f	IN	IND	356	India 	Indija	\N
00040000-55f6-b2f9-5034-3fbf98fc6859	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f6-b2f9-d669-c649ca7e95fd	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f6-b2f9-9a8e-5de5f2b97705	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f6-b2f9-9fbc-d058075dd9b6	IE	IRL	372	Ireland 	Irska	\N
00040000-55f6-b2f9-43c1-a7763f3bbe27	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f6-b2f9-4eb7-8a17a17592ff	IL	ISR	376	Israel 	Izrael	\N
00040000-55f6-b2f9-8b54-b7c569044c6b	IT	ITA	380	Italy 	Italija	\N
00040000-55f6-b2f9-40cf-9c1a8a03b71e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f6-b2f9-d9d3-b725ddf8832c	JP	JPN	392	Japan 	Japonska	\N
00040000-55f6-b2f9-2b92-d9782f6f736b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f6-b2f9-7dab-f9ffd9f93c9c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f6-b2f9-e9bd-820312663f4a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f6-b2f9-aa0d-41855823e6fe	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f6-b2f9-293d-3ea23e46e322	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f6-b2f9-db1b-d177f9bab2b9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f6-b2f9-e38f-ae6ac918fc79	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f6-b2f9-33a4-741a0941ec24	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f6-b2f9-321c-7bdcd74c7051	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f6-b2f9-b6dc-64a0bb8fe995	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f6-b2f9-5069-01e02bedd229	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f6-b2f9-264c-7f66b5fd6866	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f6-b2f9-caa3-c0f47fd1720f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f6-b2f9-9091-35d3d0e8089e	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f6-b2f9-cd10-8139f6133fb9	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f6-b2f9-5378-b5b69c9d9246	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f6-b2f9-6ba2-fefa131ea3c4	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f6-b2f9-080b-13fa8a8a92c3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f6-b2f9-b722-4a2293ace991	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f6-b2f9-c559-a1bbfa0bdb65	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f6-b2f9-635d-dc519792d344	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f6-b2f9-42be-690dbe0b6285	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f6-b2f9-86f4-e8b7c802b28e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f6-b2f9-95f7-cadd3e9b4a5c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f6-b2f9-df9a-569185730f2f	ML	MLI	466	Mali 	Mali	\N
00040000-55f6-b2f9-98bb-d37ff183d371	MT	MLT	470	Malta 	Malta	\N
00040000-55f6-b2f9-4e44-ac5cc59efe31	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f6-b2f9-2063-52569004e4e1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f6-b2f9-5383-beb55f604fd6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f6-b2f9-a90a-487f0cdde310	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f6-b2f9-a4cf-12de876b99f4	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f6-b2f9-5d2f-0fa8d9901f95	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f6-b2f9-128c-9f8b7fa3d984	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f6-b2f9-a141-82f7afbd6ca1	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f6-b2f9-8e57-aad3221e48f0	MC	MCO	492	Monaco 	Monako	\N
00040000-55f6-b2f9-6f0d-47ac4261bcaf	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f6-b2f9-f997-88d31977632f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f6-b2f9-ba66-ac1bb84e3505	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f6-b2f9-fc21-0982bb58609b	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f6-b2f9-8cef-b7903aa1a3e2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f6-b2f9-b2e4-3fb9c252f696	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f6-b2f9-1375-4f4695634dc6	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f6-b2f9-db6e-ec99d4248953	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f6-b2f9-0532-552dd107e640	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f6-b2f9-5458-46b94d316459	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f6-b2f9-5020-b30021f3df33	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f6-b2f9-e559-fb445ea655d8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f6-b2f9-c601-6f7ee4dd578e	NE	NER	562	Niger 	Niger 	\N
00040000-55f6-b2f9-b339-dc377a3a6184	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f6-b2f9-2969-48ee826c67c8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f6-b2f9-8307-98c597648720	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f6-b2f9-463f-daf58af2d020	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f6-b2f9-2e15-cc9b84a613f2	NO	NOR	578	Norway 	Norveška	\N
00040000-55f6-b2f9-4061-146eae6a74d9	OM	OMN	512	Oman 	Oman	\N
00040000-55f6-b2f9-ba62-6e8b44ccd064	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f6-b2f9-9b40-5c4b604c3cdc	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f6-b2f9-542a-507ca182c055	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f6-b2f9-8cb4-4c903f68c2ca	PA	PAN	591	Panama 	Panama	\N
00040000-55f6-b2f9-383c-93f2bb1ee9f2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f6-b2f9-efe4-8af5bb64f032	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f6-b2f9-7f3b-f7a4692173e3	PE	PER	604	Peru 	Peru	\N
00040000-55f6-b2f9-01e8-c8b5597246e3	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f6-b2f9-70f8-316662c82673	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f6-b2f9-9aa9-c9955c22e7b5	PL	POL	616	Poland 	Poljska	\N
00040000-55f6-b2f9-56e8-3b507b0047d2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f6-b2f9-71c0-464c29db3453	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f6-b2f9-5a48-88f5d41f3561	QA	QAT	634	Qatar 	Katar	\N
00040000-55f6-b2f9-6a6b-843ffd3bc649	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f6-b2f9-a650-4092991c4589	RO	ROU	642	Romania 	Romunija	\N
00040000-55f6-b2f9-0cb6-3ee5633c2d14	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f6-b2f9-8b9b-ffc423f9de6e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f6-b2f9-c104-2641595e9191	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f6-b2f9-eb62-0ee9e1a660b4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f6-b2f9-2dc7-1ecf93ef8c68	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f6-b2f9-1349-a19b7ab18b40	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f6-b2f9-6cb6-2755e14869d5	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f6-b2f9-126c-811066180920	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f6-b2f9-278d-831b32fddbf8	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f6-b2f9-6b7c-b754151e7bc1	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f6-b2f9-ef2d-b64cc99a22d4	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f6-b2f9-004d-a71012789ce8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f6-b2f9-9ba7-a3cf9241814b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f6-b2f9-2876-0519ae3ed48e	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f6-b2f9-7220-19254277c710	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f6-b2f9-a0e4-24f2c7e17d19	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f6-b2f9-7311-93914718ef83	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f6-b2f9-51d4-03faee428616	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f6-b2f9-4ccd-4e774a3a2693	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f6-b2f9-0250-c942922a0d6c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f6-b2f9-5eb7-190886dd4fd6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f6-b2f9-f828-902a9ff94eae	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f6-b2f9-a55b-edbbeb673da2	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f6-b2f9-748b-5bb78cdfee30	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f6-b2f9-a746-ebda2fc9803e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f6-b2f9-2ca9-a4d8930d0377	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f6-b2f9-d72c-e727979f964f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f6-b2f9-9eb2-f0dc262199e6	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f6-b2f9-a895-55513ffe29a1	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f6-b2f9-7d1b-789d32caad9b	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f6-b2f9-028a-65a986744ea4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f6-b2f9-521c-b6630df95f29	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f6-b2f9-4827-ce6b0d348867	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f6-b2f9-4270-a44e499b52ca	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f6-b2f9-67d8-106f625a8ec5	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f6-b2f9-2808-59c1790175df	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f6-b2f9-82e7-3557d67fc24c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f6-b2f9-b289-c55c0b5f3271	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f6-b2f9-a651-6873dd472b7e	TH	THA	764	Thailand 	Tajska	\N
00040000-55f6-b2f9-38ad-3a983387bb8a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f6-b2f9-3337-54a75d915ad5	TG	TGO	768	Togo 	Togo	\N
00040000-55f6-b2f9-335c-01c1b558a145	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f6-b2f9-3f1d-f16b985c1eeb	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f6-b2f9-9931-45c857742d58	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f6-b2f9-39ae-0bb7ba849af9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f6-b2f9-2005-2ca9466ff401	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f6-b2f9-c891-680c4b05737b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f6-b2f9-7b5d-7d076ed529b8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f6-b2f9-8375-c856332ebdee	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f6-b2f9-a262-d87009a67be4	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f6-b2f9-95b4-27584ef121c3	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f6-b2f9-420f-b53727dcaef6	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f6-b2f9-e0db-086bfd1c7a67	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f6-b2f9-0dfb-98cb0eb0f9d3	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f6-b2f9-b823-de03b760cccb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f6-b2f9-fe50-3963855b9fae	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f6-b2f9-6bd6-17f5033f5c9c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f6-b2f9-421e-2c40494a384e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f6-b2f9-55e3-9e918dcde358	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f6-b2f9-f2e4-ba72389d9612	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f6-b2f9-2c0a-6bc350dcaca1	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f6-b2f9-efe8-ef1a155064ec	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f6-b2f9-5354-c61f399f84ea	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f6-b2f9-bda9-1f25b2cd2d16	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f6-b2f9-9b24-8a5d165e2d57	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f6-b2f9-91b5-213f43bdaf20	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f6-b2f9-90d2-96532957ce9d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2988 (class 0 OID 19185300)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f6-b2fc-1263-bd7c62642fa2	000e0000-55f6-b2fc-1d33-465448b0d5e1	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-b2f9-0161-e43202d8913c	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f6-b2fc-6845-423de420b2cd	000e0000-55f6-b2fc-1f95-bb0384c63564	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-b2f9-cc2b-ff43f3c42870	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f6-b2fc-38b5-1103fea0edaf	000e0000-55f6-b2fc-d351-072cd25bedb1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-b2f9-0161-e43202d8913c	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f6-b2fc-5588-a1c775fbafae	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f6-b2fc-ea74-d3337cc3737d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 19185110)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f6-b2fc-84a2-2a0295b261ad	000e0000-55f6-b2fc-1f95-bb0384c63564	000c0000-55f6-b2fc-7c92-a83b38c72fd8	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f6-b2f9-ecf4-72783fa8d30e
000d0000-55f6-b2fc-fb10-461647e2f5d0	000e0000-55f6-b2fc-1f95-bb0384c63564	000c0000-55f6-b2fc-f28b-786026dde004	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f6-b2f9-b6bd-c81f242a17da
000d0000-55f6-b2fc-000e-42b48363349a	000e0000-55f6-b2fc-1f95-bb0384c63564	000c0000-55f6-b2fc-4a7d-a5e64a7f256b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f6-b2f9-3f76-e624077012e9
000d0000-55f6-b2fc-ef4d-154013aeeb17	000e0000-55f6-b2fc-1f95-bb0384c63564	000c0000-55f6-b2fc-5e3b-430fbb5c2e76	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f6-b2f9-c91b-bdfce4f8e3d6
000d0000-55f6-b2fc-e4fe-5cea6edf9000	000e0000-55f6-b2fc-1f95-bb0384c63564	000c0000-55f6-b2fc-387c-57d9e53da421	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f6-b2f9-c91b-bdfce4f8e3d6
000d0000-55f6-b2fc-2514-8d1c539564e5	000e0000-55f6-b2fc-1f95-bb0384c63564	000c0000-55f6-b2fc-62d0-c57c5ce621bd	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f6-b2f9-ecf4-72783fa8d30e
000d0000-55f6-b2fc-6dbf-895a71805b91	000e0000-55f6-b2fc-1f95-bb0384c63564	000c0000-55f6-b2fc-066d-3a04104d992a	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f6-b2f9-ecf4-72783fa8d30e
000d0000-55f6-b2fc-6918-96442450f937	000e0000-55f6-b2fc-1f95-bb0384c63564	000c0000-55f6-b2fc-b8da-262a0815b43c	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f6-b2f9-84bf-f1d16bf36142
000d0000-55f6-b2fc-8944-4bd8a3deef0a	000e0000-55f6-b2fc-1f95-bb0384c63564	000c0000-55f6-b2fc-4c23-383580d1ea17	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f6-b2f9-6143-f484d38414b0
\.


--
-- TOC entry 2954 (class 0 OID 19184925)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 19184906)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f6-b2fc-aacf-54827b2cfc84	00080000-55f6-b2fb-abc5-b6e4f9e74b5d	00090000-55f6-b2fc-99fc-632d9a38d0f5	AK		igralka
\.


--
-- TOC entry 2963 (class 0 OID 19185024)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 19185506)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19185518)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 19185540)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19185049)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19184863)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f6-b2fa-187a-c2aab316a908	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f6-b2fa-2d5a-00aea7348c8a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f6-b2fa-35d6-c2cf286ea7ae	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f6-b2fa-188d-c6775ccd6527	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f6-b2fa-2ed2-1c5cbc770c2f	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f6-b2fa-0874-c97fffa081d9	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f6-b2fa-e3e0-8824ec4284c6	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f6-b2fa-1726-9cb8d13593b3	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f6-b2fa-7c23-a55679f4fa9a	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f6-b2fa-13fc-299f1a1f55c2	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f6-b2fa-583c-80a4fd6bc57f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f6-b2fa-05aa-a338f3a93abb	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f6-b2fa-7f0d-dc6f26da8c2b	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f6-b2fa-f302-e4030a681453	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f6-b2fb-6e32-b48f3618bc66	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f6-b2fb-f759-7dbef13a5cab	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f6-b2fb-6bf9-2156a7a239bb	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f6-b2fb-0f59-1a6abea2a03d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f6-b2fb-7634-b4bdd0151e1a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f6-b2fd-3f77-4a90b2072da5	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2943 (class 0 OID 19184777)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f6-b2fb-3440-6751e31d44dd	00000000-55f6-b2fb-6e32-b48f3618bc66	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f6-b2fb-45b6-b1ec22934c39	00000000-55f6-b2fb-6e32-b48f3618bc66	00010000-55f6-b2fa-666a-0c38bb4f184a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f6-b2fb-e8be-bdd4b6d01726	00000000-55f6-b2fb-f759-7dbef13a5cab	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2944 (class 0 OID 19184788)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f6-b2fc-1941-75fda3ab7a04	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f6-b2fc-00c1-d4e84c38720b	00010000-55f6-b2fb-1080-7bf7ca0fc808	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f6-b2fc-d242-b91fadb57c14	00010000-55f6-b2fb-0fae-47ce882062b4	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f6-b2fc-612d-80554a2bcf85	00010000-55f6-b2fb-afd8-329a3b1ffc31	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f6-b2fc-46a7-3fe0b7cc9ad4	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f6-b2fc-5b3d-f79080a0e42a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f6-b2fc-51ce-b6d813a963a7	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f6-b2fc-71e8-35b0e955e75c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f6-b2fc-99fc-632d9a38d0f5	00010000-55f6-b2fb-ed45-69696c19cd86	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f6-b2fc-a668-2ca8e6f68035	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f6-b2fc-6613-047dd91a087d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f6-b2fc-5d8c-85e255f66f13	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f6-b2fc-96d6-399d4ac4511e	00010000-55f6-b2fb-c695-ca0a40e7f4c0	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 19184742)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f6-b2f9-62a8-b15ded04ee08	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f6-b2f9-3619-c294f40767a9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f6-b2f9-831e-49ee5ba23cc1	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f6-b2f9-c3de-b7adcba91ce9	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f6-b2f9-b228-e2aa987794c3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f6-b2f9-079b-068258178df5	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f6-b2f9-5baf-488a0f107ac4	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f6-b2f9-10ad-223974110144	Abonma-read	Abonma - branje	f
00030000-55f6-b2f9-d0a0-5e1c913a3f8f	Abonma-write	Abonma - spreminjanje	f
00030000-55f6-b2f9-9d7a-88e8346887a7	Alternacija-read	Alternacija - branje	f
00030000-55f6-b2f9-8763-17d5fdc40860	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f6-b2f9-b05f-0f6b5b69b246	Arhivalija-read	Arhivalija - branje	f
00030000-55f6-b2f9-2932-5e22eb2a644d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f6-b2f9-e176-83593e287cf8	Besedilo-read	Besedilo - branje	f
00030000-55f6-b2f9-a504-413f20271dbf	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f6-b2f9-3379-8afc563241ff	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f6-b2f9-7fd7-92c97707b58c	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f6-b2f9-e830-2eed226f62df	Dogodek-read	Dogodek - branje	f
00030000-55f6-b2f9-4b49-c24a945f1bf5	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f6-b2f9-a142-c0e4dd8ec250	DrugiVir-read	DrugiVir - branje	f
00030000-55f6-b2f9-c52f-ad35743970a3	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f6-b2f9-1c8f-7de2e5d96e57	Drzava-read	Drzava - branje	f
00030000-55f6-b2f9-147d-02e5fb0075f3	Drzava-write	Drzava - spreminjanje	f
00030000-55f6-b2f9-1e54-47540f091ea6	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f6-b2f9-7cd4-712156120d2c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f6-b2f9-1b21-1f6a0f7c0aa2	Funkcija-read	Funkcija - branje	f
00030000-55f6-b2f9-980b-a270c864cdfc	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f6-b2f9-7f0d-0abae1e7840b	Gostovanje-read	Gostovanje - branje	f
00030000-55f6-b2f9-02e2-e85c4ed6c49c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f6-b2f9-1fef-1c1f60c00813	Gostujoca-read	Gostujoca - branje	f
00030000-55f6-b2f9-b0d0-9017569c1e6b	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f6-b2f9-e226-16b2f3988006	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f6-b2f9-2e15-b32b2791812f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f6-b2f9-a2e4-05a320e13bff	Kupec-read	Kupec - branje	f
00030000-55f6-b2f9-aeb5-d5bf50889798	Kupec-write	Kupec - spreminjanje	f
00030000-55f6-b2f9-1988-9a6d1b39e63c	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f6-b2f9-ee74-06e2b67028af	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f6-b2f9-312e-f1e75a84d312	Option-read	Option - branje	f
00030000-55f6-b2f9-85cd-f1eb599b934f	Option-write	Option - spreminjanje	f
00030000-55f6-b2f9-f84d-94064ad0b8dd	OptionValue-read	OptionValue - branje	f
00030000-55f6-b2f9-0d30-05ddb2c35096	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f6-b2f9-ca3e-b02e248e89df	Oseba-read	Oseba - branje	f
00030000-55f6-b2f9-bec1-af9509c00d02	Oseba-write	Oseba - spreminjanje	f
00030000-55f6-b2f9-8ec4-642b6433bc80	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f6-b2f9-1537-620fc6c2cb72	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f6-b2f9-c81f-2953132a19fe	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f6-b2f9-4d5f-61503817c381	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f6-b2f9-1645-78ab1834debd	Pogodba-read	Pogodba - branje	f
00030000-55f6-b2f9-0aa0-eb6b254ddcf8	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f6-b2f9-33c6-23eb8daa00a8	Popa-read	Popa - branje	f
00030000-55f6-b2f9-7225-8bb19b93eed0	Popa-write	Popa - spreminjanje	f
00030000-55f6-b2f9-3443-9a4c8d583ec0	Posta-read	Posta - branje	f
00030000-55f6-b2f9-9de6-2086fe339a90	Posta-write	Posta - spreminjanje	f
00030000-55f6-b2f9-2507-45c7c2bd537a	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f6-b2f9-8d64-6ee042bafc2a	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f6-b2f9-1d71-fc569f3c9359	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f6-b2f9-843e-2b0e2f02f51f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f6-b2f9-a392-bbd7cd50a8b2	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f6-b2f9-1194-cfc9f4abd2b4	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f6-b2f9-35c2-3452088ce2ff	Predstava-read	Predstava - branje	f
00030000-55f6-b2f9-86fb-a6ebb5ed694b	Predstava-write	Predstava - spreminjanje	f
00030000-55f6-b2f9-8fc5-9c79c957ec4c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f6-b2f9-e0b3-a83fbda98c57	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f6-b2f9-4d90-2670222c628b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f6-b2f9-8be3-e19c9798bff5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f6-b2f9-f74e-0796c9cf3ec2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f6-b2f9-c104-ffd23ef2bd22	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f6-b2f9-93a3-38ff2822fb2d	ProgramDela-read	ProgramDela - branje	f
00030000-55f6-b2f9-2328-6d6012283efc	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f6-b2f9-b9a0-cb7c6953135d	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f6-b2f9-8687-372e9aa00a52	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f6-b2f9-f2ed-597d167383da	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f6-b2f9-0542-b73bfcf73dd3	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f6-b2f9-0319-f5520c05f592	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f6-b2f9-c67d-cd1cd9357876	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f6-b2f9-ed69-c34d339ad649	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f6-b2f9-8953-b48364935cae	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f6-b2f9-b935-ad2d9b07989e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f6-b2f9-c6db-a392eef39ece	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f6-b2f9-94fb-1edc0337186e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f6-b2f9-7a82-a444bc607718	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f6-b2f9-5f25-77134553b76f	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f6-b2f9-824a-018e54ddfc68	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f6-b2f9-c7b0-adebc8e1b7ff	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f6-b2f9-36fa-6148825f75ef	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f6-b2f9-c29e-d784ab5a4b32	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f6-b2f9-f830-6caf0a1b5b76	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f6-b2f9-c6fb-7a4b3145b43c	Prostor-read	Prostor - branje	f
00030000-55f6-b2f9-e24f-2168d5d0e8c0	Prostor-write	Prostor - spreminjanje	f
00030000-55f6-b2f9-83af-b380bb30f101	Racun-read	Racun - branje	f
00030000-55f6-b2f9-4121-10614507bed3	Racun-write	Racun - spreminjanje	f
00030000-55f6-b2f9-0fba-2236de0877df	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f6-b2f9-396a-dcab292e6257	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f6-b2f9-8148-0b34486d9bd9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f6-b2f9-2317-a98120805ac9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f6-b2f9-6cdb-bc4c9256604d	Rekvizit-read	Rekvizit - branje	f
00030000-55f6-b2f9-e26c-da51e0d151b6	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f6-b2f9-a9e3-5bba697ced01	Revizija-read	Revizija - branje	f
00030000-55f6-b2f9-a0cf-2368aeb3aaf5	Revizija-write	Revizija - spreminjanje	f
00030000-55f6-b2f9-e5bf-d479c3cc44b2	Rezervacija-read	Rezervacija - branje	f
00030000-55f6-b2f9-76cf-6ec743becf87	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f6-b2f9-1108-0555d4072a3a	SedezniRed-read	SedezniRed - branje	f
00030000-55f6-b2f9-4f11-ed47063265f0	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f6-b2f9-bb83-820cad766777	Sedez-read	Sedez - branje	f
00030000-55f6-b2f9-fa2d-b0551229974e	Sedez-write	Sedez - spreminjanje	f
00030000-55f6-b2f9-eaee-7101b8652045	Sezona-read	Sezona - branje	f
00030000-55f6-b2f9-4cf8-2b684c409066	Sezona-write	Sezona - spreminjanje	f
00030000-55f6-b2f9-cce0-e95e2c21686e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f6-b2f9-5621-fb5cf4f7caf7	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f6-b2f9-ad86-0dad0c73b51c	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f6-b2f9-6f37-fb332df50f8c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f6-b2f9-27f9-3a9a833a873b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f6-b2f9-4c8d-91821d0c2539	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f6-b2f9-7eb3-9e3f4411e409	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f6-b2f9-3463-05d384be1aae	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f6-b2f9-59b5-e06f31c99959	Telefonska-read	Telefonska - branje	f
00030000-55f6-b2f9-131f-0cff33f3f486	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f6-b2f9-b264-92456466d49a	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f6-b2f9-524c-f07b6e4abc18	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f6-b2f9-e147-b8825b4016a8	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f6-b2f9-6079-a69e494f1378	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f6-b2f9-82a2-d29aeeae6b04	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f6-b2f9-ea95-3cbd4b2545f3	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f6-b2f9-b04f-55268c94b5c2	Trr-read	Trr - branje	f
00030000-55f6-b2f9-0ad3-55720c0c0e8c	Trr-write	Trr - spreminjanje	f
00030000-55f6-b2f9-efae-518d7503320a	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f6-b2f9-c956-bf75de113b77	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f6-b2f9-78e4-422ef8f72b40	Vaja-read	Vaja - branje	f
00030000-55f6-b2f9-aa50-6425f3f66413	Vaja-write	Vaja - spreminjanje	f
00030000-55f6-b2f9-41db-f0cce5590d82	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f6-b2f9-a24e-af805c8150c2	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f6-b2f9-dcf9-337904578a24	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f6-b2f9-46ce-7a14a187adc3	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f6-b2f9-2b31-653b6d2e4456	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f6-b2f9-8860-780d0328ce59	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f6-b2f9-7df6-dc968b452b2d	Zasedenost-read	Zasedenost - branje	f
00030000-55f6-b2f9-45aa-65f03a7ef2fe	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f6-b2f9-96bf-7d50995bfb41	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f6-b2f9-a7fa-522ddc2c127f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f6-b2f9-f58a-775a50532690	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f6-b2f9-64a8-83f7dd0149b4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f6-b2f9-e7eb-544a92ce9511	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f6-b2f9-ac43-904cc5d2cb39	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f6-b2f9-0c67-b608590bd3e4	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f6-b2f9-7503-bf255df4cb61	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f6-b2f9-b9ea-b5944e30396e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f6-b2f9-c7d3-5cb4adc36785	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f6-b2f9-96ba-41343dece7a7	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f6-b2f9-00c8-15871939f21a	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f6-b2f9-bf16-03ce06bf66e4	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f6-b2f9-541b-42c6bcc2fa6d	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f6-b2f9-c000-50e43e5a84a4	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f6-b2f9-55bb-669809140de9	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2941 (class 0 OID 19184761)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f6-b2f9-e8b9-b7dd909638f0	00030000-55f6-b2f9-3619-c294f40767a9
00020000-55f6-b2f9-ab71-f8d900798f0f	00030000-55f6-b2f9-1c8f-7de2e5d96e57
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-10ad-223974110144
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-d0a0-5e1c913a3f8f
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-9d7a-88e8346887a7
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-8763-17d5fdc40860
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-b05f-0f6b5b69b246
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-e830-2eed226f62df
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-c3de-b7adcba91ce9
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-4b49-c24a945f1bf5
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-1c8f-7de2e5d96e57
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-147d-02e5fb0075f3
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-1b21-1f6a0f7c0aa2
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-980b-a270c864cdfc
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-7f0d-0abae1e7840b
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-02e2-e85c4ed6c49c
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-1fef-1c1f60c00813
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-b0d0-9017569c1e6b
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-e226-16b2f3988006
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-2e15-b32b2791812f
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-312e-f1e75a84d312
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-f84d-94064ad0b8dd
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-ca3e-b02e248e89df
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-bec1-af9509c00d02
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-33c6-23eb8daa00a8
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-7225-8bb19b93eed0
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-3443-9a4c8d583ec0
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-9de6-2086fe339a90
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-a392-bbd7cd50a8b2
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-1194-cfc9f4abd2b4
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-35c2-3452088ce2ff
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-86fb-a6ebb5ed694b
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-f74e-0796c9cf3ec2
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-c104-ffd23ef2bd22
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-c6fb-7a4b3145b43c
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-e24f-2168d5d0e8c0
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-8148-0b34486d9bd9
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-2317-a98120805ac9
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-6cdb-bc4c9256604d
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-e26c-da51e0d151b6
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-eaee-7101b8652045
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-4cf8-2b684c409066
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-e147-b8825b4016a8
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-efae-518d7503320a
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-c956-bf75de113b77
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-78e4-422ef8f72b40
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-aa50-6425f3f66413
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-7df6-dc968b452b2d
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-45aa-65f03a7ef2fe
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-96bf-7d50995bfb41
00020000-55f6-b2f9-870a-cac4322e6dae	00030000-55f6-b2f9-f58a-775a50532690
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-10ad-223974110144
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-b05f-0f6b5b69b246
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-e830-2eed226f62df
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-1c8f-7de2e5d96e57
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-7f0d-0abae1e7840b
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-1fef-1c1f60c00813
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-e226-16b2f3988006
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-2e15-b32b2791812f
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-312e-f1e75a84d312
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-f84d-94064ad0b8dd
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-ca3e-b02e248e89df
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-bec1-af9509c00d02
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-33c6-23eb8daa00a8
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-3443-9a4c8d583ec0
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-a392-bbd7cd50a8b2
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-1194-cfc9f4abd2b4
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-35c2-3452088ce2ff
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-c6fb-7a4b3145b43c
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-8148-0b34486d9bd9
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-6cdb-bc4c9256604d
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-eaee-7101b8652045
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-59b5-e06f31c99959
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-131f-0cff33f3f486
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-b04f-55268c94b5c2
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-0ad3-55720c0c0e8c
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-2b31-653b6d2e4456
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-8860-780d0328ce59
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-96bf-7d50995bfb41
00020000-55f6-b2f9-1fc6-0295256ebc1a	00030000-55f6-b2f9-f58a-775a50532690
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-10ad-223974110144
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-9d7a-88e8346887a7
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-b05f-0f6b5b69b246
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-2932-5e22eb2a644d
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-e176-83593e287cf8
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-3379-8afc563241ff
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-e830-2eed226f62df
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-1c8f-7de2e5d96e57
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-1b21-1f6a0f7c0aa2
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-7f0d-0abae1e7840b
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-1fef-1c1f60c00813
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-e226-16b2f3988006
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-312e-f1e75a84d312
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-f84d-94064ad0b8dd
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-ca3e-b02e248e89df
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-33c6-23eb8daa00a8
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-3443-9a4c8d583ec0
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-35c2-3452088ce2ff
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-f74e-0796c9cf3ec2
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-c6fb-7a4b3145b43c
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-8148-0b34486d9bd9
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-6cdb-bc4c9256604d
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-eaee-7101b8652045
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-e147-b8825b4016a8
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-78e4-422ef8f72b40
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-7df6-dc968b452b2d
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-96bf-7d50995bfb41
00020000-55f6-b2f9-398c-575e106efe59	00030000-55f6-b2f9-f58a-775a50532690
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-10ad-223974110144
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-d0a0-5e1c913a3f8f
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-8763-17d5fdc40860
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-b05f-0f6b5b69b246
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-e830-2eed226f62df
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-1c8f-7de2e5d96e57
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-7f0d-0abae1e7840b
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-1fef-1c1f60c00813
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-312e-f1e75a84d312
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-f84d-94064ad0b8dd
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-33c6-23eb8daa00a8
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-3443-9a4c8d583ec0
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-35c2-3452088ce2ff
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-c6fb-7a4b3145b43c
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-8148-0b34486d9bd9
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-6cdb-bc4c9256604d
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-eaee-7101b8652045
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-e147-b8825b4016a8
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-96bf-7d50995bfb41
00020000-55f6-b2f9-e22f-49383f327597	00030000-55f6-b2f9-f58a-775a50532690
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-10ad-223974110144
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-b05f-0f6b5b69b246
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-e830-2eed226f62df
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-1c8f-7de2e5d96e57
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-7f0d-0abae1e7840b
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-1fef-1c1f60c00813
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-312e-f1e75a84d312
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-f84d-94064ad0b8dd
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-33c6-23eb8daa00a8
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-3443-9a4c8d583ec0
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-35c2-3452088ce2ff
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-c6fb-7a4b3145b43c
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-8148-0b34486d9bd9
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-6cdb-bc4c9256604d
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-eaee-7101b8652045
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-b264-92456466d49a
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-831e-49ee5ba23cc1
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-e147-b8825b4016a8
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-96bf-7d50995bfb41
00020000-55f6-b2f9-7a2a-2396a924d28e	00030000-55f6-b2f9-f58a-775a50532690
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-62a8-b15ded04ee08
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-3619-c294f40767a9
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-831e-49ee5ba23cc1
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-c3de-b7adcba91ce9
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-b228-e2aa987794c3
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-079b-068258178df5
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-5baf-488a0f107ac4
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-10ad-223974110144
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-d0a0-5e1c913a3f8f
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-9d7a-88e8346887a7
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-8763-17d5fdc40860
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-b05f-0f6b5b69b246
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-2932-5e22eb2a644d
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-e176-83593e287cf8
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-a504-413f20271dbf
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-3379-8afc563241ff
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-7fd7-92c97707b58c
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-e830-2eed226f62df
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-4b49-c24a945f1bf5
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-1c8f-7de2e5d96e57
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-147d-02e5fb0075f3
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-a142-c0e4dd8ec250
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-c52f-ad35743970a3
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-1e54-47540f091ea6
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-7cd4-712156120d2c
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-1b21-1f6a0f7c0aa2
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-980b-a270c864cdfc
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-7f0d-0abae1e7840b
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-02e2-e85c4ed6c49c
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-1fef-1c1f60c00813
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-b0d0-9017569c1e6b
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-e226-16b2f3988006
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-2e15-b32b2791812f
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-a2e4-05a320e13bff
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-aeb5-d5bf50889798
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-1988-9a6d1b39e63c
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-ee74-06e2b67028af
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-312e-f1e75a84d312
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-85cd-f1eb599b934f
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-f84d-94064ad0b8dd
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-0d30-05ddb2c35096
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-ca3e-b02e248e89df
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-bec1-af9509c00d02
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-8ec4-642b6433bc80
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-1537-620fc6c2cb72
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-c81f-2953132a19fe
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-4d5f-61503817c381
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-1645-78ab1834debd
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-0aa0-eb6b254ddcf8
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-33c6-23eb8daa00a8
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-7225-8bb19b93eed0
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-3443-9a4c8d583ec0
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-9de6-2086fe339a90
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-2507-45c7c2bd537a
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-8d64-6ee042bafc2a
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-1d71-fc569f3c9359
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-843e-2b0e2f02f51f
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-a392-bbd7cd50a8b2
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-1194-cfc9f4abd2b4
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-35c2-3452088ce2ff
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-86fb-a6ebb5ed694b
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-8fc5-9c79c957ec4c
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-e0b3-a83fbda98c57
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-4d90-2670222c628b
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-8be3-e19c9798bff5
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-f74e-0796c9cf3ec2
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-c104-ffd23ef2bd22
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-93a3-38ff2822fb2d
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-2328-6d6012283efc
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-b9a0-cb7c6953135d
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-8687-372e9aa00a52
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-f2ed-597d167383da
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-0542-b73bfcf73dd3
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-0319-f5520c05f592
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-c67d-cd1cd9357876
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-ed69-c34d339ad649
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-8953-b48364935cae
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-b935-ad2d9b07989e
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-c6db-a392eef39ece
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-94fb-1edc0337186e
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-7a82-a444bc607718
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-5f25-77134553b76f
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-824a-018e54ddfc68
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-c7b0-adebc8e1b7ff
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-36fa-6148825f75ef
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-c29e-d784ab5a4b32
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-f830-6caf0a1b5b76
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-c6fb-7a4b3145b43c
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-e24f-2168d5d0e8c0
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-83af-b380bb30f101
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-4121-10614507bed3
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-0fba-2236de0877df
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-396a-dcab292e6257
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-8148-0b34486d9bd9
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-2317-a98120805ac9
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-6cdb-bc4c9256604d
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-e26c-da51e0d151b6
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-a9e3-5bba697ced01
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-a0cf-2368aeb3aaf5
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-e5bf-d479c3cc44b2
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-76cf-6ec743becf87
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-1108-0555d4072a3a
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-4f11-ed47063265f0
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-bb83-820cad766777
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-fa2d-b0551229974e
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-eaee-7101b8652045
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-4cf8-2b684c409066
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-cce0-e95e2c21686e
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-5621-fb5cf4f7caf7
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-ad86-0dad0c73b51c
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-6f37-fb332df50f8c
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-27f9-3a9a833a873b
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-4c8d-91821d0c2539
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-7eb3-9e3f4411e409
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-3463-05d384be1aae
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-59b5-e06f31c99959
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-131f-0cff33f3f486
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-b264-92456466d49a
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-524c-f07b6e4abc18
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-e147-b8825b4016a8
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-6079-a69e494f1378
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-82a2-d29aeeae6b04
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-ea95-3cbd4b2545f3
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-b04f-55268c94b5c2
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-0ad3-55720c0c0e8c
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-efae-518d7503320a
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-c956-bf75de113b77
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-78e4-422ef8f72b40
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-aa50-6425f3f66413
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-41db-f0cce5590d82
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-a24e-af805c8150c2
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-dcf9-337904578a24
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-46ce-7a14a187adc3
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-2b31-653b6d2e4456
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-8860-780d0328ce59
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-7df6-dc968b452b2d
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-45aa-65f03a7ef2fe
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-96bf-7d50995bfb41
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-a7fa-522ddc2c127f
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-f58a-775a50532690
00020000-55f6-b2fb-2887-8c1a085d1542	00030000-55f6-b2f9-64a8-83f7dd0149b4
\.


--
-- TOC entry 2968 (class 0 OID 19185056)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19185090)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 19185219)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f6-b2fc-a96b-f28cc0f8ceef	00090000-55f6-b2fc-1941-75fda3ab7a04	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f6-b2fc-a013-3a000a254f1a	00090000-55f6-b2fc-5b3d-f79080a0e42a	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f6-b2fc-bb69-a8f54cf0ff0c	00090000-55f6-b2fc-96d6-399d4ac4511e	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f6-b2fc-15f3-50fb70c45474	00090000-55f6-b2fc-a668-2ca8e6f68035	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2946 (class 0 OID 19184821)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f6-b2fb-abc5-b6e4f9e74b5d	00040000-55f6-b2f9-5eb7-190886dd4fd6	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-b2fb-8c98-6e012f893f46	00040000-55f6-b2f9-5eb7-190886dd4fd6	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f6-b2fb-6661-2421571bccae	00040000-55f6-b2f9-5eb7-190886dd4fd6	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-b2fb-bbd9-3acbc08c4fff	00040000-55f6-b2f9-5eb7-190886dd4fd6	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-b2fb-036e-53d95109a22e	00040000-55f6-b2f9-5eb7-190886dd4fd6	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-b2fb-6276-f023fec4d9b1	00040000-55f6-b2f9-cfbb-13f876424593	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-b2fb-bb0c-8979c5db7e47	00040000-55f6-b2f9-837c-616ab4b7ac3e	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-b2fb-9ced-9cbfff0d3d61	00040000-55f6-b2f9-d1e3-1a3f7fb7e57f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-b2fb-2f89-7ac660e2027b	00040000-55f6-b2f9-00cf-9c3e284e2ca2	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-b2fd-60c6-592436de3c45	00040000-55f6-b2f9-5eb7-190886dd4fd6	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2948 (class 0 OID 19184855)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f6-b2f8-ba20-4450d4bc8cd6	8341	Adlešiči
00050000-55f6-b2f8-0365-28d48ec9a567	5270	Ajdovščina
00050000-55f6-b2f8-08a2-cf310dc142ec	6280	Ankaran/Ancarano
00050000-55f6-b2f8-4d43-50e098114dbf	9253	Apače
00050000-55f6-b2f8-de6e-101ab7bebbe5	8253	Artiče
00050000-55f6-b2f8-b953-4067f88647d4	4275	Begunje na Gorenjskem
00050000-55f6-b2f8-ce00-721e5de53254	1382	Begunje pri Cerknici
00050000-55f6-b2f8-298f-f46f7d9bb804	9231	Beltinci
00050000-55f6-b2f8-37f2-22b1562b17f8	2234	Benedikt
00050000-55f6-b2f8-2bc4-04189fae4781	2345	Bistrica ob Dravi
00050000-55f6-b2f8-cc60-970f90ac846e	3256	Bistrica ob Sotli
00050000-55f6-b2f8-255f-cd6e35a10a23	8259	Bizeljsko
00050000-55f6-b2f8-2573-674fdcd87b17	1223	Blagovica
00050000-55f6-b2f8-4fc4-56a42d7e643c	8283	Blanca
00050000-55f6-b2f8-cff9-08487fff2145	4260	Bled
00050000-55f6-b2f8-89ea-2130d00d7c44	4273	Blejska Dobrava
00050000-55f6-b2f8-10a9-150e41712310	9265	Bodonci
00050000-55f6-b2f8-634a-5ac46046ac69	9222	Bogojina
00050000-55f6-b2f8-db60-9309c1067074	4263	Bohinjska Bela
00050000-55f6-b2f8-2af4-11a5c7ca0e1f	4264	Bohinjska Bistrica
00050000-55f6-b2f8-fbb7-434cf9b9d310	4265	Bohinjsko jezero
00050000-55f6-b2f8-1713-bec698e735d8	1353	Borovnica
00050000-55f6-b2f8-4136-915497f34140	8294	Boštanj
00050000-55f6-b2f8-8ed1-c0a049732b4c	5230	Bovec
00050000-55f6-b2f8-77c5-430482659c46	5295	Branik
00050000-55f6-b2f8-0715-681cb9cb930b	3314	Braslovče
00050000-55f6-b2f8-c72b-f730f6efafc6	5223	Breginj
00050000-55f6-b2f8-3c50-c1b7f4679d20	8280	Brestanica
00050000-55f6-b2f8-32ed-c400109e50b9	2354	Bresternica
00050000-55f6-b2f8-b8e6-87cf124b1704	4243	Brezje
00050000-55f6-b2f8-4cd4-c09c6bb85590	1351	Brezovica pri Ljubljani
00050000-55f6-b2f8-858e-38dc597978b3	8250	Brežice
00050000-55f6-b2f8-dfd3-7ccc750d46b6	4210	Brnik - Aerodrom
00050000-55f6-b2f8-b873-1b9de74e8d41	8321	Brusnice
00050000-55f6-b2f8-651a-c720e6a47985	3255	Buče
00050000-55f6-b2f8-a76d-f0b656b7ce5b	8276	Bučka 
00050000-55f6-b2f8-9cda-a728e2f86ecd	9261	Cankova
00050000-55f6-b2f8-b594-878d41e2ec43	3000	Celje 
00050000-55f6-b2f8-39e3-685ca5cd1877	3001	Celje - poštni predali
00050000-55f6-b2f8-f585-5cbe76fda72a	4207	Cerklje na Gorenjskem
00050000-55f6-b2f8-635a-d7d81f8482b2	8263	Cerklje ob Krki
00050000-55f6-b2f8-0907-75a742a9054e	1380	Cerknica
00050000-55f6-b2f8-eba2-c2ef9a4d7bd0	5282	Cerkno
00050000-55f6-b2f8-3f41-d7ce5a9f6217	2236	Cerkvenjak
00050000-55f6-b2f8-d03a-620b86b2964c	2215	Ceršak
00050000-55f6-b2f8-bac5-59ae1420ea96	2326	Cirkovce
00050000-55f6-b2f8-2b10-7f2d8b8d117b	2282	Cirkulane
00050000-55f6-b2f8-78d4-af8c4a1f1e6a	5273	Col
00050000-55f6-b2f8-9766-f88ab85119af	8251	Čatež ob Savi
00050000-55f6-b2f8-5d98-00032f2706d0	1413	Čemšenik
00050000-55f6-b2f8-4b59-e0481309d47b	5253	Čepovan
00050000-55f6-b2f8-f4e5-5b3eef12c56e	9232	Črenšovci
00050000-55f6-b2f8-9040-4a8487f3f35b	2393	Črna na Koroškem
00050000-55f6-b2f8-5656-393ef020b764	6275	Črni Kal
00050000-55f6-b2f8-4b55-8922cd0ba2f0	5274	Črni Vrh nad Idrijo
00050000-55f6-b2f8-25e8-d45b95d57ac0	5262	Črniče
00050000-55f6-b2f8-234d-7b0ec5b0f938	8340	Črnomelj
00050000-55f6-b2f8-90a0-dd403b8c92cd	6271	Dekani
00050000-55f6-b2f8-fc76-d1e60750860f	5210	Deskle
00050000-55f6-b2f8-242a-e3bdf854a2c9	2253	Destrnik
00050000-55f6-b2f8-6e04-5fa2e31cea3e	6215	Divača
00050000-55f6-b2f8-af54-83cd9adc57b6	1233	Dob
00050000-55f6-b2f8-b5c0-d06b23dfd34a	3224	Dobje pri Planini
00050000-55f6-b2f8-2234-9450502c061d	8257	Dobova
00050000-55f6-b2f8-1cd7-c94bc170b59d	1423	Dobovec
00050000-55f6-b2f8-2596-6e78a0019448	5263	Dobravlje
00050000-55f6-b2f8-8460-3174f82ffdfa	3204	Dobrna
00050000-55f6-b2f8-bdc3-c9409ebab8bb	8211	Dobrnič
00050000-55f6-b2f8-0eb4-7150a65d2cda	1356	Dobrova
00050000-55f6-b2f8-370d-ad192aa824b9	9223	Dobrovnik/Dobronak 
00050000-55f6-b2f8-8825-073aa33e4f27	5212	Dobrovo v Brdih
00050000-55f6-b2f8-a2cb-39d6aeb2be45	1431	Dol pri Hrastniku
00050000-55f6-b2f8-8371-b8d9776fb9b1	1262	Dol pri Ljubljani
00050000-55f6-b2f8-9692-7112dde62604	1273	Dole pri Litiji
00050000-55f6-b2f8-b20f-6f947361cba9	1331	Dolenja vas
00050000-55f6-b2f8-729b-4fe1abfd507a	8350	Dolenjske Toplice
00050000-55f6-b2f8-7c40-39a463f43d1e	1230	Domžale
00050000-55f6-b2f8-8a8a-343c0e45b023	2252	Dornava
00050000-55f6-b2f8-a274-0223aa69dd29	5294	Dornberk
00050000-55f6-b2f8-9c89-5bbcb49ccf2f	1319	Draga
00050000-55f6-b2f8-888e-5bbe50b71f71	8343	Dragatuš
00050000-55f6-b2f8-5254-7e38d0f4abe8	3222	Dramlje
00050000-55f6-b2f8-06df-647cc8cfbe5c	2370	Dravograd
00050000-55f6-b2f8-9ead-88811fb1ed89	4203	Duplje
00050000-55f6-b2f8-fb32-40ac3686cb32	6221	Dutovlje
00050000-55f6-b2f8-68d1-07e293b32c92	8361	Dvor
00050000-55f6-b2f8-0d2b-ec9edc2540fc	2343	Fala
00050000-55f6-b2f8-6c9a-a8abf3f208fc	9208	Fokovci
00050000-55f6-b2f8-34a1-93d29b3ddf3a	2313	Fram
00050000-55f6-b2f8-fff9-91a271992ff5	3213	Frankolovo
00050000-55f6-b2f8-f745-fbf3dd2980b3	1274	Gabrovka
00050000-55f6-b2f8-1a2d-ca204c5cf67f	8254	Globoko
00050000-55f6-b2f8-057c-948d28771ab4	5275	Godovič
00050000-55f6-b2f8-b2af-1cdb7bc5fb9d	4204	Golnik
00050000-55f6-b2f8-9a1c-958a6e41c861	3303	Gomilsko
00050000-55f6-b2f8-e8c5-0ef403cc6826	4224	Gorenja vas
00050000-55f6-b2f8-16bd-d712c1249285	3263	Gorica pri Slivnici
00050000-55f6-b2f8-a421-e01b5408f805	2272	Gorišnica
00050000-55f6-b2f8-d4a7-6cdc1868d83b	9250	Gornja Radgona
00050000-55f6-b2f8-a5e2-f2e6dd2c278b	3342	Gornji Grad
00050000-55f6-b2f8-373f-8754c88ca373	4282	Gozd Martuljek
00050000-55f6-b2f8-e121-3030d0eeda1b	6272	Gračišče
00050000-55f6-b2f8-d60f-0a10bfc8c7a4	9264	Grad
00050000-55f6-b2f8-ed02-408b9d59194f	8332	Gradac
00050000-55f6-b2f8-f9ad-fc7b4d6adc37	1384	Grahovo
00050000-55f6-b2f8-e07b-0bfddeba20fc	5242	Grahovo ob Bači
00050000-55f6-b2f8-6748-6ebf6fec8e54	5251	Grgar
00050000-55f6-b2f8-4f1e-b1dbebce88da	3302	Griže
00050000-55f6-b2f8-d4a4-8bd1e259225c	3231	Grobelno
00050000-55f6-b2f8-2d64-a3330bd7c7aa	1290	Grosuplje
00050000-55f6-b2f8-96fb-e0ac49a9ba5c	2288	Hajdina
00050000-55f6-b2f8-c12a-478b8d9ba829	8362	Hinje
00050000-55f6-b2f8-4e65-e242da0b02f2	2311	Hoče
00050000-55f6-b2f8-a848-a30c29c39981	9205	Hodoš/Hodos
00050000-55f6-b2f8-e031-5eb4a22e7d47	1354	Horjul
00050000-55f6-b2f8-55fb-777be743671d	1372	Hotedršica
00050000-55f6-b2f8-5097-7e0cdb3e149b	1430	Hrastnik
00050000-55f6-b2f8-26c3-8ba4c59aca2c	6225	Hruševje
00050000-55f6-b2f8-8aef-19ea52c82de4	4276	Hrušica
00050000-55f6-b2f8-33ff-5f01e8090eb3	5280	Idrija
00050000-55f6-b2f8-cafd-656efe3e8572	1292	Ig
00050000-55f6-b2f8-8946-b1c997a27b17	6250	Ilirska Bistrica
00050000-55f6-b2f8-25e2-d12ccfbf5766	6251	Ilirska Bistrica-Trnovo
00050000-55f6-b2f8-5e60-838dfe56d3a4	1295	Ivančna Gorica
00050000-55f6-b2f8-ddd3-0fcfdae6fb87	2259	Ivanjkovci
00050000-55f6-b2f8-b0f2-424c331266ed	1411	Izlake
00050000-55f6-b2f8-19c0-8f36c2f1eac9	6310	Izola/Isola
00050000-55f6-b2f8-40b7-35e756a4eaab	2222	Jakobski Dol
00050000-55f6-b2f8-3c29-678b6cf148c7	2221	Jarenina
00050000-55f6-b2f8-6835-069c341d4812	6254	Jelšane
00050000-55f6-b2f8-ab94-b59092fb2b4e	4270	Jesenice
00050000-55f6-b2f8-83ba-7de4d8940735	8261	Jesenice na Dolenjskem
00050000-55f6-b2f8-70d3-582e3836aa09	3273	Jurklošter
00050000-55f6-b2f8-4e37-877a05529429	2223	Jurovski Dol
00050000-55f6-b2f8-8c8b-35d56cf0606f	2256	Juršinci
00050000-55f6-b2f8-d17e-32ed5943edd0	5214	Kal nad Kanalom
00050000-55f6-b2f8-d37c-98b4ef74c725	3233	Kalobje
00050000-55f6-b2f8-2213-4295774c6577	4246	Kamna Gorica
00050000-55f6-b2f8-b70c-ba1625b0ced1	2351	Kamnica
00050000-55f6-b2f8-9801-79420c8cf8ff	1241	Kamnik
00050000-55f6-b2f8-6839-907ecb89ac46	5213	Kanal
00050000-55f6-b2f8-189e-c2bb1f8ab298	8258	Kapele
00050000-55f6-b2f8-d73b-126bc2bb84d5	2362	Kapla
00050000-55f6-b2f8-1b85-e1812b09132f	2325	Kidričevo
00050000-55f6-b2f8-5f75-3c822588d490	1412	Kisovec
00050000-55f6-b2f8-54fa-ab426589deab	6253	Knežak
00050000-55f6-b2f8-09b5-5263bc5a444a	5222	Kobarid
00050000-55f6-b2f8-451c-8e0c5b5962dd	9227	Kobilje
00050000-55f6-b2f8-8f28-f9e91d9526b4	1330	Kočevje
00050000-55f6-b2f8-c7dc-6982c387c68b	1338	Kočevska Reka
00050000-55f6-b2f8-081a-2813cb9d1f5a	2276	Kog
00050000-55f6-b2f8-c034-e253c74a413f	5211	Kojsko
00050000-55f6-b2f8-70c2-c202dcdd1e5a	6223	Komen
00050000-55f6-b2f8-3fc2-f85695a2823b	1218	Komenda
00050000-55f6-b2f8-d65c-d2b9f9155bef	6000	Koper/Capodistria 
00050000-55f6-b2f8-6b4e-0286f958ad42	6001	Koper/Capodistria - poštni predali
00050000-55f6-b2f8-7272-575ad72038db	8282	Koprivnica
00050000-55f6-b2f8-9d57-35c83a1ff5c1	5296	Kostanjevica na Krasu
00050000-55f6-b2f8-1263-9357610ab2c2	8311	Kostanjevica na Krki
00050000-55f6-b2f8-b62a-920c6a8a6e1b	1336	Kostel
00050000-55f6-b2f8-b8ad-5978af2bff80	6256	Košana
00050000-55f6-b2f8-c1dc-3b4de2517d69	2394	Kotlje
00050000-55f6-b2f8-1614-9fd7de59890e	6240	Kozina
00050000-55f6-b2f8-73b2-66e458500a20	3260	Kozje
00050000-55f6-b2f8-52ae-a02225ff1c1b	4000	Kranj 
00050000-55f6-b2f8-33cb-feea4aee6c40	4001	Kranj - poštni predali
00050000-55f6-b2f8-5b16-37cbb83ba098	4280	Kranjska Gora
00050000-55f6-b2f8-f5cc-bff2248b70e4	1281	Kresnice
00050000-55f6-b2f8-915e-28f7adec88ac	4294	Križe
00050000-55f6-b2f8-379a-f35e3c22bd19	9206	Križevci
00050000-55f6-b2f8-dda6-fd1f56836d3e	9242	Križevci pri Ljutomeru
00050000-55f6-b2f8-179c-f21b47ba8294	1301	Krka
00050000-55f6-b2f8-cf15-754368606e6b	8296	Krmelj
00050000-55f6-b2f8-f7a2-2200f58a2e31	4245	Kropa
00050000-55f6-b2f8-dbc7-ba5445e758ed	8262	Krška vas
00050000-55f6-b2f8-120f-eddcbdfd9fbd	8270	Krško
00050000-55f6-b2f8-c021-d288a9e14ca4	9263	Kuzma
00050000-55f6-b2f8-bc43-71714adbf525	2318	Laporje
00050000-55f6-b2f8-0b7c-c2162b4d91e1	3270	Laško
00050000-55f6-b2f8-e145-904cab386aea	1219	Laze v Tuhinju
00050000-55f6-b2f8-a399-ee2998d6460e	2230	Lenart v Slovenskih goricah
00050000-55f6-b2f8-9cfa-4efdee33e9a9	9220	Lendava/Lendva
00050000-55f6-b2f8-768d-0dd8e5b64b63	4248	Lesce
00050000-55f6-b2f8-e1f2-0c354f5ca2c7	3261	Lesično
00050000-55f6-b2f8-ad30-91e118133bf3	8273	Leskovec pri Krškem
00050000-55f6-b2f8-0a59-e3e94d2cde08	2372	Libeliče
00050000-55f6-b2f8-fbe0-ebc982204dbb	2341	Limbuš
00050000-55f6-b2f8-d563-a5a51895f5cd	1270	Litija
00050000-55f6-b2f8-4e0a-73d46433d459	3202	Ljubečna
00050000-55f6-b2f8-b1d2-179fae6f4f7e	1000	Ljubljana 
00050000-55f6-b2f8-28da-f5f3751c8f50	1001	Ljubljana - poštni predali
00050000-55f6-b2f8-d06b-46917f8b03e0	1231	Ljubljana - Črnuče
00050000-55f6-b2f8-9071-7eb55902b4e2	1261	Ljubljana - Dobrunje
00050000-55f6-b2f8-10fb-b7ae83675370	1260	Ljubljana - Polje
00050000-55f6-b2f8-8f0d-c4d01838ca3e	1210	Ljubljana - Šentvid
00050000-55f6-b2f8-c300-8ff076bdd5e6	1211	Ljubljana - Šmartno
00050000-55f6-b2f8-5b3b-ebb5cd7ba56d	3333	Ljubno ob Savinji
00050000-55f6-b2f8-823d-d92b4b080b5d	9240	Ljutomer
00050000-55f6-b2f8-7a20-0b6d5eadb3a6	3215	Loče
00050000-55f6-b2f8-09f0-9aafa6b6ec74	5231	Log pod Mangartom
00050000-55f6-b2f8-b23b-8087252bbe30	1358	Log pri Brezovici
00050000-55f6-b2f8-4e85-8b69cbe99096	1370	Logatec
00050000-55f6-b2f8-2da4-f8fba23e6b08	1371	Logatec
00050000-55f6-b2f8-c48d-44dfd32beb76	1434	Loka pri Zidanem Mostu
00050000-55f6-b2f8-594c-678562e97e50	3223	Loka pri Žusmu
00050000-55f6-b2f8-74d9-3b24368d8662	6219	Lokev
00050000-55f6-b2f8-3bec-f88fefd78f04	1318	Loški Potok
00050000-55f6-b2f8-07bd-97b1ab11c902	2324	Lovrenc na Dravskem polju
00050000-55f6-b2f8-0fb1-3cc3c3f3385f	2344	Lovrenc na Pohorju
00050000-55f6-b2f8-f0cf-124147d9f95e	3334	Luče
00050000-55f6-b2f8-8270-4d90a4f355c6	1225	Lukovica
00050000-55f6-b2f8-e258-a173da88d493	9202	Mačkovci
00050000-55f6-b2f8-6656-fcd2d5b09ef6	2322	Majšperk
00050000-55f6-b2f8-dcd8-8877f66cd169	2321	Makole
00050000-55f6-b2f8-05a6-bace1ae1e2ab	9243	Mala Nedelja
00050000-55f6-b2f8-8974-dd7452770ef5	2229	Malečnik
00050000-55f6-b2f8-4395-42f1f35c1976	6273	Marezige
00050000-55f6-b2f8-27e1-774765e3d231	2000	Maribor 
00050000-55f6-b2f8-b798-69dc3ae8a3db	2001	Maribor - poštni predali
00050000-55f6-b2f8-1a36-b93267ea10bb	2206	Marjeta na Dravskem polju
00050000-55f6-b2f8-ef80-ba0e69db03df	2281	Markovci
00050000-55f6-b2f8-9db4-54a2f7264b70	9221	Martjanci
00050000-55f6-b2f8-0067-9198f3ab2c47	6242	Materija
00050000-55f6-b2f8-dfab-a6bad2ef81cf	4211	Mavčiče
00050000-55f6-b2f8-1201-82d3cbbf31f9	1215	Medvode
00050000-55f6-b2f8-faf5-3906c4caa0c4	1234	Mengeš
00050000-55f6-b2f8-e76f-e3ea08a956e4	8330	Metlika
00050000-55f6-b2f8-0e9f-846864621b23	2392	Mežica
00050000-55f6-b2f8-023b-590ff4962913	2204	Miklavž na Dravskem polju
00050000-55f6-b2f8-5339-baa909c3a62b	2275	Miklavž pri Ormožu
00050000-55f6-b2f8-a0f9-581fc6715e2d	5291	Miren
00050000-55f6-b2f8-9699-ea03419736ea	8233	Mirna
00050000-55f6-b2f8-d340-37cabedcb3dc	8216	Mirna Peč
00050000-55f6-b2f8-9ece-657176cfe7bd	2382	Mislinja
00050000-55f6-b2f8-83f3-6b574803f3da	4281	Mojstrana
00050000-55f6-b2f8-a306-56efe170516f	8230	Mokronog
00050000-55f6-b2f8-7369-b0c9cd9db0a5	1251	Moravče
00050000-55f6-b2f8-5eae-c667e646f3b3	9226	Moravske Toplice
00050000-55f6-b2f8-7263-ece4731041f4	5216	Most na Soči
00050000-55f6-b2f8-b26d-bf920a522804	1221	Motnik
00050000-55f6-b2f8-7d55-30f23c67c0b0	3330	Mozirje
00050000-55f6-b2f8-6e16-2cd51af721b3	9000	Murska Sobota 
00050000-55f6-b2f8-6630-bb6cecafe45f	9001	Murska Sobota - poštni predali
00050000-55f6-b2f8-b8e2-a63dc80863ad	2366	Muta
00050000-55f6-b2f8-5efb-756ccbfd51fc	4202	Naklo
00050000-55f6-b2f8-5f56-7c080cb4fa75	3331	Nazarje
00050000-55f6-b2f8-5871-adfc80002773	1357	Notranje Gorice
00050000-55f6-b2f8-fad0-56c526d8614b	3203	Nova Cerkev
00050000-55f6-b2f8-4216-04f2350a9353	5000	Nova Gorica 
00050000-55f6-b2f8-9062-e5f65c2ec089	5001	Nova Gorica - poštni predali
00050000-55f6-b2f8-32c1-905ef8ac133c	1385	Nova vas
00050000-55f6-b2f8-18d1-9a9365cd9930	8000	Novo mesto
00050000-55f6-b2f8-7fde-3333a2f04648	8001	Novo mesto - poštni predali
00050000-55f6-b2f8-6ae8-afbaca645471	6243	Obrov
00050000-55f6-b2f8-6dbc-069a913e0b2f	9233	Odranci
00050000-55f6-b2f8-f7d2-0f113feff51c	2317	Oplotnica
00050000-55f6-b2f8-ea6f-64e30e37ea53	2312	Orehova vas
00050000-55f6-b2f8-07f6-a2f1734b1e0e	2270	Ormož
00050000-55f6-b2f8-4eed-20f320154fae	1316	Ortnek
00050000-55f6-b2f8-b327-042dfed14526	1337	Osilnica
00050000-55f6-b2f8-f82b-d209198cfd96	8222	Otočec
00050000-55f6-b2f8-b808-9f6241c5b0fa	2361	Ožbalt
00050000-55f6-b2f8-c84c-ae0f0026f4d4	2231	Pernica
00050000-55f6-b2f8-5897-2eed8b883272	2211	Pesnica pri Mariboru
00050000-55f6-b2f8-4c80-4b603b6a9c83	9203	Petrovci
00050000-55f6-b2f8-6a09-b8647bcba32b	3301	Petrovče
00050000-55f6-b2f8-3819-ccebbd7a3fcf	6330	Piran/Pirano
00050000-55f6-b2f8-e66c-7f4881813c93	8255	Pišece
00050000-55f6-b2f8-6629-83b575fb0f0a	6257	Pivka
00050000-55f6-b2f8-d41d-cac65615139f	6232	Planina
00050000-55f6-b2f8-27e3-8280675760a3	3225	Planina pri Sevnici
00050000-55f6-b2f8-255a-2bd6164cfa4f	6276	Pobegi
00050000-55f6-b2f8-6b05-8362f26b7f59	8312	Podbočje
00050000-55f6-b2f8-f1cb-0766ae0aea51	5243	Podbrdo
00050000-55f6-b2f8-7ce2-c55ed607b234	3254	Podčetrtek
00050000-55f6-b2f8-f004-cb50511d935d	2273	Podgorci
00050000-55f6-b2f8-dd03-fbbbca386626	6216	Podgorje
00050000-55f6-b2f8-c82b-977d551753d9	2381	Podgorje pri Slovenj Gradcu
00050000-55f6-b2f8-50ca-ca0fc5b9766d	6244	Podgrad
00050000-55f6-b2f8-bf13-f78d34dbfe45	1414	Podkum
00050000-55f6-b2f8-9014-71224bbf4ec9	2286	Podlehnik
00050000-55f6-b2f8-61bd-dfba84a76850	5272	Podnanos
00050000-55f6-b2f8-f07f-9611054242cc	4244	Podnart
00050000-55f6-b2f8-48bc-fc96d828e6a5	3241	Podplat
00050000-55f6-b2f8-6386-539e56d70bf4	3257	Podsreda
00050000-55f6-b2f8-7555-83c2a295d8aa	2363	Podvelka
00050000-55f6-b2f8-9bb1-da3fe82e5b13	2208	Pohorje
00050000-55f6-b2f8-e393-79d93391c391	2257	Polenšak
00050000-55f6-b2f8-f33f-654e5e4e1431	1355	Polhov Gradec
00050000-55f6-b2f8-f262-cb42376e5a7e	4223	Poljane nad Škofjo Loko
00050000-55f6-b2f8-d434-4debbab6a812	2319	Poljčane
00050000-55f6-b2f8-b5dc-4e8d98898dfc	1272	Polšnik
00050000-55f6-b2f8-2e43-53f967221257	3313	Polzela
00050000-55f6-b2f8-d8af-2669c1ec7502	3232	Ponikva
00050000-55f6-b2f8-cb1b-1fe92bb0ec20	6320	Portorož/Portorose
00050000-55f6-b2f8-4afe-94e98aebb015	6230	Postojna
00050000-55f6-b2f8-6531-915a90946e17	2331	Pragersko
00050000-55f6-b2f8-f201-48daf7eca712	3312	Prebold
00050000-55f6-b2f8-286b-d94ddb5e2644	4205	Preddvor
00050000-55f6-b2f8-99bb-a6463024ea7d	6255	Prem
00050000-55f6-b2f8-4750-3f5778dad1dc	1352	Preserje
00050000-55f6-b2f8-012c-a975ef57c1f0	6258	Prestranek
00050000-55f6-b2f8-cf94-4ae888399090	2391	Prevalje
00050000-55f6-b2f8-330b-8458ca8582d7	3262	Prevorje
00050000-55f6-b2f8-d782-024d2501aa4f	1276	Primskovo 
00050000-55f6-b2f8-859f-398630b95578	3253	Pristava pri Mestinju
00050000-55f6-b2f8-d5f7-14cc6d32743a	9207	Prosenjakovci/Partosfalva
00050000-55f6-b2f8-3668-92d30edd859c	5297	Prvačina
00050000-55f6-b2f8-ef78-ded6f93d8a05	2250	Ptuj
00050000-55f6-b2f8-ce13-052dd93a13af	2323	Ptujska Gora
00050000-55f6-b2f8-2add-319b24b70b11	9201	Puconci
00050000-55f6-b2f8-d111-545d6eb7e556	2327	Rače
00050000-55f6-b2f8-63be-1cf3840aa0ce	1433	Radeče
00050000-55f6-b2f8-5f87-6c8f7694bbb8	9252	Radenci
00050000-55f6-b2f8-f835-5bde5235a15e	2360	Radlje ob Dravi
00050000-55f6-b2f8-d679-bb46db4dccd5	1235	Radomlje
00050000-55f6-b2f8-281d-bef5fda301b6	4240	Radovljica
00050000-55f6-b2f8-465f-358aa6763c61	8274	Raka
00050000-55f6-b2f8-ac53-792a44a446ee	1381	Rakek
00050000-55f6-b2f8-88e1-31700992bf75	4283	Rateče - Planica
00050000-55f6-b2f8-7a5f-0a08ee975f84	2390	Ravne na Koroškem
00050000-55f6-b2f8-f9bb-665ae78da757	9246	Razkrižje
00050000-55f6-b2f8-b968-70a27cc89cbe	3332	Rečica ob Savinji
00050000-55f6-b2f8-c0e3-e2a9cab9f49c	5292	Renče
00050000-55f6-b2f8-abcb-cec093d638ec	1310	Ribnica
00050000-55f6-b2f8-19bc-668e1866edfa	2364	Ribnica na Pohorju
00050000-55f6-b2f8-9cd2-de88106ac438	3272	Rimske Toplice
00050000-55f6-b2f8-6220-2f2899f545bf	1314	Rob
00050000-55f6-b2f8-90ba-cd242fadc8fa	5215	Ročinj
00050000-55f6-b2f8-336f-cea5696ca351	3250	Rogaška Slatina
00050000-55f6-b2f8-d091-fd8781d1c85f	9262	Rogašovci
00050000-55f6-b2f8-3a90-f8c4bdde36a8	3252	Rogatec
00050000-55f6-b2f8-37ee-471f3d1b1d42	1373	Rovte
00050000-55f6-b2f8-dcbc-44858d08bbaf	2342	Ruše
00050000-55f6-b2f8-0183-cf22804b1cda	1282	Sava
00050000-55f6-b2f8-f1ab-631b133bd65b	6333	Sečovlje/Sicciole
00050000-55f6-b2f8-00cd-1753bb845e59	4227	Selca
00050000-55f6-b2f8-73f8-bd3ecc909b5f	2352	Selnica ob Dravi
00050000-55f6-b2f8-6732-304e69a7f651	8333	Semič
00050000-55f6-b2f8-f259-08f820d7518e	8281	Senovo
00050000-55f6-b2f8-9257-cf74923b100f	6224	Senožeče
00050000-55f6-b2f8-f74a-d0bef65b8d29	8290	Sevnica
00050000-55f6-b2f8-7448-26c220326b78	6210	Sežana
00050000-55f6-b2f8-cda5-ccebec6c6f2f	2214	Sladki Vrh
00050000-55f6-b2f8-ae9d-f69b948e9c60	5283	Slap ob Idrijci
00050000-55f6-b2f8-7f91-68153b684891	2380	Slovenj Gradec
00050000-55f6-b2f8-f3b6-e6c3687da0cb	2310	Slovenska Bistrica
00050000-55f6-b2f8-5700-c8a24cc0aca9	3210	Slovenske Konjice
00050000-55f6-b2f8-5a3c-6fd7555b936d	1216	Smlednik
00050000-55f6-b2f8-e332-aae497db157d	5232	Soča
00050000-55f6-b2f8-fae7-cdfd5567e9d6	1317	Sodražica
00050000-55f6-b2f8-8c43-a04b8056b45f	3335	Solčava
00050000-55f6-b2f8-b21e-7ce71588463e	5250	Solkan
00050000-55f6-b2f8-3ff8-796df1d9f3b4	4229	Sorica
00050000-55f6-b2f8-da83-ed9c8a8aaa53	4225	Sovodenj
00050000-55f6-b2f8-bc5c-3f59dde3066a	5281	Spodnja Idrija
00050000-55f6-b2f8-6ea3-496aeb128614	2241	Spodnji Duplek
00050000-55f6-b2f8-0571-5b62e92032b9	9245	Spodnji Ivanjci
00050000-55f6-b2f8-822b-8d6ece2937e5	2277	Središče ob Dravi
00050000-55f6-b2f8-44c5-462bdb17227a	4267	Srednja vas v Bohinju
00050000-55f6-b2f8-ab8a-3fa420a1aa7d	8256	Sromlje 
00050000-55f6-b2f8-a1cc-00a330d50440	5224	Srpenica
00050000-55f6-b2f8-0cd9-74f58ac471bd	1242	Stahovica
00050000-55f6-b2f8-0445-d28487c048e8	1332	Stara Cerkev
00050000-55f6-b2f8-8d8e-abf5babe0c2f	8342	Stari trg ob Kolpi
00050000-55f6-b2f8-3cee-4aa19c1a525e	1386	Stari trg pri Ložu
00050000-55f6-b2f8-4aa5-5842d00e75c8	2205	Starše
00050000-55f6-b2f8-64b7-9dbecbad89de	2289	Stoperce
00050000-55f6-b2f8-1cee-26e7bc4cd46c	8322	Stopiče
00050000-55f6-b2f8-134b-1f453adc7780	3206	Stranice
00050000-55f6-b2f8-d520-7ad2254383c8	8351	Straža
00050000-55f6-b2f8-a6d3-ee7a7837e5f7	1313	Struge
00050000-55f6-b2f8-3f9d-8d58488a9b9d	8293	Studenec
00050000-55f6-b2f8-e6e4-06af0c9ab241	8331	Suhor
00050000-55f6-b2f8-b588-f0292f7dc63f	2233	Sv. Ana v Slovenskih goricah
00050000-55f6-b2f8-c486-3fea9f278251	2235	Sv. Trojica v Slovenskih goricah
00050000-55f6-b2f8-656a-b46a0f249ff6	2353	Sveti Duh na Ostrem Vrhu
00050000-55f6-b2f8-8e51-91149d6ff042	9244	Sveti Jurij ob Ščavnici
00050000-55f6-b2f8-cbf7-808759b0aa25	3264	Sveti Štefan
00050000-55f6-b2f8-2d29-ebc09dde82ea	2258	Sveti Tomaž
00050000-55f6-b2f8-61fc-478b4fe7052e	9204	Šalovci
00050000-55f6-b2f8-6635-359603852b2d	5261	Šempas
00050000-55f6-b2f8-30a3-d8edff952a18	5290	Šempeter pri Gorici
00050000-55f6-b2f8-dbf4-c7aa2ed9c533	3311	Šempeter v Savinjski dolini
00050000-55f6-b2f8-70cc-184073d2611c	4208	Šenčur
00050000-55f6-b2f8-7541-bbf2806e5677	2212	Šentilj v Slovenskih goricah
00050000-55f6-b2f8-17d7-928664746169	8297	Šentjanž
00050000-55f6-b2f8-5467-5569dab9f08b	2373	Šentjanž pri Dravogradu
00050000-55f6-b2f8-eb0a-e408d851d8ce	8310	Šentjernej
00050000-55f6-b2f8-80b8-71094c97f1af	3230	Šentjur
00050000-55f6-b2f8-fca5-09540f84041b	3271	Šentrupert
00050000-55f6-b2f8-1f19-f5fb6dd0203e	8232	Šentrupert
00050000-55f6-b2f8-1b46-60e7ae3e64d4	1296	Šentvid pri Stični
00050000-55f6-b2f8-3e8c-bd1126f93ea5	8275	Škocjan
00050000-55f6-b2f8-c541-228deb4d1858	6281	Škofije
00050000-55f6-b2f8-8e70-ac69a10aa537	4220	Škofja Loka
00050000-55f6-b2f8-dbc5-66a2b4346087	3211	Škofja vas
00050000-55f6-b2f8-ed4b-5cacd745d741	1291	Škofljica
00050000-55f6-b2f8-bb6c-1788e40ce098	6274	Šmarje
00050000-55f6-b2f8-4b37-4f457b00e3e2	1293	Šmarje - Sap
00050000-55f6-b2f8-b5b2-c74ef2eb1783	3240	Šmarje pri Jelšah
00050000-55f6-b2f8-eebf-89156dbcc035	8220	Šmarješke Toplice
00050000-55f6-b2f8-5c4b-c5bc93063fa3	2315	Šmartno na Pohorju
00050000-55f6-b2f8-77aa-e65fb8494824	3341	Šmartno ob Dreti
00050000-55f6-b2f8-0670-32030a5ca9e6	3327	Šmartno ob Paki
00050000-55f6-b2f8-e54b-a5b93bc2f059	1275	Šmartno pri Litiji
00050000-55f6-b2f8-7a61-6f6a9040a991	2383	Šmartno pri Slovenj Gradcu
00050000-55f6-b2f8-c2cc-f9ceed16b92e	3201	Šmartno v Rožni dolini
00050000-55f6-b2f8-12cd-ed02e9024e29	3325	Šoštanj
00050000-55f6-b2f8-6c21-cc79039b5226	6222	Štanjel
00050000-55f6-b2f8-4390-cfd0bc81f7b4	3220	Štore
00050000-55f6-b2f8-1a90-05862f359236	3304	Tabor
00050000-55f6-b2f8-738b-e4db4f61a091	3221	Teharje
00050000-55f6-b2f8-852b-6dbf439faad2	9251	Tišina
00050000-55f6-b2f8-4010-8eece47f9dd2	5220	Tolmin
00050000-55f6-b2f8-37c2-94db3e228141	3326	Topolšica
00050000-55f6-b2f8-fcd1-292cea202e45	2371	Trbonje
00050000-55f6-b2f8-8eeb-868eb9abd2dc	1420	Trbovlje
00050000-55f6-b2f8-a551-aa4a157b7065	8231	Trebelno 
00050000-55f6-b2f8-5d7a-9fcf5b0e5ed4	8210	Trebnje
00050000-55f6-b2f8-84d8-999afba76c35	5252	Trnovo pri Gorici
00050000-55f6-b2f8-23e2-86de30e86be8	2254	Trnovska vas
00050000-55f6-b2f8-ee53-f60c608c0667	1222	Trojane
00050000-55f6-b2f8-c932-815b41014db0	1236	Trzin
00050000-55f6-b2f8-dced-758017ac4a7b	4290	Tržič
00050000-55f6-b2f8-a777-c555d6628c5e	8295	Tržišče
00050000-55f6-b2f8-32bc-70b97a8fd342	1311	Turjak
00050000-55f6-b2f8-66aa-680b5cf48b04	9224	Turnišče
00050000-55f6-b2f8-680a-3ae804cd3d09	8323	Uršna sela
00050000-55f6-b2f8-91b3-14cce916e85f	1252	Vače
00050000-55f6-b2f8-79cb-25c2a08eb4c7	3320	Velenje 
00050000-55f6-b2f8-4341-60d0b3ac3124	3322	Velenje - poštni predali
00050000-55f6-b2f8-5e49-aff8f7b97bdc	8212	Velika Loka
00050000-55f6-b2f8-abd1-673f8ce81375	2274	Velika Nedelja
00050000-55f6-b2f8-da11-703f2e3ebbe9	9225	Velika Polana
00050000-55f6-b2f8-d33f-94951d2ed5cd	1315	Velike Lašče
00050000-55f6-b2f8-e33a-f05a205ca42c	8213	Veliki Gaber
00050000-55f6-b2f8-5b2f-3b15167e3f4a	9241	Veržej
00050000-55f6-b2f8-4d28-1c724d7eeae7	1312	Videm - Dobrepolje
00050000-55f6-b2f8-ae0a-d7d1aa4cf7c9	2284	Videm pri Ptuju
00050000-55f6-b2f8-dcea-2391ddeb8f24	8344	Vinica
00050000-55f6-b2f8-fce7-861f8e1f9065	5271	Vipava
00050000-55f6-b2f8-c92f-d86a90247ad7	4212	Visoko
00050000-55f6-b2f8-0f4d-1f0098b259a0	1294	Višnja Gora
00050000-55f6-b2f8-05a1-6a4f27411e03	3205	Vitanje
00050000-55f6-b2f8-8527-a89c0f735b3e	2255	Vitomarci
00050000-55f6-b2f8-d9aa-9e990dbded47	1217	Vodice
00050000-55f6-b2f8-a454-c4003cd7ea2f	3212	Vojnik\t
00050000-55f6-b2f8-1d4a-64e2aaa61496	5293	Volčja Draga
00050000-55f6-b2f8-1aff-95e4353d1ad2	2232	Voličina
00050000-55f6-b2f8-2187-e93d311ebfe8	3305	Vransko
00050000-55f6-b2f8-50c3-8b29dcb7b917	6217	Vremski Britof
00050000-55f6-b2f8-90d7-0d7b777f0b1b	1360	Vrhnika
00050000-55f6-b2f8-0552-5d838d89254e	2365	Vuhred
00050000-55f6-b2f8-cb86-ea7ee2856120	2367	Vuzenica
00050000-55f6-b2f8-efff-c49076465414	8292	Zabukovje 
00050000-55f6-b2f8-812e-97a2c07a0e96	1410	Zagorje ob Savi
00050000-55f6-b2f8-fc3c-25f28b57fb21	1303	Zagradec
00050000-55f6-b2f8-119f-417d4dbbd142	2283	Zavrč
00050000-55f6-b2f8-6e24-3e8cec042e60	8272	Zdole 
00050000-55f6-b2f8-b2c0-f9e38522c32b	4201	Zgornja Besnica
00050000-55f6-b2f8-3337-58a115ab5f8e	2242	Zgornja Korena
00050000-55f6-b2f8-d635-fb5a45d533cd	2201	Zgornja Kungota
00050000-55f6-b2f8-1252-eee1d72bb322	2316	Zgornja Ložnica
00050000-55f6-b2f8-6bb5-14a0f5cf2654	2314	Zgornja Polskava
00050000-55f6-b2f8-10d6-b5ff85544418	2213	Zgornja Velka
00050000-55f6-b2f8-0238-127581f6ed03	4247	Zgornje Gorje
00050000-55f6-b2f8-de7a-185e2db06089	4206	Zgornje Jezersko
00050000-55f6-b2f8-ce4b-30fc99757291	2285	Zgornji Leskovec
00050000-55f6-b2f8-766b-66d8eb2bd883	1432	Zidani Most
00050000-55f6-b2f8-3d8c-587bb1013847	3214	Zreče
00050000-55f6-b2f8-5e7b-74e5d392a2b8	4209	Žabnica
00050000-55f6-b2f8-314e-5dc63a743a4c	3310	Žalec
00050000-55f6-b2f8-1cae-6220c0dd7214	4228	Železniki
00050000-55f6-b2f8-8fd4-3e16dd81ec03	2287	Žetale
00050000-55f6-b2f8-c1dc-0f78df70c87d	4226	Žiri
00050000-55f6-b2f8-1c1a-86545a04807d	4274	Žirovnica
00050000-55f6-b2f8-6ede-ec76ee6d70b0	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 19185398)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 19185030)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 19184840)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f6-b2fb-3af8-dc07b4a98f3a	00080000-55f6-b2fb-abc5-b6e4f9e74b5d	\N	00040000-55f6-b2f9-5eb7-190886dd4fd6	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f6-b2fb-6d1e-3d8e51e82ec1	00080000-55f6-b2fb-abc5-b6e4f9e74b5d	\N	00040000-55f6-b2f9-5eb7-190886dd4fd6	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f6-b2fc-6500-dd101ef67d00	00080000-55f6-b2fb-8c98-6e012f893f46	\N	00040000-55f6-b2f9-5eb7-190886dd4fd6	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 19184918)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19185042)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19185412)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19185422)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f6-b2fb-fc98-aaf1f2b026b2	00080000-55f6-b2fb-6661-2421571bccae	0987	AK
00190000-55f6-b2fb-b024-66abcc8737e0	00080000-55f6-b2fb-8c98-6e012f893f46	0989	AK
00190000-55f6-b2fb-20ce-1bbb0b21adf3	00080000-55f6-b2fb-bbd9-3acbc08c4fff	0986	AK
00190000-55f6-b2fb-fa83-3db41a62ede6	00080000-55f6-b2fb-6276-f023fec4d9b1	0984	AK
00190000-55f6-b2fb-f376-35da577576a6	00080000-55f6-b2fb-bb0c-8979c5db7e47	0983	AK
00190000-55f6-b2fb-cdd3-c9f4f4b96af2	00080000-55f6-b2fb-9ced-9cbfff0d3d61	0982	AK
00190000-55f6-b2fd-e6ef-e9a6652ff1c2	00080000-55f6-b2fd-60c6-592436de3c45	1001	AK
\.


--
-- TOC entry 2989 (class 0 OID 19185355)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f6-b2fc-e1c4-966107967a2d	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2993 (class 0 OID 19185430)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 19185071)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f6-b2fb-9bc5-82f132fab179	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f6-b2fb-be56-11d77c778f62	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f6-b2fb-d836-d37a79f0d637	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f6-b2fb-8352-02719585ba11	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f6-b2fb-cf6b-90c580accfdf	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f6-b2fb-024f-eeedb3a12f64	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f6-b2fb-8e14-adfdbe40a329	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2962 (class 0 OID 19185015)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19185005)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19185208)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19185145)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 19184713)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f6-b2fd-60c6-592436de3c45	00010000-55f6-b2fa-5b47-ca4ff0cc15e9	2015-09-14 13:43:57	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f6-b2fd-3f77-4a90b2072da5	00010000-55f6-b2fa-5b47-ca4ff0cc15e9	2015-09-14 13:43:57	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f6-b2fd-e6ef-e9a6652ff1c2	00010000-55f6-b2fa-5b47-ca4ff0cc15e9	2015-09-14 13:43:57	INS	a:0:{}
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2971 (class 0 OID 19185084)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 19184751)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f6-b2f9-e8b9-b7dd909638f0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f6-b2f9-ab71-f8d900798f0f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f6-b2f9-8ebe-c96a19f564d7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f6-b2f9-5a39-6b76d414928c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f6-b2f9-870a-cac4322e6dae	planer	Planer dogodkov v koledarju	t
00020000-55f6-b2f9-1fc6-0295256ebc1a	kadrovska	Kadrovska služba	t
00020000-55f6-b2f9-398c-575e106efe59	arhivar	Ažuriranje arhivalij	t
00020000-55f6-b2f9-e22f-49383f327597	igralec	Igralec	t
00020000-55f6-b2f9-7a2a-2396a924d28e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f6-b2fb-2887-8c1a085d1542	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2938 (class 0 OID 19184735)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f6-b2fa-666a-0c38bb4f184a	00020000-55f6-b2f9-8ebe-c96a19f564d7
00010000-55f6-b2fa-5b47-ca4ff0cc15e9	00020000-55f6-b2f9-8ebe-c96a19f564d7
00010000-55f6-b2fb-6ec1-b9c6378f14a1	00020000-55f6-b2fb-2887-8c1a085d1542
\.


--
-- TOC entry 2973 (class 0 OID 19185098)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19185036)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 19184982)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 19184700)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f6-b2f9-5079-640fe85b94d4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f6-b2f9-1d69-c7fdfacfbaf9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f6-b2f9-3bce-2ff5b358743e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f6-b2f9-40db-92621d31d169	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f6-b2f9-5a32-c3de99244260	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2933 (class 0 OID 19184692)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f6-b2f9-e9fd-0c88af835afe	00230000-55f6-b2f9-40db-92621d31d169	popa
00240000-55f6-b2f9-5c94-ce43f2e8798d	00230000-55f6-b2f9-40db-92621d31d169	oseba
00240000-55f6-b2f9-98a2-a354a6add905	00230000-55f6-b2f9-40db-92621d31d169	sezona
00240000-55f6-b2f9-e405-e3d6d6af7180	00230000-55f6-b2f9-1d69-c7fdfacfbaf9	prostor
00240000-55f6-b2f9-ee01-d84affab8dca	00230000-55f6-b2f9-40db-92621d31d169	besedilo
00240000-55f6-b2f9-3310-ad826e194ed8	00230000-55f6-b2f9-40db-92621d31d169	uprizoritev
00240000-55f6-b2f9-f943-84c2a706e19b	00230000-55f6-b2f9-40db-92621d31d169	funkcija
00240000-55f6-b2f9-ea41-126121a84350	00230000-55f6-b2f9-40db-92621d31d169	tipfunkcije
00240000-55f6-b2f9-0b0e-3c2d606ae260	00230000-55f6-b2f9-40db-92621d31d169	alternacija
00240000-55f6-b2f9-0c7b-810a19640cf4	00230000-55f6-b2f9-5079-640fe85b94d4	pogodba
00240000-55f6-b2f9-b45d-0b321ce8226e	00230000-55f6-b2f9-40db-92621d31d169	zaposlitev
00240000-55f6-b2f9-346a-91b16448e843	00230000-55f6-b2f9-40db-92621d31d169	zvrstuprizoritve
00240000-55f6-b2f9-ca27-1b260d36c829	00230000-55f6-b2f9-5079-640fe85b94d4	programdela
00240000-55f6-b2f9-7403-b88803104729	00230000-55f6-b2f9-40db-92621d31d169	zapis
\.


--
-- TOC entry 2932 (class 0 OID 19184687)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d3635bff-8d80-4749-83fc-36be688c3484	00240000-55f6-b2f9-e9fd-0c88af835afe	0	1001
\.


--
-- TOC entry 2978 (class 0 OID 19185155)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f6-b2fc-e1d6-07b0f28f8925	000e0000-55f6-b2fc-1f95-bb0384c63564	00080000-55f6-b2fb-abc5-b6e4f9e74b5d	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f6-b2f9-7a69-61992020858a
00270000-55f6-b2fc-4d2a-570bd80255f6	000e0000-55f6-b2fc-1f95-bb0384c63564	00080000-55f6-b2fb-abc5-b6e4f9e74b5d	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f6-b2f9-7a69-61992020858a
\.


--
-- TOC entry 2945 (class 0 OID 19184813)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 19184992)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f6-b2fc-3be6-3d2c3a581b14	00180000-55f6-b2fc-e254-c908bf4715e8	000c0000-55f6-b2fc-7c92-a83b38c72fd8	00090000-55f6-b2fc-99fc-632d9a38d0f5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-b2fc-4806-74df7d7afb12	00180000-55f6-b2fc-e254-c908bf4715e8	000c0000-55f6-b2fc-f28b-786026dde004	00090000-55f6-b2fc-a668-2ca8e6f68035	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-b2fc-081e-e173a6c74cf0	00180000-55f6-b2fc-e254-c908bf4715e8	000c0000-55f6-b2fc-4a7d-a5e64a7f256b	00090000-55f6-b2fc-d242-b91fadb57c14	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-b2fc-bfe9-6d394633ac93	00180000-55f6-b2fc-e254-c908bf4715e8	000c0000-55f6-b2fc-5e3b-430fbb5c2e76	00090000-55f6-b2fc-00c1-d4e84c38720b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-b2fc-68d5-1711ed516c4f	00180000-55f6-b2fc-e254-c908bf4715e8	000c0000-55f6-b2fc-387c-57d9e53da421	00090000-55f6-b2fc-5d8c-85e255f66f13	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-b2fc-2bcd-fd8fa2ae2f86	00180000-55f6-b2fc-6c09-4b8cdcf76688	\N	00090000-55f6-b2fc-5d8c-85e255f66f13	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2981 (class 0 OID 19185196)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f6-b2f9-6143-f484d38414b0	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f6-b2f9-1fec-63518c79cb03	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f6-b2f9-c1d0-9b11dff88413	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f6-b2f9-b6bd-c81f242a17da	04	Režija	Režija	Režija	umetnik
000f0000-55f6-b2f9-5c22-b60d52047202	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f6-b2f9-9f2d-5a0cbfe12cdc	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f6-b2f9-a358-fcbecf1fc14e	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f6-b2f9-e506-6bb1e887bb29	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f6-b2f9-2a1b-767b301ae637	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f6-b2f9-07a0-eec716d72f64	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f6-b2f9-84bf-f1d16bf36142	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f6-b2f9-80cc-1a3f77605a0f	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f6-b2f9-7160-6fdf5de5be4c	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f6-b2f9-90a4-0d6fc62b13ff	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f6-b2f9-ecf4-72783fa8d30e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f6-b2f9-488c-e943aef5dea7	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f6-b2f9-c91b-bdfce4f8e3d6	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f6-b2f9-3f76-e624077012e9	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2994 (class 0 OID 19185440)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f6-b2f9-7750-37452540efde	01	Velika predstava	f	1.00	1.00
002b0000-55f6-b2f9-3ecc-b1e4d5f67892	02	Mala predstava	f	0.50	0.50
002b0000-55f6-b2f9-82b2-358c37878a85	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f6-b2f9-0161-e43202d8913c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f6-b2f9-cc2b-ff43f3c42870	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2950 (class 0 OID 19184875)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 19184722)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f6-b2fa-5b47-ca4ff0cc15e9	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROhPgqjGitIpThS5M57PmfbwZQFkAb3yG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f6-b2fb-0fae-47ce882062b4	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f6-b2fb-1080-7bf7ca0fc808	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f6-b2fb-ed45-69696c19cd86	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f6-b2fb-c695-ca0a40e7f4c0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f6-b2fb-afd8-329a3b1ffc31	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f6-b2fb-8950-27f897b80b78	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f6-b2fb-5a6b-049ade47708c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f6-b2fb-fd36-62ed1a2a57ff	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f6-b2fb-d5b7-895572ef9888	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f6-b2fb-6ec1-b9c6378f14a1	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f6-b2fa-666a-0c38bb4f184a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2985 (class 0 OID 19185245)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f6-b2fc-1d33-465448b0d5e1	00160000-55f6-b2fb-b356-9616870f058d	\N	00140000-55f6-b2f9-da94-2c83fe866752	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f6-b2fb-cf6b-90c580accfdf
000e0000-55f6-b2fc-1f95-bb0384c63564	00160000-55f6-b2fb-591a-ed1d07a288ca	\N	00140000-55f6-b2f9-20de-f96eef197c18	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f6-b2fb-024f-eeedb3a12f64
000e0000-55f6-b2fc-d351-072cd25bedb1	\N	\N	00140000-55f6-b2f9-20de-f96eef197c18	00190000-55f6-b2fb-fc98-aaf1f2b026b2	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f6-b2fb-cf6b-90c580accfdf
000e0000-55f6-b2fc-26d6-f79907a04461	\N	\N	00140000-55f6-b2f9-20de-f96eef197c18	00190000-55f6-b2fb-fc98-aaf1f2b026b2	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f6-b2fb-cf6b-90c580accfdf
000e0000-55f6-b2fc-1312-50ce43b81738	\N	\N	00140000-55f6-b2f9-20de-f96eef197c18	00190000-55f6-b2fb-fc98-aaf1f2b026b2	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f6-b2fb-9bc5-82f132fab179
000e0000-55f6-b2fc-87b9-35bf455e81a0	\N	\N	00140000-55f6-b2f9-20de-f96eef197c18	00190000-55f6-b2fb-fc98-aaf1f2b026b2	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f6-b2fb-9bc5-82f132fab179
\.


--
-- TOC entry 2955 (class 0 OID 19184936)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f6-b2fc-cbba-7f7ce0dd4905	000e0000-55f6-b2fc-1f95-bb0384c63564	\N	1	
00200000-55f6-b2fc-a311-82865c8d3a5b	000e0000-55f6-b2fc-1f95-bb0384c63564	\N	2	
00200000-55f6-b2fc-6ca2-c73b37cf6cf7	000e0000-55f6-b2fc-1f95-bb0384c63564	\N	3	
00200000-55f6-b2fc-fb66-89cf00fbbc1e	000e0000-55f6-b2fc-1f95-bb0384c63564	\N	4	
00200000-55f6-b2fc-372c-bf2922069ce8	000e0000-55f6-b2fc-1f95-bb0384c63564	\N	5	
\.


--
-- TOC entry 2969 (class 0 OID 19185063)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19185169)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f6-b2f9-58a7-31f40a1d09d1	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f6-b2f9-2610-bdaea2a42515	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f6-b2f9-bb3f-9b362bae2728	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f6-b2f9-df90-3f2988b2ab17	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f6-b2f9-5300-686d00d06c8c	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f6-b2f9-c9bb-23ac1089c9b9	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f6-b2f9-03f8-432e585c0744	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f6-b2f9-7662-7ee2e7416ce5	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f6-b2f9-7a69-61992020858a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f6-b2f9-784d-932ac18b6b31	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f6-b2f9-b912-928e89b46d74	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f6-b2f9-5fec-1f34fe8a564e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f6-b2f9-6c1d-04987a6791b2	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f6-b2f9-ac65-e29ebad026d5	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f6-b2f9-2b58-df282083e91d	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f6-b2f9-b9dc-8b9cd86141c2	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f6-b2f9-056f-b0425d9a2339	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f6-b2f9-6151-e9828fabe404	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f6-b2f9-ad07-3f5ef72af19c	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f6-b2f9-7508-c2aa30bda194	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f6-b2f9-0f1e-a36abd6c4789	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f6-b2f9-a88a-ab19b4c72908	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f6-b2f9-e0ba-a6df66e61aea	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f6-b2f9-45de-139d02bee6db	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f6-b2f9-0df3-43e586541450	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f6-b2f9-ffa4-222df5214490	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f6-b2f9-79e1-8be0e83bf4cc	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f6-b2f9-a6f5-8faccc3130ed	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2997 (class 0 OID 19185486)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 19185458)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 19185498)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 19185135)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f6-b2fc-29ab-34f6c8517775	00090000-55f6-b2fc-a668-2ca8e6f68035	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-b2fc-a1ee-b5732d3393bd	00090000-55f6-b2fc-d242-b91fadb57c14	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-b2fc-3453-8adb032513a3	00090000-55f6-b2fc-71e8-35b0e955e75c	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-b2fc-50c2-1908cca3abd2	00090000-55f6-b2fc-612d-80554a2bcf85	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-b2fc-542b-131046ff1143	00090000-55f6-b2fc-99fc-632d9a38d0f5	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-b2fc-59b6-52939345f81b	00090000-55f6-b2fc-51ce-b6d813a963a7	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2957 (class 0 OID 19184972)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19185235)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f6-b2f9-da94-2c83fe866752	01	Drama	drama (SURS 01)
00140000-55f6-b2f9-72c6-ab1fb307e0d3	02	Opera	opera (SURS 02)
00140000-55f6-b2f9-8c1f-e3b11c5c0907	03	Balet	balet (SURS 03)
00140000-55f6-b2f9-06fc-e814cff03a02	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f6-b2f9-bfce-6c00883b0bb2	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f6-b2f9-20de-f96eef197c18	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f6-b2f9-c0f8-f56a1e13a935	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2975 (class 0 OID 19185125)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 19184776)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 19185294)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 19185284)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 19185194)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 19185538)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 19184961)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 19184981)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 19185456)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19184901)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 19185349)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 19185121)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 19184934)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 19184915)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 19185028)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 19185515)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 19185522)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 19185546)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 19185055)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 19184873)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 19184785)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 19184809)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 19184765)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 19184750)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 19185061)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 19185097)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 19185230)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19184837)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19184861)
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
-- TOC entry 2679 (class 2606 OID 19185410)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 19185034)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 19184851)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19184922)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 19185046)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 19185419)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 19185427)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 19185397)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 19185438)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 19185079)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 19185019)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 19185010)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 19185218)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 19185152)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 19184721)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 19185088)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 19184739)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 19184759)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 19185106)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 19185041)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 19184990)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 19184709)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19184697)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 19184691)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 19185165)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 19184818)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 19185001)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 19185205)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 19185450)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 19184886)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 19184734)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 19185263)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 19184944)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 19185069)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 19185177)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 19185496)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 19185480)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 19185504)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 19185143)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 19184976)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 19185243)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 19185133)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 19184970)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 19184971)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 19184969)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 19184968)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 19184967)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2624 (class 1259 OID 19185166)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 19185167)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 19185168)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 19185517)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 19185516)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 19184839)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 19185062)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 19185484)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 19185483)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 19185485)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 19185482)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 19185481)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 19185048)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 19185047)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 19184945)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 19185122)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19185124)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 19185123)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 19184917)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 19184916)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 19185439)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 19185232)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 19185233)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 19185234)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 19185505)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 19185268)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 19185265)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 19185269)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 19185267)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 19185266)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 19184888)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 19184887)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 19184812)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 19185089)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 19184766)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 19184767)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 19185109)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 19185108)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 19185107)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 19184923)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 19184924)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 19184699)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 19185014)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 19185012)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 19185011)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 19185013)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 19184740)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 19184741)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 19185070)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 19185539)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 19185547)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 19185548)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 19185035)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 19185153)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 19185154)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 19185354)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 19185353)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 19185350)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 19185351)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 19185352)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 19184853)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 19184852)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 19184854)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 19185083)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 19185082)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 19185420)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 19185421)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 19185298)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 19185299)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 19185296)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 19185297)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 19185144)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 19185023)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 19185022)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 19185020)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 19185021)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 19185286)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 19185285)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 19184935)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 19185411)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 19185457)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 19185523)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 19185524)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 19184787)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 19184786)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 19184819)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19184820)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 19185004)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 19185003)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 19185002)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 19184963)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2545 (class 1259 OID 19184964)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2546 (class 1259 OID 19184962)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2547 (class 1259 OID 19184966)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2548 (class 1259 OID 19184965)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 19184838)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 19184902)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19184904)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 19184903)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 19184905)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 19185029)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 19185231)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 19185264)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 19185206)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19185207)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 19184810)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 19184811)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 19185134)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 19184710)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19184874)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 19184698)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2597 (class 1259 OID 19185081)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 19185080)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 19185295)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 19184862)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 19185244)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 19185497)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 19185428)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 19185429)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 19185195)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 19184991)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 19184760)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 19185669)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 19185674)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 19185694)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 19185664)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 19185684)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 19185689)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 19185679)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2785 (class 2606 OID 19185844)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2784 (class 2606 OID 19185849)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2783 (class 2606 OID 19185854)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 19186019)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2818 (class 2606 OID 19186014)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 19185604)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 19185774)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2812 (class 2606 OID 19185999)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 19185994)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 19186004)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 19185989)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2815 (class 2606 OID 19185984)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2767 (class 2606 OID 19185769)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 19185764)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 19185659)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 19185814)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 19185824)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 19185819)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 19185639)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 19185634)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 19185754)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 19185974)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 19185859)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 19185864)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 19185869)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2816 (class 2606 OID 19186009)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2790 (class 2606 OID 19185889)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2793 (class 2606 OID 19185874)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2789 (class 2606 OID 19185894)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2791 (class 2606 OID 19185884)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2792 (class 2606 OID 19185879)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 19185629)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 19185624)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 19185589)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 19185584)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 19185794)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 19185564)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 19185569)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2774 (class 2606 OID 19185809)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 19185804)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 19185799)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 19185644)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 19185649)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 19185549)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2757 (class 2606 OID 19185729)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2759 (class 2606 OID 19185719)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2760 (class 2606 OID 19185714)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2758 (class 2606 OID 19185724)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 19185554)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 19185559)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 19185779)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2821 (class 2606 OID 19186034)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 19186039)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2822 (class 2606 OID 19186044)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 19185759)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2782 (class 2606 OID 19185834)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2781 (class 2606 OID 19185839)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 19185949)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 19185944)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 19185929)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 19185934)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2802 (class 2606 OID 19185939)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 19185614)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 19185609)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 19185619)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 19185789)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2772 (class 2606 OID 19185784)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2807 (class 2606 OID 19185959)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2806 (class 2606 OID 19185964)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2797 (class 2606 OID 19185919)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 19185924)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2799 (class 2606 OID 19185909)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2798 (class 2606 OID 19185914)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 19185829)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 19185749)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2762 (class 2606 OID 19185744)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 19185734)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2763 (class 2606 OID 19185739)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 19185904)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2795 (class 2606 OID 19185899)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 19185654)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 19185954)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2808 (class 2606 OID 19185969)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 19185979)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 19186024)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 19186029)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 19185579)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 19185574)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 19185594)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 19185599)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 19185709)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 19185704)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 19185699)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-14 13:43:59 CEST

--
-- PostgreSQL database dump complete
--

