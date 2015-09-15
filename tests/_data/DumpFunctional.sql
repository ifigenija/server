--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-15 16:52:35 CEST

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
-- TOC entry 181 (class 1259 OID 19715562)
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
-- TOC entry 226 (class 1259 OID 19716084)
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
-- TOC entry 225 (class 1259 OID 19716067)
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
-- TOC entry 219 (class 1259 OID 19715975)
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
-- TOC entry 240 (class 1259 OID 19716323)
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
-- TOC entry 195 (class 1259 OID 19715743)
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
-- TOC entry 197 (class 1259 OID 19715774)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19716249)
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
-- TOC entry 190 (class 1259 OID 19715683)
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
-- TOC entry 227 (class 1259 OID 19716097)
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
-- TOC entry 213 (class 1259 OID 19715907)
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
-- TOC entry 193 (class 1259 OID 19715722)
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
-- TOC entry 191 (class 1259 OID 19715700)
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
-- TOC entry 202 (class 1259 OID 19715821)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19716304)
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
-- TOC entry 239 (class 1259 OID 19716316)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19716338)
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
-- TOC entry 206 (class 1259 OID 19715846)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19715657)
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
-- TOC entry 182 (class 1259 OID 19715571)
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
-- TOC entry 183 (class 1259 OID 19715582)
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
-- TOC entry 178 (class 1259 OID 19715535)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19715555)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19715853)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19715887)
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
-- TOC entry 222 (class 1259 OID 19716016)
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
-- TOC entry 185 (class 1259 OID 19715615)
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
-- TOC entry 187 (class 1259 OID 19715649)
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
-- TOC entry 229 (class 1259 OID 19716195)
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
-- TOC entry 203 (class 1259 OID 19715827)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19715634)
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
-- TOC entry 192 (class 1259 OID 19715712)
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
-- TOC entry 205 (class 1259 OID 19715839)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19716209)
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
-- TOC entry 231 (class 1259 OID 19716219)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19716152)
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
-- TOC entry 232 (class 1259 OID 19716227)
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
-- TOC entry 209 (class 1259 OID 19715868)
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
-- TOC entry 201 (class 1259 OID 19715812)
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
-- TOC entry 200 (class 1259 OID 19715802)
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
-- TOC entry 221 (class 1259 OID 19716005)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19715942)
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
-- TOC entry 175 (class 1259 OID 19715506)
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
-- TOC entry 174 (class 1259 OID 19715504)
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
-- TOC entry 210 (class 1259 OID 19715881)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19715544)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19715528)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19715895)
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
-- TOC entry 204 (class 1259 OID 19715833)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19715779)
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
-- TOC entry 173 (class 1259 OID 19715493)
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
-- TOC entry 172 (class 1259 OID 19715485)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19715480)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19715952)
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
-- TOC entry 184 (class 1259 OID 19715607)
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
-- TOC entry 199 (class 1259 OID 19715789)
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
-- TOC entry 220 (class 1259 OID 19715993)
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
-- TOC entry 233 (class 1259 OID 19716237)
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
-- TOC entry 189 (class 1259 OID 19715669)
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
-- TOC entry 176 (class 1259 OID 19715515)
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
-- TOC entry 224 (class 1259 OID 19716042)
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
-- TOC entry 194 (class 1259 OID 19715733)
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
-- TOC entry 208 (class 1259 OID 19715860)
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
-- TOC entry 218 (class 1259 OID 19715966)
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
-- TOC entry 236 (class 1259 OID 19716284)
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
-- TOC entry 235 (class 1259 OID 19716256)
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
-- TOC entry 237 (class 1259 OID 19716296)
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
-- TOC entry 215 (class 1259 OID 19715932)
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
-- TOC entry 196 (class 1259 OID 19715769)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19716032)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19715922)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2195 (class 2604 OID 19715509)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2944 (class 0 OID 19715562)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 19716084)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f8-30b1-72a2-83f4fd0887b8	000d0000-55f8-30b1-585c-f65ddcf116de	\N	00090000-55f8-30b1-5865-56efafbad062	000b0000-55f8-30b1-3cc7-1365eec42aec	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f8-30b1-5dd4-a2b451ce2145	000d0000-55f8-30b1-0a50-5658d88bc420	00100000-55f8-30b1-9dca-c1099a3691c1	00090000-55f8-30b1-3bb4-9eae5de93f3e	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f8-30b1-9da0-3d07b32f3b74	000d0000-55f8-30b1-6c3d-1fbebd7bd2a8	00100000-55f8-30b1-7cef-c7de959ed01c	00090000-55f8-30b1-e339-6bebc99a1711	\N	0003	t	\N	2015-09-15	\N	2	t	\N	f	f
000c0000-55f8-30b1-9951-99c1127fd50e	000d0000-55f8-30b1-744e-6f52b2e2231d	\N	00090000-55f8-30b1-128a-908c7acb43c8	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f8-30b1-fd0f-f2c0e94c2cae	000d0000-55f8-30b1-b3e4-46d1bdb9e5ce	\N	00090000-55f8-30b1-28f1-f843d577420e	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f8-30b1-9ebb-f0771a85d2bb	000d0000-55f8-30b1-427a-3eb016091c3c	\N	00090000-55f8-30b1-d3ac-664fb464ad92	000b0000-55f8-30b1-a4bc-6a8e9db75649	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f8-30b1-34da-442249cbd0e6	000d0000-55f8-30b1-6b2b-4f0ffeb79757	00100000-55f8-30b1-d21c-e7e02ae96106	00090000-55f8-30b1-2d47-47adb108183a	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f8-30b1-b80c-89ae41080e9e	000d0000-55f8-30b1-b923-5559fc377543	\N	00090000-55f8-30b1-9f96-07b5eb581416	000b0000-55f8-30b1-c90b-e198fa80f29e	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f8-30b1-75d3-84b9b9a3e6b2	000d0000-55f8-30b1-6b2b-4f0ffeb79757	00100000-55f8-30b1-c414-1f083932e655	00090000-55f8-30b1-9969-e300a1d1003a	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f8-30b1-d41b-b60fe8b62dee	000d0000-55f8-30b1-6b2b-4f0ffeb79757	00100000-55f8-30b1-8ed2-66f03b0747b1	00090000-55f8-30b1-2492-3022cb684021	\N	0010	t	\N	2015-09-15	\N	16	f	\N	f	t
000c0000-55f8-30b1-aa25-7de58633199c	000d0000-55f8-30b1-6b2b-4f0ffeb79757	00100000-55f8-30b1-04c4-7a970b3d3c07	00090000-55f8-30b1-0848-d6efeaa909fb	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f8-30b1-952c-e51d9168d3fd	000d0000-55f8-30b1-df5b-8c654f049b3e	\N	00090000-55f8-30b1-3bb4-9eae5de93f3e	000b0000-55f8-30b1-b7a0-89dba4f9ee96	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2988 (class 0 OID 19716067)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19715975)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f8-30b1-55ff-4292c9a52e32	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f8-30b1-135d-74fabac352e6	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f8-30b1-5055-dad40308e969	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3003 (class 0 OID 19716323)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 19715743)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f8-30b1-7c4a-c35e1effb41b	\N	\N	00200000-55f8-30b1-ef4c-40313e971a63	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f8-30b1-b7ba-22af2d182248	\N	\N	00200000-55f8-30b1-38e9-74939ab7ef3f	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f8-30b1-e236-c936abc204e0	\N	\N	00200000-55f8-30b1-d40a-805daefc7050	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f8-30b1-cf19-de8d4cd4c5fa	\N	\N	00200000-55f8-30b1-dc8b-24e4b1d0640e	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f8-30b1-fbe7-7efccb535dc4	\N	\N	00200000-55f8-30b1-8998-283c6793bfb0	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2960 (class 0 OID 19715774)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 19716249)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 19715683)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f8-30af-6000-af7b7981225c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f8-30af-6895-50bec5fea1b2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f8-30af-197c-fd46249b6618	AL	ALB	008	Albania 	Albanija	\N
00040000-55f8-30af-9445-8db131f4a88e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f8-30af-7f33-e6d78e0a3600	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f8-30af-fce9-316a00a03f44	AD	AND	020	Andorra 	Andora	\N
00040000-55f8-30af-8d64-d44bf5eb8ad6	AO	AGO	024	Angola 	Angola	\N
00040000-55f8-30af-f78a-384f29d96f15	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f8-30af-bfa8-5b246061d3b8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f8-30af-6cbf-afd59a2a5b82	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f8-30af-faaa-482a8c69f4be	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f8-30af-43d5-4a8ffd1f1c83	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f8-30af-37d6-b0de5528f44f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f8-30af-1d65-2444aa413ca8	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f8-30af-67d6-0daeaafa10ac	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f8-30af-77d2-76c51452cc15	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f8-30af-637a-ed95acdbb165	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f8-30af-b1f3-114cb6a8a4fc	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f8-30af-6d8c-b698b2198460	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f8-30af-3681-2f050cec508e	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f8-30af-b2b0-e6542c1e80f3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f8-30af-45a0-2340b084fc91	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f8-30af-691c-2194652a430b	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f8-30af-7c33-5f2d8b156178	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f8-30af-372c-d1c4763d8f1d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f8-30af-108d-bde9601b1d11	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f8-30af-b7ec-d3b86cb7e9ce	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f8-30af-787b-5e09164f8c9e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f8-30af-8047-7811b0c1845e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f8-30af-71cc-abd83358e154	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f8-30af-8962-0470ed6e0c8d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f8-30af-29e3-406349f38c85	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f8-30af-451c-1d7b7bddcf3f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f8-30af-d90c-88b0e23d5eb0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f8-30af-d764-7452f4b69a31	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f8-30af-4f7d-70992c5b9a2f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f8-30af-9cd4-5d6148467921	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f8-30af-ff7a-b15bad336b57	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f8-30af-d6dc-7e93230032a8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f8-30af-7833-74445b3c15e7	CA	CAN	124	Canada 	Kanada	\N
00040000-55f8-30af-5970-b490394ad83a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f8-30af-b28e-1109836c05cf	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f8-30af-c843-7535960d965a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f8-30af-fddd-08ac61800af0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f8-30af-032b-6533888cd631	CL	CHL	152	Chile 	Čile	\N
00040000-55f8-30af-a2ea-a6c5d77ca326	CN	CHN	156	China 	Kitajska	\N
00040000-55f8-30af-a08f-d379628621c9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f8-30af-fb5b-8d2e55f8fd78	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f8-30af-3d07-0be4501ba468	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f8-30af-2d89-9e19dfc4e6a7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f8-30af-47e7-8add9e5b9c2e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f8-30af-6edc-730d6b43391e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f8-30af-8ebd-063c41393cb1	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f8-30af-4efb-3588ca40b51f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f8-30af-17f5-3150ae531293	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f8-30af-6510-a49589792419	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f8-30af-c46c-6319dbfe41eb	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f8-30af-a12b-4c196c5d479e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f8-30af-d0e6-435b98a545d8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f8-30af-689c-efa099e012ef	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f8-30af-f3e8-435cab2b0c13	DK	DNK	208	Denmark 	Danska	\N
00040000-55f8-30af-4112-c3d9710bd51d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f8-30af-315b-64cdd9a4a067	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f8-30af-11e7-ebfee0f989d5	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f8-30af-b2e8-492afe56392a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f8-30af-9fb9-5aa1c170128c	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f8-30af-2677-0f44915362c5	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f8-30af-e5f9-aa3f04612eb2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f8-30af-b9be-c170641e46e0	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f8-30af-c48f-12917dfac12d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f8-30af-ec2e-737707912aed	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f8-30af-48b2-7929c9585bf4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f8-30af-ae7f-cb721cb91543	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f8-30af-c52b-a67e4f9d1a82	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f8-30af-8619-6db638651aca	FI	FIN	246	Finland 	Finska	\N
00040000-55f8-30af-a232-9eccd31c045f	FR	FRA	250	France 	Francija	\N
00040000-55f8-30af-2bde-f25e0382d5d8	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f8-30b0-b4e4-9800438ebc92	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f8-30af-789e-72d814fb087e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f8-30af-1658-87fa11ce9212	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f8-30af-7012-5e174a1a169c	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f8-30af-2927-d70dfb46aef6	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f8-30af-25e3-84a4006f9690	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f8-30af-d6a9-ad3ea481caf7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f8-30af-0c9a-324cffbf9b6e	GH	GHA	288	Ghana 	Gana	\N
00040000-55f8-30af-45ef-abe97b2aa647	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f8-30af-2dbb-9c8f5d6a6267	GR	GRC	300	Greece 	Grčija	\N
00040000-55f8-30af-338b-757ea544261b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f8-30af-7a47-b2d7f9cc2fce	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f8-30af-37c5-2f2348945b4b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f8-30af-b0e9-baabf8581004	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f8-30af-b7d2-7acd0ecc0c8a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f8-30af-2b8e-cc996b68bcc1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f8-30af-13fb-cfc98ceba959	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f8-30af-c045-6156ce3d1928	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f8-30af-7f39-3e7ce8f5a26e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f8-30af-e24b-ac35492a785e	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f8-30af-65ba-aeaedf2782ce	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f8-30af-94f2-3ccb6dee794a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f8-30af-9bd3-44773908dff8	HN	HND	340	Honduras 	Honduras	\N
00040000-55f8-30af-d8f1-c5979a79a1c5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f8-30af-7cf8-2f3749df79ac	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f8-30af-307b-5d811489eb09	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f8-30af-7417-28210f858788	IN	IND	356	India 	Indija	\N
00040000-55f8-30af-0a02-d4dda74df97a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f8-30af-431f-f649a4f81e9c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f8-30af-d582-1e0b3c763be6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f8-30af-33d3-bfb54e2ea2db	IE	IRL	372	Ireland 	Irska	\N
00040000-55f8-30af-5378-806c5933afa7	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f8-30af-e5dc-b41190107621	IL	ISR	376	Israel 	Izrael	\N
00040000-55f8-30af-cb24-26a6887fd488	IT	ITA	380	Italy 	Italija	\N
00040000-55f8-30af-a974-f2e551c54e23	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f8-30af-13f5-d81a1d2b7668	JP	JPN	392	Japan 	Japonska	\N
00040000-55f8-30af-5233-b25f4a88b424	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f8-30b0-053a-417aab8e9bdc	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f8-30b0-3677-2d08f8cb0cd6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f8-30b0-8105-eab7fe4f1e27	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f8-30b0-a2a8-bc2700bc70af	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f8-30b0-9163-df78ecbb8e7a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f8-30b0-04eb-4b57e7557c1b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f8-30b0-c947-1ce366114a20	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f8-30b0-bafe-a69caea2e8ce	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f8-30b0-68b9-7bc91671f726	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f8-30b0-7984-94db6869475b	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f8-30b0-5e25-4ad0db421573	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f8-30b0-dde4-0c46cec61fcf	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f8-30b0-435e-8de748e02e8e	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f8-30b0-7638-285520a10c11	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f8-30b0-f7cf-537650ba257c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f8-30b0-ab43-ad23433e8b0a	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f8-30b0-05eb-a85e7cfc4964	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f8-30b0-db85-8513fcea8950	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f8-30b0-0ede-3cafb7cc79a9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f8-30b0-f08c-9ab1ada16a77	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f8-30b0-528c-73993b18d8a2	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f8-30b0-5a5a-ec25dc16fbcc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f8-30b0-7fea-f2a8eb63f423	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f8-30b0-34bc-8e79bef5f691	ML	MLI	466	Mali 	Mali	\N
00040000-55f8-30b0-c2f2-6eec63a7e152	MT	MLT	470	Malta 	Malta	\N
00040000-55f8-30b0-3c76-0e6ef91df2d6	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f8-30b0-ed85-a1f47010ac4d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f8-30b0-36a7-6b0ad25ae677	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f8-30b0-fb8b-04d412bf0251	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f8-30b0-e350-c1155fa9ff80	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f8-30b0-a654-ca580ec02665	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f8-30b0-12c6-58e8c7ced1aa	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f8-30b0-d57b-e07bd4710aad	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f8-30b0-5eb6-b8671acd0d10	MC	MCO	492	Monaco 	Monako	\N
00040000-55f8-30b0-a81e-9fc6a886a4d8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f8-30b0-747d-55ef3a66b0a0	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f8-30b0-84e2-0353e514c1c1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f8-30b0-40e9-dea8479e3fb1	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f8-30b0-108a-bfe373489bb6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f8-30b0-daee-44e2ec75a478	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f8-30b0-2b94-b5b5f82878d1	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f8-30b0-67da-94291df2f17e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f8-30b0-a7ca-ee6a93091a98	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f8-30b0-72b0-78dfd33eacd7	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f8-30b0-db95-c1bc005f911b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f8-30b0-49cf-1615085512d9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f8-30b0-f1b4-efad92d1691e	NE	NER	562	Niger 	Niger 	\N
00040000-55f8-30b0-531b-079808251836	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f8-30b0-1993-32a2d736ab7c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f8-30b0-6748-1ee62451fbac	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f8-30b0-5fae-53fe002b637b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f8-30b0-13bd-bbce90cd875c	NO	NOR	578	Norway 	Norveška	\N
00040000-55f8-30b0-7a51-36fb1c0849b0	OM	OMN	512	Oman 	Oman	\N
00040000-55f8-30b0-2b0a-733b363abd87	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f8-30b0-20f6-1020f8ea0cad	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f8-30b0-717c-432aa07d47b3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f8-30b0-3ff5-e23ae6a58e5c	PA	PAN	591	Panama 	Panama	\N
00040000-55f8-30b0-c857-72abda75029e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f8-30b0-45d5-486b942f589f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f8-30b0-069b-f468d0892335	PE	PER	604	Peru 	Peru	\N
00040000-55f8-30b0-c243-8403b3ed7061	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f8-30b0-1b49-02ee26a89114	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f8-30b0-2714-8d390c6ac256	PL	POL	616	Poland 	Poljska	\N
00040000-55f8-30b0-43b1-9343ab6c6c24	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f8-30b0-b70f-c2e8a4542d26	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f8-30b0-77a4-6c3468bdb633	QA	QAT	634	Qatar 	Katar	\N
00040000-55f8-30b0-c189-8e1cb015e1b4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f8-30b0-e5b3-93b1dafd15d3	RO	ROU	642	Romania 	Romunija	\N
00040000-55f8-30b0-01d4-53acaee98036	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f8-30b0-1ab5-88664e55496a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f8-30b0-e3d5-2f1afff8c850	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f8-30b0-1868-959aa7907ecf	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f8-30b0-d007-f4ae9dd99c19	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f8-30b0-7782-8019c34b2c7e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f8-30b0-6357-d7097358a29e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f8-30b0-db35-37ffbde6e9ee	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f8-30b0-ce62-f4d7964af68d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f8-30b0-86ae-2aaf32aa1c5c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f8-30b0-6655-2d4493d46c6c	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f8-30b0-f4bf-240c9c0ac8fa	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f8-30b0-ddee-d04551d76c2b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f8-30b0-2264-0a7e22c9d5da	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f8-30b0-61e9-934d3e00c8a8	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f8-30b0-86f5-7d124a6b1b12	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f8-30b0-f9c8-8b48aed164a5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f8-30b0-f0aa-b71ca9e9d475	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f8-30b0-72a0-594906c40554	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f8-30b0-95d9-8c6cc095ff61	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f8-30b0-4fd4-a22fcf55a3ea	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f8-30b0-a47f-a1ee5ac88701	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f8-30b0-0840-1aa522251b91	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f8-30b0-1448-16d802b9a4fb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f8-30b0-6b27-128c9ac80e2c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f8-30b0-ec7e-e1c7eb8072a2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f8-30b0-30f3-26b9966704f0	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f8-30b0-f15d-e141e00800c2	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f8-30b0-bc42-e5d4f1de0b67	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f8-30b0-d619-d2cbdf9122c6	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f8-30b0-ab69-5fcc260336d7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f8-30b0-3088-83060f50c705	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f8-30b0-5392-f038f41308b1	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f8-30b0-5522-5ed5d54f6ffb	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f8-30b0-1172-3b1e388dfe5b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f8-30b0-fe9d-8e6f9e3b357b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f8-30b0-0c4e-777a015b3151	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f8-30b0-bdda-061b944a004f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f8-30b0-9ea6-01c4bd5920cc	TH	THA	764	Thailand 	Tajska	\N
00040000-55f8-30b0-9abc-b5d6c2c883c4	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f8-30b0-ceac-a92597114fe8	TG	TGO	768	Togo 	Togo	\N
00040000-55f8-30b0-4593-aa3981995da6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f8-30b0-9609-51440ec8b4c7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f8-30b0-cd43-799beffd8707	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f8-30b0-73e4-ea3004c77baf	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f8-30b0-616a-a1c4129f5652	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f8-30b0-310a-dfa7e1f96716	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f8-30b0-7254-5ee008660435	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f8-30b0-35b9-1a258c7db4d3	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f8-30b0-34a4-241cc5fe8392	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f8-30b0-1702-de133ba2dab8	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f8-30b0-65e3-c6cde03d7c38	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f8-30b0-383b-ed02378c076b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f8-30b0-3572-703d6fa5667f	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f8-30b0-1dd8-402d6002625d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f8-30b0-b049-e59ae79d309c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f8-30b0-2cff-d533ded0b9ff	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f8-30b0-6af9-18600ca87dfe	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f8-30b0-e212-0f1f3b4052d4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f8-30b0-0223-f849d43dbc30	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f8-30b0-c105-debdbd187350	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f8-30b0-3c6f-a6c468eeda8a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f8-30b0-b4ab-b608e1e17bd3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f8-30b0-31d5-3287f5202c1b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f8-30b0-8f84-a46501fed982	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f8-30b0-196c-f18ded10dfc6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f8-30b0-6efd-4091c59d4413	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2990 (class 0 OID 19716097)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f8-30b1-73c0-c6c2257905be	000e0000-55f8-30b1-18dc-5b32acd898dd	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f8-30af-d5f5-7eb8834f9886	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f8-30b1-c460-bb90a2f9707d	000e0000-55f8-30b1-e0d3-674b24190737	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f8-30af-ac7c-38978e09876e	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f8-30b1-d880-d53c3f4ad2a7	000e0000-55f8-30b1-93dc-b521df56091a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f8-30af-d5f5-7eb8834f9886	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f8-30b1-a446-dd9367e248eb	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f8-30b1-17ea-19ff8ad69369	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2976 (class 0 OID 19715907)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f8-30b1-585c-f65ddcf116de	000e0000-55f8-30b1-e0d3-674b24190737	000c0000-55f8-30b1-72a2-83f4fd0887b8	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f8-30af-d15e-ea3a25803805
000d0000-55f8-30b1-0a50-5658d88bc420	000e0000-55f8-30b1-e0d3-674b24190737	000c0000-55f8-30b1-5dd4-a2b451ce2145	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f8-30af-9ef9-321900503ec4
000d0000-55f8-30b1-6c3d-1fbebd7bd2a8	000e0000-55f8-30b1-e0d3-674b24190737	000c0000-55f8-30b1-9da0-3d07b32f3b74	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f8-30af-c06f-17f0e207eefd
000d0000-55f8-30b1-744e-6f52b2e2231d	000e0000-55f8-30b1-e0d3-674b24190737	000c0000-55f8-30b1-9951-99c1127fd50e	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f8-30af-557e-8f5ddb6d421d
000d0000-55f8-30b1-b3e4-46d1bdb9e5ce	000e0000-55f8-30b1-e0d3-674b24190737	000c0000-55f8-30b1-fd0f-f2c0e94c2cae	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f8-30af-557e-8f5ddb6d421d
000d0000-55f8-30b1-427a-3eb016091c3c	000e0000-55f8-30b1-e0d3-674b24190737	000c0000-55f8-30b1-9ebb-f0771a85d2bb	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f8-30af-d15e-ea3a25803805
000d0000-55f8-30b1-6b2b-4f0ffeb79757	000e0000-55f8-30b1-e0d3-674b24190737	000c0000-55f8-30b1-75d3-84b9b9a3e6b2	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f8-30af-d15e-ea3a25803805
000d0000-55f8-30b1-b923-5559fc377543	000e0000-55f8-30b1-e0d3-674b24190737	000c0000-55f8-30b1-b80c-89ae41080e9e	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f8-30af-f467-d494f0cc87d3
000d0000-55f8-30b1-df5b-8c654f049b3e	000e0000-55f8-30b1-e0d3-674b24190737	000c0000-55f8-30b1-952c-e51d9168d3fd	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f8-30af-9f1f-0278e54ce266
\.


