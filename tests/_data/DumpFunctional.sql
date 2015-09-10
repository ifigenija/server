--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-10 10:01:16 CEST

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
-- TOC entry 181 (class 1259 OID 18460834)
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
-- TOC entry 226 (class 1259 OID 18461353)
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
-- TOC entry 225 (class 1259 OID 18461336)
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
-- TOC entry 219 (class 1259 OID 18461244)
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
-- TOC entry 240 (class 1259 OID 18461591)
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
-- TOC entry 195 (class 1259 OID 18461012)
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
-- TOC entry 197 (class 1259 OID 18461043)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 18461517)
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
-- TOC entry 190 (class 1259 OID 18460955)
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
-- TOC entry 227 (class 1259 OID 18461366)
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
-- TOC entry 213 (class 1259 OID 18461176)
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
-- TOC entry 193 (class 1259 OID 18460991)
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
-- TOC entry 191 (class 1259 OID 18460972)
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
-- TOC entry 202 (class 1259 OID 18461090)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 18461572)
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
-- TOC entry 239 (class 1259 OID 18461584)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 18461606)
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
-- TOC entry 206 (class 1259 OID 18461115)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 18460929)
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
-- TOC entry 182 (class 1259 OID 18460843)
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
-- TOC entry 183 (class 1259 OID 18460854)
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
-- TOC entry 178 (class 1259 OID 18460808)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 18460827)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 18461122)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 18461156)
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
-- TOC entry 222 (class 1259 OID 18461285)
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
-- TOC entry 185 (class 1259 OID 18460887)
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
-- TOC entry 187 (class 1259 OID 18460921)
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
-- TOC entry 229 (class 1259 OID 18461464)
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
-- TOC entry 203 (class 1259 OID 18461096)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 18460906)
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
-- TOC entry 192 (class 1259 OID 18460984)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 18461108)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 18461478)
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
-- TOC entry 231 (class 1259 OID 18461488)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 18461421)
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
-- TOC entry 232 (class 1259 OID 18461496)
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
-- TOC entry 209 (class 1259 OID 18461137)
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
-- TOC entry 201 (class 1259 OID 18461081)
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
-- TOC entry 200 (class 1259 OID 18461071)
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
-- TOC entry 221 (class 1259 OID 18461274)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 18461211)
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
-- TOC entry 175 (class 1259 OID 18460779)
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
-- TOC entry 174 (class 1259 OID 18460777)
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
-- TOC entry 210 (class 1259 OID 18461150)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 18460817)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 18460801)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 18461164)
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
-- TOC entry 204 (class 1259 OID 18461102)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 18461048)
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
-- TOC entry 173 (class 1259 OID 18460766)
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
-- TOC entry 172 (class 1259 OID 18460758)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 18460753)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 18461221)
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
-- TOC entry 184 (class 1259 OID 18460879)
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
-- TOC entry 199 (class 1259 OID 18461058)
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
-- TOC entry 220 (class 1259 OID 18461262)
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
-- TOC entry 233 (class 1259 OID 18461506)
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
-- TOC entry 189 (class 1259 OID 18460941)
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
-- TOC entry 176 (class 1259 OID 18460788)
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
-- TOC entry 224 (class 1259 OID 18461311)
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
-- TOC entry 194 (class 1259 OID 18461002)
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
-- TOC entry 208 (class 1259 OID 18461129)
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
-- TOC entry 218 (class 1259 OID 18461235)
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
-- TOC entry 236 (class 1259 OID 18461552)
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
-- TOC entry 235 (class 1259 OID 18461524)
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
-- TOC entry 237 (class 1259 OID 18461564)
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
-- TOC entry 215 (class 1259 OID 18461201)
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
-- TOC entry 196 (class 1259 OID 18461038)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 18461301)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 18461191)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 18460782)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 18460834)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 18461353)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f1-38cb-caed-2aa41480b602	000d0000-55f1-38ca-d07a-4ee95f637a54	\N	00090000-55f1-38ca-338f-8e52ed7daabe	000b0000-55f1-38ca-d60a-e731441366d1	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f1-38cb-f6b9-5f6bc2e00995	000d0000-55f1-38ca-a406-51d591a4c208	00100000-55f1-38ca-7e87-f830cb42decc	00090000-55f1-38ca-266f-8896dce53b51	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f1-38cb-9185-de48fbbb38a1	000d0000-55f1-38ca-fd85-098cb41544ff	00100000-55f1-38ca-99e2-8fc1cda2e8bb	00090000-55f1-38ca-a1de-67d743169ec4	\N	0003	t	\N	2015-09-10	\N	2	t	\N	f	f
000c0000-55f1-38cb-a189-62dd4ac1d697	000d0000-55f1-38ca-067c-8fcb62331cc3	\N	00090000-55f1-38ca-7218-0321e4ad2ad3	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f1-38cb-6704-9173689504b7	000d0000-55f1-38ca-7095-7797fb3fd21a	\N	00090000-55f1-38ca-8ee6-b3edbd03d0ad	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f1-38cb-a7a4-581c68f887b1	000d0000-55f1-38ca-4030-4aa7c472932e	\N	00090000-55f1-38ca-d634-9ae3889aeb30	000b0000-55f1-38ca-9493-ec9b5f635dba	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f1-38cb-0a42-dbb762b63d8f	000d0000-55f1-38ca-62d3-c7c877f788bd	00100000-55f1-38ca-14b8-c8d95a0467e6	00090000-55f1-38ca-8181-481a1acdce21	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f1-38cb-3e28-c1dfffeea5df	000d0000-55f1-38ca-75bf-5ca6cc3e0a38	\N	00090000-55f1-38ca-cec2-567f8f918600	000b0000-55f1-38ca-b78a-2713880cba69	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f1-38cb-fe57-547a911ca9c6	000d0000-55f1-38ca-62d3-c7c877f788bd	00100000-55f1-38ca-b2b2-629a048a9065	00090000-55f1-38ca-bc28-bc6c8b85a2fe	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f1-38cb-20d2-a1dcfda933c6	000d0000-55f1-38ca-62d3-c7c877f788bd	00100000-55f1-38ca-52cb-cfcae5239380	00090000-55f1-38ca-7cd5-c90c3b9956a4	\N	0010	t	\N	2015-09-10	\N	16	f	\N	f	t
000c0000-55f1-38cb-d16a-9b434607efcb	000d0000-55f1-38ca-62d3-c7c877f788bd	00100000-55f1-38ca-26dc-019c383911a5	00090000-55f1-38ca-5999-f38e41ebf23a	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f1-38cb-d83f-7f5b5e7d7307	000d0000-55f1-38ca-39cc-019e7092c584	\N	00090000-55f1-38ca-266f-8896dce53b51	000b0000-55f1-38ca-244c-e51722b9a93b	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2986 (class 0 OID 18461336)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 18461244)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f1-38ca-a346-1df4e3062582	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f1-38ca-e2f9-3bfade181a98	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f1-38ca-909c-3fd9265efa9c	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 18461591)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 18461012)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f1-38ca-423a-b8a99c33ebb1	\N	\N	00200000-55f1-38ca-e157-eb496a78ccec	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55f1-38ca-3f02-b3f6bead26af	\N	\N	00200000-55f1-38ca-fdfe-4003b6b57424	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55f1-38ca-5174-adb0dc36d5cb	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55f1-38ca-80a7-eda84b77652e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55f1-38ca-5f4f-a84c0b4fed0c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2958 (class 0 OID 18461043)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 18461517)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 18460955)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f1-38c9-94ef-722b464c24b9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f1-38c9-157a-537c5ff41174	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f1-38c9-0f94-76228331e2e6	AL	ALB	008	Albania 	Albanija	\N
00040000-55f1-38c9-00d6-22a6286a284c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f1-38c9-a7ca-617b63b02c66	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f1-38c9-e42f-618b22dbebcd	AD	AND	020	Andorra 	Andora	\N
00040000-55f1-38c9-adb6-056accba1a2a	AO	AGO	024	Angola 	Angola	\N
00040000-55f1-38c9-293a-23f3e6f31a16	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f1-38c9-2fe7-fb0383bca0c5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f1-38c9-9081-9eecd5439138	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f1-38c9-0fba-d8456e955940	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f1-38c9-1de8-eaceb8ac9ccc	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f1-38c9-6f2c-899d74e7ce5f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f1-38c9-a206-0f1b434f9760	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f1-38c9-8c40-bdf42e32d65d	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f1-38c9-dfda-3aaf59ed438f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f1-38c9-3fca-acc1613a726b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f1-38c9-0d43-f35588ce7e25	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f1-38c9-0ae2-7cd739fccba4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f1-38c9-5ffa-eef9bf184a27	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f1-38c9-2c49-6684f3f35d17	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f1-38c9-358f-015b87c4b110	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f1-38c9-d95a-e5a3b7317667	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f1-38c9-6e2e-372b5840e2aa	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f1-38c9-8a1d-f51126c41ff4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f1-38c9-7d38-e575cb281a19	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f1-38c9-8809-85b43ed3f8bf	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f1-38c9-17f4-88644874caa0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f1-38c9-5983-69bd8f913906	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f1-38c9-406e-cfdc0d550ad4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f1-38c9-66b8-0f60fbf884e0	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f1-38c9-e9a7-557722614608	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f1-38c9-a2ea-5efa80e14bc5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f1-38c9-aa1e-555259c7e2ad	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f1-38c9-cd99-b1846e5ddfd0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f1-38c9-77ac-da9a3c048a7f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f1-38c9-1846-447e489737c3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f1-38c9-2fa1-9e75e465d9da	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f1-38c9-4c7f-bdf1ba524444	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f1-38c9-0d5c-8a122831dee0	CA	CAN	124	Canada 	Kanada	\N
00040000-55f1-38c9-ad97-b95ab25e1f01	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f1-38c9-5fe8-0bd56742c70b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f1-38c9-f008-96809a033da4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f1-38c9-3b48-3e35864895af	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f1-38c9-b66d-bfdbf00b0d9e	CL	CHL	152	Chile 	Čile	\N
00040000-55f1-38c9-108e-3f2c34821539	CN	CHN	156	China 	Kitajska	\N
00040000-55f1-38c9-b0c6-11603462836a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f1-38c9-e747-b52ef9fdd9bf	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f1-38c9-1f76-44023ec23c5c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f1-38c9-5ca1-09832f7c82c3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f1-38c9-1d5f-cd6720336d2f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f1-38c9-2e41-a907b06d2606	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f1-38c9-a013-cd5634709cc7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f1-38c9-e3fc-d47aa1b9a690	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f1-38c9-ab89-2790dddfc026	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f1-38c9-1ce0-01c1aff94ece	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f1-38c9-b070-eeecfd14a00a	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f1-38c9-bb6e-4eb0198e604c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f1-38c9-31bd-ebe8b7503188	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f1-38c9-032a-2c63297e151a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f1-38c9-dcd1-c945d6ecf134	DK	DNK	208	Denmark 	Danska	\N
00040000-55f1-38c9-4d86-31832baf0879	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f1-38c9-0672-9da64d9b6573	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f1-38c9-782d-a12cea1f97f5	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f1-38c9-d8fe-5fedf6dff6a5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f1-38c9-854e-a54bd18d1a24	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f1-38c9-99fc-091c2821b06e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f1-38c9-50b7-dd13eaae47c5	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f1-38c9-9ac4-318ac09d924b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f1-38c9-d348-2b73cac7bf7d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f1-38c9-642a-41cd797bea25	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f1-38c9-1dd3-1a6e94ee1578	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f1-38c9-3348-4beb5691fbc4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f1-38c9-6695-00d1b050e2b0	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f1-38c9-bfaa-b77acb660d42	FI	FIN	246	Finland 	Finska	\N
00040000-55f1-38c9-f52b-a0bb061121b7	FR	FRA	250	France 	Francija	\N
00040000-55f1-38c9-b976-a43d0c0bf196	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f1-38c9-20d0-b3017325618f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f1-38c9-8c9a-1e18ee9d64c7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f1-38c9-ef34-1448a5ffcb1c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f1-38c9-d88d-17fb824aa1cb	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f1-38c9-4978-32259111dce3	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f1-38c9-8add-dfe06d23fe0e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f1-38c9-9a37-fff04c52b5ed	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f1-38c9-c5ea-1715ae35efcb	GH	GHA	288	Ghana 	Gana	\N
00040000-55f1-38c9-2f8a-da68887ae7fa	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f1-38c9-3da6-d7bc84605cd1	GR	GRC	300	Greece 	Grčija	\N
00040000-55f1-38c9-82c7-e708de4d6f84	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f1-38c9-5e23-c8d7748afed2	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f1-38c9-2ed8-fb5c6216b02e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f1-38c9-d79a-848e62cc868d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f1-38c9-d239-ab26006f1c66	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f1-38c9-1824-5dd4ba178ab5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f1-38c9-3ce3-0b58ce5de13f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f1-38c9-f25a-68dba2bf51cf	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f1-38c9-17c1-0e74ee6ef476	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f1-38c9-ea02-f59b321e39ac	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f1-38c9-d17d-a32ea226b442	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f1-38c9-693a-f51c56819504	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f1-38c9-f901-d76dd1516656	HN	HND	340	Honduras 	Honduras	\N
00040000-55f1-38c9-f516-52faab452621	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f1-38c9-f4a6-af564ae9524f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f1-38c9-2e7d-0400310b6120	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f1-38c9-eb20-bb66d84da61a	IN	IND	356	India 	Indija	\N
00040000-55f1-38c9-1377-6da3170006d2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f1-38c9-7d80-f3fe31f11cdc	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f1-38c9-70ac-d9fed0d855bc	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f1-38c9-aaed-22be2c52ae26	IE	IRL	372	Ireland 	Irska	\N
00040000-55f1-38c9-2828-7c1b33a6187d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f1-38c9-4dea-cc3dec2e925e	IL	ISR	376	Israel 	Izrael	\N
00040000-55f1-38c9-27be-59c0318e1dd5	IT	ITA	380	Italy 	Italija	\N
00040000-55f1-38c9-c6bc-fe9358ad0ab9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f1-38c9-faea-f126244c8cf1	JP	JPN	392	Japan 	Japonska	\N
00040000-55f1-38c9-7807-fbb8abc94b7b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f1-38c9-32d0-6c7b601c43bf	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f1-38c9-176e-1d1fbbff683b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f1-38c9-9124-827af190ee25	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f1-38c9-4b7b-95f662b2428a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f1-38c9-1b07-8d382b8d49ad	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f1-38c9-edd5-d3ad2c7d751b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f1-38c9-b38d-a0bc8d04c759	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f1-38c9-a73c-bc09da2f587f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f1-38c9-25ff-68da6fe76908	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f1-38c9-5c27-e6ca2da04c88	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f1-38c9-daec-08f3a380c937	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f1-38c9-87f6-db7f9a41e1b7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f1-38c9-139c-890959e5319a	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f1-38c9-e638-0b5ea667a4ba	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f1-38c9-2528-e78e0b969ff7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f1-38c9-12b0-40eac3af7dbc	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f1-38c9-20b6-3b29ba7164fc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f1-38c9-0a0d-c29a6ed0830c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f1-38c9-7a09-98a56b9ddd77	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f1-38c9-7c14-dc87c4e7ce8b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f1-38c9-7e6b-37bf28646adf	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f1-38c9-4b20-357e48ccf82d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f1-38c9-7751-393194e5077e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f1-38c9-4259-d99204d7030f	ML	MLI	466	Mali 	Mali	\N
00040000-55f1-38c9-45b8-d85623768452	MT	MLT	470	Malta 	Malta	\N
00040000-55f1-38c9-52b7-4444b29153ee	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f1-38c9-4382-1f7c30f819a6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f1-38c9-3e85-4db7bebdf6b2	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f1-38c9-9980-239f0d3f96a4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f1-38c9-c852-3423768c163d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f1-38c9-4ec8-5fd9ff8afe17	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f1-38c9-651e-b64e9920273c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f1-38c9-b778-ea643310c48e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f1-38c9-3bff-9870ad679856	MC	MCO	492	Monaco 	Monako	\N
00040000-55f1-38c9-766c-3dbf8c485e16	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f1-38c9-857b-84d2dfe3cbb3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f1-38c9-9f98-87181ec3144c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f1-38c9-3ecd-ccb877f2e0f8	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f1-38c9-9249-da94d287b0e6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f1-38c9-8296-9d77a1f6ce3f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f1-38c9-1a3e-0413f078ad72	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f1-38c9-d3a2-178355f29c22	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f1-38c9-d10e-236216ee3ea9	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f1-38c9-d434-e825f9245085	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f1-38c9-dfb0-55d4d5388534	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f1-38c9-f302-8e637f063560	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f1-38c9-ff6b-a5b6bf2b50be	NE	NER	562	Niger 	Niger 	\N
00040000-55f1-38c9-bd5e-aaac9bb71661	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f1-38c9-d6ae-6730e6bcc759	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f1-38c9-b0eb-d8fc82fb7f08	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f1-38c9-f4c5-7120b29df3a4	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f1-38c9-ecba-0bf9511f0c66	NO	NOR	578	Norway 	Norveška	\N
00040000-55f1-38c9-92f9-75ec238e0d3b	OM	OMN	512	Oman 	Oman	\N
00040000-55f1-38c9-ad49-b8964f1d9b76	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f1-38c9-d3cb-f922f21b0bc5	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f1-38c9-a638-3209fa1e4c4b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f1-38c9-951a-f58eba95f5d6	PA	PAN	591	Panama 	Panama	\N
00040000-55f1-38c9-3f24-e1ed4a2ef407	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f1-38c9-1372-45bd1c30aeba	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f1-38c9-b480-f2acfc8651f2	PE	PER	604	Peru 	Peru	\N
00040000-55f1-38c9-79e4-2ce5b7ce02a0	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f1-38c9-836e-f39955ebd1ac	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f1-38c9-eea8-bed91b629ae3	PL	POL	616	Poland 	Poljska	\N
00040000-55f1-38c9-1d91-c9b9f0038e5d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f1-38c9-aba6-8a7eaeef9179	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f1-38c9-2fa1-2f95e82f8591	QA	QAT	634	Qatar 	Katar	\N
00040000-55f1-38c9-a7d2-3030b311dad8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f1-38c9-e0b1-2e8c39bdd2dc	RO	ROU	642	Romania 	Romunija	\N
00040000-55f1-38c9-7a9e-37cd4d40f9a4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f1-38c9-20e5-bbde96923898	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f1-38c9-a397-aa1be4fb3daa	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f1-38c9-ac63-e6d95787ff0f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f1-38c9-7adb-57b56d301a4d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f1-38c9-4088-0669e0cb188e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f1-38c9-8189-216a88e7c760	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f1-38c9-f191-64eb01facbbd	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f1-38c9-97bb-4b8a7b5f4576	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f1-38c9-84f4-d10257d77b47	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f1-38c9-c84c-43a295c71faf	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f1-38c9-de03-f20cc5c3c649	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f1-38c9-b801-4455ed29aef8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f1-38c9-ec26-59daffbd6f3e	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f1-38c9-9a1f-10f2142d6ba3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f1-38c9-cdec-def0d950ff1d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f1-38c9-3193-e3132fac0a5b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f1-38c9-b2d7-3571dffae734	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f1-38c9-23f6-7ad3b459f5e3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f1-38c9-7344-f5602c3c02d5	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f1-38c9-0f27-398482acef01	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f1-38c9-c228-5b9a8a7f1064	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f1-38c9-da2c-9d16d58078b7	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f1-38c9-41aa-55a49d7dea86	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f1-38c9-3bf4-ba0fc90cbc29	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f1-38c9-a245-75d50d0f277a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f1-38c9-7322-a5e83480c167	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f1-38c9-f2f8-5590b0f7f99b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f1-38c9-d3fd-4b3cc2825342	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f1-38c9-fe7e-55e171d0dc80	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f1-38c9-8c73-4376d0786950	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f1-38c9-0e26-799284e494e3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f1-38c9-4391-33532bb2f3a4	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f1-38c9-326d-b010f225d3b4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f1-38c9-3ac7-871ca3520ae7	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f1-38c9-174b-04de3cf83256	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f1-38c9-f5df-ebe58e9f4406	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f1-38c9-4b78-c86748783f08	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f1-38c9-d1f6-e86f446a869a	TH	THA	764	Thailand 	Tajska	\N
00040000-55f1-38c9-3ef3-6d71559d5c2b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f1-38c9-dc80-47cda1f35f2a	TG	TGO	768	Togo 	Togo	\N
00040000-55f1-38c9-fcbd-7a9fe065b46a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f1-38c9-d975-0b617e11a304	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f1-38c9-195d-5824858fce73	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f1-38c9-84a5-729c6f7b8984	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f1-38c9-bf77-4690b62418ac	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f1-38c9-1bd5-9c378baaab86	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f1-38c9-2cbe-ebfb513f7ce7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f1-38c9-f54b-8ae55dea6ba3	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f1-38c9-4c5d-fb4c9e011fe2	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f1-38c9-5e28-1b5d2cdda41a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f1-38c9-2914-1c9a3612b679	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f1-38c9-f23e-ce8063efdf5b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f1-38c9-8baa-6e283d604f9c	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f1-38c9-e7dc-0a5b877cce85	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f1-38c9-8833-ac0eb6ca7f30	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f1-38c9-76f6-e42948914348	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f1-38c9-9972-b8a527cbe7e7	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f1-38c9-bab9-5da731f42b06	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f1-38c9-863b-c180333178f8	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f1-38c9-dec9-2093f5516235	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f1-38c9-1541-53416c406f8f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f1-38c9-a6c8-880cdf526df5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f1-38c9-aec8-cac2f4f402ac	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f1-38c9-04a8-34ed8e6b4a39	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f1-38c9-886b-962c31026674	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f1-38c9-4c16-5b3ab129e56d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2988 (class 0 OID 18461366)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f1-38ca-e6a8-5a6d438b9165	000e0000-55f1-38ca-d75c-3a85e432f035	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f1-38c9-2105-95477cf700d4	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f1-38ca-9b54-6289cb3ac24f	000e0000-55f1-38ca-ee87-0f8ceccdea56	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f1-38c9-0bdc-aa28e8ef91ad	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f1-38ca-a7bd-5d1468e5d75b	000e0000-55f1-38ca-444e-f68189a96207	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f1-38c9-2105-95477cf700d4	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f1-38ca-aea4-60b2415a0504	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f1-38ca-76cb-edfe1ee2635b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 18461176)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f1-38ca-d07a-4ee95f637a54	000e0000-55f1-38ca-ee87-0f8ceccdea56	000c0000-55f1-38cb-caed-2aa41480b602	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f1-38c9-d35b-44cc80a6b6a1
000d0000-55f1-38ca-a406-51d591a4c208	000e0000-55f1-38ca-ee87-0f8ceccdea56	000c0000-55f1-38cb-f6b9-5f6bc2e00995	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f1-38c9-93e5-6be54dea6f8d
000d0000-55f1-38ca-fd85-098cb41544ff	000e0000-55f1-38ca-ee87-0f8ceccdea56	000c0000-55f1-38cb-9185-de48fbbb38a1	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f1-38c9-057a-e6c8ba07148a
000d0000-55f1-38ca-067c-8fcb62331cc3	000e0000-55f1-38ca-ee87-0f8ceccdea56	000c0000-55f1-38cb-a189-62dd4ac1d697	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f1-38c9-35a1-6df01d8d8af2
000d0000-55f1-38ca-7095-7797fb3fd21a	000e0000-55f1-38ca-ee87-0f8ceccdea56	000c0000-55f1-38cb-6704-9173689504b7	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f1-38c9-35a1-6df01d8d8af2
000d0000-55f1-38ca-4030-4aa7c472932e	000e0000-55f1-38ca-ee87-0f8ceccdea56	000c0000-55f1-38cb-a7a4-581c68f887b1	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f1-38c9-d35b-44cc80a6b6a1
000d0000-55f1-38ca-62d3-c7c877f788bd	000e0000-55f1-38ca-ee87-0f8ceccdea56	000c0000-55f1-38cb-fe57-547a911ca9c6	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f1-38c9-d35b-44cc80a6b6a1
000d0000-55f1-38ca-75bf-5ca6cc3e0a38	000e0000-55f1-38ca-ee87-0f8ceccdea56	000c0000-55f1-38cb-3e28-c1dfffeea5df	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f1-38c9-c78c-c3cc885e9af6
000d0000-55f1-38ca-39cc-019e7092c584	000e0000-55f1-38ca-ee87-0f8ceccdea56	000c0000-55f1-38cb-d83f-7f5b5e7d7307	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f1-38c9-65b4-e71661082325
\.


