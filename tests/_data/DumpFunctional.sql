--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-06 13:24:04 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 246 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 12204506)
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
-- TOC entry 228 (class 1259 OID 12205009)
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
-- TOC entry 227 (class 1259 OID 12204992)
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
-- TOC entry 221 (class 1259 OID 12204904)
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
-- TOC entry 244 (class 1259 OID 12205252)
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
    title character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 197 (class 1259 OID 12204685)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_izven_id uuid,
    prostor_id uuid,
    sezona_id uuid,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status integer,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 12204719)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 12205154)
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
-- TOC entry 192 (class 1259 OID 12204628)
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
-- TOC entry 229 (class 1259 OID 12205022)
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
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
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
    opredelitevdrugidogodki text,
    stprodukcij integer,
    caspriprave character varying(255) DEFAULT NULL::character varying,
    casizvedbe character varying(255) DEFAULT NULL::character varying,
    prizorisca text,
    umetvodja character varying(255) DEFAULT NULL::character varying,
    programskotelo character varying(255) DEFAULT NULL::character varying,
    soorganizatorji text,
    sttujihselektorjev integer
);


--
-- TOC entry 216 (class 1259 OID 12204849)
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
-- TOC entry 195 (class 1259 OID 12204665)
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
-- TOC entry 199 (class 1259 OID 12204713)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 12204645)
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
-- TOC entry 170 (class 1259 OID 529271)
-- Name: kose; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kose (
    id uuid NOT NULL,
    naslov_id uuid,
    user_id uuid,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying,
    priimek character varying(255) DEFAULT NULL::character varying,
    pesvdonim character varying(255) DEFAULT NULL::character varying,
    funkcija character varying(40) DEFAULT NULL::character varying,
    email character varying(40) DEFAULT NULL::character varying,
    datumrojstva character varying(255) DEFAULT NULL::character varying,
    emso character varying(255) DEFAULT NULL::character varying,
    davcna character varying(255) DEFAULT NULL::character varying,
    spol character varying(1) DEFAULT NULL::character varying,
    opombe text,
    drzavljanstvo character varying(255) DEFAULT NULL::character varying,
    drzavarojstva character varying(255) DEFAULT NULL::character varying,
    krajrojstva character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 12204766)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 12205233)
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
-- TOC entry 243 (class 1259 OID 12205245)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 12205268)
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
-- TOC entry 209 (class 1259 OID 12204791)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 12204602)
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
-- TOC entry 184 (class 1259 OID 12204515)
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
-- TOC entry 185 (class 1259 OID 12204526)
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
    email character varying(40) DEFAULT NULL::character varying,
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
-- TOC entry 172 (class 1259 OID 4729417)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 180 (class 1259 OID 12204480)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 12204499)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 12204798)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 12204829)
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
-- TOC entry 224 (class 1259 OID 12204943)
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
-- TOC entry 187 (class 1259 OID 12204559)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    sifra character varying(4) NOT NULL,
    tipkli character varying(20) DEFAULT NULL::character varying,
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
-- TOC entry 189 (class 1259 OID 12204594)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 12204772)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 171 (class 1259 OID 692701)
-- Name: postninaslov; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslov (
    id uuid NOT NULL,
    klient_id uuid,
    oseba_id uuid,
    drzava_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    ulica character varying(50) DEFAULT NULL::character varying,
    ulicadva character varying(50) DEFAULT NULL::character varying,
    posta character varying(50) DEFAULT NULL::character varying,
    postanaziv character varying(50) DEFAULT NULL::character varying,
    pokrajina character varying(50) DEFAULT NULL::character varying,
    jeeu boolean,
    privzeti boolean NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 12204579)
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
-- TOC entry 194 (class 1259 OID 12204657)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 12204784)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 12205115)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 232 (class 1259 OID 12205125)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 12205071)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
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
    stizvponprej integer,
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
-- TOC entry 175 (class 1259 OID 7936450)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    zvrst character varying(255) NOT NULL,
    stpredstav integer,
    stpredavanj integer,
    stpredstavitev integer,
    stdelavnic integer,
    stdrugidogodki integer,
    opredelitevdrugidogodki text,
    stprodukcij integer,
    stobisk integer,
    caspriprave character varying(255) NOT NULL,
    casizvedbe character varying(255) NOT NULL,
    prizorisca character varying(255) DEFAULT NULL::character varying,
    umetvodja character varying(255) DEFAULT NULL::character varying,
    programskotelo character varying(255) DEFAULT NULL::character varying,
    soorganizatorji character varying(255) DEFAULT NULL::character varying,
    sttujihselektorjev integer,
    stzaposlenih integer,
    sthonorarnih integer,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    opredelitevdrugiviri text,
    vlozekkoproducenta numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer
);


--
-- TOC entry 173 (class 1259 OID 7899147)
-- Name: programgostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programgostovanje (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    gostitelj_id uuid,
    krajgostovanja character varying(255) NOT NULL,
    ustanova character varying(255) NOT NULL,
    datumgostovanja date,
    stponovitev integer DEFAULT 0 NOT NULL,
    stgledalcev integer DEFAULT 0 NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    transportnistroski numeric(15,2) NOT NULL,
    stroskiavtorzun numeric(15,2) NOT NULL,
    odkup numeric(15,2) DEFAULT NULL::numeric,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    viridminlok numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer
);


--
-- TOC entry 174 (class 1259 OID 7924205)
-- Name: programrazno; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programrazno (
    id uuid NOT NULL,
    program_dela_id uuid,
    gostitelj_id uuid,
    nazivsklopa character varying(255) NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stpe integer DEFAULT 0 NOT NULL,
    stobiskovalcev integer DEFAULT 0 NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    sthonoranih integer DEFAULT 0 NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    viridminlok numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer
);


--
-- TOC entry 233 (class 1259 OID 12205133)
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
-- TOC entry 212 (class 1259 OID 12204813)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 204 (class 1259 OID 12204757)
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
-- TOC entry 203 (class 1259 OID 12204747)
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
-- TOC entry 223 (class 1259 OID 12204932)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 12204881)
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
-- TOC entry 177 (class 1259 OID 12204451)
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
-- TOC entry 176 (class 1259 OID 12204449)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 12204823)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 12204489)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 12204473)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 12204837)
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
-- TOC entry 207 (class 1259 OID 12204778)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 12204724)
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
-- TOC entry 238 (class 1259 OID 12205174)
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
-- TOC entry 237 (class 1259 OID 12205166)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 12205161)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 12204891)
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
    sort integer
);


--
-- TOC entry 186 (class 1259 OID 12204551)
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
-- TOC entry 202 (class 1259 OID 12204734)
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
-- TOC entry 222 (class 1259 OID 12204921)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 12205143)
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
-- TOC entry 191 (class 1259 OID 12204614)
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
-- TOC entry 178 (class 1259 OID 12204460)
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
-- TOC entry 226 (class 1259 OID 12204969)
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
    kratkinaslov character varying(255) DEFAULT NULL::character varying,
    maticnioder_id uuid
);