--
-- TOC entry 2956 (class 0 OID 19715722)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 19715700)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f8-30b1-a5b0-5de3e6150ce5	00080000-55f8-30b1-fc32-c04ac881c221	00090000-55f8-30b1-2492-3022cb684021	AK		igralka
\.


--
-- TOC entry 2965 (class 0 OID 19715821)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 19716304)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 19716316)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 19716338)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 19715846)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19715657)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f8-30b0-04b1-985a7d356eca	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f8-30b0-ec56-6f737f25bbf4	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f8-30b0-a86b-71478f66481c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f8-30b0-a0ea-b7538d7a3080	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f8-30b0-66d5-0d9e1a98bd74	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f8-30b0-8c5c-8d64340f0146	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f8-30b0-4ec7-02472994df15	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f8-30b0-634e-876d02057a3f	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f8-30b0-865a-eff144bc0019	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f8-30b0-7b90-fa973805d30d	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f8-30b0-2466-7a68a1d135c2	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f8-30b0-6e7d-9151077403ac	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f8-30b0-30a9-0cc3866c4c09	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f8-30b0-a6b4-987bf2f356e7	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f8-30b1-64e0-65500f999551	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f8-30b1-8f89-a82d669c8571	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f8-30b1-e45c-40658e70b4f1	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f8-30b1-5245-f2ac0f1960ce	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f8-30b1-99a2-63cd6f173adf	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f8-30b2-db0c-1b0d2b7855ec	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2945 (class 0 OID 19715571)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f8-30b1-7dfb-ea80e4a2fc1d	00000000-55f8-30b1-64e0-65500f999551	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f8-30b1-6801-a4465a60406e	00000000-55f8-30b1-64e0-65500f999551	00010000-55f8-30b0-1225-1b5280a7f0e6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f8-30b1-ed04-9253efc2d4b3	00000000-55f8-30b1-8f89-a82d669c8571	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2946 (class 0 OID 19715582)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f8-30b1-5865-56efafbad062	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f8-30b1-128a-908c7acb43c8	00010000-55f8-30b1-a8fa-7a5282a47bf5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f8-30b1-e339-6bebc99a1711	00010000-55f8-30b1-0b35-e64ef8e970bf	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f8-30b1-9969-e300a1d1003a	00010000-55f8-30b1-571d-b67b475b3e17	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f8-30b1-33e5-4765a3892491	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f8-30b1-d3ac-664fb464ad92	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f8-30b1-0848-d6efeaa909fb	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f8-30b1-2d47-47adb108183a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f8-30b1-2492-3022cb684021	00010000-55f8-30b1-7780-a7b66cac19e1	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f8-30b1-3bb4-9eae5de93f3e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f8-30b1-a708-5d8b6f82fb5c	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f8-30b1-28f1-f843d577420e	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f8-30b1-9f96-07b5eb581416	00010000-55f8-30b1-2329-61bfac445785	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 19715535)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f8-30b0-0ae9-076e8740211f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f8-30b0-bbec-1bc4929665e2	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f8-30b0-2da1-3d8ca1af0377	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f8-30b0-b5db-bd8ae2cd3bc5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f8-30b0-59cc-c44c2d63a7fa	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f8-30b0-14c9-9f3970be4b6d	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f8-30b0-0907-50122620d841	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f8-30b0-3386-3f53e0a3599a	Abonma-read	Abonma - branje	f
00030000-55f8-30b0-8b80-6bd1f3215277	Abonma-write	Abonma - spreminjanje	f
00030000-55f8-30b0-2137-dcad4ccbf936	Alternacija-read	Alternacija - branje	f
00030000-55f8-30b0-dc63-c95f2db6da0b	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f8-30b0-8b7c-978c973f094a	Arhivalija-read	Arhivalija - branje	f
00030000-55f8-30b0-41ce-c9fef58261c0	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f8-30b0-76eb-3358b78c38b2	Besedilo-read	Besedilo - branje	f
00030000-55f8-30b0-d97e-fd067b1ea7ab	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f8-30b0-072f-58da05a5a677	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f8-30b0-3329-00871c458c37	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f8-30b0-8dc8-87163182838f	Dogodek-read	Dogodek - branje	f
00030000-55f8-30b0-bd4d-a8fde89dd6b9	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f8-30b0-2c1b-f190cc738fd2	DrugiVir-read	DrugiVir - branje	f
00030000-55f8-30b0-61ff-79ac31eee360	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f8-30b0-519a-1fc55edda919	Drzava-read	Drzava - branje	f
00030000-55f8-30b0-4c4a-2d27fcd37aeb	Drzava-write	Drzava - spreminjanje	f
00030000-55f8-30b0-f839-2918e237e282	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f8-30b0-12ac-91f78752c2e2	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f8-30b0-3a37-a88375569ff3	Funkcija-read	Funkcija - branje	f
00030000-55f8-30b0-4472-553a46e8aa5e	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f8-30b0-ff64-15fc53e723c4	Gostovanje-read	Gostovanje - branje	f
00030000-55f8-30b0-76c8-e96885ca8417	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f8-30b0-72b3-00ec0007146e	Gostujoca-read	Gostujoca - branje	f
00030000-55f8-30b0-0ec8-de799b5ed83d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f8-30b0-68e3-d5285cf56408	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f8-30b0-ffce-0059f6d64b3b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f8-30b0-448f-8e3b8661d856	Kupec-read	Kupec - branje	f
00030000-55f8-30b0-9470-51f5a32501c1	Kupec-write	Kupec - spreminjanje	f
00030000-55f8-30b0-9675-21d93a896155	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f8-30b0-3316-283982e435aa	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f8-30b0-f906-6248255ae290	Option-read	Option - branje	f
00030000-55f8-30b0-fa7c-2186f4ddf773	Option-write	Option - spreminjanje	f
00030000-55f8-30b0-a54e-c69f4cb82493	OptionValue-read	OptionValue - branje	f
00030000-55f8-30b0-5253-be879a8ba630	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f8-30b0-4dcf-a50f49ce4e37	Oseba-read	Oseba - branje	f
00030000-55f8-30b0-87ed-4fbd26eb88f2	Oseba-write	Oseba - spreminjanje	f
00030000-55f8-30b0-3914-f0da01964537	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f8-30b0-f9aa-f1c0b560ac4d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f8-30b0-eff9-66e6561c8721	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f8-30b0-877e-0bb9df9b63c0	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f8-30b0-e777-67ef2e664909	Pogodba-read	Pogodba - branje	f
00030000-55f8-30b0-75b0-a4b078790ece	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f8-30b0-6ea7-3d8d6f2f91d7	Popa-read	Popa - branje	f
00030000-55f8-30b0-4ad2-804f0e32a164	Popa-write	Popa - spreminjanje	f
00030000-55f8-30b0-dbb9-4cc214179834	Posta-read	Posta - branje	f
00030000-55f8-30b0-8ec2-307d70002d60	Posta-write	Posta - spreminjanje	f
00030000-55f8-30b0-f91a-bcbe45b4c895	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f8-30b0-b87d-14b176a7d3ac	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f8-30b0-59f3-8941f0a8212d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f8-30b0-a492-c173f0099a24	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f8-30b0-7966-ed96e1b562ff	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f8-30b0-4ff0-7193a1c1f73c	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f8-30b0-3a94-66bb38ab4982	Predstava-read	Predstava - branje	f
00030000-55f8-30b0-efd9-de4ff5bf404f	Predstava-write	Predstava - spreminjanje	f
00030000-55f8-30b0-84eb-58c8236b8fb7	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f8-30b0-84a5-a622d2aef052	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f8-30b0-6c6d-1ca35ecf5a4a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f8-30b0-50c4-70868af5565a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f8-30b0-8994-56d28582d696	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f8-30b0-1678-517ab7fda2d9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f8-30b0-5ee7-c8cb674f61b8	ProgramDela-read	ProgramDela - branje	f
00030000-55f8-30b0-69fa-7e4b1cd437db	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f8-30b0-fdfb-0005d440db8d	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f8-30b0-0ef2-b892e0276710	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f8-30b0-546b-cacfcf9bc461	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f8-30b0-e684-b042895287bb	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f8-30b0-286c-589635185e97	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f8-30b0-7011-980e49726f5d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f8-30b0-8473-49946e27feea	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f8-30b0-77d0-7e1776f19de5	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f8-30b0-023f-c678d392c092	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f8-30b0-6915-3edc181ec5d6	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f8-30b0-9ef2-3aa11fde9591	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f8-30b0-a015-c1016b8b902e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f8-30b0-5c47-f49df3a628dd	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f8-30b0-718b-fcee7185970f	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f8-30b0-d61d-b2444685ca7d	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f8-30b0-a3ef-268a4bfe9233	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f8-30b0-2f8e-f05808c0d5b6	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f8-30b0-f25c-ce2b904264c8	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f8-30b0-da68-f3d92bdd5c75	Prostor-read	Prostor - branje	f
00030000-55f8-30b0-23f9-9f0c8ac08308	Prostor-write	Prostor - spreminjanje	f
00030000-55f8-30b0-3275-68e85513e664	Racun-read	Racun - branje	f
00030000-55f8-30b0-731a-24c1ead16038	Racun-write	Racun - spreminjanje	f
00030000-55f8-30b0-8b14-96647337f1c2	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f8-30b0-2a73-ca46dc28e211	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f8-30b0-da8f-7729359a6b05	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f8-30b0-d7e6-f4a24bf4a076	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f8-30b0-5a10-14614f454270	Rekvizit-read	Rekvizit - branje	f
00030000-55f8-30b0-3f27-a3c4ff6a722d	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f8-30b0-0119-8c87c1f6ea32	Revizija-read	Revizija - branje	f
00030000-55f8-30b0-e366-a1ecb409f77f	Revizija-write	Revizija - spreminjanje	f
00030000-55f8-30b0-6f1e-9ff290fc75e6	Rezervacija-read	Rezervacija - branje	f
00030000-55f8-30b0-105d-4dc9297a7422	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f8-30b0-9021-a9f552c9b4cc	SedezniRed-read	SedezniRed - branje	f
00030000-55f8-30b0-2e88-be1d6aa96a27	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f8-30b0-d586-4a3c849d4240	Sedez-read	Sedez - branje	f
00030000-55f8-30b0-393a-1b7da4e81acd	Sedez-write	Sedez - spreminjanje	f
00030000-55f8-30b0-ff69-fd00f6252400	Sezona-read	Sezona - branje	f
00030000-55f8-30b0-e2ef-5511f45ecca2	Sezona-write	Sezona - spreminjanje	f
00030000-55f8-30b0-682a-2ce219252ff5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f8-30b0-cd91-a4085be99fd1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f8-30b0-695b-061e0ee9d818	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f8-30b0-8b37-a90d6e784ce1	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f8-30b0-d3de-9153da7c7b06	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f8-30b0-ac9e-f8adfd65c48d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f8-30b0-471f-56ef736fee52	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f8-30b0-fe30-a7f339d81ca9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f8-30b0-6645-fc86e955675f	Telefonska-read	Telefonska - branje	f
00030000-55f8-30b0-a341-9a814ca17a70	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f8-30b0-145a-bba641175ca4	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f8-30b0-8bf8-753e564b73d4	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f8-30b0-3fde-56eddb33b6f4	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f8-30b0-9890-ab96bc6c78ec	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f8-30b0-9e8e-8c65e4e3af0b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f8-30b0-eb04-ddf9c4c8a76f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f8-30b0-cca2-e9b4ac7679ef	Trr-read	Trr - branje	f
00030000-55f8-30b0-51d2-dd867134d45d	Trr-write	Trr - spreminjanje	f
00030000-55f8-30b0-8fcf-3dc2863175a4	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f8-30b0-0903-6d836fbc5739	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f8-30b0-effa-f39c164b3cf4	Vaja-read	Vaja - branje	f
00030000-55f8-30b0-600a-6e5637f77f86	Vaja-write	Vaja - spreminjanje	f
00030000-55f8-30b0-0b4f-b60297f3a88f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f8-30b0-f75c-a8490e914ddb	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f8-30b0-ca1d-39fb069f398e	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f8-30b0-04d7-78db53ca54fd	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f8-30b0-1fe4-fadbe1726a22	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f8-30b0-a99f-e01e864e2085	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f8-30b0-d5cc-7e4bc8f8725c	Zasedenost-read	Zasedenost - branje	f
00030000-55f8-30b0-b3aa-87c3f69cbf22	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f8-30b0-357a-c581e742a638	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f8-30b0-0db8-c5de8c9e93e0	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f8-30b0-f66f-c222198a0212	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f8-30b0-c194-8fc114a8d9be	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f8-30b0-4c95-df0cb02fd9e1	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f8-30b0-2b38-aaf82169935f	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f8-30b0-c362-afe9b0783e4b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f8-30b0-74a8-854fecf3fc80	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f8-30b0-48b3-7f3073bff551	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f8-30b0-2c80-adef32c1e5b2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f8-30b0-fcb0-890a2fe72570	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f8-30b0-5e2f-8c5aac3582a8	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f8-30b0-5cb4-5a02451f4ecd	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f8-30b0-35b9-d7c568bb9b28	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f8-30b0-79a9-59912d7e6e36	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f8-30b0-c899-09869ad89e61	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2943 (class 0 OID 19715555)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f8-30b0-fc0a-3815f9877798	00030000-55f8-30b0-bbec-1bc4929665e2
00020000-55f8-30b0-e183-a13cbbbe6b83	00030000-55f8-30b0-519a-1fc55edda919
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-3386-3f53e0a3599a
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-8b80-6bd1f3215277
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-2137-dcad4ccbf936
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-dc63-c95f2db6da0b
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-8b7c-978c973f094a
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-8dc8-87163182838f
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-b5db-bd8ae2cd3bc5
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-bd4d-a8fde89dd6b9
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-519a-1fc55edda919
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-4c4a-2d27fcd37aeb
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-3a37-a88375569ff3
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-4472-553a46e8aa5e
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-ff64-15fc53e723c4
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-76c8-e96885ca8417
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-72b3-00ec0007146e
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-0ec8-de799b5ed83d
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-68e3-d5285cf56408
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-ffce-0059f6d64b3b
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-f906-6248255ae290
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-a54e-c69f4cb82493
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-4dcf-a50f49ce4e37
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-87ed-4fbd26eb88f2
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-6ea7-3d8d6f2f91d7
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-4ad2-804f0e32a164
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-dbb9-4cc214179834
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-8ec2-307d70002d60
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-7966-ed96e1b562ff
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-4ff0-7193a1c1f73c
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-3a94-66bb38ab4982
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-efd9-de4ff5bf404f
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-8994-56d28582d696
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-1678-517ab7fda2d9
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-da68-f3d92bdd5c75
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-23f9-9f0c8ac08308
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-da8f-7729359a6b05
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-d7e6-f4a24bf4a076
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-5a10-14614f454270
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-3f27-a3c4ff6a722d
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-ff69-fd00f6252400
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-e2ef-5511f45ecca2
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-3fde-56eddb33b6f4
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-8fcf-3dc2863175a4
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-0903-6d836fbc5739
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-effa-f39c164b3cf4
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-600a-6e5637f77f86
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-d5cc-7e4bc8f8725c
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-b3aa-87c3f69cbf22
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-357a-c581e742a638
00020000-55f8-30b0-ef13-43751515ecd4	00030000-55f8-30b0-f66f-c222198a0212
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-3386-3f53e0a3599a
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-8b7c-978c973f094a
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-8dc8-87163182838f
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-519a-1fc55edda919
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-ff64-15fc53e723c4
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-72b3-00ec0007146e
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-68e3-d5285cf56408
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-ffce-0059f6d64b3b
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-f906-6248255ae290
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-a54e-c69f4cb82493
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-4dcf-a50f49ce4e37
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-87ed-4fbd26eb88f2
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-6ea7-3d8d6f2f91d7
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-dbb9-4cc214179834
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-7966-ed96e1b562ff
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-4ff0-7193a1c1f73c
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-3a94-66bb38ab4982
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-da68-f3d92bdd5c75
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-da8f-7729359a6b05
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-5a10-14614f454270
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-ff69-fd00f6252400
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-6645-fc86e955675f
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-a341-9a814ca17a70
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-cca2-e9b4ac7679ef
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-51d2-dd867134d45d
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-1fe4-fadbe1726a22
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-a99f-e01e864e2085
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-357a-c581e742a638
00020000-55f8-30b0-2e7a-06ddab329764	00030000-55f8-30b0-f66f-c222198a0212
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-3386-3f53e0a3599a
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-2137-dcad4ccbf936
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-8b7c-978c973f094a
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-41ce-c9fef58261c0
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-76eb-3358b78c38b2
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-072f-58da05a5a677
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-8dc8-87163182838f
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-519a-1fc55edda919
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-3a37-a88375569ff3
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-ff64-15fc53e723c4
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-72b3-00ec0007146e
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-68e3-d5285cf56408
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-f906-6248255ae290
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-a54e-c69f4cb82493
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-4dcf-a50f49ce4e37
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-6ea7-3d8d6f2f91d7
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-dbb9-4cc214179834
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-3a94-66bb38ab4982
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-8994-56d28582d696
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-da68-f3d92bdd5c75
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-da8f-7729359a6b05
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-5a10-14614f454270
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-ff69-fd00f6252400
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-3fde-56eddb33b6f4
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-effa-f39c164b3cf4
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-d5cc-7e4bc8f8725c
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-357a-c581e742a638
00020000-55f8-30b0-7b6d-778a21bff0ee	00030000-55f8-30b0-f66f-c222198a0212
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-3386-3f53e0a3599a
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-8b80-6bd1f3215277
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-dc63-c95f2db6da0b
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-8b7c-978c973f094a
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-8dc8-87163182838f
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-519a-1fc55edda919
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-ff64-15fc53e723c4
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-72b3-00ec0007146e
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-f906-6248255ae290
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-a54e-c69f4cb82493
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-6ea7-3d8d6f2f91d7
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-dbb9-4cc214179834
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-3a94-66bb38ab4982
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-da68-f3d92bdd5c75
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-da8f-7729359a6b05
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-5a10-14614f454270
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-ff69-fd00f6252400
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-3fde-56eddb33b6f4
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-357a-c581e742a638
00020000-55f8-30b0-7e1f-72f9393f9be2	00030000-55f8-30b0-f66f-c222198a0212
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-3386-3f53e0a3599a
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-8b7c-978c973f094a
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-8dc8-87163182838f
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-519a-1fc55edda919
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-ff64-15fc53e723c4
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-72b3-00ec0007146e
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-f906-6248255ae290
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-a54e-c69f4cb82493
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-6ea7-3d8d6f2f91d7
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-dbb9-4cc214179834
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-3a94-66bb38ab4982
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-da68-f3d92bdd5c75
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-da8f-7729359a6b05
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-5a10-14614f454270
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-ff69-fd00f6252400
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-145a-bba641175ca4
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-2da1-3d8ca1af0377
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-3fde-56eddb33b6f4
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-357a-c581e742a638
00020000-55f8-30b0-af5b-86520b394535	00030000-55f8-30b0-f66f-c222198a0212
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-0ae9-076e8740211f
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-bbec-1bc4929665e2
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-2da1-3d8ca1af0377
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-b5db-bd8ae2cd3bc5
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-59cc-c44c2d63a7fa
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-14c9-9f3970be4b6d
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-0907-50122620d841
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-3386-3f53e0a3599a
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-8b80-6bd1f3215277
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-2137-dcad4ccbf936
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-dc63-c95f2db6da0b
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-8b7c-978c973f094a
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-41ce-c9fef58261c0
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-76eb-3358b78c38b2
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-d97e-fd067b1ea7ab
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-072f-58da05a5a677
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-3329-00871c458c37
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-8dc8-87163182838f
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-bd4d-a8fde89dd6b9
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-519a-1fc55edda919
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-4c4a-2d27fcd37aeb
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-2c1b-f190cc738fd2
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-61ff-79ac31eee360
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-f839-2918e237e282
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-12ac-91f78752c2e2
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-3a37-a88375569ff3
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-4472-553a46e8aa5e
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-ff64-15fc53e723c4
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-76c8-e96885ca8417
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-72b3-00ec0007146e
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-0ec8-de799b5ed83d
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-68e3-d5285cf56408
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-ffce-0059f6d64b3b
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-448f-8e3b8661d856
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-9470-51f5a32501c1
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-9675-21d93a896155
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-3316-283982e435aa
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-f906-6248255ae290
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-fa7c-2186f4ddf773
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-a54e-c69f4cb82493
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-5253-be879a8ba630
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-4dcf-a50f49ce4e37
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-87ed-4fbd26eb88f2
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-3914-f0da01964537
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-f9aa-f1c0b560ac4d
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-eff9-66e6561c8721
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-877e-0bb9df9b63c0
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-e777-67ef2e664909
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-75b0-a4b078790ece
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-6ea7-3d8d6f2f91d7
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-4ad2-804f0e32a164
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-dbb9-4cc214179834
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-8ec2-307d70002d60
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-f91a-bcbe45b4c895
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-b87d-14b176a7d3ac
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-59f3-8941f0a8212d
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-a492-c173f0099a24
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-7966-ed96e1b562ff
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-4ff0-7193a1c1f73c
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-3a94-66bb38ab4982
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-efd9-de4ff5bf404f
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-84eb-58c8236b8fb7
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-84a5-a622d2aef052
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-6c6d-1ca35ecf5a4a
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-50c4-70868af5565a
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-8994-56d28582d696
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-1678-517ab7fda2d9
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-5ee7-c8cb674f61b8
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-69fa-7e4b1cd437db
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-fdfb-0005d440db8d
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-0ef2-b892e0276710
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-546b-cacfcf9bc461
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-e684-b042895287bb
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-286c-589635185e97
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-7011-980e49726f5d
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-8473-49946e27feea
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-77d0-7e1776f19de5
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-023f-c678d392c092
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-6915-3edc181ec5d6
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-9ef2-3aa11fde9591
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-a015-c1016b8b902e
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-5c47-f49df3a628dd
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-718b-fcee7185970f
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-d61d-b2444685ca7d
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-a3ef-268a4bfe9233
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-2f8e-f05808c0d5b6
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-f25c-ce2b904264c8
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-da68-f3d92bdd5c75
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-23f9-9f0c8ac08308
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-3275-68e85513e664
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-731a-24c1ead16038
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-8b14-96647337f1c2
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-2a73-ca46dc28e211
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-da8f-7729359a6b05
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-d7e6-f4a24bf4a076
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-5a10-14614f454270
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-3f27-a3c4ff6a722d
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-0119-8c87c1f6ea32
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-e366-a1ecb409f77f
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-6f1e-9ff290fc75e6
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-105d-4dc9297a7422
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-9021-a9f552c9b4cc
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-2e88-be1d6aa96a27
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-d586-4a3c849d4240
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-393a-1b7da4e81acd
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-ff69-fd00f6252400
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-e2ef-5511f45ecca2
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-682a-2ce219252ff5
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-cd91-a4085be99fd1
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-695b-061e0ee9d818
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-8b37-a90d6e784ce1
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-d3de-9153da7c7b06
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-ac9e-f8adfd65c48d
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-471f-56ef736fee52
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-fe30-a7f339d81ca9
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-6645-fc86e955675f
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-a341-9a814ca17a70
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-145a-bba641175ca4
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-8bf8-753e564b73d4
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-3fde-56eddb33b6f4
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-9890-ab96bc6c78ec
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-9e8e-8c65e4e3af0b
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-eb04-ddf9c4c8a76f
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-cca2-e9b4ac7679ef
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-51d2-dd867134d45d
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-8fcf-3dc2863175a4
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-0903-6d836fbc5739
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-effa-f39c164b3cf4
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-600a-6e5637f77f86
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-0b4f-b60297f3a88f
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-f75c-a8490e914ddb
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-ca1d-39fb069f398e
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-04d7-78db53ca54fd
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-1fe4-fadbe1726a22
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-a99f-e01e864e2085
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-d5cc-7e4bc8f8725c
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-b3aa-87c3f69cbf22
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-357a-c581e742a638
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-0db8-c5de8c9e93e0
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-f66f-c222198a0212
00020000-55f8-30b1-6ea3-62d930ee02cc	00030000-55f8-30b0-c194-8fc114a8d9be
\.