--
-- TOC entry 2954 (class 0 OID 18460991)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 18460972)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f1-38ca-77d2-40b6f2c9fa08	00080000-55f1-38ca-2a49-daf02cdd6129	00090000-55f1-38ca-7cd5-c90c3b9956a4	AK		igralka
\.


--
-- TOC entry 2963 (class 0 OID 18461090)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 18461572)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 18461584)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 18461606)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 18461115)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 18460929)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f1-38c9-3358-c6d68a00c290	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f1-38c9-9792-a5297d46c0ae	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f1-38c9-0857-67a0196f69a9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f1-38c9-758b-1080bc1fae10	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f1-38c9-37f0-6eada491a7dd	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f1-38c9-52df-2f77a61d4842	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f1-38c9-b15e-af5534778789	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f1-38c9-1b04-35f58822c360	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f1-38c9-9f18-6a8ac663b941	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f1-38c9-a129-2fa8ca31278d	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f1-38c9-e55d-37501d18ef24	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f1-38c9-39ed-da51395a6fe2	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f1-38c9-1b51-13c511c41c2e	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f1-38c9-3ea3-61dab5a8ce20	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f1-38ca-ccec-8ce229cffec0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f1-38ca-2046-7380385894f7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f1-38ca-5320-8017deed7c08	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f1-38ca-28cc-adad28ae6f2b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f1-38ca-9f01-813f8683bb5d	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f1-38cb-50c7-1d756f3a8dfb	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2943 (class 0 OID 18460843)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f1-38ca-0be4-28dd8779de1d	00000000-55f1-38ca-ccec-8ce229cffec0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f1-38ca-0f4b-4a2cf976b934	00000000-55f1-38ca-ccec-8ce229cffec0	00010000-55f1-38c9-be17-46a941e1aa70	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f1-38ca-3ab0-573b20a7e1fb	00000000-55f1-38ca-2046-7380385894f7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2944 (class 0 OID 18460854)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f1-38ca-338f-8e52ed7daabe	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f1-38ca-7218-0321e4ad2ad3	00010000-55f1-38ca-8995-467319686688	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f1-38ca-a1de-67d743169ec4	00010000-55f1-38ca-d488-cf75d34128e2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f1-38ca-bc28-bc6c8b85a2fe	00010000-55f1-38ca-45d6-68f093a22f18	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f1-38ca-0ca9-8bb66836f630	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f1-38ca-d634-9ae3889aeb30	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f1-38ca-5999-f38e41ebf23a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f1-38ca-8181-481a1acdce21	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f1-38ca-7cd5-c90c3b9956a4	00010000-55f1-38ca-2d35-a4329090581e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f1-38ca-266f-8896dce53b51	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f1-38ca-3679-d62cc263872e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f1-38ca-8ee6-b3edbd03d0ad	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f1-38ca-cec2-567f8f918600	00010000-55f1-38ca-2ba6-8271e4e85d34	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 18460808)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f1-38c9-1976-f1386527734a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f1-38c9-8ee7-122220941c79	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f1-38c9-758e-7596f2a3522e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f1-38c9-71e0-5750f0b08da4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f1-38c9-c27d-b1cdf02df179	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f1-38c9-4071-aadb68feeb69	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f1-38c9-4210-871c0bd853df	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f1-38c9-05c2-c03162fe7415	Abonma-read	Abonma - branje	f
00030000-55f1-38c9-fcbe-ef736a44f26c	Abonma-write	Abonma - spreminjanje	f
00030000-55f1-38c9-b740-e00a77b36902	Alternacija-read	Alternacija - branje	f
00030000-55f1-38c9-af39-8f000ba43fb6	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f1-38c9-ef1d-9fc8174a7de4	Arhivalija-read	Arhivalija - branje	f
00030000-55f1-38c9-a77d-9d5c4d591f79	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f1-38c9-dfc8-b826e0f428d3	Besedilo-read	Besedilo - branje	f
00030000-55f1-38c9-1ca1-cf9c93250832	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f1-38c9-60ac-239f1881f80c	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f1-38c9-df95-245a3348c131	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f1-38c9-2a52-d3316ad0eb7c	Dogodek-read	Dogodek - branje	f
00030000-55f1-38c9-7e83-e1b946cba69c	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f1-38c9-2ece-afa86013b41a	DrugiVir-read	DrugiVir - branje	f
00030000-55f1-38c9-2f5c-87b1a85970d9	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f1-38c9-348d-b3d26f5fdbc4	Drzava-read	Drzava - branje	f
00030000-55f1-38c9-1b5b-bb48d88fe131	Drzava-write	Drzava - spreminjanje	f
00030000-55f1-38c9-300b-99f2ebc5c9bf	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f1-38c9-d14d-b0b9500cee72	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f1-38c9-81d8-f723c928d728	Funkcija-read	Funkcija - branje	f
00030000-55f1-38c9-c112-1767dfdf9b29	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f1-38c9-1448-a9e68a846c75	Gostovanje-read	Gostovanje - branje	f
00030000-55f1-38c9-fb4c-5f1240c73963	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f1-38c9-4ce4-bc691c1ba83b	Gostujoca-read	Gostujoca - branje	f
00030000-55f1-38c9-595f-776cd4f8460a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f1-38c9-91e8-8c6581ace224	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f1-38c9-07c0-afd6fde9f5c4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f1-38c9-94b7-7c7d116348d1	Kupec-read	Kupec - branje	f
00030000-55f1-38c9-0299-e6aaee45183a	Kupec-write	Kupec - spreminjanje	f
00030000-55f1-38c9-8c00-8dc4e45cf8a9	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f1-38c9-9b9f-890e303ce37f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f1-38c9-bd43-335c985feec3	Option-read	Option - branje	f
00030000-55f1-38c9-62bb-744800253adf	Option-write	Option - spreminjanje	f
00030000-55f1-38c9-1fc8-98fa9d853ae5	OptionValue-read	OptionValue - branje	f
00030000-55f1-38c9-24b4-f5d898babf54	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f1-38c9-87ae-858fbd4af2b3	Oseba-read	Oseba - branje	f
00030000-55f1-38c9-e171-1fe3ceab25cf	Oseba-write	Oseba - spreminjanje	f
00030000-55f1-38c9-417c-b00aa168821f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f1-38c9-efa4-8ce81bf30b33	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f1-38c9-9d27-456359cdb405	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f1-38c9-91ac-0cbe283f1b1e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f1-38c9-c6b8-b3eb80db0385	Pogodba-read	Pogodba - branje	f
00030000-55f1-38c9-e69e-7033af9ab063	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f1-38c9-dffd-29f154d5ea60	Popa-read	Popa - branje	f
00030000-55f1-38c9-ff17-10e80583b0c4	Popa-write	Popa - spreminjanje	f
00030000-55f1-38c9-bb29-794d89f7adfe	Posta-read	Posta - branje	f
00030000-55f1-38c9-b088-73061b2b7189	Posta-write	Posta - spreminjanje	f
00030000-55f1-38c9-442b-305582ebe834	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f1-38c9-1fa7-2c6f65082973	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f1-38c9-f114-b30f8a4e97bf	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f1-38c9-c683-5efe663fe60d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f1-38c9-fd67-fad6ff4f6947	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f1-38c9-02fb-e24152f1deee	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f1-38c9-c04a-a3faa9cb7e69	Predstava-read	Predstava - branje	f
00030000-55f1-38c9-3668-31cbded433ff	Predstava-write	Predstava - spreminjanje	f
00030000-55f1-38c9-6f25-94177526c8cd	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f1-38c9-a56b-5ad7c8d2b93a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f1-38c9-1546-6cf0e4ee003c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f1-38c9-64e5-14777d0c95e6	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f1-38c9-8342-973c2c4d6833	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f1-38c9-57e4-a339619859ed	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f1-38c9-2aae-5fc8927d1117	ProgramDela-read	ProgramDela - branje	f
00030000-55f1-38c9-b945-2c9fa5fcf88f	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f1-38c9-cde4-cdc020d89f31	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f1-38c9-3404-0de89f283bc1	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f1-38c9-0002-da43e5e8c556	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f1-38c9-a891-7544cf096ee4	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f1-38c9-bf17-73decd94d8a2	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f1-38c9-3299-fe5c5e9583b3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f1-38c9-a1b6-3ef5d0aadeaa	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f1-38c9-fd47-b101f0718d8e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f1-38c9-5c61-8e5339357333	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f1-38c9-b6fc-e5eadddd012c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f1-38c9-6e16-93d9f525e90a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f1-38c9-f3cc-67fc2311ec24	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f1-38c9-9356-a2ad64891a92	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f1-38c9-7269-010189d5232f	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f1-38c9-bc5c-f1b61c6a8e72	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f1-38c9-9619-2fef27c6afd2	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f1-38c9-94ba-892122ff140c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f1-38c9-c822-401c1c237fa7	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f1-38c9-34cc-c72a06833a85	Prostor-read	Prostor - branje	f
00030000-55f1-38c9-15c6-f661b4ac6151	Prostor-write	Prostor - spreminjanje	f
00030000-55f1-38c9-7c2b-b006463cdb5f	Racun-read	Racun - branje	f
00030000-55f1-38c9-e668-8d3f83d3fde7	Racun-write	Racun - spreminjanje	f
00030000-55f1-38c9-4c0a-4e89d8cf6bdb	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f1-38c9-734a-da57cd27fa64	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f1-38c9-04b5-2d18f4f1d220	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f1-38c9-6120-1561a0db2de7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f1-38c9-1b54-179c4e30f1f5	Rekvizit-read	Rekvizit - branje	f
00030000-55f1-38c9-97bc-f1e0bc47e54a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f1-38c9-4083-303ee24dae07	Revizija-read	Revizija - branje	f
00030000-55f1-38c9-7324-1438450282b2	Revizija-write	Revizija - spreminjanje	f
00030000-55f1-38c9-5d71-1617e65764b2	Rezervacija-read	Rezervacija - branje	f
00030000-55f1-38c9-818d-f2e0e874c96a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f1-38c9-c58b-f45abcf18849	SedezniRed-read	SedezniRed - branje	f
00030000-55f1-38c9-4bcf-fb52042d6ae6	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f1-38c9-1b54-ab5687ad0391	Sedez-read	Sedez - branje	f
00030000-55f1-38c9-7de0-3d3cc0185979	Sedez-write	Sedez - spreminjanje	f
00030000-55f1-38c9-c892-f7b033991165	Sezona-read	Sezona - branje	f
00030000-55f1-38c9-b2a9-d987fb457483	Sezona-write	Sezona - spreminjanje	f
00030000-55f1-38c9-6e01-38cc3bdec09e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f1-38c9-cb54-994e3495d762	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f1-38c9-93d2-9b743d01608b	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f1-38c9-1760-c7b69c24fb2f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f1-38c9-b357-dc0cefd5680e	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f1-38c9-59fd-62fedccb6793	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f1-38c9-eb2a-40ecc72392fb	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f1-38c9-9f79-ba6e007dc4d4	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f1-38c9-cd44-3e1dd369c4bb	Telefonska-read	Telefonska - branje	f
00030000-55f1-38c9-2235-60bcaf91881d	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f1-38c9-4a88-062eb71bedd3	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f1-38c9-b0f6-7ed000825cb7	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f1-38c9-d2a3-a0ab8d3b83fd	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f1-38c9-cc3c-e8a94f98ec73	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f1-38c9-d3d5-3c56c8be4e51	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f1-38c9-3a31-9493588f151b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f1-38c9-1062-e189dad9d5b6	Trr-read	Trr - branje	f
00030000-55f1-38c9-e7e3-f08471ef5971	Trr-write	Trr - spreminjanje	f
00030000-55f1-38c9-cb16-3be3f3f220c1	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f1-38c9-2908-ee58aa774e60	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f1-38c9-2339-ea01df70b395	Vaja-read	Vaja - branje	f
00030000-55f1-38c9-b80a-82a24a3fae48	Vaja-write	Vaja - spreminjanje	f
00030000-55f1-38c9-f2ca-9db5da410242	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f1-38c9-2a65-e164cc91f7ee	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f1-38c9-8c85-f0d76a587726	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f1-38c9-320b-dbc1db9ce9af	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f1-38c9-59cc-fd98d2bbbc0a	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f1-38c9-20da-ef5b4ec9caf5	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f1-38c9-be56-3f2199ccc277	Zasedenost-read	Zasedenost - branje	f
00030000-55f1-38c9-43c4-13252016c156	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f1-38c9-d01a-cf671bf1b87d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f1-38c9-036b-98fe53042f02	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f1-38c9-49da-c832c463bcb0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f1-38c9-6468-6158751ca18d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f1-38c9-dad0-496575621756	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f1-38c9-dd65-08cd8e21253e	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f1-38c9-9038-76839479c721	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f1-38c9-6722-5b5bc047b856	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f1-38c9-2f5b-d95b25929275	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f1-38c9-e7e1-9e13102f05d7	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f1-38c9-ad45-766be1a62dc9	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f1-38c9-3f70-dc779430b1b6	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f1-38c9-5e39-8f94316b684a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f1-38c9-70e8-5a93065bfe86	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f1-38c9-a8a1-cd037e0a010a	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f1-38c9-7eef-a2acc76f84ca	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2941 (class 0 OID 18460827)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f1-38c9-3db9-a9fc3d189a16	00030000-55f1-38c9-8ee7-122220941c79
00020000-55f1-38c9-926e-481bfccd971c	00030000-55f1-38c9-348d-b3d26f5fdbc4
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-05c2-c03162fe7415
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-fcbe-ef736a44f26c
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-b740-e00a77b36902
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-af39-8f000ba43fb6
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-ef1d-9fc8174a7de4
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-2a52-d3316ad0eb7c
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-71e0-5750f0b08da4
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-7e83-e1b946cba69c
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-348d-b3d26f5fdbc4
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-1b5b-bb48d88fe131
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-81d8-f723c928d728
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-c112-1767dfdf9b29
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-1448-a9e68a846c75
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-fb4c-5f1240c73963
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-4ce4-bc691c1ba83b
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-595f-776cd4f8460a
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-91e8-8c6581ace224
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-07c0-afd6fde9f5c4
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-bd43-335c985feec3
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-1fc8-98fa9d853ae5
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-87ae-858fbd4af2b3
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-e171-1fe3ceab25cf
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-dffd-29f154d5ea60
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-ff17-10e80583b0c4
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-bb29-794d89f7adfe
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-b088-73061b2b7189
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-fd67-fad6ff4f6947
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-02fb-e24152f1deee
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-c04a-a3faa9cb7e69
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-3668-31cbded433ff
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-8342-973c2c4d6833
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-57e4-a339619859ed
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-34cc-c72a06833a85
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-15c6-f661b4ac6151
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-04b5-2d18f4f1d220
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-6120-1561a0db2de7
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-1b54-179c4e30f1f5
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-97bc-f1e0bc47e54a
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-c892-f7b033991165
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-b2a9-d987fb457483
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-d2a3-a0ab8d3b83fd
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-cb16-3be3f3f220c1
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-2908-ee58aa774e60
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-2339-ea01df70b395
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-b80a-82a24a3fae48
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-be56-3f2199ccc277
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-43c4-13252016c156
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-d01a-cf671bf1b87d
00020000-55f1-38c9-0dc6-a37b58e0bc0b	00030000-55f1-38c9-49da-c832c463bcb0
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-05c2-c03162fe7415
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-ef1d-9fc8174a7de4
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-2a52-d3316ad0eb7c
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-348d-b3d26f5fdbc4
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-1448-a9e68a846c75
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-4ce4-bc691c1ba83b
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-91e8-8c6581ace224
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-07c0-afd6fde9f5c4
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-bd43-335c985feec3
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-1fc8-98fa9d853ae5
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-87ae-858fbd4af2b3
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-e171-1fe3ceab25cf
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-dffd-29f154d5ea60
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-bb29-794d89f7adfe
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-fd67-fad6ff4f6947
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-02fb-e24152f1deee
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-c04a-a3faa9cb7e69
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-34cc-c72a06833a85
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-04b5-2d18f4f1d220
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-1b54-179c4e30f1f5
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-c892-f7b033991165
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-cd44-3e1dd369c4bb
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-2235-60bcaf91881d
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-1062-e189dad9d5b6
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-e7e3-f08471ef5971
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-59cc-fd98d2bbbc0a
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-20da-ef5b4ec9caf5
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-d01a-cf671bf1b87d
00020000-55f1-38c9-f84c-0b97aea713e6	00030000-55f1-38c9-49da-c832c463bcb0
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-05c2-c03162fe7415
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-b740-e00a77b36902
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-ef1d-9fc8174a7de4
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-a77d-9d5c4d591f79
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-dfc8-b826e0f428d3
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-60ac-239f1881f80c
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-2a52-d3316ad0eb7c
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-348d-b3d26f5fdbc4
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-81d8-f723c928d728
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-1448-a9e68a846c75
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-4ce4-bc691c1ba83b
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-91e8-8c6581ace224
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-bd43-335c985feec3
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-1fc8-98fa9d853ae5
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-87ae-858fbd4af2b3
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-dffd-29f154d5ea60
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-bb29-794d89f7adfe
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-c04a-a3faa9cb7e69
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-8342-973c2c4d6833
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-34cc-c72a06833a85
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-04b5-2d18f4f1d220
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-1b54-179c4e30f1f5
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-c892-f7b033991165
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-d2a3-a0ab8d3b83fd
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-2339-ea01df70b395
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-be56-3f2199ccc277
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-d01a-cf671bf1b87d
00020000-55f1-38c9-3e0f-607f268140c9	00030000-55f1-38c9-49da-c832c463bcb0
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-05c2-c03162fe7415
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-fcbe-ef736a44f26c
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-af39-8f000ba43fb6
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-ef1d-9fc8174a7de4
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-2a52-d3316ad0eb7c
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-348d-b3d26f5fdbc4
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-1448-a9e68a846c75
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-4ce4-bc691c1ba83b
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-bd43-335c985feec3
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-1fc8-98fa9d853ae5
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-dffd-29f154d5ea60
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-bb29-794d89f7adfe
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-c04a-a3faa9cb7e69
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-34cc-c72a06833a85
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-04b5-2d18f4f1d220
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-1b54-179c4e30f1f5
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-c892-f7b033991165
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-d2a3-a0ab8d3b83fd
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-d01a-cf671bf1b87d
00020000-55f1-38c9-854b-d4b9b320effe	00030000-55f1-38c9-49da-c832c463bcb0
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-05c2-c03162fe7415
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-ef1d-9fc8174a7de4
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-2a52-d3316ad0eb7c
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-348d-b3d26f5fdbc4
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-1448-a9e68a846c75
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-4ce4-bc691c1ba83b
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-bd43-335c985feec3
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-1fc8-98fa9d853ae5
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-dffd-29f154d5ea60
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-bb29-794d89f7adfe
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-c04a-a3faa9cb7e69
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-34cc-c72a06833a85
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-04b5-2d18f4f1d220
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-1b54-179c4e30f1f5
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-c892-f7b033991165
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-4a88-062eb71bedd3
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-758e-7596f2a3522e
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-d2a3-a0ab8d3b83fd
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-d01a-cf671bf1b87d
00020000-55f1-38c9-0852-5656c367b3c6	00030000-55f1-38c9-49da-c832c463bcb0
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-1976-f1386527734a
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-8ee7-122220941c79
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-758e-7596f2a3522e
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-71e0-5750f0b08da4
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-c27d-b1cdf02df179
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-4071-aadb68feeb69
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-4210-871c0bd853df
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-05c2-c03162fe7415
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-fcbe-ef736a44f26c
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-b740-e00a77b36902
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-af39-8f000ba43fb6
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-ef1d-9fc8174a7de4
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-a77d-9d5c4d591f79
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-dfc8-b826e0f428d3
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-1ca1-cf9c93250832
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-60ac-239f1881f80c
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-df95-245a3348c131
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-2a52-d3316ad0eb7c
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-7e83-e1b946cba69c
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-348d-b3d26f5fdbc4
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-1b5b-bb48d88fe131
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-2ece-afa86013b41a
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-2f5c-87b1a85970d9
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-300b-99f2ebc5c9bf
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-d14d-b0b9500cee72
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-81d8-f723c928d728
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-c112-1767dfdf9b29
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-1448-a9e68a846c75
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-fb4c-5f1240c73963
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-4ce4-bc691c1ba83b
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-595f-776cd4f8460a
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-91e8-8c6581ace224
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-07c0-afd6fde9f5c4
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-94b7-7c7d116348d1
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-0299-e6aaee45183a
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-8c00-8dc4e45cf8a9
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-9b9f-890e303ce37f
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-bd43-335c985feec3
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-62bb-744800253adf
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-1fc8-98fa9d853ae5
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-24b4-f5d898babf54
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-87ae-858fbd4af2b3
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-e171-1fe3ceab25cf
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-417c-b00aa168821f
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-efa4-8ce81bf30b33
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-9d27-456359cdb405
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-91ac-0cbe283f1b1e
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-c6b8-b3eb80db0385
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-e69e-7033af9ab063
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-dffd-29f154d5ea60
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-ff17-10e80583b0c4
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-bb29-794d89f7adfe
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-b088-73061b2b7189
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-442b-305582ebe834
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-1fa7-2c6f65082973
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-f114-b30f8a4e97bf
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-c683-5efe663fe60d
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-fd67-fad6ff4f6947
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-02fb-e24152f1deee
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-c04a-a3faa9cb7e69
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-3668-31cbded433ff
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-6f25-94177526c8cd
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-a56b-5ad7c8d2b93a
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-1546-6cf0e4ee003c
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-64e5-14777d0c95e6
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-8342-973c2c4d6833
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-57e4-a339619859ed
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-2aae-5fc8927d1117
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-b945-2c9fa5fcf88f
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-cde4-cdc020d89f31
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-3404-0de89f283bc1
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-0002-da43e5e8c556
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-a891-7544cf096ee4
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-bf17-73decd94d8a2
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-3299-fe5c5e9583b3
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-a1b6-3ef5d0aadeaa
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-fd47-b101f0718d8e
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-5c61-8e5339357333
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-b6fc-e5eadddd012c
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-6e16-93d9f525e90a
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-f3cc-67fc2311ec24
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-9356-a2ad64891a92
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-7269-010189d5232f
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-bc5c-f1b61c6a8e72
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-9619-2fef27c6afd2
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-94ba-892122ff140c
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-c822-401c1c237fa7
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-34cc-c72a06833a85
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-15c6-f661b4ac6151
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-7c2b-b006463cdb5f
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-e668-8d3f83d3fde7
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-4c0a-4e89d8cf6bdb
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-734a-da57cd27fa64
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-04b5-2d18f4f1d220
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-6120-1561a0db2de7
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-1b54-179c4e30f1f5
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-97bc-f1e0bc47e54a
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-4083-303ee24dae07
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-7324-1438450282b2
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-5d71-1617e65764b2
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-818d-f2e0e874c96a
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-c58b-f45abcf18849
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-4bcf-fb52042d6ae6
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-1b54-ab5687ad0391
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-7de0-3d3cc0185979
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-c892-f7b033991165
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-b2a9-d987fb457483
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-6e01-38cc3bdec09e
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-cb54-994e3495d762
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-93d2-9b743d01608b
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-1760-c7b69c24fb2f
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-b357-dc0cefd5680e
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-59fd-62fedccb6793
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-eb2a-40ecc72392fb
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-9f79-ba6e007dc4d4
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-cd44-3e1dd369c4bb
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-2235-60bcaf91881d
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-4a88-062eb71bedd3
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-b0f6-7ed000825cb7
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-d2a3-a0ab8d3b83fd
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-cc3c-e8a94f98ec73
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-d3d5-3c56c8be4e51
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-3a31-9493588f151b
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-1062-e189dad9d5b6
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-e7e3-f08471ef5971
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-cb16-3be3f3f220c1
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-2908-ee58aa774e60
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-2339-ea01df70b395
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-b80a-82a24a3fae48
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-f2ca-9db5da410242
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-2a65-e164cc91f7ee
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-8c85-f0d76a587726
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-320b-dbc1db9ce9af
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-59cc-fd98d2bbbc0a
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-20da-ef5b4ec9caf5
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-be56-3f2199ccc277
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-43c4-13252016c156
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-d01a-cf671bf1b87d
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-036b-98fe53042f02
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-49da-c832c463bcb0
00020000-55f1-38ca-8511-d6496784cf60	00030000-55f1-38c9-6468-6158751ca18d
\.


