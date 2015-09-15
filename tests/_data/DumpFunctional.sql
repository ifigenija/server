--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-15 12:12:58 CEST

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
-- TOC entry 181 (class 1259 OID 19560787)
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
-- TOC entry 226 (class 1259 OID 19561306)
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
-- TOC entry 225 (class 1259 OID 19561289)
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
-- TOC entry 219 (class 1259 OID 19561197)
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
-- TOC entry 240 (class 1259 OID 19561544)
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
-- TOC entry 195 (class 1259 OID 19560965)
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
-- TOC entry 197 (class 1259 OID 19560996)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19561470)
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
-- TOC entry 190 (class 1259 OID 19560908)
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
-- TOC entry 227 (class 1259 OID 19561319)
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
-- TOC entry 213 (class 1259 OID 19561129)
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
-- TOC entry 193 (class 1259 OID 19560944)
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
-- TOC entry 191 (class 1259 OID 19560925)
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
-- TOC entry 202 (class 1259 OID 19561043)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19561525)
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
-- TOC entry 239 (class 1259 OID 19561537)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19561559)
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
-- TOC entry 206 (class 1259 OID 19561068)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19560882)
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
-- TOC entry 182 (class 1259 OID 19560796)
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
-- TOC entry 183 (class 1259 OID 19560807)
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
-- TOC entry 178 (class 1259 OID 19560761)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19560780)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19561075)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19561109)
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
-- TOC entry 222 (class 1259 OID 19561238)
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
-- TOC entry 185 (class 1259 OID 19560840)
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
-- TOC entry 187 (class 1259 OID 19560874)
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
-- TOC entry 229 (class 1259 OID 19561417)
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
-- TOC entry 203 (class 1259 OID 19561049)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19560859)
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
-- TOC entry 192 (class 1259 OID 19560937)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 19561061)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19561431)
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
-- TOC entry 231 (class 1259 OID 19561441)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19561374)
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
-- TOC entry 232 (class 1259 OID 19561449)
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
-- TOC entry 209 (class 1259 OID 19561090)
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
-- TOC entry 201 (class 1259 OID 19561034)
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
-- TOC entry 200 (class 1259 OID 19561024)
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
-- TOC entry 221 (class 1259 OID 19561227)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19561164)
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
-- TOC entry 175 (class 1259 OID 19560732)
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
-- TOC entry 174 (class 1259 OID 19560730)
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
-- TOC entry 210 (class 1259 OID 19561103)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19560770)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19560754)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19561117)
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
-- TOC entry 204 (class 1259 OID 19561055)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19561001)
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
-- TOC entry 173 (class 1259 OID 19560719)
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
-- TOC entry 172 (class 1259 OID 19560711)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19560706)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19561174)
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
-- TOC entry 184 (class 1259 OID 19560832)
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
-- TOC entry 199 (class 1259 OID 19561011)
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
-- TOC entry 220 (class 1259 OID 19561215)
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
-- TOC entry 233 (class 1259 OID 19561459)
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
-- TOC entry 189 (class 1259 OID 19560894)
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
-- TOC entry 176 (class 1259 OID 19560741)
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
-- TOC entry 224 (class 1259 OID 19561264)
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
-- TOC entry 194 (class 1259 OID 19560955)
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
-- TOC entry 208 (class 1259 OID 19561082)
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
-- TOC entry 218 (class 1259 OID 19561188)
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
-- TOC entry 236 (class 1259 OID 19561505)
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
-- TOC entry 235 (class 1259 OID 19561477)
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
-- TOC entry 237 (class 1259 OID 19561517)
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
-- TOC entry 215 (class 1259 OID 19561154)
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
-- TOC entry 196 (class 1259 OID 19560991)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19561254)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19561144)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 19560735)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 19560787)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 19561306)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f7-ef28-954e-56dc1f55bdb0	000d0000-55f7-ef28-c36e-6395a58c668e	\N	00090000-55f7-ef28-b208-5a8ca1635e2b	000b0000-55f7-ef28-41ea-3c7abb6b867e	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f7-ef28-db0d-2e83d21f4d0a	000d0000-55f7-ef28-c917-8bdf43249b35	00100000-55f7-ef28-740a-60ecef3256d4	00090000-55f7-ef28-f94a-6106222a58e6	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f7-ef28-7210-1797d9e6ab6b	000d0000-55f7-ef28-feef-db13c3c6fd1e	00100000-55f7-ef28-8974-dfad1bd7a8fd	00090000-55f7-ef28-61a5-1e11d10329db	\N	0003	t	\N	2015-09-15	\N	2	t	\N	f	f
000c0000-55f7-ef28-799b-337462bd4bd7	000d0000-55f7-ef28-bfc2-c2ded9ab1d16	\N	00090000-55f7-ef28-7122-cdae2e6a8c76	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f7-ef28-cb3d-79d2bbe19c27	000d0000-55f7-ef28-8601-19209855862b	\N	00090000-55f7-ef28-2ea2-76f129e2e6ef	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f7-ef28-e33f-01d2f916a447	000d0000-55f7-ef28-a1d9-ee4e2e10609f	\N	00090000-55f7-ef28-9f5d-682c1dafe7b5	000b0000-55f7-ef28-2469-45fcd636bdec	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f7-ef28-d09c-281efc2b220b	000d0000-55f7-ef28-a9fe-1455128855fc	00100000-55f7-ef28-d79f-fb95d78c08fc	00090000-55f7-ef28-9f65-4822bc3865aa	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f7-ef28-8a18-0b2bd61850f5	000d0000-55f7-ef28-a456-00b71318a4d9	\N	00090000-55f7-ef28-62f4-0f33b87569f8	000b0000-55f7-ef28-f785-9ad75a1fcc75	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f7-ef28-1e2d-c525f94eddb5	000d0000-55f7-ef28-a9fe-1455128855fc	00100000-55f7-ef28-947e-9c8bda4b7baa	00090000-55f7-ef28-e2c7-57ffd2fe8c54	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f7-ef28-5e4f-4b8c6d89d894	000d0000-55f7-ef28-a9fe-1455128855fc	00100000-55f7-ef28-e77c-1e040b479ec4	00090000-55f7-ef28-93aa-bf5882e4ce63	\N	0010	t	\N	2015-09-15	\N	16	f	\N	f	t
000c0000-55f7-ef28-e179-cdc7cd799ec7	000d0000-55f7-ef28-a9fe-1455128855fc	00100000-55f7-ef28-7a6d-4dbee919bdd8	00090000-55f7-ef28-24bb-b7ab1c792c70	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f7-ef28-6d87-a8a4d9ca9ff8	000d0000-55f7-ef28-c228-6bf044988566	\N	00090000-55f7-ef28-f94a-6106222a58e6	000b0000-55f7-ef28-d623-c245766e93e4	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2986 (class 0 OID 19561289)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 19561197)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f7-ef27-fd93-ce97da411dc2	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f7-ef27-554f-fd5f18779e1e	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f7-ef27-8957-afa286f81f28	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 19561544)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 19560965)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f7-ef28-9f41-3cf7867e4376	\N	\N	00200000-55f7-ef28-5fc0-f833871c95f3	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f7-ef28-baeb-b3bbecf611c4	\N	\N	00200000-55f7-ef28-3f54-6a6f9e55d863	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f7-ef28-c4fc-1bf58058b313	\N	\N	00200000-55f7-ef28-2f75-f24c8fa0bbd2	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f7-ef28-6606-5a56633adce9	\N	\N	00200000-55f7-ef28-506d-b5d7e7fe5bcc	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f7-ef28-25c6-a8e4e9ebaab9	\N	\N	00200000-55f7-ef28-52ef-a427ef5a1bf8	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2958 (class 0 OID 19560996)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 19561470)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19560908)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f7-ef26-ae64-35f455dbfaba	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f7-ef26-9b39-de3084163367	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f7-ef26-9ccb-8c05e1e4222c	AL	ALB	008	Albania 	Albanija	\N
00040000-55f7-ef26-5ad6-0e523a6359e3	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f7-ef26-595f-5928dfd19ad7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f7-ef26-bc93-a51eed7af678	AD	AND	020	Andorra 	Andora	\N
00040000-55f7-ef26-7ba9-700b301dbd53	AO	AGO	024	Angola 	Angola	\N
00040000-55f7-ef26-fea1-486399eb4108	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f7-ef26-cc86-c764570171ae	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f7-ef26-d02e-ad3db608af2c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f7-ef26-d987-a29962f0f4de	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f7-ef26-ec0e-84484a0fada9	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f7-ef26-738d-25e3fcac703f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f7-ef26-491e-67edfb4c3b4b	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f7-ef26-b6fd-82392adf6508	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f7-ef26-3b1a-8fc8ae966e41	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f7-ef26-bb74-7b1be897c749	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f7-ef26-94f4-7b4d5425f4a7	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f7-ef26-9055-4b57d39da8f2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f7-ef26-193d-b70ceba4d0ea	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f7-ef26-d4ca-c70f72ac5af6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f7-ef26-b865-6e270a530e45	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f7-ef26-3506-4884f9d379b7	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f7-ef26-704b-03d2599f4782	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f7-ef26-1c7d-f1401b762ee1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f7-ef26-df5a-098be94a4b20	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f7-ef26-aa17-ee48797f8d97	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f7-ef26-05f5-9490e99a4f35	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f7-ef26-dc2e-80ce73f6f083	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f7-ef26-1da6-b38e9337578f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f7-ef26-6c83-3ffd0055eeb1	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f7-ef26-3587-da5130a7c111	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f7-ef26-91ea-9674348baf9b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f7-ef26-a385-a3842a942e28	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f7-ef26-c4ad-91465cc6508e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f7-ef26-23d3-46b187d9efe0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f7-ef26-55ec-b2b36c8b8f75	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f7-ef26-ee75-1918a6ce6a4a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f7-ef26-ed68-b751f614b554	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f7-ef26-f686-66991abf4111	CA	CAN	124	Canada 	Kanada	\N
00040000-55f7-ef26-5fdc-0cfe687ed014	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f7-ef26-c0d5-606216198a33	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f7-ef26-152a-e1767604662c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f7-ef26-7e11-c58b09b98ae9	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f7-ef26-c7ce-3c11dd4439ee	CL	CHL	152	Chile 	Čile	\N
00040000-55f7-ef26-9829-bdaf87a3a870	CN	CHN	156	China 	Kitajska	\N
00040000-55f7-ef26-1052-d849227587d3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f7-ef26-5927-c87c4c9fff9d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f7-ef26-5e50-66397dc6b5ae	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f7-ef26-4f82-c8ebd703653e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f7-ef26-dd08-1e726a154cfb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f7-ef26-ce30-1a93067bfd54	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f7-ef26-851c-65c2a7e1874f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f7-ef26-6692-3516542a6847	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f7-ef26-09c9-e8bb3f46bf7d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f7-ef26-c873-ed48cacb34f3	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f7-ef26-b150-98cb0b6256a8	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f7-ef26-af88-3a9230eff813	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f7-ef26-39b0-89f015e09107	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f7-ef26-b9c8-af0d082aaa58	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f7-ef26-5402-597f91ec7f29	DK	DNK	208	Denmark 	Danska	\N
00040000-55f7-ef26-7960-5517b92f02a7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f7-ef26-c4e1-5285ec9eb868	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f7-ef26-bf12-1e6eed404e20	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f7-ef26-0fe8-aa3d410ce2a3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f7-ef26-c126-22c4cd6b0595	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f7-ef26-b7a5-6201c15533d4	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f7-ef26-aaef-7b9d1a7988a9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f7-ef26-bfeb-4f7091c2d3f4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f7-ef26-d183-fda05983ad11	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f7-ef26-ed3a-8a4dfe80fda5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f7-ef26-5f09-3a468ab15875	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f7-ef26-e250-b0074faab351	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f7-ef26-bf0a-f0ad7006907e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f7-ef26-bec8-7c785e620e80	FI	FIN	246	Finland 	Finska	\N
00040000-55f7-ef26-8798-cb372b8f0268	FR	FRA	250	France 	Francija	\N
00040000-55f7-ef26-269e-58a42ce3b625	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f7-ef26-29a0-d1bbc03b91a4	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f7-ef26-def3-5167a99b2051	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f7-ef26-1ace-fff0042d8c20	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f7-ef26-f99e-ec6d08da8451	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f7-ef26-b037-22a8d10bbc3d	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f7-ef26-5b49-82a154de15fb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f7-ef26-625b-70dc156c48f2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f7-ef26-65c7-b5124233273b	GH	GHA	288	Ghana 	Gana	\N
00040000-55f7-ef26-2b2e-4c0fda84b451	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f7-ef26-00e5-282167d6916d	GR	GRC	300	Greece 	Grčija	\N
00040000-55f7-ef26-8019-585fce7d37f0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f7-ef26-b470-2670f977fae2	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f7-ef26-b0b7-0a6031e23f13	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f7-ef26-003a-565d4aa43cfd	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f7-ef26-b48d-63c988182579	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f7-ef26-06b7-8f42022ec904	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f7-ef26-6348-ea4f2c89245a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f7-ef26-09b0-dbe0f217e00f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f7-ef26-c7b2-509c8f14e518	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f7-ef26-58b8-cd4d75bd466e	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f7-ef26-6293-b1d656f20e01	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f7-ef26-41d1-d7f63374f348	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f7-ef26-ca41-ada7199511c3	HN	HND	340	Honduras 	Honduras	\N
00040000-55f7-ef26-92a8-aa574eb73271	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f7-ef26-acff-469a6ff9a076	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f7-ef26-f449-14d5f5035dfe	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f7-ef26-777a-0d026f9d52b2	IN	IND	356	India 	Indija	\N
00040000-55f7-ef26-039c-f929813682cd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f7-ef26-7797-5979c8f3fa2c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f7-ef26-2338-1ab1364536b2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f7-ef26-729b-451c64678db7	IE	IRL	372	Ireland 	Irska	\N
00040000-55f7-ef26-216b-0116a284303b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f7-ef26-b368-80f7d088dd24	IL	ISR	376	Israel 	Izrael	\N
00040000-55f7-ef26-8c49-f7dcfd3ba3b6	IT	ITA	380	Italy 	Italija	\N
00040000-55f7-ef26-e2a6-1953aeec133b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f7-ef26-bf7a-98c1d2e63287	JP	JPN	392	Japan 	Japonska	\N
00040000-55f7-ef26-c13b-d79d95bed7cb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f7-ef26-d485-4b7a31be6389	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f7-ef26-42cc-6312d62c959e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f7-ef26-4ba4-16fccfbb3248	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f7-ef26-addb-9dcaf23f840e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f7-ef26-b34f-12a6767e3405	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f7-ef26-3fbc-2ebafb89b43b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f7-ef26-41f0-5517b05114f9	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f7-ef26-50d8-bd09b74a5a5f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f7-ef26-eaba-923a6d9a39ca	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f7-ef26-872c-768ff4d2391c	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f7-ef26-7212-d769f0666823	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f7-ef26-3241-0806d77b9a22	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f7-ef26-8e18-f620ab41b099	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f7-ef26-2ce3-e57b1ae32692	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f7-ef26-e1c1-821aa0f16924	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f7-ef26-1d5d-6f6a7b24f11c	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f7-ef26-b994-4ef4c2828141	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f7-ef26-e205-11667c12b6ed	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f7-ef26-35cd-8cac859cebe6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f7-ef26-bcc0-8764f145176a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f7-ef26-e91f-a4e976e04313	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f7-ef26-7cd6-b2636abdb5a2	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f7-ef26-de60-011781a2667a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f7-ef26-1a70-891c87071391	ML	MLI	466	Mali 	Mali	\N
00040000-55f7-ef26-7e9c-fab235fbb533	MT	MLT	470	Malta 	Malta	\N
00040000-55f7-ef26-8073-da9cab7d4ec1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f7-ef26-154a-98b2368b1ceb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f7-ef26-e0d0-bfbdd9cfe6e1	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f7-ef26-c907-84e78349032e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f7-ef26-84b8-102e3136c213	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f7-ef26-b1e9-7f4f3fe64683	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f7-ef26-8f4a-055e8c85a12c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f7-ef26-ee07-0362c8d5932a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f7-ef26-b080-c396d7c6317a	MC	MCO	492	Monaco 	Monako	\N
00040000-55f7-ef26-dc79-b806381047ae	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f7-ef26-f576-7317a640d35b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f7-ef26-d661-02a66fc71933	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f7-ef26-b0c4-76dc5fc12f60	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f7-ef26-b437-28a912a72ec8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f7-ef26-5f5e-e339b69bf199	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f7-ef26-fa39-b7e1df9f0322	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f7-ef26-fd82-004451743cdf	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f7-ef26-fedc-93824b7df536	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f7-ef26-940c-925ff7022127	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f7-ef26-b711-c722eb94590b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f7-ef26-43e2-60804cddb720	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f7-ef26-16fb-2900caf63052	NE	NER	562	Niger 	Niger 	\N
00040000-55f7-ef26-e75e-18992b6b2028	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f7-ef26-8b13-e3051e33c6cc	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f7-ef26-fede-65395fbb59fc	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f7-ef26-0abb-648d1bb97762	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f7-ef26-bd0e-e4239993af71	NO	NOR	578	Norway 	Norveška	\N
00040000-55f7-ef26-36ff-e759f433bb1f	OM	OMN	512	Oman 	Oman	\N
00040000-55f7-ef26-0b29-92d6aa6e9e44	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f7-ef26-70a2-961a9d22c85b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f7-ef26-e620-8bf9f527307a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f7-ef26-2697-4495c3496618	PA	PAN	591	Panama 	Panama	\N
00040000-55f7-ef26-4ba0-af4f77efaf80	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f7-ef26-2fb7-e94888e63e0d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f7-ef26-5955-2d8001b95af3	PE	PER	604	Peru 	Peru	\N
00040000-55f7-ef26-8995-e1544af18512	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f7-ef26-b8e5-2f5f59bef3d2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f7-ef26-88b0-a3698d1a069f	PL	POL	616	Poland 	Poljska	\N
00040000-55f7-ef26-63b2-054f782a257c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f7-ef26-a9af-7d688d08946d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f7-ef26-0b64-d68d032b216d	QA	QAT	634	Qatar 	Katar	\N
00040000-55f7-ef26-72c4-4ce9e5e3d8e9	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f7-ef26-68de-1cd37db3d7d5	RO	ROU	642	Romania 	Romunija	\N
00040000-55f7-ef26-4f99-dd7a789c1d13	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f7-ef26-5276-b0341647e85b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f7-ef26-a0b3-3805f9b73f28	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f7-ef26-70a9-2c53e00113b0	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f7-ef26-84de-6916a0ff0d25	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f7-ef26-c380-bdc70e382d5d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f7-ef26-c2c0-227be4155122	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f7-ef26-b0bf-93a6bcd928d8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f7-ef26-fe2e-452a3898fc2a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f7-ef26-8b48-18d07884ca87	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f7-ef26-81cd-181256ba723b	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f7-ef26-185d-78c5103062ef	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f7-ef26-096e-28056a7a1ed8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f7-ef26-64a5-03606a8263c3	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f7-ef26-667f-90da4000c4fb	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f7-ef26-961d-e07347c6ec05	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f7-ef26-f851-305bf34390f0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f7-ef26-7b94-149a2dcbf40a	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f7-ef26-3177-2c69600309f0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f7-ef26-382f-7f3f228d8b47	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f7-ef26-1418-1af15bf137b0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f7-ef26-4345-cd0e4b899297	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f7-ef26-fef1-fdbb722cd839	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f7-ef26-2ece-232d5fffd6b6	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f7-ef26-2ef0-750b5727e73a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f7-ef26-5665-f04b78623d0e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f7-ef26-e6ee-5b2e414d0121	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f7-ef26-e7de-4554004c2f3b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f7-ef26-ad1d-a4561f21f66c	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f7-ef26-4541-8df14d747f28	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f7-ef26-8938-4945f94f12b8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f7-ef26-d3b0-59f3540d5f6b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f7-ef26-38dd-e364e5864170	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f7-ef26-9d1d-8bc0d538c980	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f7-ef26-f243-5bb70cebcfa0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f7-ef26-8797-b8bdb629ebd0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f7-ef26-72eb-ca95b987ecef	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f7-ef26-7129-37d56e698f55	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f7-ef26-3394-d2f2262e17ad	TH	THA	764	Thailand 	Tajska	\N
00040000-55f7-ef26-30d2-1038dd6522fd	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f7-ef26-0939-524a5f5e66c4	TG	TGO	768	Togo 	Togo	\N
00040000-55f7-ef26-96b8-a618c701615e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f7-ef26-7b0d-45357d6286fe	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f7-ef26-1355-3023d625373c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f7-ef26-14b0-86e0b50d6711	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f7-ef26-dd5d-4814214abf9c	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f7-ef26-eed7-a026b71baf79	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f7-ef26-b821-d1ecd4316caf	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f7-ef26-fbd1-e8773c9b9581	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f7-ef26-341a-3ef6e7083d89	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f7-ef26-e896-70314e80a735	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f7-ef26-6b90-6258a30819e4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f7-ef26-8da3-44bc6614f140	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f7-ef26-c4f8-0d64667935e8	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f7-ef26-d3ea-80ca09604b62	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f7-ef26-e4ff-ca4a6d17cc7d	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f7-ef26-b6de-8e5be3e0d2ae	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f7-ef26-5917-8018e0823406	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f7-ef26-5d52-133019fe3a8a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f7-ef26-9223-7dd6ca091611	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f7-ef26-b46c-73c5fd5bffeb	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f7-ef26-0729-e125c0da8a11	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f7-ef26-b676-661d5694c68e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f7-ef26-5143-5e93cc16ec78	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f7-ef26-0550-48d91953d4b4	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f7-ef26-8a4f-6457109f1177	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f7-ef26-e4df-0e938e6e13c9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2988 (class 0 OID 19561319)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f7-ef28-5cbe-85355ea5ef49	000e0000-55f7-ef28-dfb5-4c7014c50e40	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f7-ef26-b613-eb531e5c44a0	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f7-ef28-bfc2-c8d61f774a4e	000e0000-55f7-ef28-b966-4c22329ff020	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f7-ef26-3916-f390c51bdafd	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f7-ef28-88a5-4d24645c5f94	000e0000-55f7-ef28-8d6b-e0b709a9c80b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f7-ef26-b613-eb531e5c44a0	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f7-ef28-30db-0cd1b5e04439	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f7-ef28-9514-7efd7c1fbc22	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 19561129)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f7-ef28-c36e-6395a58c668e	000e0000-55f7-ef28-b966-4c22329ff020	000c0000-55f7-ef28-954e-56dc1f55bdb0	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f7-ef26-1429-e87172397db1
000d0000-55f7-ef28-c917-8bdf43249b35	000e0000-55f7-ef28-b966-4c22329ff020	000c0000-55f7-ef28-db0d-2e83d21f4d0a	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f7-ef26-f2fe-460c2a4615bf
000d0000-55f7-ef28-feef-db13c3c6fd1e	000e0000-55f7-ef28-b966-4c22329ff020	000c0000-55f7-ef28-7210-1797d9e6ab6b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f7-ef26-3aab-019e89ed633b
000d0000-55f7-ef28-bfc2-c2ded9ab1d16	000e0000-55f7-ef28-b966-4c22329ff020	000c0000-55f7-ef28-799b-337462bd4bd7	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f7-ef26-6804-7f926d574389
000d0000-55f7-ef28-8601-19209855862b	000e0000-55f7-ef28-b966-4c22329ff020	000c0000-55f7-ef28-cb3d-79d2bbe19c27	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f7-ef26-6804-7f926d574389
000d0000-55f7-ef28-a1d9-ee4e2e10609f	000e0000-55f7-ef28-b966-4c22329ff020	000c0000-55f7-ef28-e33f-01d2f916a447	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f7-ef26-1429-e87172397db1
000d0000-55f7-ef28-a9fe-1455128855fc	000e0000-55f7-ef28-b966-4c22329ff020	000c0000-55f7-ef28-1e2d-c525f94eddb5	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f7-ef26-1429-e87172397db1
000d0000-55f7-ef28-a456-00b71318a4d9	000e0000-55f7-ef28-b966-4c22329ff020	000c0000-55f7-ef28-8a18-0b2bd61850f5	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f7-ef26-b70a-9ffae40bf13a
000d0000-55f7-ef28-c228-6bf044988566	000e0000-55f7-ef28-b966-4c22329ff020	000c0000-55f7-ef28-6d87-a8a4d9ca9ff8	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f7-ef26-0184-59c4d60cf6ac
\.