--
-- TOC entry 2970 (class 0 OID 19715853)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 19715887)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 19716016)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f8-30b1-3cc7-1365eec42aec	00090000-55f8-30b1-5865-56efafbad062	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f8-30b1-a4bc-6a8e9db75649	00090000-55f8-30b1-d3ac-664fb464ad92	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f8-30b1-c90b-e198fa80f29e	00090000-55f8-30b1-9f96-07b5eb581416	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f8-30b1-b7a0-89dba4f9ee96	00090000-55f8-30b1-3bb4-9eae5de93f3e	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2948 (class 0 OID 19715615)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f8-30b1-fc32-c04ac881c221	00040000-55f8-30b0-4fd4-a22fcf55a3ea	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-30b1-f421-e4cb31170753	00040000-55f8-30b0-4fd4-a22fcf55a3ea	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f8-30b1-deb0-8c6161b09d4f	00040000-55f8-30b0-4fd4-a22fcf55a3ea	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-30b1-40bb-b04c49fbab00	00040000-55f8-30b0-4fd4-a22fcf55a3ea	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-30b1-f012-eaf1b8f1fc33	00040000-55f8-30b0-4fd4-a22fcf55a3ea	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-30b1-27bb-35dcb3453961	00040000-55f8-30af-faaa-482a8c69f4be	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-30b1-72fa-af98dd6afc51	00040000-55f8-30af-6510-a49589792419	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-30b1-1c6a-df165f4822b8	00040000-55f8-30af-67d6-0daeaafa10ac	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-30b1-3324-a1af6872e5a0	00040000-55f8-30af-d6a9-ad3ea481caf7	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f8-30b2-8f62-935a34d68482	00040000-55f8-30b0-4fd4-a22fcf55a3ea	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2950 (class 0 OID 19715649)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f8-30af-5f3a-85e0793e4c84	8341	Adlešiči
00050000-55f8-30af-fcb5-4776f77cf1f7	5270	Ajdovščina
00050000-55f8-30af-5409-d95c39aa8fd4	6280	Ankaran/Ancarano
00050000-55f8-30af-e141-8e547362500f	9253	Apače
00050000-55f8-30af-edc7-35d16fd815f2	8253	Artiče
00050000-55f8-30af-3928-4ee95ff80ed1	4275	Begunje na Gorenjskem
00050000-55f8-30af-41d3-478995e65c87	1382	Begunje pri Cerknici
00050000-55f8-30af-c359-143ac1d5e862	9231	Beltinci
00050000-55f8-30af-eba5-65decacb6fcd	2234	Benedikt
00050000-55f8-30af-081b-08983cb5fa37	2345	Bistrica ob Dravi
00050000-55f8-30af-b06f-33864ba6f5c0	3256	Bistrica ob Sotli
00050000-55f8-30af-e18d-ce94733be486	8259	Bizeljsko
00050000-55f8-30af-138e-776aef49318e	1223	Blagovica
00050000-55f8-30af-51ac-3cb3cb171d8f	8283	Blanca
00050000-55f8-30af-4651-0c5a55f7810d	4260	Bled
00050000-55f8-30af-1ec2-77edb0a5fe31	4273	Blejska Dobrava
00050000-55f8-30af-c188-527160a534b9	9265	Bodonci
00050000-55f8-30af-c2ab-0753e72ffd1e	9222	Bogojina
00050000-55f8-30af-1510-16e013e693b3	4263	Bohinjska Bela
00050000-55f8-30af-cbba-9c6a8f7eec9b	4264	Bohinjska Bistrica
00050000-55f8-30af-1015-2db927eb8a43	4265	Bohinjsko jezero
00050000-55f8-30af-4323-6b58110c8a66	1353	Borovnica
00050000-55f8-30af-ce8a-0c7c4965d6ff	8294	Boštanj
00050000-55f8-30af-d789-352ea84fa549	5230	Bovec
00050000-55f8-30af-c89e-d1838db2ae11	5295	Branik
00050000-55f8-30af-417e-f800177c2540	3314	Braslovče
00050000-55f8-30af-49a0-79364b3e5a40	5223	Breginj
00050000-55f8-30af-6dbe-d61b9666927e	8280	Brestanica
00050000-55f8-30af-ae57-11cfc7d74872	2354	Bresternica
00050000-55f8-30af-d30a-a5e25f5d3031	4243	Brezje
00050000-55f8-30af-adb6-241e46402933	1351	Brezovica pri Ljubljani
00050000-55f8-30af-324c-d2431c17b171	8250	Brežice
00050000-55f8-30af-3ebc-f99a12563186	4210	Brnik - Aerodrom
00050000-55f8-30af-fa97-322c8b3f2238	8321	Brusnice
00050000-55f8-30af-ccdd-8e6d2eb9e799	3255	Buče
00050000-55f8-30af-e2a7-5643edbe1b94	8276	Bučka 
00050000-55f8-30af-fca2-b332b7719dd3	9261	Cankova
00050000-55f8-30af-ac89-3dd4f4fa5c79	3000	Celje 
00050000-55f8-30af-ff79-27b65e802946	3001	Celje - poštni predali
00050000-55f8-30af-7a45-bae2f62e8937	4207	Cerklje na Gorenjskem
00050000-55f8-30af-3045-39fa23bd9a08	8263	Cerklje ob Krki
00050000-55f8-30af-e794-c96147733053	1380	Cerknica
00050000-55f8-30af-26ce-fe39bd8a19d0	5282	Cerkno
00050000-55f8-30af-0226-42bf70daf7bc	2236	Cerkvenjak
00050000-55f8-30af-dfde-270ee28b2456	2215	Ceršak
00050000-55f8-30af-a6f8-7b186fcbd21c	2326	Cirkovce
00050000-55f8-30af-565b-cbe75bc0ba97	2282	Cirkulane
00050000-55f8-30af-96c5-b1aa30779ee2	5273	Col
00050000-55f8-30af-178b-3419b05f1994	8251	Čatež ob Savi
00050000-55f8-30af-54f5-5b04c7673f81	1413	Čemšenik
00050000-55f8-30af-743e-be86f52d83ef	5253	Čepovan
00050000-55f8-30af-273a-e7cec78527e0	9232	Črenšovci
00050000-55f8-30af-154a-ddd42ae89654	2393	Črna na Koroškem
00050000-55f8-30af-307b-ffbdd92a94fe	6275	Črni Kal
00050000-55f8-30af-2bad-8915812781b1	5274	Črni Vrh nad Idrijo
00050000-55f8-30af-a5b3-9b69083a6d87	5262	Črniče
00050000-55f8-30af-49a7-bc3f40e564fd	8340	Črnomelj
00050000-55f8-30af-2400-37034cbb8d2d	6271	Dekani
00050000-55f8-30af-16aa-1f569c32d44f	5210	Deskle
00050000-55f8-30af-3129-cf2173fa8546	2253	Destrnik
00050000-55f8-30af-5e3d-371cb67ed7aa	6215	Divača
00050000-55f8-30af-f0e7-216ba7551525	1233	Dob
00050000-55f8-30af-b899-f89628ab4a88	3224	Dobje pri Planini
00050000-55f8-30af-029d-63d6ea6f6fa8	8257	Dobova
00050000-55f8-30af-621f-000878bada53	1423	Dobovec
00050000-55f8-30af-218e-9f9e57636481	5263	Dobravlje
00050000-55f8-30af-70bf-85a9f0dffaf7	3204	Dobrna
00050000-55f8-30af-00de-bf7b4cd99734	8211	Dobrnič
00050000-55f8-30af-6edf-e008f21ed128	1356	Dobrova
00050000-55f8-30af-fb61-f9769cb55a91	9223	Dobrovnik/Dobronak 
00050000-55f8-30af-ba0f-65da16bb8602	5212	Dobrovo v Brdih
00050000-55f8-30af-67a4-177e4c38314d	1431	Dol pri Hrastniku
00050000-55f8-30af-6977-fcc0e0a08121	1262	Dol pri Ljubljani
00050000-55f8-30af-6599-4e6474c47b87	1273	Dole pri Litiji
00050000-55f8-30af-1f39-e1219ac7f9d7	1331	Dolenja vas
00050000-55f8-30af-818a-2ab4e290f62d	8350	Dolenjske Toplice
00050000-55f8-30af-6df3-f2a4bde105ce	1230	Domžale
00050000-55f8-30af-c79b-73de24af4767	2252	Dornava
00050000-55f8-30af-f2d6-5706ff698108	5294	Dornberk
00050000-55f8-30af-794a-b04fedf96af2	1319	Draga
00050000-55f8-30af-06d1-5df7ce1aadbc	8343	Dragatuš
00050000-55f8-30af-369a-fbfef1985152	3222	Dramlje
00050000-55f8-30af-e233-e1c5801fda61	2370	Dravograd
00050000-55f8-30af-62e0-b475b5abed20	4203	Duplje
00050000-55f8-30af-931d-0adb28291e91	6221	Dutovlje
00050000-55f8-30af-de31-5005330a9192	8361	Dvor
00050000-55f8-30af-0e95-49222f7165a0	2343	Fala
00050000-55f8-30af-40cc-f3f7ae167a2f	9208	Fokovci
00050000-55f8-30af-8ba1-d65240d67efc	2313	Fram
00050000-55f8-30af-3848-36a5df0bfcb3	3213	Frankolovo
00050000-55f8-30af-e41d-36a2476b87ac	1274	Gabrovka
00050000-55f8-30af-1300-16df7ef4f801	8254	Globoko
00050000-55f8-30af-7156-a43e2db6ef65	5275	Godovič
00050000-55f8-30af-5a47-c99c02772c55	4204	Golnik
00050000-55f8-30af-8323-ff3c96b18095	3303	Gomilsko
00050000-55f8-30af-5e2f-50c500c98bd0	4224	Gorenja vas
00050000-55f8-30af-a0d6-4532139dfb82	3263	Gorica pri Slivnici
00050000-55f8-30af-8895-05fd8ecfc06b	2272	Gorišnica
00050000-55f8-30af-5604-c1758716286d	9250	Gornja Radgona
00050000-55f8-30af-01f6-1765eb3ba39c	3342	Gornji Grad
00050000-55f8-30af-64ec-24ddfb335a1b	4282	Gozd Martuljek
00050000-55f8-30af-dbea-db122300d409	6272	Gračišče
00050000-55f8-30af-d121-3bf6d74c228b	9264	Grad
00050000-55f8-30af-c15f-d2a192b25210	8332	Gradac
00050000-55f8-30af-be88-e0b6beb9837e	1384	Grahovo
00050000-55f8-30af-defa-83747f9adc79	5242	Grahovo ob Bači
00050000-55f8-30af-2122-1d04663f0ae1	5251	Grgar
00050000-55f8-30af-bc5d-d957b66ba489	3302	Griže
00050000-55f8-30af-fde0-a0a6573ce1ec	3231	Grobelno
00050000-55f8-30af-a896-1627c95f36e5	1290	Grosuplje
00050000-55f8-30af-81ae-31e669cb2b6d	2288	Hajdina
00050000-55f8-30af-6f77-4b6b5927dd1b	8362	Hinje
00050000-55f8-30af-c066-e056cbbc0ffc	2311	Hoče
00050000-55f8-30af-95cc-ec81be841629	9205	Hodoš/Hodos
00050000-55f8-30af-df04-20bd70a3ccf6	1354	Horjul
00050000-55f8-30af-67e5-cffded2ce66d	1372	Hotedršica
00050000-55f8-30af-b3a5-f38689c6d86f	1430	Hrastnik
00050000-55f8-30af-bdd0-4b8681fffe6b	6225	Hruševje
00050000-55f8-30af-0101-7831c84565da	4276	Hrušica
00050000-55f8-30af-0531-9df433b5235f	5280	Idrija
00050000-55f8-30af-2e9d-8a6ea63ee9ec	1292	Ig
00050000-55f8-30af-95b0-750ade096d08	6250	Ilirska Bistrica
00050000-55f8-30af-e06a-723d31771bb5	6251	Ilirska Bistrica-Trnovo
00050000-55f8-30af-4586-c0f2893e9897	1295	Ivančna Gorica
00050000-55f8-30af-f991-9d00856d009c	2259	Ivanjkovci
00050000-55f8-30af-bdcf-425737cd0615	1411	Izlake
00050000-55f8-30af-5af8-3b16726c8dcd	6310	Izola/Isola
00050000-55f8-30af-8985-92fd65f1a9d4	2222	Jakobski Dol
00050000-55f8-30af-168e-219b32387955	2221	Jarenina
00050000-55f8-30af-e5a5-bfce536b8646	6254	Jelšane
00050000-55f8-30af-778c-3d3e2afb62cc	4270	Jesenice
00050000-55f8-30af-d8bf-e22071aad20b	8261	Jesenice na Dolenjskem
00050000-55f8-30af-7373-49acf8c6d7a3	3273	Jurklošter
00050000-55f8-30af-655e-2adc15026108	2223	Jurovski Dol
00050000-55f8-30af-d3dc-2eabfea88625	2256	Juršinci
00050000-55f8-30af-0334-970f57e5a9c4	5214	Kal nad Kanalom
00050000-55f8-30af-1c77-315913fcfd13	3233	Kalobje
00050000-55f8-30af-3475-41ba8e2ce3de	4246	Kamna Gorica
00050000-55f8-30af-6c91-43480b7e83b4	2351	Kamnica
00050000-55f8-30af-cebe-0953d169f806	1241	Kamnik
00050000-55f8-30af-7896-644b4039ec76	5213	Kanal
00050000-55f8-30af-0236-8577d133287a	8258	Kapele
00050000-55f8-30af-f675-5a5ab3de968b	2362	Kapla
00050000-55f8-30af-8a5a-99d8a7b10349	2325	Kidričevo
00050000-55f8-30af-58f8-c6741e35205b	1412	Kisovec
00050000-55f8-30af-fbe6-6285b483d655	6253	Knežak
00050000-55f8-30af-a91f-6ff079e266ce	5222	Kobarid
00050000-55f8-30af-dbd2-a234e0632bab	9227	Kobilje
00050000-55f8-30af-f29d-c25471aa0a27	1330	Kočevje
00050000-55f8-30af-4634-3ca2a5ade099	1338	Kočevska Reka
00050000-55f8-30af-87ce-64810f48ce81	2276	Kog
00050000-55f8-30af-c412-7c406747263b	5211	Kojsko
00050000-55f8-30af-a975-e6178ac9bc84	6223	Komen
00050000-55f8-30af-9ebd-c14a57510166	1218	Komenda
00050000-55f8-30af-3c16-687a21622877	6000	Koper/Capodistria 
00050000-55f8-30af-9e47-70ec200acea9	6001	Koper/Capodistria - poštni predali
00050000-55f8-30af-9c5d-157b56a6d980	8282	Koprivnica
00050000-55f8-30af-1b6c-c9549697fd7f	5296	Kostanjevica na Krasu
00050000-55f8-30af-83b8-b4c0ea212daa	8311	Kostanjevica na Krki
00050000-55f8-30af-ffb8-b6f6a3265cb5	1336	Kostel
00050000-55f8-30af-a1d2-f60cd41594a2	6256	Košana
00050000-55f8-30af-b43f-408044b81547	2394	Kotlje
00050000-55f8-30af-b509-d2faff1914a6	6240	Kozina
00050000-55f8-30af-25fc-14762be7865d	3260	Kozje
00050000-55f8-30af-81c1-5b183c82bed6	4000	Kranj 
00050000-55f8-30af-5b31-800664766d07	4001	Kranj - poštni predali
00050000-55f8-30af-4244-a8d49afe297e	4280	Kranjska Gora
00050000-55f8-30af-3a19-52363480f029	1281	Kresnice
00050000-55f8-30af-07f3-7c2fa5bb2374	4294	Križe
00050000-55f8-30af-aac6-073ac6758f82	9206	Križevci
00050000-55f8-30af-8daf-09a75033077b	9242	Križevci pri Ljutomeru
00050000-55f8-30af-0e41-6c2ed046cfda	1301	Krka
00050000-55f8-30af-6563-c5f54d946977	8296	Krmelj
00050000-55f8-30af-09ac-c5735af05979	4245	Kropa
00050000-55f8-30af-a87d-865de64384b6	8262	Krška vas
00050000-55f8-30af-271e-d0dc145c4c37	8270	Krško
00050000-55f8-30af-4639-594a72b4da74	9263	Kuzma
00050000-55f8-30af-dcb9-bbb5ece26f2f	2318	Laporje
00050000-55f8-30af-58bc-900bc6d58b71	3270	Laško
00050000-55f8-30af-04b3-0299664ffa34	1219	Laze v Tuhinju
00050000-55f8-30af-7b5b-95a9bec42852	2230	Lenart v Slovenskih goricah
00050000-55f8-30af-f4ea-41aea0d8dfca	9220	Lendava/Lendva
00050000-55f8-30af-b54e-fa6fd3b25697	4248	Lesce
00050000-55f8-30af-fda2-7461c1719943	3261	Lesično
00050000-55f8-30af-9b01-7e61d0d4d8b0	8273	Leskovec pri Krškem
00050000-55f8-30af-28de-6563146e788b	2372	Libeliče
00050000-55f8-30af-5a6c-88a43e30935d	2341	Limbuš
00050000-55f8-30af-e6d9-8724cfb46636	1270	Litija
00050000-55f8-30af-29c5-42388d504917	3202	Ljubečna
00050000-55f8-30af-4fb1-3e1a5f372f28	1000	Ljubljana 
00050000-55f8-30af-09d0-77456b00c733	1001	Ljubljana - poštni predali
00050000-55f8-30af-3d4a-44b544bfc224	1231	Ljubljana - Črnuče
00050000-55f8-30af-77a4-5ecb48562a64	1261	Ljubljana - Dobrunje
00050000-55f8-30af-177c-cb53ae0827eb	1260	Ljubljana - Polje
00050000-55f8-30af-8d81-caac0718186f	1210	Ljubljana - Šentvid
00050000-55f8-30af-a137-e3ce68bb2422	1211	Ljubljana - Šmartno
00050000-55f8-30af-bca7-c4b00e67c6c8	3333	Ljubno ob Savinji
00050000-55f8-30af-9225-72ddc7e7f95c	9240	Ljutomer
00050000-55f8-30af-85ce-f36c4cc76a35	3215	Loče
00050000-55f8-30af-cf55-32c9c4f31f6a	5231	Log pod Mangartom
00050000-55f8-30af-6cba-54d5767048ec	1358	Log pri Brezovici
00050000-55f8-30af-4153-c96877d65b31	1370	Logatec
00050000-55f8-30af-943a-04ace4acf4a1	1371	Logatec
00050000-55f8-30af-45d2-f45b9f050f90	1434	Loka pri Zidanem Mostu
00050000-55f8-30af-15c0-f3d78a627a5e	3223	Loka pri Žusmu
00050000-55f8-30af-658a-e42f38c10c02	6219	Lokev
00050000-55f8-30af-61a2-35b028b20198	1318	Loški Potok
00050000-55f8-30af-f04d-c7023b19d67b	2324	Lovrenc na Dravskem polju
00050000-55f8-30af-5bdd-aa517ea63786	2344	Lovrenc na Pohorju
00050000-55f8-30af-a0f8-79039188d367	3334	Luče
00050000-55f8-30af-52d3-013bc5508557	1225	Lukovica
00050000-55f8-30af-f3af-e7530f37f518	9202	Mačkovci
00050000-55f8-30af-f830-ce2ff2746b94	2322	Majšperk
00050000-55f8-30af-3be3-3be690120c44	2321	Makole
00050000-55f8-30af-58c9-0fca9d524ed1	9243	Mala Nedelja
00050000-55f8-30af-4cff-22c333ba4dd2	2229	Malečnik
00050000-55f8-30af-884d-23cbf7f12b22	6273	Marezige
00050000-55f8-30af-746a-c2e6c2fbbc80	2000	Maribor 
00050000-55f8-30af-aba2-ae04ca0105b9	2001	Maribor - poštni predali
00050000-55f8-30af-8d66-05810b90be76	2206	Marjeta na Dravskem polju
00050000-55f8-30af-92bb-b98b14fbd538	2281	Markovci
00050000-55f8-30af-c430-a2ca6037e409	9221	Martjanci
00050000-55f8-30af-bb3d-d5e3225108b2	6242	Materija
00050000-55f8-30af-c2fd-e91d41ad2f0c	4211	Mavčiče
00050000-55f8-30af-7abe-b8a7991f4a26	1215	Medvode
00050000-55f8-30af-0a95-0f4f88eb3964	1234	Mengeš
00050000-55f8-30af-1fb3-3fe0e2b52798	8330	Metlika
00050000-55f8-30af-bb9a-73b828901b61	2392	Mežica
00050000-55f8-30af-1fa6-05ab100e853a	2204	Miklavž na Dravskem polju
00050000-55f8-30af-14a9-e4ee02af7ae3	2275	Miklavž pri Ormožu
00050000-55f8-30af-cca6-37eb8b2c4a01	5291	Miren
00050000-55f8-30af-edd4-9bb118d1eeab	8233	Mirna
00050000-55f8-30af-0ed0-163c5066138e	8216	Mirna Peč
00050000-55f8-30af-e8d4-36fea52ae50a	2382	Mislinja
00050000-55f8-30af-15ea-3162f6648d33	4281	Mojstrana
00050000-55f8-30af-d6e0-ac21d8c14725	8230	Mokronog
00050000-55f8-30af-27c5-aeba205f90de	1251	Moravče
00050000-55f8-30af-e538-747ac8161941	9226	Moravske Toplice
00050000-55f8-30af-8c06-73c8114bcafc	5216	Most na Soči
00050000-55f8-30af-4042-f2215341feb0	1221	Motnik
00050000-55f8-30af-0c7c-9288930d9978	3330	Mozirje
00050000-55f8-30af-9254-17a17da79602	9000	Murska Sobota 
00050000-55f8-30af-907e-9a25eb4d973d	9001	Murska Sobota - poštni predali
00050000-55f8-30af-3b68-6a995ad497ee	2366	Muta
00050000-55f8-30af-b278-57e804ba9058	4202	Naklo
00050000-55f8-30af-3610-290531b9189f	3331	Nazarje
00050000-55f8-30af-974a-3cd42d29f431	1357	Notranje Gorice
00050000-55f8-30af-a73b-8bfc34c5848a	3203	Nova Cerkev
00050000-55f8-30af-d8bf-ee0471cc06e6	5000	Nova Gorica 
00050000-55f8-30af-84bf-4395fc84a234	5001	Nova Gorica - poštni predali
00050000-55f8-30af-d238-09a3e7e80bb2	1385	Nova vas
00050000-55f8-30af-8475-8be15f275ef9	8000	Novo mesto
00050000-55f8-30af-1730-0cb58235b1ef	8001	Novo mesto - poštni predali
00050000-55f8-30af-18a3-2943daf1d348	6243	Obrov
00050000-55f8-30af-639a-0417a4c77890	9233	Odranci
00050000-55f8-30af-b0d9-dcc2c31399ee	2317	Oplotnica
00050000-55f8-30af-0383-94d4549e8ff5	2312	Orehova vas
00050000-55f8-30af-a57d-fe8ef7677e53	2270	Ormož
00050000-55f8-30af-e2b5-43b031dd53ca	1316	Ortnek
00050000-55f8-30af-f222-baf08d0d8eed	1337	Osilnica
00050000-55f8-30af-25a2-2ffc96186998	8222	Otočec
00050000-55f8-30af-c33b-981915f797c4	2361	Ožbalt
00050000-55f8-30af-5e4c-b343b9eb4635	2231	Pernica
00050000-55f8-30af-e5cc-544e11085d66	2211	Pesnica pri Mariboru
00050000-55f8-30af-116c-1608e825e6b4	9203	Petrovci
00050000-55f8-30af-f2f1-0780d393671e	3301	Petrovče
00050000-55f8-30af-4f1e-0dd56830e706	6330	Piran/Pirano
00050000-55f8-30af-7e37-e5bd0e061516	8255	Pišece
00050000-55f8-30af-ed36-6d3dc785c7b7	6257	Pivka
00050000-55f8-30af-fdd8-4e98c4c0bf69	6232	Planina
00050000-55f8-30af-31ee-affea27bdecf	3225	Planina pri Sevnici
00050000-55f8-30af-208e-8d579d030cd4	6276	Pobegi
00050000-55f8-30af-301b-95aeda9f6280	8312	Podbočje
00050000-55f8-30af-5666-7dd5909d8327	5243	Podbrdo
00050000-55f8-30af-52c2-e6b4fe333136	3254	Podčetrtek
00050000-55f8-30af-3c4b-af7cad1cd4f5	2273	Podgorci
00050000-55f8-30af-62d7-de644c7e1c35	6216	Podgorje
00050000-55f8-30af-1832-3114c27ed16f	2381	Podgorje pri Slovenj Gradcu
00050000-55f8-30af-07de-b635a779da4e	6244	Podgrad
00050000-55f8-30af-6950-4c29f0d0c089	1414	Podkum
00050000-55f8-30af-4957-d849849b2dcb	2286	Podlehnik
00050000-55f8-30af-548f-38991d0a9b65	5272	Podnanos
00050000-55f8-30af-8968-14f951652e75	4244	Podnart
00050000-55f8-30af-3a84-dad1560fdcdd	3241	Podplat
00050000-55f8-30af-f4fc-8779628321df	3257	Podsreda
00050000-55f8-30af-9584-64af66d9adb9	2363	Podvelka
00050000-55f8-30af-3db9-7d9f2e17e531	2208	Pohorje
00050000-55f8-30af-37f9-41ba211ad47e	2257	Polenšak
00050000-55f8-30af-447c-7f91a2a3d7bf	1355	Polhov Gradec
00050000-55f8-30af-3128-0a8b6f3b94f5	4223	Poljane nad Škofjo Loko
00050000-55f8-30af-730c-9c3ee1f236b7	2319	Poljčane
00050000-55f8-30af-83d0-40950309ce5a	1272	Polšnik
00050000-55f8-30af-e897-f17b5968b414	3313	Polzela
00050000-55f8-30af-6153-e73045656516	3232	Ponikva
00050000-55f8-30af-5ab1-644ff24d239d	6320	Portorož/Portorose
00050000-55f8-30af-8773-c537392cffa1	6230	Postojna
00050000-55f8-30af-469a-5bd256420620	2331	Pragersko
00050000-55f8-30af-f41e-ddd29ba6c3cb	3312	Prebold
00050000-55f8-30af-6bcd-86002ea4b464	4205	Preddvor
00050000-55f8-30af-ed84-bd8bdd56d4d7	6255	Prem
00050000-55f8-30af-bf67-1d6fefc4007b	1352	Preserje
00050000-55f8-30af-8f40-1c957c540513	6258	Prestranek
00050000-55f8-30af-035b-d1592696e1ec	2391	Prevalje
00050000-55f8-30af-d1a2-006fa720bd2e	3262	Prevorje
00050000-55f8-30af-8acb-524b51625ee1	1276	Primskovo 
00050000-55f8-30af-8bd9-eefea9c57154	3253	Pristava pri Mestinju
00050000-55f8-30af-084b-9741ab286de2	9207	Prosenjakovci/Partosfalva
00050000-55f8-30af-72a4-26398682b16f	5297	Prvačina
00050000-55f8-30af-c0d5-839938b8425c	2250	Ptuj
00050000-55f8-30af-d4ff-c7aa9335380a	2323	Ptujska Gora
00050000-55f8-30af-3cce-2433d5d36480	9201	Puconci
00050000-55f8-30af-1a9b-955c84ea1813	2327	Rače
00050000-55f8-30af-9185-fd12955d83c7	1433	Radeče
00050000-55f8-30af-db77-500bc9d763ba	9252	Radenci
00050000-55f8-30af-1f19-a9a00368cdeb	2360	Radlje ob Dravi
00050000-55f8-30af-350c-4bf8174c5517	1235	Radomlje
00050000-55f8-30af-bd47-9a9918baca2d	4240	Radovljica
00050000-55f8-30af-1b21-cf9da66e345c	8274	Raka
00050000-55f8-30af-fba5-074dedf59892	1381	Rakek
00050000-55f8-30af-8c45-e7064177a4ec	4283	Rateče - Planica
00050000-55f8-30af-ed7c-e9b534635748	2390	Ravne na Koroškem
00050000-55f8-30af-a88f-e66354b35ae0	9246	Razkrižje
00050000-55f8-30af-ea08-b2391327cbc5	3332	Rečica ob Savinji
00050000-55f8-30af-edac-3d292436e7c2	5292	Renče
00050000-55f8-30af-0fbb-2a9de44ec0c4	1310	Ribnica
00050000-55f8-30af-3af3-7396642e3d8a	2364	Ribnica na Pohorju
00050000-55f8-30af-1be6-42674f8e1c34	3272	Rimske Toplice
00050000-55f8-30af-f95f-3bd1fc64b2ff	1314	Rob
00050000-55f8-30af-0513-3aa6195c7b95	5215	Ročinj
00050000-55f8-30af-a427-12f897734686	3250	Rogaška Slatina
00050000-55f8-30af-3f82-2fe0bc7361a2	9262	Rogašovci
00050000-55f8-30af-ac6e-1308a8830d1e	3252	Rogatec
00050000-55f8-30af-23ad-4d42bfcd6fa9	1373	Rovte
00050000-55f8-30af-4e95-316fefc5ca22	2342	Ruše
00050000-55f8-30af-04bb-ceec30354b2b	1282	Sava
00050000-55f8-30af-1628-705ac89977e2	6333	Sečovlje/Sicciole
00050000-55f8-30af-e471-957f8dc1ab05	4227	Selca
00050000-55f8-30af-81ad-a36f69990424	2352	Selnica ob Dravi
00050000-55f8-30af-faf5-b7dc0713384e	8333	Semič
00050000-55f8-30af-d8a7-95f2c987c9a7	8281	Senovo
00050000-55f8-30af-8158-1d8b6b75d180	6224	Senožeče
00050000-55f8-30af-8602-1120f54a0f88	8290	Sevnica
00050000-55f8-30af-e06b-166d3f4e49b0	6210	Sežana
00050000-55f8-30af-52ec-c02bf0e2f5f6	2214	Sladki Vrh
00050000-55f8-30af-4112-3626e4d6d571	5283	Slap ob Idrijci
00050000-55f8-30af-b0ab-ee3c35efe337	2380	Slovenj Gradec
00050000-55f8-30af-9d8b-437d07b219ad	2310	Slovenska Bistrica
00050000-55f8-30af-f016-0b7a7ce713d2	3210	Slovenske Konjice
00050000-55f8-30af-6694-f8596018bab3	1216	Smlednik
00050000-55f8-30af-6f13-c1efd41a4115	5232	Soča
00050000-55f8-30af-59ce-7b3760035fb8	1317	Sodražica
00050000-55f8-30af-2411-32d9fb92419b	3335	Solčava
00050000-55f8-30af-c84c-d3083c2105c6	5250	Solkan
00050000-55f8-30af-5bb6-e47f386dbace	4229	Sorica
00050000-55f8-30af-8091-8afb9e48eb57	4225	Sovodenj
00050000-55f8-30af-77ef-cc42d0b00a53	5281	Spodnja Idrija
00050000-55f8-30af-b959-5644e44f3eaa	2241	Spodnji Duplek
00050000-55f8-30af-27ff-238a7b044ef5	9245	Spodnji Ivanjci
00050000-55f8-30af-a316-eeb45c84ecd3	2277	Središče ob Dravi
00050000-55f8-30af-5740-ffd1e50a0350	4267	Srednja vas v Bohinju
00050000-55f8-30af-3101-90b0fcc40225	8256	Sromlje 
00050000-55f8-30af-86cd-24f495953dbb	5224	Srpenica
00050000-55f8-30af-1258-d9f437666ed3	1242	Stahovica
00050000-55f8-30af-257e-0975823c8f85	1332	Stara Cerkev
00050000-55f8-30af-a753-3f731f97de5c	8342	Stari trg ob Kolpi
00050000-55f8-30af-beea-297b2ef70e95	1386	Stari trg pri Ložu
00050000-55f8-30af-f45c-a62655872d6e	2205	Starše
00050000-55f8-30af-7d3d-c6127e0253ae	2289	Stoperce
00050000-55f8-30af-8b1e-a3df47a2b58a	8322	Stopiče
00050000-55f8-30af-6906-e39dcdb9845b	3206	Stranice
00050000-55f8-30af-5c48-e40988d9b6bb	8351	Straža
00050000-55f8-30af-30b3-3f1b42184b96	1313	Struge
00050000-55f8-30af-9005-34a1e6185c8d	8293	Studenec
00050000-55f8-30af-342f-25537be89d41	8331	Suhor
00050000-55f8-30af-aeb9-b9195c0fa941	2233	Sv. Ana v Slovenskih goricah
00050000-55f8-30af-8c57-521e29526704	2235	Sv. Trojica v Slovenskih goricah
00050000-55f8-30af-bf7b-37be5e6e6e31	2353	Sveti Duh na Ostrem Vrhu
00050000-55f8-30af-1041-a00362fad4ab	9244	Sveti Jurij ob Ščavnici
00050000-55f8-30af-187b-091c345f311a	3264	Sveti Štefan
00050000-55f8-30af-6944-323e607a025b	2258	Sveti Tomaž
00050000-55f8-30af-dacc-b7421330bff1	9204	Šalovci
00050000-55f8-30af-0ca0-46daae087dad	5261	Šempas
00050000-55f8-30af-e067-4d478bef172e	5290	Šempeter pri Gorici
00050000-55f8-30af-9c9c-1262f7b472dd	3311	Šempeter v Savinjski dolini
00050000-55f8-30af-9bbf-c1bb3c0af3e1	4208	Šenčur
00050000-55f8-30af-2020-0e03111e66b8	2212	Šentilj v Slovenskih goricah
00050000-55f8-30af-4a7d-1d2dc6243d0a	8297	Šentjanž
00050000-55f8-30af-46a0-c47716785934	2373	Šentjanž pri Dravogradu
00050000-55f8-30af-9fed-e79bd3780b82	8310	Šentjernej
00050000-55f8-30af-8718-849538b716f5	3230	Šentjur
00050000-55f8-30af-fea0-ed31e09d2cfe	3271	Šentrupert
00050000-55f8-30af-7b36-7de181db8865	8232	Šentrupert
00050000-55f8-30af-a88d-a6e71c0b8915	1296	Šentvid pri Stični
00050000-55f8-30af-a20e-914a9b2ff0ac	8275	Škocjan
00050000-55f8-30af-75ba-c51e24b8484e	6281	Škofije
00050000-55f8-30af-f934-4d16a61b4612	4220	Škofja Loka
00050000-55f8-30af-c293-66ec6bc9bbb1	3211	Škofja vas
00050000-55f8-30af-501a-d95fc0d84e6f	1291	Škofljica
00050000-55f8-30af-7dac-870d9ed2ff60	6274	Šmarje
00050000-55f8-30af-b915-1ce28007a700	1293	Šmarje - Sap
00050000-55f8-30af-938d-e6867b96389d	3240	Šmarje pri Jelšah
00050000-55f8-30af-ea2d-366343695a0e	8220	Šmarješke Toplice
00050000-55f8-30af-d001-351c1184811d	2315	Šmartno na Pohorju
00050000-55f8-30af-659e-1148c357a43e	3341	Šmartno ob Dreti
00050000-55f8-30af-92e0-83c07f62ca4d	3327	Šmartno ob Paki
00050000-55f8-30af-b97b-db6f7ed00140	1275	Šmartno pri Litiji
00050000-55f8-30af-9c8a-605ba39b21dc	2383	Šmartno pri Slovenj Gradcu
00050000-55f8-30af-2abf-7b6eb1be5284	3201	Šmartno v Rožni dolini
00050000-55f8-30af-c222-3422b7f6f92f	3325	Šoštanj
00050000-55f8-30af-8016-42f088e714ce	6222	Štanjel
00050000-55f8-30af-ef1c-e3d7975bf3e9	3220	Štore
00050000-55f8-30af-893c-f19a570c0aac	3304	Tabor
00050000-55f8-30af-29be-38f6abaa77d9	3221	Teharje
00050000-55f8-30af-249b-b4b3db81626f	9251	Tišina
00050000-55f8-30af-021a-a2c7b092ab90	5220	Tolmin
00050000-55f8-30af-a762-0c09cab44107	3326	Topolšica
00050000-55f8-30af-6efc-4cbe9990c70a	2371	Trbonje
00050000-55f8-30af-2922-51d64b3da5ea	1420	Trbovlje
00050000-55f8-30af-0776-fe8fa6959fb6	8231	Trebelno 
00050000-55f8-30af-de59-e547ddfa0c65	8210	Trebnje
00050000-55f8-30af-6b2c-5382a4ff4f0a	5252	Trnovo pri Gorici
00050000-55f8-30af-dc70-83970e28d408	2254	Trnovska vas
00050000-55f8-30af-a41f-4ed0c448ebdb	1222	Trojane
00050000-55f8-30af-fc0c-8497609429d7	1236	Trzin
00050000-55f8-30af-0035-2706478edb18	4290	Tržič
00050000-55f8-30af-6ae0-ed93c8f17e0c	8295	Tržišče
00050000-55f8-30af-d241-01add1103dda	1311	Turjak
00050000-55f8-30af-56f4-f938839979fe	9224	Turnišče
00050000-55f8-30af-1ab5-dda20110ceda	8323	Uršna sela
00050000-55f8-30af-9389-066fa6565f8d	1252	Vače
00050000-55f8-30af-cb5a-28bc87d66db7	3320	Velenje 
00050000-55f8-30af-a9cf-ecd34ffa1bf9	3322	Velenje - poštni predali
00050000-55f8-30af-1277-f96a9c266517	8212	Velika Loka
00050000-55f8-30af-349f-bd07139fed82	2274	Velika Nedelja
00050000-55f8-30af-7c0e-991401b00c9b	9225	Velika Polana
00050000-55f8-30af-f5dd-98c2936775d6	1315	Velike Lašče
00050000-55f8-30af-a043-47109cb6171d	8213	Veliki Gaber
00050000-55f8-30af-6958-b7e15cb1af06	9241	Veržej
00050000-55f8-30af-cde7-7460658e0b89	1312	Videm - Dobrepolje
00050000-55f8-30af-f675-f604d2b3e63f	2284	Videm pri Ptuju
00050000-55f8-30af-d2e2-0ece4ac54ee9	8344	Vinica
00050000-55f8-30af-a94c-379721e45126	5271	Vipava
00050000-55f8-30af-f670-0399faf1dcd6	4212	Visoko
00050000-55f8-30af-412f-197e3f70b963	1294	Višnja Gora
00050000-55f8-30af-22d5-a8d54b5d079a	3205	Vitanje
00050000-55f8-30af-3211-05161e1a2340	2255	Vitomarci
00050000-55f8-30af-8873-7693d522fdb7	1217	Vodice
00050000-55f8-30af-a057-aa56af8a8a9f	3212	Vojnik\t
00050000-55f8-30af-45fa-e5ac33533d4f	5293	Volčja Draga
00050000-55f8-30af-a14e-b0f372481e6b	2232	Voličina
00050000-55f8-30af-44fc-20de474a73ee	3305	Vransko
00050000-55f8-30af-cb5b-0438a692ff3a	6217	Vremski Britof
00050000-55f8-30af-ae49-b34bf3bd11b4	1360	Vrhnika
00050000-55f8-30af-5e04-8121bd901314	2365	Vuhred
00050000-55f8-30af-e17e-66acf9355e38	2367	Vuzenica
00050000-55f8-30af-d793-4e2e6009d44e	8292	Zabukovje 
00050000-55f8-30af-be2f-0a2dbac81e88	1410	Zagorje ob Savi
00050000-55f8-30af-12be-23d9a40532de	1303	Zagradec
00050000-55f8-30af-92a3-378ef141211c	2283	Zavrč
00050000-55f8-30af-5a40-d8b5bd7b529a	8272	Zdole 
00050000-55f8-30af-1f5d-f319a82cbb26	4201	Zgornja Besnica
00050000-55f8-30af-d8bb-148958004ee6	2242	Zgornja Korena
00050000-55f8-30af-3133-ce923e91792d	2201	Zgornja Kungota
00050000-55f8-30af-d70e-4d31570d573d	2316	Zgornja Ložnica
00050000-55f8-30af-0a9b-ae63bd8bd5be	2314	Zgornja Polskava
00050000-55f8-30af-b994-1fe39fb123f5	2213	Zgornja Velka
00050000-55f8-30af-10ce-6ba312048c7c	4247	Zgornje Gorje
00050000-55f8-30af-7f97-eac62416574f	4206	Zgornje Jezersko
00050000-55f8-30af-b1b3-55cbbf30c479	2285	Zgornji Leskovec
00050000-55f8-30af-26f3-0e8fad757091	1432	Zidani Most
00050000-55f8-30af-3d0e-a4ad2286798b	3214	Zreče
00050000-55f8-30af-0a3f-14c9c20ad946	4209	Žabnica
00050000-55f8-30af-1618-502670150eb0	3310	Žalec
00050000-55f8-30af-42c8-3dafa809a491	4228	Železniki
00050000-55f8-30af-dc11-a5eb9faa9ecc	2287	Žetale
00050000-55f8-30af-8e97-a100641bacbd	4226	Žiri
00050000-55f8-30af-ad28-f4931aabc608	4274	Žirovnica
00050000-55f8-30af-4202-4bba098523f7	8360	Žužemberk
\.


