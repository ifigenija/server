--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-06 11:23:53 CEST

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
-- TOC entry 183 (class 1259 OID 12131543)
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
-- TOC entry 228 (class 1259 OID 12132046)
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
-- TOC entry 227 (class 1259 OID 12132029)
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
-- TOC entry 221 (class 1259 OID 12131941)
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
-- TOC entry 244 (class 1259 OID 12132289)
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
-- TOC entry 197 (class 1259 OID 12131722)
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
-- TOC entry 200 (class 1259 OID 12131756)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 12132191)
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
-- TOC entry 192 (class 1259 OID 12131665)
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
-- TOC entry 229 (class 1259 OID 12132059)
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
-- TOC entry 216 (class 1259 OID 12131886)
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
-- TOC entry 195 (class 1259 OID 12131702)
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
-- TOC entry 199 (class 1259 OID 12131750)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 12131682)
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
-- TOC entry 205 (class 1259 OID 12131803)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 12132270)
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
-- TOC entry 243 (class 1259 OID 12132282)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 12132305)
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
-- TOC entry 209 (class 1259 OID 12131828)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 12131639)
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
-- TOC entry 184 (class 1259 OID 12131552)
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
-- TOC entry 185 (class 1259 OID 12131563)
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
-- TOC entry 180 (class 1259 OID 12131517)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 12131536)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 12131835)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 12131866)
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
-- TOC entry 224 (class 1259 OID 12131980)
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
-- TOC entry 187 (class 1259 OID 12131596)
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
-- TOC entry 189 (class 1259 OID 12131631)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 12131809)
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
-- TOC entry 188 (class 1259 OID 12131616)
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
-- TOC entry 194 (class 1259 OID 12131694)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 12131821)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 12132152)
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
-- TOC entry 232 (class 1259 OID 12132162)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 12132108)
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
-- TOC entry 233 (class 1259 OID 12132170)
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
-- TOC entry 212 (class 1259 OID 12131850)
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
-- TOC entry 204 (class 1259 OID 12131794)
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
-- TOC entry 203 (class 1259 OID 12131784)
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
-- TOC entry 223 (class 1259 OID 12131969)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 12131918)
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
-- TOC entry 177 (class 1259 OID 12131488)
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
-- TOC entry 176 (class 1259 OID 12131486)
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
-- TOC entry 213 (class 1259 OID 12131860)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 12131526)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 12131510)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 12131874)
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
-- TOC entry 207 (class 1259 OID 12131815)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 12131761)
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
-- TOC entry 238 (class 1259 OID 12132211)
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
-- TOC entry 237 (class 1259 OID 12132203)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 12132198)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 12131928)
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
-- TOC entry 186 (class 1259 OID 12131588)
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
-- TOC entry 202 (class 1259 OID 12131771)
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
-- TOC entry 222 (class 1259 OID 12131958)
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
-- TOC entry 234 (class 1259 OID 12132180)
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
-- TOC entry 191 (class 1259 OID 12131651)
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
-- TOC entry 178 (class 1259 OID 12131497)
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
-- TOC entry 226 (class 1259 OID 12132006)
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
-- TOC entry 196 (class 1259 OID 12131713)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 12131842)
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
-- TOC entry 240 (class 1259 OID 12132250)
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
-- TOC entry 239 (class 1259 OID 12132222)
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
-- TOC entry 241 (class 1259 OID 12132262)
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
-- TOC entry 218 (class 1259 OID 12131911)
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
-- TOC entry 198 (class 1259 OID 12131745)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 12131996)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 12131901)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 12131491)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2998 (class 0 OID 12131543)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 12132046)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c3-27a9-17e9-53b7248aa6e3	000d0000-55c3-27a9-ca26-015a6338ade2	\N	00090000-55c3-27a8-5f8f-7c74f35fed6b	000b0000-55c3-27a9-b58c-89826d7107ed	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c3-27a9-7edd-67c14cbcc4d4	000d0000-55c3-27a9-2123-8cc4f0914558	00100000-55c3-27a9-98a6-a85fd7a02ad4	00090000-55c3-27a9-c505-06feeadd380e	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c3-27a9-6df1-a192d5e23720	000d0000-55c3-27a9-c6a8-e4f8a047f5d8	00100000-55c3-27a9-d71a-c7f04d49bd2b	00090000-55c3-27a8-b1b9-a8c16aa7bc62	\N	0003	t	\N	2015-08-06	\N	2	\N	\N	f	f
000c0000-55c3-27a9-a5fb-ed497b0a06d4	000d0000-55c3-27a9-9e20-08c4ec10c444	\N	00090000-55c3-27a8-489c-99624bd65d1d	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c3-27a9-6c9a-a6dd4e0ada78	000d0000-55c3-27a9-97c3-084d0d2085aa	\N	00090000-55c3-27a9-8001-15523ae33351	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c3-27a9-bf5d-90e1083dfb38	000d0000-55c3-27a9-7c9e-532c0f49013b	\N	00090000-55c3-27a8-557d-b97f5110bc9f	000b0000-55c3-27a9-f541-74c4aefb1b39	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c3-27a9-b84b-f116e545b63d	000d0000-55c3-27a9-8fd8-70be7da1b4a7	00100000-55c3-27a9-b671-8dd4c239a942	00090000-55c3-27a8-592e-ec20c09ad953	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c3-27a9-c1ac-5965f5c02867	000d0000-55c3-27a9-65ec-87cc974d0cb7	\N	00090000-55c3-27a9-f489-3a19ea7414c1	000b0000-55c3-27a9-5e76-d6d581728599	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c3-27a9-af77-d2bf9e70705e	000d0000-55c3-27a9-8fd8-70be7da1b4a7	00100000-55c3-27a9-52e7-b7b5204ef59f	00090000-55c3-27a8-b961-bad67325171a	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c3-27a9-72db-27c966c796d9	000d0000-55c3-27a9-8fd8-70be7da1b4a7	00100000-55c3-27a9-1876-75d850d5d204	00090000-55c3-27a9-4bcb-d0943a8288da	\N	0010	t	\N	2015-08-06	\N	16	\N	\N	f	t
000c0000-55c3-27a9-4a9a-5a4c1150b701	000d0000-55c3-27a9-8fd8-70be7da1b4a7	00100000-55c3-27a9-ac5c-8c568bf790ae	00090000-55c3-27a8-da65-027d5ef7a364	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3042 (class 0 OID 12132029)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 12131941)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c3-27a8-3d87-564cb6015faf	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c3-27a8-1a47-7a19aa8d9f46	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c3-27a8-7c6d-5afb286af522	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 12132289)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 12131722)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c3-27a9-6b9a-dd312fec998b	\N	\N	00200000-55c3-27a9-64ae-53ea7eabe13f	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c3-27a9-0e93-7dbe81dfd25a	\N	\N	00200000-55c3-27a9-5bc7-6e4ffe153235	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c3-27a9-265c-f21b6ff93529	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c3-27a9-3fa5-613e15caa209	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c3-27a9-afca-c33f5376289e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3015 (class 0 OID 12131756)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 12132191)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 12131665)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c3-27a7-ddda-6a1298b2c52c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c3-27a7-98fd-12e535e95e8b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c3-27a7-02a8-de23cb09ee78	AL	ALB	008	Albania 	Albanija	\N
00040000-55c3-27a7-68d9-e5abb28a1ae0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c3-27a7-5932-d797adba0184	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c3-27a7-d763-1a80c4f3b65c	AD	AND	020	Andorra 	Andora	\N
00040000-55c3-27a7-e30a-7a178655b966	AO	AGO	024	Angola 	Angola	\N
00040000-55c3-27a7-0201-82db9def837b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c3-27a7-0c26-00281e83061f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c3-27a7-5f7e-e3da8facb74a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c3-27a7-639e-f04624c67ab8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c3-27a7-a8d0-c1fb53f2cdd8	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c3-27a7-057a-5c3a49da52f4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c3-27a7-fc88-67a1d4366fe2	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c3-27a7-3639-18896b61d0f1	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c3-27a7-0899-3cdeace42ec6	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c3-27a7-b3f1-174f31d293d1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c3-27a7-99f6-ff0a59e224c7	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c3-27a7-c6ba-d3003c28be06	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c3-27a7-e352-60f8f66a410c	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c3-27a7-44e0-de22470154c9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c3-27a7-c468-f81e28fdc62f	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c3-27a7-1d21-a3376100bce6	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c3-27a7-de05-df92a19cd2a6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c3-27a7-8d62-4c1df8ee12d3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c3-27a7-5b8c-63bb2941f494	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c3-27a7-25fb-f468252316ad	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c3-27a7-989a-89b162892ad1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c3-27a7-5ef2-090af0bc5a6e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c3-27a7-3f80-06c7a5a23016	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c3-27a7-2c37-7835149e569e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c3-27a7-1680-681d46cf73c7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c3-27a7-7fdc-375453e7541b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c3-27a7-d615-6e89cb1f5892	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c3-27a7-cbf9-d6cb0e0c9070	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c3-27a7-f6f7-4a87372348cd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c3-27a7-0244-744fd160e957	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c3-27a7-b96b-5a3fe483e18c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c3-27a7-38ff-63abc0f944d0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c3-27a7-f775-c20a00982c7c	CA	CAN	124	Canada 	Kanada	\N
00040000-55c3-27a7-bb8d-2223bf0a2a45	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c3-27a7-2de3-eacad6301ceb	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c3-27a7-9aae-9f3d8ebc0b0a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c3-27a7-6b15-e27251a0027e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c3-27a7-157b-d9b070440cce	CL	CHL	152	Chile 	Čile	\N
00040000-55c3-27a7-7acc-79d2f073fddd	CN	CHN	156	China 	Kitajska	\N
00040000-55c3-27a7-7d98-16595ac7990e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c3-27a7-c7f8-afac0e95dfbe	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c3-27a7-5fb5-63855718e215	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c3-27a7-5af3-9752380b540c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c3-27a7-d1bb-c5cda29ab758	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c3-27a7-e5d9-93d8ccae978a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c3-27a7-c7f2-f29dca2ec7d7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c3-27a7-46e6-e1027c336f78	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c3-27a7-8a02-1684ffeebd24	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c3-27a7-7deb-e47d21f5dfc1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c3-27a7-f1f2-f510b217b667	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c3-27a7-b83b-8402d4fa36f9	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c3-27a7-2e50-192e21ee7ea4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c3-27a7-ac02-34495999fe81	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c3-27a7-10cc-0e669e74aa30	DK	DNK	208	Denmark 	Danska	\N
00040000-55c3-27a7-3a4a-48840ead818c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c3-27a7-5821-e2c6f5597a6b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c3-27a7-8f74-f48d89db308b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c3-27a7-90c1-d5a8753edc63	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c3-27a7-5dd0-51301d394017	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c3-27a7-8677-70e5ce4ce6b7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c3-27a7-b171-1bd9b60e2209	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c3-27a7-c700-cc6de45e1bca	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c3-27a7-a283-147740a5e78b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c3-27a7-6f87-e019d530a4d1	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c3-27a7-2fb8-45ceb69b0f89	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c3-27a7-ca85-0262770a5c86	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c3-27a7-eaf5-dce71d30ec66	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c3-27a7-0a20-e676604f7d16	FI	FIN	246	Finland 	Finska	\N
00040000-55c3-27a7-7756-d3a34a6a47c8	FR	FRA	250	France 	Francija	\N
00040000-55c3-27a7-f6f9-658a425d3c69	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c3-27a7-f7d0-6fe92e744525	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c3-27a7-d6f9-59885012c1d6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c3-27a7-4d35-d4a30c3af52f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c3-27a7-edb7-d3f0b661a480	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c3-27a7-51fc-4df7cb04bbbb	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c3-27a7-2a78-53572c307397	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c3-27a7-8dbe-daa927cfa602	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c3-27a7-902f-69e1f6fc74ea	GH	GHA	288	Ghana 	Gana	\N
00040000-55c3-27a7-5f9f-0c151209ca61	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c3-27a7-ac1f-d63450c193ed	GR	GRC	300	Greece 	Grčija	\N
00040000-55c3-27a7-a908-c7951ea6052b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c3-27a7-11b6-52b8224cba11	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c3-27a7-f0ee-b7284714bd53	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c3-27a7-2bf3-6eb80d6f90d0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c3-27a7-cead-bd6ce2342693	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c3-27a7-f1c3-9bc7ed4d9b4c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c3-27a7-b355-efeb3ff4b8af	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c3-27a7-5923-1ca89ad8fb64	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c3-27a7-b0ea-38254bbb9f45	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c3-27a7-bf9a-91e2755f709e	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c3-27a7-f39c-576c9171e0ad	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c3-27a7-4980-6654a4777f7c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c3-27a7-8ce1-545af3992b28	HN	HND	340	Honduras 	Honduras	\N
00040000-55c3-27a7-f53c-ce3e68826a4f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c3-27a7-7528-3a7fdc27a047	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c3-27a7-323a-051ae674fdfe	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c3-27a7-c519-326b07f9a452	IN	IND	356	India 	Indija	\N
00040000-55c3-27a7-88fc-8d669df58bcc	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c3-27a7-609b-7e17adcb5efa	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c3-27a7-a3ba-86d0df44dc2b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c3-27a7-ecd1-ce222f19ba7f	IE	IRL	372	Ireland 	Irska	\N
00040000-55c3-27a7-a985-3bc56e80edd2	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c3-27a7-9d3d-dd98fce7d69a	IL	ISR	376	Israel 	Izrael	\N
00040000-55c3-27a7-ec72-6942cb5e5b13	IT	ITA	380	Italy 	Italija	\N
00040000-55c3-27a7-e344-1e5ea5d2043b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c3-27a7-b744-af8341a21243	JP	JPN	392	Japan 	Japonska	\N
00040000-55c3-27a7-d6e5-1809c3a835a4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c3-27a7-a4ae-bda070644e96	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c3-27a7-68d7-d8dd311322e8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c3-27a7-c5e8-76658bfefb44	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c3-27a7-0a57-fdbdb77519f9	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c3-27a7-058d-e81868414f15	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c3-27a7-0124-6ec28a009736	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c3-27a7-b9ef-667c5de1e17a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c3-27a7-7c08-b42383cfbbf4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c3-27a7-479b-64198667ee8d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c3-27a7-d992-7b5e4b6d70f7	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c3-27a7-e55d-7cc00310409f	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c3-27a7-5f6c-73248f51e3b9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c3-27a7-2b52-1171973b02f2	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c3-27a7-c122-f35b42870b66	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c3-27a7-927d-8087cec0c76b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c3-27a7-f3f8-bf25334c5b27	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c3-27a7-4a32-162ecf319942	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c3-27a7-9a2f-dbf7a7e53b87	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c3-27a7-3e49-5d4659e65838	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c3-27a7-c400-a47a3c496b98	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c3-27a7-ebe1-0adfd9a87195	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c3-27a7-94b0-6229dc04a30c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c3-27a7-6a5d-a70db5be18ab	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c3-27a7-a9db-83aee0dc9c4d	ML	MLI	466	Mali 	Mali	\N
00040000-55c3-27a7-c6d9-39b541891f8a	MT	MLT	470	Malta 	Malta	\N
00040000-55c3-27a7-c0e9-18609d69ad95	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c3-27a7-7266-7e2cb78e1cdc	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c3-27a7-075e-74f64b591674	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c3-27a7-777e-81de2242b216	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c3-27a7-9e06-8653314d724d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c3-27a7-5818-ef7a66dbf189	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c3-27a7-805e-6ed29392385a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c3-27a7-bbf4-2e4ecbe98d23	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c3-27a7-f156-75b1f3cf8f27	MC	MCO	492	Monaco 	Monako	\N
00040000-55c3-27a7-fa44-3c0b1a18904e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c3-27a7-2881-915a7fe26564	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c3-27a7-9514-6830059a5716	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c3-27a7-abd2-d3515e97fe4c	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c3-27a7-14ab-2b3fc7c9513f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c3-27a7-273d-d874408e0ccd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c3-27a7-ce6c-7751c79ea02d	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c3-27a7-7969-bb9d34ff49d1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c3-27a7-ff16-deb2e97b2920	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c3-27a7-e1fc-c3d9997bc33d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c3-27a7-9112-8835890c0591	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c3-27a7-1e91-686644963dbc	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c3-27a7-354a-96415104ef2d	NE	NER	562	Niger 	Niger 	\N
00040000-55c3-27a7-416b-b93939868e74	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c3-27a7-cd83-e2977efbd3db	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c3-27a7-3ae5-2ddad7d815de	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c3-27a7-c441-5cd03242f61a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c3-27a7-724f-96495e0abdd7	NO	NOR	578	Norway 	Norveška	\N
00040000-55c3-27a7-bd42-d5c84f4488f4	OM	OMN	512	Oman 	Oman	\N
00040000-55c3-27a7-daa1-6ece0245b597	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c3-27a7-c9ae-26b5d337bb0c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c3-27a7-ac4d-499978e45a19	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c3-27a7-9372-187b3e592152	PA	PAN	591	Panama 	Panama	\N
00040000-55c3-27a7-463a-ef1814c3d3e2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c3-27a7-02eb-f2924803afdb	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c3-27a7-6904-82f49c59283e	PE	PER	604	Peru 	Peru	\N
00040000-55c3-27a7-a898-a64627d6577d	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c3-27a7-c470-dee3c337e497	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c3-27a7-7ce7-3ec3d40a160a	PL	POL	616	Poland 	Poljska	\N
00040000-55c3-27a7-c2c2-efd41ae6cadf	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c3-27a7-3b30-275ab2db0ef0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c3-27a7-5ec5-759b2054f2c1	QA	QAT	634	Qatar 	Katar	\N
00040000-55c3-27a7-e373-3f0750c44c44	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c3-27a7-4c95-98c2b891c3f0	RO	ROU	642	Romania 	Romunija	\N
00040000-55c3-27a7-e2f4-6f74332c4789	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c3-27a7-2f24-40430b2441e8	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c3-27a7-5480-81ee36f95304	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c3-27a7-c44a-2cbb74e272fa	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c3-27a7-c1da-23f80df6fcbf	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c3-27a7-e476-a728099b6887	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c3-27a7-28e8-ff523b07cc90	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c3-27a7-0dae-cbe30d0b6cc8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c3-27a7-c00b-5c79ffc57f30	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c3-27a7-b909-f47e5b487271	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c3-27a7-b183-bb111d98fd16	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c3-27a7-7f93-5733fd162f63	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c3-27a7-dfa0-557920ab7eb3	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c3-27a7-1786-1837e099049d	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c3-27a7-a9a3-0133836cdc0c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c3-27a7-e671-0acd330c161c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c3-27a7-5432-f2ec7389fbc0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c3-27a7-d345-74133a2446e0	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c3-27a7-a0df-96884b1e27db	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c3-27a7-3903-724e53c35cad	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c3-27a7-0878-0a0dc63f9a6c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c3-27a7-c240-fda596865855	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c3-27a7-6181-4b18d0e5f97c	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c3-27a7-255e-d30b88aa2ddc	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c3-27a7-bfa9-91d7d30cd123	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c3-27a7-6f17-4630e3191425	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c3-27a7-afef-53bbe8f43c7b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c3-27a7-e800-aeb3b8e6fc4b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c3-27a7-2fb7-09717d0c83e4	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c3-27a7-0c70-dd759dbff50d	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c3-27a7-d632-c54079c6580a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c3-27a7-044c-37a81267d5bc	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c3-27a7-6e58-6c4e07506486	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c3-27a7-8cea-92050f44590c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c3-27a7-0320-9c6c88b78516	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c3-27a7-312f-80729349c3b4	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c3-27a7-c872-f7c4a800e753	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c3-27a7-00ea-7fc7b2460f73	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c3-27a7-dd27-4b4cc8ac4c00	TH	THA	764	Thailand 	Tajska	\N
00040000-55c3-27a7-3ed3-a3b10dd78485	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c3-27a7-d49f-06815b660d37	TG	TGO	768	Togo 	Togo	\N
00040000-55c3-27a7-0c8e-42d08a41ee9d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c3-27a7-c61d-2af2663bb297	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c3-27a7-624e-2f7cabee3144	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c3-27a7-2f7e-6462ceb2c597	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c3-27a7-f07f-6091d2243b95	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c3-27a7-9978-d02c2ee488a9	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c3-27a7-2191-9f62bc1ceeca	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c3-27a7-7e21-190d58da88cf	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c3-27a7-2980-8a3063c6af5f	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c3-27a7-e7f4-f811d7818174	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c3-27a7-dad9-57cb0ee284c5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c3-27a7-5661-9529a02a1e62	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c3-27a7-eb5c-32ed217c79dd	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c3-27a7-8add-4fb326652931	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c3-27a7-6bdb-2cc44473627c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c3-27a7-3953-157f6802e15c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c3-27a7-acfb-f822d258682f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c3-27a7-811d-91e51fa876b9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c3-27a7-53a8-5dfa085fa95f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c3-27a7-6e3b-4c84bcb94414	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c3-27a7-fd6a-8436256180a5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c3-27a7-6d96-464d65f6a113	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c3-27a7-8aa4-c302896b649c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c3-27a7-7e55-4b53fa413e39	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c3-27a7-75d7-23a8e267f308	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c3-27a7-d1b2-e892c6a58268	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3044 (class 0 OID 12132059)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55c3-27a9-ff4f-0e417e2fd734	000e0000-55c3-27a9-c665-88001496df78	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	0.00	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c3-27a8-2343-7a69bfe03c85	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c3-27a9-2cbf-b79c56f60701	000e0000-55c3-27a9-9db5-9e0bfe869bd2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c3-27a8-9aab-4b2ae630b3cb	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c3-27a9-95d2-e6fad971cfba	000e0000-55c3-27a9-35f2-9e0d4e36fa09	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c3-27a8-2343-7a69bfe03c85	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c3-27a9-4533-acbd98e0a41c	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c3-27a9-916d-bd44cbb1d216	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 12131886)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c3-27a9-8fd8-70be7da1b4a7	000e0000-55c3-27a9-9db5-9e0bfe869bd2	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c3-27a8-fb43-045b8f3610a9
000d0000-55c3-27a9-ca26-015a6338ade2	000e0000-55c3-27a9-9db5-9e0bfe869bd2	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c3-27a8-fb43-045b8f3610a9
000d0000-55c3-27a9-2123-8cc4f0914558	000e0000-55c3-27a9-9db5-9e0bfe869bd2	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c3-27a8-8d26-ac336faff7e7
000d0000-55c3-27a9-c6a8-e4f8a047f5d8	000e0000-55c3-27a9-9db5-9e0bfe869bd2	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c3-27a8-b17f-04733c97c49a
000d0000-55c3-27a9-9e20-08c4ec10c444	000e0000-55c3-27a9-9db5-9e0bfe869bd2	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c3-27a8-57b9-37ee4f3eda4a
000d0000-55c3-27a9-97c3-084d0d2085aa	000e0000-55c3-27a9-9db5-9e0bfe869bd2	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c3-27a8-1230-5757eaeb9bb8
000d0000-55c3-27a9-7c9e-532c0f49013b	000e0000-55c3-27a9-9db5-9e0bfe869bd2	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c3-27a8-fb43-045b8f3610a9
000d0000-55c3-27a9-65ec-87cc974d0cb7	000e0000-55c3-27a9-9db5-9e0bfe869bd2	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c3-27a8-b152-9d6a27edf3dc
\.