--
-- TOC entry 196 (class 1259 OID 12204676)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 12204805)
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
-- TOC entry 240 (class 1259 OID 12205213)
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
-- TOC entry 239 (class 1259 OID 12205185)
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
    rigths character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 241 (class 1259 OID 12205225)
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
-- TOC entry 218 (class 1259 OID 12204874)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
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
-- TOC entry 198 (class 1259 OID 12204708)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 12204959)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 12204864)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 12204454)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2998 (class 0 OID 12204506)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 12205009)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c3-43d3-b087-babb94372fec	000d0000-55c3-43d3-5e1c-f99730666a5d	\N	00090000-55c3-43d3-5823-3d6d03241fd5	000b0000-55c3-43d3-d4f3-784e035e7940	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c3-43d3-77d8-4bddb17816ee	000d0000-55c3-43d3-3f56-97f04eb67145	00100000-55c3-43d3-2507-df89385eb66e	00090000-55c3-43d3-f3a7-e8f8b19ac4f6	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c3-43d3-0355-2a63f27cd481	000d0000-55c3-43d3-2612-ed473c1d9e34	00100000-55c3-43d3-9fc8-b2f378b62499	00090000-55c3-43d3-6c4a-ce3ef2ba4cb2	\N	0003	t	\N	2015-08-06	\N	2	\N	\N	f	f
000c0000-55c3-43d3-2f91-7a1c1b5b215f	000d0000-55c3-43d3-2ec4-5e4175ffffe1	\N	00090000-55c3-43d3-bfdd-fb64ff6999b0	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c3-43d3-bc9c-4c0ee36f1789	000d0000-55c3-43d3-0c64-229e2f8d2eac	\N	00090000-55c3-43d3-831e-30cda918dc84	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c3-43d3-9eb3-00d0901bd0f3	000d0000-55c3-43d3-6a79-8cc9227fab64	\N	00090000-55c3-43d3-47b2-fcf5ac9c54b1	000b0000-55c3-43d3-4eb5-6baf6d6ef559	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c3-43d3-acdc-9bf99f348c03	000d0000-55c3-43d3-5289-9693e835715a	00100000-55c3-43d3-b8f4-bd030510a81f	00090000-55c3-43d3-c158-b22caee96c1f	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c3-43d3-da3a-2752212a8f0b	000d0000-55c3-43d3-834c-db17a82c4b72	\N	00090000-55c3-43d3-6938-96035b730f92	000b0000-55c3-43d3-7c26-94097e1c42f4	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c3-43d3-ae39-40995c421587	000d0000-55c3-43d3-5289-9693e835715a	00100000-55c3-43d3-c21b-30d07b266093	00090000-55c3-43d3-33e6-deee4bcc8696	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c3-43d3-3a05-2fcb190db55e	000d0000-55c3-43d3-5289-9693e835715a	00100000-55c3-43d3-20cb-1565bd90b5f3	00090000-55c3-43d3-7657-359df9f985c0	\N	0010	t	\N	2015-08-06	\N	16	\N	\N	f	t
000c0000-55c3-43d3-2330-69c1e5b256c9	000d0000-55c3-43d3-5289-9693e835715a	00100000-55c3-43d3-2b07-87b8d9b19db7	00090000-55c3-43d3-10d8-d18f7a8896f7	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3042 (class 0 OID 12204992)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 12204904)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c3-43d3-6cbd-97faab321afa	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c3-43d3-a63b-0a92579eb3af	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c3-43d3-aa05-9bf364ba3ba6	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 12205252)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 12204685)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c3-43d3-bd42-9b680480f014	\N	\N	00200000-55c3-43d3-0daa-c009db37f67e	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c3-43d3-4a89-1e4b4fb3e087	\N	\N	00200000-55c3-43d3-45f8-e1cac8187df3	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c3-43d3-f34f-e3e215f378f3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c3-43d3-47e4-a8fd33652616	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c3-43d3-a4d3-58a6c5cfa98e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3015 (class 0 OID 12204719)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 12205154)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 12204628)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c3-43d1-be90-864b12e58329	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c3-43d1-6933-5a05d73ee8e6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c3-43d1-33cd-faff3f44b609	AL	ALB	008	Albania 	Albanija	\N
00040000-55c3-43d1-ec2b-2788309b5aeb	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c3-43d1-84ce-4092b6f793dd	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c3-43d1-6ce7-fa99f51c73f0	AD	AND	020	Andorra 	Andora	\N
00040000-55c3-43d1-f8b2-48d5f26b7c89	AO	AGO	024	Angola 	Angola	\N
00040000-55c3-43d1-0585-fd384ce7548d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c3-43d1-3a97-83016f8b7563	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c3-43d1-27ea-6c8bfe4aa487	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c3-43d1-95c5-756dbece8b70	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c3-43d1-3918-20a59a0bdb7f	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c3-43d1-6980-6ec7134e3b2d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c3-43d1-8708-063e09c66394	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c3-43d1-83a5-c6be6f014f8e	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c3-43d1-2578-06f9c66b1ca7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c3-43d1-3830-0bd831c26ac3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c3-43d1-4184-98ab7f68bb1e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c3-43d1-ee3d-3b5dacf9e8d7	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c3-43d1-7283-05d9b8751b57	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c3-43d1-71b5-4009d9edbf4a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c3-43d1-10c5-eaf5a6a8e700	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c3-43d1-c11e-5239089b3eb3	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c3-43d1-24a3-c421bffd0c7f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c3-43d1-607a-69f5838d9541	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c3-43d1-d0b9-81d31562a482	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c3-43d1-3471-26611736ec45	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c3-43d1-f865-da7dfa762cb2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c3-43d1-d2ba-1412392e6408	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c3-43d1-3010-2f2a6f1ceccc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c3-43d1-9c17-324b221f0702	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c3-43d1-02ab-aca3c6317319	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c3-43d1-dc82-7e4fe621bdba	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c3-43d1-62ec-1218667d2724	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c3-43d1-8dad-1d819a380537	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c3-43d1-0fc7-adfadb0f5fa2	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c3-43d1-17a4-96e3d6e2e402	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c3-43d1-3d56-52791799b3e7	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c3-43d1-3851-7b138b3c70e6	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c3-43d1-6bf6-cfc09fe91de9	CA	CAN	124	Canada 	Kanada	\N
00040000-55c3-43d1-40c8-48b5be0966f0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c3-43d1-a644-da76a49eb2f6	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c3-43d1-3cce-ac10dd774abb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c3-43d1-5a6d-8c2f91e189f6	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c3-43d1-1c19-33cefb48e359	CL	CHL	152	Chile 	Čile	\N
00040000-55c3-43d1-6f6d-87f9d33e689b	CN	CHN	156	China 	Kitajska	\N
00040000-55c3-43d1-4ac4-cdf25d99f0bc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c3-43d1-4da6-4d8489931724	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c3-43d1-e0e4-723805404988	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c3-43d1-3ce2-8e1c34735011	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c3-43d1-0c08-5adc09ee5a8e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c3-43d1-2ca0-05e62944c2a9	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c3-43d1-0510-cf2661b2ad54	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c3-43d1-ee02-23b34fb9db59	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c3-43d1-674f-ff3630852784	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c3-43d1-69d8-dcbcbcc278ee	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c3-43d1-9244-8a5bdc1be522	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c3-43d1-08c2-4ac9dcb663e7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c3-43d1-6c9a-e11250cb0dae	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c3-43d1-1f78-8f03931adc80	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c3-43d1-c0b1-7c799463f861	DK	DNK	208	Denmark 	Danska	\N
00040000-55c3-43d1-9ba8-be3338b0b9c1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c3-43d1-0b47-466adc5fab5e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c3-43d1-c517-48bb727fca50	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c3-43d1-5389-260c7df47351	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c3-43d1-ff2b-c33c0862bddf	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c3-43d1-b05b-b64d0b5a12a4	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c3-43d1-99fd-851ae840aa00	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c3-43d1-cd06-f8b612560208	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c3-43d1-d500-e817bcbc09f6	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c3-43d1-5419-3ae9564555ee	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c3-43d1-6153-2689055f1731	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c3-43d1-b7e5-97fa869592cb	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c3-43d1-1766-98e87ec1e555	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c3-43d1-3b0f-3289958583fd	FI	FIN	246	Finland 	Finska	\N
00040000-55c3-43d1-c325-c14bb4b35022	FR	FRA	250	France 	Francija	\N
00040000-55c3-43d1-375a-e35ec29dc746	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c3-43d1-7cc5-74474dbbe508	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c3-43d1-8be4-a5d916eaff20	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c3-43d1-4ba0-a91eaa988aef	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c3-43d1-0f18-798b98ba1773	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c3-43d1-f1ea-eff3425a7920	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c3-43d1-c31e-0985086c675d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c3-43d1-3663-a83f2c0f3fce	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c3-43d1-1af9-aebc58582445	GH	GHA	288	Ghana 	Gana	\N
00040000-55c3-43d1-c977-7d43af77affc	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c3-43d1-44bd-349e324ce961	GR	GRC	300	Greece 	Grčija	\N
00040000-55c3-43d1-2790-bfba960ad01e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c3-43d1-c3ad-ec7e45a5cff8	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c3-43d1-e2eb-775c06d20e0d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c3-43d1-89dd-4a76d3c62350	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c3-43d1-67be-dbc91866c928	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c3-43d1-7385-15e34aec7d00	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c3-43d1-8f01-3ada461bcb74	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c3-43d1-fee3-6ac6a6f58472	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c3-43d1-dce2-8b37d7c8ed9b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c3-43d1-766b-fd1286611321	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c3-43d1-6188-75c84a299255	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c3-43d1-72be-ad32cbb6a69f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c3-43d1-3048-f70031f23e91	HN	HND	340	Honduras 	Honduras	\N
00040000-55c3-43d1-1577-1a5e0b3441db	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c3-43d1-dba5-5f58db72ca68	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c3-43d1-72c3-1ee511f6fce8	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c3-43d1-6956-9cdd0b14e298	IN	IND	356	India 	Indija	\N
00040000-55c3-43d1-9e52-4db36cc0f572	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c3-43d1-05c1-593f90d22073	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c3-43d1-c18c-4af0eea2b291	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c3-43d1-5050-659f30aa6a1e	IE	IRL	372	Ireland 	Irska	\N
00040000-55c3-43d1-718d-66cd4d8aa814	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c3-43d1-d514-28505a71595b	IL	ISR	376	Israel 	Izrael	\N
00040000-55c3-43d1-989f-fbc2583ba5d5	IT	ITA	380	Italy 	Italija	\N
00040000-55c3-43d1-0bd6-9a70348c20fc	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c3-43d1-269e-a03dc70963ca	JP	JPN	392	Japan 	Japonska	\N
00040000-55c3-43d1-2cb0-d7a20d770464	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c3-43d1-8c3f-7e4dc708be77	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c3-43d1-9946-a304b7a2aaef	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c3-43d1-acb4-d5e115769153	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c3-43d1-79c7-91a135c143b6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c3-43d1-f1db-045ee6f58188	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c3-43d1-437b-05c9c9a5da09	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c3-43d1-620b-bbed73e8bd1c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c3-43d1-e294-dc0389bd847b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c3-43d1-ed35-6e029dfb65a8	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c3-43d1-fae1-7fddb917f83d	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c3-43d1-60cd-7e923ed6ef11	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c3-43d1-4280-31b719419d04	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c3-43d1-0a1f-dcb19a9ed5eb	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c3-43d1-efcd-11efb86ff84e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c3-43d1-f78a-4ed62f80601c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c3-43d1-81e7-a6d9bf9ab4ac	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c3-43d1-73dc-0638ed445ad7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c3-43d1-1ca8-782f3b4f0e1b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c3-43d1-3aef-1563b2134ea7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c3-43d1-095c-5e2fe97b6591	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c3-43d1-5c01-93adad8c8f94	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c3-43d1-91d4-2573adc9bc89	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c3-43d1-e055-e4dfaae80b47	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c3-43d1-99fa-bf1fdb73dfbd	ML	MLI	466	Mali 	Mali	\N
00040000-55c3-43d1-da21-2307c05835b7	MT	MLT	470	Malta 	Malta	\N
00040000-55c3-43d1-155f-a2cb354852b7	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c3-43d1-cd06-77e50a8c5b9f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c3-43d1-edf3-df8eef1428c9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c3-43d1-1b78-e03aa262d19b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c3-43d1-da88-2746ee7e1f4c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c3-43d1-cda4-3471804cfab5	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c3-43d1-ade2-dc7388f4f5ff	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c3-43d1-2424-1be0ffd72518	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c3-43d1-e5e9-7adc7aa269fe	MC	MCO	492	Monaco 	Monako	\N
00040000-55c3-43d1-28e5-a0e9b4b30e42	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c3-43d1-219f-87ff010f02c5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c3-43d1-27b7-617f3f8ac27e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c3-43d1-62ce-28b1677d241e	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c3-43d1-b48c-85fd63a93a79	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c3-43d1-7e79-8bb45006282c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c3-43d1-e24b-428878d165fc	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c3-43d1-ea77-f1af5a3f185c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c3-43d1-7307-8edfd727c3c2	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c3-43d1-4b3c-cf46604873a6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c3-43d1-587d-bea82a7558de	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c3-43d1-90f7-ae7e6e4f9a5a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c3-43d1-72ef-2781b4a836da	NE	NER	562	Niger 	Niger 	\N
00040000-55c3-43d1-01f5-7a14798f988b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c3-43d1-0abb-7f3b4cfab1e4	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c3-43d1-de3c-5b48fa5c197d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c3-43d1-bdd6-b1c77567a34b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c3-43d1-34dd-ce39b841e3c4	NO	NOR	578	Norway 	Norveška	\N
00040000-55c3-43d1-07f3-b8a3a80c75c4	OM	OMN	512	Oman 	Oman	\N
00040000-55c3-43d1-0cd6-cf6c56a080f7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c3-43d1-a734-d7c859000fec	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c3-43d1-bf63-a0b89e0b98ba	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c3-43d1-d740-8103f78f647a	PA	PAN	591	Panama 	Panama	\N
00040000-55c3-43d1-79d6-c6e556914f04	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c3-43d1-f211-dd9ff1dfa453	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c3-43d1-23b1-421017973997	PE	PER	604	Peru 	Peru	\N
00040000-55c3-43d1-0f27-b83015221d88	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c3-43d1-00dc-e4083007019f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c3-43d1-58b8-ba983c3f0962	PL	POL	616	Poland 	Poljska	\N
00040000-55c3-43d1-342f-c8632f7b478b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c3-43d1-8fdb-810fc614d04c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c3-43d1-0877-db943ce46dc0	QA	QAT	634	Qatar 	Katar	\N
00040000-55c3-43d1-8b54-d18d04ed2a64	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c3-43d1-b100-12b5d5577e65	RO	ROU	642	Romania 	Romunija	\N
00040000-55c3-43d1-f6b4-e9e2e2508cde	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c3-43d1-326b-7f22e1aaf3ff	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c3-43d1-7355-9bdbaccb3d34	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c3-43d1-9fd1-ad23d43b14e4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c3-43d1-74a4-cfc46b1f2f68	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c3-43d1-c102-f65f84b7bf8c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c3-43d1-bbcd-6b44f45323c6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c3-43d1-61c4-cddd26123403	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c3-43d1-b011-37add9f22482	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c3-43d1-a131-858147b8afd4	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c3-43d1-5994-fb83e1074564	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c3-43d1-0c16-321b6efe01cc	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c3-43d1-c88a-b47af64af5a0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c3-43d1-f028-436f576e49f9	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c3-43d1-6366-f133b3005085	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c3-43d1-ee0a-daef23109b57	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c3-43d1-4b74-d8b0498125c5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c3-43d1-429a-edc9119e741f	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c3-43d1-2a9f-c525e6133096	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c3-43d1-f58b-0c495b1366bb	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c3-43d1-80ca-8f17a4d8f1e2	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c3-43d1-4b6c-3172adf3b784	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c3-43d1-0ca7-238359483173	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c3-43d1-6841-10b1902f851a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c3-43d1-931e-58eb04625ebf	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c3-43d1-3308-4fe051f68cef	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c3-43d1-ad84-5cf218cb5bf5	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c3-43d1-e02b-413615fb4bdd	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c3-43d1-3e2d-e398eb62cfe3	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c3-43d1-c2c4-03758cf3cba6	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c3-43d1-2ad7-694448f76364	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c3-43d1-54d6-6d5b76604b39	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c3-43d1-ee0a-52e750ed094e	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c3-43d1-a23f-983f87b9fcdf	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c3-43d1-d105-b7c6db37667f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c3-43d1-803a-1b3af78f0f42	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c3-43d1-ae46-7cab11bf0181	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c3-43d1-2312-48bb4c909788	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c3-43d1-01cd-e1ab983b59cf	TH	THA	764	Thailand 	Tajska	\N
00040000-55c3-43d1-dfcb-eba782198545	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c3-43d1-9121-bda8d1dba96a	TG	TGO	768	Togo 	Togo	\N
00040000-55c3-43d1-7ec5-ab33cf4ed3bb	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c3-43d1-ac62-cfa3b1b1e29e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c3-43d1-c2d0-4e4f12907971	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c3-43d1-f151-3f46c8ae0cc5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c3-43d1-716c-c95fb459d15c	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c3-43d1-a32e-b3b9cc6f1de7	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c3-43d1-e732-30c544f1faf0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c3-43d1-03eb-c5def887ee90	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c3-43d1-d8fa-f7b308969b6b	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c3-43d1-f7ba-399ad93b886b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c3-43d1-94c1-e86b5c8661c3	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c3-43d1-008e-caa827944da0	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c3-43d1-e00e-25cc757f1931	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c3-43d1-ea1d-152d1acca478	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c3-43d1-a01d-197b10a112c4	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c3-43d1-7c37-804d8fcf5a82	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c3-43d1-95f6-df084c3c6f33	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c3-43d1-1e16-da1061c10dcc	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c3-43d1-a3e5-827d38d01a13	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c3-43d1-33fc-ab28d7a1692e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c3-43d1-293f-17691d25092a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c3-43d1-0817-f660c12ef2ce	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c3-43d1-8436-7718c4eeabbe	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c3-43d1-a175-c4f6b4cd218e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c3-43d1-8f19-eacfa7b97346	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c3-43d1-62d0-cc678a3e4a91	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3044 (class 0 OID 12205022)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55c3-43d3-b13f-bc699429051d	000e0000-55c3-43d3-5089-f4629eac5e75	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	0.00	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c3-43d2-6217-8f108580d8c2	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c3-43d3-1e18-841e9ea27410	000e0000-55c3-43d3-3db3-26d791e1494e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c3-43d2-a782-d9b32ac1f7db	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c3-43d3-f0f7-c26d76abd3d2	000e0000-55c3-43d3-e455-844e9b5d0c99	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c3-43d2-6217-8f108580d8c2	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c3-43d3-c0a5-5d24c46cf9a3	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c3-43d3-c9a7-e491c240e873	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 12204849)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c3-43d3-5289-9693e835715a	000e0000-55c3-43d3-3db3-26d791e1494e	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c3-43d2-8915-93fefbd59972
000d0000-55c3-43d3-5e1c-f99730666a5d	000e0000-55c3-43d3-3db3-26d791e1494e	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c3-43d2-8915-93fefbd59972
000d0000-55c3-43d3-3f56-97f04eb67145	000e0000-55c3-43d3-3db3-26d791e1494e	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c3-43d2-b99a-2a262fc67901
000d0000-55c3-43d3-2612-ed473c1d9e34	000e0000-55c3-43d3-3db3-26d791e1494e	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c3-43d2-4a58-743333103d97
000d0000-55c3-43d3-2ec4-5e4175ffffe1	000e0000-55c3-43d3-3db3-26d791e1494e	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c3-43d2-59c4-2aa7951b7d89
000d0000-55c3-43d3-0c64-229e2f8d2eac	000e0000-55c3-43d3-3db3-26d791e1494e	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c3-43d2-46f5-8cf98e70edbb
000d0000-55c3-43d3-6a79-8cc9227fab64	000e0000-55c3-43d3-3db3-26d791e1494e	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c3-43d2-8915-93fefbd59972
000d0000-55c3-43d3-834c-db17a82c4b72	000e0000-55c3-43d3-3db3-26d791e1494e	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c3-43d2-9fe8-b9bcfd9aa3f6
\.


--
-- TOC entry 3010 (class 0 OID 12204665)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 12204713)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 12204645)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c3-43d3-0bc6-ee43a1a70097	00080000-55c3-43d3-f9ab-19b4c9fd69d9	00090000-55c3-43d3-7657-359df9f985c0	AK		
\.