--
-- TOC entry 2933 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19716195)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19715827)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19715634)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f8-30b1-4d27-bb2552d6cc15	00080000-55f8-30b1-fc32-c04ac881c221	\N	00040000-55f8-30b0-4fd4-a22fcf55a3ea	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f8-30b1-6cca-c041e1eb559a	00080000-55f8-30b1-fc32-c04ac881c221	\N	00040000-55f8-30b0-4fd4-a22fcf55a3ea	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f8-30b1-31fe-0dfb027c2704	00080000-55f8-30b1-f421-e4cb31170753	\N	00040000-55f8-30b0-4fd4-a22fcf55a3ea	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2955 (class 0 OID 19715712)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 19715839)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 19716209)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 19716219)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f8-30b1-bca4-07ae3538734a	00080000-55f8-30b1-deb0-8c6161b09d4f	0987	AK
00190000-55f8-30b1-94f1-7af5933aac96	00080000-55f8-30b1-f421-e4cb31170753	0989	AK
00190000-55f8-30b1-d35e-b2d631b42bdb	00080000-55f8-30b1-40bb-b04c49fbab00	0986	AK
00190000-55f8-30b1-e12b-f23bab4a4174	00080000-55f8-30b1-27bb-35dcb3453961	0984	AK
00190000-55f8-30b1-12c5-36205cb86b0b	00080000-55f8-30b1-72fa-af98dd6afc51	0983	AK
00190000-55f8-30b1-fa24-d5061ad7e787	00080000-55f8-30b1-1c6a-df165f4822b8	0982	AK
00190000-55f8-30b2-e6a4-913bd38403fc	00080000-55f8-30b2-8f62-935a34d68482	1001	AK
\.