--
-- TOC entry 3010 (class 0 OID 12131702)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 12131750)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 12131682)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c3-27a9-759f-b09712c86a93	00080000-55c3-27a8-fa79-64de1eca69f4	00090000-55c3-27a9-4bcb-d0943a8288da	AK		
\.


--
-- TOC entry 2985 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 12131803)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 12132270)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 12132282)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 12132305)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 12131828)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 12131639)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c3-27a7-f5ee-1293597be954	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c3-27a7-e069-280c948a05c7	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c3-27a7-5df2-2411f972fbd8	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c3-27a7-7afc-4291bf27787f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c3-27a7-3037-4e73b92c564c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c3-27a7-324a-959db8d7b96a	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c3-27a7-5f47-85169118dadf	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c3-27a7-3c53-c04c7a26fb7e	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c3-27a7-b9b1-df1284a44f28	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c3-27a7-0802-873a48ba10f2	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c3-27a7-e273-eac412edac27	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c3-27a7-9c89-d83827599cc0	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c3-27a7-4719-7adf5632be61	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c3-27a7-6261-dd0630247da9	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c3-27a8-9d38-3cd0be8aac92	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c3-27a8-bb9e-3378db7ce721	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c3-27a8-a607-61dcbd404b6a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c3-27a8-e973-f53c53aeaacb	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c3-27a8-52b7-16c12faa361d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c3-27a8-eae2-a485984efd7a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2999 (class 0 OID 12131552)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c3-27a8-e644-da27e32d209b	00000000-55c3-27a8-bb9e-3378db7ce721	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c3-27a8-11a5-9828470df6f9	00000000-55c3-27a8-bb9e-3378db7ce721	00010000-55c3-27a7-7941-c7a41bfe96a3	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c3-27a8-4ebb-dd747bcd9e0d	00000000-55c3-27a8-a607-61dcbd404b6a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3000 (class 0 OID 12131563)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c3-27a8-5f8f-7c74f35fed6b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c3-27a8-489c-99624bd65d1d	00010000-55c3-27a8-5087-d29959fa7c2e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c3-27a8-b1b9-a8c16aa7bc62	00010000-55c3-27a8-2c4f-2edbc83b7bfe	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c3-27a8-b961-bad67325171a	00010000-55c3-27a8-d11a-84ebd8f31a2b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c3-27a8-60e6-1b54a2a44536	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c3-27a8-557d-b97f5110bc9f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c3-27a8-da65-027d5ef7a364	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c3-27a8-592e-ec20c09ad953	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c3-27a9-4bcb-d0943a8288da	00010000-55c3-27a8-4348-670fd78c5d48	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c3-27a9-c505-06feeadd380e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c3-27a9-3730-ae35494f4cfa	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c3-27a9-8001-15523ae33351	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c3-27a9-f489-3a19ea7414c1	00010000-55c3-27a8-ba80-d27957f18a36	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 12131517)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c3-27a7-2db8-f815c20a64b7	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c3-27a7-b8f8-c32ef7b38830	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c3-27a7-6e2a-b995b347aef4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c3-27a7-becd-cf9e72c02f93	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c3-27a7-1ce6-fa99091d9e33	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c3-27a7-568e-3cb40d244c18	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c3-27a7-a4ee-12b40a4ec83c	Abonma-read	Abonma - branje	f
00030000-55c3-27a7-3c1b-e9558b818642	Abonma-write	Abonma - spreminjanje	f
00030000-55c3-27a7-7a27-97a73e9132b8	Alternacija-read	Alternacija - branje	f
00030000-55c3-27a7-7fe1-c12f5a7d954a	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c3-27a7-41b6-ede42f644cf0	Arhivalija-read	Arhivalija - branje	f
00030000-55c3-27a7-ee1d-489e545f6580	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c3-27a7-52bc-7ebcf4dcf2bb	Besedilo-read	Besedilo - branje	f
00030000-55c3-27a7-0e34-08058306f7b5	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c3-27a7-f8e3-e82faf1a3777	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c3-27a7-fbcb-a14e22fb3f71	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c3-27a7-3fae-9b81a719d21e	Dogodek-read	Dogodek - branje	f
00030000-55c3-27a7-653e-676fb48da9a8	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c3-27a7-7a3e-df76a4502472	DrugiVir-read	DrugiVir - branje	f
00030000-55c3-27a7-352b-69d04a32de3a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c3-27a7-a646-759efc2bfa58	Drzava-read	Drzava - branje	f
00030000-55c3-27a7-1197-81cb4bdc3040	Drzava-write	Drzava - spreminjanje	f
00030000-55c3-27a7-93cd-3fbac0e16578	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c3-27a7-0551-2a6d9cec6e64	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c3-27a7-42be-3113b77cde98	Funkcija-read	Funkcija - branje	f
00030000-55c3-27a7-068d-f6cbe0f5a1f0	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c3-27a7-97a5-d5d382840e14	Gostovanje-read	Gostovanje - branje	f
00030000-55c3-27a7-6034-2d542c0780d1	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c3-27a7-e326-3e9a58cd783c	Gostujoca-read	Gostujoca - branje	f
00030000-55c3-27a7-bcf9-9465600466c0	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c3-27a7-e9c3-3c7b61f1a8c2	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c3-27a7-3192-14de57b203f9	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c3-27a7-2f18-2131377aa636	Kupec-read	Kupec - branje	f
00030000-55c3-27a7-1f17-2ba091209849	Kupec-write	Kupec - spreminjanje	f
00030000-55c3-27a7-4c2b-88bbd84003c4	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c3-27a7-f01f-00a96de2d64b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c3-27a7-0860-70a176bf4e75	Option-read	Option - branje	f
00030000-55c3-27a7-f703-c0a980ac1cff	Option-write	Option - spreminjanje	f
00030000-55c3-27a7-1591-cea68e42b1a5	OptionValue-read	OptionValue - branje	f
00030000-55c3-27a7-a909-8c75ed41e51e	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c3-27a7-0fa3-99c35f3125d5	Oseba-read	Oseba - branje	f
00030000-55c3-27a7-7d3e-c0b2cb79c6f1	Oseba-write	Oseba - spreminjanje	f
00030000-55c3-27a7-856e-83eb390d5416	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c3-27a7-8a99-76596e852644	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c3-27a7-331b-0ab498a5753c	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c3-27a7-2295-7c1d4873e042	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c3-27a7-0dbb-d7bb72ba48b3	Pogodba-read	Pogodba - branje	f
00030000-55c3-27a7-6b3c-adb7f09f0bde	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c3-27a7-f112-2b7cb797e22a	Popa-read	Popa - branje	f
00030000-55c3-27a7-a918-815bb3f7669f	Popa-write	Popa - spreminjanje	f
00030000-55c3-27a7-7dd8-636cfbabc9da	Posta-read	Posta - branje	f
00030000-55c3-27a7-1445-bf95be891202	Posta-write	Posta - spreminjanje	f
00030000-55c3-27a7-52b6-99d73d72d78d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c3-27a7-ef9f-e2fa45765f9c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c3-27a7-8395-f98f8f0a2b2e	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c3-27a7-884a-d012214f6f5b	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c3-27a7-fb2f-054dbff1390c	Predstava-read	Predstava - branje	f
00030000-55c3-27a7-0336-28eb35e45ff1	Predstava-write	Predstava - spreminjanje	f
00030000-55c3-27a7-7a9c-83e6f8702bc7	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c3-27a7-5b61-6075a6776566	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c3-27a7-69b6-719260af0856	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c3-27a7-7ab1-24783a45d55a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c3-27a7-6ea5-352ce7ff017f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c3-27a7-83e7-47736b35b05c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c3-27a7-15e6-5973009b2186	ProgramDela-read	ProgramDela - branje	f
00030000-55c3-27a7-e834-fb59d02ad80a	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c3-27a7-7b8d-ad22062a5acd	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c3-27a7-fbd7-28817e198e2f	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c3-27a7-0938-91723353d357	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c3-27a7-312d-6d88afc795ee	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c3-27a7-34b0-795aa05e2be2	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c3-27a7-46a3-0f9bb60bde94	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c3-27a7-4e4f-1477d3e59382	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c3-27a7-6acf-9a2506010006	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c3-27a7-15b7-0b0d67a162a3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c3-27a7-1ba0-bc7880159d23	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c3-27a7-644d-5458cf7932eb	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c3-27a7-34e5-955cb89058c3	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c3-27a7-f59b-8668661d4f07	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c3-27a7-860e-7522653aa43f	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c3-27a7-9de0-089797cde69a	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c3-27a7-21f8-bc76bd8bf14a	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c3-27a7-d13d-7016d362f6ae	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c3-27a7-67f2-afcca8728a91	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c3-27a7-63ba-71cb5156b76d	Prostor-read	Prostor - branje	f
00030000-55c3-27a7-6fbf-783017486a86	Prostor-write	Prostor - spreminjanje	f
00030000-55c3-27a7-159a-585cb8c45c5e	Racun-read	Racun - branje	f
00030000-55c3-27a7-8300-f56c21d27547	Racun-write	Racun - spreminjanje	f
00030000-55c3-27a7-c2ed-bf8f12611b26	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c3-27a7-983a-a3bcc7a4a466	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c3-27a7-c3c4-71d9a125a6e2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c3-27a7-1e2e-a808f62804f0	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c3-27a7-3497-207e38622735	Rekvizit-read	Rekvizit - branje	f
00030000-55c3-27a7-30ba-5539d2164c1f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c3-27a7-73e4-ff9d5bf46dfc	Revizija-read	Revizija - branje	f
00030000-55c3-27a7-8703-1fa3a019f1bf	Revizija-write	Revizija - spreminjanje	f
00030000-55c3-27a7-e83a-493650d8952c	Rezervacija-read	Rezervacija - branje	f
00030000-55c3-27a7-47c5-7f62ed457d78	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c3-27a7-6721-e046ff70fe2a	SedezniRed-read	SedezniRed - branje	f
00030000-55c3-27a7-4d94-1cf46fe21a9d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c3-27a7-e3a6-3ced0d6bf92b	Sedez-read	Sedez - branje	f
00030000-55c3-27a7-895c-22cc64379e6d	Sedez-write	Sedez - spreminjanje	f
00030000-55c3-27a7-7256-4ff7fae43a96	Sezona-read	Sezona - branje	f
00030000-55c3-27a7-2f36-aff38d29c462	Sezona-write	Sezona - spreminjanje	f
00030000-55c3-27a7-9e60-e80abc8b4003	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c3-27a7-5091-fca4545742d3	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c3-27a7-f50b-e898eedd2f80	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c3-27a7-3aea-7d439f9990a8	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c3-27a7-8053-d434ad224343	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c3-27a7-6656-c15310dd6196	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c3-27a7-90fe-d694cb552b2b	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c3-27a7-8a25-b4f52aa0cb5c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c3-27a7-d3b0-720ec4743ab8	Telefonska-read	Telefonska - branje	f
00030000-55c3-27a7-f256-64b2f5333046	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c3-27a7-3b5b-d392d8b1ee85	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c3-27a7-8c03-9b3f2e2b8e4e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c3-27a7-d73e-f4f173b479b7	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c3-27a7-abc7-fe865970bbea	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c3-27a7-c37c-d642741837d6	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c3-27a7-cbf0-ce28477608c6	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c3-27a7-9dc1-4a207babc87e	Trr-read	Trr - branje	f
00030000-55c3-27a7-6993-541d4480b0d7	Trr-write	Trr - spreminjanje	f
00030000-55c3-27a7-79b8-98d01d88a70e	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c3-27a7-5d7c-153a2911c05c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c3-27a7-d2fd-32269f5d6ce3	Vaja-read	Vaja - branje	f
00030000-55c3-27a7-4815-07b67d4e3bec	Vaja-write	Vaja - spreminjanje	f
00030000-55c3-27a7-7019-fcd987001d23	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c3-27a7-feea-52341f6b0c2b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c3-27a7-c1ae-449032d188e5	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c3-27a7-0805-bc24d8b7a55b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c3-27a7-6e97-be7c1174c18c	Zasedenost-read	Zasedenost - branje	f
00030000-55c3-27a7-bf47-1f4bd6d1f484	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c3-27a7-f888-460750122b27	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c3-27a7-f243-e77e69e0d0f8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c3-27a7-5e3e-3fbe705d136e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c3-27a7-b8e5-666aeb6aba51	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c3-27a7-03e2-299e74dd72a9	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c3-27a7-5afb-ccb8a2a272ff	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c3-27a7-496c-2a3b8756657b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c3-27a7-66d7-26edd9fa44bd	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c3-27a7-987b-5ad250b10183	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c3-27a7-f15e-e5ec2e619956	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c3-27a7-a06e-dca8f30b96a7	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c3-27a7-3b16-201b46c3b32f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c3-27a7-de54-fb73f59fa71f	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c3-27a7-06cd-72c51ab38489	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c3-27a7-4af5-c2e9b5a4d514	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c3-27a7-bad1-fe4a4efdb489	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2997 (class 0 OID 12131536)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c3-27a7-de80-985c66a3f7c4	00030000-55c3-27a7-b8f8-c32ef7b38830
00020000-55c3-27a7-89eb-6efbcd8f1327	00030000-55c3-27a7-a646-759efc2bfa58
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-a4ee-12b40a4ec83c
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-3c1b-e9558b818642
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-7a27-97a73e9132b8
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-7fe1-c12f5a7d954a
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-41b6-ede42f644cf0
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-3fae-9b81a719d21e
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-becd-cf9e72c02f93
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-653e-676fb48da9a8
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-a646-759efc2bfa58
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-1197-81cb4bdc3040
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-42be-3113b77cde98
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-068d-f6cbe0f5a1f0
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-97a5-d5d382840e14
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-6034-2d542c0780d1
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-e326-3e9a58cd783c
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-bcf9-9465600466c0
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-e9c3-3c7b61f1a8c2
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-3192-14de57b203f9
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-0860-70a176bf4e75
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-1591-cea68e42b1a5
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-0fa3-99c35f3125d5
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-7d3e-c0b2cb79c6f1
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-f112-2b7cb797e22a
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-a918-815bb3f7669f
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-7dd8-636cfbabc9da
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-1445-bf95be891202
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-8395-f98f8f0a2b2e
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-884a-d012214f6f5b
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-fb2f-054dbff1390c
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-0336-28eb35e45ff1
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-6ea5-352ce7ff017f
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-83e7-47736b35b05c
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-63ba-71cb5156b76d
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-6fbf-783017486a86
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-c3c4-71d9a125a6e2
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-1e2e-a808f62804f0
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-3497-207e38622735
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-30ba-5539d2164c1f
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-7256-4ff7fae43a96
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-2f36-aff38d29c462
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-d73e-f4f173b479b7
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-79b8-98d01d88a70e
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-5d7c-153a2911c05c
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-d2fd-32269f5d6ce3
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-4815-07b67d4e3bec
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-6e97-be7c1174c18c
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-bf47-1f4bd6d1f484
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-f888-460750122b27
00020000-55c3-27a7-ffc3-3956a198c19d	00030000-55c3-27a7-5e3e-3fbe705d136e
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-a4ee-12b40a4ec83c
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-41b6-ede42f644cf0
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-3fae-9b81a719d21e
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-a646-759efc2bfa58
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-97a5-d5d382840e14
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-e326-3e9a58cd783c
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-e9c3-3c7b61f1a8c2
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-3192-14de57b203f9
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-0860-70a176bf4e75
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-1591-cea68e42b1a5
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-0fa3-99c35f3125d5
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-7d3e-c0b2cb79c6f1
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-f112-2b7cb797e22a
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-7dd8-636cfbabc9da
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-8395-f98f8f0a2b2e
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-884a-d012214f6f5b
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-fb2f-054dbff1390c
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-63ba-71cb5156b76d
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-c3c4-71d9a125a6e2
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-3497-207e38622735
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-7256-4ff7fae43a96
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-d3b0-720ec4743ab8
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-f256-64b2f5333046
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-9dc1-4a207babc87e
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-6993-541d4480b0d7
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-c1ae-449032d188e5
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-0805-bc24d8b7a55b
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-f888-460750122b27
00020000-55c3-27a7-b9fd-44cc3365f825	00030000-55c3-27a7-5e3e-3fbe705d136e
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-a4ee-12b40a4ec83c
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-7a27-97a73e9132b8
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-41b6-ede42f644cf0
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-ee1d-489e545f6580
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-52bc-7ebcf4dcf2bb
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-f8e3-e82faf1a3777
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-3fae-9b81a719d21e
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-a646-759efc2bfa58
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-42be-3113b77cde98
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-97a5-d5d382840e14
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-e326-3e9a58cd783c
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-e9c3-3c7b61f1a8c2
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-0860-70a176bf4e75
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-1591-cea68e42b1a5
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-0fa3-99c35f3125d5
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-f112-2b7cb797e22a
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-7dd8-636cfbabc9da
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-fb2f-054dbff1390c
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-6ea5-352ce7ff017f
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-63ba-71cb5156b76d
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-c3c4-71d9a125a6e2
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-3497-207e38622735
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-7256-4ff7fae43a96
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-d73e-f4f173b479b7
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-d2fd-32269f5d6ce3
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-6e97-be7c1174c18c
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-f888-460750122b27
00020000-55c3-27a7-d43a-2fc8df0445e6	00030000-55c3-27a7-5e3e-3fbe705d136e
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-a4ee-12b40a4ec83c
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-3c1b-e9558b818642
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-7fe1-c12f5a7d954a
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-41b6-ede42f644cf0
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-3fae-9b81a719d21e
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-a646-759efc2bfa58
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-97a5-d5d382840e14
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-e326-3e9a58cd783c
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-0860-70a176bf4e75
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-1591-cea68e42b1a5
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-f112-2b7cb797e22a
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-7dd8-636cfbabc9da
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-fb2f-054dbff1390c
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-63ba-71cb5156b76d
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-c3c4-71d9a125a6e2
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-3497-207e38622735
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-7256-4ff7fae43a96
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-d73e-f4f173b479b7
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-f888-460750122b27
00020000-55c3-27a7-e0ba-6cdd95c3b18e	00030000-55c3-27a7-5e3e-3fbe705d136e
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-a4ee-12b40a4ec83c
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-41b6-ede42f644cf0
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-3fae-9b81a719d21e
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-a646-759efc2bfa58
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-97a5-d5d382840e14
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-e326-3e9a58cd783c
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-0860-70a176bf4e75
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-1591-cea68e42b1a5
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-f112-2b7cb797e22a
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-7dd8-636cfbabc9da
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-fb2f-054dbff1390c
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-63ba-71cb5156b76d
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-c3c4-71d9a125a6e2
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-3497-207e38622735
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-7256-4ff7fae43a96
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-3b5b-d392d8b1ee85
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-6e2a-b995b347aef4
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-d73e-f4f173b479b7
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-f888-460750122b27
00020000-55c3-27a7-35d0-9bd5d23f600b	00030000-55c3-27a7-5e3e-3fbe705d136e
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-2db8-f815c20a64b7
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-b8f8-c32ef7b38830
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-6e2a-b995b347aef4
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-becd-cf9e72c02f93
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-1ce6-fa99091d9e33
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-568e-3cb40d244c18
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-a4ee-12b40a4ec83c
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-3c1b-e9558b818642
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-7a27-97a73e9132b8
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-7fe1-c12f5a7d954a
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-41b6-ede42f644cf0
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-ee1d-489e545f6580
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-52bc-7ebcf4dcf2bb
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-0e34-08058306f7b5
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-f8e3-e82faf1a3777
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-fbcb-a14e22fb3f71
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-3fae-9b81a719d21e
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-653e-676fb48da9a8
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-a646-759efc2bfa58
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-1197-81cb4bdc3040
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-7a3e-df76a4502472
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-352b-69d04a32de3a
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-93cd-3fbac0e16578
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-0551-2a6d9cec6e64
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-42be-3113b77cde98
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-068d-f6cbe0f5a1f0
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-97a5-d5d382840e14
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-6034-2d542c0780d1
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-e326-3e9a58cd783c
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-bcf9-9465600466c0
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-e9c3-3c7b61f1a8c2
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-3192-14de57b203f9
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-2f18-2131377aa636
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-1f17-2ba091209849
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-4c2b-88bbd84003c4
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-f01f-00a96de2d64b
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-0860-70a176bf4e75
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-f703-c0a980ac1cff
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-1591-cea68e42b1a5
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-a909-8c75ed41e51e
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-0fa3-99c35f3125d5
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-7d3e-c0b2cb79c6f1
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-856e-83eb390d5416
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-8a99-76596e852644
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-331b-0ab498a5753c
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-2295-7c1d4873e042
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-0dbb-d7bb72ba48b3
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-6b3c-adb7f09f0bde
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-f112-2b7cb797e22a
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-a918-815bb3f7669f
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-7dd8-636cfbabc9da
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-1445-bf95be891202
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-52b6-99d73d72d78d
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-ef9f-e2fa45765f9c
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-8395-f98f8f0a2b2e
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-884a-d012214f6f5b
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-fb2f-054dbff1390c
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-0336-28eb35e45ff1
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-7a9c-83e6f8702bc7
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-5b61-6075a6776566
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-69b6-719260af0856
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-7ab1-24783a45d55a
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-6ea5-352ce7ff017f
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-83e7-47736b35b05c
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-15e6-5973009b2186
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-e834-fb59d02ad80a
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-7b8d-ad22062a5acd
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-fbd7-28817e198e2f
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-0938-91723353d357
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-312d-6d88afc795ee
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-34b0-795aa05e2be2
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-46a3-0f9bb60bde94
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-4e4f-1477d3e59382
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-6acf-9a2506010006
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-15b7-0b0d67a162a3
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-1ba0-bc7880159d23
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-644d-5458cf7932eb
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-34e5-955cb89058c3
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-f59b-8668661d4f07
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-860e-7522653aa43f
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-9de0-089797cde69a
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-21f8-bc76bd8bf14a
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-d13d-7016d362f6ae
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-67f2-afcca8728a91
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-63ba-71cb5156b76d
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-6fbf-783017486a86
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-159a-585cb8c45c5e
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-8300-f56c21d27547
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-c2ed-bf8f12611b26
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-983a-a3bcc7a4a466
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-c3c4-71d9a125a6e2
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-1e2e-a808f62804f0
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-3497-207e38622735
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-30ba-5539d2164c1f
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-73e4-ff9d5bf46dfc
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-8703-1fa3a019f1bf
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-e83a-493650d8952c
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-47c5-7f62ed457d78
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-6721-e046ff70fe2a
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-4d94-1cf46fe21a9d
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-e3a6-3ced0d6bf92b
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-895c-22cc64379e6d
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-7256-4ff7fae43a96
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-2f36-aff38d29c462
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-9e60-e80abc8b4003
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-5091-fca4545742d3
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-f50b-e898eedd2f80
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-3aea-7d439f9990a8
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-8053-d434ad224343
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-6656-c15310dd6196
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-90fe-d694cb552b2b
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-8a25-b4f52aa0cb5c
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-d3b0-720ec4743ab8
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-f256-64b2f5333046
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-3b5b-d392d8b1ee85
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-8c03-9b3f2e2b8e4e
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-d73e-f4f173b479b7
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-abc7-fe865970bbea
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-c37c-d642741837d6
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-cbf0-ce28477608c6
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-9dc1-4a207babc87e
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-6993-541d4480b0d7
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-79b8-98d01d88a70e
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-5d7c-153a2911c05c
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-d2fd-32269f5d6ce3
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-4815-07b67d4e3bec
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-7019-fcd987001d23
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-feea-52341f6b0c2b
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-c1ae-449032d188e5
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-0805-bc24d8b7a55b
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-6e97-be7c1174c18c
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-bf47-1f4bd6d1f484
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-f888-460750122b27
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-f243-e77e69e0d0f8
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-5e3e-3fbe705d136e
00020000-55c3-27a8-1ca8-53249fcbea8a	00030000-55c3-27a7-b8e5-666aeb6aba51
\.