--
-- TOC entry 2985 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 12204766)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 12205233)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 12205245)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 12205268)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 12204791)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 12204602)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c3-43d1-115a-a110e714edae	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c3-43d1-a819-ed695fee82b2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c3-43d1-6697-cf66a81ff65d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c3-43d1-c7a4-1b9819432875	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c3-43d1-9f1e-eff8588738ee	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c3-43d1-1fc6-6ee8c6dfc543	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c3-43d1-f361-dee808ea7f7f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c3-43d1-2bd5-ee3777827ef0	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c3-43d1-fbb2-625267766b2e	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c3-43d1-cf6e-c5f0a11c8292	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c3-43d1-a923-67236b3d7b98	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c3-43d1-e1cf-8241f97458e2	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c3-43d1-7a39-604fedb8798a	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c3-43d1-f365-6c771fcaf054	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c3-43d3-a4b6-482e341ae292	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c3-43d3-8765-dca8fc8d7733	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c3-43d3-7f0d-b1d0f6f54e0e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c3-43d3-de9c-7abbc5323ab6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c3-43d3-0716-550164b365a7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c3-43d3-1f12-a0da3c61c08d	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2999 (class 0 OID 12204515)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c3-43d3-9351-5d37649e42b9	00000000-55c3-43d3-8765-dca8fc8d7733	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c3-43d3-0e10-f38df4d853c3	00000000-55c3-43d3-8765-dca8fc8d7733	00010000-55c3-43d1-4019-8061a430c6de	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c3-43d3-1937-8ec38ae48c7e	00000000-55c3-43d3-7f0d-b1d0f6f54e0e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3000 (class 0 OID 12204526)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c3-43d3-5823-3d6d03241fd5	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c3-43d3-bfdd-fb64ff6999b0	00010000-55c3-43d3-531d-d7bdb04910f7	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c3-43d3-6c4a-ce3ef2ba4cb2	00010000-55c3-43d3-0afa-a871ec5bb214	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c3-43d3-33e6-deee4bcc8696	00010000-55c3-43d3-fc80-85697a195ec6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c3-43d3-59ee-543eabb1e433	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c3-43d3-47b2-fcf5ac9c54b1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c3-43d3-10d8-d18f7a8896f7	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c3-43d3-c158-b22caee96c1f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c3-43d3-7657-359df9f985c0	00010000-55c3-43d3-231d-4ce1fb2a62aa	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c3-43d3-f3a7-e8f8b19ac4f6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c3-43d3-7e23-742bc5a52a76	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c3-43d3-831e-30cda918dc84	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c3-43d3-6938-96035b730f92	00010000-55c3-43d3-7200-a8fd93dc65a1	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 12204480)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c3-43d1-d45f-570f0742b2f4	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c3-43d1-5384-1bc13997505d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c3-43d1-1d91-90f1fae70216	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c3-43d1-c71b-98ef1ba92792	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c3-43d1-4af6-47c281adb92a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c3-43d1-bec8-d8e145fd1921	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c3-43d1-693f-21ac83c654f8	Abonma-read	Abonma - branje	f
00030000-55c3-43d1-9aa1-a22662bad554	Abonma-write	Abonma - spreminjanje	f
00030000-55c3-43d1-4b13-6d02ddb268cc	Alternacija-read	Alternacija - branje	f
00030000-55c3-43d1-0a84-15b66136f427	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c3-43d1-69e6-41477dc7a430	Arhivalija-read	Arhivalija - branje	f
00030000-55c3-43d1-ef80-bb4ff65e31b3	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c3-43d1-08bb-d6df3ff29849	Besedilo-read	Besedilo - branje	f
00030000-55c3-43d1-b141-3037ceb955e0	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c3-43d1-6cbb-0a7c5f9e5e06	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c3-43d1-82dc-d66689624df6	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c3-43d1-06b3-81360ddf6de2	Dogodek-read	Dogodek - branje	f
00030000-55c3-43d1-97a9-c5833612c28f	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c3-43d1-38b0-8d4ca3d59b53	DrugiVir-read	DrugiVir - branje	f
00030000-55c3-43d1-8ff6-ccad2e1f2713	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c3-43d1-06db-7fefef152159	Drzava-read	Drzava - branje	f
00030000-55c3-43d1-7b23-45ac70ade8ac	Drzava-write	Drzava - spreminjanje	f
00030000-55c3-43d1-6c33-d4c97daa7bdb	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c3-43d1-8b98-f4775f9c719d	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c3-43d1-8836-d091c58dc97f	Funkcija-read	Funkcija - branje	f
00030000-55c3-43d1-57c7-20aa1008fa99	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c3-43d1-cbfd-f960410b0f7d	Gostovanje-read	Gostovanje - branje	f
00030000-55c3-43d1-3f23-77303f0cf2b3	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c3-43d1-242c-f9da2de150be	Gostujoca-read	Gostujoca - branje	f
00030000-55c3-43d1-c376-368fb6c963aa	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c3-43d1-c1d7-0a0d375ddb1f	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c3-43d1-b2b8-71585817125e	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c3-43d1-c155-054454d55579	Kupec-read	Kupec - branje	f
00030000-55c3-43d1-b062-de6357b1be64	Kupec-write	Kupec - spreminjanje	f
00030000-55c3-43d1-61bb-1883caf35526	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c3-43d1-5c5e-c83e783eb5c7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c3-43d1-5274-e31eca62bcb9	Option-read	Option - branje	f
00030000-55c3-43d1-dd73-713435032ca7	Option-write	Option - spreminjanje	f
00030000-55c3-43d1-59db-2e3de64c2b01	OptionValue-read	OptionValue - branje	f
00030000-55c3-43d1-7945-2bd905ffca1d	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c3-43d1-61ed-d28e4684af51	Oseba-read	Oseba - branje	f
00030000-55c3-43d1-0faf-10e0f6aa8703	Oseba-write	Oseba - spreminjanje	f
00030000-55c3-43d1-ed6d-1a4469382979	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c3-43d1-0ea7-6c58f922aceb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c3-43d1-d1eb-bbd89462167e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c3-43d1-9005-8aad2299633f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c3-43d1-d509-c385826e4d75	Pogodba-read	Pogodba - branje	f
00030000-55c3-43d1-5cf2-a0a75405cc7d	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c3-43d1-362f-9a2d0a9ca402	Popa-read	Popa - branje	f
00030000-55c3-43d1-f13a-822f914e130d	Popa-write	Popa - spreminjanje	f
00030000-55c3-43d1-ae5e-827317fe13c0	Posta-read	Posta - branje	f
00030000-55c3-43d1-8bfe-6281c26a342f	Posta-write	Posta - spreminjanje	f
00030000-55c3-43d1-ee02-9e7657387415	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c3-43d1-3df1-e1a45e1f6c7b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c3-43d1-ad05-590bf3a18bb6	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c3-43d1-3193-304054229cce	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c3-43d1-e7db-cf8bf60be694	Predstava-read	Predstava - branje	f
00030000-55c3-43d1-c326-216b0c31ccd3	Predstava-write	Predstava - spreminjanje	f
00030000-55c3-43d1-2811-5b95f93b1135	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c3-43d1-bf67-1b058a166279	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c3-43d1-0da9-07fd3a7ca353	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c3-43d1-ac90-f3a4e224e46e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c3-43d1-e43d-b3df4d872efe	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c3-43d1-7b68-c22a852a1ac4	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c3-43d1-e072-a4a76c85b806	ProgramDela-read	ProgramDela - branje	f
00030000-55c3-43d1-d462-f36d51bf6a3c	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c3-43d1-72bc-4c4a7a7a862e	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c3-43d1-699e-c429f6a3d8de	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c3-43d1-6a2b-3c4c23680b7f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c3-43d1-ac90-0d302635a62b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c3-43d1-8726-d33b71a828cc	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c3-43d1-71fa-d9230016d601	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c3-43d1-ad53-ab52a0bc7cc1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c3-43d1-0c53-1b79b75b1cb5	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c3-43d1-4e65-2521128df465	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c3-43d1-84f9-ceb7b9b25791	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c3-43d1-3d74-92abbfd24438	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c3-43d1-d77b-cf3c69b3c958	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c3-43d1-0d90-6f19b2a83b3d	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c3-43d1-ee4b-b8d4c969ab10	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c3-43d1-a529-c75df80e7e65	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c3-43d1-6a62-16c78a5a022f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c3-43d1-565f-c6997b1a084c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c3-43d1-44d4-1f8b64b7adaa	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c3-43d1-3b28-bcc2ef167a5a	Prostor-read	Prostor - branje	f
00030000-55c3-43d1-06a4-7d77bbb77a8f	Prostor-write	Prostor - spreminjanje	f
00030000-55c3-43d1-16ac-27a84fc9e8fd	Racun-read	Racun - branje	f
00030000-55c3-43d1-a0f8-af249e4ba4aa	Racun-write	Racun - spreminjanje	f
00030000-55c3-43d1-cd09-5e5443e4f16d	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c3-43d1-0b49-7b79e0a78863	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c3-43d1-9363-35d2e19af6be	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c3-43d1-0b12-e932c3910bad	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c3-43d1-d468-683c4eb21525	Rekvizit-read	Rekvizit - branje	f
00030000-55c3-43d1-15eb-1804401380bc	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c3-43d1-fde4-c4b7aa3a70e0	Revizija-read	Revizija - branje	f
00030000-55c3-43d1-4a5e-47d9ffcfbe4f	Revizija-write	Revizija - spreminjanje	f
00030000-55c3-43d1-09a7-2e7b6551f367	Rezervacija-read	Rezervacija - branje	f
00030000-55c3-43d1-2874-44142ab7f085	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c3-43d1-f7f7-50e849361bc7	SedezniRed-read	SedezniRed - branje	f
00030000-55c3-43d1-4c40-662afa46362a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c3-43d1-351b-d7963febde01	Sedez-read	Sedez - branje	f
00030000-55c3-43d1-773c-532cd5a59ef6	Sedez-write	Sedez - spreminjanje	f
00030000-55c3-43d1-cf1d-244394e65a3b	Sezona-read	Sezona - branje	f
00030000-55c3-43d1-6a11-c46079d8ce84	Sezona-write	Sezona - spreminjanje	f
00030000-55c3-43d1-f0f8-eb4e59e59a2d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c3-43d1-1abb-0eef4b945771	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c3-43d1-65cb-82e89fa6cbd2	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c3-43d1-9a8b-0ff7bee4c18f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c3-43d1-859e-d1202956edb6	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c3-43d1-bbfb-7d4697b060fb	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c3-43d1-22af-07a815a200ec	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c3-43d1-a919-5ad4792b817d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c3-43d1-618a-51c1173ac118	Telefonska-read	Telefonska - branje	f
00030000-55c3-43d1-fdb1-0e14099e5834	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c3-43d1-007e-177922a8de45	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c3-43d1-ebac-c5a959846fde	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c3-43d1-d097-aa2ad66c18fd	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c3-43d1-bb72-9b730090552c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c3-43d1-6c0c-abfaf6b87b6e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c3-43d1-3797-430713cc946b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c3-43d1-72e4-58162d711f68	Trr-read	Trr - branje	f
00030000-55c3-43d1-2e68-135d3308253b	Trr-write	Trr - spreminjanje	f
00030000-55c3-43d1-8a59-d41ede0b59db	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c3-43d1-465e-6969bc0c141b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c3-43d1-1b5e-93ac682e57fd	Vaja-read	Vaja - branje	f
00030000-55c3-43d1-5557-13ecc569fd25	Vaja-write	Vaja - spreminjanje	f
00030000-55c3-43d1-4231-45d595a1e973	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c3-43d1-9c2b-9032ac0b6eb5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c3-43d1-8588-6e7147caa455	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c3-43d1-6ce7-0ab23d0a8ae6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c3-43d1-4ea8-3dd39910823e	Zasedenost-read	Zasedenost - branje	f
00030000-55c3-43d1-3c4b-32a3f3408ddc	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c3-43d1-7c37-02ae3166f1e7	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c3-43d1-c466-4cce03ce9897	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c3-43d1-4d50-06ff6c5733a3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c3-43d1-7990-39ef0046a81d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c3-43d1-5c17-74391eaf4bb1	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c3-43d1-a402-f0db310237f3	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c3-43d1-907e-86c440da9156	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c3-43d1-b6e1-3af39fdb45c2	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c3-43d1-9c3d-3318a4fb61a2	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c3-43d1-3a55-5c4318b030d4	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c3-43d1-a86a-4923ff3fa987	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c3-43d1-ff92-36f7bf0d0cec	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c3-43d1-43d6-9ea1b224ae51	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c3-43d1-5a21-068295f4145b	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c3-43d1-9bc3-9e5dccb7d084	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c3-43d1-d2e8-050709696b18	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2997 (class 0 OID 12204499)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c3-43d1-6cce-c86421bb1982	00030000-55c3-43d1-5384-1bc13997505d
00020000-55c3-43d1-e047-f9ba83144d55	00030000-55c3-43d1-06db-7fefef152159
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-693f-21ac83c654f8
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-9aa1-a22662bad554
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-4b13-6d02ddb268cc
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-0a84-15b66136f427
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-69e6-41477dc7a430
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-06b3-81360ddf6de2
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-c71b-98ef1ba92792
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-97a9-c5833612c28f
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-06db-7fefef152159
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-7b23-45ac70ade8ac
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-8836-d091c58dc97f
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-57c7-20aa1008fa99
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-cbfd-f960410b0f7d
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-3f23-77303f0cf2b3
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-242c-f9da2de150be
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-c376-368fb6c963aa
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-c1d7-0a0d375ddb1f
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-b2b8-71585817125e
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-5274-e31eca62bcb9
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-59db-2e3de64c2b01
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-61ed-d28e4684af51
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-0faf-10e0f6aa8703
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-362f-9a2d0a9ca402
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-f13a-822f914e130d
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-ae5e-827317fe13c0
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-8bfe-6281c26a342f
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-ad05-590bf3a18bb6
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-3193-304054229cce
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-e7db-cf8bf60be694
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-c326-216b0c31ccd3
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-e43d-b3df4d872efe
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-7b68-c22a852a1ac4
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-3b28-bcc2ef167a5a
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-06a4-7d77bbb77a8f
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-9363-35d2e19af6be
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-0b12-e932c3910bad
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-d468-683c4eb21525
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-15eb-1804401380bc
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-cf1d-244394e65a3b
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-6a11-c46079d8ce84
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-d097-aa2ad66c18fd
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-8a59-d41ede0b59db
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-465e-6969bc0c141b
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-1b5e-93ac682e57fd
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-5557-13ecc569fd25
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-4ea8-3dd39910823e
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-3c4b-32a3f3408ddc
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-7c37-02ae3166f1e7
00020000-55c3-43d1-5242-53658b940488	00030000-55c3-43d1-4d50-06ff6c5733a3
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-693f-21ac83c654f8
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-69e6-41477dc7a430
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-06b3-81360ddf6de2
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-06db-7fefef152159
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-cbfd-f960410b0f7d
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-242c-f9da2de150be
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-c1d7-0a0d375ddb1f
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-b2b8-71585817125e
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-5274-e31eca62bcb9
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-59db-2e3de64c2b01
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-61ed-d28e4684af51
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-0faf-10e0f6aa8703
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-362f-9a2d0a9ca402
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-ae5e-827317fe13c0
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-ad05-590bf3a18bb6
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-3193-304054229cce
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-e7db-cf8bf60be694
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-3b28-bcc2ef167a5a
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-9363-35d2e19af6be
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-d468-683c4eb21525
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-cf1d-244394e65a3b
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-618a-51c1173ac118
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-fdb1-0e14099e5834
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-72e4-58162d711f68
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-2e68-135d3308253b
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-8588-6e7147caa455
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-6ce7-0ab23d0a8ae6
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-7c37-02ae3166f1e7
00020000-55c3-43d1-9ec5-68f1425a4ef1	00030000-55c3-43d1-4d50-06ff6c5733a3
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-693f-21ac83c654f8
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-4b13-6d02ddb268cc
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-69e6-41477dc7a430
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-ef80-bb4ff65e31b3
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-08bb-d6df3ff29849
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-6cbb-0a7c5f9e5e06
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-06b3-81360ddf6de2
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-06db-7fefef152159
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-8836-d091c58dc97f
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-cbfd-f960410b0f7d
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-242c-f9da2de150be
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-c1d7-0a0d375ddb1f
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-5274-e31eca62bcb9
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-59db-2e3de64c2b01
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-61ed-d28e4684af51
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-362f-9a2d0a9ca402
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-ae5e-827317fe13c0
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-e7db-cf8bf60be694
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-e43d-b3df4d872efe
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-3b28-bcc2ef167a5a
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-9363-35d2e19af6be
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-d468-683c4eb21525
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-cf1d-244394e65a3b
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-d097-aa2ad66c18fd
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-1b5e-93ac682e57fd
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-4ea8-3dd39910823e
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-7c37-02ae3166f1e7
00020000-55c3-43d1-8ef5-5c65cb84092b	00030000-55c3-43d1-4d50-06ff6c5733a3
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-693f-21ac83c654f8
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-9aa1-a22662bad554
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-0a84-15b66136f427
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-69e6-41477dc7a430
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-06b3-81360ddf6de2
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-06db-7fefef152159
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-cbfd-f960410b0f7d
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-242c-f9da2de150be
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-5274-e31eca62bcb9
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-59db-2e3de64c2b01
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-362f-9a2d0a9ca402
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-ae5e-827317fe13c0
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-e7db-cf8bf60be694
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-3b28-bcc2ef167a5a
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-9363-35d2e19af6be
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-d468-683c4eb21525
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-cf1d-244394e65a3b
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-d097-aa2ad66c18fd
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-7c37-02ae3166f1e7
00020000-55c3-43d1-0b75-61c84503d5ee	00030000-55c3-43d1-4d50-06ff6c5733a3
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-693f-21ac83c654f8
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-69e6-41477dc7a430
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-06b3-81360ddf6de2
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-06db-7fefef152159
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-cbfd-f960410b0f7d
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-242c-f9da2de150be
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-5274-e31eca62bcb9
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-59db-2e3de64c2b01
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-362f-9a2d0a9ca402
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-ae5e-827317fe13c0
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-e7db-cf8bf60be694
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-3b28-bcc2ef167a5a
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-9363-35d2e19af6be
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-d468-683c4eb21525
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-cf1d-244394e65a3b
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-007e-177922a8de45
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-1d91-90f1fae70216
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-d097-aa2ad66c18fd
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-7c37-02ae3166f1e7
00020000-55c3-43d1-1882-51639f8457c6	00030000-55c3-43d1-4d50-06ff6c5733a3
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-d45f-570f0742b2f4
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-5384-1bc13997505d
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-1d91-90f1fae70216
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-c71b-98ef1ba92792
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-4af6-47c281adb92a
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-bec8-d8e145fd1921
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-693f-21ac83c654f8
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-9aa1-a22662bad554
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-4b13-6d02ddb268cc
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-0a84-15b66136f427
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-69e6-41477dc7a430
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-ef80-bb4ff65e31b3
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-08bb-d6df3ff29849
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-b141-3037ceb955e0
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-6cbb-0a7c5f9e5e06
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-82dc-d66689624df6
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-06b3-81360ddf6de2
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-97a9-c5833612c28f
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-06db-7fefef152159
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-7b23-45ac70ade8ac
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-38b0-8d4ca3d59b53
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-8ff6-ccad2e1f2713
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-6c33-d4c97daa7bdb
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-8b98-f4775f9c719d
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-8836-d091c58dc97f
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-57c7-20aa1008fa99
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-cbfd-f960410b0f7d
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-3f23-77303f0cf2b3
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-242c-f9da2de150be
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-c376-368fb6c963aa
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-c1d7-0a0d375ddb1f
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-b2b8-71585817125e
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-c155-054454d55579
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-b062-de6357b1be64
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-61bb-1883caf35526
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-5c5e-c83e783eb5c7
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-5274-e31eca62bcb9
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-dd73-713435032ca7
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-59db-2e3de64c2b01
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-7945-2bd905ffca1d
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-61ed-d28e4684af51
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-0faf-10e0f6aa8703
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-ed6d-1a4469382979
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-0ea7-6c58f922aceb
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-d1eb-bbd89462167e
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-9005-8aad2299633f
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-d509-c385826e4d75
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-5cf2-a0a75405cc7d
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-362f-9a2d0a9ca402
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-f13a-822f914e130d
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-ae5e-827317fe13c0
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-8bfe-6281c26a342f
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-ee02-9e7657387415
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-3df1-e1a45e1f6c7b
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-ad05-590bf3a18bb6
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-3193-304054229cce
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-e7db-cf8bf60be694
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-c326-216b0c31ccd3
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-2811-5b95f93b1135
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-bf67-1b058a166279
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-0da9-07fd3a7ca353
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-ac90-f3a4e224e46e
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-e43d-b3df4d872efe
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-7b68-c22a852a1ac4
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-e072-a4a76c85b806
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-d462-f36d51bf6a3c
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-72bc-4c4a7a7a862e
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-699e-c429f6a3d8de
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-6a2b-3c4c23680b7f
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-ac90-0d302635a62b
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-8726-d33b71a828cc
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-71fa-d9230016d601
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-ad53-ab52a0bc7cc1
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-0c53-1b79b75b1cb5
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-4e65-2521128df465
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-84f9-ceb7b9b25791
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-3d74-92abbfd24438
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-d77b-cf3c69b3c958
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-0d90-6f19b2a83b3d
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-ee4b-b8d4c969ab10
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-a529-c75df80e7e65
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-6a62-16c78a5a022f
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-565f-c6997b1a084c
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-44d4-1f8b64b7adaa
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-3b28-bcc2ef167a5a
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-06a4-7d77bbb77a8f
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-16ac-27a84fc9e8fd
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-a0f8-af249e4ba4aa
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-cd09-5e5443e4f16d
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-0b49-7b79e0a78863
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-9363-35d2e19af6be
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-0b12-e932c3910bad
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-d468-683c4eb21525
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-15eb-1804401380bc
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-fde4-c4b7aa3a70e0
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-4a5e-47d9ffcfbe4f
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-09a7-2e7b6551f367
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-2874-44142ab7f085
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-f7f7-50e849361bc7
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-4c40-662afa46362a
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-351b-d7963febde01
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-773c-532cd5a59ef6
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-cf1d-244394e65a3b
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-6a11-c46079d8ce84
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-f0f8-eb4e59e59a2d
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-1abb-0eef4b945771
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-65cb-82e89fa6cbd2
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-9a8b-0ff7bee4c18f
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-859e-d1202956edb6
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-bbfb-7d4697b060fb
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-22af-07a815a200ec
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-a919-5ad4792b817d
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-618a-51c1173ac118
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-fdb1-0e14099e5834
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-007e-177922a8de45
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-ebac-c5a959846fde
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-d097-aa2ad66c18fd
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-bb72-9b730090552c
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-6c0c-abfaf6b87b6e
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-3797-430713cc946b
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-72e4-58162d711f68
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-2e68-135d3308253b
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-8a59-d41ede0b59db
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-465e-6969bc0c141b
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-1b5e-93ac682e57fd
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-5557-13ecc569fd25
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-4231-45d595a1e973
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-9c2b-9032ac0b6eb5
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-8588-6e7147caa455
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-6ce7-0ab23d0a8ae6
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-4ea8-3dd39910823e
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-3c4b-32a3f3408ddc
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-7c37-02ae3166f1e7
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-c466-4cce03ce9897
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-4d50-06ff6c5733a3
00020000-55c3-43d3-b5ee-920a0417f0bb	00030000-55c3-43d1-7990-39ef0046a81d
\.