--
-- TOC entry 2954 (class 0 OID 19560944)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 19560925)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f7-ef28-17ae-50003eb6e412	00080000-55f7-ef27-1f46-7beb9680015b	00090000-55f7-ef28-93aa-bf5882e4ce63	AK		igralka
\.


--
-- TOC entry 2963 (class 0 OID 19561043)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 19561525)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19561537)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 19561559)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19561068)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19560882)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f7-ef27-d59f-59c9cc31380e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f7-ef27-0454-70fc3584cf95	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f7-ef27-2484-e1f555030bdf	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f7-ef27-c2ed-c310b91171b0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f7-ef27-3967-eff26a2db707	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f7-ef27-7996-9437792f1563	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f7-ef27-8c32-3e99c8647a29	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f7-ef27-1a77-52f09e7f414b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f7-ef27-367c-d9d1fb952de0	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f7-ef27-3d9d-649517b615d0	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f7-ef27-2fcd-8d15275d6564	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f7-ef27-60b6-3e8f982e13b5	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f7-ef27-9717-a9de2805a973	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f7-ef27-b5f3-4371f96e5c4b	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f7-ef27-37aa-f635bcc7808f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f7-ef27-f985-de4651a3b9bc	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f7-ef27-575d-d9443685c846	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f7-ef27-4c39-f6cfcb48e458	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f7-ef27-8640-2742d2db21a5	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f7-ef29-1e55-791d0370453e	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2943 (class 0 OID 19560796)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f7-ef27-f705-c5efe7902d18	00000000-55f7-ef27-37aa-f635bcc7808f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f7-ef27-08ae-6dee25b5f5df	00000000-55f7-ef27-37aa-f635bcc7808f	00010000-55f7-ef26-b42e-55ea68749c6b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f7-ef27-8c6c-bedc69aca823	00000000-55f7-ef27-f985-de4651a3b9bc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2944 (class 0 OID 19560807)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f7-ef28-b208-5a8ca1635e2b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f7-ef28-7122-cdae2e6a8c76	00010000-55f7-ef28-8e3c-65625ed4f80d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f7-ef28-61a5-1e11d10329db	00010000-55f7-ef28-f824-4763f9d51fcf	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f7-ef28-e2c7-57ffd2fe8c54	00010000-55f7-ef28-4d57-bc0a729526a7	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f7-ef28-9919-1e549362415b	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f7-ef28-9f5d-682c1dafe7b5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f7-ef28-24bb-b7ab1c792c70	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f7-ef28-9f65-4822bc3865aa	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f7-ef28-93aa-bf5882e4ce63	00010000-55f7-ef28-6bac-b209b66baf00	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f7-ef28-f94a-6106222a58e6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f7-ef28-a0fc-0efbf4e694ed	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f7-ef28-2ea2-76f129e2e6ef	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f7-ef28-62f4-0f33b87569f8	00010000-55f7-ef28-bd0a-2ad7a75f76e3	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 19560761)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f7-ef26-e8b7-1e992d429c5e	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f7-ef26-a887-296ffc556b44	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f7-ef26-af59-c1b3d84db231	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f7-ef26-4995-3a1073d55798	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f7-ef26-e39a-9a12f8bdfa57	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f7-ef26-be1a-cb8d2453838c	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f7-ef26-9880-094ef1c12db5	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f7-ef26-367f-4b8799336ee0	Abonma-read	Abonma - branje	f
00030000-55f7-ef26-89bf-80a159d4d05c	Abonma-write	Abonma - spreminjanje	f
00030000-55f7-ef26-52b5-4920daa99889	Alternacija-read	Alternacija - branje	f
00030000-55f7-ef26-bc3e-961d4941595e	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f7-ef26-4c1e-dbcfdd1a1dfa	Arhivalija-read	Arhivalija - branje	f
00030000-55f7-ef26-7871-62220ce58fde	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f7-ef26-e106-44295119b347	Besedilo-read	Besedilo - branje	f
00030000-55f7-ef26-cd04-3ad81e742db2	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f7-ef26-5164-e949b65a1a1c	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f7-ef26-152e-77393e9dec20	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f7-ef26-780c-66af1d9e6690	Dogodek-read	Dogodek - branje	f
00030000-55f7-ef26-3d9b-c5fceae5003b	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f7-ef26-8157-13c77f913d09	DrugiVir-read	DrugiVir - branje	f
00030000-55f7-ef26-2e2c-284785563872	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f7-ef26-e1ca-68529c78698d	Drzava-read	Drzava - branje	f
00030000-55f7-ef26-51f5-d5df4cfa4188	Drzava-write	Drzava - spreminjanje	f
00030000-55f7-ef26-43ce-575279e972b9	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f7-ef26-253c-0f65fe512318	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f7-ef26-607e-58fc0e2023ce	Funkcija-read	Funkcija - branje	f
00030000-55f7-ef26-52ac-5751a72e35fc	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f7-ef26-deb4-8b48c8c867f4	Gostovanje-read	Gostovanje - branje	f
00030000-55f7-ef26-c5d2-c800688f201f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f7-ef26-6127-fa5afceef98a	Gostujoca-read	Gostujoca - branje	f
00030000-55f7-ef26-db2f-a5148662ec51	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f7-ef26-e628-a1fabad0fa30	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f7-ef26-20b2-591b11ca3975	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f7-ef26-1aee-3893718d4574	Kupec-read	Kupec - branje	f
00030000-55f7-ef26-a9c6-3a38ce68ba7e	Kupec-write	Kupec - spreminjanje	f
00030000-55f7-ef26-d8b6-8d5e7a955c2e	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f7-ef26-53f0-ab67e0f68862	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f7-ef26-b6b7-1ac026de2a32	Option-read	Option - branje	f
00030000-55f7-ef26-9be5-30f5bc6db321	Option-write	Option - spreminjanje	f
00030000-55f7-ef26-e727-9b68c79c06ae	OptionValue-read	OptionValue - branje	f
00030000-55f7-ef26-6b73-a36ef51e38a6	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f7-ef26-071e-73b99c1d6f95	Oseba-read	Oseba - branje	f
00030000-55f7-ef26-51a2-46d1728d85a3	Oseba-write	Oseba - spreminjanje	f
00030000-55f7-ef26-2623-e4cf5953825b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f7-ef26-7e13-ba9d7029caf9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f7-ef26-f3d2-24731d39e9c0	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f7-ef26-c97b-b099d944df73	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f7-ef26-66a9-649fecb0686f	Pogodba-read	Pogodba - branje	f
00030000-55f7-ef26-2fc6-056222de6790	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f7-ef26-8eb5-346167c071ab	Popa-read	Popa - branje	f
00030000-55f7-ef26-015e-ae916332e25c	Popa-write	Popa - spreminjanje	f
00030000-55f7-ef26-c7d3-c495fdb20149	Posta-read	Posta - branje	f
00030000-55f7-ef26-1574-c1e7bb54efbd	Posta-write	Posta - spreminjanje	f
00030000-55f7-ef26-3f88-8eb23b4d1fae	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f7-ef26-e9e8-c9ba10c9cb9a	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f7-ef26-9286-94b31ec3ae9f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f7-ef26-49a8-538b6d57f90c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f7-ef26-c2d7-53786f9b4ca6	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f7-ef26-61fb-94dba2c727df	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f7-ef26-d875-31535ae04961	Predstava-read	Predstava - branje	f
00030000-55f7-ef26-10fb-f3d8e87e87e6	Predstava-write	Predstava - spreminjanje	f
00030000-55f7-ef26-9243-307b18aa0c71	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f7-ef26-aa86-5d88e80c6fb2	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f7-ef26-3651-256ad1c2e7b4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f7-ef26-2a78-b4a906559a61	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f7-ef26-ec85-25f95dd82afd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f7-ef26-49f4-a39f46ac8266	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f7-ef26-fdea-97138ef1f2f4	ProgramDela-read	ProgramDela - branje	f
00030000-55f7-ef26-6949-5d7f8f7359ae	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f7-ef26-f33a-9cc1aa43f51e	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f7-ef26-3abb-a1246ea65a31	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f7-ef26-aa34-c00be7807ce4	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f7-ef26-e8f6-721aa5511885	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f7-ef26-65c4-c8fe33a5ca98	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f7-ef26-016b-4ad07074f707	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f7-ef26-cc2c-d44753cb2891	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f7-ef26-f701-c3c09525acf9	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f7-ef26-0275-77c5f9a3bf11	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f7-ef26-3eec-1daefef0547e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f7-ef26-036e-44a0c48ea511	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f7-ef26-1b24-60508a4d3516	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f7-ef26-932c-a50c8380ab7a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f7-ef26-1c3a-34fddb63198a	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f7-ef26-5cca-88f29071e929	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f7-ef26-f80d-ba18a5f28a39	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f7-ef26-ef74-cef87f398cf0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f7-ef26-a188-3a52a1b4a6f1	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f7-ef26-0c0f-16811ebad50c	Prostor-read	Prostor - branje	f
00030000-55f7-ef26-1603-afa59d27c29a	Prostor-write	Prostor - spreminjanje	f
00030000-55f7-ef26-c8d8-c3cb7d74c413	Racun-read	Racun - branje	f
00030000-55f7-ef26-a31b-e3895d07e279	Racun-write	Racun - spreminjanje	f
00030000-55f7-ef26-d19e-06bba6cbcdfa	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f7-ef26-4b09-62f7211c733e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f7-ef26-d71b-aa7223127f91	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f7-ef26-4188-68b4077097ec	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f7-ef26-2c22-a33b87dafa73	Rekvizit-read	Rekvizit - branje	f
00030000-55f7-ef26-92ca-948a715e350b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f7-ef26-5720-132645d96177	Revizija-read	Revizija - branje	f
00030000-55f7-ef26-2a2e-4f3eb1f78c80	Revizija-write	Revizija - spreminjanje	f
00030000-55f7-ef26-a813-5483993371d6	Rezervacija-read	Rezervacija - branje	f
00030000-55f7-ef26-3adc-76fabde6cca6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f7-ef26-4054-eb2cad16d969	SedezniRed-read	SedezniRed - branje	f
00030000-55f7-ef26-dc0e-4bdd41e88fcd	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f7-ef26-0c62-f093a3627869	Sedez-read	Sedez - branje	f
00030000-55f7-ef26-b655-ee00232ee844	Sedez-write	Sedez - spreminjanje	f
00030000-55f7-ef26-93ac-a2d521d28c2e	Sezona-read	Sezona - branje	f
00030000-55f7-ef26-3e07-4246f7bc1c45	Sezona-write	Sezona - spreminjanje	f
00030000-55f7-ef26-2435-bb5cb1c01d04	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f7-ef26-3051-f1f4edfe4ee0	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f7-ef26-8e6f-d8a92fa19ab3	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f7-ef26-8a58-c90a3bb6e4a7	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f7-ef26-12ae-751055c1bbae	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f7-ef26-6c9f-d77c33c3c5d6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f7-ef26-b456-ee2d6aa52aa8	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f7-ef26-83fc-d24213891f94	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f7-ef26-25c7-3481efbaa299	Telefonska-read	Telefonska - branje	f
00030000-55f7-ef26-b6bc-915bde6c4862	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f7-ef26-4b28-aae535268297	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f7-ef26-0d17-d25be969ba28	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f7-ef26-5d88-07dd7e414043	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f7-ef26-6455-06aa83f3735a	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f7-ef26-d4a6-2bf67b46ca48	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f7-ef26-fd88-e30ccaff8beb	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f7-ef26-bd3e-550c76af68a5	Trr-read	Trr - branje	f
00030000-55f7-ef26-c2fb-0ccd39cdd1a7	Trr-write	Trr - spreminjanje	f
00030000-55f7-ef26-702a-01725bdcf625	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f7-ef26-e82c-d4ceeb231452	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f7-ef26-8462-5115e86fedbb	Vaja-read	Vaja - branje	f
00030000-55f7-ef26-fd6d-2800d00087f0	Vaja-write	Vaja - spreminjanje	f
00030000-55f7-ef26-a6b9-c98b8bd44492	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f7-ef26-1e6a-e9e108f28caa	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f7-ef26-7187-6e8d1c702f09	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f7-ef26-f7ec-3c58c51ed251	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f7-ef26-578e-6e87a7b5d243	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f7-ef26-62da-dbaa33b99429	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f7-ef26-ec0b-5782308702f5	Zasedenost-read	Zasedenost - branje	f
00030000-55f7-ef26-e67c-3c5b694f47bf	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f7-ef26-ac16-7da04b2d60a4	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f7-ef26-7afd-f3fd308e0afb	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f7-ef26-703b-05f2896d2356	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f7-ef26-75b9-60aa8455fd06	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f7-ef26-b834-99c615cc9ea1	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f7-ef26-ed3d-ba1544329522	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f7-ef26-253c-4d801d682d59	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f7-ef26-780b-045514933c41	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f7-ef26-9deb-f46a114d4789	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f7-ef26-f814-0452fea7a9f9	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f7-ef26-c6af-cec7de0f0b9b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f7-ef26-438e-6c8f78b4d6f9	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f7-ef26-ba10-c09f3825d055	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f7-ef26-06bc-db395e917e86	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f7-ef26-da38-f54e3a13045e	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f7-ef26-f3e8-b49c8356cb5b	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2941 (class 0 OID 19560780)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f7-ef26-fbbc-bca1f9be0c55	00030000-55f7-ef26-a887-296ffc556b44
00020000-55f7-ef26-e16c-86d52018acf5	00030000-55f7-ef26-e1ca-68529c78698d
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-367f-4b8799336ee0
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-89bf-80a159d4d05c
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-52b5-4920daa99889
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-bc3e-961d4941595e
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-4c1e-dbcfdd1a1dfa
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-780c-66af1d9e6690
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-4995-3a1073d55798
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-3d9b-c5fceae5003b
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-e1ca-68529c78698d
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-51f5-d5df4cfa4188
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-607e-58fc0e2023ce
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-52ac-5751a72e35fc
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-deb4-8b48c8c867f4
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-c5d2-c800688f201f
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-6127-fa5afceef98a
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-db2f-a5148662ec51
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-e628-a1fabad0fa30
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-20b2-591b11ca3975
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-b6b7-1ac026de2a32
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-e727-9b68c79c06ae
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-071e-73b99c1d6f95
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-51a2-46d1728d85a3
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-8eb5-346167c071ab
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-015e-ae916332e25c
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-c7d3-c495fdb20149
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-1574-c1e7bb54efbd
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-c2d7-53786f9b4ca6
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-61fb-94dba2c727df
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-d875-31535ae04961
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-10fb-f3d8e87e87e6
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-ec85-25f95dd82afd
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-49f4-a39f46ac8266
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-0c0f-16811ebad50c
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-1603-afa59d27c29a
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-d71b-aa7223127f91
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-4188-68b4077097ec
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-2c22-a33b87dafa73
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-92ca-948a715e350b
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-93ac-a2d521d28c2e
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-3e07-4246f7bc1c45
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-5d88-07dd7e414043
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-702a-01725bdcf625
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-e82c-d4ceeb231452
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-8462-5115e86fedbb
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-fd6d-2800d00087f0
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-ec0b-5782308702f5
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-e67c-3c5b694f47bf
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-ac16-7da04b2d60a4
00020000-55f7-ef26-fae0-a1865bc2602d	00030000-55f7-ef26-703b-05f2896d2356
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-367f-4b8799336ee0
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-4c1e-dbcfdd1a1dfa
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-780c-66af1d9e6690
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-e1ca-68529c78698d
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-deb4-8b48c8c867f4
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-6127-fa5afceef98a
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-e628-a1fabad0fa30
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-20b2-591b11ca3975
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-b6b7-1ac026de2a32
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-e727-9b68c79c06ae
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-071e-73b99c1d6f95
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-51a2-46d1728d85a3
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-8eb5-346167c071ab
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-c7d3-c495fdb20149
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-c2d7-53786f9b4ca6
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-61fb-94dba2c727df
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-d875-31535ae04961
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-0c0f-16811ebad50c
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-d71b-aa7223127f91
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-2c22-a33b87dafa73
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-93ac-a2d521d28c2e
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-25c7-3481efbaa299
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-b6bc-915bde6c4862
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-bd3e-550c76af68a5
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-c2fb-0ccd39cdd1a7
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-578e-6e87a7b5d243
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-62da-dbaa33b99429
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-ac16-7da04b2d60a4
00020000-55f7-ef26-2fc8-1093f915d51f	00030000-55f7-ef26-703b-05f2896d2356
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-367f-4b8799336ee0
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-52b5-4920daa99889
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-4c1e-dbcfdd1a1dfa
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-7871-62220ce58fde
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-e106-44295119b347
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-5164-e949b65a1a1c
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-780c-66af1d9e6690
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-e1ca-68529c78698d
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-607e-58fc0e2023ce
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-deb4-8b48c8c867f4
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-6127-fa5afceef98a
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-e628-a1fabad0fa30
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-b6b7-1ac026de2a32
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-e727-9b68c79c06ae
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-071e-73b99c1d6f95
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-8eb5-346167c071ab
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-c7d3-c495fdb20149
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-d875-31535ae04961
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-ec85-25f95dd82afd
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-0c0f-16811ebad50c
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-d71b-aa7223127f91
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-2c22-a33b87dafa73
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-93ac-a2d521d28c2e
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-5d88-07dd7e414043
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-8462-5115e86fedbb
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-ec0b-5782308702f5
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-ac16-7da04b2d60a4
00020000-55f7-ef26-1100-f198ca9a6ada	00030000-55f7-ef26-703b-05f2896d2356
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-367f-4b8799336ee0
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-89bf-80a159d4d05c
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-bc3e-961d4941595e
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-4c1e-dbcfdd1a1dfa
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-780c-66af1d9e6690
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-e1ca-68529c78698d
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-deb4-8b48c8c867f4
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-6127-fa5afceef98a
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-b6b7-1ac026de2a32
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-e727-9b68c79c06ae
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-8eb5-346167c071ab
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-c7d3-c495fdb20149
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-d875-31535ae04961
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-0c0f-16811ebad50c
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-d71b-aa7223127f91
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-2c22-a33b87dafa73
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-93ac-a2d521d28c2e
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-5d88-07dd7e414043
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-ac16-7da04b2d60a4
00020000-55f7-ef26-dd18-aa0ebb045a9f	00030000-55f7-ef26-703b-05f2896d2356
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-367f-4b8799336ee0
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-4c1e-dbcfdd1a1dfa
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-780c-66af1d9e6690
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-e1ca-68529c78698d
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-deb4-8b48c8c867f4
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-6127-fa5afceef98a
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-b6b7-1ac026de2a32
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-e727-9b68c79c06ae
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-8eb5-346167c071ab
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-c7d3-c495fdb20149
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-d875-31535ae04961
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-0c0f-16811ebad50c
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-d71b-aa7223127f91
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-2c22-a33b87dafa73
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-93ac-a2d521d28c2e
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-4b28-aae535268297
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-af59-c1b3d84db231
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-5d88-07dd7e414043
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-ac16-7da04b2d60a4
00020000-55f7-ef26-30ab-ae1ad22c38ff	00030000-55f7-ef26-703b-05f2896d2356
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-e8b7-1e992d429c5e
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-a887-296ffc556b44
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-af59-c1b3d84db231
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-4995-3a1073d55798
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-e39a-9a12f8bdfa57
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-be1a-cb8d2453838c
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-9880-094ef1c12db5
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-367f-4b8799336ee0
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-89bf-80a159d4d05c
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-52b5-4920daa99889
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-bc3e-961d4941595e
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-4c1e-dbcfdd1a1dfa
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-7871-62220ce58fde
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-e106-44295119b347
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-cd04-3ad81e742db2
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-5164-e949b65a1a1c
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-152e-77393e9dec20
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-780c-66af1d9e6690
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-3d9b-c5fceae5003b
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-e1ca-68529c78698d
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-51f5-d5df4cfa4188
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-8157-13c77f913d09
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-2e2c-284785563872
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-43ce-575279e972b9
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-253c-0f65fe512318
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-607e-58fc0e2023ce
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-52ac-5751a72e35fc
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-deb4-8b48c8c867f4
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-c5d2-c800688f201f
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-6127-fa5afceef98a
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-db2f-a5148662ec51
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-e628-a1fabad0fa30
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-20b2-591b11ca3975
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-1aee-3893718d4574
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-a9c6-3a38ce68ba7e
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-d8b6-8d5e7a955c2e
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-53f0-ab67e0f68862
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-b6b7-1ac026de2a32
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-9be5-30f5bc6db321
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-e727-9b68c79c06ae
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-6b73-a36ef51e38a6
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-071e-73b99c1d6f95
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-51a2-46d1728d85a3
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-2623-e4cf5953825b
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-7e13-ba9d7029caf9
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-f3d2-24731d39e9c0
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-c97b-b099d944df73
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-66a9-649fecb0686f
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-2fc6-056222de6790
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-8eb5-346167c071ab
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-015e-ae916332e25c
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-c7d3-c495fdb20149
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-1574-c1e7bb54efbd
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-3f88-8eb23b4d1fae
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-e9e8-c9ba10c9cb9a
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-9286-94b31ec3ae9f
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-49a8-538b6d57f90c
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-c2d7-53786f9b4ca6
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-61fb-94dba2c727df
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-d875-31535ae04961
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-10fb-f3d8e87e87e6
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-9243-307b18aa0c71
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-aa86-5d88e80c6fb2
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-3651-256ad1c2e7b4
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-2a78-b4a906559a61
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-ec85-25f95dd82afd
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-49f4-a39f46ac8266
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-fdea-97138ef1f2f4
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-6949-5d7f8f7359ae
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-f33a-9cc1aa43f51e
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-3abb-a1246ea65a31
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-aa34-c00be7807ce4
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-e8f6-721aa5511885
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-65c4-c8fe33a5ca98
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-016b-4ad07074f707
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-cc2c-d44753cb2891
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-f701-c3c09525acf9
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-0275-77c5f9a3bf11
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-3eec-1daefef0547e
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-036e-44a0c48ea511
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-1b24-60508a4d3516
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-932c-a50c8380ab7a
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-1c3a-34fddb63198a
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-5cca-88f29071e929
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-f80d-ba18a5f28a39
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-ef74-cef87f398cf0
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-a188-3a52a1b4a6f1
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-0c0f-16811ebad50c
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-1603-afa59d27c29a
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-c8d8-c3cb7d74c413
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-a31b-e3895d07e279
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-d19e-06bba6cbcdfa
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-4b09-62f7211c733e
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-d71b-aa7223127f91
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-4188-68b4077097ec
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-2c22-a33b87dafa73
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-92ca-948a715e350b
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-5720-132645d96177
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-2a2e-4f3eb1f78c80
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-a813-5483993371d6
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-3adc-76fabde6cca6
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-4054-eb2cad16d969
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-dc0e-4bdd41e88fcd
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-0c62-f093a3627869
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-b655-ee00232ee844
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-93ac-a2d521d28c2e
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-3e07-4246f7bc1c45
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-2435-bb5cb1c01d04
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-3051-f1f4edfe4ee0
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-8e6f-d8a92fa19ab3
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-8a58-c90a3bb6e4a7
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-12ae-751055c1bbae
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-6c9f-d77c33c3c5d6
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-b456-ee2d6aa52aa8
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-83fc-d24213891f94
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-25c7-3481efbaa299
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-b6bc-915bde6c4862
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-4b28-aae535268297
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-0d17-d25be969ba28
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-5d88-07dd7e414043
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-6455-06aa83f3735a
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-d4a6-2bf67b46ca48
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-fd88-e30ccaff8beb
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-bd3e-550c76af68a5
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-c2fb-0ccd39cdd1a7
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-702a-01725bdcf625
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-e82c-d4ceeb231452
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-8462-5115e86fedbb
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-fd6d-2800d00087f0
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-a6b9-c98b8bd44492
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-1e6a-e9e108f28caa
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-7187-6e8d1c702f09
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-f7ec-3c58c51ed251
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-578e-6e87a7b5d243
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-62da-dbaa33b99429
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-ec0b-5782308702f5
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-e67c-3c5b694f47bf
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-ac16-7da04b2d60a4
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-7afd-f3fd308e0afb
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-703b-05f2896d2356
00020000-55f7-ef27-f7b1-9fc1d03e55e6	00030000-55f7-ef26-75b9-60aa8455fd06
\.