--
-- TOC entry 3025 (class 0 OID 12131835)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 12131866)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 12131980)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c3-27a9-b58c-89826d7107ed	00090000-55c3-27a8-5f8f-7c74f35fed6b	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c3-27a9-f541-74c4aefb1b39	00090000-55c3-27a8-557d-b97f5110bc9f	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c3-27a9-5e76-d6d581728599	00090000-55c3-27a9-f489-3a19ea7414c1	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3002 (class 0 OID 12131596)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c3-27a8-fa79-64de1eca69f4	00040000-55c3-27a7-0878-0a0dc63f9a6c	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-27a8-3f63-c01ad8eeb8c3	00040000-55c3-27a7-0878-0a0dc63f9a6c	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c3-27a8-4176-ad475733b536	00040000-55c3-27a7-0878-0a0dc63f9a6c	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-27a8-2a44-713433493e7f	00040000-55c3-27a7-0878-0a0dc63f9a6c	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-27a8-25a3-72c0c616d8db	00040000-55c3-27a7-0878-0a0dc63f9a6c	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-27a8-74ec-3bb065cfb15a	00040000-55c3-27a7-639e-f04624c67ab8	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-27a8-2179-b0a72dc4d4de	00040000-55c3-27a7-7deb-e47d21f5dfc1	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-27a8-d93d-97c453e0fdf6	00040000-55c3-27a7-3639-18896b61d0f1	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-27a8-f4b3-59d62ea1607c	00040000-55c3-27a7-0878-0a0dc63f9a6c	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3004 (class 0 OID 12131631)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c3-27a7-3344-bad06ba13d3d	8341	Adlešiči
00050000-55c3-27a7-b6c2-2dd005a9507f	5270	Ajdovščina
00050000-55c3-27a7-bc6a-795e1a9291fb	6280	Ankaran/Ancarano
00050000-55c3-27a7-0fdb-7c09847fcba9	9253	Apače
00050000-55c3-27a7-fcc7-656b35af2e85	8253	Artiče
00050000-55c3-27a7-7d4f-061e80289432	4275	Begunje na Gorenjskem
00050000-55c3-27a7-ad2a-81df88ec548d	1382	Begunje pri Cerknici
00050000-55c3-27a7-bf05-f5b28463a0c3	9231	Beltinci
00050000-55c3-27a7-22ab-7b0c3650c1a2	2234	Benedikt
00050000-55c3-27a7-5458-814b7e84126a	2345	Bistrica ob Dravi
00050000-55c3-27a7-6016-faa2e7db2fe4	3256	Bistrica ob Sotli
00050000-55c3-27a7-14d2-1898f728e271	8259	Bizeljsko
00050000-55c3-27a7-dfd4-d25fb9fafb5a	1223	Blagovica
00050000-55c3-27a7-4ed5-338d7591a8f1	8283	Blanca
00050000-55c3-27a7-3eb8-34981ef94578	4260	Bled
00050000-55c3-27a7-3f5e-a54f2fc86fc9	4273	Blejska Dobrava
00050000-55c3-27a7-4332-98c544805aaa	9265	Bodonci
00050000-55c3-27a7-d830-1973afc37930	9222	Bogojina
00050000-55c3-27a7-7493-8f4889e4cf7e	4263	Bohinjska Bela
00050000-55c3-27a7-109e-667e7e131d3f	4264	Bohinjska Bistrica
00050000-55c3-27a7-4382-e14f1664846f	4265	Bohinjsko jezero
00050000-55c3-27a7-8a18-16f54f019809	1353	Borovnica
00050000-55c3-27a7-7d54-c717c14dbba3	8294	Boštanj
00050000-55c3-27a7-70a9-a712b967d3a6	5230	Bovec
00050000-55c3-27a7-35cd-b257e6aa36f6	5295	Branik
00050000-55c3-27a7-ad51-2d1b26d492ea	3314	Braslovče
00050000-55c3-27a7-0718-8aa0815b7aab	5223	Breginj
00050000-55c3-27a7-a757-910e5164772e	8280	Brestanica
00050000-55c3-27a7-b21d-71fa5e0c1a3a	2354	Bresternica
00050000-55c3-27a7-beec-a8895641d727	4243	Brezje
00050000-55c3-27a7-c78e-41ef9fe34b44	1351	Brezovica pri Ljubljani
00050000-55c3-27a7-3a8f-d774ab87af8f	8250	Brežice
00050000-55c3-27a7-2c4b-93694caa45ac	4210	Brnik - Aerodrom
00050000-55c3-27a7-1d15-25a50b8ace7c	8321	Brusnice
00050000-55c3-27a7-dbef-4aa364b543d9	3255	Buče
00050000-55c3-27a7-18f8-5adef9a20f3e	8276	Bučka 
00050000-55c3-27a7-799a-407b9c64601b	9261	Cankova
00050000-55c3-27a7-a258-62c73b093418	3000	Celje 
00050000-55c3-27a7-89f7-1dc5a68a0dac	3001	Celje - poštni predali
00050000-55c3-27a7-f30b-9b22ca6fd048	4207	Cerklje na Gorenjskem
00050000-55c3-27a7-182c-127cd1c93f3f	8263	Cerklje ob Krki
00050000-55c3-27a7-42f2-48cc8c616d50	1380	Cerknica
00050000-55c3-27a7-6fae-00b6b6b4d21c	5282	Cerkno
00050000-55c3-27a7-90bc-a239b47acc20	2236	Cerkvenjak
00050000-55c3-27a7-a2cb-99bb5e9d37d9	2215	Ceršak
00050000-55c3-27a7-9b78-333c1b37540c	2326	Cirkovce
00050000-55c3-27a7-9202-837fdb8eb996	2282	Cirkulane
00050000-55c3-27a7-4f36-0c879aefa392	5273	Col
00050000-55c3-27a7-6040-51cf3ba522a2	8251	Čatež ob Savi
00050000-55c3-27a7-85d5-03b7b8d8ee25	1413	Čemšenik
00050000-55c3-27a7-596e-0bbb6f81f2ed	5253	Čepovan
00050000-55c3-27a7-c273-a070479c508c	9232	Črenšovci
00050000-55c3-27a7-030b-a9b49b3c5f05	2393	Črna na Koroškem
00050000-55c3-27a7-719b-b084151caa00	6275	Črni Kal
00050000-55c3-27a7-8fd9-e5761736fb4e	5274	Črni Vrh nad Idrijo
00050000-55c3-27a7-3127-146184ea48de	5262	Črniče
00050000-55c3-27a7-ba67-1fae3f21fed4	8340	Črnomelj
00050000-55c3-27a7-8da0-7eab4dcab404	6271	Dekani
00050000-55c3-27a7-d5a2-9bd95ff11af3	5210	Deskle
00050000-55c3-27a7-da92-9015b4ecadcf	2253	Destrnik
00050000-55c3-27a7-2cbf-9285ee66026e	6215	Divača
00050000-55c3-27a7-3f20-1d71dc1a0d3e	1233	Dob
00050000-55c3-27a7-c876-f2875eec3707	3224	Dobje pri Planini
00050000-55c3-27a7-d3f1-6ae387fbd0ed	8257	Dobova
00050000-55c3-27a7-8e61-9e65cca9dc32	1423	Dobovec
00050000-55c3-27a7-61c1-836f8f4fee5d	5263	Dobravlje
00050000-55c3-27a7-c757-ca4403f5741c	3204	Dobrna
00050000-55c3-27a7-6e3f-5157be76af39	8211	Dobrnič
00050000-55c3-27a7-d91e-da20fddce525	1356	Dobrova
00050000-55c3-27a7-f4ed-35c2393bcdbf	9223	Dobrovnik/Dobronak 
00050000-55c3-27a7-a5e6-c6f00ef4b483	5212	Dobrovo v Brdih
00050000-55c3-27a7-568b-d3405e7db4c7	1431	Dol pri Hrastniku
00050000-55c3-27a7-d893-e8d265a6b32a	1262	Dol pri Ljubljani
00050000-55c3-27a7-7233-b3db432e19ce	1273	Dole pri Litiji
00050000-55c3-27a7-07c3-0fafbff84c86	1331	Dolenja vas
00050000-55c3-27a7-ce5d-02977ccd4f41	8350	Dolenjske Toplice
00050000-55c3-27a7-1f2e-1aa2b3f57aac	1230	Domžale
00050000-55c3-27a7-27f5-1ccb7cafda8c	2252	Dornava
00050000-55c3-27a7-ea88-dce2e018b5aa	5294	Dornberk
00050000-55c3-27a7-5cc4-664dbc8ac1e2	1319	Draga
00050000-55c3-27a7-227c-8dde1e8af883	8343	Dragatuš
00050000-55c3-27a7-1ea2-177624a18c4a	3222	Dramlje
00050000-55c3-27a7-c47d-4711c0155824	2370	Dravograd
00050000-55c3-27a7-9273-64bb104a105d	4203	Duplje
00050000-55c3-27a7-33b8-c0dba70ead17	6221	Dutovlje
00050000-55c3-27a7-8725-ae0143fd6b5f	8361	Dvor
00050000-55c3-27a7-0b36-283090d1108a	2343	Fala
00050000-55c3-27a7-9dad-5c639b9c102a	9208	Fokovci
00050000-55c3-27a7-1155-07b7903db37f	2313	Fram
00050000-55c3-27a7-45f5-3cdcc06babd0	3213	Frankolovo
00050000-55c3-27a7-ace1-ef2d06940dd5	1274	Gabrovka
00050000-55c3-27a7-5962-f5728487b800	8254	Globoko
00050000-55c3-27a7-47ee-c007bfa49b0b	5275	Godovič
00050000-55c3-27a7-9e27-cf4fd821270d	4204	Golnik
00050000-55c3-27a7-34a8-f2c7ff7f6c08	3303	Gomilsko
00050000-55c3-27a7-7ce2-54fe7bbc0afe	4224	Gorenja vas
00050000-55c3-27a7-c0e4-468d2024faff	3263	Gorica pri Slivnici
00050000-55c3-27a7-f642-5f3945cdcf9c	2272	Gorišnica
00050000-55c3-27a7-ae8d-cd8bdc83c453	9250	Gornja Radgona
00050000-55c3-27a7-28c5-f0dbb0f1992f	3342	Gornji Grad
00050000-55c3-27a7-35d1-e6a203ad0ce4	4282	Gozd Martuljek
00050000-55c3-27a7-4fbf-ef26e6818ace	6272	Gračišče
00050000-55c3-27a7-9a46-d4a34a314a7c	9264	Grad
00050000-55c3-27a7-e6fe-436a4e130479	8332	Gradac
00050000-55c3-27a7-3bef-4a6a08b855ff	1384	Grahovo
00050000-55c3-27a7-4b1c-9e0bd94d8aa8	5242	Grahovo ob Bači
00050000-55c3-27a7-1592-5ab057d6b36b	5251	Grgar
00050000-55c3-27a7-669a-57ac91e0c196	3302	Griže
00050000-55c3-27a7-23d9-b2826178508d	3231	Grobelno
00050000-55c3-27a7-15b1-54165941dfad	1290	Grosuplje
00050000-55c3-27a7-3d57-cf6027031f22	2288	Hajdina
00050000-55c3-27a7-96f0-5e2965bda1cb	8362	Hinje
00050000-55c3-27a7-10bd-92d013431925	2311	Hoče
00050000-55c3-27a7-0b7d-130c8304a65c	9205	Hodoš/Hodos
00050000-55c3-27a7-9d16-af8dee4dcd83	1354	Horjul
00050000-55c3-27a7-8256-fe7ce02ef214	1372	Hotedršica
00050000-55c3-27a7-b664-82d21b2548b5	1430	Hrastnik
00050000-55c3-27a7-77d6-18df3ced2120	6225	Hruševje
00050000-55c3-27a7-1f4c-827af87d83fd	4276	Hrušica
00050000-55c3-27a7-5133-7eb9b445792b	5280	Idrija
00050000-55c3-27a7-7ea5-3b90b42b1986	1292	Ig
00050000-55c3-27a7-4633-798a184521c4	6250	Ilirska Bistrica
00050000-55c3-27a7-f0d9-de58480606c9	6251	Ilirska Bistrica-Trnovo
00050000-55c3-27a7-cb02-d5ed1d6f9b8c	1295	Ivančna Gorica
00050000-55c3-27a7-ce77-63fc3dd9bc01	2259	Ivanjkovci
00050000-55c3-27a7-c8e3-9ed08302cb07	1411	Izlake
00050000-55c3-27a7-3f83-28ef3250529b	6310	Izola/Isola
00050000-55c3-27a7-584a-d55e7ae47acb	2222	Jakobski Dol
00050000-55c3-27a7-777e-d14a4f808904	2221	Jarenina
00050000-55c3-27a7-cfa3-a243c454241b	6254	Jelšane
00050000-55c3-27a7-8d36-516d348b310e	4270	Jesenice
00050000-55c3-27a7-fbc8-64ba764d19a2	8261	Jesenice na Dolenjskem
00050000-55c3-27a7-85a1-24e31b1e2318	3273	Jurklošter
00050000-55c3-27a7-8d25-fb97019b3bfd	2223	Jurovski Dol
00050000-55c3-27a7-f751-4ca8e9534823	2256	Juršinci
00050000-55c3-27a7-d7bf-ebdf7fa4c3bb	5214	Kal nad Kanalom
00050000-55c3-27a7-54d3-5bfadf6d0442	3233	Kalobje
00050000-55c3-27a7-72a3-357340e999d8	4246	Kamna Gorica
00050000-55c3-27a7-f4c4-07150b01fca2	2351	Kamnica
00050000-55c3-27a7-8883-3bcb47e24e41	1241	Kamnik
00050000-55c3-27a7-97ef-bd4f8423a31a	5213	Kanal
00050000-55c3-27a7-6357-c7300bd92dcf	8258	Kapele
00050000-55c3-27a7-9bfd-6e8b97da8321	2362	Kapla
00050000-55c3-27a7-66cd-060406ca6861	2325	Kidričevo
00050000-55c3-27a7-1aa6-cd005a531d47	1412	Kisovec
00050000-55c3-27a7-9114-6594d9f5cc62	6253	Knežak
00050000-55c3-27a7-e75f-d1adcc2b8ebe	5222	Kobarid
00050000-55c3-27a7-af9b-76366af30137	9227	Kobilje
00050000-55c3-27a7-9a0f-45da0856213c	1330	Kočevje
00050000-55c3-27a7-3022-e4214ba0f885	1338	Kočevska Reka
00050000-55c3-27a7-b3bf-6c369217ab29	2276	Kog
00050000-55c3-27a7-bfb0-9cbd14ebb432	5211	Kojsko
00050000-55c3-27a7-32ec-b7ae8febc244	6223	Komen
00050000-55c3-27a7-d245-ba6439bc6972	1218	Komenda
00050000-55c3-27a7-037f-b7bc06ac43b9	6000	Koper/Capodistria 
00050000-55c3-27a7-ed7f-a6cefc3bd7a4	6001	Koper/Capodistria - poštni predali
00050000-55c3-27a7-e32b-02644d1fd8c5	8282	Koprivnica
00050000-55c3-27a7-b74d-e7c196fe15d8	5296	Kostanjevica na Krasu
00050000-55c3-27a7-d12f-b0dd64372d32	8311	Kostanjevica na Krki
00050000-55c3-27a7-46d0-596036cfe3dc	1336	Kostel
00050000-55c3-27a7-aac5-afe5b3697cd5	6256	Košana
00050000-55c3-27a7-fdc7-f283b584cec6	2394	Kotlje
00050000-55c3-27a7-3453-633c6496d421	6240	Kozina
00050000-55c3-27a7-1cc0-51719658eec8	3260	Kozje
00050000-55c3-27a7-434e-42d0e0fe9610	4000	Kranj 
00050000-55c3-27a7-1c46-d91af1d55922	4001	Kranj - poštni predali
00050000-55c3-27a7-f2bc-fd267e782531	4280	Kranjska Gora
00050000-55c3-27a7-fe6e-edd4a8264754	1281	Kresnice
00050000-55c3-27a7-9ab7-15a74634a6be	4294	Križe
00050000-55c3-27a7-2ea0-6ce1eb126e0f	9206	Križevci
00050000-55c3-27a7-5f49-96c4ce9bcdbe	9242	Križevci pri Ljutomeru
00050000-55c3-27a7-06ab-5691c81a9ee3	1301	Krka
00050000-55c3-27a7-a0e6-f4a5a263182f	8296	Krmelj
00050000-55c3-27a7-1625-15d06691ae56	4245	Kropa
00050000-55c3-27a7-3cdf-d8783bc97076	8262	Krška vas
00050000-55c3-27a7-d53e-2a3acee5d002	8270	Krško
00050000-55c3-27a7-5bc0-8e71c5b10f6d	9263	Kuzma
00050000-55c3-27a7-a39a-959c86420e04	2318	Laporje
00050000-55c3-27a7-abbe-496bfb1b4aba	3270	Laško
00050000-55c3-27a7-54b5-a3b9e46c23b5	1219	Laze v Tuhinju
00050000-55c3-27a7-db02-615376e7dd43	2230	Lenart v Slovenskih goricah
00050000-55c3-27a7-b79f-d834d1286a3a	9220	Lendava/Lendva
00050000-55c3-27a7-0804-cb2fc25022e7	4248	Lesce
00050000-55c3-27a7-9872-25bd21595bf3	3261	Lesično
00050000-55c3-27a7-ebb9-5e48df1c2bf0	8273	Leskovec pri Krškem
00050000-55c3-27a7-55d3-be72af689cc9	2372	Libeliče
00050000-55c3-27a7-60f0-5d17872c5959	2341	Limbuš
00050000-55c3-27a7-90b9-9b7ad17ca533	1270	Litija
00050000-55c3-27a7-a591-a38f47d6ced5	3202	Ljubečna
00050000-55c3-27a7-1d97-03504b25a7e6	1000	Ljubljana 
00050000-55c3-27a7-64ca-cfab8a64377b	1001	Ljubljana - poštni predali
00050000-55c3-27a7-3765-39686509d874	1231	Ljubljana - Črnuče
00050000-55c3-27a7-f595-a9300117641e	1261	Ljubljana - Dobrunje
00050000-55c3-27a7-e6d5-41b315d9e086	1260	Ljubljana - Polje
00050000-55c3-27a7-a7a1-356b1cded094	1210	Ljubljana - Šentvid
00050000-55c3-27a7-75b8-397e9c032e51	1211	Ljubljana - Šmartno
00050000-55c3-27a7-89be-bd62baf0e9c3	3333	Ljubno ob Savinji
00050000-55c3-27a7-9471-028f2ca8a6cc	9240	Ljutomer
00050000-55c3-27a7-25de-a33feb47199b	3215	Loče
00050000-55c3-27a7-3870-324365f4917a	5231	Log pod Mangartom
00050000-55c3-27a7-0a39-12ebfe7018db	1358	Log pri Brezovici
00050000-55c3-27a7-c07d-98302fa4d6b2	1370	Logatec
00050000-55c3-27a7-c049-7206aac4c7ce	1371	Logatec
00050000-55c3-27a7-f189-31f2f441ef91	1434	Loka pri Zidanem Mostu
00050000-55c3-27a7-1f0c-132f83e62afd	3223	Loka pri Žusmu
00050000-55c3-27a7-2d52-1840ca0dca02	6219	Lokev
00050000-55c3-27a7-f243-2ce8486e875d	1318	Loški Potok
00050000-55c3-27a7-35e6-3ed67c48ca43	2324	Lovrenc na Dravskem polju
00050000-55c3-27a7-2901-8fe3baf5bcd9	2344	Lovrenc na Pohorju
00050000-55c3-27a7-84db-4a6d432a0a18	3334	Luče
00050000-55c3-27a7-535b-4c75af3b6e1f	1225	Lukovica
00050000-55c3-27a7-e7e4-9d91a852b351	9202	Mačkovci
00050000-55c3-27a7-0315-5acae98ce193	2322	Majšperk
00050000-55c3-27a7-bf11-3cfe263a309b	2321	Makole
00050000-55c3-27a7-ef18-3e8c1d41acae	9243	Mala Nedelja
00050000-55c3-27a7-4300-52a34a76c761	2229	Malečnik
00050000-55c3-27a7-6e82-f52190eb5fbb	6273	Marezige
00050000-55c3-27a7-1f22-5c4675125589	2000	Maribor 
00050000-55c3-27a7-4b21-40c801210d03	2001	Maribor - poštni predali
00050000-55c3-27a7-f0f1-edb10cd6e55a	2206	Marjeta na Dravskem polju
00050000-55c3-27a7-7002-58284f275e4d	2281	Markovci
00050000-55c3-27a7-ccfc-ca5c0b77db65	9221	Martjanci
00050000-55c3-27a7-dfdf-31c82cf7c6a0	6242	Materija
00050000-55c3-27a7-9a0e-33cb93ddd0c3	4211	Mavčiče
00050000-55c3-27a7-e7e8-90e82a6237b2	1215	Medvode
00050000-55c3-27a7-6d16-65ae48e6a261	1234	Mengeš
00050000-55c3-27a7-35dc-23862c11c1bd	8330	Metlika
00050000-55c3-27a7-197a-3dca7cd9ffd6	2392	Mežica
00050000-55c3-27a7-b193-07c1ca2ebca2	2204	Miklavž na Dravskem polju
00050000-55c3-27a7-6ea3-f4259d7e7346	2275	Miklavž pri Ormožu
00050000-55c3-27a7-10a5-350fb72ee098	5291	Miren
00050000-55c3-27a7-6838-8a201fb05e03	8233	Mirna
00050000-55c3-27a7-fe30-ab493ad948c3	8216	Mirna Peč
00050000-55c3-27a7-8b5d-abd272d72db7	2382	Mislinja
00050000-55c3-27a7-db4d-0a92c68bf733	4281	Mojstrana
00050000-55c3-27a7-0579-bbdbd9c2a43a	8230	Mokronog
00050000-55c3-27a7-a324-69a069d6fca5	1251	Moravče
00050000-55c3-27a7-81a5-a2e385cef578	9226	Moravske Toplice
00050000-55c3-27a7-db66-4a48fbb29298	5216	Most na Soči
00050000-55c3-27a7-d5c4-0eb3fae96461	1221	Motnik
00050000-55c3-27a7-d684-263700ea59ce	3330	Mozirje
00050000-55c3-27a7-cd95-412c3a71bfec	9000	Murska Sobota 
00050000-55c3-27a7-5985-dd2133b84771	9001	Murska Sobota - poštni predali
00050000-55c3-27a7-06c9-180ff2655e29	2366	Muta
00050000-55c3-27a7-5d3b-bd971c9eccb9	4202	Naklo
00050000-55c3-27a7-7155-9d1731790e20	3331	Nazarje
00050000-55c3-27a7-4abd-50b2351daaf4	1357	Notranje Gorice
00050000-55c3-27a7-838d-1c30f852de69	3203	Nova Cerkev
00050000-55c3-27a7-6934-16ca50fdddde	5000	Nova Gorica 
00050000-55c3-27a7-5924-106af5b82d22	5001	Nova Gorica - poštni predali
00050000-55c3-27a7-c850-a06d45876d32	1385	Nova vas
00050000-55c3-27a7-446e-10d3a7140508	8000	Novo mesto
00050000-55c3-27a7-464d-5b18638e0aa1	8001	Novo mesto - poštni predali
00050000-55c3-27a7-2d5e-e34aab5276db	6243	Obrov
00050000-55c3-27a7-5c8e-5578ea495cf6	9233	Odranci
00050000-55c3-27a7-d053-98dc4b631d13	2317	Oplotnica
00050000-55c3-27a7-0fa4-ab09544ff228	2312	Orehova vas
00050000-55c3-27a7-8490-710c07faeb0a	2270	Ormož
00050000-55c3-27a7-e8be-ae2ce3df85d6	1316	Ortnek
00050000-55c3-27a7-2791-86329a78eb18	1337	Osilnica
00050000-55c3-27a7-eaeb-2213b3bad456	8222	Otočec
00050000-55c3-27a7-1dbc-2685f92c105d	2361	Ožbalt
00050000-55c3-27a7-5696-c8e368f600d8	2231	Pernica
00050000-55c3-27a7-982d-80c270f66387	2211	Pesnica pri Mariboru
00050000-55c3-27a7-695c-29f1db216b64	9203	Petrovci
00050000-55c3-27a7-35aa-f652a550634c	3301	Petrovče
00050000-55c3-27a7-c09a-142ea147f058	6330	Piran/Pirano
00050000-55c3-27a7-c477-652a6456edbb	8255	Pišece
00050000-55c3-27a7-148c-5815d6f57c8f	6257	Pivka
00050000-55c3-27a7-cf1e-364d837d576a	6232	Planina
00050000-55c3-27a7-4fd2-9d957c0dc104	3225	Planina pri Sevnici
00050000-55c3-27a7-23b8-a44134920443	6276	Pobegi
00050000-55c3-27a7-354b-ea9102562bf5	8312	Podbočje
00050000-55c3-27a7-0f2f-9ce9d0c7240a	5243	Podbrdo
00050000-55c3-27a7-680e-621285f8c4de	3254	Podčetrtek
00050000-55c3-27a7-c459-b56bcb4bf2b2	2273	Podgorci
00050000-55c3-27a7-144e-22b44aef49dd	6216	Podgorje
00050000-55c3-27a7-b576-1542b5387162	2381	Podgorje pri Slovenj Gradcu
00050000-55c3-27a7-cceb-f0dcdaec3a98	6244	Podgrad
00050000-55c3-27a7-c570-1113adb8b9f6	1414	Podkum
00050000-55c3-27a7-43dc-83f9520e6b11	2286	Podlehnik
00050000-55c3-27a7-70cc-9bac66d8f45b	5272	Podnanos
00050000-55c3-27a7-b29e-5eb1b278e42f	4244	Podnart
00050000-55c3-27a7-2d6e-9721df6e55d6	3241	Podplat
00050000-55c3-27a7-c143-54c325457b47	3257	Podsreda
00050000-55c3-27a7-a0b3-10b7d0f97d63	2363	Podvelka
00050000-55c3-27a7-6e9e-f5c8e4452928	2208	Pohorje
00050000-55c3-27a7-8d3f-87ff08565fca	2257	Polenšak
00050000-55c3-27a7-4033-d75858d36c1c	1355	Polhov Gradec
00050000-55c3-27a7-efd4-8ca552d1369b	4223	Poljane nad Škofjo Loko
00050000-55c3-27a7-3299-9a77f2819c17	2319	Poljčane
00050000-55c3-27a7-9ae2-5674713f7e45	1272	Polšnik
00050000-55c3-27a7-415b-b7fac5b3eeb7	3313	Polzela
00050000-55c3-27a7-1d73-ecc8c00c6bd8	3232	Ponikva
00050000-55c3-27a7-8e1b-7878c1094876	6320	Portorož/Portorose
00050000-55c3-27a7-8585-3caa9ad5f94d	6230	Postojna
00050000-55c3-27a7-46d0-8e7d223153c4	2331	Pragersko
00050000-55c3-27a7-2e3f-18c5c3505377	3312	Prebold
00050000-55c3-27a7-21e2-76f06788f031	4205	Preddvor
00050000-55c3-27a7-e497-a989b69985fd	6255	Prem
00050000-55c3-27a7-e65f-3ec02bbf970b	1352	Preserje
00050000-55c3-27a7-52eb-e0850c7b3854	6258	Prestranek
00050000-55c3-27a7-370c-ba9473fe5c8a	2391	Prevalje
00050000-55c3-27a7-6f95-d31e785e911e	3262	Prevorje
00050000-55c3-27a7-ba63-e3f36ee9c138	1276	Primskovo 
00050000-55c3-27a7-4864-535f57e00066	3253	Pristava pri Mestinju
00050000-55c3-27a7-81d5-80d6029d503a	9207	Prosenjakovci/Partosfalva
00050000-55c3-27a7-ce61-364a0dac23dc	5297	Prvačina
00050000-55c3-27a7-f7c4-0a7a23b5ec5b	2250	Ptuj
00050000-55c3-27a7-426b-5fbf75ec934d	2323	Ptujska Gora
00050000-55c3-27a7-7323-6cf2df5ed24b	9201	Puconci
00050000-55c3-27a7-734d-14933971b913	2327	Rače
00050000-55c3-27a7-5c50-0de03a6878ef	1433	Radeče
00050000-55c3-27a7-8218-e2f901f893f5	9252	Radenci
00050000-55c3-27a7-81c1-c56bf7128477	2360	Radlje ob Dravi
00050000-55c3-27a7-7948-a7b47b6b6b24	1235	Radomlje
00050000-55c3-27a7-63a2-ac628d4b8881	4240	Radovljica
00050000-55c3-27a7-2dbb-046e03c9c855	8274	Raka
00050000-55c3-27a7-962f-5dfaa8e7558b	1381	Rakek
00050000-55c3-27a7-3ee5-7cf5f9408d92	4283	Rateče - Planica
00050000-55c3-27a7-f7ea-17b4a9b3da9d	2390	Ravne na Koroškem
00050000-55c3-27a7-9bf3-6bea27e9d7cf	9246	Razkrižje
00050000-55c3-27a7-07f1-0cc49278d0f7	3332	Rečica ob Savinji
00050000-55c3-27a7-8e83-cb216f891067	5292	Renče
00050000-55c3-27a7-bee7-d09f24ae28e1	1310	Ribnica
00050000-55c3-27a7-4f0f-6abbe588db3f	2364	Ribnica na Pohorju
00050000-55c3-27a7-b390-7615f1d40b26	3272	Rimske Toplice
00050000-55c3-27a7-53ea-ce3db020c017	1314	Rob
00050000-55c3-27a7-461d-867e95410b1e	5215	Ročinj
00050000-55c3-27a7-c86e-8632ad3df747	3250	Rogaška Slatina
00050000-55c3-27a7-8ffb-1b93e43c1bf3	9262	Rogašovci
00050000-55c3-27a7-9349-73e9c92277fa	3252	Rogatec
00050000-55c3-27a7-c78b-a59d75502626	1373	Rovte
00050000-55c3-27a7-ac73-cbec223ef0f2	2342	Ruše
00050000-55c3-27a7-cb67-71cbb3b9384c	1282	Sava
00050000-55c3-27a7-9075-1cc4da612ca8	6333	Sečovlje/Sicciole
00050000-55c3-27a7-5f4e-f5f7b461d5f6	4227	Selca
00050000-55c3-27a7-c10a-4d168b5617c2	2352	Selnica ob Dravi
00050000-55c3-27a7-e2d9-1b58f17f5f1c	8333	Semič
00050000-55c3-27a7-6555-b63c5cb4cba2	8281	Senovo
00050000-55c3-27a7-a188-75dd4c47b287	6224	Senožeče
00050000-55c3-27a7-b5e6-9bb795d7566e	8290	Sevnica
00050000-55c3-27a7-6138-cfa1c87b8ed3	6210	Sežana
00050000-55c3-27a7-f7d9-f33e34d28ab1	2214	Sladki Vrh
00050000-55c3-27a7-6529-0b42d64366c6	5283	Slap ob Idrijci
00050000-55c3-27a7-695d-035c09ba88aa	2380	Slovenj Gradec
00050000-55c3-27a7-55f9-4dc096e5d720	2310	Slovenska Bistrica
00050000-55c3-27a7-5adc-774ab24b0382	3210	Slovenske Konjice
00050000-55c3-27a7-ca19-d3ae2d9ac805	1216	Smlednik
00050000-55c3-27a7-d1aa-9cfffcb5c674	5232	Soča
00050000-55c3-27a7-9f47-5fcbc4dcaf5a	1317	Sodražica
00050000-55c3-27a7-69bf-86b6a4d52aac	3335	Solčava
00050000-55c3-27a7-c2e4-881532e2c48a	5250	Solkan
00050000-55c3-27a7-3a47-7b8fc21c51b1	4229	Sorica
00050000-55c3-27a7-0e60-2ae00f33f051	4225	Sovodenj
00050000-55c3-27a7-3882-c5b179ff47ba	5281	Spodnja Idrija
00050000-55c3-27a7-3158-89751edf7009	2241	Spodnji Duplek
00050000-55c3-27a7-c2c6-0aec56a67b1e	9245	Spodnji Ivanjci
00050000-55c3-27a7-fd36-9d62b2d405ab	2277	Središče ob Dravi
00050000-55c3-27a7-c80a-59b6be05bf60	4267	Srednja vas v Bohinju
00050000-55c3-27a7-06e5-101c946fccdb	8256	Sromlje 
00050000-55c3-27a7-e279-6f16ee7aed96	5224	Srpenica
00050000-55c3-27a7-d328-329dd9025071	1242	Stahovica
00050000-55c3-27a7-9514-70f543c259ac	1332	Stara Cerkev
00050000-55c3-27a7-d048-312c54dbb783	8342	Stari trg ob Kolpi
00050000-55c3-27a7-2057-061c874bb79c	1386	Stari trg pri Ložu
00050000-55c3-27a7-8025-e70dc714de70	2205	Starše
00050000-55c3-27a7-e6aa-3d27d724db6b	2289	Stoperce
00050000-55c3-27a7-03cb-e1d34f2bf713	8322	Stopiče
00050000-55c3-27a7-b35e-1dea91737883	3206	Stranice
00050000-55c3-27a7-b706-5a79c4700ede	8351	Straža
00050000-55c3-27a7-42ef-38f7c6f2d09c	1313	Struge
00050000-55c3-27a7-636c-8b2e83618ea0	8293	Studenec
00050000-55c3-27a7-732c-9c9dc9e97a1b	8331	Suhor
00050000-55c3-27a7-2804-5af4776de3f0	2233	Sv. Ana v Slovenskih goricah
00050000-55c3-27a7-1e26-64b04b06d7b1	2235	Sv. Trojica v Slovenskih goricah
00050000-55c3-27a7-b449-dc83328eaa32	2353	Sveti Duh na Ostrem Vrhu
00050000-55c3-27a7-e632-984eba5ca400	9244	Sveti Jurij ob Ščavnici
00050000-55c3-27a7-5825-9a39a61f10bd	3264	Sveti Štefan
00050000-55c3-27a7-028d-94966e0ae30d	2258	Sveti Tomaž
00050000-55c3-27a7-7636-16a5d1a4282d	9204	Šalovci
00050000-55c3-27a7-3500-2dfb1b20c2c7	5261	Šempas
00050000-55c3-27a7-884c-b00674a041a8	5290	Šempeter pri Gorici
00050000-55c3-27a7-ad06-d98f6a1a5dab	3311	Šempeter v Savinjski dolini
00050000-55c3-27a7-938e-651078bca41d	4208	Šenčur
00050000-55c3-27a7-1079-cbf23efecf9c	2212	Šentilj v Slovenskih goricah
00050000-55c3-27a7-f9b9-c6e04863aacd	8297	Šentjanž
00050000-55c3-27a7-4619-d2623b86be2d	2373	Šentjanž pri Dravogradu
00050000-55c3-27a7-c608-07206f5c7ef5	8310	Šentjernej
00050000-55c3-27a7-c58a-f31c02150b6b	3230	Šentjur
00050000-55c3-27a7-d1ca-fc6eb33d9b4e	3271	Šentrupert
00050000-55c3-27a7-170a-4dbddc9071f7	8232	Šentrupert
00050000-55c3-27a7-9156-a6f891b703fd	1296	Šentvid pri Stični
00050000-55c3-27a7-4daa-e6a480153237	8275	Škocjan
00050000-55c3-27a7-b895-872a4d7c7144	6281	Škofije
00050000-55c3-27a7-3718-14788b9503e8	4220	Škofja Loka
00050000-55c3-27a7-adb7-159ee5f24b4b	3211	Škofja vas
00050000-55c3-27a7-b41c-704b8663ef2a	1291	Škofljica
00050000-55c3-27a7-bb3f-60127881e82d	6274	Šmarje
00050000-55c3-27a7-6759-cb42ee77e046	1293	Šmarje - Sap
00050000-55c3-27a7-d10b-afbdd6e929d5	3240	Šmarje pri Jelšah
00050000-55c3-27a7-cf97-9c9fdcfc9649	8220	Šmarješke Toplice
00050000-55c3-27a7-06a6-2f1382ad74c8	2315	Šmartno na Pohorju
00050000-55c3-27a7-0843-104449e08f76	3341	Šmartno ob Dreti
00050000-55c3-27a7-a316-ef331d24fb88	3327	Šmartno ob Paki
00050000-55c3-27a7-1ae6-85a4a0238386	1275	Šmartno pri Litiji
00050000-55c3-27a7-644c-cc68b82c45b5	2383	Šmartno pri Slovenj Gradcu
00050000-55c3-27a7-e80c-b64e2e364830	3201	Šmartno v Rožni dolini
00050000-55c3-27a7-b156-d6998777ddec	3325	Šoštanj
00050000-55c3-27a7-3839-b55832e75ed2	6222	Štanjel
00050000-55c3-27a7-5b21-8d92f21df0c0	3220	Štore
00050000-55c3-27a7-87a5-90140ec89401	3304	Tabor
00050000-55c3-27a7-4100-e84920980cb7	3221	Teharje
00050000-55c3-27a7-8229-b09d37b77a46	9251	Tišina
00050000-55c3-27a7-3b32-c95c35b5ea3f	5220	Tolmin
00050000-55c3-27a7-f4c0-fdfd3c0e4bf0	3326	Topolšica
00050000-55c3-27a7-8658-9a207af61374	2371	Trbonje
00050000-55c3-27a7-376a-486a207820fe	1420	Trbovlje
00050000-55c3-27a7-8035-7bfd428d0a64	8231	Trebelno 
00050000-55c3-27a7-140f-a0c3c448c4ec	8210	Trebnje
00050000-55c3-27a7-9fb3-ab8ca47c2917	5252	Trnovo pri Gorici
00050000-55c3-27a7-e4b7-71761bc41cdf	2254	Trnovska vas
00050000-55c3-27a7-d5c6-d8f4e3a03fb7	1222	Trojane
00050000-55c3-27a7-83d1-54d481e96581	1236	Trzin
00050000-55c3-27a7-ec58-8b1542038c43	4290	Tržič
00050000-55c3-27a7-45e3-bea7836dc086	8295	Tržišče
00050000-55c3-27a7-bd11-e0971fa5ddd8	1311	Turjak
00050000-55c3-27a7-4af7-4cdc749db16e	9224	Turnišče
00050000-55c3-27a7-521c-1b8db34e0b03	8323	Uršna sela
00050000-55c3-27a7-5f7e-206d73c815d1	1252	Vače
00050000-55c3-27a7-e0c8-6399c83a2c0c	3320	Velenje 
00050000-55c3-27a7-4257-198837551cee	3322	Velenje - poštni predali
00050000-55c3-27a7-f6ed-4e15f614b413	8212	Velika Loka
00050000-55c3-27a7-2e26-1a83b1f24ccf	2274	Velika Nedelja
00050000-55c3-27a7-affc-c4cd6e787ba0	9225	Velika Polana
00050000-55c3-27a7-ceb0-3c147e4514ef	1315	Velike Lašče
00050000-55c3-27a7-09b4-ca9e94f7fb26	8213	Veliki Gaber
00050000-55c3-27a7-886b-a0ac7c752992	9241	Veržej
00050000-55c3-27a7-d5f6-8d021ae5f0ca	1312	Videm - Dobrepolje
00050000-55c3-27a7-9b2a-7e4f4269098b	2284	Videm pri Ptuju
00050000-55c3-27a7-9a2a-6b2f2b116ca1	8344	Vinica
00050000-55c3-27a7-5dda-085f494a696b	5271	Vipava
00050000-55c3-27a7-30f3-388e585df28e	4212	Visoko
00050000-55c3-27a7-c3d4-9c96bc194e4a	1294	Višnja Gora
00050000-55c3-27a7-2570-163b29302456	3205	Vitanje
00050000-55c3-27a7-235c-fa344376a945	2255	Vitomarci
00050000-55c3-27a7-b7a6-7d3404805a9d	1217	Vodice
00050000-55c3-27a7-6cb1-c299af64662a	3212	Vojnik\t
00050000-55c3-27a7-035e-b5b7500d31c8	5293	Volčja Draga
00050000-55c3-27a7-50d3-dda859bdf2b0	2232	Voličina
00050000-55c3-27a7-4db2-be9da384251a	3305	Vransko
00050000-55c3-27a7-bc11-8b1212f7a1f6	6217	Vremski Britof
00050000-55c3-27a7-5d65-0ecceb911942	1360	Vrhnika
00050000-55c3-27a7-7028-c2eca6c8424e	2365	Vuhred
00050000-55c3-27a7-ece6-2d705c6d4f98	2367	Vuzenica
00050000-55c3-27a7-c73c-8cca501810fc	8292	Zabukovje 
00050000-55c3-27a7-27a1-b4814f015f51	1410	Zagorje ob Savi
00050000-55c3-27a7-3c43-7103f53c66dd	1303	Zagradec
00050000-55c3-27a7-2305-814f9ccc9f92	2283	Zavrč
00050000-55c3-27a7-4feb-a8ce0c856de3	8272	Zdole 
00050000-55c3-27a7-84a5-2acb0d62a3db	4201	Zgornja Besnica
00050000-55c3-27a7-f009-0c2497d66946	2242	Zgornja Korena
00050000-55c3-27a7-4408-24840ec7fddb	2201	Zgornja Kungota
00050000-55c3-27a7-a14c-1a5950cfeedf	2316	Zgornja Ložnica
00050000-55c3-27a7-73b2-da1cbc10dcfe	2314	Zgornja Polskava
00050000-55c3-27a7-334f-49bcf3ec723b	2213	Zgornja Velka
00050000-55c3-27a7-da57-c20e9dd93444	4247	Zgornje Gorje
00050000-55c3-27a7-26ac-571caf987d6f	4206	Zgornje Jezersko
00050000-55c3-27a7-f939-20994c93d83e	2285	Zgornji Leskovec
00050000-55c3-27a7-f4e9-fd6bc5d74b00	1432	Zidani Most
00050000-55c3-27a7-cb08-9fc0f727d51e	3214	Zreče
00050000-55c3-27a7-7278-e5353a66ac17	4209	Žabnica
00050000-55c3-27a7-a30a-9073a9591397	3310	Žalec
00050000-55c3-27a7-96c4-2ba7e11623c1	4228	Železniki
00050000-55c3-27a7-22d9-9bf7b6130e7e	2287	Žetale
00050000-55c3-27a7-48b5-89a22d92d823	4226	Žiri
00050000-55c3-27a7-9cbb-9a6c8476e537	4274	Žirovnica
00050000-55c3-27a7-d7d5-50164a2f0ca5	8360	Žužemberk
\.