--
-- TOC entry 2968 (class 0 OID 18461122)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 18461156)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 18461285)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f1-38ca-d60a-e731441366d1	00090000-55f1-38ca-338f-8e52ed7daabe	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f1-38ca-9493-ec9b5f635dba	00090000-55f1-38ca-d634-9ae3889aeb30	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f1-38ca-b78a-2713880cba69	00090000-55f1-38ca-cec2-567f8f918600	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f1-38ca-244c-e51722b9a93b	00090000-55f1-38ca-266f-8896dce53b51	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2946 (class 0 OID 18460887)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f1-38ca-2a49-daf02cdd6129	00040000-55f1-38c9-0f27-398482acef01	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-38ca-8662-1c0803820fd0	00040000-55f1-38c9-0f27-398482acef01	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f1-38ca-d762-33095e3bb147	00040000-55f1-38c9-0f27-398482acef01	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-38ca-f0e9-e8445701c6f2	00040000-55f1-38c9-0f27-398482acef01	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-38ca-c71a-3c696b55bbf6	00040000-55f1-38c9-0f27-398482acef01	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-38ca-75d7-ed0f11db49e2	00040000-55f1-38c9-0fba-d8456e955940	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-38ca-19e1-6d19b8dbce06	00040000-55f1-38c9-1ce0-01c1aff94ece	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-38ca-0930-ed986ec38aa9	00040000-55f1-38c9-8c40-bdf42e32d65d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-38ca-0087-fa7b82329e96	00040000-55f1-38c9-9a37-fff04c52b5ed	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f1-38cb-67f9-3e3adf493d32	00040000-55f1-38c9-0f27-398482acef01	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2948 (class 0 OID 18460921)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f1-38c9-c83f-c165c5112717	8341	Adlešiči
00050000-55f1-38c9-44cd-9e632335b69d	5270	Ajdovščina
00050000-55f1-38c9-c6bc-9f5b86f3c261	6280	Ankaran/Ancarano
00050000-55f1-38c9-2f67-c8995d0fa6c8	9253	Apače
00050000-55f1-38c9-aa13-b544c89b24ee	8253	Artiče
00050000-55f1-38c9-31ed-a174dc8f0773	4275	Begunje na Gorenjskem
00050000-55f1-38c9-47cc-ccbba2fca9b6	1382	Begunje pri Cerknici
00050000-55f1-38c9-06cc-9f0906bf0e4f	9231	Beltinci
00050000-55f1-38c9-f275-f2fd0ed457d5	2234	Benedikt
00050000-55f1-38c9-27b8-0cffc19c9d0c	2345	Bistrica ob Dravi
00050000-55f1-38c9-f15b-3d9f4be6d39d	3256	Bistrica ob Sotli
00050000-55f1-38c9-7eb8-686d6a87325a	8259	Bizeljsko
00050000-55f1-38c9-9aa4-957b64be1833	1223	Blagovica
00050000-55f1-38c9-722d-91fa6313f04c	8283	Blanca
00050000-55f1-38c9-f5f7-60b0c2201334	4260	Bled
00050000-55f1-38c9-f63a-c3b4e60c51be	4273	Blejska Dobrava
00050000-55f1-38c9-64ce-7398ddc86382	9265	Bodonci
00050000-55f1-38c9-8b8d-59e9fdc50cbe	9222	Bogojina
00050000-55f1-38c9-bdae-adc179a66df4	4263	Bohinjska Bela
00050000-55f1-38c9-2127-279aeaa079e6	4264	Bohinjska Bistrica
00050000-55f1-38c9-50fd-2e6fe961df3f	4265	Bohinjsko jezero
00050000-55f1-38c9-ea80-7af26ef31717	1353	Borovnica
00050000-55f1-38c9-2400-61583dd803ac	8294	Boštanj
00050000-55f1-38c9-1e4e-8284678f4ffa	5230	Bovec
00050000-55f1-38c9-9c58-16cfa68e0b3f	5295	Branik
00050000-55f1-38c9-e141-5dc5d15ac23f	3314	Braslovče
00050000-55f1-38c9-5130-62fdec2252b4	5223	Breginj
00050000-55f1-38c9-ac0c-68c5802100bf	8280	Brestanica
00050000-55f1-38c9-0b8b-c48cc8c6e975	2354	Bresternica
00050000-55f1-38c9-e765-0f69bd0976b2	4243	Brezje
00050000-55f1-38c9-3045-fa27f6ca3696	1351	Brezovica pri Ljubljani
00050000-55f1-38c9-1e84-6aaf22da857c	8250	Brežice
00050000-55f1-38c9-1c74-62023b6dc79d	4210	Brnik - Aerodrom
00050000-55f1-38c9-46df-541e6e878106	8321	Brusnice
00050000-55f1-38c9-a310-b2c1ab5bf9bd	3255	Buče
00050000-55f1-38c9-c53d-a10dcfc15064	8276	Bučka 
00050000-55f1-38c9-a11f-9bd24fd7e469	9261	Cankova
00050000-55f1-38c9-a1ea-cab94376c8a2	3000	Celje 
00050000-55f1-38c9-4fce-c41e61aa191e	3001	Celje - poštni predali
00050000-55f1-38c9-13f4-2e4f50f1f010	4207	Cerklje na Gorenjskem
00050000-55f1-38c9-6370-4611e90d7882	8263	Cerklje ob Krki
00050000-55f1-38c9-6e6b-795fa2b388cb	1380	Cerknica
00050000-55f1-38c9-8bbc-abe2fd0a9565	5282	Cerkno
00050000-55f1-38c9-227b-98560ecc012f	2236	Cerkvenjak
00050000-55f1-38c9-5197-5e11cbbc97b3	2215	Ceršak
00050000-55f1-38c9-9361-bba60778ac31	2326	Cirkovce
00050000-55f1-38c9-7f53-1b4f91a629f5	2282	Cirkulane
00050000-55f1-38c9-f6a7-8e89d1a98fe5	5273	Col
00050000-55f1-38c9-a6b7-c53bfabdc833	8251	Čatež ob Savi
00050000-55f1-38c9-40fb-05ce639853b2	1413	Čemšenik
00050000-55f1-38c9-329b-bd82053083ba	5253	Čepovan
00050000-55f1-38c9-64e0-1db10cac9b29	9232	Črenšovci
00050000-55f1-38c9-ae97-fde2d37ee951	2393	Črna na Koroškem
00050000-55f1-38c9-a966-66acdfa94576	6275	Črni Kal
00050000-55f1-38c9-6d30-08b94d6e0db7	5274	Črni Vrh nad Idrijo
00050000-55f1-38c9-cbfb-d955330038cd	5262	Črniče
00050000-55f1-38c9-ed46-1b28f5ea4480	8340	Črnomelj
00050000-55f1-38c9-f004-ad4ba8d9983b	6271	Dekani
00050000-55f1-38c9-6fe6-96dcbb1b3b81	5210	Deskle
00050000-55f1-38c9-fe19-51612f2a410b	2253	Destrnik
00050000-55f1-38c9-ffcd-911530e60dc4	6215	Divača
00050000-55f1-38c9-c982-27662f6d9800	1233	Dob
00050000-55f1-38c9-2ef6-18e3c6f39479	3224	Dobje pri Planini
00050000-55f1-38c9-ae14-4dde8e20be43	8257	Dobova
00050000-55f1-38c9-6663-d4f8453fa3b4	1423	Dobovec
00050000-55f1-38c9-a14d-e12654fa1ddf	5263	Dobravlje
00050000-55f1-38c9-2363-356bb23e0026	3204	Dobrna
00050000-55f1-38c9-19ec-3c6a12848516	8211	Dobrnič
00050000-55f1-38c9-8b61-09230983dfea	1356	Dobrova
00050000-55f1-38c9-cf56-b0345a553555	9223	Dobrovnik/Dobronak 
00050000-55f1-38c9-0832-a92825df8294	5212	Dobrovo v Brdih
00050000-55f1-38c9-5c81-93bf25fbebce	1431	Dol pri Hrastniku
00050000-55f1-38c9-9920-23d2536864db	1262	Dol pri Ljubljani
00050000-55f1-38c9-35f9-40c4aa710643	1273	Dole pri Litiji
00050000-55f1-38c9-7dab-1d2d8bfbb9ae	1331	Dolenja vas
00050000-55f1-38c9-4071-011d6f36a76f	8350	Dolenjske Toplice
00050000-55f1-38c9-fb35-4498fe622aad	1230	Domžale
00050000-55f1-38c9-7b90-066ec8ee1815	2252	Dornava
00050000-55f1-38c9-0d96-51392ced1b54	5294	Dornberk
00050000-55f1-38c9-e288-d458384676fd	1319	Draga
00050000-55f1-38c9-b134-3a21b03cc334	8343	Dragatuš
00050000-55f1-38c9-c172-3e9d0bbb0b16	3222	Dramlje
00050000-55f1-38c9-8f2b-d653fd220585	2370	Dravograd
00050000-55f1-38c9-dd57-32bf382ee9cf	4203	Duplje
00050000-55f1-38c9-225e-3790d2578363	6221	Dutovlje
00050000-55f1-38c9-2702-717fc60f373d	8361	Dvor
00050000-55f1-38c9-b1da-7a18579374a7	2343	Fala
00050000-55f1-38c9-295a-a7efff7e2b6a	9208	Fokovci
00050000-55f1-38c9-b5dc-4afc1c295619	2313	Fram
00050000-55f1-38c9-6d28-c95b08e4a996	3213	Frankolovo
00050000-55f1-38c9-3373-5978a99fec7e	1274	Gabrovka
00050000-55f1-38c9-8330-bdc5a946f403	8254	Globoko
00050000-55f1-38c9-c216-39354accf51f	5275	Godovič
00050000-55f1-38c9-911c-f035701a3a1b	4204	Golnik
00050000-55f1-38c9-4d80-a9a9406f8683	3303	Gomilsko
00050000-55f1-38c9-975e-63ea38f01ee4	4224	Gorenja vas
00050000-55f1-38c9-455e-b593cd1cbd2d	3263	Gorica pri Slivnici
00050000-55f1-38c9-c98b-41f6a878de3b	2272	Gorišnica
00050000-55f1-38c9-e7a1-f7218fbe1e80	9250	Gornja Radgona
00050000-55f1-38c9-e1bc-91f5765eba47	3342	Gornji Grad
00050000-55f1-38c9-7fb6-b1904f1ce31b	4282	Gozd Martuljek
00050000-55f1-38c9-d227-13479c3fbba5	6272	Gračišče
00050000-55f1-38c9-73f6-d2ef3eeb04e2	9264	Grad
00050000-55f1-38c9-e6fa-5bd52aacdcaf	8332	Gradac
00050000-55f1-38c9-228d-52d62876eb22	1384	Grahovo
00050000-55f1-38c9-9824-8efb850fa987	5242	Grahovo ob Bači
00050000-55f1-38c9-652b-95e7365abac7	5251	Grgar
00050000-55f1-38c9-1c90-e63ac5cb0640	3302	Griže
00050000-55f1-38c9-8ae8-687f5e21f0a3	3231	Grobelno
00050000-55f1-38c9-55e1-17311b38089b	1290	Grosuplje
00050000-55f1-38c9-cb50-e8eb1407b6a2	2288	Hajdina
00050000-55f1-38c9-d1e9-acd5f205961f	8362	Hinje
00050000-55f1-38c9-7c15-a81bde5c2d59	2311	Hoče
00050000-55f1-38c9-883e-e5e358baee9f	9205	Hodoš/Hodos
00050000-55f1-38c9-7431-90bd378d7f01	1354	Horjul
00050000-55f1-38c9-8843-c34b3a0f86bc	1372	Hotedršica
00050000-55f1-38c9-269f-574683b6adcf	1430	Hrastnik
00050000-55f1-38c9-df2b-8070780c8828	6225	Hruševje
00050000-55f1-38c9-dace-d8d36d2f7219	4276	Hrušica
00050000-55f1-38c9-43a2-393a8e0f386e	5280	Idrija
00050000-55f1-38c9-d634-f802ce7676dd	1292	Ig
00050000-55f1-38c9-0327-8ff6174d33e0	6250	Ilirska Bistrica
00050000-55f1-38c9-72d0-e745bb6e9f3f	6251	Ilirska Bistrica-Trnovo
00050000-55f1-38c9-c1dd-b3883e549a8d	1295	Ivančna Gorica
00050000-55f1-38c9-ecde-f74ce67037ed	2259	Ivanjkovci
00050000-55f1-38c9-8df7-90382ecd8719	1411	Izlake
00050000-55f1-38c9-7dca-53894e8f3e39	6310	Izola/Isola
00050000-55f1-38c9-e02e-8bcf07dd67ca	2222	Jakobski Dol
00050000-55f1-38c9-4841-252d24fba0ec	2221	Jarenina
00050000-55f1-38c9-c6cb-02351586f4e4	6254	Jelšane
00050000-55f1-38c9-6a3a-8e5513b45106	4270	Jesenice
00050000-55f1-38c9-0927-8d8513b3217b	8261	Jesenice na Dolenjskem
00050000-55f1-38c9-e7a6-f62b28427e24	3273	Jurklošter
00050000-55f1-38c9-2f54-d5c098ed8815	2223	Jurovski Dol
00050000-55f1-38c9-34dc-de930588b946	2256	Juršinci
00050000-55f1-38c9-d8e7-a30df806bb37	5214	Kal nad Kanalom
00050000-55f1-38c9-0d2b-4606c5451f05	3233	Kalobje
00050000-55f1-38c9-6514-ad0cdc6fef70	4246	Kamna Gorica
00050000-55f1-38c9-77c2-4619bdf54f31	2351	Kamnica
00050000-55f1-38c9-d3d5-7a1a255355c4	1241	Kamnik
00050000-55f1-38c9-c8dd-47b93a0c7c2c	5213	Kanal
00050000-55f1-38c9-e200-c92c59fc6489	8258	Kapele
00050000-55f1-38c9-9242-b579c458e404	2362	Kapla
00050000-55f1-38c9-90fc-a7d3ffbf9a6b	2325	Kidričevo
00050000-55f1-38c9-997f-bdbc0a00ad10	1412	Kisovec
00050000-55f1-38c9-a3ca-d625d0ff27bb	6253	Knežak
00050000-55f1-38c9-dc6f-b2b9ef6d1ee9	5222	Kobarid
00050000-55f1-38c9-5c70-48ce3b227448	9227	Kobilje
00050000-55f1-38c9-b507-19789320e749	1330	Kočevje
00050000-55f1-38c9-23c5-9986404c57fa	1338	Kočevska Reka
00050000-55f1-38c9-3653-04c19ae12ab5	2276	Kog
00050000-55f1-38c9-f079-969f65e9abc6	5211	Kojsko
00050000-55f1-38c9-7956-02e2101ad497	6223	Komen
00050000-55f1-38c9-ab3f-083f87075548	1218	Komenda
00050000-55f1-38c9-f954-d9088e74cddd	6000	Koper/Capodistria 
00050000-55f1-38c9-f636-1fba6739012c	6001	Koper/Capodistria - poštni predali
00050000-55f1-38c9-1adb-df8819340414	8282	Koprivnica
00050000-55f1-38c9-3f28-f377e9783a27	5296	Kostanjevica na Krasu
00050000-55f1-38c9-b7bc-57169f9a7418	8311	Kostanjevica na Krki
00050000-55f1-38c9-51a9-aa8b76684134	1336	Kostel
00050000-55f1-38c9-4ed8-478503716620	6256	Košana
00050000-55f1-38c9-94a8-d1a1e90e99ee	2394	Kotlje
00050000-55f1-38c9-b4f9-90118fbf958f	6240	Kozina
00050000-55f1-38c9-156c-c4463d6c37bd	3260	Kozje
00050000-55f1-38c9-e97e-6da2ef208f97	4000	Kranj 
00050000-55f1-38c9-4df1-e70cfdd1b117	4001	Kranj - poštni predali
00050000-55f1-38c9-6941-75bd2b8dca8b	4280	Kranjska Gora
00050000-55f1-38c9-509e-89bbe51ba5dc	1281	Kresnice
00050000-55f1-38c9-4032-885d2ffcb551	4294	Križe
00050000-55f1-38c9-c2d1-2aa7bd6ac252	9206	Križevci
00050000-55f1-38c9-141a-fb14eb56639d	9242	Križevci pri Ljutomeru
00050000-55f1-38c9-0e97-d6f854a3a41f	1301	Krka
00050000-55f1-38c9-a6da-b2d3ef06d0fd	8296	Krmelj
00050000-55f1-38c9-3e87-c50ffe129895	4245	Kropa
00050000-55f1-38c9-427e-f42d1cc4eded	8262	Krška vas
00050000-55f1-38c9-796b-30ef00f627c1	8270	Krško
00050000-55f1-38c9-8fd5-d5237a5670ec	9263	Kuzma
00050000-55f1-38c9-f780-38268ce33ca1	2318	Laporje
00050000-55f1-38c9-7fa0-9358fd94a955	3270	Laško
00050000-55f1-38c9-ec45-cbd6f57bd7df	1219	Laze v Tuhinju
00050000-55f1-38c9-51a1-1acfb4bf6a8d	2230	Lenart v Slovenskih goricah
00050000-55f1-38c9-cae1-580c696704ce	9220	Lendava/Lendva
00050000-55f1-38c9-3578-eabebedeb070	4248	Lesce
00050000-55f1-38c9-3257-3a0a6f9ddd0b	3261	Lesično
00050000-55f1-38c9-151e-e5d8db560036	8273	Leskovec pri Krškem
00050000-55f1-38c9-b569-ce9d8606d47e	2372	Libeliče
00050000-55f1-38c9-d254-8b431ac552c1	2341	Limbuš
00050000-55f1-38c9-d480-b1616c87d550	1270	Litija
00050000-55f1-38c9-5aed-47cf9ed48dd0	3202	Ljubečna
00050000-55f1-38c9-c483-355958b1ae7c	1000	Ljubljana 
00050000-55f1-38c9-17be-6e29870eff8c	1001	Ljubljana - poštni predali
00050000-55f1-38c9-7776-69786e1afb97	1231	Ljubljana - Črnuče
00050000-55f1-38c9-c768-475cc6e82130	1261	Ljubljana - Dobrunje
00050000-55f1-38c9-dad8-decc5f10e154	1260	Ljubljana - Polje
00050000-55f1-38c9-f85b-f3b63c8282a7	1210	Ljubljana - Šentvid
00050000-55f1-38c9-73ae-aa95b80e3851	1211	Ljubljana - Šmartno
00050000-55f1-38c9-84c3-e47fcb09ac61	3333	Ljubno ob Savinji
00050000-55f1-38c9-1fa9-c0338c70bfb6	9240	Ljutomer
00050000-55f1-38c9-9d67-3d1823e13689	3215	Loče
00050000-55f1-38c9-b74b-dd7415dace40	5231	Log pod Mangartom
00050000-55f1-38c9-42b8-0b9a56ae84d7	1358	Log pri Brezovici
00050000-55f1-38c9-e47d-a5ac0ed73daf	1370	Logatec
00050000-55f1-38c9-078b-292ff282b4dd	1371	Logatec
00050000-55f1-38c9-b907-8b04fc4e72ea	1434	Loka pri Zidanem Mostu
00050000-55f1-38c9-b056-0fc7821b3c77	3223	Loka pri Žusmu
00050000-55f1-38c9-8cc9-58965c854c5c	6219	Lokev
00050000-55f1-38c9-0045-238591af88a2	1318	Loški Potok
00050000-55f1-38c9-7314-939238db44af	2324	Lovrenc na Dravskem polju
00050000-55f1-38c9-dc45-d6dd1d9d1896	2344	Lovrenc na Pohorju
00050000-55f1-38c9-a6ea-03837ab9d879	3334	Luče
00050000-55f1-38c9-0178-5059ed112a1c	1225	Lukovica
00050000-55f1-38c9-e094-1d373ad05466	9202	Mačkovci
00050000-55f1-38c9-34f1-a805773212ea	2322	Majšperk
00050000-55f1-38c9-36fd-812d3839892c	2321	Makole
00050000-55f1-38c9-d067-59fb15353d66	9243	Mala Nedelja
00050000-55f1-38c9-71d2-2348b0a51c20	2229	Malečnik
00050000-55f1-38c9-db31-efa5582290a0	6273	Marezige
00050000-55f1-38c9-85da-30925eb2b571	2000	Maribor 
00050000-55f1-38c9-235d-b04e8e8df283	2001	Maribor - poštni predali
00050000-55f1-38c9-a584-78a726d4c106	2206	Marjeta na Dravskem polju
00050000-55f1-38c9-ccd2-edd695712de7	2281	Markovci
00050000-55f1-38c9-46b3-31af00a668e1	9221	Martjanci
00050000-55f1-38c9-24fa-8c6f77fe9d46	6242	Materija
00050000-55f1-38c9-e288-7bb2bdaa9f10	4211	Mavčiče
00050000-55f1-38c9-39b3-d830b3055f5a	1215	Medvode
00050000-55f1-38c9-e4ee-4e5901a5f84e	1234	Mengeš
00050000-55f1-38c9-cc3b-e59f6f014e5d	8330	Metlika
00050000-55f1-38c9-8e20-dde702e2613d	2392	Mežica
00050000-55f1-38c9-3fb0-27e05c7955f8	2204	Miklavž na Dravskem polju
00050000-55f1-38c9-16b6-da788337fc22	2275	Miklavž pri Ormožu
00050000-55f1-38c9-5f79-1d9d992d321b	5291	Miren
00050000-55f1-38c9-698b-470cec1d227c	8233	Mirna
00050000-55f1-38c9-c422-76a3c25dc55c	8216	Mirna Peč
00050000-55f1-38c9-05c3-6d2377e79316	2382	Mislinja
00050000-55f1-38c9-6618-9716f9af43d0	4281	Mojstrana
00050000-55f1-38c9-f43f-a77cd0c05b61	8230	Mokronog
00050000-55f1-38c9-4acb-20ebcf12c06c	1251	Moravče
00050000-55f1-38c9-3c5a-edc8b539316e	9226	Moravske Toplice
00050000-55f1-38c9-a022-85615b9c34b8	5216	Most na Soči
00050000-55f1-38c9-af98-a8be10a5a0e8	1221	Motnik
00050000-55f1-38c9-4146-f716c58113e1	3330	Mozirje
00050000-55f1-38c9-6e46-2b15d99b96fa	9000	Murska Sobota 
00050000-55f1-38c9-af63-b73d933886af	9001	Murska Sobota - poštni predali
00050000-55f1-38c9-3c8e-648f70fedbf1	2366	Muta
00050000-55f1-38c9-bedb-b50a624ba0d8	4202	Naklo
00050000-55f1-38c9-67b0-345fcb123625	3331	Nazarje
00050000-55f1-38c9-bd2d-f6d6f27d3429	1357	Notranje Gorice
00050000-55f1-38c9-680b-b8f4762f8759	3203	Nova Cerkev
00050000-55f1-38c9-b6d4-da4016efc393	5000	Nova Gorica 
00050000-55f1-38c9-75be-9e340a8ae09f	5001	Nova Gorica - poštni predali
00050000-55f1-38c9-ace4-cf80d0bb0097	1385	Nova vas
00050000-55f1-38c9-df76-492f47ef4c0f	8000	Novo mesto
00050000-55f1-38c9-0c32-98e218563f90	8001	Novo mesto - poštni predali
00050000-55f1-38c9-b291-39dfb48b5dc2	6243	Obrov
00050000-55f1-38c9-18f7-d9dd7c073a70	9233	Odranci
00050000-55f1-38c9-8dff-6e02eab9c8f2	2317	Oplotnica
00050000-55f1-38c9-6d11-a1a5d6ca39b0	2312	Orehova vas
00050000-55f1-38c9-d9b4-b1bd3b6cafd1	2270	Ormož
00050000-55f1-38c9-deac-6fe69a5a6fb2	1316	Ortnek
00050000-55f1-38c9-1248-df245a8ed54a	1337	Osilnica
00050000-55f1-38c9-44b2-cc416d2d53b8	8222	Otočec
00050000-55f1-38c9-5ffe-b138ffd81f3f	2361	Ožbalt
00050000-55f1-38c9-4ab8-f85b20976dad	2231	Pernica
00050000-55f1-38c9-5a52-f1b0481d1659	2211	Pesnica pri Mariboru
00050000-55f1-38c9-32bd-c1c2140f0bcd	9203	Petrovci
00050000-55f1-38c9-1925-a052599db690	3301	Petrovče
00050000-55f1-38c9-22f8-a918bde61031	6330	Piran/Pirano
00050000-55f1-38c9-a761-8fc97986c232	8255	Pišece
00050000-55f1-38c9-9204-10b7735228a4	6257	Pivka
00050000-55f1-38c9-84f0-ba61cc806b6d	6232	Planina
00050000-55f1-38c9-98ab-ce0f9d528d25	3225	Planina pri Sevnici
00050000-55f1-38c9-c8c5-6ad6e1907cfa	6276	Pobegi
00050000-55f1-38c9-af1d-16259659cd2c	8312	Podbočje
00050000-55f1-38c9-76b6-5d92f30cf46d	5243	Podbrdo
00050000-55f1-38c9-e4bf-92d25e04b06c	3254	Podčetrtek
00050000-55f1-38c9-6dea-16ffe8887dd7	2273	Podgorci
00050000-55f1-38c9-35e6-7dcc0d86a274	6216	Podgorje
00050000-55f1-38c9-88de-f7928cde3ed6	2381	Podgorje pri Slovenj Gradcu
00050000-55f1-38c9-ecac-33ec55910d1d	6244	Podgrad
00050000-55f1-38c9-af58-54ef0ca708e0	1414	Podkum
00050000-55f1-38c9-3289-8ff215933999	2286	Podlehnik
00050000-55f1-38c9-0e92-e4de82f69c6d	5272	Podnanos
00050000-55f1-38c9-7ac9-af9a1c11327f	4244	Podnart
00050000-55f1-38c9-72aa-044827a82474	3241	Podplat
00050000-55f1-38c9-7a45-b5472103cf1c	3257	Podsreda
00050000-55f1-38c9-411d-a465da9e1984	2363	Podvelka
00050000-55f1-38c9-c1d0-90d3e239bbd0	2208	Pohorje
00050000-55f1-38c9-b468-114befed4917	2257	Polenšak
00050000-55f1-38c9-7197-17298c75de2b	1355	Polhov Gradec
00050000-55f1-38c9-bd95-699291f4063b	4223	Poljane nad Škofjo Loko
00050000-55f1-38c9-7a7f-f86e6abce6cd	2319	Poljčane
00050000-55f1-38c9-59d6-c2d49424e0b5	1272	Polšnik
00050000-55f1-38c9-7b31-080b7aa23578	3313	Polzela
00050000-55f1-38c9-3680-b11ae62934d9	3232	Ponikva
00050000-55f1-38c9-780b-3c357ca55538	6320	Portorož/Portorose
00050000-55f1-38c9-80f8-57a552a21105	6230	Postojna
00050000-55f1-38c9-0294-ce018843912e	2331	Pragersko
00050000-55f1-38c9-c90c-72bfc042063f	3312	Prebold
00050000-55f1-38c9-aaf5-ed90796936a8	4205	Preddvor
00050000-55f1-38c9-b65a-ea0b28d77c49	6255	Prem
00050000-55f1-38c9-5bb4-306a28ea81ae	1352	Preserje
00050000-55f1-38c9-8f9a-9f0ff2991995	6258	Prestranek
00050000-55f1-38c9-5ee8-fcac83bfd7ca	2391	Prevalje
00050000-55f1-38c9-da84-9b2d59ba90f8	3262	Prevorje
00050000-55f1-38c9-ed9a-105d6979be06	1276	Primskovo 
00050000-55f1-38c9-2c9c-8e7eb1371642	3253	Pristava pri Mestinju
00050000-55f1-38c9-3784-754bd293754f	9207	Prosenjakovci/Partosfalva
00050000-55f1-38c9-8ac1-111f460f3518	5297	Prvačina
00050000-55f1-38c9-7f93-144523679c40	2250	Ptuj
00050000-55f1-38c9-dee2-7b7fc14ca799	2323	Ptujska Gora
00050000-55f1-38c9-2d02-d57be1877905	9201	Puconci
00050000-55f1-38c9-7934-a66032d48446	2327	Rače
00050000-55f1-38c9-0f1d-1f0e2f5fae55	1433	Radeče
00050000-55f1-38c9-cb52-789926103d9b	9252	Radenci
00050000-55f1-38c9-27e8-192230874d93	2360	Radlje ob Dravi
00050000-55f1-38c9-2481-c3ac3c02f1a9	1235	Radomlje
00050000-55f1-38c9-ef5a-f1e8491f664c	4240	Radovljica
00050000-55f1-38c9-a592-3a14fa8765d9	8274	Raka
00050000-55f1-38c9-e42b-e2bea9cb20aa	1381	Rakek
00050000-55f1-38c9-092a-6620efab3d2f	4283	Rateče - Planica
00050000-55f1-38c9-fcf8-d5f2d4239032	2390	Ravne na Koroškem
00050000-55f1-38c9-84ec-e0661eb812a5	9246	Razkrižje
00050000-55f1-38c9-56a3-f2cdb6bd7370	3332	Rečica ob Savinji
00050000-55f1-38c9-551d-a7bf10b69fc6	5292	Renče
00050000-55f1-38c9-3734-ccda6c1c687f	1310	Ribnica
00050000-55f1-38c9-e6ff-13197c1ab87e	2364	Ribnica na Pohorju
00050000-55f1-38c9-44b2-b06a73c68bf3	3272	Rimske Toplice
00050000-55f1-38c9-95f3-ecc5cfcf2cc4	1314	Rob
00050000-55f1-38c9-1e67-8d139238fe5a	5215	Ročinj
00050000-55f1-38c9-2112-2f4adc4dfffb	3250	Rogaška Slatina
00050000-55f1-38c9-34a5-7a6dcdd59e55	9262	Rogašovci
00050000-55f1-38c9-2827-a2c66e0a3904	3252	Rogatec
00050000-55f1-38c9-c3c0-5851592538b1	1373	Rovte
00050000-55f1-38c9-3fdc-c148f8e63b0f	2342	Ruše
00050000-55f1-38c9-844a-fd81a7fcdb9e	1282	Sava
00050000-55f1-38c9-6a63-f317a07ed01b	6333	Sečovlje/Sicciole
00050000-55f1-38c9-a5a6-2499861f0fbe	4227	Selca
00050000-55f1-38c9-03f8-de18c70b5137	2352	Selnica ob Dravi
00050000-55f1-38c9-a279-12acaae0f3d2	8333	Semič
00050000-55f1-38c9-98f0-a6db600c39ca	8281	Senovo
00050000-55f1-38c9-c47e-0b291c3d1691	6224	Senožeče
00050000-55f1-38c9-9ba8-640b305411b4	8290	Sevnica
00050000-55f1-38c9-4534-642b53fb8298	6210	Sežana
00050000-55f1-38c9-f564-0e89b3a76ba9	2214	Sladki Vrh
00050000-55f1-38c9-11ca-a5138c8cbd10	5283	Slap ob Idrijci
00050000-55f1-38c9-bf6a-875750782738	2380	Slovenj Gradec
00050000-55f1-38c9-2c98-706a570745ae	2310	Slovenska Bistrica
00050000-55f1-38c9-3e37-8aad51cb0090	3210	Slovenske Konjice
00050000-55f1-38c9-867c-ec3d23285d47	1216	Smlednik
00050000-55f1-38c9-1cf0-c43084902d1a	5232	Soča
00050000-55f1-38c9-6aa0-052627cf3c15	1317	Sodražica
00050000-55f1-38c9-5111-a0ba9fe8c605	3335	Solčava
00050000-55f1-38c9-d3d3-0bf600b785fe	5250	Solkan
00050000-55f1-38c9-bdc8-0c52e7a15328	4229	Sorica
00050000-55f1-38c9-3845-289237009782	4225	Sovodenj
00050000-55f1-38c9-c0a2-0aa2a69fc8c4	5281	Spodnja Idrija
00050000-55f1-38c9-eb00-5e3ab2fd9236	2241	Spodnji Duplek
00050000-55f1-38c9-7199-93bddc456dfc	9245	Spodnji Ivanjci
00050000-55f1-38c9-c81c-a04cbe33d9c9	2277	Središče ob Dravi
00050000-55f1-38c9-9484-7a13b684963e	4267	Srednja vas v Bohinju
00050000-55f1-38c9-04aa-10ca27bb344e	8256	Sromlje 
00050000-55f1-38c9-e2f2-52315fbdb562	5224	Srpenica
00050000-55f1-38c9-395a-adac6644dc12	1242	Stahovica
00050000-55f1-38c9-ae62-46753edce44d	1332	Stara Cerkev
00050000-55f1-38c9-b679-5024a986bd18	8342	Stari trg ob Kolpi
00050000-55f1-38c9-d7c4-a840e2f988a7	1386	Stari trg pri Ložu
00050000-55f1-38c9-1f3b-242941f84ab9	2205	Starše
00050000-55f1-38c9-121f-d32de130dc75	2289	Stoperce
00050000-55f1-38c9-ef51-82c497184706	8322	Stopiče
00050000-55f1-38c9-2fed-84ab3b60fdb2	3206	Stranice
00050000-55f1-38c9-d9cd-a558853cd8cb	8351	Straža
00050000-55f1-38c9-5705-754fd812e9a3	1313	Struge
00050000-55f1-38c9-b924-4dd0f006ed3e	8293	Studenec
00050000-55f1-38c9-2892-57ef0ff73de8	8331	Suhor
00050000-55f1-38c9-6a82-9b4a80fc0219	2233	Sv. Ana v Slovenskih goricah
00050000-55f1-38c9-2878-96f93b2e79db	2235	Sv. Trojica v Slovenskih goricah
00050000-55f1-38c9-3cc7-3afa17722d3f	2353	Sveti Duh na Ostrem Vrhu
00050000-55f1-38c9-c142-4ec83261b239	9244	Sveti Jurij ob Ščavnici
00050000-55f1-38c9-5e2b-439353bc8b96	3264	Sveti Štefan
00050000-55f1-38c9-a2e7-8ba66715bf50	2258	Sveti Tomaž
00050000-55f1-38c9-0d44-30bad28dc934	9204	Šalovci
00050000-55f1-38c9-8ae8-6eff47ea704e	5261	Šempas
00050000-55f1-38c9-76c6-ec6f5214ee0a	5290	Šempeter pri Gorici
00050000-55f1-38c9-a6ad-b7c21ac4f8df	3311	Šempeter v Savinjski dolini
00050000-55f1-38c9-5c59-66aa7c32a529	4208	Šenčur
00050000-55f1-38c9-ec98-834daaa7c9d0	2212	Šentilj v Slovenskih goricah
00050000-55f1-38c9-ba6e-f04bc9c2cff3	8297	Šentjanž
00050000-55f1-38c9-1476-a49eddb8633a	2373	Šentjanž pri Dravogradu
00050000-55f1-38c9-16c3-72dd4df1bee4	8310	Šentjernej
00050000-55f1-38c9-3a46-41ac63a2c598	3230	Šentjur
00050000-55f1-38c9-6cd1-533d3770ea40	3271	Šentrupert
00050000-55f1-38c9-aecc-e519ab5e669f	8232	Šentrupert
00050000-55f1-38c9-108e-ae3c1e733714	1296	Šentvid pri Stični
00050000-55f1-38c9-94b3-b133099c5d58	8275	Škocjan
00050000-55f1-38c9-6f51-3cdda1cb6448	6281	Škofije
00050000-55f1-38c9-b362-3a745c16ad4f	4220	Škofja Loka
00050000-55f1-38c9-5c5f-dc0446327a0e	3211	Škofja vas
00050000-55f1-38c9-f9d5-a3c62547494e	1291	Škofljica
00050000-55f1-38c9-b20d-b9a7aa134753	6274	Šmarje
00050000-55f1-38c9-f8c8-0dbc65e72357	1293	Šmarje - Sap
00050000-55f1-38c9-6dcf-0dbc73754b74	3240	Šmarje pri Jelšah
00050000-55f1-38c9-1d26-9dec36418ddf	8220	Šmarješke Toplice
00050000-55f1-38c9-ee4c-82442eb72cc4	2315	Šmartno na Pohorju
00050000-55f1-38c9-f38e-ddf329bf7f1e	3341	Šmartno ob Dreti
00050000-55f1-38c9-7509-aea98e56a2e8	3327	Šmartno ob Paki
00050000-55f1-38c9-e618-b3208990436c	1275	Šmartno pri Litiji
00050000-55f1-38c9-07b2-a39d2df6d06e	2383	Šmartno pri Slovenj Gradcu
00050000-55f1-38c9-2d6a-e37f129f8a8c	3201	Šmartno v Rožni dolini
00050000-55f1-38c9-b9ef-d8307d645c7a	3325	Šoštanj
00050000-55f1-38c9-0615-c18605af8642	6222	Štanjel
00050000-55f1-38c9-61f8-3ed3d32efd0f	3220	Štore
00050000-55f1-38c9-dca3-ca989f40629d	3304	Tabor
00050000-55f1-38c9-1670-0be3286afd67	3221	Teharje
00050000-55f1-38c9-f08b-20ece07b1f7a	9251	Tišina
00050000-55f1-38c9-408a-356b3b676097	5220	Tolmin
00050000-55f1-38c9-420b-37448c12392d	3326	Topolšica
00050000-55f1-38c9-94c5-4ce911b6977b	2371	Trbonje
00050000-55f1-38c9-0324-ad7d04dab61a	1420	Trbovlje
00050000-55f1-38c9-a84d-6cf3950ad7bf	8231	Trebelno 
00050000-55f1-38c9-aa26-f684295473b0	8210	Trebnje
00050000-55f1-38c9-23f6-9fe05daf5860	5252	Trnovo pri Gorici
00050000-55f1-38c9-68b0-32db1f7b9f01	2254	Trnovska vas
00050000-55f1-38c9-481d-e81e61dda2d6	1222	Trojane
00050000-55f1-38c9-b3fd-fda52db32282	1236	Trzin
00050000-55f1-38c9-3add-78d5cd750a63	4290	Tržič
00050000-55f1-38c9-5513-58eef49bdd0e	8295	Tržišče
00050000-55f1-38c9-8434-649b9d7e5246	1311	Turjak
00050000-55f1-38c9-5142-6cb6bfe0439e	9224	Turnišče
00050000-55f1-38c9-9edd-e79b850f81e1	8323	Uršna sela
00050000-55f1-38c9-8fb2-599c03a1e60a	1252	Vače
00050000-55f1-38c9-0f4d-52399b8faac8	3320	Velenje 
00050000-55f1-38c9-66be-420e995bdadd	3322	Velenje - poštni predali
00050000-55f1-38c9-c07a-0807dce84165	8212	Velika Loka
00050000-55f1-38c9-2f2e-4db61d06a8f5	2274	Velika Nedelja
00050000-55f1-38c9-8f45-4e6fac7a8865	9225	Velika Polana
00050000-55f1-38c9-e5d3-9bf37c098071	1315	Velike Lašče
00050000-55f1-38c9-f5ac-697e48c3c6b7	8213	Veliki Gaber
00050000-55f1-38c9-d87c-36bb55836f14	9241	Veržej
00050000-55f1-38c9-0bdc-973fd2e0d314	1312	Videm - Dobrepolje
00050000-55f1-38c9-aabf-91d5ed0be6b0	2284	Videm pri Ptuju
00050000-55f1-38c9-f2bc-835bc277bf8b	8344	Vinica
00050000-55f1-38c9-b795-5a5a69dbe8be	5271	Vipava
00050000-55f1-38c9-6dca-fc7bef0b4772	4212	Visoko
00050000-55f1-38c9-4794-f193d4d74288	1294	Višnja Gora
00050000-55f1-38c9-6e67-db83f527ea9a	3205	Vitanje
00050000-55f1-38c9-7c68-dd2dbd6cfe7f	2255	Vitomarci
00050000-55f1-38c9-0f0b-a6d1f62b0aac	1217	Vodice
00050000-55f1-38c9-bab0-eafc302eab68	3212	Vojnik\t
00050000-55f1-38c9-8276-520ffbf1bd96	5293	Volčja Draga
00050000-55f1-38c9-98c8-400f903c36d2	2232	Voličina
00050000-55f1-38c9-a85e-96accf2e53f0	3305	Vransko
00050000-55f1-38c9-46ba-1e459632746c	6217	Vremski Britof
00050000-55f1-38c9-5cfa-7505865ab900	1360	Vrhnika
00050000-55f1-38c9-fef9-19b2929569de	2365	Vuhred
00050000-55f1-38c9-6eff-a542b8c88c82	2367	Vuzenica
00050000-55f1-38c9-2edd-403d8f02c82f	8292	Zabukovje 
00050000-55f1-38c9-e274-e933af6d8fa1	1410	Zagorje ob Savi
00050000-55f1-38c9-d933-d5acb830ed72	1303	Zagradec
00050000-55f1-38c9-9d7b-49bc17bf68ea	2283	Zavrč
00050000-55f1-38c9-d00f-cf7ed794eebd	8272	Zdole 
00050000-55f1-38c9-bbf1-7f41e6fafb6d	4201	Zgornja Besnica
00050000-55f1-38c9-60a2-b9631267b708	2242	Zgornja Korena
00050000-55f1-38c9-91cf-f6e3153f1868	2201	Zgornja Kungota
00050000-55f1-38c9-6973-41fbf9f96abe	2316	Zgornja Ložnica
00050000-55f1-38c9-f64f-4506ce73d716	2314	Zgornja Polskava
00050000-55f1-38c9-7ce7-89d2f327eb5d	2213	Zgornja Velka
00050000-55f1-38c9-4b8b-ce620c5d504c	4247	Zgornje Gorje
00050000-55f1-38c9-8ea6-7dfb1f06c7a1	4206	Zgornje Jezersko
00050000-55f1-38c9-3625-dd761f67b504	2285	Zgornji Leskovec
00050000-55f1-38c9-d18f-8e72c209be90	1432	Zidani Most
00050000-55f1-38c9-f1bb-ff945b205765	3214	Zreče
00050000-55f1-38c9-d7e1-a30b94ed3e11	4209	Žabnica
00050000-55f1-38c9-b3e3-e9ba9109b891	3310	Žalec
00050000-55f1-38c9-13b0-582343564ebb	4228	Železniki
00050000-55f1-38c9-3ee5-f7a86490857c	2287	Žetale
00050000-55f1-38c9-d829-5c2d575eccf4	4226	Žiri
00050000-55f1-38c9-c6fd-c1c794798991	4274	Žirovnica
00050000-55f1-38c9-c940-5be0b8baaa28	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 18461464)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 18461096)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 18460906)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f1-38ca-d421-debbad9d413d	00080000-55f1-38ca-2a49-daf02cdd6129	\N	00040000-55f1-38c9-0f27-398482acef01	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f1-38ca-6d6f-6c0ed76611f7	00080000-55f1-38ca-2a49-daf02cdd6129	\N	00040000-55f1-38c9-0f27-398482acef01	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f1-38ca-6a7c-8d9d92534546	00080000-55f1-38ca-8662-1c0803820fd0	\N	00040000-55f1-38c9-0f27-398482acef01	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 18460984)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 18461108)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 18461478)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 18461488)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f1-38ca-975e-6a3827e21d14	00080000-55f1-38ca-d762-33095e3bb147	0987	AK
00190000-55f1-38ca-3845-7d948ca6e3ad	00080000-55f1-38ca-8662-1c0803820fd0	0989	AK
00190000-55f1-38ca-7432-fd4bf333ea40	00080000-55f1-38ca-f0e9-e8445701c6f2	0986	AK
00190000-55f1-38ca-7aba-8dfe1a2d745e	00080000-55f1-38ca-75d7-ed0f11db49e2	0984	AK
00190000-55f1-38ca-d341-f755e2836803	00080000-55f1-38ca-19e1-6d19b8dbce06	0983	AK
00190000-55f1-38ca-4113-33533bee82db	00080000-55f1-38ca-0930-ed986ec38aa9	0982	AK
00190000-55f1-38cb-656d-31bc8ed6ba91	00080000-55f1-38cb-67f9-3e3adf493d32	1001	AK
\.