--
-- TOC entry 2968 (class 0 OID 19561075)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19561109)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 19561238)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f7-ef28-41ea-3c7abb6b867e	00090000-55f7-ef28-b208-5a8ca1635e2b	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f7-ef28-2469-45fcd636bdec	00090000-55f7-ef28-9f5d-682c1dafe7b5	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f7-ef28-f785-9ad75a1fcc75	00090000-55f7-ef28-62f4-0f33b87569f8	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f7-ef28-d623-c245766e93e4	00090000-55f7-ef28-f94a-6106222a58e6	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2946 (class 0 OID 19560840)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f7-ef27-1f46-7beb9680015b	00040000-55f7-ef26-1418-1af15bf137b0	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f7-ef27-ca39-efd99723d230	00040000-55f7-ef26-1418-1af15bf137b0	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f7-ef27-3000-af594f885ed0	00040000-55f7-ef26-1418-1af15bf137b0	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f7-ef27-7b1e-2e68a0551e49	00040000-55f7-ef26-1418-1af15bf137b0	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f7-ef27-46dc-3c7411b089ba	00040000-55f7-ef26-1418-1af15bf137b0	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f7-ef27-8cd9-560b0b15c424	00040000-55f7-ef26-d987-a29962f0f4de	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f7-ef27-79cf-42fd47a68144	00040000-55f7-ef26-c873-ed48cacb34f3	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f7-ef27-4e3d-41b2a9ce7d01	00040000-55f7-ef26-b6fd-82392adf6508	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f7-ef27-a897-20766770681c	00040000-55f7-ef26-625b-70dc156c48f2	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f7-ef29-4738-14729555c8dd	00040000-55f7-ef26-1418-1af15bf137b0	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2948 (class 0 OID 19560874)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f7-ef25-7852-1b07c2d3ae03	8341	Adlešiči
00050000-55f7-ef25-406f-be0f01cd016b	5270	Ajdovščina
00050000-55f7-ef25-a8e4-3695aac71871	6280	Ankaran/Ancarano
00050000-55f7-ef25-2b2b-25834e625536	9253	Apače
00050000-55f7-ef25-73f3-51a0e8bbedee	8253	Artiče
00050000-55f7-ef25-a7db-232be600e04f	4275	Begunje na Gorenjskem
00050000-55f7-ef25-cb73-94586e3f4ac1	1382	Begunje pri Cerknici
00050000-55f7-ef25-c3d0-f33138de760a	9231	Beltinci
00050000-55f7-ef25-8c06-766f3c21c166	2234	Benedikt
00050000-55f7-ef25-7123-56822165f8be	2345	Bistrica ob Dravi
00050000-55f7-ef25-428e-c1b8499b2730	3256	Bistrica ob Sotli
00050000-55f7-ef25-e563-cd7f374e2445	8259	Bizeljsko
00050000-55f7-ef25-d923-23196ef1b53a	1223	Blagovica
00050000-55f7-ef25-5155-67e9d054d770	8283	Blanca
00050000-55f7-ef25-aee7-e24e688a2d05	4260	Bled
00050000-55f7-ef25-f847-55276fa0b42a	4273	Blejska Dobrava
00050000-55f7-ef25-7749-c852bb80460d	9265	Bodonci
00050000-55f7-ef25-053d-142038fca3b4	9222	Bogojina
00050000-55f7-ef25-59d0-6166ea01bc3d	4263	Bohinjska Bela
00050000-55f7-ef25-8cae-81b1bbcfa4af	4264	Bohinjska Bistrica
00050000-55f7-ef25-6c13-992ae2d3b73a	4265	Bohinjsko jezero
00050000-55f7-ef25-1546-04e53405cc83	1353	Borovnica
00050000-55f7-ef25-1554-3215af7aa7b8	8294	Boštanj
00050000-55f7-ef25-3eb9-fa7fd908b203	5230	Bovec
00050000-55f7-ef25-b62b-4246e759da13	5295	Branik
00050000-55f7-ef25-2e52-2cdebb528412	3314	Braslovče
00050000-55f7-ef25-7a54-36d59ec58717	5223	Breginj
00050000-55f7-ef25-e86d-4276227da04a	8280	Brestanica
00050000-55f7-ef25-7a0b-e0854e69bf37	2354	Bresternica
00050000-55f7-ef25-ad9f-3870a38427c4	4243	Brezje
00050000-55f7-ef25-4f9a-8b34969331f4	1351	Brezovica pri Ljubljani
00050000-55f7-ef25-9cfb-ae9c88456c59	8250	Brežice
00050000-55f7-ef25-8a07-69423492c3ee	4210	Brnik - Aerodrom
00050000-55f7-ef25-4a9c-8b9658dd32d1	8321	Brusnice
00050000-55f7-ef25-cf0c-7185a2b34180	3255	Buče
00050000-55f7-ef25-8aaa-586b631ace49	8276	Bučka 
00050000-55f7-ef25-899f-811bd04360d9	9261	Cankova
00050000-55f7-ef25-556d-e3b246cf8f6a	3000	Celje 
00050000-55f7-ef25-23bb-55e232462bfd	3001	Celje - poštni predali
00050000-55f7-ef25-4c35-0b43d77eb614	4207	Cerklje na Gorenjskem
00050000-55f7-ef25-4424-8f326306d787	8263	Cerklje ob Krki
00050000-55f7-ef25-b440-e87070039962	1380	Cerknica
00050000-55f7-ef25-2cfc-f524645cb555	5282	Cerkno
00050000-55f7-ef25-aa43-1512b39c5b40	2236	Cerkvenjak
00050000-55f7-ef25-90c5-ed7b9aea35c1	2215	Ceršak
00050000-55f7-ef25-6eb5-1309aae27708	2326	Cirkovce
00050000-55f7-ef25-f33a-6ea7439766fd	2282	Cirkulane
00050000-55f7-ef25-777b-7b9fbe20de5e	5273	Col
00050000-55f7-ef25-2527-8e83a6cdadf4	8251	Čatež ob Savi
00050000-55f7-ef25-74ef-bd3a5c42414e	1413	Čemšenik
00050000-55f7-ef25-b01d-6e51cb953083	5253	Čepovan
00050000-55f7-ef25-7f39-a71c2a81b367	9232	Črenšovci
00050000-55f7-ef25-a452-6c99bd4b4018	2393	Črna na Koroškem
00050000-55f7-ef25-e14f-c13b46b627b0	6275	Črni Kal
00050000-55f7-ef25-a48d-9b1fa6227012	5274	Črni Vrh nad Idrijo
00050000-55f7-ef25-4898-f9a4ae68c835	5262	Črniče
00050000-55f7-ef25-fedc-eb5bcea38efd	8340	Črnomelj
00050000-55f7-ef25-b1ca-7301adb9c914	6271	Dekani
00050000-55f7-ef25-0a75-e8ded64a45ed	5210	Deskle
00050000-55f7-ef25-b7f4-655012772035	2253	Destrnik
00050000-55f7-ef25-21da-05f92c22157d	6215	Divača
00050000-55f7-ef25-a592-d3a68abd9adb	1233	Dob
00050000-55f7-ef25-1422-80478fbd0821	3224	Dobje pri Planini
00050000-55f7-ef25-5b30-a3743efd44dc	8257	Dobova
00050000-55f7-ef25-6da4-8ba9d14fbaa6	1423	Dobovec
00050000-55f7-ef25-5e73-016ac90d3c65	5263	Dobravlje
00050000-55f7-ef25-f434-70258f3998a7	3204	Dobrna
00050000-55f7-ef25-9b52-91dab77a8b76	8211	Dobrnič
00050000-55f7-ef25-e05b-a0955ab72fd1	1356	Dobrova
00050000-55f7-ef25-2efe-6d0cc0088053	9223	Dobrovnik/Dobronak 
00050000-55f7-ef25-52ef-299318063651	5212	Dobrovo v Brdih
00050000-55f7-ef25-c2e9-e4befacc6eb3	1431	Dol pri Hrastniku
00050000-55f7-ef25-4107-49600c3830d9	1262	Dol pri Ljubljani
00050000-55f7-ef25-6c8b-89b6afd67585	1273	Dole pri Litiji
00050000-55f7-ef25-1ddd-6cf5bc8a6a3b	1331	Dolenja vas
00050000-55f7-ef25-c993-5d3597d000ea	8350	Dolenjske Toplice
00050000-55f7-ef25-a890-ffc07b888ccd	1230	Domžale
00050000-55f7-ef25-52b1-f61f23f8a3ce	2252	Dornava
00050000-55f7-ef25-8ae3-41af3409fdff	5294	Dornberk
00050000-55f7-ef25-8482-f5c7663ab2fb	1319	Draga
00050000-55f7-ef25-502a-1c627d54ed4d	8343	Dragatuš
00050000-55f7-ef25-d416-07e1e7fc450e	3222	Dramlje
00050000-55f7-ef25-12b4-8fa8abe07874	2370	Dravograd
00050000-55f7-ef25-05f8-5b2001dffa8b	4203	Duplje
00050000-55f7-ef25-7057-5924d75dfe8f	6221	Dutovlje
00050000-55f7-ef25-a834-28015836bfa9	8361	Dvor
00050000-55f7-ef25-5adb-ac19979e35fe	2343	Fala
00050000-55f7-ef25-f80f-57a8448f9114	9208	Fokovci
00050000-55f7-ef25-fbde-e12861e1f6f9	2313	Fram
00050000-55f7-ef25-1545-e4fb5c39039f	3213	Frankolovo
00050000-55f7-ef25-78f7-ff83e1584b3e	1274	Gabrovka
00050000-55f7-ef25-5c38-ad5cae362a76	8254	Globoko
00050000-55f7-ef25-f7df-1805f1228fbb	5275	Godovič
00050000-55f7-ef25-0ef5-a5ba68d90a01	4204	Golnik
00050000-55f7-ef25-62a4-ffcd0e7aa8de	3303	Gomilsko
00050000-55f7-ef25-3cab-f3efcce44ba0	4224	Gorenja vas
00050000-55f7-ef25-4331-c65359c1f917	3263	Gorica pri Slivnici
00050000-55f7-ef25-8cc6-f260e045c6e9	2272	Gorišnica
00050000-55f7-ef25-37c2-288e77ad6c33	9250	Gornja Radgona
00050000-55f7-ef25-5122-962cc2c5385a	3342	Gornji Grad
00050000-55f7-ef25-cbf6-1794ea699e10	4282	Gozd Martuljek
00050000-55f7-ef25-3b31-d46dc1d679c2	6272	Gračišče
00050000-55f7-ef25-1590-9002c9b436ea	9264	Grad
00050000-55f7-ef25-8079-ddb3fcc9aeca	8332	Gradac
00050000-55f7-ef25-2534-d2f050ac748c	1384	Grahovo
00050000-55f7-ef25-541b-ae538d98d5e0	5242	Grahovo ob Bači
00050000-55f7-ef25-75e9-d210d00487ae	5251	Grgar
00050000-55f7-ef25-2c42-1722049518ac	3302	Griže
00050000-55f7-ef25-de9c-8f8ad3a0c150	3231	Grobelno
00050000-55f7-ef25-5cbf-2d82f9ce416f	1290	Grosuplje
00050000-55f7-ef25-49fb-deeae15871d1	2288	Hajdina
00050000-55f7-ef25-e4b4-7c6fa76d9279	8362	Hinje
00050000-55f7-ef25-4941-c469775c36b5	2311	Hoče
00050000-55f7-ef25-4b76-4e23cd7d50b6	9205	Hodoš/Hodos
00050000-55f7-ef25-3ef2-64e6fbb1dd24	1354	Horjul
00050000-55f7-ef25-05ed-d7f2a2ebc69c	1372	Hotedršica
00050000-55f7-ef25-131d-9dcc6286ad1a	1430	Hrastnik
00050000-55f7-ef25-5387-d9e8aa470bfe	6225	Hruševje
00050000-55f7-ef25-6cd8-a53e910fec13	4276	Hrušica
00050000-55f7-ef25-e5a3-67f4f00ecb7c	5280	Idrija
00050000-55f7-ef25-732f-f691d7c733ee	1292	Ig
00050000-55f7-ef25-4551-78002b314a0d	6250	Ilirska Bistrica
00050000-55f7-ef25-315d-59036c7c99d3	6251	Ilirska Bistrica-Trnovo
00050000-55f7-ef25-e35a-be728b873609	1295	Ivančna Gorica
00050000-55f7-ef25-f1fc-1f3380ad95be	2259	Ivanjkovci
00050000-55f7-ef25-2b14-8bc3e379937e	1411	Izlake
00050000-55f7-ef25-546f-69af35f58313	6310	Izola/Isola
00050000-55f7-ef25-3a7c-2ca88766d256	2222	Jakobski Dol
00050000-55f7-ef25-c80a-e2f42803adad	2221	Jarenina
00050000-55f7-ef25-8b02-82f7481582a4	6254	Jelšane
00050000-55f7-ef25-32c1-e86070221705	4270	Jesenice
00050000-55f7-ef25-6d69-821e21dc072f	8261	Jesenice na Dolenjskem
00050000-55f7-ef25-5cad-931f2d13936f	3273	Jurklošter
00050000-55f7-ef25-764d-0ea6143b94fc	2223	Jurovski Dol
00050000-55f7-ef25-7eda-6fe6f17e68dc	2256	Juršinci
00050000-55f7-ef25-77d0-7e7be393cf6c	5214	Kal nad Kanalom
00050000-55f7-ef25-0cbf-e04f8479f70f	3233	Kalobje
00050000-55f7-ef25-9c51-0aadc5b5c72e	4246	Kamna Gorica
00050000-55f7-ef25-11b4-f8acf9dd5dfe	2351	Kamnica
00050000-55f7-ef25-ffe2-dd57e4bdb346	1241	Kamnik
00050000-55f7-ef25-2e83-80452081e73e	5213	Kanal
00050000-55f7-ef25-4c73-3955adced286	8258	Kapele
00050000-55f7-ef25-8bcc-181757602107	2362	Kapla
00050000-55f7-ef25-2303-7f7a27677f48	2325	Kidričevo
00050000-55f7-ef25-975e-62d2b1039d9c	1412	Kisovec
00050000-55f7-ef25-81f1-54898a3a2bea	6253	Knežak
00050000-55f7-ef25-0152-0dfff3b3f201	5222	Kobarid
00050000-55f7-ef25-8ea8-49c669dbe8dc	9227	Kobilje
00050000-55f7-ef25-f4e7-c0ec276ffe86	1330	Kočevje
00050000-55f7-ef25-a02c-77992d9fab9e	1338	Kočevska Reka
00050000-55f7-ef25-056c-62e9947d215d	2276	Kog
00050000-55f7-ef25-45c1-a6125e1a4ec6	5211	Kojsko
00050000-55f7-ef25-4f58-cb89742e6d92	6223	Komen
00050000-55f7-ef25-ecbd-43a9aba3b4e4	1218	Komenda
00050000-55f7-ef25-6d1f-874203568f2d	6000	Koper/Capodistria 
00050000-55f7-ef25-3488-daae421f1c5f	6001	Koper/Capodistria - poštni predali
00050000-55f7-ef25-f487-c99fe61ee39b	8282	Koprivnica
00050000-55f7-ef25-cdd7-4347465bd649	5296	Kostanjevica na Krasu
00050000-55f7-ef25-8c5c-fe686c0aeef0	8311	Kostanjevica na Krki
00050000-55f7-ef25-4bc2-c27fcf03c405	1336	Kostel
00050000-55f7-ef25-7786-9c2c3a75e17f	6256	Košana
00050000-55f7-ef25-25bd-992ea37525d4	2394	Kotlje
00050000-55f7-ef25-a67a-720dd0f2bb48	6240	Kozina
00050000-55f7-ef25-2f37-8fa413d2b4d6	3260	Kozje
00050000-55f7-ef25-4ec8-d42e1678db5b	4000	Kranj 
00050000-55f7-ef25-16ad-ab5cc7ba6b3b	4001	Kranj - poštni predali
00050000-55f7-ef25-405c-f1bb6aa34787	4280	Kranjska Gora
00050000-55f7-ef25-540b-e4dcace68a6b	1281	Kresnice
00050000-55f7-ef25-696e-e8e82b910f49	4294	Križe
00050000-55f7-ef25-8f9f-eda4539fd790	9206	Križevci
00050000-55f7-ef25-fc19-a82c9b38a54f	9242	Križevci pri Ljutomeru
00050000-55f7-ef25-503f-04e4582246dc	1301	Krka
00050000-55f7-ef25-2b3d-f93b72a19e97	8296	Krmelj
00050000-55f7-ef25-bcb8-37952cbf4135	4245	Kropa
00050000-55f7-ef25-6698-13dc750e07aa	8262	Krška vas
00050000-55f7-ef25-d5a9-b92d8b675cbf	8270	Krško
00050000-55f7-ef25-5cc3-a1d9075f920f	9263	Kuzma
00050000-55f7-ef25-dc92-98c875276b20	2318	Laporje
00050000-55f7-ef25-a9eb-0c80c40763a2	3270	Laško
00050000-55f7-ef25-710a-6bf641f2c069	1219	Laze v Tuhinju
00050000-55f7-ef25-34e9-ac69441bd862	2230	Lenart v Slovenskih goricah
00050000-55f7-ef25-2d05-98d9054e677b	9220	Lendava/Lendva
00050000-55f7-ef25-b051-6236de4cca31	4248	Lesce
00050000-55f7-ef25-7d49-5c0efebd5a45	3261	Lesično
00050000-55f7-ef25-1c58-02576992cbd8	8273	Leskovec pri Krškem
00050000-55f7-ef25-968f-cc59de3c5a6a	2372	Libeliče
00050000-55f7-ef25-a636-f9de05eea280	2341	Limbuš
00050000-55f7-ef25-08e9-e59e1bdb81d3	1270	Litija
00050000-55f7-ef25-40c5-c02650421470	3202	Ljubečna
00050000-55f7-ef25-b999-205598597fe8	1000	Ljubljana 
00050000-55f7-ef25-610f-53af33877f2e	1001	Ljubljana - poštni predali
00050000-55f7-ef25-46de-f8defb3ef272	1231	Ljubljana - Črnuče
00050000-55f7-ef25-c4ad-2fb0cfd23e38	1261	Ljubljana - Dobrunje
00050000-55f7-ef25-0b4c-5a173fe4223a	1260	Ljubljana - Polje
00050000-55f7-ef25-008b-dd97a0d5ce82	1210	Ljubljana - Šentvid
00050000-55f7-ef25-3056-1bdd28f71960	1211	Ljubljana - Šmartno
00050000-55f7-ef25-0c27-abab0d008983	3333	Ljubno ob Savinji
00050000-55f7-ef25-4da9-23591a335abd	9240	Ljutomer
00050000-55f7-ef25-522d-6dd5aec91eb4	3215	Loče
00050000-55f7-ef25-b001-f87046d22208	5231	Log pod Mangartom
00050000-55f7-ef25-616a-4b8d60bd0f1c	1358	Log pri Brezovici
00050000-55f7-ef25-e2c1-25df70327f78	1370	Logatec
00050000-55f7-ef25-4dc4-4cf3eb234265	1371	Logatec
00050000-55f7-ef25-f059-6df4095613e8	1434	Loka pri Zidanem Mostu
00050000-55f7-ef25-2d8c-539253c09efb	3223	Loka pri Žusmu
00050000-55f7-ef25-29bb-93ede4e62d7b	6219	Lokev
00050000-55f7-ef25-61e8-6863b1f5362a	1318	Loški Potok
00050000-55f7-ef25-c499-960324692841	2324	Lovrenc na Dravskem polju
00050000-55f7-ef25-1018-af1fca062647	2344	Lovrenc na Pohorju
00050000-55f7-ef25-dcba-3b005c1da336	3334	Luče
00050000-55f7-ef25-a6e4-d64e412562d8	1225	Lukovica
00050000-55f7-ef25-415f-e767c87a8a03	9202	Mačkovci
00050000-55f7-ef25-fdc4-b274d3ebd85b	2322	Majšperk
00050000-55f7-ef25-ecc5-087de1fb6cb2	2321	Makole
00050000-55f7-ef25-ece8-d8b8d614c2fe	9243	Mala Nedelja
00050000-55f7-ef25-180a-8a277a67eafa	2229	Malečnik
00050000-55f7-ef25-a456-207344aee5e6	6273	Marezige
00050000-55f7-ef25-8160-861503572aa0	2000	Maribor 
00050000-55f7-ef25-db87-de84f7b41bf2	2001	Maribor - poštni predali
00050000-55f7-ef25-dfa1-19e380646fbd	2206	Marjeta na Dravskem polju
00050000-55f7-ef25-396d-8209bf6f6003	2281	Markovci
00050000-55f7-ef25-ce00-1bfe6047116e	9221	Martjanci
00050000-55f7-ef25-1d2b-5fa7e8e15f2b	6242	Materija
00050000-55f7-ef25-dded-cb7e57c4d9f9	4211	Mavčiče
00050000-55f7-ef25-a3f0-1e14040ee27a	1215	Medvode
00050000-55f7-ef25-8017-a7151422854e	1234	Mengeš
00050000-55f7-ef25-7c6a-81ee407c9274	8330	Metlika
00050000-55f7-ef25-4bbe-f7ba4a641fff	2392	Mežica
00050000-55f7-ef25-de79-c159fb8490ea	2204	Miklavž na Dravskem polju
00050000-55f7-ef25-29b0-39cc6480f773	2275	Miklavž pri Ormožu
00050000-55f7-ef25-92ac-bf34bb4ab261	5291	Miren
00050000-55f7-ef25-346f-238af61e9f42	8233	Mirna
00050000-55f7-ef25-8743-4402f4ccb321	8216	Mirna Peč
00050000-55f7-ef25-c7e6-7a2b2706a823	2382	Mislinja
00050000-55f7-ef25-e1ba-157b3a498915	4281	Mojstrana
00050000-55f7-ef25-9590-d9aae1e686ac	8230	Mokronog
00050000-55f7-ef25-7a59-4e392029849d	1251	Moravče
00050000-55f7-ef25-2e8f-1f2490304a62	9226	Moravske Toplice
00050000-55f7-ef25-3b2b-a6188fa5a171	5216	Most na Soči
00050000-55f7-ef25-f404-23f238f4a52e	1221	Motnik
00050000-55f7-ef25-cc54-8708f33bf490	3330	Mozirje
00050000-55f7-ef25-b622-b33e642065cd	9000	Murska Sobota 
00050000-55f7-ef25-6bd0-7f6f7ccdcaee	9001	Murska Sobota - poštni predali
00050000-55f7-ef25-1c1b-03045a2740bd	2366	Muta
00050000-55f7-ef25-272b-fb891c027b0c	4202	Naklo
00050000-55f7-ef25-f912-d00040b4a2c0	3331	Nazarje
00050000-55f7-ef25-49ed-a2712b0dc8fb	1357	Notranje Gorice
00050000-55f7-ef25-1483-d3e5330a316e	3203	Nova Cerkev
00050000-55f7-ef25-987e-18190154f44e	5000	Nova Gorica 
00050000-55f7-ef25-0c36-07608b888f6d	5001	Nova Gorica - poštni predali
00050000-55f7-ef25-3e74-0c4dad469b7c	1385	Nova vas
00050000-55f7-ef25-fe65-19518287fc2f	8000	Novo mesto
00050000-55f7-ef25-1565-a76852bbd82d	8001	Novo mesto - poštni predali
00050000-55f7-ef25-f5f6-baca890f9727	6243	Obrov
00050000-55f7-ef25-8dba-229f62512ae2	9233	Odranci
00050000-55f7-ef25-34f5-0be2eefc98df	2317	Oplotnica
00050000-55f7-ef25-b6e9-c240925bcae3	2312	Orehova vas
00050000-55f7-ef25-1b95-082169fcf528	2270	Ormož
00050000-55f7-ef25-b6bc-835a01040a0a	1316	Ortnek
00050000-55f7-ef25-5e0e-aefac8e88e9b	1337	Osilnica
00050000-55f7-ef25-8cbd-5f95ca27b28f	8222	Otočec
00050000-55f7-ef25-f08b-cf952806ba6c	2361	Ožbalt
00050000-55f7-ef25-d9d0-aa24ad198c54	2231	Pernica
00050000-55f7-ef25-ce29-c5d8b908a9dc	2211	Pesnica pri Mariboru
00050000-55f7-ef25-451b-2d0cba7d1786	9203	Petrovci
00050000-55f7-ef25-2495-7ff74ca98d13	3301	Petrovče
00050000-55f7-ef25-48ae-c78f59089a4e	6330	Piran/Pirano
00050000-55f7-ef25-76d8-461a14336549	8255	Pišece
00050000-55f7-ef25-a96d-40e53b973b45	6257	Pivka
00050000-55f7-ef25-aee2-01a9ceda855c	6232	Planina
00050000-55f7-ef25-210c-0b5d281065c8	3225	Planina pri Sevnici
00050000-55f7-ef25-e1dc-acb282301882	6276	Pobegi
00050000-55f7-ef25-7092-70347594455d	8312	Podbočje
00050000-55f7-ef25-e410-131208b84ff5	5243	Podbrdo
00050000-55f7-ef25-8eee-c3cdc68cfc0d	3254	Podčetrtek
00050000-55f7-ef25-1098-559e705040c9	2273	Podgorci
00050000-55f7-ef25-b5f2-3b09570be17c	6216	Podgorje
00050000-55f7-ef25-c857-dd5a60d06a12	2381	Podgorje pri Slovenj Gradcu
00050000-55f7-ef25-a7ea-9f2603450880	6244	Podgrad
00050000-55f7-ef25-1e9f-9009b50f7426	1414	Podkum
00050000-55f7-ef25-264f-1ba80c24f2cf	2286	Podlehnik
00050000-55f7-ef25-6d7e-ad00fcda3d67	5272	Podnanos
00050000-55f7-ef25-2b92-7c1db1c73893	4244	Podnart
00050000-55f7-ef25-6595-b481782c98e9	3241	Podplat
00050000-55f7-ef25-59ee-02e67a303d2c	3257	Podsreda
00050000-55f7-ef25-23f6-263a8b1a21a5	2363	Podvelka
00050000-55f7-ef25-a965-e4e8578ab553	2208	Pohorje
00050000-55f7-ef25-e232-ab1221e2233f	2257	Polenšak
00050000-55f7-ef25-db56-e0a31d07ab1a	1355	Polhov Gradec
00050000-55f7-ef25-54b5-af6509416b5c	4223	Poljane nad Škofjo Loko
00050000-55f7-ef25-7788-c0b1eab26f90	2319	Poljčane
00050000-55f7-ef25-6a03-82be1a8c59ad	1272	Polšnik
00050000-55f7-ef25-1fe9-c6f252ad5e18	3313	Polzela
00050000-55f7-ef25-808d-67258692efbb	3232	Ponikva
00050000-55f7-ef25-2c81-a388e0a563b8	6320	Portorož/Portorose
00050000-55f7-ef25-dcd9-ef4978ad7b4f	6230	Postojna
00050000-55f7-ef25-5324-00e2fc134439	2331	Pragersko
00050000-55f7-ef25-7de5-51edac502846	3312	Prebold
00050000-55f7-ef25-cd31-6e5021bf3c79	4205	Preddvor
00050000-55f7-ef25-af95-7765c66cae4f	6255	Prem
00050000-55f7-ef25-a978-162c9a7481ce	1352	Preserje
00050000-55f7-ef25-9972-c0752cbdc8ad	6258	Prestranek
00050000-55f7-ef25-75ec-9a3ed78f0fa0	2391	Prevalje
00050000-55f7-ef25-dac4-379ae19b5298	3262	Prevorje
00050000-55f7-ef25-9804-7a756d6431a6	1276	Primskovo 
00050000-55f7-ef25-25ca-81e360a0b8c9	3253	Pristava pri Mestinju
00050000-55f7-ef25-14c2-7ab4ae455560	9207	Prosenjakovci/Partosfalva
00050000-55f7-ef25-aeb5-33a2f104a2e3	5297	Prvačina
00050000-55f7-ef25-541e-adbcd22e76f9	2250	Ptuj
00050000-55f7-ef25-0275-be5cba4cf36f	2323	Ptujska Gora
00050000-55f7-ef25-8256-588a48699bdf	9201	Puconci
00050000-55f7-ef25-5b24-5040b946a1c8	2327	Rače
00050000-55f7-ef25-d4f6-1a0b3c74469c	1433	Radeče
00050000-55f7-ef25-582d-07a89d6424ca	9252	Radenci
00050000-55f7-ef25-bd18-65237794ee98	2360	Radlje ob Dravi
00050000-55f7-ef25-adc5-28f23ab1eb5f	1235	Radomlje
00050000-55f7-ef25-cf73-19eaa855b17e	4240	Radovljica
00050000-55f7-ef25-a861-2e278e22f9cc	8274	Raka
00050000-55f7-ef25-ecab-ea5c912bd0d4	1381	Rakek
00050000-55f7-ef25-6fca-5ece3ff6ec79	4283	Rateče - Planica
00050000-55f7-ef25-9c9d-19da618d64cf	2390	Ravne na Koroškem
00050000-55f7-ef25-b3ba-db58ea2db566	9246	Razkrižje
00050000-55f7-ef25-b236-c63822711d8a	3332	Rečica ob Savinji
00050000-55f7-ef25-a1d2-834d795bb774	5292	Renče
00050000-55f7-ef25-51d0-002af193ae03	1310	Ribnica
00050000-55f7-ef25-34ca-83d755c0f565	2364	Ribnica na Pohorju
00050000-55f7-ef25-0a80-f0b16d9537c5	3272	Rimske Toplice
00050000-55f7-ef25-fb5a-2da0c4652bf3	1314	Rob
00050000-55f7-ef25-50e2-9f8d0675541f	5215	Ročinj
00050000-55f7-ef25-1f1a-bd427a07b0ac	3250	Rogaška Slatina
00050000-55f7-ef25-8ecf-25f75f70a1b1	9262	Rogašovci
00050000-55f7-ef25-24a2-799b49be7ca3	3252	Rogatec
00050000-55f7-ef25-6a57-07fa24d5fc0f	1373	Rovte
00050000-55f7-ef25-ae82-7a5a525c8860	2342	Ruše
00050000-55f7-ef25-795d-c8606bd08a8a	1282	Sava
00050000-55f7-ef25-032c-f90e9d7ea5db	6333	Sečovlje/Sicciole
00050000-55f7-ef25-e381-fb8d6344a47c	4227	Selca
00050000-55f7-ef25-2a89-eaffc20147b2	2352	Selnica ob Dravi
00050000-55f7-ef25-70c7-179fec1ab4bc	8333	Semič
00050000-55f7-ef25-29ec-d577230a51f7	8281	Senovo
00050000-55f7-ef25-0c2d-3abd6175bddd	6224	Senožeče
00050000-55f7-ef25-eab4-2a679c384fe3	8290	Sevnica
00050000-55f7-ef25-24f2-7c07b5e38582	6210	Sežana
00050000-55f7-ef25-8728-cc7f50212310	2214	Sladki Vrh
00050000-55f7-ef25-26c2-1468502f34c7	5283	Slap ob Idrijci
00050000-55f7-ef25-c4b0-ced34cf54216	2380	Slovenj Gradec
00050000-55f7-ef25-31d1-6b1399527593	2310	Slovenska Bistrica
00050000-55f7-ef25-d0ff-a8ad90f64ba0	3210	Slovenske Konjice
00050000-55f7-ef25-9e84-953f3c204917	1216	Smlednik
00050000-55f7-ef25-0ed1-feb941fe1062	5232	Soča
00050000-55f7-ef25-a8a9-b9bb601519c0	1317	Sodražica
00050000-55f7-ef25-00f6-91849ea6cfce	3335	Solčava
00050000-55f7-ef25-86c3-c737d1b1d0c9	5250	Solkan
00050000-55f7-ef25-aaec-281461f966dc	4229	Sorica
00050000-55f7-ef25-8342-0603e49b2757	4225	Sovodenj
00050000-55f7-ef25-0174-56477d124b37	5281	Spodnja Idrija
00050000-55f7-ef25-09c7-266ba5b01027	2241	Spodnji Duplek
00050000-55f7-ef25-3d16-d5ebd0350bfd	9245	Spodnji Ivanjci
00050000-55f7-ef25-823c-37ed3c81e451	2277	Središče ob Dravi
00050000-55f7-ef25-8cf2-47851c1ab5d3	4267	Srednja vas v Bohinju
00050000-55f7-ef25-e5e7-d03769823451	8256	Sromlje 
00050000-55f7-ef25-9c98-628f8c8c615c	5224	Srpenica
00050000-55f7-ef25-18a0-6a0a45535d08	1242	Stahovica
00050000-55f7-ef25-d813-54065f44b8dd	1332	Stara Cerkev
00050000-55f7-ef25-76c5-cede7a5cacdd	8342	Stari trg ob Kolpi
00050000-55f7-ef25-b08a-ee3d23b22bf0	1386	Stari trg pri Ložu
00050000-55f7-ef25-78d6-3af8f33309dd	2205	Starše
00050000-55f7-ef25-7dff-4e78715acff1	2289	Stoperce
00050000-55f7-ef25-3d8f-5b678a3b250c	8322	Stopiče
00050000-55f7-ef25-80de-d8b475ae64b0	3206	Stranice
00050000-55f7-ef25-c6be-13dc70740bf4	8351	Straža
00050000-55f7-ef25-9839-884e33e23be4	1313	Struge
00050000-55f7-ef25-a433-9ca80ff95db1	8293	Studenec
00050000-55f7-ef25-8356-13ad046db16c	8331	Suhor
00050000-55f7-ef25-601a-de36c447c47d	2233	Sv. Ana v Slovenskih goricah
00050000-55f7-ef25-68d8-eb4a188d511f	2235	Sv. Trojica v Slovenskih goricah
00050000-55f7-ef25-228e-a6b2f9470b85	2353	Sveti Duh na Ostrem Vrhu
00050000-55f7-ef25-3b49-ab45266318fe	9244	Sveti Jurij ob Ščavnici
00050000-55f7-ef25-b1c0-6581d59707a0	3264	Sveti Štefan
00050000-55f7-ef25-e181-11820d38c808	2258	Sveti Tomaž
00050000-55f7-ef25-4d83-424e1f798b17	9204	Šalovci
00050000-55f7-ef25-fe81-c727a41a2f26	5261	Šempas
00050000-55f7-ef25-01cc-71e8baa55513	5290	Šempeter pri Gorici
00050000-55f7-ef25-d57a-b00df5c6f2ec	3311	Šempeter v Savinjski dolini
00050000-55f7-ef25-22c8-6a69368df00b	4208	Šenčur
00050000-55f7-ef25-2e98-40030218eb78	2212	Šentilj v Slovenskih goricah
00050000-55f7-ef25-f566-a5a336be3633	8297	Šentjanž
00050000-55f7-ef25-9add-3dffd20da921	2373	Šentjanž pri Dravogradu
00050000-55f7-ef25-5807-52f3ec046a76	8310	Šentjernej
00050000-55f7-ef25-e406-97d6990cccc7	3230	Šentjur
00050000-55f7-ef25-b09a-15c70642dcad	3271	Šentrupert
00050000-55f7-ef25-1b3a-ba8f856e6d6d	8232	Šentrupert
00050000-55f7-ef25-5274-1af348902e5b	1296	Šentvid pri Stični
00050000-55f7-ef25-4a02-a8dcb782ade0	8275	Škocjan
00050000-55f7-ef25-ab7b-1f4e0788b171	6281	Škofije
00050000-55f7-ef25-1eb2-0b3c26d0d06b	4220	Škofja Loka
00050000-55f7-ef25-2e7d-3394532323d9	3211	Škofja vas
00050000-55f7-ef25-2b81-7c92d4f9ae2e	1291	Škofljica
00050000-55f7-ef25-06a9-2c3640cea513	6274	Šmarje
00050000-55f7-ef25-512d-fa159120c255	1293	Šmarje - Sap
00050000-55f7-ef25-2dc4-c1238d2c0098	3240	Šmarje pri Jelšah
00050000-55f7-ef25-7d74-ffec57b471fb	8220	Šmarješke Toplice
00050000-55f7-ef25-80cf-69bd5ba4842a	2315	Šmartno na Pohorju
00050000-55f7-ef25-2e74-58cb7fc612b8	3341	Šmartno ob Dreti
00050000-55f7-ef25-0132-5afc93fd9f7d	3327	Šmartno ob Paki
00050000-55f7-ef25-6721-e9a7c93f4af7	1275	Šmartno pri Litiji
00050000-55f7-ef25-5249-203df15b6e6e	2383	Šmartno pri Slovenj Gradcu
00050000-55f7-ef26-5434-f4ab9295f481	3201	Šmartno v Rožni dolini
00050000-55f7-ef26-6d15-c52d5df198b9	3325	Šoštanj
00050000-55f7-ef26-4c9b-9a6df94bfdab	6222	Štanjel
00050000-55f7-ef26-3bcb-c817e6ff397f	3220	Štore
00050000-55f7-ef26-0283-b977b8d5e16d	3304	Tabor
00050000-55f7-ef26-9a33-cb15898c576b	3221	Teharje
00050000-55f7-ef26-ed1d-82a7aed508f9	9251	Tišina
00050000-55f7-ef26-4682-d0deadd732d3	5220	Tolmin
00050000-55f7-ef26-d8c4-09572c87c0c6	3326	Topolšica
00050000-55f7-ef26-6cd3-7c7dec8c78d4	2371	Trbonje
00050000-55f7-ef26-2237-9c2b652d5781	1420	Trbovlje
00050000-55f7-ef26-3f40-97c63779ee9d	8231	Trebelno 
00050000-55f7-ef26-32c2-fd6113a7aad3	8210	Trebnje
00050000-55f7-ef26-63d8-ec9c3917bcc6	5252	Trnovo pri Gorici
00050000-55f7-ef26-42b8-8c97bf2d200f	2254	Trnovska vas
00050000-55f7-ef26-07de-c12a6dd20779	1222	Trojane
00050000-55f7-ef26-5365-1a3a1b2c5e8d	1236	Trzin
00050000-55f7-ef26-5959-67f71191aed3	4290	Tržič
00050000-55f7-ef26-771c-ab9aa12c57e1	8295	Tržišče
00050000-55f7-ef26-5da7-7572e8e317cd	1311	Turjak
00050000-55f7-ef26-fb58-45cb46652a37	9224	Turnišče
00050000-55f7-ef26-2346-f552f5d17f7f	8323	Uršna sela
00050000-55f7-ef26-dd0b-cf17c0b5af79	1252	Vače
00050000-55f7-ef26-45ac-514149357c77	3320	Velenje 
00050000-55f7-ef26-d3a9-461d8bf6ff8c	3322	Velenje - poštni predali
00050000-55f7-ef26-9f38-44085cc59164	8212	Velika Loka
00050000-55f7-ef26-fee8-1d3657503425	2274	Velika Nedelja
00050000-55f7-ef26-cbc3-feda020c484c	9225	Velika Polana
00050000-55f7-ef26-4ac2-e47fe50b7925	1315	Velike Lašče
00050000-55f7-ef26-9e69-7a24f2480fb0	8213	Veliki Gaber
00050000-55f7-ef26-29a1-0aa547f52a8b	9241	Veržej
00050000-55f7-ef26-7f34-ee8867195b92	1312	Videm - Dobrepolje
00050000-55f7-ef26-4769-2f7f9cea8386	2284	Videm pri Ptuju
00050000-55f7-ef26-39a6-dceeb4e8c25b	8344	Vinica
00050000-55f7-ef26-3bf2-474449ab0f77	5271	Vipava
00050000-55f7-ef26-8cd3-71102aa49757	4212	Visoko
00050000-55f7-ef26-d7ed-660ac47e3fa3	1294	Višnja Gora
00050000-55f7-ef26-89ca-e71526520364	3205	Vitanje
00050000-55f7-ef26-bf53-ceabeae49e76	2255	Vitomarci
00050000-55f7-ef26-1ad7-51404d5ec078	1217	Vodice
00050000-55f7-ef26-1f57-2ec46e91cdbb	3212	Vojnik\t
00050000-55f7-ef26-dad6-5a99726e8d87	5293	Volčja Draga
00050000-55f7-ef26-e78e-847e6c79b7e8	2232	Voličina
00050000-55f7-ef26-3a8f-af46250fd7c6	3305	Vransko
00050000-55f7-ef26-ef81-dcfc7f8a0c85	6217	Vremski Britof
00050000-55f7-ef26-5f25-6b162f244069	1360	Vrhnika
00050000-55f7-ef26-98cb-e779865bfdf1	2365	Vuhred
00050000-55f7-ef26-da82-dd25fc801c16	2367	Vuzenica
00050000-55f7-ef26-335e-bd18ab870db6	8292	Zabukovje 
00050000-55f7-ef26-c3d8-51a2368128ba	1410	Zagorje ob Savi
00050000-55f7-ef26-ae72-00a36b796d9e	1303	Zagradec
00050000-55f7-ef26-86d9-35bb97d98df2	2283	Zavrč
00050000-55f7-ef26-3acf-9fbf22afa042	8272	Zdole 
00050000-55f7-ef26-66f3-2482214fbab7	4201	Zgornja Besnica
00050000-55f7-ef26-e971-8b5ca7360c10	2242	Zgornja Korena
00050000-55f7-ef26-5fa7-3054389e4f03	2201	Zgornja Kungota
00050000-55f7-ef26-70df-6dd537d5991d	2316	Zgornja Ložnica
00050000-55f7-ef26-06c2-b4ec9d7e7b92	2314	Zgornja Polskava
00050000-55f7-ef26-cf95-340d62d665de	2213	Zgornja Velka
00050000-55f7-ef26-00bf-c12b0784df78	4247	Zgornje Gorje
00050000-55f7-ef26-229b-49e2bd23346b	4206	Zgornje Jezersko
00050000-55f7-ef26-f1cf-2a54157ee5c7	2285	Zgornji Leskovec
00050000-55f7-ef26-1344-e4e524ba2a22	1432	Zidani Most
00050000-55f7-ef26-90c5-b03b7a5ba304	3214	Zreče
00050000-55f7-ef26-e256-dc91ed15cd13	4209	Žabnica
00050000-55f7-ef26-68b5-6aba7c462bf8	3310	Žalec
00050000-55f7-ef26-6a4e-495adc2fde9a	4228	Železniki
00050000-55f7-ef26-4b0d-c0edcc6ec0e5	2287	Žetale
00050000-55f7-ef26-b90c-26457c02fd67	4226	Žiri
00050000-55f7-ef26-bfe1-9e824dbc28c9	4274	Žirovnica
00050000-55f7-ef26-28ee-e1f46db9f96e	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 19561417)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 19561049)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 19560859)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f7-ef28-6144-c24ad69c0308	00080000-55f7-ef27-1f46-7beb9680015b	\N	00040000-55f7-ef26-1418-1af15bf137b0	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f7-ef28-f014-3ff68fec2c87	00080000-55f7-ef27-1f46-7beb9680015b	\N	00040000-55f7-ef26-1418-1af15bf137b0	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f7-ef28-c456-2f879875b7d4	00080000-55f7-ef27-ca39-efd99723d230	\N	00040000-55f7-ef26-1418-1af15bf137b0	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 19560937)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19561061)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19561431)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19561441)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f7-ef28-29e9-c1549ad64c7f	00080000-55f7-ef27-3000-af594f885ed0	0987	AK
00190000-55f7-ef28-02df-8bfb1045531b	00080000-55f7-ef27-ca39-efd99723d230	0989	AK
00190000-55f7-ef28-811c-9b61a7745277	00080000-55f7-ef27-7b1e-2e68a0551e49	0986	AK
00190000-55f7-ef28-70a9-a40240d67c80	00080000-55f7-ef27-8cd9-560b0b15c424	0984	AK
00190000-55f7-ef28-609b-621615b3b23e	00080000-55f7-ef27-79cf-42fd47a68144	0983	AK
00190000-55f7-ef28-5b6a-a85cd335b05f	00080000-55f7-ef27-4e3d-41b2a9ce7d01	0982	AK
00190000-55f7-ef29-030e-4433eba90d9a	00080000-55f7-ef29-4738-14729555c8dd	1001	AK
\.