--
-- TOC entry 3021 (class 0 OID 12131809)
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
-- TOC entry 3003 (class 0 OID 12131616)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 12131694)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 12131821)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 12132152)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 12132162)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c3-27a8-5134-fe7075d09c89	00080000-55c3-27a8-f4b3-59d62ea1607c	0900	AK
00190000-55c3-27a9-1dd6-e3f62b35ae2e	00080000-55c3-27a8-4176-ad475733b536	0987	AK
00190000-55c3-27a9-0a0e-91fa870aacf5	00080000-55c3-27a8-3f63-c01ad8eeb8c3	0989	AK
00190000-55c3-27a9-2d4f-b69c4ba35ca8	00080000-55c3-27a8-2a44-713433493e7f	0986	AK
00190000-55c3-27a9-8037-9c7fdd16a744	00080000-55c3-27a8-74ec-3bb065cfb15a	0984	AK
00190000-55c3-27a9-704c-1c6c9ebb9ac5	00080000-55c3-27a8-2179-b0a72dc4d4de	0983	AK
00190000-55c3-27a9-36cc-8ddba891d48c	00080000-55c3-27a8-d93d-97c453e0fdf6	0982	AK
\.


--
-- TOC entry 3045 (class 0 OID 12132108)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c3-27a9-6954-0d6dbe7bb703	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3048 (class 0 OID 12132170)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 12131850)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c3-27a8-0ded-b12ba7752732	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c3-27a8-4bfe-bbf7d3e6b99a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c3-27a8-b4c9-e2f6ff0b9f2d	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c3-27a8-b541-35561af53cff	0004	Mali oder	t	24	Mali oder 
00220000-55c3-27a8-9571-0d7e84ddb33f	0005	Komorni oder	t	15	Komorni oder
00220000-55c3-27a8-51bb-12d596a54f37	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c3-27a8-ff56-289f949875ad	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3019 (class 0 OID 12131794)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 12131784)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 12131969)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 12131918)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 12131488)
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
-- TOC entry 3028 (class 0 OID 12131860)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 12131526)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c3-27a7-de80-985c66a3f7c4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c3-27a7-89eb-6efbcd8f1327	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c3-27a7-3322-d1df7ee7a7f3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c3-27a7-404f-3fcfd58cf916	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c3-27a7-ffc3-3956a198c19d	planer	Planer dogodkov v koledarju	t
00020000-55c3-27a7-b9fd-44cc3365f825	kadrovska	Kadrovska služba	t
00020000-55c3-27a7-d43a-2fc8df0445e6	arhivar	Ažuriranje arhivalij	t
00020000-55c3-27a7-e0ba-6cdd95c3b18e	igralec	Igralec	t
00020000-55c3-27a7-35d0-9bd5d23f600b	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c3-27a8-1ca8-53249fcbea8a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2994 (class 0 OID 12131510)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c3-27a7-7941-c7a41bfe96a3	00020000-55c3-27a7-3322-d1df7ee7a7f3
00010000-55c3-27a7-f975-a12e7363664b	00020000-55c3-27a7-3322-d1df7ee7a7f3
00010000-55c3-27a8-7342-64edc8fc3ae3	00020000-55c3-27a8-1ca8-53249fcbea8a
\.