--
-- TOC entry 3025 (class 0 OID 12204798)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 12204829)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 12204943)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c3-43d3-d4f3-784e035e7940	00090000-55c3-43d3-5823-3d6d03241fd5	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c3-43d3-4eb5-6baf6d6ef559	00090000-55c3-43d3-47b2-fcf5ac9c54b1	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c3-43d3-7c26-94097e1c42f4	00090000-55c3-43d3-6938-96035b730f92	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3002 (class 0 OID 12204559)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c3-43d3-f9ab-19b4c9fd69d9	00040000-55c3-43d1-80ca-8f17a4d8f1e2	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-43d3-0d9e-ac3c0e7e3b93	00040000-55c3-43d1-80ca-8f17a4d8f1e2	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c3-43d3-3178-ca1318ceac99	00040000-55c3-43d1-80ca-8f17a4d8f1e2	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-43d3-4df7-c9b777722223	00040000-55c3-43d1-80ca-8f17a4d8f1e2	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-43d3-4591-1419f8205476	00040000-55c3-43d1-80ca-8f17a4d8f1e2	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-43d3-6570-6e028694ca9c	00040000-55c3-43d1-95c5-756dbece8b70	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-43d3-9df1-3e928974744f	00040000-55c3-43d1-69d8-dcbcbcc278ee	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-43d3-fe47-de5500a67914	00040000-55c3-43d1-83a5-c6be6f014f8e	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-43d3-1a06-1328b3d4670a	00040000-55c3-43d1-80ca-8f17a4d8f1e2	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3004 (class 0 OID 12204594)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c3-43d1-fa2c-8421adb50046	8341	Adlešiči
00050000-55c3-43d1-510f-3d3da279ee32	5270	Ajdovščina
00050000-55c3-43d1-26c6-7303bd8e9e39	6280	Ankaran/Ancarano
00050000-55c3-43d1-d7d9-3b8878440a64	9253	Apače
00050000-55c3-43d1-f9eb-b2e53a583e70	8253	Artiče
00050000-55c3-43d1-5acf-0b47e90d30ed	4275	Begunje na Gorenjskem
00050000-55c3-43d1-79da-5281cdfd36f7	1382	Begunje pri Cerknici
00050000-55c3-43d1-4457-d365d18163a8	9231	Beltinci
00050000-55c3-43d1-5b9a-e543e06d78b0	2234	Benedikt
00050000-55c3-43d1-17dd-bba931f63a91	2345	Bistrica ob Dravi
00050000-55c3-43d1-2bca-a931f9cde541	3256	Bistrica ob Sotli
00050000-55c3-43d1-cb91-03a85a180d30	8259	Bizeljsko
00050000-55c3-43d1-b1c3-1aa3888cc13b	1223	Blagovica
00050000-55c3-43d1-1e13-1441f87a77fe	8283	Blanca
00050000-55c3-43d1-4c84-b4eb18e02f13	4260	Bled
00050000-55c3-43d1-c447-ea7a90ce600a	4273	Blejska Dobrava
00050000-55c3-43d1-98cd-0a10d0f0cefa	9265	Bodonci
00050000-55c3-43d1-0377-9e960d0429ea	9222	Bogojina
00050000-55c3-43d1-d2b3-f5538414ee71	4263	Bohinjska Bela
00050000-55c3-43d1-1130-704052b052f5	4264	Bohinjska Bistrica
00050000-55c3-43d1-e16b-fdff5d017b6f	4265	Bohinjsko jezero
00050000-55c3-43d1-42a9-2ec99351dfd9	1353	Borovnica
00050000-55c3-43d1-8ce6-e6d8a43d7219	8294	Boštanj
00050000-55c3-43d1-c8a3-127afa038953	5230	Bovec
00050000-55c3-43d1-45ef-c1e49a7dc998	5295	Branik
00050000-55c3-43d1-688f-1c16dc160967	3314	Braslovče
00050000-55c3-43d1-d2ab-2a0593ad5e44	5223	Breginj
00050000-55c3-43d1-9944-1984de681721	8280	Brestanica
00050000-55c3-43d1-5f16-f16d12f08c28	2354	Bresternica
00050000-55c3-43d1-0859-1b9e446d0d34	4243	Brezje
00050000-55c3-43d1-7d28-c8d7087a9703	1351	Brezovica pri Ljubljani
00050000-55c3-43d1-56ab-455983c2c90e	8250	Brežice
00050000-55c3-43d1-50cb-5c2c7f5ad617	4210	Brnik - Aerodrom
00050000-55c3-43d1-bd31-0fa4a77ec655	8321	Brusnice
00050000-55c3-43d1-831a-00ca54cace4b	3255	Buče
00050000-55c3-43d1-3551-7b833ec59c14	8276	Bučka 
00050000-55c3-43d1-c36d-c97c76a61d84	9261	Cankova
00050000-55c3-43d1-ab76-8db3c86ecd47	3000	Celje 
00050000-55c3-43d1-4b15-012f650ed212	3001	Celje - poštni predali
00050000-55c3-43d1-4a89-4c469db30a62	4207	Cerklje na Gorenjskem
00050000-55c3-43d1-987a-15568afdd17f	8263	Cerklje ob Krki
00050000-55c3-43d1-0625-d08600a5c8fd	1380	Cerknica
00050000-55c3-43d1-ab37-6b6dd63c2adc	5282	Cerkno
00050000-55c3-43d1-d755-0fe727fdb3b8	2236	Cerkvenjak
00050000-55c3-43d1-1cb6-6808652e74f2	2215	Ceršak
00050000-55c3-43d1-6418-17f9b553daf3	2326	Cirkovce
00050000-55c3-43d1-24ed-830ae7640202	2282	Cirkulane
00050000-55c3-43d1-ad53-cdece8ebb179	5273	Col
00050000-55c3-43d1-adbd-c0e3b13d3f8e	8251	Čatež ob Savi
00050000-55c3-43d1-086e-3f7f8cea8871	1413	Čemšenik
00050000-55c3-43d2-583d-7a16add56610	5253	Čepovan
00050000-55c3-43d2-d0d7-cb3e218379ea	9232	Črenšovci
00050000-55c3-43d2-e193-cab12dba2e56	2393	Črna na Koroškem
00050000-55c3-43d2-2894-7aca511b71f1	6275	Črni Kal
00050000-55c3-43d2-7b0c-894f15aa741e	5274	Črni Vrh nad Idrijo
00050000-55c3-43d2-563d-da30c6dabe61	5262	Črniče
00050000-55c3-43d2-af1b-42d22aa083d9	8340	Črnomelj
00050000-55c3-43d2-51a7-e0e715713876	6271	Dekani
00050000-55c3-43d2-c843-85ae92a312b1	5210	Deskle
00050000-55c3-43d2-11b7-709120b5c646	2253	Destrnik
00050000-55c3-43d2-afc3-745650d1e429	6215	Divača
00050000-55c3-43d2-c147-7110c562dd0b	1233	Dob
00050000-55c3-43d2-e575-cc3cdea30da9	3224	Dobje pri Planini
00050000-55c3-43d2-639a-cdc375db1182	8257	Dobova
00050000-55c3-43d2-a3da-9d2c2a75d072	1423	Dobovec
00050000-55c3-43d2-5850-ee6ee4915b65	5263	Dobravlje
00050000-55c3-43d2-3159-5f4f08d26fc8	3204	Dobrna
00050000-55c3-43d2-3653-fcd88375ac61	8211	Dobrnič
00050000-55c3-43d2-a6b9-a5ed1bd692c5	1356	Dobrova
00050000-55c3-43d2-6829-57e2388ae42f	9223	Dobrovnik/Dobronak 
00050000-55c3-43d2-9fc3-816e4a7bc521	5212	Dobrovo v Brdih
00050000-55c3-43d2-7a94-ad355f7c973e	1431	Dol pri Hrastniku
00050000-55c3-43d2-0a44-48d32d6fb7db	1262	Dol pri Ljubljani
00050000-55c3-43d2-c8cc-739c7bedb3d6	1273	Dole pri Litiji
00050000-55c3-43d2-57b0-e01fd6c3f686	1331	Dolenja vas
00050000-55c3-43d2-a44b-3b725aca4fca	8350	Dolenjske Toplice
00050000-55c3-43d2-3885-22f6952760a5	1230	Domžale
00050000-55c3-43d2-7693-6e0389a08cd4	2252	Dornava
00050000-55c3-43d2-f57a-2207f8305b19	5294	Dornberk
00050000-55c3-43d2-3a72-21c232dd0495	1319	Draga
00050000-55c3-43d2-1b94-95f9f8e42730	8343	Dragatuš
00050000-55c3-43d2-f21f-bb0d083839b3	3222	Dramlje
00050000-55c3-43d2-f274-cceca014e8d5	2370	Dravograd
00050000-55c3-43d2-dc8d-52f27e1ef76a	4203	Duplje
00050000-55c3-43d2-7cbb-776eae3d25f7	6221	Dutovlje
00050000-55c3-43d2-bc53-0bd6da5f357e	8361	Dvor
00050000-55c3-43d2-36ad-3512aafce62e	2343	Fala
00050000-55c3-43d2-201b-fafe322c5c92	9208	Fokovci
00050000-55c3-43d2-a7d4-a3713b2cabb9	2313	Fram
00050000-55c3-43d2-33dd-9f5c6ce750e0	3213	Frankolovo
00050000-55c3-43d2-82c5-9ec9a406a44b	1274	Gabrovka
00050000-55c3-43d2-8011-c59353613827	8254	Globoko
00050000-55c3-43d2-035b-d51385273fe5	5275	Godovič
00050000-55c3-43d2-9119-890633b9a293	4204	Golnik
00050000-55c3-43d2-4a4d-79e60fcb1e65	3303	Gomilsko
00050000-55c3-43d2-2476-c86888db60c8	4224	Gorenja vas
00050000-55c3-43d2-a763-4368e1cd3d53	3263	Gorica pri Slivnici
00050000-55c3-43d2-7157-d3acba504781	2272	Gorišnica
00050000-55c3-43d2-1d0b-58643a698d27	9250	Gornja Radgona
00050000-55c3-43d2-551f-5d71187b0d36	3342	Gornji Grad
00050000-55c3-43d2-7e9b-78200b334118	4282	Gozd Martuljek
00050000-55c3-43d2-0d66-e3fbeadc350f	6272	Gračišče
00050000-55c3-43d2-d83d-f200e8dcea63	9264	Grad
00050000-55c3-43d2-2366-164c2d0b420f	8332	Gradac
00050000-55c3-43d2-6d0d-5ea14c1f2278	1384	Grahovo
00050000-55c3-43d2-605d-72137a5f7c12	5242	Grahovo ob Bači
00050000-55c3-43d2-3277-fdc7b9309a39	5251	Grgar
00050000-55c3-43d2-c413-c996e71bbc18	3302	Griže
00050000-55c3-43d2-7390-aae178f7a695	3231	Grobelno
00050000-55c3-43d2-f8a4-845d039382d4	1290	Grosuplje
00050000-55c3-43d2-fe34-e7ae2874a67a	2288	Hajdina
00050000-55c3-43d2-9938-a1d1d3418d69	8362	Hinje
00050000-55c3-43d2-09fd-8686339a54d2	2311	Hoče
00050000-55c3-43d2-b735-207245eb4347	9205	Hodoš/Hodos
00050000-55c3-43d2-60df-26993044330c	1354	Horjul
00050000-55c3-43d2-a5ff-e11f0ac5d794	1372	Hotedršica
00050000-55c3-43d2-4b2c-50252b3a2fce	1430	Hrastnik
00050000-55c3-43d2-7bd1-16f38edf49ea	6225	Hruševje
00050000-55c3-43d2-ab93-d7c66c32b121	4276	Hrušica
00050000-55c3-43d2-329a-5d84562b75ac	5280	Idrija
00050000-55c3-43d2-8a89-2420d71d52de	1292	Ig
00050000-55c3-43d2-febe-fb159f8d8694	6250	Ilirska Bistrica
00050000-55c3-43d2-85e1-e6c3bbce39b6	6251	Ilirska Bistrica-Trnovo
00050000-55c3-43d2-3534-fa201e6cad78	1295	Ivančna Gorica
00050000-55c3-43d2-a5c7-702688011612	2259	Ivanjkovci
00050000-55c3-43d2-0d6d-0746c0b544df	1411	Izlake
00050000-55c3-43d2-0417-4bb71a882188	6310	Izola/Isola
00050000-55c3-43d2-08ff-4cc7bd30c204	2222	Jakobski Dol
00050000-55c3-43d2-07b6-0ff5d32e54ad	2221	Jarenina
00050000-55c3-43d2-42c4-c6dbac810a12	6254	Jelšane
00050000-55c3-43d2-ff73-536c5d1ca2a0	4270	Jesenice
00050000-55c3-43d2-acfa-8ee3c744e04c	8261	Jesenice na Dolenjskem
00050000-55c3-43d2-b756-55573dd96a31	3273	Jurklošter
00050000-55c3-43d2-3f83-655478b624fc	2223	Jurovski Dol
00050000-55c3-43d2-99c6-3a549e31fa74	2256	Juršinci
00050000-55c3-43d2-3bef-fc4383c2d6f9	5214	Kal nad Kanalom
00050000-55c3-43d2-18bf-94039da2410d	3233	Kalobje
00050000-55c3-43d2-1269-cdc1384e25a2	4246	Kamna Gorica
00050000-55c3-43d2-26c0-b229a390cef1	2351	Kamnica
00050000-55c3-43d2-fcba-a66ef7840390	1241	Kamnik
00050000-55c3-43d2-97df-fd2a4ea4649c	5213	Kanal
00050000-55c3-43d2-c188-5f5f4b374289	8258	Kapele
00050000-55c3-43d2-3a03-30adab94302a	2362	Kapla
00050000-55c3-43d2-2165-9279952a0e3b	2325	Kidričevo
00050000-55c3-43d2-1eda-7b5b2a4a506d	1412	Kisovec
00050000-55c3-43d2-9428-ad05b95167af	6253	Knežak
00050000-55c3-43d2-79e6-d8abe68d9601	5222	Kobarid
00050000-55c3-43d2-3730-3b51a2f91fda	9227	Kobilje
00050000-55c3-43d2-eb80-26e9a087f718	1330	Kočevje
00050000-55c3-43d2-00cb-bbc5eb6892b5	1338	Kočevska Reka
00050000-55c3-43d2-02b5-7d7d9bb54f99	2276	Kog
00050000-55c3-43d2-8df4-909c67d377bf	5211	Kojsko
00050000-55c3-43d2-2141-6cac887f8ba6	6223	Komen
00050000-55c3-43d2-fa39-2b6afe523252	1218	Komenda
00050000-55c3-43d2-116a-175848b5f562	6000	Koper/Capodistria 
00050000-55c3-43d2-248f-e01c4b98bd08	6001	Koper/Capodistria - poštni predali
00050000-55c3-43d2-d6eb-6341ec55d231	8282	Koprivnica
00050000-55c3-43d2-1c51-da2a804ba920	5296	Kostanjevica na Krasu
00050000-55c3-43d2-7bcf-850551b57a94	8311	Kostanjevica na Krki
00050000-55c3-43d2-593d-82f9ca89b2ad	1336	Kostel
00050000-55c3-43d2-9559-1b24b05809c6	6256	Košana
00050000-55c3-43d2-6749-470f9dfe80df	2394	Kotlje
00050000-55c3-43d2-637d-397b941e6ef9	6240	Kozina
00050000-55c3-43d2-2ee9-1bb6da706034	3260	Kozje
00050000-55c3-43d2-df9b-7b9326508513	4000	Kranj 
00050000-55c3-43d2-be7b-7d4d42cdf825	4001	Kranj - poštni predali
00050000-55c3-43d2-0d42-b9eb00bfc14b	4280	Kranjska Gora
00050000-55c3-43d2-ca3e-5d0a9be707c4	1281	Kresnice
00050000-55c3-43d2-d96c-152647765d5c	4294	Križe
00050000-55c3-43d2-48d5-849c411bf245	9206	Križevci
00050000-55c3-43d2-b6d9-5bc901e6e20c	9242	Križevci pri Ljutomeru
00050000-55c3-43d2-48c5-b6287912f8f9	1301	Krka
00050000-55c3-43d2-6cf6-b0c7654ba8c9	8296	Krmelj
00050000-55c3-43d2-fa8f-5764735926fc	4245	Kropa
00050000-55c3-43d2-f6e2-6805c7a4050b	8262	Krška vas
00050000-55c3-43d2-26e6-b6edbca40e48	8270	Krško
00050000-55c3-43d2-a36e-1ab50339595e	9263	Kuzma
00050000-55c3-43d2-09be-5b4fba5e7a7d	2318	Laporje
00050000-55c3-43d2-9606-f3958bafc75c	3270	Laško
00050000-55c3-43d2-715a-dafd0a037c03	1219	Laze v Tuhinju
00050000-55c3-43d2-b1b1-ebc577615bfc	2230	Lenart v Slovenskih goricah
00050000-55c3-43d2-9d12-89b9f45287d6	9220	Lendava/Lendva
00050000-55c3-43d2-bf20-faeffeeacae8	4248	Lesce
00050000-55c3-43d2-cde6-a1a184b58b3b	3261	Lesično
00050000-55c3-43d2-ab22-3e0d6e994309	8273	Leskovec pri Krškem
00050000-55c3-43d2-2465-4be97417e7ba	2372	Libeliče
00050000-55c3-43d2-fc61-54d748ba5133	2341	Limbuš
00050000-55c3-43d2-bac4-2e709affb279	1270	Litija
00050000-55c3-43d2-cc74-bfd972fc1997	3202	Ljubečna
00050000-55c3-43d2-eca4-29c3a132a2c3	1000	Ljubljana 
00050000-55c3-43d2-bffd-56dc46099476	1001	Ljubljana - poštni predali
00050000-55c3-43d2-fbaa-5237ff38d652	1231	Ljubljana - Črnuče
00050000-55c3-43d2-52aa-5ea07f49695b	1261	Ljubljana - Dobrunje
00050000-55c3-43d2-7cfc-1ba8e1de17e5	1260	Ljubljana - Polje
00050000-55c3-43d2-b51c-06f083a6e59d	1210	Ljubljana - Šentvid
00050000-55c3-43d2-8f6c-87fc761e23ce	1211	Ljubljana - Šmartno
00050000-55c3-43d2-89a9-1b3821a44f80	3333	Ljubno ob Savinji
00050000-55c3-43d2-9aeb-974ed299eafa	9240	Ljutomer
00050000-55c3-43d2-3abc-4ed6a5a1d8fa	3215	Loče
00050000-55c3-43d2-2138-a3c1535da026	5231	Log pod Mangartom
00050000-55c3-43d2-93f7-d928a1c49e0b	1358	Log pri Brezovici
00050000-55c3-43d2-a878-8da3e366ed21	1370	Logatec
00050000-55c3-43d2-c1bb-03ccf2e2329c	1371	Logatec
00050000-55c3-43d2-9f94-f136c4863cd1	1434	Loka pri Zidanem Mostu
00050000-55c3-43d2-fe74-ee4562c960b8	3223	Loka pri Žusmu
00050000-55c3-43d2-97bf-71df97a93da3	6219	Lokev
00050000-55c3-43d2-3d8d-35b4089e38f0	1318	Loški Potok
00050000-55c3-43d2-42cd-3ea53240c841	2324	Lovrenc na Dravskem polju
00050000-55c3-43d2-5389-5ef04a618e67	2344	Lovrenc na Pohorju
00050000-55c3-43d2-7a49-f9886da728d1	3334	Luče
00050000-55c3-43d2-8b3c-824a4f74a5dc	1225	Lukovica
00050000-55c3-43d2-6759-1418cf2a8497	9202	Mačkovci
00050000-55c3-43d2-1200-e3b967f84f81	2322	Majšperk
00050000-55c3-43d2-b16b-b3fad6e71eac	2321	Makole
00050000-55c3-43d2-f4b6-da032f5a97dc	9243	Mala Nedelja
00050000-55c3-43d2-707d-9206a9bd0025	2229	Malečnik
00050000-55c3-43d2-ceab-fcc6e892863c	6273	Marezige
00050000-55c3-43d2-0cb5-7354a2853cb0	2000	Maribor 
00050000-55c3-43d2-07a3-4b9640ca36bb	2001	Maribor - poštni predali
00050000-55c3-43d2-f671-8696e58b4fa3	2206	Marjeta na Dravskem polju
00050000-55c3-43d2-abf6-bc56729793c4	2281	Markovci
00050000-55c3-43d2-502f-ef58f88778a9	9221	Martjanci
00050000-55c3-43d2-b920-54097b7c6365	6242	Materija
00050000-55c3-43d2-d5ae-5c559fb1fa0d	4211	Mavčiče
00050000-55c3-43d2-3f4c-e8d52024950c	1215	Medvode
00050000-55c3-43d2-02a7-c22ecbefcf49	1234	Mengeš
00050000-55c3-43d2-101d-1b969a252e04	8330	Metlika
00050000-55c3-43d2-fed4-1bee5b60466d	2392	Mežica
00050000-55c3-43d2-dfa2-2cf868ad11e9	2204	Miklavž na Dravskem polju
00050000-55c3-43d2-502e-7268db0457d7	2275	Miklavž pri Ormožu
00050000-55c3-43d2-f93f-a86966839f5a	5291	Miren
00050000-55c3-43d2-d465-6c68074a060c	8233	Mirna
00050000-55c3-43d2-2b9b-4a136cd96b28	8216	Mirna Peč
00050000-55c3-43d2-459b-f05fd074a20c	2382	Mislinja
00050000-55c3-43d2-06cc-668d0db0c531	4281	Mojstrana
00050000-55c3-43d2-8309-23c8bae62662	8230	Mokronog
00050000-55c3-43d2-63ec-b2757123db46	1251	Moravče
00050000-55c3-43d2-7aad-dd3ed368b639	9226	Moravske Toplice
00050000-55c3-43d2-942b-726d842256a5	5216	Most na Soči
00050000-55c3-43d2-63a3-b5ff3bdb8125	1221	Motnik
00050000-55c3-43d2-884d-550bca511e76	3330	Mozirje
00050000-55c3-43d2-f506-7ed232ca883d	9000	Murska Sobota 
00050000-55c3-43d2-7d89-030042501608	9001	Murska Sobota - poštni predali
00050000-55c3-43d2-6bc3-4c5a122d168a	2366	Muta
00050000-55c3-43d2-8dbd-2d58f0b335bb	4202	Naklo
00050000-55c3-43d2-5b14-1ebd08aa90dd	3331	Nazarje
00050000-55c3-43d2-f796-a93c5906bde8	1357	Notranje Gorice
00050000-55c3-43d2-2827-4f30158a9517	3203	Nova Cerkev
00050000-55c3-43d2-7c75-e39f3449f3fa	5000	Nova Gorica 
00050000-55c3-43d2-2485-1c281e898100	5001	Nova Gorica - poštni predali
00050000-55c3-43d2-d246-3b7f3fa82555	1385	Nova vas
00050000-55c3-43d2-25bb-42803d4ae856	8000	Novo mesto
00050000-55c3-43d2-e233-63a3534e66eb	8001	Novo mesto - poštni predali
00050000-55c3-43d2-4e60-a373df901495	6243	Obrov
00050000-55c3-43d2-7a23-e1ec4d10da6a	9233	Odranci
00050000-55c3-43d2-9044-58f144078d75	2317	Oplotnica
00050000-55c3-43d2-8ef5-622b6cc488ba	2312	Orehova vas
00050000-55c3-43d2-24f1-ae4b1e4bd68c	2270	Ormož
00050000-55c3-43d2-0b61-45ac65ba3a8f	1316	Ortnek
00050000-55c3-43d2-4497-591e5cd5dd2d	1337	Osilnica
00050000-55c3-43d2-eb6f-3bc1c3d7a24c	8222	Otočec
00050000-55c3-43d2-b9ec-3e729c8e87ba	2361	Ožbalt
00050000-55c3-43d2-55ff-4f4d220353db	2231	Pernica
00050000-55c3-43d2-ba3a-ea05a41e772f	2211	Pesnica pri Mariboru
00050000-55c3-43d2-83e9-c90fa875a41a	9203	Petrovci
00050000-55c3-43d2-3573-020363400338	3301	Petrovče
00050000-55c3-43d2-433f-e34975c0693e	6330	Piran/Pirano
00050000-55c3-43d2-0ef5-c813dd45dc2d	8255	Pišece
00050000-55c3-43d2-9964-4d99a8f1aeb1	6257	Pivka
00050000-55c3-43d2-1746-0696765425de	6232	Planina
00050000-55c3-43d2-049f-46d252b2537a	3225	Planina pri Sevnici
00050000-55c3-43d2-e1bd-02c35ca1d06b	6276	Pobegi
00050000-55c3-43d2-1a62-45ab1385d73a	8312	Podbočje
00050000-55c3-43d2-999b-39c8185568bb	5243	Podbrdo
00050000-55c3-43d2-87d1-f817b1c93caa	3254	Podčetrtek
00050000-55c3-43d2-d028-2a2aebfcb0d6	2273	Podgorci
00050000-55c3-43d2-4285-a6fe96daeebb	6216	Podgorje
00050000-55c3-43d2-576b-e73ef518f6f5	2381	Podgorje pri Slovenj Gradcu
00050000-55c3-43d2-cc06-be27791bb870	6244	Podgrad
00050000-55c3-43d2-7eea-d5cd6bbfad2a	1414	Podkum
00050000-55c3-43d2-5e6b-bdc885d6b9e4	2286	Podlehnik
00050000-55c3-43d2-67a1-559e558e7965	5272	Podnanos
00050000-55c3-43d2-38f7-da99566ec753	4244	Podnart
00050000-55c3-43d2-ee9e-531a30f1c214	3241	Podplat
00050000-55c3-43d2-304f-aeb89848b7c1	3257	Podsreda
00050000-55c3-43d2-8b18-2e7932eb0c7c	2363	Podvelka
00050000-55c3-43d2-2cd8-538d58398e96	2208	Pohorje
00050000-55c3-43d2-628a-30bc573f0445	2257	Polenšak
00050000-55c3-43d2-3832-e0aa55e621cc	1355	Polhov Gradec
00050000-55c3-43d2-fa75-3beca96e3547	4223	Poljane nad Škofjo Loko
00050000-55c3-43d2-ac01-702f5e1e490c	2319	Poljčane
00050000-55c3-43d2-52ee-b81521ecd240	1272	Polšnik
00050000-55c3-43d2-0538-7da552952d7d	3313	Polzela
00050000-55c3-43d2-eb29-74f7a6982b50	3232	Ponikva
00050000-55c3-43d2-7cd2-2764b8d19c51	6320	Portorož/Portorose
00050000-55c3-43d2-c3b6-68cdfde37191	6230	Postojna
00050000-55c3-43d2-a6e4-375956dd7dd5	2331	Pragersko
00050000-55c3-43d2-a932-375570dde727	3312	Prebold
00050000-55c3-43d2-87df-bf431c8ae06a	4205	Preddvor
00050000-55c3-43d2-4331-b43dd5eab294	6255	Prem
00050000-55c3-43d2-84da-3b1f4de343e3	1352	Preserje
00050000-55c3-43d2-ce52-60c5b8bf8330	6258	Prestranek
00050000-55c3-43d2-65f9-2fc436da79b7	2391	Prevalje
00050000-55c3-43d2-3a4b-1d99717ceaa6	3262	Prevorje
00050000-55c3-43d2-4580-debf6702bbb5	1276	Primskovo 
00050000-55c3-43d2-b05b-0483e9ee824d	3253	Pristava pri Mestinju
00050000-55c3-43d2-7931-fd8c1580f45f	9207	Prosenjakovci/Partosfalva
00050000-55c3-43d2-0543-ba7aefb63342	5297	Prvačina
00050000-55c3-43d2-819d-fd34adfeab24	2250	Ptuj
00050000-55c3-43d2-0bb4-a383056f7139	2323	Ptujska Gora
00050000-55c3-43d2-055a-c7c80040603b	9201	Puconci
00050000-55c3-43d2-b1b8-a1195aea397d	2327	Rače
00050000-55c3-43d2-ccc1-8a11d0d1a3d2	1433	Radeče
00050000-55c3-43d2-022e-594909faa465	9252	Radenci
00050000-55c3-43d2-e750-6e893a757f34	2360	Radlje ob Dravi
00050000-55c3-43d2-96bf-5f894a9b861a	1235	Radomlje
00050000-55c3-43d2-1a01-b0e202c68174	4240	Radovljica
00050000-55c3-43d2-835c-64f3790eb379	8274	Raka
00050000-55c3-43d2-11a6-a68eb3b68e03	1381	Rakek
00050000-55c3-43d2-8cf0-48bb15308327	4283	Rateče - Planica
00050000-55c3-43d2-3593-06757afb5bff	2390	Ravne na Koroškem
00050000-55c3-43d2-9038-3c783cadc3d4	9246	Razkrižje
00050000-55c3-43d2-63a9-9ffeff42c6df	3332	Rečica ob Savinji
00050000-55c3-43d2-2b20-587e54fc77a8	5292	Renče
00050000-55c3-43d2-8992-21d570bd8b6f	1310	Ribnica
00050000-55c3-43d2-a1a3-8e10ab1ce9f2	2364	Ribnica na Pohorju
00050000-55c3-43d2-5d46-fc3608b79ff4	3272	Rimske Toplice
00050000-55c3-43d2-585b-9890c43c5841	1314	Rob
00050000-55c3-43d2-b76f-8ca683f6db9f	5215	Ročinj
00050000-55c3-43d2-f1c9-aa849fcdc3ec	3250	Rogaška Slatina
00050000-55c3-43d2-91a4-cebd604cdbd1	9262	Rogašovci
00050000-55c3-43d2-e54f-23414e46e1d4	3252	Rogatec
00050000-55c3-43d2-e487-0602d6125dbd	1373	Rovte
00050000-55c3-43d2-4df4-ed6b228ff634	2342	Ruše
00050000-55c3-43d2-920e-f090e9d24a11	1282	Sava
00050000-55c3-43d2-e465-c923fe806205	6333	Sečovlje/Sicciole
00050000-55c3-43d2-2ab1-bcf9c2714e7c	4227	Selca
00050000-55c3-43d2-308d-d4579824df44	2352	Selnica ob Dravi
00050000-55c3-43d2-4f59-4dd2b7a6668a	8333	Semič
00050000-55c3-43d2-ed2f-1bc21e676da6	8281	Senovo
00050000-55c3-43d2-0758-496f9cba14b6	6224	Senožeče
00050000-55c3-43d2-4ea7-1f9bfcf822e1	8290	Sevnica
00050000-55c3-43d2-0e87-ae12a02ed604	6210	Sežana
00050000-55c3-43d2-3451-055328dd7f80	2214	Sladki Vrh
00050000-55c3-43d2-d399-5043d7fe0776	5283	Slap ob Idrijci
00050000-55c3-43d2-cb06-07cb4edcc9f2	2380	Slovenj Gradec
00050000-55c3-43d2-0eff-b6d6fe7c31a9	2310	Slovenska Bistrica
00050000-55c3-43d2-7468-1e9b3cf35914	3210	Slovenske Konjice
00050000-55c3-43d2-30bb-507982f4e1e8	1216	Smlednik
00050000-55c3-43d2-cd41-3ddd0620767c	5232	Soča
00050000-55c3-43d2-4e69-decfcc433ff8	1317	Sodražica
00050000-55c3-43d2-e18d-49c04e3612c2	3335	Solčava
00050000-55c3-43d2-0685-14c31b588f8f	5250	Solkan
00050000-55c3-43d2-b7c3-5ff0181764b0	4229	Sorica
00050000-55c3-43d2-4e3d-017b3223dade	4225	Sovodenj
00050000-55c3-43d2-01dc-5ca9c0fb413c	5281	Spodnja Idrija
00050000-55c3-43d2-aab2-4c65b5a420cc	2241	Spodnji Duplek
00050000-55c3-43d2-29a1-1eddfbcd01ac	9245	Spodnji Ivanjci
00050000-55c3-43d2-d4a2-1aedbe6d9326	2277	Središče ob Dravi
00050000-55c3-43d2-27c9-e663bb1b3a57	4267	Srednja vas v Bohinju
00050000-55c3-43d2-a762-8d7d17b9c8e5	8256	Sromlje 
00050000-55c3-43d2-3720-a55643479d3e	5224	Srpenica
00050000-55c3-43d2-0e82-281f35410b68	1242	Stahovica
00050000-55c3-43d2-10e7-182b2b6d0a99	1332	Stara Cerkev
00050000-55c3-43d2-1d30-9d73a0a8f650	8342	Stari trg ob Kolpi
00050000-55c3-43d2-777e-56557bdfaff0	1386	Stari trg pri Ložu
00050000-55c3-43d2-0997-dde9bdc61736	2205	Starše
00050000-55c3-43d2-1cd3-d10b7e7452ce	2289	Stoperce
00050000-55c3-43d2-d355-9faa0839f84e	8322	Stopiče
00050000-55c3-43d2-7626-fe6ec1a74f76	3206	Stranice
00050000-55c3-43d2-30d6-762d665dea59	8351	Straža
00050000-55c3-43d2-8286-29f2962ca49c	1313	Struge
00050000-55c3-43d2-24f3-85c009000fad	8293	Studenec
00050000-55c3-43d2-f838-971cd665beea	8331	Suhor
00050000-55c3-43d2-6a60-a14b73a52b98	2233	Sv. Ana v Slovenskih goricah
00050000-55c3-43d2-6c78-9d427ebb6d22	2235	Sv. Trojica v Slovenskih goricah
00050000-55c3-43d2-0d07-dba2c3ca030a	2353	Sveti Duh na Ostrem Vrhu
00050000-55c3-43d2-f93e-58d7d6989a08	9244	Sveti Jurij ob Ščavnici
00050000-55c3-43d2-a143-2c180bbb0b6d	3264	Sveti Štefan
00050000-55c3-43d2-2b3a-ca16074b7aa4	2258	Sveti Tomaž
00050000-55c3-43d2-7b1d-558d1376158a	9204	Šalovci
00050000-55c3-43d2-546a-026a6136ba1b	5261	Šempas
00050000-55c3-43d2-a8b6-5959ba0e5087	5290	Šempeter pri Gorici
00050000-55c3-43d2-c4b3-1cabbe89e058	3311	Šempeter v Savinjski dolini
00050000-55c3-43d2-44c8-ac31e15f3f65	4208	Šenčur
00050000-55c3-43d2-dd19-4fe44d816e40	2212	Šentilj v Slovenskih goricah
00050000-55c3-43d2-fe3c-2d77c904b1a1	8297	Šentjanž
00050000-55c3-43d2-a2e7-4429b1601b26	2373	Šentjanž pri Dravogradu
00050000-55c3-43d2-9958-20edc011fc37	8310	Šentjernej
00050000-55c3-43d2-acbe-71f9a25a9282	3230	Šentjur
00050000-55c3-43d2-6e37-5e1540b70263	3271	Šentrupert
00050000-55c3-43d2-73e1-af40a4fd4e06	8232	Šentrupert
00050000-55c3-43d2-a6bb-abaf968620bf	1296	Šentvid pri Stični
00050000-55c3-43d2-81ca-24632ebe5d45	8275	Škocjan
00050000-55c3-43d2-a20c-a0424c7b8a0b	6281	Škofije
00050000-55c3-43d2-b2f4-75639a8ebdc5	4220	Škofja Loka
00050000-55c3-43d2-f9ca-0814da0ce334	3211	Škofja vas
00050000-55c3-43d2-9ba2-f02626ffff4f	1291	Škofljica
00050000-55c3-43d2-4816-f948e84b8c49	6274	Šmarje
00050000-55c3-43d2-c7ff-b6e36a06701f	1293	Šmarje - Sap
00050000-55c3-43d2-ae03-71da30ba831c	3240	Šmarje pri Jelšah
00050000-55c3-43d2-9064-01804c53b3ef	8220	Šmarješke Toplice
00050000-55c3-43d2-ed61-00116380647d	2315	Šmartno na Pohorju
00050000-55c3-43d2-577c-2c61e617dd50	3341	Šmartno ob Dreti
00050000-55c3-43d2-6426-52accfb1072b	3327	Šmartno ob Paki
00050000-55c3-43d2-88c0-5aed490a1ef5	1275	Šmartno pri Litiji
00050000-55c3-43d2-221a-bb3e346663b0	2383	Šmartno pri Slovenj Gradcu
00050000-55c3-43d2-969c-590ad71135eb	3201	Šmartno v Rožni dolini
00050000-55c3-43d2-f470-b11685c94d04	3325	Šoštanj
00050000-55c3-43d2-e42d-567cf108ec84	6222	Štanjel
00050000-55c3-43d2-bc17-7689cad98806	3220	Štore
00050000-55c3-43d2-afc6-c720c0023641	3304	Tabor
00050000-55c3-43d2-e751-150d39ac57a0	3221	Teharje
00050000-55c3-43d2-9f26-1c79b4f53d22	9251	Tišina
00050000-55c3-43d2-d6cf-5132b92fe206	5220	Tolmin
00050000-55c3-43d2-7de8-78cde3e5823a	3326	Topolšica
00050000-55c3-43d2-53be-1f85c7cc1dcc	2371	Trbonje
00050000-55c3-43d2-14a9-2cb6dee0c372	1420	Trbovlje
00050000-55c3-43d2-24dd-be1e8c65e1c9	8231	Trebelno 
00050000-55c3-43d2-21c1-4fc245deb4a7	8210	Trebnje
00050000-55c3-43d2-2a4d-f0e3a1bec2a5	5252	Trnovo pri Gorici
00050000-55c3-43d2-6ffc-228168539498	2254	Trnovska vas
00050000-55c3-43d2-22fe-d7600cd4901f	1222	Trojane
00050000-55c3-43d2-26eb-fb2b9da49767	1236	Trzin
00050000-55c3-43d2-f969-e0175838eef5	4290	Tržič
00050000-55c3-43d2-b132-ba5b7ebd71f1	8295	Tržišče
00050000-55c3-43d2-7306-e581035dc1a4	1311	Turjak
00050000-55c3-43d2-8303-ec7fe717c11e	9224	Turnišče
00050000-55c3-43d2-c01b-fdc5b2034fe1	8323	Uršna sela
00050000-55c3-43d2-aa90-9d0c556360c4	1252	Vače
00050000-55c3-43d2-4f66-8b5b7a1482ba	3320	Velenje 
00050000-55c3-43d2-dd27-9cf0a7683358	3322	Velenje - poštni predali
00050000-55c3-43d2-2aa0-435d3927d114	8212	Velika Loka
00050000-55c3-43d2-2faa-73a0b6f09a74	2274	Velika Nedelja
00050000-55c3-43d2-3d81-6118effe9eaa	9225	Velika Polana
00050000-55c3-43d2-12dd-55855bce0cca	1315	Velike Lašče
00050000-55c3-43d2-bb8f-5738a158ecbe	8213	Veliki Gaber
00050000-55c3-43d2-d2f4-9d129a97cdcf	9241	Veržej
00050000-55c3-43d2-9695-eb5b23263f19	1312	Videm - Dobrepolje
00050000-55c3-43d2-f989-d4880e041701	2284	Videm pri Ptuju
00050000-55c3-43d2-cffd-5c1390aa7083	8344	Vinica
00050000-55c3-43d2-10ae-1c6efea87b4a	5271	Vipava
00050000-55c3-43d2-c3d0-66b0b79f97de	4212	Visoko
00050000-55c3-43d2-81fa-679470742ff8	1294	Višnja Gora
00050000-55c3-43d2-1a2e-cbce0155a192	3205	Vitanje
00050000-55c3-43d2-a913-e0e7ebd6b118	2255	Vitomarci
00050000-55c3-43d2-bbc9-1ba3e63f5280	1217	Vodice
00050000-55c3-43d2-8706-5d62cd5dd71b	3212	Vojnik\t
00050000-55c3-43d2-3aff-e836291f515e	5293	Volčja Draga
00050000-55c3-43d2-8c19-e65bb25a3eef	2232	Voličina
00050000-55c3-43d2-63aa-1f58541e8eb2	3305	Vransko
00050000-55c3-43d2-3e10-9694958403ff	6217	Vremski Britof
00050000-55c3-43d2-f6ab-041288c2dfe5	1360	Vrhnika
00050000-55c3-43d2-d11c-eae3cbb5bb1d	2365	Vuhred
00050000-55c3-43d2-441e-d46e6c19ae71	2367	Vuzenica
00050000-55c3-43d2-39d4-704a35770dcd	8292	Zabukovje 
00050000-55c3-43d2-1d84-1950eb4e3603	1410	Zagorje ob Savi
00050000-55c3-43d2-bfa7-ba7622425ed9	1303	Zagradec
00050000-55c3-43d2-c871-73b3840a96f4	2283	Zavrč
00050000-55c3-43d2-a29b-ce1f34f40ade	8272	Zdole 
00050000-55c3-43d2-dfa6-3ea56760815d	4201	Zgornja Besnica
00050000-55c3-43d2-61b9-a89c86911e5c	2242	Zgornja Korena
00050000-55c3-43d2-f1d0-6f14a05cb140	2201	Zgornja Kungota
00050000-55c3-43d2-53d0-0e5ff6431916	2316	Zgornja Ložnica
00050000-55c3-43d2-f0fa-d50969cd0b7d	2314	Zgornja Polskava
00050000-55c3-43d2-0a65-f3f315ad1c70	2213	Zgornja Velka
00050000-55c3-43d2-29ff-4fb063de89cc	4247	Zgornje Gorje
00050000-55c3-43d2-8fb0-aefe68710bb4	4206	Zgornje Jezersko
00050000-55c3-43d2-8038-6147b9834072	2285	Zgornji Leskovec
00050000-55c3-43d2-b6b5-fff03a49f94b	1432	Zidani Most
00050000-55c3-43d2-35e3-ae2f4f07918b	3214	Zreče
00050000-55c3-43d2-4a89-cb021386ab61	4209	Žabnica
00050000-55c3-43d2-2c95-e1002b65e749	3310	Žalec
00050000-55c3-43d2-6ade-a54129655f20	4228	Železniki
00050000-55c3-43d2-c984-e36594b92ce1	2287	Žetale
00050000-55c3-43d2-2b51-d15ac98f9d6c	4226	Žiri
00050000-55c3-43d2-443b-019eb3d2ab31	4274	Žirovnica
00050000-55c3-43d2-e197-e550b7894e03	8360	Žužemberk
\.