--
-- TOC entry 2989 (class 0 OID 18461421)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f1-38ca-8a58-ef1185eb45cc	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2993 (class 0 OID 18461496)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 18461137)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f1-38ca-2298-c507ec4cda8d	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f1-38ca-65c5-a3397bebcb16	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f1-38ca-b7e3-5e3b0e628bf4	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f1-38ca-da97-02dc0797351d	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f1-38ca-6799-fdc639b15f14	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f1-38ca-5d0e-06ba670a0b49	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f1-38ca-4823-1ead85d41ae6	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2962 (class 0 OID 18461081)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 18461071)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 18461274)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 18461211)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 18460779)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f1-38cb-67f9-3e3adf493d32	00010000-55f1-38c9-1655-ee9dd713a962	2015-09-10 10:01:15	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f1-38cb-50c7-1d756f3a8dfb	00010000-55f1-38c9-1655-ee9dd713a962	2015-09-10 10:01:15	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f1-38cb-656d-31bc8ed6ba91	00010000-55f1-38c9-1655-ee9dd713a962	2015-09-10 10:01:15	INS	a:0:{}
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2971 (class 0 OID 18461150)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 18460817)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f1-38c9-3db9-a9fc3d189a16	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f1-38c9-926e-481bfccd971c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f1-38c9-59e1-b0f240cfe08c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f1-38c9-99f9-6f480ea7b92a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f1-38c9-0dc6-a37b58e0bc0b	planer	Planer dogodkov v koledarju	t
00020000-55f1-38c9-f84c-0b97aea713e6	kadrovska	Kadrovska služba	t
00020000-55f1-38c9-3e0f-607f268140c9	arhivar	Ažuriranje arhivalij	t
00020000-55f1-38c9-854b-d4b9b320effe	igralec	Igralec	t
00020000-55f1-38c9-0852-5656c367b3c6	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f1-38ca-8511-d6496784cf60	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2938 (class 0 OID 18460801)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f1-38c9-be17-46a941e1aa70	00020000-55f1-38c9-59e1-b0f240cfe08c
00010000-55f1-38c9-1655-ee9dd713a962	00020000-55f1-38c9-59e1-b0f240cfe08c
00010000-55f1-38ca-67c2-2fbfdb14f2b6	00020000-55f1-38ca-8511-d6496784cf60
\.