--
-- TOC entry 3030 (class 0 OID 12131874)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 12131815)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 12131761)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 12132211)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c3-27a7-e7cf-cd45f5a29204	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c3-27a7-84f0-a8248029fb9d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c3-27a7-fc46-4d87c0f9860e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c3-27a7-9076-a028fb56dd2c	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c3-27a7-6d27-2ee6a8ce9988	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3052 (class 0 OID 12132203)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c3-27a8-7ae7-44b7ecc228e6	00230000-55c3-27a7-9076-a028fb56dd2c	popa
00240000-55c3-27a8-756b-05e276ae0cf0	00230000-55c3-27a7-9076-a028fb56dd2c	oseba
00240000-55c3-27a8-0a56-7d9d8dc8349a	00230000-55c3-27a7-9076-a028fb56dd2c	sezona
00240000-55c3-27a8-11b6-9f92c0acb1f8	00230000-55c3-27a7-84f0-a8248029fb9d	prostor
00240000-55c3-27a8-76b8-73aa84b1b56f	00230000-55c3-27a7-9076-a028fb56dd2c	besedilo
00240000-55c3-27a8-89bd-f59c5bf67597	00230000-55c3-27a7-9076-a028fb56dd2c	uprizoritev
00240000-55c3-27a8-be45-be4f5cac9012	00230000-55c3-27a7-9076-a028fb56dd2c	funkcija
00240000-55c3-27a8-259d-9ff1e67aa36f	00230000-55c3-27a7-9076-a028fb56dd2c	tipfunkcije
00240000-55c3-27a8-dce7-38aa7ae04fa0	00230000-55c3-27a7-9076-a028fb56dd2c	alternacija
00240000-55c3-27a8-eaf1-86b72ac75079	00230000-55c3-27a7-e7cf-cd45f5a29204	pogodba
00240000-55c3-27a8-796f-efc9811d128e	00230000-55c3-27a7-9076-a028fb56dd2c	zaposlitev
00240000-55c3-27a8-f725-69b887a65091	00230000-55c3-27a7-e7cf-cd45f5a29204	programdela
00240000-55c3-27a8-dbd6-d243f81fa0c5	00230000-55c3-27a7-9076-a028fb56dd2c	zapis
\.