--
-- TOC entry 2989 (class 0 OID 19561374)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f7-ef28-f05e-68746a21fb58	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2993 (class 0 OID 19561449)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 19561090)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f7-ef27-3e79-a0ae2d66f77a	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f7-ef27-cafc-5841245c083a	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f7-ef27-1924-fee0e4fa76ca	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f7-ef27-d895-1e5635ada48b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f7-ef27-bfdf-5718685a2655	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f7-ef27-a317-0448119c4c35	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f7-ef27-1c06-aa18696e137a	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2962 (class 0 OID 19561034)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19561024)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19561227)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19561164)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 19560732)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f7-ef29-4738-14729555c8dd	00010000-55f7-ef26-de48-65bad8fff9f5	2015-09-15 12:12:57	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f7-ef29-1e55-791d0370453e	00010000-55f7-ef26-de48-65bad8fff9f5	2015-09-15 12:12:57	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f7-ef29-030e-4433eba90d9a	00010000-55f7-ef26-de48-65bad8fff9f5	2015-09-15 12:12:57	INS	a:0:{}
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2971 (class 0 OID 19561103)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 19560770)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f7-ef26-fbbc-bca1f9be0c55	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f7-ef26-e16c-86d52018acf5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f7-ef26-01f8-691d6ec804bf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f7-ef26-fb26-b7385344c79b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f7-ef26-fae0-a1865bc2602d	planer	Planer dogodkov v koledarju	t
00020000-55f7-ef26-2fc8-1093f915d51f	kadrovska	Kadrovska služba	t
00020000-55f7-ef26-1100-f198ca9a6ada	arhivar	Ažuriranje arhivalij	t
00020000-55f7-ef26-dd18-aa0ebb045a9f	igralec	Igralec	t
00020000-55f7-ef26-30ab-ae1ad22c38ff	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f7-ef27-f7b1-9fc1d03e55e6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2938 (class 0 OID 19560754)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f7-ef26-b42e-55ea68749c6b	00020000-55f7-ef26-01f8-691d6ec804bf
00010000-55f7-ef26-de48-65bad8fff9f5	00020000-55f7-ef26-01f8-691d6ec804bf
00010000-55f7-ef28-3cdc-41697db96d3a	00020000-55f7-ef27-f7b1-9fc1d03e55e6
\.