--
-- TOC entry 2973 (class 0 OID 18461164)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 18461102)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 18461048)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 18460766)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f1-38c9-c30c-b3e71b78c64c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f1-38c9-7082-bbb8ef548218	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f1-38c9-896b-6a51c1aaa556	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f1-38c9-531f-c34c3a6b4d48	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f1-38c9-b810-485ec71e1077	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2933 (class 0 OID 18460758)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f1-38c9-203f-561774669483	00230000-55f1-38c9-531f-c34c3a6b4d48	popa
00240000-55f1-38c9-6f49-5be077091752	00230000-55f1-38c9-531f-c34c3a6b4d48	oseba
00240000-55f1-38c9-d306-f5fda3a4d204	00230000-55f1-38c9-531f-c34c3a6b4d48	sezona
00240000-55f1-38c9-395c-8b54ae3ba247	00230000-55f1-38c9-7082-bbb8ef548218	prostor
00240000-55f1-38c9-34c8-a368ea440e9c	00230000-55f1-38c9-531f-c34c3a6b4d48	besedilo
00240000-55f1-38c9-c9d8-e7b1c624909b	00230000-55f1-38c9-531f-c34c3a6b4d48	uprizoritev
00240000-55f1-38c9-676e-e5533851259b	00230000-55f1-38c9-531f-c34c3a6b4d48	funkcija
00240000-55f1-38c9-2d92-e7c6a0361c04	00230000-55f1-38c9-531f-c34c3a6b4d48	tipfunkcije
00240000-55f1-38c9-74a5-5c409b99511b	00230000-55f1-38c9-531f-c34c3a6b4d48	alternacija
00240000-55f1-38c9-bb49-09e290c0e445	00230000-55f1-38c9-c30c-b3e71b78c64c	pogodba
00240000-55f1-38c9-2f99-db1314040a9e	00230000-55f1-38c9-531f-c34c3a6b4d48	zaposlitev
00240000-55f1-38c9-962a-d1cfd2a65b52	00230000-55f1-38c9-531f-c34c3a6b4d48	zvrstuprizoritve
00240000-55f1-38c9-cd54-d16d99524d96	00230000-55f1-38c9-c30c-b3e71b78c64c	programdela
00240000-55f1-38c9-fb83-8f1143148e02	00230000-55f1-38c9-531f-c34c3a6b4d48	zapis
\.