--
-- TOC entry 3021 (class 0 OID 12204772)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 12204579)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 12204657)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 12204784)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 12205115)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 12205125)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c3-43d3-4607-8318db988edb	00080000-55c3-43d3-1a06-1328b3d4670a	0900	AK
00190000-55c3-43d3-3832-742142585397	00080000-55c3-43d3-3178-ca1318ceac99	0987	AK
00190000-55c3-43d3-dd37-d58347f4eed9	00080000-55c3-43d3-0d9e-ac3c0e7e3b93	0989	AK
00190000-55c3-43d3-6311-16cc2ee4cc2c	00080000-55c3-43d3-4df7-c9b777722223	0986	AK
00190000-55c3-43d3-01b8-4329381e1804	00080000-55c3-43d3-6570-6e028694ca9c	0984	AK
00190000-55c3-43d3-1ee2-00bde54e051b	00080000-55c3-43d3-9df1-3e928974744f	0983	AK
00190000-55c3-43d3-8821-eed8f1db417d	00080000-55c3-43d3-fe47-de5500a67914	0982	AK
\.


--
-- TOC entry 3045 (class 0 OID 12205071)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c3-43d3-0792-f3cb8142cab1	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2990 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 12205133)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 12204813)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c3-43d3-7873-14c9d6ceabe9	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c3-43d3-5a35-efaee2d3bd7a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c3-43d3-3e4c-9e5a4027645b	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c3-43d3-e505-4bb1b4e9723d	0004	Mali oder	t	24	Mali oder 
00220000-55c3-43d3-8d79-656159d444ca	0005	Komorni oder	t	15	Komorni oder
00220000-55c3-43d3-ac29-7d82c3069de8	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c3-43d3-1cdf-4d609b6c2e6e	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3019 (class 0 OID 12204757)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 12204747)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 12204932)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 12204881)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 12204451)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 3028 (class 0 OID 12204823)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 12204489)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c3-43d1-6cce-c86421bb1982	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c3-43d1-e047-f9ba83144d55	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c3-43d1-8c2e-4f1ab847d9fb	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c3-43d1-f14d-58a49a50de3a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c3-43d1-5242-53658b940488	planer	Planer dogodkov v koledarju	t
00020000-55c3-43d1-9ec5-68f1425a4ef1	kadrovska	Kadrovska služba	t
00020000-55c3-43d1-8ef5-5c65cb84092b	arhivar	Ažuriranje arhivalij	t
00020000-55c3-43d1-0b75-61c84503d5ee	igralec	Igralec	t
00020000-55c3-43d1-1882-51639f8457c6	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c3-43d3-b5ee-920a0417f0bb	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2994 (class 0 OID 12204473)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c3-43d1-4019-8061a430c6de	00020000-55c3-43d1-8c2e-4f1ab847d9fb
00010000-55c3-43d1-01a2-59ca227debf6	00020000-55c3-43d1-8c2e-4f1ab847d9fb
00010000-55c3-43d3-1b2b-b338328fe917	00020000-55c3-43d3-b5ee-920a0417f0bb
\.