--
-- TOC entry 2973 (class 0 OID 19561117)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19561055)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 19561001)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 19560719)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f7-ef26-1c38-548611849a81	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f7-ef26-7e7c-8f28f85121cc	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f7-ef26-6b3c-b14b565f8ea2	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f7-ef26-f5cc-17cd9762a4d8	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f7-ef26-a5bb-cdf850373e13	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2933 (class 0 OID 19560711)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f7-ef26-d27f-8c5b04e66cb7	00230000-55f7-ef26-f5cc-17cd9762a4d8	popa
00240000-55f7-ef26-a376-ac07210fbeb8	00230000-55f7-ef26-f5cc-17cd9762a4d8	oseba
00240000-55f7-ef26-0a72-d4151917637d	00230000-55f7-ef26-f5cc-17cd9762a4d8	sezona
00240000-55f7-ef26-51b7-476d61286720	00230000-55f7-ef26-7e7c-8f28f85121cc	prostor
00240000-55f7-ef26-05d2-e7b31898cd09	00230000-55f7-ef26-f5cc-17cd9762a4d8	besedilo
00240000-55f7-ef26-7f49-31e9f9e7c3ed	00230000-55f7-ef26-f5cc-17cd9762a4d8	uprizoritev
00240000-55f7-ef26-f091-969024797860	00230000-55f7-ef26-f5cc-17cd9762a4d8	funkcija
00240000-55f7-ef26-00dc-64ec99c7385e	00230000-55f7-ef26-f5cc-17cd9762a4d8	tipfunkcije
00240000-55f7-ef26-47ee-633675331bb8	00230000-55f7-ef26-f5cc-17cd9762a4d8	alternacija
00240000-55f7-ef26-a9e3-d0953948ceb6	00230000-55f7-ef26-1c38-548611849a81	pogodba
00240000-55f7-ef26-f250-ca94e4d76e67	00230000-55f7-ef26-f5cc-17cd9762a4d8	zaposlitev
00240000-55f7-ef26-0e9b-82e79dfa04b0	00230000-55f7-ef26-f5cc-17cd9762a4d8	zvrstuprizoritve
00240000-55f7-ef26-412b-59c0c5032bed	00230000-55f7-ef26-1c38-548611849a81	programdela
00240000-55f7-ef26-2de3-75d55d5b450f	00230000-55f7-ef26-f5cc-17cd9762a4d8	zapis
\.