--
-- TOC entry 2932 (class 0 OID 18460753)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
cbcd5f6f-389e-4549-8c70-b85903a5a725	00240000-55f1-38c9-203f-561774669483	0	1001
\.


--
-- TOC entry 2978 (class 0 OID 18461221)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f1-38ca-3f48-cf2d61e2832e	000e0000-55f1-38ca-ee87-0f8ceccdea56	00080000-55f1-38ca-2a49-daf02cdd6129	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f1-38c9-de03-99e9165a0547
00270000-55f1-38ca-f13a-013d77178455	000e0000-55f1-38ca-ee87-0f8ceccdea56	00080000-55f1-38ca-2a49-daf02cdd6129	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f1-38c9-de03-99e9165a0547
\.


--
-- TOC entry 2945 (class 0 OID 18460879)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 18461058)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f1-38cb-6e94-1e4e460a265f	00180000-55f1-38ca-423a-b8a99c33ebb1	000c0000-55f1-38cb-caed-2aa41480b602	00090000-55f1-38ca-7cd5-c90c3b9956a4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f1-38cb-861a-9e97e73b1256	00180000-55f1-38ca-423a-b8a99c33ebb1	000c0000-55f1-38cb-f6b9-5f6bc2e00995	00090000-55f1-38ca-266f-8896dce53b51	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f1-38cb-afef-ac19d97eff58	00180000-55f1-38ca-423a-b8a99c33ebb1	000c0000-55f1-38cb-9185-de48fbbb38a1	00090000-55f1-38ca-a1de-67d743169ec4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f1-38cb-4c33-d137a74af234	00180000-55f1-38ca-423a-b8a99c33ebb1	000c0000-55f1-38cb-a189-62dd4ac1d697	00090000-55f1-38ca-7218-0321e4ad2ad3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f1-38cb-d57c-ab50c81366f3	00180000-55f1-38ca-423a-b8a99c33ebb1	000c0000-55f1-38cb-6704-9173689504b7	00090000-55f1-38ca-8ee6-b3edbd03d0ad	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f1-38cb-3d7b-b02e2c94a013	00180000-55f1-38ca-5174-adb0dc36d5cb	\N	00090000-55f1-38ca-8ee6-b3edbd03d0ad	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2981 (class 0 OID 18461262)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f1-38c9-65b4-e71661082325	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f1-38c9-ac39-51dfe55eb6e5	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f1-38c9-f7d6-2be9915e0234	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f1-38c9-93e5-6be54dea6f8d	04	Režija	Režija	Režija	umetnik
000f0000-55f1-38c9-297b-393c2e4d95d6	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f1-38c9-262e-7127e2f0f4ea	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f1-38c9-b33b-acc1b367f78f	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f1-38c9-add3-3bc0927fafcd	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f1-38c9-6194-faa0b231486a	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f1-38c9-000f-53ffa9b3ca81	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f1-38c9-c78c-c3cc885e9af6	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f1-38c9-20bc-c657720291d4	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f1-38c9-71b0-44494003a93b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f1-38c9-888f-6c6fe7fbd602	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f1-38c9-d35b-44cc80a6b6a1	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f1-38c9-2344-6245f9195650	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f1-38c9-35a1-6df01d8d8af2	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f1-38c9-057a-e6c8ba07148a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2994 (class 0 OID 18461506)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f1-38c9-f4e2-edf7004d16fb	01	Velika predstava	f	1.00	1.00
002b0000-55f1-38c9-b4e9-d70578f30eff	02	Mala predstava	f	0.50	0.50
002b0000-55f1-38c9-66a8-907498c47517	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f1-38c9-2105-95477cf700d4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f1-38c9-0bdc-aa28e8ef91ad	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2950 (class 0 OID 18460941)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 18460788)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f1-38c9-1655-ee9dd713a962	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROCpKSvEqNZ1NmWcS7SstixZitIE5OKUy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f1-38ca-d488-cf75d34128e2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f1-38ca-8995-467319686688	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f1-38ca-2d35-a4329090581e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f1-38ca-2ba6-8271e4e85d34	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f1-38ca-45d6-68f093a22f18	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f1-38ca-3605-cdfff4c85637	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f1-38ca-1943-f56163707d79	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f1-38ca-0937-ce34da140c65	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f1-38ca-7a6c-1b91b1cd49c8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f1-38ca-67c2-2fbfdb14f2b6	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f1-38c9-be17-46a941e1aa70	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2985 (class 0 OID 18461311)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f1-38ca-d75c-3a85e432f035	00160000-55f1-38ca-a346-1df4e3062582	\N	00140000-55f1-38c9-5977-05c697003be8	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f1-38ca-6799-fdc639b15f14
000e0000-55f1-38ca-ee87-0f8ceccdea56	00160000-55f1-38ca-909c-3fd9265efa9c	\N	00140000-55f1-38c9-bbde-7c09a8c1af2a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f1-38ca-5d0e-06ba670a0b49
000e0000-55f1-38ca-444e-f68189a96207	\N	\N	00140000-55f1-38c9-bbde-7c09a8c1af2a	00190000-55f1-38ca-975e-6a3827e21d14	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f1-38ca-6799-fdc639b15f14
000e0000-55f1-38ca-a29b-f39ac41c6b95	\N	\N	00140000-55f1-38c9-bbde-7c09a8c1af2a	00190000-55f1-38ca-975e-6a3827e21d14	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f1-38ca-6799-fdc639b15f14
000e0000-55f1-38ca-4c50-a8f377d54cdc	\N	\N	00140000-55f1-38c9-bbde-7c09a8c1af2a	00190000-55f1-38ca-975e-6a3827e21d14	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f1-38ca-2298-c507ec4cda8d
000e0000-55f1-38ca-156e-6baf2623f956	\N	\N	00140000-55f1-38c9-bbde-7c09a8c1af2a	00190000-55f1-38ca-975e-6a3827e21d14	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f1-38ca-2298-c507ec4cda8d
\.