--
-- TOC entry 3030 (class 0 OID 12204837)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 12204778)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 12204724)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 12205174)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c3-43d2-308f-d3b0b845b863	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c3-43d2-2621-d2aead9ccc6f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c3-43d2-0013-a1ff32a6478d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c3-43d2-2957-43178069f454	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c3-43d2-7644-b18ad6c2f8b5	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3052 (class 0 OID 12205166)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c3-43d2-9d49-cb49ac79351f	00230000-55c3-43d2-2957-43178069f454	popa
00240000-55c3-43d2-93cb-461c286a5ebb	00230000-55c3-43d2-2957-43178069f454	oseba
00240000-55c3-43d2-2191-3f7afeb4307f	00230000-55c3-43d2-2957-43178069f454	sezona
00240000-55c3-43d2-a84d-ce0a4f890d19	00230000-55c3-43d2-2621-d2aead9ccc6f	prostor
00240000-55c3-43d2-d94c-c9c26c16728a	00230000-55c3-43d2-2957-43178069f454	besedilo
00240000-55c3-43d2-95e5-cd58d7084ca3	00230000-55c3-43d2-2957-43178069f454	uprizoritev
00240000-55c3-43d2-75de-512fd574316f	00230000-55c3-43d2-2957-43178069f454	funkcija
00240000-55c3-43d2-840f-bc37f79017ef	00230000-55c3-43d2-2957-43178069f454	tipfunkcije
00240000-55c3-43d2-861b-bb93f6dbbbcb	00230000-55c3-43d2-2957-43178069f454	alternacija
00240000-55c3-43d2-3179-c4d90fb42a9e	00230000-55c3-43d2-308f-d3b0b845b863	pogodba
00240000-55c3-43d2-88a0-f177b3b91372	00230000-55c3-43d2-2957-43178069f454	zaposlitev
00240000-55c3-43d2-a46c-164810e9e592	00230000-55c3-43d2-308f-d3b0b845b863	programdela
00240000-55c3-43d2-113b-d2eff0fb9579	00230000-55c3-43d2-2957-43178069f454	zapis
\.