--
-- TOC entry 3051 (class 0 OID 12132198)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 12131928)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c3-27a9-84ea-4e888068a073	000e0000-55c3-27a9-9db5-9e0bfe869bd2	00080000-55c3-27a8-fa79-64de1eca69f4	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c3-27a9-4756-145a44912e77	000e0000-55c3-27a9-9db5-9e0bfe869bd2	00080000-55c3-27a8-fa79-64de1eca69f4	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c3-27a9-35d7-cac78ad48982	000e0000-55c3-27a9-9db5-9e0bfe869bd2	00080000-55c3-27a8-25a3-72c0c616d8db	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c3-27a9-aaad-4d4aec097311	000e0000-55c3-27a9-9db5-9e0bfe869bd2	00080000-55c3-27a8-25a3-72c0c616d8db	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3001 (class 0 OID 12131588)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 12131771)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c3-27a9-99b1-0f0ab256df83	00180000-55c3-27a9-6b9a-dd312fec998b	000c0000-55c3-27a9-17e9-53b7248aa6e3	00090000-55c3-27a9-4bcb-d0943a8288da	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-27a9-1cd8-877524160159	00180000-55c3-27a9-6b9a-dd312fec998b	000c0000-55c3-27a9-7edd-67c14cbcc4d4	00090000-55c3-27a9-c505-06feeadd380e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-27a9-c73b-95e691ceb3b0	00180000-55c3-27a9-6b9a-dd312fec998b	000c0000-55c3-27a9-6df1-a192d5e23720	00090000-55c3-27a8-b1b9-a8c16aa7bc62	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-27a9-abbb-c47b1cea8e53	00180000-55c3-27a9-6b9a-dd312fec998b	000c0000-55c3-27a9-a5fb-ed497b0a06d4	00090000-55c3-27a8-489c-99624bd65d1d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-27a9-7fb8-d226fdc95d64	00180000-55c3-27a9-6b9a-dd312fec998b	000c0000-55c3-27a9-6c9a-a6dd4e0ada78	00090000-55c3-27a9-8001-15523ae33351	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-27a9-7a74-52e9312435e1	00180000-55c3-27a9-265c-f21b6ff93529	\N	00090000-55c3-27a9-8001-15523ae33351	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3037 (class 0 OID 12131958)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c3-27a8-fe03-f0e1c9a36cd2	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c3-27a8-3182-b3b910148894	Priredba	Priredba	Priredba	umetnik
000f0000-55c3-27a8-ca12-58e208afb3ec	Prevod	Prevod	Prevod	umetnik
000f0000-55c3-27a8-8d26-ac336faff7e7	Režija	Režija	Režija	umetnik
000f0000-55c3-27a8-7b52-43ef1d53f16b	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c3-27a8-a4de-045e370446b0	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c3-27a8-aa6c-b562a9163dc6	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c3-27a8-9bc1-4a6a963fcf4b	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c3-27a8-1230-5757eaeb9bb8	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c3-27a8-270f-1f03d85098e1	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c3-27a8-b152-9d6a27edf3dc	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c3-27a8-9e9b-b9237b48faea	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c3-27a8-957c-b813c7688fc1	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c3-27a8-f29a-11810d8e3f40	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c3-27a8-fb43-045b8f3610a9	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c3-27a8-98fb-1d044bb19cdb	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c3-27a8-57b9-37ee4f3eda4a	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c3-27a8-b17f-04733c97c49a	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3049 (class 0 OID 12132180)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c3-27a8-e83d-19001bc6456c	01	Velika predstava	f	1.00	1.00
002b0000-55c3-27a8-e678-4f8a4e6a83b9	02	Mala predstava	f	0.50	0.50
002b0000-55c3-27a8-8c7d-3b622a0df06e	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c3-27a8-2343-7a69bfe03c85	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c3-27a8-9aab-4b2ae630b3cb	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3006 (class 0 OID 12131651)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 12131497)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c3-27a7-f975-a12e7363664b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROaa/MN1hSaGKiw3J3FQW8zTfGaucu90O	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c3-27a8-2c4f-2edbc83b7bfe	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c3-27a8-5087-d29959fa7c2e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c3-27a8-4348-670fd78c5d48	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c3-27a8-ba80-d27957f18a36	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c3-27a8-d11a-84ebd8f31a2b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c3-27a8-5f23-0a725ed7d0b6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c3-27a8-4839-72fd7de69bf3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c3-27a8-a9e0-69767cc58612	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c3-27a8-fc68-403d01603b41	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c3-27a8-7342-64edc8fc3ae3	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c3-27a7-7941-c7a41bfe96a3	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 12132006)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c3-27a9-c665-88001496df78	00160000-55c3-27a8-3d87-564cb6015faf	00150000-55c3-27a8-d9a6-cf4e918927bc	00140000-55c3-27a7-3060-e34355b7f7cc	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c3-27a8-9571-0d7e84ddb33f
000e0000-55c3-27a9-9db5-9e0bfe869bd2	00160000-55c3-27a8-7c6d-5afb286af522	00150000-55c3-27a8-1cf7-030e8e0db394	00140000-55c3-27a7-b55d-f2d593bdd64a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c3-27a8-51bb-12d596a54f37
000e0000-55c3-27a9-35f2-9e0d4e36fa09	\N	00150000-55c3-27a8-1cf7-030e8e0db394	00140000-55c3-27a7-b55d-f2d593bdd64a	00190000-55c3-27a9-1dd6-e3f62b35ae2e	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c3-27a8-9571-0d7e84ddb33f
000e0000-55c3-27a9-c90d-ed8ae14d738e	\N	00150000-55c3-27a8-1cf7-030e8e0db394	00140000-55c3-27a7-b55d-f2d593bdd64a	00190000-55c3-27a9-1dd6-e3f62b35ae2e	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c3-27a8-9571-0d7e84ddb33f
000e0000-55c3-27a9-21b8-344561d63fe7	\N	00150000-55c3-27a8-1cf7-030e8e0db394	00140000-55c3-27a7-b55d-f2d593bdd64a	00190000-55c3-27a9-1dd6-e3f62b35ae2e	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c3-27a8-0ded-b12ba7752732
\.