--
-- TOC entry 2955 (class 0 OID 18461002)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f1-38ca-e157-eb496a78ccec	000e0000-55f1-38ca-ee87-0f8ceccdea56	\N	1	
00200000-55f1-38ca-fdfe-4003b6b57424	000e0000-55f1-38ca-ee87-0f8ceccdea56	\N	2	
\.


--
-- TOC entry 2969 (class 0 OID 18461129)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 18461235)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f1-38c9-724c-af0768d0946e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f1-38c9-6667-e96a1aa98b3e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f1-38c9-6b86-135b41bc6fea	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f1-38c9-1616-2db6c5fe3089	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f1-38c9-6d03-f2e2f0719d92	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f1-38c9-00cb-918441ed2bfb	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f1-38c9-0181-5fbda5e9f71a	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f1-38c9-5128-789a4e319d06	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f1-38c9-de03-99e9165a0547	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f1-38c9-5acb-729fdd7c47e4	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f1-38c9-9cda-e4ce991f0564	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f1-38c9-e94d-fa7fbad23af5	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f1-38c9-094e-e762d2df47b1	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f1-38c9-d851-c65ab67c4d98	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f1-38c9-ed64-de11bbf1289f	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f1-38c9-a978-4e6f9b2cf4af	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f1-38c9-6a98-4dcac285c99e	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f1-38c9-c0c6-bff2c1689990	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f1-38c9-51a3-ca1844b1fdcc	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f1-38c9-3248-0d37ed4f5b95	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f1-38c9-f5d9-1a325bf67555	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f1-38c9-3c30-e3c8e3f321e9	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f1-38c9-adc8-2470dba5783e	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f1-38c9-1f32-5aec8945b836	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f1-38c9-8a1a-2134c2418724	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f1-38c9-d971-a76ae0fb583e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f1-38c9-8df6-81db8150fbb4	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f1-38c9-f107-6074ed9f7f33	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2997 (class 0 OID 18461552)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 18461524)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 18461564)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 18461201)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f1-38ca-7e87-f830cb42decc	00090000-55f1-38ca-266f-8896dce53b51	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f1-38ca-99e2-8fc1cda2e8bb	00090000-55f1-38ca-a1de-67d743169ec4	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f1-38ca-14b8-c8d95a0467e6	00090000-55f1-38ca-8181-481a1acdce21	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f1-38ca-b2b2-629a048a9065	00090000-55f1-38ca-bc28-bc6c8b85a2fe	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f1-38ca-52cb-cfcae5239380	00090000-55f1-38ca-7cd5-c90c3b9956a4	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f1-38ca-26dc-019c383911a5	00090000-55f1-38ca-5999-f38e41ebf23a	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2957 (class 0 OID 18461038)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 18461301)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f1-38c9-5977-05c697003be8	01	Drama	drama (SURS 01)
00140000-55f1-38c9-e06e-2574f57b548f	02	Opera	opera (SURS 02)
00140000-55f1-38c9-21c2-97928af457e4	03	Balet	balet (SURS 03)
00140000-55f1-38c9-8929-a6252c9ca2b1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f1-38c9-7471-07b71cf7c993	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f1-38c9-bbde-7c09a8c1af2a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f1-38c9-bb86-8143ac270aed	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2975 (class 0 OID 18461191)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 18460842)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 18461360)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 18461350)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 18461260)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 18461604)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 18461027)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 18461047)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 18461522)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 18460967)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 18461415)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 18461187)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 18461000)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 18460981)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 18461094)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 18461581)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 18461588)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 18461612)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 18461121)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 18460939)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 18460851)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 18460875)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 18460831)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 18460816)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 18461127)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 18461163)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 18461296)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 18460903)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 18460927)
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
-- TOC entry 2679 (class 2606 OID 18461476)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 18461100)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 18460917)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 18460988)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 18461112)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 18461485)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 18461493)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 18461463)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 18461504)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 18461145)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 18461085)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 18461076)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 18461284)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 18461218)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 18460787)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 18461154)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 18460805)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 18460825)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 18461172)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 18461107)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 18461056)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 18460775)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 18460763)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 18460757)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 18461231)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 18460884)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 18461067)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 18461271)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 18461516)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 18460952)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 18460800)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 18461329)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 18461010)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 18461135)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 18461243)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 18461562)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 18461546)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 18461570)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 18461209)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 18461042)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 18461309)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 18461199)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 18461036)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 18461037)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 18461035)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 18461034)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2624 (class 1259 OID 18461232)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 18461233)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 18461234)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 18461583)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 18461582)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 18460905)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 18461128)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 18461550)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 18461549)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 18461551)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 18461548)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 18461547)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 18461114)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 18461113)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 18461011)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 18461188)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 18461190)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 18461189)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 18460983)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 18460982)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 18461505)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 18461298)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 18461299)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 18461300)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 18461571)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 18461334)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 18461331)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 18461335)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 18461333)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 18461332)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 18460954)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 18460953)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 18460878)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 18461155)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 18460832)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 18460833)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 18461175)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 18461174)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 18461173)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 18460989)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 18460990)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 18460765)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 18461080)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 18461078)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 18461077)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 18461079)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 18460806)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 18460807)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 18461136)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 18461605)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 18461613)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 18461614)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 18461101)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 18461219)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 18461220)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 18461420)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 18461419)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 18461416)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 18461417)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 18461418)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 18460919)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 18460918)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 18460920)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 18461149)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 18461148)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 18461486)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 18461487)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 18461364)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 18461365)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 18461362)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 18461363)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 18461210)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 18461089)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 18461088)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 18461086)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 18461087)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 18461352)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 18461351)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 18461001)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 18461477)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 18461523)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 18461589)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 18461590)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 18460853)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 18460852)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 18460885)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 18460886)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 18461070)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 18461069)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 18461068)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2543 (class 1259 OID 18461029)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2544 (class 1259 OID 18461030)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2545 (class 1259 OID 18461028)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2546 (class 1259 OID 18461032)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2547 (class 1259 OID 18461033)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2548 (class 1259 OID 18461031)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 18460904)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 18460968)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 18460970)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 18460969)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 18460971)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 18461095)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 18461297)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 18461330)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 18461272)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 18461273)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 18460876)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 18460877)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 18461200)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 18460776)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 18460940)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 18460764)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2597 (class 1259 OID 18461147)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 18461146)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 18461361)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 18460928)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 18461310)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 18461563)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 18461494)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 18461495)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 18461261)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 18461057)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 18460826)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 18461735)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 18461740)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 18461760)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 18461730)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 18461750)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 18461755)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 18461745)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2785 (class 2606 OID 18461910)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2784 (class 2606 OID 18461915)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2783 (class 2606 OID 18461920)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 18462085)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2818 (class 2606 OID 18462080)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 18461670)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 18461840)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2812 (class 2606 OID 18462065)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 18462060)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 18462070)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 18462055)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2815 (class 2606 OID 18462050)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2767 (class 2606 OID 18461835)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 18461830)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 18461725)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 18461880)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 18461890)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 18461885)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 18461705)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 18461700)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 18461820)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 18462040)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 18461925)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 18461930)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 18461935)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2816 (class 2606 OID 18462075)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2790 (class 2606 OID 18461955)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2793 (class 2606 OID 18461940)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2789 (class 2606 OID 18461960)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2791 (class 2606 OID 18461950)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2792 (class 2606 OID 18461945)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 18461695)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 18461690)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 18461655)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 18461650)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 18461860)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 18461630)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 18461635)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2774 (class 2606 OID 18461875)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 18461870)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 18461865)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 18461710)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 18461715)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 18461615)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2757 (class 2606 OID 18461795)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2759 (class 2606 OID 18461785)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2760 (class 2606 OID 18461780)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2758 (class 2606 OID 18461790)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 18461620)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 18461625)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 18461845)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2821 (class 2606 OID 18462100)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 18462105)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2822 (class 2606 OID 18462110)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 18461825)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2782 (class 2606 OID 18461900)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2781 (class 2606 OID 18461905)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 18462015)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 18462010)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 18461995)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 18462000)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2802 (class 2606 OID 18462005)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 18461680)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 18461675)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 18461685)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 18461855)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2772 (class 2606 OID 18461850)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2807 (class 2606 OID 18462025)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2806 (class 2606 OID 18462030)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2797 (class 2606 OID 18461985)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 18461990)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2799 (class 2606 OID 18461975)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2798 (class 2606 OID 18461980)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 18461895)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 18461815)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2762 (class 2606 OID 18461810)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 18461800)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2763 (class 2606 OID 18461805)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 18461970)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2795 (class 2606 OID 18461965)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 18461720)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 18462020)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2808 (class 2606 OID 18462035)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 18462045)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 18462090)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 18462095)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 18461645)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 18461640)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 18461660)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 18461665)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 18461775)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 18461770)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 18461765)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-10 10:01:16 CEST

--
-- PostgreSQL database dump complete
--