--
-- TOC entry 2932 (class 0 OID 19560706)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
aa5c0da3-6b9d-4b46-9b19-8e35d042791e	00240000-55f7-ef26-d27f-8c5b04e66cb7	0	1001
\.


--
-- TOC entry 2978 (class 0 OID 19561174)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f7-ef28-7c5b-1e440367060a	000e0000-55f7-ef28-b966-4c22329ff020	00080000-55f7-ef27-1f46-7beb9680015b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f7-ef26-1409-b6bec12e13fe
00270000-55f7-ef28-35f2-b27bf11d53bd	000e0000-55f7-ef28-b966-4c22329ff020	00080000-55f7-ef27-1f46-7beb9680015b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f7-ef26-1409-b6bec12e13fe
\.


--
-- TOC entry 2945 (class 0 OID 19560832)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 19561011)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f7-ef28-f382-0e3f4fe1693f	00180000-55f7-ef28-9f41-3cf7867e4376	000c0000-55f7-ef28-954e-56dc1f55bdb0	00090000-55f7-ef28-93aa-bf5882e4ce63	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f7-ef28-70e0-71e3e773f22a	00180000-55f7-ef28-9f41-3cf7867e4376	000c0000-55f7-ef28-db0d-2e83d21f4d0a	00090000-55f7-ef28-f94a-6106222a58e6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f7-ef28-51c1-647d33265b93	00180000-55f7-ef28-9f41-3cf7867e4376	000c0000-55f7-ef28-7210-1797d9e6ab6b	00090000-55f7-ef28-61a5-1e11d10329db	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f7-ef28-d733-2ee430f0c9b8	00180000-55f7-ef28-9f41-3cf7867e4376	000c0000-55f7-ef28-799b-337462bd4bd7	00090000-55f7-ef28-7122-cdae2e6a8c76	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f7-ef28-1505-24cdce5f8bab	00180000-55f7-ef28-9f41-3cf7867e4376	000c0000-55f7-ef28-cb3d-79d2bbe19c27	00090000-55f7-ef28-2ea2-76f129e2e6ef	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f7-ef28-52e9-87919e1a0529	00180000-55f7-ef28-c4fc-1bf58058b313	\N	00090000-55f7-ef28-2ea2-76f129e2e6ef	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2981 (class 0 OID 19561215)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f7-ef26-0184-59c4d60cf6ac	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f7-ef26-6b1a-972de57238b0	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f7-ef26-4a64-ff0d7b3dd097	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f7-ef26-f2fe-460c2a4615bf	04	Režija	Režija	Režija	umetnik
000f0000-55f7-ef26-336f-3fb07d4eaf0a	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f7-ef26-2895-66f66813082a	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f7-ef26-193a-cfd06a8d26f3	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f7-ef26-9ee2-595b6a94e91b	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f7-ef26-a64e-18f61ee6098e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f7-ef26-ed88-5b1d8cab187b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f7-ef26-b70a-9ffae40bf13a	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f7-ef26-b22e-7adf974275cc	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f7-ef26-d687-df6e7972087e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f7-ef26-4ab2-11fb4b0bfcb7	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f7-ef26-1429-e87172397db1	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f7-ef26-758f-49aef465c478	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f7-ef26-6804-7f926d574389	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f7-ef26-3aab-019e89ed633b	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2994 (class 0 OID 19561459)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f7-ef26-5c2b-2589eb9f03d6	01	Velika predstava	f	1.00	1.00
002b0000-55f7-ef26-d5cf-9127e8a16dee	02	Mala predstava	f	0.50	0.50
002b0000-55f7-ef26-85a8-eb32e0afa4d7	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f7-ef26-b613-eb531e5c44a0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f7-ef26-3916-f390c51bdafd	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2950 (class 0 OID 19560894)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 19560741)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f7-ef26-de48-65bad8fff9f5	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROmf4Lc5SO4GxIwqwFq.SMp5gpedqBc.y	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f7-ef28-f824-4763f9d51fcf	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f7-ef28-8e3c-65625ed4f80d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f7-ef28-6bac-b209b66baf00	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f7-ef28-bd0a-2ad7a75f76e3	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f7-ef28-4d57-bc0a729526a7	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f7-ef28-a30b-1f8da5bc5975	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f7-ef28-5ca5-2d69ece905c2	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f7-ef28-b828-e0cb8fac12c2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f7-ef28-1795-3e320a36a3a5	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f7-ef28-3cdc-41697db96d3a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f7-ef26-b42e-55ea68749c6b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2985 (class 0 OID 19561264)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f7-ef28-dfb5-4c7014c50e40	00160000-55f7-ef27-fd93-ce97da411dc2	\N	00140000-55f7-ef26-99ca-368d14dac3fe	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f7-ef27-bfdf-5718685a2655
000e0000-55f7-ef28-b966-4c22329ff020	00160000-55f7-ef27-8957-afa286f81f28	\N	00140000-55f7-ef26-a513-eecaa150bf10	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f7-ef27-a317-0448119c4c35
000e0000-55f7-ef28-8d6b-e0b709a9c80b	\N	\N	00140000-55f7-ef26-a513-eecaa150bf10	00190000-55f7-ef28-29e9-c1549ad64c7f	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f7-ef27-bfdf-5718685a2655
000e0000-55f7-ef28-2424-bb39cc4b953a	\N	\N	00140000-55f7-ef26-a513-eecaa150bf10	00190000-55f7-ef28-29e9-c1549ad64c7f	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f7-ef27-bfdf-5718685a2655
000e0000-55f7-ef28-dd30-cdc3c7592cd2	\N	\N	00140000-55f7-ef26-a513-eecaa150bf10	00190000-55f7-ef28-29e9-c1549ad64c7f	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f7-ef27-3e79-a0ae2d66f77a
000e0000-55f7-ef28-4208-4c5aa40862e7	\N	\N	00140000-55f7-ef26-a513-eecaa150bf10	00190000-55f7-ef28-29e9-c1549ad64c7f	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f7-ef27-3e79-a0ae2d66f77a
\.