--
-- TOC entry 2991 (class 0 OID 19716152)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f8-30b1-395d-a8240d8cd350	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2995 (class 0 OID 19716227)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19715868)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f8-30b1-0c34-4c7550a9bced	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f8-30b1-6fdc-d78f8b9cd466	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f8-30b1-0fdf-cd277a32c306	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f8-30b1-8bd7-6a857e786cbe	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f8-30b1-e342-4fd061286070	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f8-30b1-07db-db06243ec8e0	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f8-30b1-bb3a-4dd5acab856f	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2964 (class 0 OID 19715812)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 19715802)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19716005)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19715942)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 19715506)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f8-30b2-8f62-935a34d68482	00010000-55f8-30b0-1375-26f95c368882	2015-09-15 16:52:34	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f8-30b2-db0c-1b0d2b7855ec	00010000-55f8-30b0-1375-26f95c368882	2015-09-15 16:52:34	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f8-30b2-e6a4-913bd38403fc	00010000-55f8-30b0-1375-26f95c368882	2015-09-15 16:52:34	INS	a:0:{}
\.


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2973 (class 0 OID 19715881)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 19715544)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f8-30b0-fc0a-3815f9877798	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f8-30b0-e183-a13cbbbe6b83	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f8-30b0-3c52-dd242ae17799	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f8-30b0-debd-043be5bc98c8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f8-30b0-ef13-43751515ecd4	planer	Planer dogodkov v koledarju	t
00020000-55f8-30b0-2e7a-06ddab329764	kadrovska	Kadrovska služba	t
00020000-55f8-30b0-7b6d-778a21bff0ee	arhivar	Ažuriranje arhivalij	t
00020000-55f8-30b0-7e1f-72f9393f9be2	igralec	Igralec	t
00020000-55f8-30b0-af5b-86520b394535	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f8-30b1-6ea3-62d930ee02cc	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2940 (class 0 OID 19715528)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f8-30b0-1225-1b5280a7f0e6	00020000-55f8-30b0-3c52-dd242ae17799
00010000-55f8-30b0-1375-26f95c368882	00020000-55f8-30b0-3c52-dd242ae17799
00010000-55f8-30b1-bf2f-20211a621919	00020000-55f8-30b1-6ea3-62d930ee02cc
\.