--
-- TOC entry 3011 (class 0 OID 12131713)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c3-27a9-64ae-53ea7eabe13f	000e0000-55c3-27a9-9db5-9e0bfe869bd2	1	
00200000-55c3-27a9-5bc7-6e4ffe153235	000e0000-55c3-27a9-9db5-9e0bfe869bd2	2	
\.


--
-- TOC entry 3026 (class 0 OID 12131842)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 12132250)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 12132222)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 12132262)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 12131911)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c3-27a9-98a6-a85fd7a02ad4	00090000-55c3-27a9-c505-06feeadd380e	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-27a9-d71a-c7f04d49bd2b	00090000-55c3-27a8-b1b9-a8c16aa7bc62	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-27a9-b671-8dd4c239a942	00090000-55c3-27a8-592e-ec20c09ad953	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-27a9-52e7-b7b5204ef59f	00090000-55c3-27a8-b961-bad67325171a	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-27a9-1876-75d850d5d204	00090000-55c3-27a9-4bcb-d0943a8288da	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-27a9-ac5c-8c568bf790ae	00090000-55c3-27a8-da65-027d5ef7a364	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3013 (class 0 OID 12131745)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 12131996)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c3-27a7-3060-e34355b7f7cc	01	Drama	drama (SURS 01)
00140000-55c3-27a7-807d-2e2bb51bb616	02	Opera	opera (SURS 02)
00140000-55c3-27a7-c500-2f57d044ec67	03	Balet	balet (SURS 03)
00140000-55c3-27a7-e283-d33fb20fe1e5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c3-27a7-ecb4-4f072268c36c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c3-27a7-b55d-f2d593bdd64a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c3-27a7-de0e-5236ef827918	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3032 (class 0 OID 12131901)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c3-27a8-b233-f38351789116	01	Opera	opera
00150000-55c3-27a8-7e97-2a5f37dbcaba	02	Opereta	opereta
00150000-55c3-27a8-fbbb-199e6377a79d	03	Balet	balet
00150000-55c3-27a8-edd4-9f31ff896c05	04	Plesne prireditve	plesne prireditve
00150000-55c3-27a8-480f-b3780ce9ea19	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c3-27a8-e742-b41528237180	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c3-27a8-a8f4-e0372595b32a	07	Biografska drama	biografska drama
00150000-55c3-27a8-d9a6-cf4e918927bc	08	Komedija	komedija
00150000-55c3-27a8-00de-ba4f91941a85	09	Črna komedija	črna komedija
00150000-55c3-27a8-bb4b-adbba1296bd9	10	E-igra	E-igra
00150000-55c3-27a8-1cf7-030e8e0db394	11	Kriminalka	kriminalka
00150000-55c3-27a8-e1c9-b63e0aa5948b	12	Musical	musical
\.