--
-- TOC entry 2955 (class 0 OID 19560955)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f7-ef28-5fc0-f833871c95f3	000e0000-55f7-ef28-b966-4c22329ff020	\N	1	
00200000-55f7-ef28-3f54-6a6f9e55d863	000e0000-55f7-ef28-b966-4c22329ff020	\N	2	
00200000-55f7-ef28-2f75-f24c8fa0bbd2	000e0000-55f7-ef28-b966-4c22329ff020	\N	3	
00200000-55f7-ef28-506d-b5d7e7fe5bcc	000e0000-55f7-ef28-b966-4c22329ff020	\N	4	
00200000-55f7-ef28-52ef-a427ef5a1bf8	000e0000-55f7-ef28-b966-4c22329ff020	\N	5	
\.


--
-- TOC entry 2969 (class 0 OID 19561082)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19561188)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f7-ef26-a70c-da1ec913e1b5	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f7-ef26-c1b9-f8fe8b12ad93	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f7-ef26-0472-a51061c57044	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f7-ef26-3e63-32ac837de379	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f7-ef26-f2e4-07a5cbe584f6	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f7-ef26-7ad2-45ff21528473	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f7-ef26-5e89-8393740f40a5	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f7-ef26-a6a1-e96be3f0c8d8	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f7-ef26-1409-b6bec12e13fe	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f7-ef26-1ec1-be7b07d3210f	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f7-ef26-0361-fcda53df1ed3	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f7-ef26-11f9-a703d613bbe9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f7-ef26-e7a3-44f03ef2e3e3	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f7-ef26-8be5-64ea3dbb0095	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f7-ef26-844a-1023c85486d4	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f7-ef26-10e6-b60182d3462f	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f7-ef26-92d6-fcf5777213e6	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f7-ef26-8251-8050c865157b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f7-ef26-fa3c-4cf408c85af5	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f7-ef26-cecd-d53175ddb8f3	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f7-ef26-da8c-fc3d955e80ce	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f7-ef26-062e-ea775ea8b1f1	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f7-ef26-b612-566688717944	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f7-ef26-7d62-a407a475292b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f7-ef26-94d7-7ff79a6ac4b5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f7-ef26-a415-a0e6465ab689	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f7-ef26-f38e-b9241de4e6ab	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f7-ef26-4149-8d9591d9473f	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2997 (class 0 OID 19561505)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 19561477)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 19561517)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 19561154)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f7-ef28-740a-60ecef3256d4	00090000-55f7-ef28-f94a-6106222a58e6	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f7-ef28-8974-dfad1bd7a8fd	00090000-55f7-ef28-61a5-1e11d10329db	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f7-ef28-d79f-fb95d78c08fc	00090000-55f7-ef28-9f65-4822bc3865aa	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f7-ef28-947e-9c8bda4b7baa	00090000-55f7-ef28-e2c7-57ffd2fe8c54	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f7-ef28-e77c-1e040b479ec4	00090000-55f7-ef28-93aa-bf5882e4ce63	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f7-ef28-7a6d-4dbee919bdd8	00090000-55f7-ef28-24bb-b7ab1c792c70	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2957 (class 0 OID 19560991)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19561254)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f7-ef26-99ca-368d14dac3fe	01	Drama	drama (SURS 01)
00140000-55f7-ef26-f8e8-601ef35de703	02	Opera	opera (SURS 02)
00140000-55f7-ef26-ae3a-02bc450ab6cb	03	Balet	balet (SURS 03)
00140000-55f7-ef26-76b7-6ae49b5e277a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f7-ef26-8d6f-868f89819500	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f7-ef26-a513-eecaa150bf10	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f7-ef26-36b8-4b796b3fa0aa	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2975 (class 0 OID 19561144)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 19560795)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 19561313)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 19561303)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 19561213)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 19561557)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 19560980)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 19561000)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 19561475)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19560920)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 19561368)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 19561140)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 19560953)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 19560934)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 19561047)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 19561534)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 19561541)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 19561565)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 19561074)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 19560892)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 19560804)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 19560828)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 19560784)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 19560769)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 19561080)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 19561116)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 19561249)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19560856)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19560880)
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
-- TOC entry 2679 (class 2606 OID 19561429)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 19561053)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 19560870)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19560941)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 19561065)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 19561438)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 19561446)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 19561416)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 19561457)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 19561098)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 19561038)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 19561029)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 19561237)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 19561171)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 19560740)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 19561107)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 19560758)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 19560778)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 19561125)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 19561060)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 19561009)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 19560728)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19560716)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 19560710)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 19561184)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 19560837)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 19561020)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 19561224)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 19561469)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 19560905)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 19560753)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 19561282)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 19560963)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 19561088)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 19561196)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 19561515)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 19561499)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 19561523)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 19561162)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 19560995)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 19561262)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 19561152)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 19560989)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 19560990)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 19560988)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 19560987)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 19560986)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2624 (class 1259 OID 19561185)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 19561186)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 19561187)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 19561536)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 19561535)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 19560858)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 19561081)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 19561503)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 19561502)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 19561504)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 19561501)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 19561500)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 19561067)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 19561066)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 19560964)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 19561141)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19561143)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 19561142)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 19560936)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 19560935)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 19561458)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 19561251)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 19561252)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 19561253)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 19561524)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 19561287)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 19561284)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 19561288)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 19561286)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 19561285)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 19560907)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 19560906)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 19560831)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 19561108)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 19560785)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 19560786)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 19561128)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 19561127)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 19561126)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 19560942)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 19560943)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 19560718)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 19561033)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 19561031)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 19561030)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 19561032)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 19560759)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 19560760)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 19561089)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 19561558)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 19561566)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 19561567)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 19561054)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 19561172)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 19561173)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 19561373)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 19561372)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 19561369)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 19561370)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 19561371)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 19560872)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 19560871)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 19560873)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 19561102)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 19561101)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 19561439)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 19561440)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 19561317)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 19561318)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 19561315)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 19561316)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 19561163)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 19561042)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 19561041)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 19561039)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 19561040)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 19561305)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 19561304)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 19560954)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 19561430)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 19561476)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 19561542)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 19561543)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 19560806)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 19560805)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 19560838)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19560839)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 19561023)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 19561022)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 19561021)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 19560982)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2545 (class 1259 OID 19560983)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2546 (class 1259 OID 19560981)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2547 (class 1259 OID 19560985)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2548 (class 1259 OID 19560984)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 19560857)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 19560921)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19560923)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 19560922)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 19560924)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 19561048)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 19561250)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 19561283)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 19561225)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19561226)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 19560829)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 19560830)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 19561153)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 19560729)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19560893)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 19560717)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2597 (class 1259 OID 19561100)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 19561099)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 19561314)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 19560881)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 19561263)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 19561516)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 19561447)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 19561448)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 19561214)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 19561010)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 19560779)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2748 (class 2606 OID 19561688)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2749 (class 2606 OID 19561693)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2753 (class 2606 OID 19561713)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2747 (class 2606 OID 19561683)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2751 (class 2606 OID 19561703)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2752 (class 2606 OID 19561708)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 19561698)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2783 (class 2606 OID 19561863)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2784 (class 2606 OID 19561868)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2785 (class 2606 OID 19561873)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2818 (class 2606 OID 19562038)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2817 (class 2606 OID 19562033)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 19561623)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 19561793)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2814 (class 2606 OID 19562018)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 19562013)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2815 (class 2606 OID 19562023)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2812 (class 2606 OID 19562008)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2811 (class 2606 OID 19562003)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2768 (class 2606 OID 19561788)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2767 (class 2606 OID 19561783)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 19561678)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 19561833)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 19561843)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 19561838)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2742 (class 2606 OID 19561658)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2741 (class 2606 OID 19561653)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 19561773)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 19561993)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2786 (class 2606 OID 19561878)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 19561883)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2788 (class 2606 OID 19561888)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2816 (class 2606 OID 19562028)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2792 (class 2606 OID 19561908)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2789 (class 2606 OID 19561893)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2793 (class 2606 OID 19561913)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2791 (class 2606 OID 19561903)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2790 (class 2606 OID 19561898)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2740 (class 2606 OID 19561648)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2739 (class 2606 OID 19561643)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 19561608)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2731 (class 2606 OID 19561603)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 19561813)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2727 (class 2606 OID 19561583)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2728 (class 2606 OID 19561588)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2776 (class 2606 OID 19561828)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 19561823)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2774 (class 2606 OID 19561818)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2743 (class 2606 OID 19561663)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2744 (class 2606 OID 19561668)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 19561568)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2760 (class 2606 OID 19561748)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2758 (class 2606 OID 19561738)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2757 (class 2606 OID 19561733)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2759 (class 2606 OID 19561743)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2725 (class 2606 OID 19561573)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2726 (class 2606 OID 19561578)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 19561798)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2821 (class 2606 OID 19562053)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2822 (class 2606 OID 19562058)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2823 (class 2606 OID 19562063)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 19561778)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2781 (class 2606 OID 19561853)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2782 (class 2606 OID 19561858)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 19561968)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 19561963)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2800 (class 2606 OID 19561948)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2801 (class 2606 OID 19561953)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2802 (class 2606 OID 19561958)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 19561633)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2736 (class 2606 OID 19561628)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 19561638)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2772 (class 2606 OID 19561808)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2771 (class 2606 OID 19561803)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2806 (class 2606 OID 19561978)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2807 (class 2606 OID 19561983)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2798 (class 2606 OID 19561938)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2799 (class 2606 OID 19561943)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2796 (class 2606 OID 19561928)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2797 (class 2606 OID 19561933)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 19561848)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2764 (class 2606 OID 19561768)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2763 (class 2606 OID 19561763)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2761 (class 2606 OID 19561753)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2762 (class 2606 OID 19561758)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2795 (class 2606 OID 19561923)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2794 (class 2606 OID 19561918)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 19561673)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 19561973)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2808 (class 2606 OID 19561988)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 19561998)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2819 (class 2606 OID 19562043)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2820 (class 2606 OID 19562048)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2730 (class 2606 OID 19561598)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2729 (class 2606 OID 19561593)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2733 (class 2606 OID 19561613)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2734 (class 2606 OID 19561618)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 19561728)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 19561723)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2754 (class 2606 OID 19561718)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-15 12:12:58 CEST

--
-- PostgreSQL database dump complete
--