--
-- TOC entry 2975 (class 0 OID 19715895)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19715833)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19715779)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 19715493)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f8-30af-22fe-51d33a42ba56	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f8-30af-da33-8d863fbead00	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f8-30af-4028-b6de91ed476d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f8-30af-1807-725d1af9ef29	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f8-30af-208a-d99278eddc55	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2935 (class 0 OID 19715485)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f8-30af-bc60-87e56a28119b	00230000-55f8-30af-1807-725d1af9ef29	popa
00240000-55f8-30af-5994-947722ae7cc6	00230000-55f8-30af-1807-725d1af9ef29	oseba
00240000-55f8-30af-d433-2cc3de11a1b0	00230000-55f8-30af-1807-725d1af9ef29	sezona
00240000-55f8-30af-2c81-d082c07d015a	00230000-55f8-30af-da33-8d863fbead00	prostor
00240000-55f8-30af-ed23-a3f473562d2a	00230000-55f8-30af-1807-725d1af9ef29	besedilo
00240000-55f8-30af-eccf-ed05e8d99cbe	00230000-55f8-30af-1807-725d1af9ef29	uprizoritev
00240000-55f8-30af-0b61-2aceae9d9137	00230000-55f8-30af-1807-725d1af9ef29	funkcija
00240000-55f8-30af-7843-4a3fe2c936ce	00230000-55f8-30af-1807-725d1af9ef29	tipfunkcije
00240000-55f8-30af-7904-acef5b46103a	00230000-55f8-30af-1807-725d1af9ef29	alternacija
00240000-55f8-30af-0bd1-78660b7648db	00230000-55f8-30af-22fe-51d33a42ba56	pogodba
00240000-55f8-30af-a72a-242dc44978ca	00230000-55f8-30af-1807-725d1af9ef29	zaposlitev
00240000-55f8-30af-9ef0-42b6ea02851a	00230000-55f8-30af-1807-725d1af9ef29	zvrstuprizoritve
00240000-55f8-30af-edbc-e33596d70575	00230000-55f8-30af-22fe-51d33a42ba56	programdela
00240000-55f8-30af-f451-6e74fd0fa067	00230000-55f8-30af-1807-725d1af9ef29	zapis
\.