--
-- TOC entry 2537 (class 2606 OID 12131551)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 12132053)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 12132043)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 12131957)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 12132303)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 12131735)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 12131760)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 12132196)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 12131677)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 12132102)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 12131897)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 12131711)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 12131754)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 12131691)
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
-- TOC entry 2630 (class 2606 OID 12131807)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 12132279)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 12132286)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2778 (class 2606 OID 12132311)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 12131834)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 12131649)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 12131560)
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
-- TOC entry 2544 (class 2606 OID 12131584)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 12131540)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2528 (class 2606 OID 12131525)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 12131840)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 12131873)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 12131991)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 12131613)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 12131637)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 12131813)
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
-- TOC entry 2559 (class 2606 OID 12131627)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 12131698)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 12131825)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 12132159)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 12132167)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 12132150)
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
-- TOC entry 2736 (class 2606 OID 12132178)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 12131857)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 12131798)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 12131789)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 12131979)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 12131925)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 12131496)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 12131864)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 12131514)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2530 (class 2606 OID 12131534)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 12131882)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 12131820)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 12131769)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 12132220)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 12132208)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 12132202)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 12131938)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 12131593)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 12131780)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 12131968)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 12132190)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 12131662)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 12131509)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 12132022)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 12131720)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 12131848)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 12132260)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 12132244)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 12132268)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 12131916)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 12131749)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 12132004)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 12131909)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 1259 OID 12131742)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2678 (class 1259 OID 12131939)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 12131940)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2764 (class 1259 OID 12132281)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2765 (class 1259 OID 12132280)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 12131615)
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
-- TOC entry 2643 (class 1259 OID 12131841)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 12132248)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2752 (class 1259 OID 12132247)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 12132249)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2754 (class 1259 OID 12132246)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2755 (class 1259 OID 12132245)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2637 (class 1259 OID 12131827)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 12131826)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2588 (class 1259 OID 12131721)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 12131898)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 12131900)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 12131899)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 12131693)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 12131692)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 12132179)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2688 (class 1259 OID 12131993)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 12131994)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2690 (class 1259 OID 12131995)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2761 (class 1259 OID 12132269)
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
-- TOC entry 2697 (class 1259 OID 12132027)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2698 (class 1259 OID 12132024)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2699 (class 1259 OID 12132028)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2700 (class 1259 OID 12132026)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2701 (class 1259 OID 12132025)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 12131664)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 12131663)
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
-- TOC entry 2542 (class 1259 OID 12131587)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 12131865)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 12131755)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2532 (class 1259 OID 12131541)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2533 (class 1259 OID 12131542)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 12131885)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 12131884)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 12131883)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 12131699)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 12131701)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2582 (class 1259 OID 12131700)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2744 (class 1259 OID 12132210)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2617 (class 1259 OID 12131793)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2618 (class 1259 OID 12131791)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2619 (class 1259 OID 12131790)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2620 (class 1259 OID 12131792)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 12131515)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2524 (class 1259 OID 12131516)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2646 (class 1259 OID 12131849)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2774 (class 1259 OID 12132304)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2775 (class 1259 OID 12132312)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2776 (class 1259 OID 12132313)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2632 (class 1259 OID 12131814)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 12131926)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 12131927)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 12132107)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2719 (class 1259 OID 12132106)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2720 (class 1259 OID 12132103)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2721 (class 1259 OID 12132104)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2722 (class 1259 OID 12132105)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 12131629)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 12131628)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 12131630)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2516 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2726 (class 1259 OID 12132160)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 12132161)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2711 (class 1259 OID 12132057)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 12132058)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2713 (class 1259 OID 12132055)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2714 (class 1259 OID 12132056)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 12131917)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 12131802)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2624 (class 1259 OID 12131801)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2625 (class 1259 OID 12131799)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2626 (class 1259 OID 12131800)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2707 (class 1259 OID 12132045)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 12132044)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2723 (class 1259 OID 12132151)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2587 (class 1259 OID 12131712)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2741 (class 1259 OID 12132197)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2768 (class 1259 OID 12132287)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2769 (class 1259 OID 12132288)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 12131562)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 12131561)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 12131594)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 12131595)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 12131783)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 12131782)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2614 (class 1259 OID 12131781)
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
-- TOC entry 2594 (class 1259 OID 12131744)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2595 (class 1259 OID 12131740)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2596 (class 1259 OID 12131737)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2597 (class 1259 OID 12131738)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2598 (class 1259 OID 12131736)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2599 (class 1259 OID 12131741)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2600 (class 1259 OID 12131739)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 12131614)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 12131678)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 12131680)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 12131679)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 12131681)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2631 (class 1259 OID 12131808)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 12131992)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 12132023)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 12131585)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 12131586)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 12131910)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 12132221)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 12131650)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2747 (class 1259 OID 12132209)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2651 (class 1259 OID 12131859)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 12131858)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2715 (class 1259 OID 12132054)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2562 (class 1259 OID 12131638)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 12132005)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2758 (class 1259 OID 12132261)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 12132168)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 12132169)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 12131770)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 12131535)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2601 (class 1259 OID 12131743)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2804 (class 2606 OID 12132449)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2807 (class 2606 OID 12132434)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2806 (class 2606 OID 12132439)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2802 (class 2606 OID 12132459)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2808 (class 2606 OID 12132429)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2803 (class 2606 OID 12132454)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2805 (class 2606 OID 12132444)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2838 (class 2606 OID 12132604)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 12132609)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 12132779)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2872 (class 2606 OID 12132774)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 12132364)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2825 (class 2606 OID 12132544)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2866 (class 2606 OID 12132759)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 12132754)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2865 (class 2606 OID 12132764)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 12132749)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2869 (class 2606 OID 12132744)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2823 (class 2606 OID 12132539)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2824 (class 2606 OID 12132534)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 12132424)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 12132574)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 12132584)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2832 (class 2606 OID 12132579)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2795 (class 2606 OID 12132399)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 12132394)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 12132524)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 12132729)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 12132614)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 12132619)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 12132624)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2870 (class 2606 OID 12132769)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2843 (class 2606 OID 12132644)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2846 (class 2606 OID 12132629)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2842 (class 2606 OID 12132649)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2844 (class 2606 OID 12132639)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2845 (class 2606 OID 12132634)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2793 (class 2606 OID 12132389)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 12132384)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 12132349)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2786 (class 2606 OID 12132344)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 12132554)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2809 (class 2606 OID 12132464)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2782 (class 2606 OID 12132324)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2781 (class 2606 OID 12132329)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 12132569)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2829 (class 2606 OID 12132564)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2830 (class 2606 OID 12132559)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2799 (class 2606 OID 12132404)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 12132414)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2798 (class 2606 OID 12132409)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2864 (class 2606 OID 12132739)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2813 (class 2606 OID 12132499)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2815 (class 2606 OID 12132489)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2816 (class 2606 OID 12132484)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2814 (class 2606 OID 12132494)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 12132314)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 12132319)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 12132549)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2875 (class 2606 OID 12132794)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 12132799)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2876 (class 2606 OID 12132804)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2822 (class 2606 OID 12132529)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2836 (class 2606 OID 12132594)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2835 (class 2606 OID 12132599)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 12132704)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 12132699)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 12132684)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 12132689)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2855 (class 2606 OID 12132694)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2791 (class 2606 OID 12132374)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 12132369)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 12132379)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 12132714)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2859 (class 2606 OID 12132719)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2850 (class 2606 OID 12132674)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 12132679)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2852 (class 2606 OID 12132664)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2851 (class 2606 OID 12132669)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2834 (class 2606 OID 12132589)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 12132519)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2818 (class 2606 OID 12132514)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2820 (class 2606 OID 12132504)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2819 (class 2606 OID 12132509)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2847 (class 2606 OID 12132659)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 12132654)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2858 (class 2606 OID 12132709)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2800 (class 2606 OID 12132419)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 12132724)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2863 (class 2606 OID 12132734)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2874 (class 2606 OID 12132784)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2873 (class 2606 OID 12132789)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2783 (class 2606 OID 12132339)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 12132334)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2788 (class 2606 OID 12132354)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 12132359)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 12132479)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 12132474)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2812 (class 2606 OID 12132469)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-06 11:23:54 CEST

--
-- PostgreSQL database dump complete
--