--
-- TOC entry 3051 (class 0 OID 12205161)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 12204891)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c3-43d3-71c7-22044f3b76a1	000e0000-55c3-43d3-3db3-26d791e1494e	00080000-55c3-43d3-f9ab-19b4c9fd69d9	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c3-43d3-1d51-6828eac03ce9	000e0000-55c3-43d3-3db3-26d791e1494e	00080000-55c3-43d3-f9ab-19b4c9fd69d9	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c3-43d3-41cc-997b25725bc4	000e0000-55c3-43d3-3db3-26d791e1494e	00080000-55c3-43d3-4591-1419f8205476	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c3-43d3-c5f9-334a0fd1ad9f	000e0000-55c3-43d3-3db3-26d791e1494e	00080000-55c3-43d3-4591-1419f8205476	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3001 (class 0 OID 12204551)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 12204734)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c3-43d3-6aad-f08bde6feaba	00180000-55c3-43d3-bd42-9b680480f014	000c0000-55c3-43d3-b087-babb94372fec	00090000-55c3-43d3-7657-359df9f985c0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-43d3-4886-1d7939668e49	00180000-55c3-43d3-bd42-9b680480f014	000c0000-55c3-43d3-77d8-4bddb17816ee	00090000-55c3-43d3-f3a7-e8f8b19ac4f6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-43d3-d01f-4cdaef190f80	00180000-55c3-43d3-bd42-9b680480f014	000c0000-55c3-43d3-0355-2a63f27cd481	00090000-55c3-43d3-6c4a-ce3ef2ba4cb2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-43d3-b7f5-e094aba67388	00180000-55c3-43d3-bd42-9b680480f014	000c0000-55c3-43d3-2f91-7a1c1b5b215f	00090000-55c3-43d3-bfdd-fb64ff6999b0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-43d3-8211-1a3866c20363	00180000-55c3-43d3-bd42-9b680480f014	000c0000-55c3-43d3-bc9c-4c0ee36f1789	00090000-55c3-43d3-831e-30cda918dc84	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-43d3-6095-2da065492796	00180000-55c3-43d3-f34f-e3e215f378f3	\N	00090000-55c3-43d3-831e-30cda918dc84	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3037 (class 0 OID 12204921)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c3-43d2-70f1-83853078e28b	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c3-43d2-3a03-3df46f6b9caa	Priredba	Priredba	Priredba	umetnik
000f0000-55c3-43d2-d1ea-0e5315aa0e18	Prevod	Prevod	Prevod	umetnik
000f0000-55c3-43d2-b99a-2a262fc67901	Režija	Režija	Režija	umetnik
000f0000-55c3-43d2-558d-9aab47a603b8	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c3-43d2-b307-242cff9b0646	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c3-43d2-86fa-af79f2475930	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c3-43d2-fa2c-6ba1331a19b9	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c3-43d2-46f5-8cf98e70edbb	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c3-43d2-1e7f-853f8426f98d	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c3-43d2-9fe8-b9bcfd9aa3f6	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c3-43d2-4bf9-747b3f5f3c3a	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c3-43d2-c9f3-b4634075d552	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c3-43d2-328f-2dd08e72ac2f	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c3-43d2-8915-93fefbd59972	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c3-43d2-ac4e-3604527514e6	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c3-43d2-59c4-2aa7951b7d89	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c3-43d2-4a58-743333103d97	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3049 (class 0 OID 12205143)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c3-43d2-1f1d-b85cdb7fc8a8	01	Velika predstava	f	1.00	1.00
002b0000-55c3-43d2-6f53-aed07da57abb	02	Mala predstava	f	0.50	0.50
002b0000-55c3-43d2-c290-898d00982741	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c3-43d2-6217-8f108580d8c2	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c3-43d2-a782-d9b32ac1f7db	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3006 (class 0 OID 12204614)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 12204460)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c3-43d1-01a2-59ca227debf6	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRObXW71k46tIHI3WK0IqqYGA8e2vVxvo2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c3-43d3-0afa-a871ec5bb214	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c3-43d3-531d-d7bdb04910f7	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c3-43d3-231d-4ce1fb2a62aa	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c3-43d3-7200-a8fd93dc65a1	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c3-43d3-fc80-85697a195ec6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c3-43d3-83e6-34941e138b7a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c3-43d3-6471-618b2fdd0e50	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c3-43d3-6e19-d92b9dc9bef9	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c3-43d3-8efe-2abc30c1c9f9	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c3-43d3-1b2b-b338328fe917	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c3-43d1-4019-8061a430c6de	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 12204969)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c3-43d3-5089-f4629eac5e75	00160000-55c3-43d3-6cbd-97faab321afa	00150000-55c3-43d2-920e-df5b28f39f1e	00140000-55c3-43d1-f257-e0b69f22b1f8	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c3-43d3-8d79-656159d444ca
000e0000-55c3-43d3-3db3-26d791e1494e	00160000-55c3-43d3-aa05-9bf364ba3ba6	00150000-55c3-43d2-ebe4-5d5877d1dd88	00140000-55c3-43d1-d08a-08fc938a4a4f	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c3-43d3-ac29-7d82c3069de8
000e0000-55c3-43d3-e455-844e9b5d0c99	\N	00150000-55c3-43d2-ebe4-5d5877d1dd88	00140000-55c3-43d1-d08a-08fc938a4a4f	00190000-55c3-43d3-3832-742142585397	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c3-43d3-8d79-656159d444ca
000e0000-55c3-43d3-ef9c-4a53be5e1484	\N	00150000-55c3-43d2-ebe4-5d5877d1dd88	00140000-55c3-43d1-d08a-08fc938a4a4f	00190000-55c3-43d3-3832-742142585397	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c3-43d3-8d79-656159d444ca
000e0000-55c3-43d3-6f0d-7af4df6640dc	\N	00150000-55c3-43d2-ebe4-5d5877d1dd88	00140000-55c3-43d1-d08a-08fc938a4a4f	00190000-55c3-43d3-3832-742142585397	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c3-43d3-7873-14c9d6ceabe9
\.