--
-- TOC entry 2934 (class 0 OID 19715480)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
1c3b98ff-c4d9-48b6-b674-9901536fd20e	00240000-55f8-30af-bc60-87e56a28119b	0	1001
\.


--
-- TOC entry 2980 (class 0 OID 19715952)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f8-30b1-9661-8aa9649902f0	000e0000-55f8-30b1-e0d3-674b24190737	00080000-55f8-30b1-fc32-c04ac881c221	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f8-30b0-8509-3749238f2e3d
00270000-55f8-30b1-ffe6-7cf32d81af97	000e0000-55f8-30b1-e0d3-674b24190737	00080000-55f8-30b1-fc32-c04ac881c221	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f8-30b0-8509-3749238f2e3d
\.


--
-- TOC entry 2947 (class 0 OID 19715607)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 19715789)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f8-30b1-f39e-db21b4f20f0c	00180000-55f8-30b1-7c4a-c35e1effb41b	000c0000-55f8-30b1-72a2-83f4fd0887b8	00090000-55f8-30b1-2492-3022cb684021	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f8-30b1-ea6d-8a0fc5455952	00180000-55f8-30b1-7c4a-c35e1effb41b	000c0000-55f8-30b1-5dd4-a2b451ce2145	00090000-55f8-30b1-3bb4-9eae5de93f3e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f8-30b1-c845-39bf08b56c60	00180000-55f8-30b1-7c4a-c35e1effb41b	000c0000-55f8-30b1-9da0-3d07b32f3b74	00090000-55f8-30b1-e339-6bebc99a1711	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f8-30b1-efb2-11c83f0d9905	00180000-55f8-30b1-7c4a-c35e1effb41b	000c0000-55f8-30b1-9951-99c1127fd50e	00090000-55f8-30b1-128a-908c7acb43c8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f8-30b1-b9a4-e11d0232305e	00180000-55f8-30b1-7c4a-c35e1effb41b	000c0000-55f8-30b1-fd0f-f2c0e94c2cae	00090000-55f8-30b1-28f1-f843d577420e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f8-30b1-0b7b-faf1ab56dfb6	00180000-55f8-30b1-e236-c936abc204e0	\N	00090000-55f8-30b1-28f1-f843d577420e	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2983 (class 0 OID 19715993)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f8-30af-9f1f-0278e54ce266	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f8-30af-b870-74e09843f8b5	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f8-30af-055e-542843bbf1cf	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f8-30af-9ef9-321900503ec4	04	Režija	Režija	Režija	umetnik
000f0000-55f8-30af-8714-698e07c488bb	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f8-30af-0fba-8dcb4fff3e17	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f8-30af-303f-477294ea4beb	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f8-30af-ddc8-966096039cf1	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f8-30af-12ab-b3da4da5dd7f	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f8-30af-6483-33055766a479	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f8-30af-f467-d494f0cc87d3	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f8-30af-58c2-2fdcf6c75640	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f8-30af-d590-d3fb0cfbf686	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f8-30af-36f2-891b1693ede2	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f8-30af-d15e-ea3a25803805	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f8-30af-5c3c-27c990f005b9	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f8-30af-557e-8f5ddb6d421d	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f8-30af-c06f-17f0e207eefd	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2996 (class 0 OID 19716237)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f8-30af-3000-55f3858dc1a8	01	Velika predstava	f	1.00	1.00
002b0000-55f8-30af-719f-4d8906d79714	02	Mala predstava	f	0.50	0.50
002b0000-55f8-30af-95b7-db9f2335f15b	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f8-30af-d5f5-7eb8834f9886	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f8-30af-ac7c-38978e09876e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2952 (class 0 OID 19715669)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 19715515)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f8-30b0-1375-26f95c368882	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROF/83.nWRT7Hh./QePnk8rYYw797nqrq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f8-30b1-0b35-e64ef8e970bf	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f8-30b1-a8fa-7a5282a47bf5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f8-30b1-7780-a7b66cac19e1	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f8-30b1-2329-61bfac445785	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f8-30b1-571d-b67b475b3e17	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f8-30b1-0790-c1f8819703f8	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f8-30b1-1daf-f3abe8625837	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f8-30b1-ee0a-0797c1a6a06f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f8-30b1-16c7-c0244028f0b6	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f8-30b1-bf2f-20211a621919	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f8-30b0-1225-1b5280a7f0e6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 19716042)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f8-30b1-18dc-5b32acd898dd	00160000-55f8-30b1-55ff-4292c9a52e32	\N	00140000-55f8-30af-86e6-b0881dc8abd4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f8-30b1-e342-4fd061286070
000e0000-55f8-30b1-e0d3-674b24190737	00160000-55f8-30b1-5055-dad40308e969	\N	00140000-55f8-30af-23ad-c6bb2b1928d6	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f8-30b1-07db-db06243ec8e0
000e0000-55f8-30b1-93dc-b521df56091a	\N	\N	00140000-55f8-30af-23ad-c6bb2b1928d6	00190000-55f8-30b1-bca4-07ae3538734a	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f8-30b1-e342-4fd061286070
000e0000-55f8-30b1-0835-7b5b31c2b2a6	\N	\N	00140000-55f8-30af-23ad-c6bb2b1928d6	00190000-55f8-30b1-bca4-07ae3538734a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f8-30b1-e342-4fd061286070
000e0000-55f8-30b1-ea3c-f65f0cfc5308	\N	\N	00140000-55f8-30af-23ad-c6bb2b1928d6	00190000-55f8-30b1-bca4-07ae3538734a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f8-30b1-0c34-4c7550a9bced
000e0000-55f8-30b1-77f8-a7194de58755	\N	\N	00140000-55f8-30af-23ad-c6bb2b1928d6	00190000-55f8-30b1-bca4-07ae3538734a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f8-30b1-0c34-4c7550a9bced
\.


--
-- TOC entry 2957 (class 0 OID 19715733)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f8-30b1-ef4c-40313e971a63	000e0000-55f8-30b1-e0d3-674b24190737	\N	1	
00200000-55f8-30b1-38e9-74939ab7ef3f	000e0000-55f8-30b1-e0d3-674b24190737	\N	2	
00200000-55f8-30b1-d40a-805daefc7050	000e0000-55f8-30b1-e0d3-674b24190737	\N	3	
00200000-55f8-30b1-dc8b-24e4b1d0640e	000e0000-55f8-30b1-e0d3-674b24190737	\N	4	
00200000-55f8-30b1-8998-283c6793bfb0	000e0000-55f8-30b1-e0d3-674b24190737	\N	5	
\.


--
-- TOC entry 2971 (class 0 OID 19715860)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 19715966)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f8-30b0-a588-4bda4afcb32f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f8-30b0-a06b-04c3ade50603	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f8-30b0-ea79-617e6ecea56a	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f8-30b0-b8ad-e69296c7d53a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f8-30b0-218a-ed608ea4dd8b	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f8-30b0-51e1-c5aa49975d72	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f8-30b0-f281-ab7690fbbc2f	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f8-30b0-8f4e-d6309b27befc	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f8-30b0-8509-3749238f2e3d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f8-30b0-0396-025ddd06f2e3	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f8-30b0-8ae8-898d29790878	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f8-30b0-56a3-9d8e70bce3e0	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f8-30b0-8903-1fe4ef0c008e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f8-30b0-46dc-92942fcc6de9	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f8-30b0-8e0a-a7c26fc0b498	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f8-30b0-f88f-034da06a3098	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f8-30b0-f6d5-cbc4694fb9e4	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f8-30b0-fc7d-c6f0b29ad248	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f8-30b0-d4fe-c40cb336d810	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f8-30b0-be29-8bbe6575b386	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f8-30b0-b02b-c7d29dd61f07	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f8-30b0-3122-9296ac2c34fb	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f8-30b0-231b-ea86dc3c84ea	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f8-30b0-1ece-4cc058eb7195	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f8-30b0-b249-03cede1aa4d9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f8-30b0-e55f-70ce69c90438	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f8-30b0-3c4a-022151cd77d5	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f8-30b0-3d0b-70cadfed3efe	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2999 (class 0 OID 19716284)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 19716256)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19716296)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 19715932)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f8-30b1-9dca-c1099a3691c1	00090000-55f8-30b1-3bb4-9eae5de93f3e	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f8-30b1-7cef-c7de959ed01c	00090000-55f8-30b1-e339-6bebc99a1711	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f8-30b1-d21c-e7e02ae96106	00090000-55f8-30b1-2d47-47adb108183a	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f8-30b1-c414-1f083932e655	00090000-55f8-30b1-9969-e300a1d1003a	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f8-30b1-8ed2-66f03b0747b1	00090000-55f8-30b1-2492-3022cb684021	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f8-30b1-04c4-7a970b3d3c07	00090000-55f8-30b1-0848-d6efeaa909fb	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2959 (class 0 OID 19715769)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 19716032)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f8-30af-86e6-b0881dc8abd4	01	Drama	drama (SURS 01)
00140000-55f8-30af-a61c-5cbf0c9c3cf7	02	Opera	opera (SURS 02)
00140000-55f8-30af-b4fc-85321f74ca39	03	Balet	balet (SURS 03)
00140000-55f8-30af-23d9-18a54c62694b	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f8-30af-0489-9f6b66954af7	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f8-30af-23ad-c6bb2b1928d6	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f8-30af-2bcc-4291d217a261	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2977 (class 0 OID 19715922)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2485 (class 2606 OID 19715570)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 19716091)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 19716081)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 19715991)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 19716336)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 19715758)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 19715778)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 19716254)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 19715695)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 19716146)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 19715918)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 19715731)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 19715709)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 19715825)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 19716313)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 19716320)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2725 (class 2606 OID 19716344)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 19715852)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 19715667)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 19715579)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 19715603)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 19715559)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2476 (class 2606 OID 19715543)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 19715858)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 19715894)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 19716027)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 19715631)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 19715655)
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
-- TOC entry 2680 (class 2606 OID 19716207)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 19715831)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 19715645)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 19715719)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 19715843)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 19716216)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 19716224)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 19716194)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 19716235)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 19715876)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 19715816)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 19715807)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 19716015)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 19715949)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 19715514)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 19715885)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 19715532)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2478 (class 2606 OID 19715553)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 19715903)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 19715838)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 19715787)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 19715502)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 19715490)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 19715484)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 19715962)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 19715612)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 19715798)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 19716002)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 19716247)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 19715680)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 19715527)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 19716060)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 19715741)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 19715866)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 19715974)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 19716294)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 19716278)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 19716302)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 19715940)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 19715773)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 19716040)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 19715930)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 1259 OID 19715767)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2541 (class 1259 OID 19715768)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2542 (class 1259 OID 19715766)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2543 (class 1259 OID 19715765)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2544 (class 1259 OID 19715764)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2625 (class 1259 OID 19715963)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2626 (class 1259 OID 19715964)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 19715965)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2711 (class 1259 OID 19716315)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2712 (class 1259 OID 19716314)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2499 (class 1259 OID 19715633)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2588 (class 1259 OID 19715859)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2698 (class 1259 OID 19716282)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2699 (class 1259 OID 19716281)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2700 (class 1259 OID 19716283)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2701 (class 1259 OID 19716280)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2702 (class 1259 OID 19716279)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2582 (class 1259 OID 19715845)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2583 (class 1259 OID 19715844)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2535 (class 1259 OID 19715742)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19715919)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 19715921)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2614 (class 1259 OID 19715920)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2524 (class 1259 OID 19715711)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2525 (class 1259 OID 19715710)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2689 (class 1259 OID 19716236)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2641 (class 1259 OID 19716029)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 19716030)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2643 (class 1259 OID 19716031)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2708 (class 1259 OID 19716303)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2650 (class 1259 OID 19716065)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2651 (class 1259 OID 19716062)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2652 (class 1259 OID 19716066)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2653 (class 1259 OID 19716064)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2654 (class 1259 OID 19716063)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2514 (class 1259 OID 19715682)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2515 (class 1259 OID 19715681)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2490 (class 1259 OID 19715606)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2600 (class 1259 OID 19715886)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2480 (class 1259 OID 19715560)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2481 (class 1259 OID 19715561)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2605 (class 1259 OID 19715906)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2606 (class 1259 OID 19715905)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2607 (class 1259 OID 19715904)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2528 (class 1259 OID 19715720)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2529 (class 1259 OID 19715721)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2460 (class 1259 OID 19715492)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2562 (class 1259 OID 19715811)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2563 (class 1259 OID 19715809)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2564 (class 1259 OID 19715808)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2565 (class 1259 OID 19715810)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2471 (class 1259 OID 19715533)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2472 (class 1259 OID 19715534)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2591 (class 1259 OID 19715867)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2721 (class 1259 OID 19716337)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2722 (class 1259 OID 19716345)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2723 (class 1259 OID 19716346)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2577 (class 1259 OID 19715832)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2621 (class 1259 OID 19715950)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2622 (class 1259 OID 19715951)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2671 (class 1259 OID 19716151)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2672 (class 1259 OID 19716150)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2673 (class 1259 OID 19716147)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2674 (class 1259 OID 19716148)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2675 (class 1259 OID 19716149)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2503 (class 1259 OID 19715647)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2504 (class 1259 OID 19715646)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2505 (class 1259 OID 19715648)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2594 (class 1259 OID 19715880)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2595 (class 1259 OID 19715879)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2681 (class 1259 OID 19716217)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 19716218)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2664 (class 1259 OID 19716095)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2665 (class 1259 OID 19716096)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2666 (class 1259 OID 19716093)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2667 (class 1259 OID 19716094)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2618 (class 1259 OID 19715941)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2568 (class 1259 OID 19715820)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2569 (class 1259 OID 19715819)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2570 (class 1259 OID 19715817)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2571 (class 1259 OID 19715818)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2660 (class 1259 OID 19716083)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2661 (class 1259 OID 19716082)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2534 (class 1259 OID 19715732)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2678 (class 1259 OID 19716208)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2455 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2697 (class 1259 OID 19716255)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2715 (class 1259 OID 19716321)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2716 (class 1259 OID 19716322)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2486 (class 1259 OID 19715581)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2487 (class 1259 OID 19715580)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2495 (class 1259 OID 19715613)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2496 (class 1259 OID 19715614)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2557 (class 1259 OID 19715801)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 19715800)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2559 (class 1259 OID 19715799)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 19715760)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2546 (class 1259 OID 19715761)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2547 (class 1259 OID 19715759)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2548 (class 1259 OID 19715763)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2549 (class 1259 OID 19715762)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2502 (class 1259 OID 19715632)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19715696)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 19715698)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2522 (class 1259 OID 19715697)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2523 (class 1259 OID 19715699)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2576 (class 1259 OID 19715826)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2646 (class 1259 OID 19716028)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 19716061)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19716003)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 19716004)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2493 (class 1259 OID 19715604)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2494 (class 1259 OID 19715605)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2615 (class 1259 OID 19715931)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 19715503)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2513 (class 1259 OID 19715668)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2463 (class 1259 OID 19715491)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2694 (class 1259 OID 19716248)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 19715878)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2599 (class 1259 OID 19715877)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 19716092)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 19715656)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 19716041)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 19716295)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2687 (class 1259 OID 19716225)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 19716226)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2634 (class 1259 OID 19715992)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2556 (class 1259 OID 19715788)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 19715554)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2749 (class 2606 OID 19716467)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2750 (class 2606 OID 19716472)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2754 (class 2606 OID 19716492)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2755 (class 2606 OID 19716462)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2752 (class 2606 OID 19716482)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2753 (class 2606 OID 19716487)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2751 (class 2606 OID 19716477)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2785 (class 2606 OID 19716642)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2786 (class 2606 OID 19716647)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2787 (class 2606 OID 19716652)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2820 (class 2606 OID 19716817)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2819 (class 2606 OID 19716812)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2737 (class 2606 OID 19716402)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 19716572)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2816 (class 2606 OID 19716797)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2815 (class 2606 OID 19716792)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2817 (class 2606 OID 19716802)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 19716787)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2813 (class 2606 OID 19716782)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2770 (class 2606 OID 19716567)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2769 (class 2606 OID 19716562)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2748 (class 2606 OID 19716457)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 19716612)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2781 (class 2606 OID 19716622)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2780 (class 2606 OID 19716617)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2744 (class 2606 OID 19716437)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2743 (class 2606 OID 19716432)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2767 (class 2606 OID 19716552)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2811 (class 2606 OID 19716772)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 19716657)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 19716662)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 19716667)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2818 (class 2606 OID 19716807)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2794 (class 2606 OID 19716687)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2791 (class 2606 OID 19716672)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2795 (class 2606 OID 19716692)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2793 (class 2606 OID 19716682)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2792 (class 2606 OID 19716677)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2742 (class 2606 OID 19716427)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2741 (class 2606 OID 19716422)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2734 (class 2606 OID 19716387)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2733 (class 2606 OID 19716382)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2775 (class 2606 OID 19716592)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2729 (class 2606 OID 19716362)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2730 (class 2606 OID 19716367)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2778 (class 2606 OID 19716607)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2777 (class 2606 OID 19716602)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 19716597)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2745 (class 2606 OID 19716442)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2746 (class 2606 OID 19716447)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2726 (class 2606 OID 19716347)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2762 (class 2606 OID 19716527)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2760 (class 2606 OID 19716517)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2759 (class 2606 OID 19716512)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2761 (class 2606 OID 19716522)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2727 (class 2606 OID 19716352)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2728 (class 2606 OID 19716357)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2772 (class 2606 OID 19716577)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2823 (class 2606 OID 19716832)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2824 (class 2606 OID 19716837)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2825 (class 2606 OID 19716842)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2768 (class 2606 OID 19716557)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2783 (class 2606 OID 19716632)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2784 (class 2606 OID 19716637)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 19716747)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2805 (class 2606 OID 19716742)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2802 (class 2606 OID 19716727)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 19716732)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2804 (class 2606 OID 19716737)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2739 (class 2606 OID 19716412)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 19716407)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2740 (class 2606 OID 19716417)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2774 (class 2606 OID 19716587)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2773 (class 2606 OID 19716582)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2808 (class 2606 OID 19716757)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2809 (class 2606 OID 19716762)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2800 (class 2606 OID 19716717)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2801 (class 2606 OID 19716722)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2798 (class 2606 OID 19716707)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2799 (class 2606 OID 19716712)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2782 (class 2606 OID 19716627)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 19716547)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2765 (class 2606 OID 19716542)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2763 (class 2606 OID 19716532)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2764 (class 2606 OID 19716537)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2797 (class 2606 OID 19716702)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2796 (class 2606 OID 19716697)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2747 (class 2606 OID 19716452)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2807 (class 2606 OID 19716752)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2810 (class 2606 OID 19716767)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2812 (class 2606 OID 19716777)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2821 (class 2606 OID 19716822)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2822 (class 2606 OID 19716827)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2732 (class 2606 OID 19716377)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2731 (class 2606 OID 19716372)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2735 (class 2606 OID 19716392)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2736 (class 2606 OID 19716397)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 19716507)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 19716502)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 19716497)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-15 16:52:35 CEST

--
-- PostgreSQL database dump complete
--