--
-- TOC entry 3011 (class 0 OID 12204676)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c3-43d3-0daa-c009db37f67e	000e0000-55c3-43d3-3db3-26d791e1494e	1	
00200000-55c3-43d3-45f8-e1cac8187df3	000e0000-55c3-43d3-3db3-26d791e1494e	2	
\.


--
-- TOC entry 3026 (class 0 OID 12204805)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 12205213)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 12205185)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 12205225)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 12204874)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c3-43d3-2507-df89385eb66e	00090000-55c3-43d3-f3a7-e8f8b19ac4f6	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-43d3-9fc8-b2f378b62499	00090000-55c3-43d3-6c4a-ce3ef2ba4cb2	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-43d3-b8f4-bd030510a81f	00090000-55c3-43d3-c158-b22caee96c1f	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-43d3-c21b-30d07b266093	00090000-55c3-43d3-33e6-deee4bcc8696	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-43d3-20cb-1565bd90b5f3	00090000-55c3-43d3-7657-359df9f985c0	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-43d3-2b07-87b8d9b19db7	00090000-55c3-43d3-10d8-d18f7a8896f7	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3013 (class 0 OID 12204708)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 12204959)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c3-43d1-f257-e0b69f22b1f8	01	Drama	drama (SURS 01)
00140000-55c3-43d1-9125-46050655c1af	02	Opera	opera (SURS 02)
00140000-55c3-43d1-c4c4-62001c94d1e6	03	Balet	balet (SURS 03)
00140000-55c3-43d1-208a-c24b3d8a73eb	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c3-43d1-c22c-216a32e13675	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c3-43d1-d08a-08fc938a4a4f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c3-43d1-7e73-b92c1995ac43	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3032 (class 0 OID 12204864)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c3-43d2-5bdc-ccfab77c6481	01	Opera	opera
00150000-55c3-43d2-099b-4e07baf86852	02	Opereta	opereta
00150000-55c3-43d2-3a92-b1364a8313bf	03	Balet	balet
00150000-55c3-43d2-03a9-dc3515feb2b6	04	Plesne prireditve	plesne prireditve
00150000-55c3-43d2-b326-74d2652d50d7	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c3-43d2-c69d-984ad9d0f9a5	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c3-43d2-08db-3b9f0e58e4e2	07	Biografska drama	biografska drama
00150000-55c3-43d2-920e-df5b28f39f1e	08	Komedija	komedija
00150000-55c3-43d2-90e6-29af72801e1e	09	Črna komedija	črna komedija
00150000-55c3-43d2-cbf2-6281c966b624	10	E-igra	E-igra
00150000-55c3-43d2-ebe4-5d5877d1dd88	11	Kriminalka	kriminalka
00150000-55c3-43d2-fb91-2448c4937084	12	Musical	musical
\.


--
-- TOC entry 2537 (class 2606 OID 12204514)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 12205016)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 12205006)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 12204920)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 12205266)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 12204698)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 12204723)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 12205159)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 12204640)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 12205065)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 12204860)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 12204674)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 12204717)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 12204654)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 12204770)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 12205242)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 12205249)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2778 (class 2606 OID 12205274)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 12204797)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 12204612)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 12204523)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2544 (class 2606 OID 12204547)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 12204503)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2528 (class 2606 OID 12204488)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 12204803)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 12204836)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 12204954)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 12204576)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 12204600)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 12204776)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 12204590)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 12204661)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 12204788)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 12205122)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 12205130)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 12205113)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 12205141)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 12204820)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 12204761)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 12204752)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 12204942)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 12204888)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 12204459)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 12204827)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 12204477)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2530 (class 2606 OID 12204497)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 12204845)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 12204783)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 12204732)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 12205183)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 12205171)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 12205165)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 12204901)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 12204556)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 12204743)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 12204931)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 12205153)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 12204625)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 12204472)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 12204985)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 12204683)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 12204811)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 12205223)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 12205207)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 12205231)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 12204879)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 12204712)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 12204967)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 12204872)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 1259 OID 12204705)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2678 (class 1259 OID 12204902)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 12204903)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2764 (class 1259 OID 12205244)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2765 (class 1259 OID 12205243)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 12204578)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2498 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2499 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2500 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2643 (class 1259 OID 12204804)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 12205211)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2752 (class 1259 OID 12205210)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 12205212)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2754 (class 1259 OID 12205209)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2755 (class 1259 OID 12205208)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2637 (class 1259 OID 12204790)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 12204789)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2588 (class 1259 OID 12204684)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 12204861)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 12204863)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 12204862)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 12204656)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 12204655)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 12205142)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2688 (class 1259 OID 12204956)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 12204957)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2690 (class 1259 OID 12204958)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2761 (class 1259 OID 12205232)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2512 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2513 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2697 (class 1259 OID 12204990)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2698 (class 1259 OID 12204987)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2699 (class 1259 OID 12204991)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2700 (class 1259 OID 12204989)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2701 (class 1259 OID 12204988)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 12204627)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 12204626)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2503 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2504 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2542 (class 1259 OID 12204550)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 12204828)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 12204718)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2532 (class 1259 OID 12204504)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2533 (class 1259 OID 12204505)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 12204848)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 12204847)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 12204846)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 12204662)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 12204664)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2582 (class 1259 OID 12204663)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2744 (class 1259 OID 12205173)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2617 (class 1259 OID 12204756)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2618 (class 1259 OID 12204754)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2619 (class 1259 OID 12204753)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2620 (class 1259 OID 12204755)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 12204478)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2524 (class 1259 OID 12204479)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2646 (class 1259 OID 12204812)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2774 (class 1259 OID 12205267)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2775 (class 1259 OID 12205275)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2776 (class 1259 OID 12205276)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2632 (class 1259 OID 12204777)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 12204889)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 12204890)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 12205070)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2719 (class 1259 OID 12205069)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2720 (class 1259 OID 12205066)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2721 (class 1259 OID 12205067)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2722 (class 1259 OID 12205068)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 12204592)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 12204591)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 12204593)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2516 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2726 (class 1259 OID 12205123)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 12205124)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2711 (class 1259 OID 12205020)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 12205021)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2713 (class 1259 OID 12205018)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2714 (class 1259 OID 12205019)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 12204880)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 12204765)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2624 (class 1259 OID 12204764)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2625 (class 1259 OID 12204762)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2626 (class 1259 OID 12204763)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2707 (class 1259 OID 12205008)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 12205007)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2723 (class 1259 OID 12205114)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2587 (class 1259 OID 12204675)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2741 (class 1259 OID 12205160)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2768 (class 1259 OID 12205250)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2769 (class 1259 OID 12205251)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 12204525)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 12204524)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 12204557)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 12204558)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 12204746)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 12204745)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2614 (class 1259 OID 12204744)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2508 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2509 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2594 (class 1259 OID 12204707)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2595 (class 1259 OID 12204703)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2596 (class 1259 OID 12204700)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2597 (class 1259 OID 12204701)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2598 (class 1259 OID 12204699)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2599 (class 1259 OID 12204704)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2600 (class 1259 OID 12204702)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 12204577)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 12204641)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 12204643)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 12204642)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 12204644)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2631 (class 1259 OID 12204771)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 12204955)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 12204986)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 12204548)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 12204549)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 12204873)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 12205184)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 12204613)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2747 (class 1259 OID 12205172)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2651 (class 1259 OID 12204822)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 12204821)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2715 (class 1259 OID 12205017)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2562 (class 1259 OID 12204601)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 12204968)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2758 (class 1259 OID 12205224)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 12205131)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 12205132)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 12204733)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 12204498)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2601 (class 1259 OID 12204706)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2804 (class 2606 OID 12205412)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2807 (class 2606 OID 12205397)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2806 (class 2606 OID 12205402)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2802 (class 2606 OID 12205422)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2808 (class 2606 OID 12205392)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2803 (class 2606 OID 12205417)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2805 (class 2606 OID 12205407)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2838 (class 2606 OID 12205567)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 12205572)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 12205742)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2872 (class 2606 OID 12205737)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 12205327)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2825 (class 2606 OID 12205507)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2866 (class 2606 OID 12205722)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 12205717)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2865 (class 2606 OID 12205727)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 12205712)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2869 (class 2606 OID 12205707)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2823 (class 2606 OID 12205502)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2824 (class 2606 OID 12205497)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 12205387)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 12205537)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 12205547)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2832 (class 2606 OID 12205542)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2795 (class 2606 OID 12205362)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 12205357)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 12205487)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 12205692)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 12205577)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 12205582)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 12205587)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2870 (class 2606 OID 12205732)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2843 (class 2606 OID 12205607)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2846 (class 2606 OID 12205592)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2842 (class 2606 OID 12205612)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2844 (class 2606 OID 12205602)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2845 (class 2606 OID 12205597)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2793 (class 2606 OID 12205352)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 12205347)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 12205312)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2786 (class 2606 OID 12205307)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 12205517)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2809 (class 2606 OID 12205427)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2782 (class 2606 OID 12205287)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2781 (class 2606 OID 12205292)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 12205532)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2829 (class 2606 OID 12205527)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2830 (class 2606 OID 12205522)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2799 (class 2606 OID 12205367)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 12205377)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2798 (class 2606 OID 12205372)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2864 (class 2606 OID 12205702)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2813 (class 2606 OID 12205462)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2815 (class 2606 OID 12205452)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2816 (class 2606 OID 12205447)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2814 (class 2606 OID 12205457)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 12205277)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 12205282)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 12205512)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2875 (class 2606 OID 12205757)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 12205762)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2876 (class 2606 OID 12205767)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2822 (class 2606 OID 12205492)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2836 (class 2606 OID 12205557)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2835 (class 2606 OID 12205562)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 12205667)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 12205662)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 12205647)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 12205652)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2855 (class 2606 OID 12205657)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2791 (class 2606 OID 12205337)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 12205332)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 12205342)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 12205677)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2859 (class 2606 OID 12205682)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2850 (class 2606 OID 12205637)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 12205642)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2852 (class 2606 OID 12205627)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2851 (class 2606 OID 12205632)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2834 (class 2606 OID 12205552)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 12205482)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2818 (class 2606 OID 12205477)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2820 (class 2606 OID 12205467)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2819 (class 2606 OID 12205472)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2847 (class 2606 OID 12205622)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 12205617)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2858 (class 2606 OID 12205672)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2800 (class 2606 OID 12205382)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 12205687)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2863 (class 2606 OID 12205697)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2874 (class 2606 OID 12205747)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2873 (class 2606 OID 12205752)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2783 (class 2606 OID 12205302)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 12205297)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2788 (class 2606 OID 12205317)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 12205322)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 12205442)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 12205437)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2812 (class 2606 OID 12205432)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-06 13:24:04 CEST

--
-- PostgreSQL database dump complete
--

