--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-06 09:29:23 CEST

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
-- TOC entry 183 (class 1259 OID 12102647)
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
-- TOC entry 228 (class 1259 OID 12103150)
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
-- TOC entry 227 (class 1259 OID 12103133)
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
-- TOC entry 221 (class 1259 OID 12103045)
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
-- TOC entry 244 (class 1259 OID 12103393)
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
-- TOC entry 197 (class 1259 OID 12102826)
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
-- TOC entry 200 (class 1259 OID 12102860)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 12103295)
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
-- TOC entry 192 (class 1259 OID 12102769)
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
-- TOC entry 229 (class 1259 OID 12103163)
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
-- TOC entry 216 (class 1259 OID 12102990)
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
-- TOC entry 195 (class 1259 OID 12102806)
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
-- TOC entry 199 (class 1259 OID 12102854)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 12102786)
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
-- TOC entry 205 (class 1259 OID 12102907)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 12103374)
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
-- TOC entry 243 (class 1259 OID 12103386)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 12103409)
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
-- TOC entry 209 (class 1259 OID 12102932)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 12102743)
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
-- TOC entry 184 (class 1259 OID 12102656)
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
-- TOC entry 185 (class 1259 OID 12102667)
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
-- TOC entry 180 (class 1259 OID 12102621)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 12102640)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 12102939)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 12102970)
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
-- TOC entry 224 (class 1259 OID 12103084)
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
-- TOC entry 187 (class 1259 OID 12102700)
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
-- TOC entry 189 (class 1259 OID 12102735)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 12102913)
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
-- TOC entry 188 (class 1259 OID 12102720)
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
-- TOC entry 194 (class 1259 OID 12102798)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 12102925)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 12103256)
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
-- TOC entry 232 (class 1259 OID 12103266)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 12103212)
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
-- TOC entry 233 (class 1259 OID 12103274)
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
-- TOC entry 212 (class 1259 OID 12102954)
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
-- TOC entry 204 (class 1259 OID 12102898)
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
-- TOC entry 203 (class 1259 OID 12102888)
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
-- TOC entry 223 (class 1259 OID 12103073)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 12103022)
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
-- TOC entry 177 (class 1259 OID 12102592)
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
-- TOC entry 176 (class 1259 OID 12102590)
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
-- TOC entry 213 (class 1259 OID 12102964)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 12102630)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 12102614)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 12102978)
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
-- TOC entry 207 (class 1259 OID 12102919)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 12102865)
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
-- TOC entry 238 (class 1259 OID 12103315)
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
-- TOC entry 237 (class 1259 OID 12103307)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 12103302)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 12103032)
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
-- TOC entry 186 (class 1259 OID 12102692)
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
-- TOC entry 202 (class 1259 OID 12102875)
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
-- TOC entry 222 (class 1259 OID 12103062)
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
-- TOC entry 234 (class 1259 OID 12103284)
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
-- TOC entry 191 (class 1259 OID 12102755)
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
-- TOC entry 178 (class 1259 OID 12102601)
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
-- TOC entry 226 (class 1259 OID 12103110)
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
-- TOC entry 196 (class 1259 OID 12102817)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 12102946)
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
-- TOC entry 240 (class 1259 OID 12103354)
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
-- TOC entry 239 (class 1259 OID 12103326)
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
-- TOC entry 241 (class 1259 OID 12103366)
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
-- TOC entry 218 (class 1259 OID 12103015)
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
-- TOC entry 198 (class 1259 OID 12102849)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 12103100)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 12103005)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 12102595)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2998 (class 0 OID 12102647)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 12103150)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c3-0cd2-ec6c-b8d08815ea7e	000d0000-55c3-0cd2-cf27-243107c13153	\N	00090000-55c3-0cd2-b9ae-677bf907a668	000b0000-55c3-0cd2-a46d-386782357781	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c3-0cd2-075f-02afddd7c014	000d0000-55c3-0cd2-1042-25f30278221f	00100000-55c3-0cd2-490e-3b0974146f9c	00090000-55c3-0cd2-76ed-bf3d3320a9b3	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c3-0cd2-14dd-a02187cd8f69	000d0000-55c3-0cd2-6bb4-ccca91db4f3c	00100000-55c3-0cd2-ddc1-cc6f312ed457	00090000-55c3-0cd2-74af-5a29a3903754	\N	0003	t	\N	2015-08-06	\N	2	\N	\N	f	f
000c0000-55c3-0cd2-36bb-b5cbd710785e	000d0000-55c3-0cd2-e0b3-40d9b4eb00cc	\N	00090000-55c3-0cd2-302a-69ed68f592c8	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c3-0cd2-9ef2-1c5bd54c42db	000d0000-55c3-0cd2-5b4d-9bbae79f95a2	\N	00090000-55c3-0cd2-3617-1dfd65b4aa07	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c3-0cd2-ad64-ee00ba2f74a5	000d0000-55c3-0cd2-ee34-de4b83ae676c	\N	00090000-55c3-0cd2-b948-cd3ea137739d	000b0000-55c3-0cd2-e5bf-ebdab120aa50	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c3-0cd2-fe78-cf21e9d348d2	000d0000-55c3-0cd2-77c3-68be3dbfbb69	00100000-55c3-0cd2-c4ab-ae63264d5aa1	00090000-55c3-0cd2-bde0-46c8019f116c	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c3-0cd2-893d-e407b040d10e	000d0000-55c3-0cd2-6848-f2f40c5a57b2	\N	00090000-55c3-0cd2-2b84-710c1688e4c9	000b0000-55c3-0cd2-0fd0-83ddf152f95d	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c3-0cd2-38ff-845c84c8e4ea	000d0000-55c3-0cd2-77c3-68be3dbfbb69	00100000-55c3-0cd2-8f86-482853a4414b	00090000-55c3-0cd2-6594-8b710f6e5e9f	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c3-0cd2-eae8-a3c69c7588c5	000d0000-55c3-0cd2-77c3-68be3dbfbb69	00100000-55c3-0cd2-22af-13b2c0595751	00090000-55c3-0cd2-f25b-8b428815de2c	\N	0010	t	\N	2015-08-06	\N	16	\N	\N	f	t
000c0000-55c3-0cd2-78ec-67b85f389fe8	000d0000-55c3-0cd2-77c3-68be3dbfbb69	00100000-55c3-0cd2-4f4b-bc1b5ffb9e73	00090000-55c3-0cd2-c1b5-f0c2de0ce61a	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3042 (class 0 OID 12103133)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 12103045)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c3-0cd2-969b-fc82b778bfa7	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c3-0cd2-1edb-d4437b7a7966	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c3-0cd2-6a6f-9d760b36767d	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 12103393)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 12102826)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c3-0cd2-2546-6d152d3d7cef	\N	\N	00200000-55c3-0cd2-6548-7e114571f698	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c3-0cd2-1def-af83942d7ad0	\N	\N	00200000-55c3-0cd2-8ee0-e3bcd836d1ba	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c3-0cd2-fcbb-b03bef3bbcc3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c3-0cd2-606a-90282b3265be	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c3-0cd2-1a37-571b3a6db716	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3015 (class 0 OID 12102860)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 12103295)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 12102769)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c3-0cd0-f2d7-6088b0dc3f66	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c3-0cd0-26d8-6d36ca118fe5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c3-0cd0-83a9-aebfe31badc0	AL	ALB	008	Albania 	Albanija	\N
00040000-55c3-0cd0-ab30-e8b9f1e8fb99	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c3-0cd0-17e5-1d4967db93b3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c3-0cd0-3766-40089c2220eb	AD	AND	020	Andorra 	Andora	\N
00040000-55c3-0cd0-edbb-6c04632025e5	AO	AGO	024	Angola 	Angola	\N
00040000-55c3-0cd0-6b21-b5fd3642f39f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c3-0cd0-3154-bf6effc537b9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c3-0cd0-e3ff-a37591246baf	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c3-0cd0-c81b-e3b062381ce2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c3-0cd0-989a-da064db8773e	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c3-0cd0-a78d-ea896a6f7514	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c3-0cd0-482c-ec152d6348b7	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c3-0cd0-9163-51d06fbb2e8b	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c3-0cd0-3f33-053a9bad933c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c3-0cd0-0e0c-ecf4a7f1c5c4	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c3-0cd0-e327-54f964d28756	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c3-0cd0-f6f9-80841b6091be	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c3-0cd0-8082-ea61a7097978	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c3-0cd0-a3bc-59c94aebe91b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c3-0cd0-9f8b-11542d79fa54	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c3-0cd0-fd2a-133696fa89c5	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c3-0cd0-99c2-806f751015bf	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c3-0cd0-b216-fbf5035cbf7c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c3-0cd0-faba-b12358c2b462	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c3-0cd0-2e58-fbc62d6b891b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c3-0cd0-c9c9-1a90d75573c3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c3-0cd0-18ed-c66ade334c11	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c3-0cd0-531b-61c8f414d1b8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c3-0cd0-8ec9-9a9843934282	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c3-0cd0-4226-a1b16b944d4f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c3-0cd0-12c5-ee6a1f22554c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c3-0cd0-7794-3649f31a87b1	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c3-0cd0-9cad-f5b96f897857	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c3-0cd0-0312-cceead94068d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c3-0cd0-cac2-5614187f0665	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c3-0cd0-6405-4a3e3fe68115	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c3-0cd0-2ce2-b8481b68f9f8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c3-0cd0-c0c3-1a09173c06bb	CA	CAN	124	Canada 	Kanada	\N
00040000-55c3-0cd0-2d26-1ef039a911e3	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c3-0cd0-15ac-58eadd875bc2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c3-0cd0-e382-5a5e782c155d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c3-0cd0-81ba-2b918d7c0306	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c3-0cd0-48b5-49bf244ce849	CL	CHL	152	Chile 	Čile	\N
00040000-55c3-0cd0-fa43-02accb81361f	CN	CHN	156	China 	Kitajska	\N
00040000-55c3-0cd0-b3ff-ab242a0ea70b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c3-0cd0-94ef-7b4d705cc772	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c3-0cd0-262a-157264086a2f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c3-0cd0-af1f-717b7b1c94ed	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c3-0cd0-b741-0fe0633978bc	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c3-0cd0-2f1e-ccb2073c9733	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c3-0cd0-19c9-e42ec2b7ea2c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c3-0cd0-3e7e-8c6ca44b1d1f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c3-0cd0-8851-73fceb2bf84e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c3-0cd0-620b-eb59e477cdea	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c3-0cd0-7608-b5f56c2c0208	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c3-0cd0-2fbb-d260afd0b3f4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c3-0cd0-88a4-0c734beee67e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c3-0cd0-6084-93841c4b0157	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c3-0cd0-78c9-69f392b8cd55	DK	DNK	208	Denmark 	Danska	\N
00040000-55c3-0cd0-712a-4ad252c78d6f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c3-0cd0-bf36-996b826f93ae	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c3-0cd0-0259-3910d6bc1c73	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c3-0cd0-25ba-31fa4100f2b6	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c3-0cd0-ba77-1af646386b0c	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c3-0cd0-02f1-40e86f6a3c70	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c3-0cd0-31cf-2d7793547ff7	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c3-0cd0-03aa-09b230e68a31	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c3-0cd0-e92e-84b3b677e8bc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c3-0cd0-a445-9583a77037b8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c3-0cd0-9fa7-91c285cd6c11	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c3-0cd0-0b58-b6ffbcc3e242	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c3-0cd0-1844-6156c55a4c56	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c3-0cd0-e3b9-16661160e92a	FI	FIN	246	Finland 	Finska	\N
00040000-55c3-0cd0-8f7a-48bf4e14486e	FR	FRA	250	France 	Francija	\N
00040000-55c3-0cd0-62b1-a6d60dee5114	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c3-0cd0-589c-26818b254083	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c3-0cd0-ae9f-95e15c7fbdb9	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c3-0cd0-b7c9-b4296efdda85	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c3-0cd0-d3fa-827830626265	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c3-0cd0-145e-fd767c116fc9	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c3-0cd0-5138-9e489ea5b497	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c3-0cd0-1d7f-52d7ddcefb73	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c3-0cd0-e8b3-a5005cb8f2e5	GH	GHA	288	Ghana 	Gana	\N
00040000-55c3-0cd0-7d4f-7a06cd2d5540	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c3-0cd0-a440-982e1ef537ea	GR	GRC	300	Greece 	Grčija	\N
00040000-55c3-0cd0-3b57-f962b350bbdb	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c3-0cd0-10bb-f9e4d2f7fb5e	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c3-0cd0-51db-303894fab21b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c3-0cd0-ded3-aa725bb22390	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c3-0cd0-ca67-f2e8a9cc5743	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c3-0cd0-3bfd-32078515b5f5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c3-0cd0-b400-8e7653eaa588	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c3-0cd0-1374-2c501d64d7c8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c3-0cd0-f056-c19a4dca2aae	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c3-0cd0-d43f-9331fc53bf62	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c3-0cd0-a069-8ef51ebdd573	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c3-0cd0-dfee-a1c92ac79c37	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c3-0cd0-dc8e-f8ba12647aa8	HN	HND	340	Honduras 	Honduras	\N
00040000-55c3-0cd0-b78b-2ea3fcbc7977	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c3-0cd0-2017-8a8406aa3c73	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c3-0cd0-17bb-c505058383ec	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c3-0cd0-32a1-ff8af150be65	IN	IND	356	India 	Indija	\N
00040000-55c3-0cd0-ac77-0520b4542d0c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c3-0cd0-aafd-d78029312980	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c3-0cd0-ee64-a449d1b69198	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c3-0cd0-3013-1106b185587c	IE	IRL	372	Ireland 	Irska	\N
00040000-55c3-0cd0-23ae-ae35b86612ae	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c3-0cd0-b05e-dbade0172293	IL	ISR	376	Israel 	Izrael	\N
00040000-55c3-0cd0-44ac-69d56a0e3f76	IT	ITA	380	Italy 	Italija	\N
00040000-55c3-0cd0-5cc6-f3c93ab6d0aa	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c3-0cd0-102f-32b0faec1b96	JP	JPN	392	Japan 	Japonska	\N
00040000-55c3-0cd0-e935-49654ef2d94d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c3-0cd0-9c30-7478cf68bdbd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c3-0cd0-5c5f-040db2ba0302	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c3-0cd0-ab7e-620c25adc178	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c3-0cd0-9f0c-42844253466e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c3-0cd0-c956-3456370177e4	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c3-0cd0-a762-66ec0843983f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c3-0cd0-20e6-0953dcc257ca	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c3-0cd0-9e57-22b86de3898c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c3-0cd0-563a-3833d9fb8bb6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c3-0cd0-4992-78bb081fe267	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c3-0cd0-c627-19c9e6ec90db	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c3-0cd0-7f71-a3dc551c1c0d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c3-0cd0-d719-0a514ad6e2a2	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c3-0cd0-17ff-32cd41752e00	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c3-0cd0-4da0-29e7a2c3e53c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c3-0cd0-a1c6-4b64772c888b	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c3-0cd0-2c7a-ce0028aa20a4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c3-0cd0-bcb8-84160311a67c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c3-0cd0-2e1c-de76a4a88a08	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c3-0cd0-8c56-6301f4dd1f47	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c3-0cd0-b3c3-6f52d9bc9c68	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c3-0cd0-77d0-ddc57ed0e378	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c3-0cd0-0391-d36bb7da0f3e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c3-0cd0-ab22-5217af049082	ML	MLI	466	Mali 	Mali	\N
00040000-55c3-0cd0-b5e0-d79914f2dda1	MT	MLT	470	Malta 	Malta	\N
00040000-55c3-0cd0-5c49-22586e956d34	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c3-0cd0-7543-66826b1840f8	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c3-0cd0-bd7e-cb0e69ad8018	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c3-0cd0-b80b-4942f51cf8e8	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c3-0cd0-36ee-bfc210f002b9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c3-0cd0-3ddf-fc25db9fd756	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c3-0cd0-3f8a-9be69bb350f3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c3-0cd0-b033-82ef95a1ea85	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c3-0cd0-b0ac-baff5faa23f2	MC	MCO	492	Monaco 	Monako	\N
00040000-55c3-0cd0-042b-f06898c2ad48	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c3-0cd0-ab71-aae7edb48d01	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c3-0cd0-5e5b-a457c90c58d9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c3-0cd0-b7bb-5b7ab29752dd	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c3-0cd0-3a28-676f31302c21	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c3-0cd0-e874-f5535628846e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c3-0cd0-aee1-e4a7a3b32631	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c3-0cd0-0a7a-4bc3e5398da7	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c3-0cd0-15c4-03b63b7cde0d	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c3-0cd0-6d38-e9b41d824aa8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c3-0cd0-743e-1a647ecef9f7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c3-0cd0-b386-aa7bff7903bd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c3-0cd0-96f7-9a0594fe3246	NE	NER	562	Niger 	Niger 	\N
00040000-55c3-0cd0-19e4-76047c4868e9	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c3-0cd0-223d-292aa73630fa	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c3-0cd0-3e82-a96ba7f7e4a4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c3-0cd0-9537-e3d2763cc920	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c3-0cd0-d0ba-c00a3d3cf162	NO	NOR	578	Norway 	Norveška	\N
00040000-55c3-0cd0-16e2-bf87d6ddb453	OM	OMN	512	Oman 	Oman	\N
00040000-55c3-0cd0-f814-776541bc7845	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c3-0cd0-71e6-f1475a031926	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c3-0cd0-e9b9-c60e89d02d2a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c3-0cd0-81c5-ce3420d1d97b	PA	PAN	591	Panama 	Panama	\N
00040000-55c3-0cd0-3ad2-2b8680ef9078	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c3-0cd0-554b-c2f8a788cc0e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c3-0cd0-9996-37b0cf91d08a	PE	PER	604	Peru 	Peru	\N
00040000-55c3-0cd0-298e-ef4ae11179aa	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c3-0cd0-59bf-61e42a8b38fd	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c3-0cd0-8181-eadb139e7166	PL	POL	616	Poland 	Poljska	\N
00040000-55c3-0cd0-da16-db91e81d0d2a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c3-0cd0-46d5-cb7079427d79	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c3-0cd0-3ffe-49ec440f69ab	QA	QAT	634	Qatar 	Katar	\N
00040000-55c3-0cd0-f8d9-47e15566fc68	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c3-0cd0-c7d5-9f4ab14f23ac	RO	ROU	642	Romania 	Romunija	\N
00040000-55c3-0cd0-6e59-999bb132a0b7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c3-0cd0-c88d-e6e804d48d18	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c3-0cd0-7edb-81c6bde0fa84	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c3-0cd0-a25c-9dbadb753601	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c3-0cd0-fe19-e5afcd675e65	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c3-0cd0-bac6-da3bf3d14a34	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c3-0cd0-4605-f37da1645157	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c3-0cd0-409d-3108cd59f0e4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c3-0cd0-a82c-9efb72a7b193	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c3-0cd0-997c-3af7dcbd6e4a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c3-0cd0-6527-a2881e94e925	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c3-0cd0-079a-861ce15b8a35	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c3-0cd0-6323-ae2dfbe937fd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c3-0cd0-cd06-6bfb74c844cf	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c3-0cd0-b393-bdb42699fb96	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c3-0cd0-a7d4-25418c7d7f00	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c3-0cd0-5a84-56f0f489aa77	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c3-0cd0-46c1-cdde8045e35e	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c3-0cd0-7382-4ac122371c66	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c3-0cd0-e8b7-3a084c48fb88	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c3-0cd0-8349-8333fdc9ac44	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c3-0cd0-3a7a-7e4d81ac94c2	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c3-0cd0-de76-682b644ac10e	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c3-0cd0-e662-aaed63170a27	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c3-0cd0-f78b-764c57d13f80	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c3-0cd0-9dc4-1b5dbbd41db4	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c3-0cd0-dddd-10dea3aa47ce	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c3-0cd0-516e-cf27fdeb469c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c3-0cd0-7f76-ab3682f8a02e	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c3-0cd0-9307-f0c0e3d15092	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c3-0cd0-da72-051e543efb09	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c3-0cd0-3735-834863b0a281	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c3-0cd0-4091-da96ecd3a253	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c3-0cd0-d1c0-6bf699e30d3a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c3-0cd0-5235-9895e87ba804	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c3-0cd0-80f5-80accd482bdd	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c3-0cd0-819b-e55dcbe03f91	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c3-0cd0-3a46-552a3e9452a0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c3-0cd0-0afd-2c72e3804e70	TH	THA	764	Thailand 	Tajska	\N
00040000-55c3-0cd0-16de-bd2fdea1c96c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c3-0cd0-d624-293a2a8c6631	TG	TGO	768	Togo 	Togo	\N
00040000-55c3-0cd0-fdb2-80115199742f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c3-0cd0-65c9-d7b1dfb5118f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c3-0cd0-eefd-ae6d9ba898ee	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c3-0cd0-04eb-a8953be4b26f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c3-0cd0-83f1-15f63d892557	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c3-0cd0-09c3-2f76a93870a5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c3-0cd0-1d3b-1ce1abb8c37f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c3-0cd0-9c84-610b4ecfd346	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c3-0cd0-7557-a6bbc47deb9a	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c3-0cd0-b131-0502645667f2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c3-0cd0-f59c-e19280a677fb	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c3-0cd0-be5f-809f111ebc92	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c3-0cd0-19d2-ce045d01ed7d	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c3-0cd0-30dc-c5c46f44787b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c3-0cd0-3a44-fc0e507d820b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c3-0cd0-af2d-97da5729300f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c3-0cd0-e466-cede53ff0f5b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c3-0cd0-6f6c-2df7c0550cb6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c3-0cd0-7b6c-441363ffaa13	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c3-0cd0-7b9f-bf07f57e0bb3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c3-0cd0-dddc-4c5e85e8c4de	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c3-0cd0-2e20-e8d33ab13024	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c3-0cd0-03c7-06126da629da	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c3-0cd0-95c1-eb60588d0261	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c3-0cd0-70c6-a2f8bc8a4473	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c3-0cd0-70ed-5767a4222e5e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3044 (class 0 OID 12103163)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55c3-0cd2-dfe4-2275b92c71b2	000e0000-55c3-0cd2-6408-3ee8089187f8	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	0.00	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c3-0cd1-532b-89498b8fa9cf	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c3-0cd2-aaca-075448160cf4	000e0000-55c3-0cd2-6f46-8188764639b8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c3-0cd1-edab-dc6c76642ccc	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c3-0cd2-fca6-30ac4e9b2272	000e0000-55c3-0cd2-7cb6-32dc392b149a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c3-0cd1-532b-89498b8fa9cf	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c3-0cd2-b285-fa11ddb7445a	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c3-0cd2-69d5-1e3f6788d3c6	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 12102990)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c3-0cd2-77c3-68be3dbfbb69	000e0000-55c3-0cd2-6f46-8188764639b8	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c3-0cd1-3dbb-48b521939def
000d0000-55c3-0cd2-cf27-243107c13153	000e0000-55c3-0cd2-6f46-8188764639b8	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c3-0cd1-3dbb-48b521939def
000d0000-55c3-0cd2-1042-25f30278221f	000e0000-55c3-0cd2-6f46-8188764639b8	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c3-0cd1-c885-63f28a4137fc
000d0000-55c3-0cd2-6bb4-ccca91db4f3c	000e0000-55c3-0cd2-6f46-8188764639b8	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c3-0cd1-10d2-f5771024cfe0
000d0000-55c3-0cd2-e0b3-40d9b4eb00cc	000e0000-55c3-0cd2-6f46-8188764639b8	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c3-0cd1-d4cf-6d3078a8bc71
000d0000-55c3-0cd2-5b4d-9bbae79f95a2	000e0000-55c3-0cd2-6f46-8188764639b8	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c3-0cd1-e909-e01d60256f19
000d0000-55c3-0cd2-ee34-de4b83ae676c	000e0000-55c3-0cd2-6f46-8188764639b8	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c3-0cd1-3dbb-48b521939def
000d0000-55c3-0cd2-6848-f2f40c5a57b2	000e0000-55c3-0cd2-6f46-8188764639b8	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c3-0cd1-10aa-26a830d6d279
\.


--
-- TOC entry 3010 (class 0 OID 12102806)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 12102854)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 12102786)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c3-0cd2-2e4b-8e0ddd3f8130	00080000-55c3-0cd2-2b48-ccd59d76ed17	00090000-55c3-0cd2-f25b-8b428815de2c	AK		
\.


--
-- TOC entry 2985 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 12102907)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 12103374)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 12103386)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 12103409)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 12102932)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 12102743)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c3-0cd0-ef02-9ea23fb4e657	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c3-0cd0-7a22-003c85ba150d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c3-0cd0-1ffc-342bab3687dd	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c3-0cd0-ff30-b640d19248b5	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c3-0cd0-3e56-0a7c0c1cd3c8	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c3-0cd0-6d79-8fc5d7dc714c	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c3-0cd0-5939-41fd6a036900	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c3-0cd0-7221-507978165441	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c3-0cd0-e3ab-361b2e529432	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c3-0cd0-7e4c-86e35c2b50f7	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c3-0cd0-31d8-6ac0540dfcbe	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c3-0cd0-864f-55808f5196a2	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c3-0cd0-196d-374855107da7	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c3-0cd0-0318-ed92d5f962a4	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c3-0cd2-a42b-7b4832605875	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c3-0cd2-919a-9df6ac6d0aa9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c3-0cd2-7e07-f75e5dbe2bc6	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c3-0cd2-fac6-8c810a9ccaab	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c3-0cd2-be74-93e83348e0c3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c3-0cd2-dc97-e04acf970e26	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2999 (class 0 OID 12102656)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c3-0cd2-79da-1e7a5397bfce	00000000-55c3-0cd2-919a-9df6ac6d0aa9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c3-0cd2-357a-ce8156b78d0e	00000000-55c3-0cd2-919a-9df6ac6d0aa9	00010000-55c3-0cd0-59be-c91d8e8c7480	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c3-0cd2-d35d-2babab8b3cb1	00000000-55c3-0cd2-7e07-f75e5dbe2bc6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3000 (class 0 OID 12102667)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c3-0cd2-b9ae-677bf907a668	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c3-0cd2-302a-69ed68f592c8	00010000-55c3-0cd2-8ebc-1cd108d35fda	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c3-0cd2-74af-5a29a3903754	00010000-55c3-0cd2-5b9a-86168a8ecff5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c3-0cd2-6594-8b710f6e5e9f	00010000-55c3-0cd2-9f72-4dc895d3f9fc	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c3-0cd2-e40d-ee70d0c7f59f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c3-0cd2-b948-cd3ea137739d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c3-0cd2-c1b5-f0c2de0ce61a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c3-0cd2-bde0-46c8019f116c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c3-0cd2-f25b-8b428815de2c	00010000-55c3-0cd2-c027-35b062d7ac27	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c3-0cd2-76ed-bf3d3320a9b3	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c3-0cd2-ec08-2500d73f8301	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c3-0cd2-3617-1dfd65b4aa07	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c3-0cd2-2b84-710c1688e4c9	00010000-55c3-0cd2-4fb6-965def39ed21	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 12102621)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c3-0cd0-8cf9-3c4347f1c830	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c3-0cd0-6b64-0a71dc9caf60	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c3-0cd0-925e-c56d4809b1f8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c3-0cd0-a2f0-2d9802a514d3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c3-0cd0-b77f-f66d772b5329	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c3-0cd0-dab3-fc8739a238bc	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c3-0cd0-8604-e1158ccefc46	Abonma-read	Abonma - branje	f
00030000-55c3-0cd0-ad52-28f3dcae8c26	Abonma-write	Abonma - spreminjanje	f
00030000-55c3-0cd0-2187-33cb10d13d0f	Alternacija-read	Alternacija - branje	f
00030000-55c3-0cd0-2641-fd010f354f5d	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c3-0cd0-cce6-591626de02cd	Arhivalija-read	Arhivalija - branje	f
00030000-55c3-0cd0-9f67-ee3e85de305f	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c3-0cd0-f4b9-38c9a58eafb8	Besedilo-read	Besedilo - branje	f
00030000-55c3-0cd0-797f-d97a796d84ed	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c3-0cd0-f4cf-7f478ec98de4	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c3-0cd0-b173-8d9481e98ec3	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c3-0cd0-1488-6a209a312550	Dogodek-read	Dogodek - branje	f
00030000-55c3-0cd0-f370-80445119184d	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c3-0cd0-65e5-b57544986892	DrugiVir-read	DrugiVir - branje	f
00030000-55c3-0cd0-8268-21f9c3ec7299	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c3-0cd0-be4e-693c62962009	Drzava-read	Drzava - branje	f
00030000-55c3-0cd0-4703-759e831e872a	Drzava-write	Drzava - spreminjanje	f
00030000-55c3-0cd0-e4d8-8362cf5b0150	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c3-0cd0-fc18-f1154da87b3d	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c3-0cd0-29d3-1e814eba7c28	Funkcija-read	Funkcija - branje	f
00030000-55c3-0cd0-293c-9a01f0fd9d8b	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c3-0cd0-275b-296ab60ca2d7	Gostovanje-read	Gostovanje - branje	f
00030000-55c3-0cd0-f9e2-6e0024401dbb	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c3-0cd0-acfb-6187ff787fbf	Gostujoca-read	Gostujoca - branje	f
00030000-55c3-0cd0-36bc-bccace501862	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c3-0cd0-5731-80fc25fdd524	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c3-0cd0-f119-c199b8ae7a9c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c3-0cd0-ef9e-8e76189adfe2	Kupec-read	Kupec - branje	f
00030000-55c3-0cd0-8308-cb1cea1c542a	Kupec-write	Kupec - spreminjanje	f
00030000-55c3-0cd0-852f-1b4e6d24c47d	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c3-0cd0-2968-f22ad144ff03	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c3-0cd0-cff9-eaa8ea71e1ae	Option-read	Option - branje	f
00030000-55c3-0cd0-4c1d-c17135d2294e	Option-write	Option - spreminjanje	f
00030000-55c3-0cd0-fd77-d2d2db6b2782	OptionValue-read	OptionValue - branje	f
00030000-55c3-0cd0-a743-417862f2a8d4	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c3-0cd0-c2a9-c4a8ea9b8597	Oseba-read	Oseba - branje	f
00030000-55c3-0cd0-ecd8-0cb8975a8a50	Oseba-write	Oseba - spreminjanje	f
00030000-55c3-0cd0-9c70-f99c38ae4e9d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c3-0cd0-f380-329fb148be62	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c3-0cd0-9ec4-a083a2810857	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c3-0cd0-d34b-4fad011bb17a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c3-0cd0-a548-f952ed334c42	Pogodba-read	Pogodba - branje	f
00030000-55c3-0cd0-4ecc-d6b58f546fad	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c3-0cd0-575b-6f51103974f0	Popa-read	Popa - branje	f
00030000-55c3-0cd0-28db-012677c1dd62	Popa-write	Popa - spreminjanje	f
00030000-55c3-0cd0-8ff5-33a025a3d1f3	Posta-read	Posta - branje	f
00030000-55c3-0cd0-0dd2-7357713e0128	Posta-write	Posta - spreminjanje	f
00030000-55c3-0cd0-ccb3-d595b8c222a1	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c3-0cd0-8cee-912ad96b19ff	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c3-0cd0-4794-b4819a4e9b3c	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c3-0cd0-8c99-ba266660a3d3	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c3-0cd0-e843-994661ff3c59	Predstava-read	Predstava - branje	f
00030000-55c3-0cd0-e458-c8744b563c00	Predstava-write	Predstava - spreminjanje	f
00030000-55c3-0cd0-2011-f44632a3c71e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c3-0cd0-d5d5-5e2806c697ef	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c3-0cd0-afa8-ae8050cb0c90	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c3-0cd0-d5b9-35a9d79aa917	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c3-0cd0-c5a1-85c1b188f485	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c3-0cd0-82ff-919ec1d77799	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c3-0cd0-aff8-28e0e818c6a6	ProgramDela-read	ProgramDela - branje	f
00030000-55c3-0cd0-102c-532829e4a0ab	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c3-0cd0-2956-ab7566296416	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c3-0cd0-17c8-d4bab7f868e0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c3-0cd0-4760-0bc4d1d88a17	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c3-0cd0-a790-0371186b0504	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c3-0cd0-e784-afb36b42f2bf	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c3-0cd0-3fb2-956fa7886076	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c3-0cd0-82e1-a3934b73c7e5	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c3-0cd0-184b-960a2d3e28c1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c3-0cd0-35f4-8f75a907179b	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c3-0cd0-e5a2-529d9a58c0f7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c3-0cd0-cf31-bf61f22f9438	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c3-0cd0-9747-f89e0d50e4e1	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c3-0cd0-53f2-4e9035320aeb	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c3-0cd0-aa6a-35bc9f0d45cb	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c3-0cd0-0003-cb3dfb15c42d	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c3-0cd0-046c-78a0b658dec2	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c3-0cd0-044a-5900d223b2b5	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c3-0cd0-24ba-a94e8e65304d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c3-0cd0-8259-c27ddc0c591f	Prostor-read	Prostor - branje	f
00030000-55c3-0cd0-f165-e102ec4f29cd	Prostor-write	Prostor - spreminjanje	f
00030000-55c3-0cd0-070d-859775925774	Racun-read	Racun - branje	f
00030000-55c3-0cd0-9435-ffb79479a401	Racun-write	Racun - spreminjanje	f
00030000-55c3-0cd0-3499-19093e247b5f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c3-0cd0-ac08-8069ffb4f272	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c3-0cd0-979b-c72b897d6930	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c3-0cd0-0311-a4e35cabde91	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c3-0cd0-6f10-19874b06b4a0	Rekvizit-read	Rekvizit - branje	f
00030000-55c3-0cd0-a40f-88d18ef3500c	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c3-0cd0-496e-1a660a2e7172	Revizija-read	Revizija - branje	f
00030000-55c3-0cd0-9ec9-028ac2cc7322	Revizija-write	Revizija - spreminjanje	f
00030000-55c3-0cd0-ded0-6fd948e764f9	Rezervacija-read	Rezervacija - branje	f
00030000-55c3-0cd0-89f8-848fd59c9bc8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c3-0cd0-4411-5e06feb07019	SedezniRed-read	SedezniRed - branje	f
00030000-55c3-0cd0-2032-0326d79912fc	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c3-0cd0-cedb-a7e8fe1124f6	Sedez-read	Sedez - branje	f
00030000-55c3-0cd0-0374-4114efcfd21c	Sedez-write	Sedez - spreminjanje	f
00030000-55c3-0cd0-7732-1b1ac74458ab	Sezona-read	Sezona - branje	f
00030000-55c3-0cd0-1be0-c025ba990bf5	Sezona-write	Sezona - spreminjanje	f
00030000-55c3-0cd0-bb0f-3046c9fdb1c5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c3-0cd0-66cf-f00ec459c02e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c3-0cd0-643e-eb59b97baf21	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c3-0cd0-c2e6-a2d128e97303	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c3-0cd0-ad7f-ba3d93a8c900	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c3-0cd0-53b1-635303cd6817	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c3-0cd0-8bf6-5f1ff19e6598	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c3-0cd0-a0ca-c1749fcc3a72	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c3-0cd0-0521-7f44609be704	Telefonska-read	Telefonska - branje	f
00030000-55c3-0cd0-8bc9-6fc9f07e7e4c	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c3-0cd0-ed8f-7d3d6d87d86a	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c3-0cd0-4f90-ec1ffa7ac484	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c3-0cd0-cff8-8866f92f3095	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c3-0cd0-1e2a-0b9f79defca3	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c3-0cd0-d277-9e566b817e5c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c3-0cd0-d5ad-8ff8992e00b0	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c3-0cd0-90e0-a8d207a0dab2	Trr-read	Trr - branje	f
00030000-55c3-0cd0-6ceb-b06d4e4a922d	Trr-write	Trr - spreminjanje	f
00030000-55c3-0cd0-3273-90d0b452b0c1	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c3-0cd0-a9ba-bb3435693919	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c3-0cd0-7ce9-6998564aceb7	Vaja-read	Vaja - branje	f
00030000-55c3-0cd0-efac-735ed2183780	Vaja-write	Vaja - spreminjanje	f
00030000-55c3-0cd0-8428-d18223b96730	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c3-0cd0-1e45-f9e1333fcc45	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c3-0cd0-30bd-98d1b67ecd16	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c3-0cd0-7495-404cb131ce10	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c3-0cd0-63e5-e28856d5912b	Zasedenost-read	Zasedenost - branje	f
00030000-55c3-0cd0-c06a-d4dea862d0fb	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c3-0cd0-5a16-b8017ca055fc	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c3-0cd0-6d4f-91681d23ae13	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c3-0cd0-c3b8-2335ff9992e6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c3-0cd0-7264-6928717367df	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c3-0cd0-b345-7fc2eda4873b	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c3-0cd0-394a-911791af3ae6	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c3-0cd0-6d14-10faee674462	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c3-0cd0-58e2-51b4312c0d6e	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c3-0cd0-eb3d-2cb346c75f1e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c3-0cd0-7cc2-181572449c9a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c3-0cd0-68cd-2f8aaaeba911	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c3-0cd0-5195-714c825e3598	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c3-0cd0-10dc-4dc4e2f83cc6	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c3-0cd0-9393-a92fd8aea2d9	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c3-0cd0-0522-9760b8484637	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c3-0cd0-a026-ba17b553fe63	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2997 (class 0 OID 12102640)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c3-0cd0-105b-12c864c9b924	00030000-55c3-0cd0-6b64-0a71dc9caf60
00020000-55c3-0cd0-d3b4-d709a2436682	00030000-55c3-0cd0-be4e-693c62962009
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-8604-e1158ccefc46
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-ad52-28f3dcae8c26
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-2187-33cb10d13d0f
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-2641-fd010f354f5d
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-cce6-591626de02cd
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-1488-6a209a312550
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-a2f0-2d9802a514d3
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-f370-80445119184d
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-be4e-693c62962009
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-4703-759e831e872a
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-29d3-1e814eba7c28
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-293c-9a01f0fd9d8b
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-275b-296ab60ca2d7
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-f9e2-6e0024401dbb
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-acfb-6187ff787fbf
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-36bc-bccace501862
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-5731-80fc25fdd524
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-f119-c199b8ae7a9c
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-cff9-eaa8ea71e1ae
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-fd77-d2d2db6b2782
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-c2a9-c4a8ea9b8597
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-ecd8-0cb8975a8a50
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-575b-6f51103974f0
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-28db-012677c1dd62
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-8ff5-33a025a3d1f3
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-0dd2-7357713e0128
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-4794-b4819a4e9b3c
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-8c99-ba266660a3d3
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-e843-994661ff3c59
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-e458-c8744b563c00
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-c5a1-85c1b188f485
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-82ff-919ec1d77799
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-8259-c27ddc0c591f
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-f165-e102ec4f29cd
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-979b-c72b897d6930
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-0311-a4e35cabde91
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-6f10-19874b06b4a0
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-a40f-88d18ef3500c
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-7732-1b1ac74458ab
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-1be0-c025ba990bf5
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-cff8-8866f92f3095
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-3273-90d0b452b0c1
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-a9ba-bb3435693919
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-7ce9-6998564aceb7
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-efac-735ed2183780
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-63e5-e28856d5912b
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-c06a-d4dea862d0fb
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-5a16-b8017ca055fc
00020000-55c3-0cd0-ac86-0314642a640c	00030000-55c3-0cd0-c3b8-2335ff9992e6
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-8604-e1158ccefc46
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-cce6-591626de02cd
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-1488-6a209a312550
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-be4e-693c62962009
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-275b-296ab60ca2d7
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-acfb-6187ff787fbf
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-5731-80fc25fdd524
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-f119-c199b8ae7a9c
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-cff9-eaa8ea71e1ae
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-fd77-d2d2db6b2782
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-c2a9-c4a8ea9b8597
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-ecd8-0cb8975a8a50
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-575b-6f51103974f0
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-8ff5-33a025a3d1f3
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-4794-b4819a4e9b3c
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-8c99-ba266660a3d3
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-e843-994661ff3c59
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-8259-c27ddc0c591f
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-979b-c72b897d6930
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-6f10-19874b06b4a0
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-7732-1b1ac74458ab
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-0521-7f44609be704
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-8bc9-6fc9f07e7e4c
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-90e0-a8d207a0dab2
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-6ceb-b06d4e4a922d
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-30bd-98d1b67ecd16
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-7495-404cb131ce10
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-5a16-b8017ca055fc
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	00030000-55c3-0cd0-c3b8-2335ff9992e6
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-8604-e1158ccefc46
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-2187-33cb10d13d0f
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-cce6-591626de02cd
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-9f67-ee3e85de305f
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-f4b9-38c9a58eafb8
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-f4cf-7f478ec98de4
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-1488-6a209a312550
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-be4e-693c62962009
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-29d3-1e814eba7c28
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-275b-296ab60ca2d7
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-acfb-6187ff787fbf
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-5731-80fc25fdd524
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-cff9-eaa8ea71e1ae
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-fd77-d2d2db6b2782
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-c2a9-c4a8ea9b8597
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-575b-6f51103974f0
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-8ff5-33a025a3d1f3
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-e843-994661ff3c59
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-c5a1-85c1b188f485
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-8259-c27ddc0c591f
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-979b-c72b897d6930
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-6f10-19874b06b4a0
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-7732-1b1ac74458ab
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-cff8-8866f92f3095
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-7ce9-6998564aceb7
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-63e5-e28856d5912b
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-5a16-b8017ca055fc
00020000-55c3-0cd0-a6a3-54829a002120	00030000-55c3-0cd0-c3b8-2335ff9992e6
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-8604-e1158ccefc46
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-ad52-28f3dcae8c26
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-2641-fd010f354f5d
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-cce6-591626de02cd
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-1488-6a209a312550
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-be4e-693c62962009
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-275b-296ab60ca2d7
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-acfb-6187ff787fbf
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-cff9-eaa8ea71e1ae
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-fd77-d2d2db6b2782
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-575b-6f51103974f0
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-8ff5-33a025a3d1f3
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-e843-994661ff3c59
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-8259-c27ddc0c591f
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-979b-c72b897d6930
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-6f10-19874b06b4a0
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-7732-1b1ac74458ab
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-cff8-8866f92f3095
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-5a16-b8017ca055fc
00020000-55c3-0cd0-761d-34be587468e4	00030000-55c3-0cd0-c3b8-2335ff9992e6
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-8604-e1158ccefc46
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-cce6-591626de02cd
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-1488-6a209a312550
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-be4e-693c62962009
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-275b-296ab60ca2d7
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-acfb-6187ff787fbf
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-cff9-eaa8ea71e1ae
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-fd77-d2d2db6b2782
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-575b-6f51103974f0
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-8ff5-33a025a3d1f3
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-e843-994661ff3c59
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-8259-c27ddc0c591f
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-979b-c72b897d6930
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-6f10-19874b06b4a0
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-7732-1b1ac74458ab
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-ed8f-7d3d6d87d86a
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-925e-c56d4809b1f8
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-cff8-8866f92f3095
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-5a16-b8017ca055fc
00020000-55c3-0cd0-5612-916beda3196e	00030000-55c3-0cd0-c3b8-2335ff9992e6
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-8cf9-3c4347f1c830
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-6b64-0a71dc9caf60
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-925e-c56d4809b1f8
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-a2f0-2d9802a514d3
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-b77f-f66d772b5329
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-dab3-fc8739a238bc
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-8604-e1158ccefc46
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-ad52-28f3dcae8c26
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-2187-33cb10d13d0f
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-2641-fd010f354f5d
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-cce6-591626de02cd
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-9f67-ee3e85de305f
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-f4b9-38c9a58eafb8
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-797f-d97a796d84ed
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-f4cf-7f478ec98de4
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-b173-8d9481e98ec3
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-1488-6a209a312550
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-f370-80445119184d
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-be4e-693c62962009
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-4703-759e831e872a
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-65e5-b57544986892
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-8268-21f9c3ec7299
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-e4d8-8362cf5b0150
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-fc18-f1154da87b3d
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-29d3-1e814eba7c28
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-293c-9a01f0fd9d8b
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-275b-296ab60ca2d7
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-f9e2-6e0024401dbb
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-acfb-6187ff787fbf
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-36bc-bccace501862
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-5731-80fc25fdd524
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-f119-c199b8ae7a9c
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-ef9e-8e76189adfe2
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-8308-cb1cea1c542a
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-852f-1b4e6d24c47d
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-2968-f22ad144ff03
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-cff9-eaa8ea71e1ae
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-4c1d-c17135d2294e
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-fd77-d2d2db6b2782
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-a743-417862f2a8d4
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-c2a9-c4a8ea9b8597
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-ecd8-0cb8975a8a50
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-9c70-f99c38ae4e9d
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-f380-329fb148be62
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-9ec4-a083a2810857
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-d34b-4fad011bb17a
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-a548-f952ed334c42
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-4ecc-d6b58f546fad
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-575b-6f51103974f0
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-28db-012677c1dd62
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-8ff5-33a025a3d1f3
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-0dd2-7357713e0128
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-ccb3-d595b8c222a1
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-8cee-912ad96b19ff
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-4794-b4819a4e9b3c
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-8c99-ba266660a3d3
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-e843-994661ff3c59
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-e458-c8744b563c00
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-2011-f44632a3c71e
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-d5d5-5e2806c697ef
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-afa8-ae8050cb0c90
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-d5b9-35a9d79aa917
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-c5a1-85c1b188f485
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-82ff-919ec1d77799
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-aff8-28e0e818c6a6
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-102c-532829e4a0ab
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-2956-ab7566296416
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-17c8-d4bab7f868e0
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-4760-0bc4d1d88a17
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-a790-0371186b0504
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-e784-afb36b42f2bf
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-3fb2-956fa7886076
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-82e1-a3934b73c7e5
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-184b-960a2d3e28c1
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-35f4-8f75a907179b
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-e5a2-529d9a58c0f7
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-cf31-bf61f22f9438
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-9747-f89e0d50e4e1
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-53f2-4e9035320aeb
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-aa6a-35bc9f0d45cb
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-0003-cb3dfb15c42d
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-046c-78a0b658dec2
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-044a-5900d223b2b5
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-24ba-a94e8e65304d
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-8259-c27ddc0c591f
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-f165-e102ec4f29cd
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-070d-859775925774
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-9435-ffb79479a401
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-3499-19093e247b5f
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-ac08-8069ffb4f272
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-979b-c72b897d6930
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-0311-a4e35cabde91
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-6f10-19874b06b4a0
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-a40f-88d18ef3500c
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-496e-1a660a2e7172
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-9ec9-028ac2cc7322
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-ded0-6fd948e764f9
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-89f8-848fd59c9bc8
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-4411-5e06feb07019
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-2032-0326d79912fc
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-cedb-a7e8fe1124f6
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-0374-4114efcfd21c
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-7732-1b1ac74458ab
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-1be0-c025ba990bf5
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-bb0f-3046c9fdb1c5
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-66cf-f00ec459c02e
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-643e-eb59b97baf21
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-c2e6-a2d128e97303
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-ad7f-ba3d93a8c900
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-53b1-635303cd6817
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-8bf6-5f1ff19e6598
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-a0ca-c1749fcc3a72
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-0521-7f44609be704
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-8bc9-6fc9f07e7e4c
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-ed8f-7d3d6d87d86a
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-4f90-ec1ffa7ac484
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-cff8-8866f92f3095
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-1e2a-0b9f79defca3
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-d277-9e566b817e5c
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-d5ad-8ff8992e00b0
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-90e0-a8d207a0dab2
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-6ceb-b06d4e4a922d
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-3273-90d0b452b0c1
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-a9ba-bb3435693919
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-7ce9-6998564aceb7
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-efac-735ed2183780
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-8428-d18223b96730
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-1e45-f9e1333fcc45
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-30bd-98d1b67ecd16
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-7495-404cb131ce10
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-63e5-e28856d5912b
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-c06a-d4dea862d0fb
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-5a16-b8017ca055fc
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-6d4f-91681d23ae13
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-c3b8-2335ff9992e6
00020000-55c3-0cd2-0ee9-085d6b78abb2	00030000-55c3-0cd0-7264-6928717367df
\.


--
-- TOC entry 3025 (class 0 OID 12102939)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 12102970)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 12103084)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c3-0cd2-a46d-386782357781	00090000-55c3-0cd2-b9ae-677bf907a668	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c3-0cd2-e5bf-ebdab120aa50	00090000-55c3-0cd2-b948-cd3ea137739d	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c3-0cd2-0fd0-83ddf152f95d	00090000-55c3-0cd2-2b84-710c1688e4c9	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3002 (class 0 OID 12102700)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c3-0cd2-2b48-ccd59d76ed17	00040000-55c3-0cd0-8349-8333fdc9ac44	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-0cd2-407f-f29c89b93ca6	00040000-55c3-0cd0-8349-8333fdc9ac44	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c3-0cd2-e7d8-2759e1a1e29c	00040000-55c3-0cd0-8349-8333fdc9ac44	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-0cd2-c393-3449b24758bd	00040000-55c3-0cd0-8349-8333fdc9ac44	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-0cd2-bb19-12ed0fb9df3c	00040000-55c3-0cd0-8349-8333fdc9ac44	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-0cd2-286a-eb79a2234e8e	00040000-55c3-0cd0-c81b-e3b062381ce2	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-0cd2-51d0-7138af45b3fe	00040000-55c3-0cd0-620b-eb59e477cdea	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-0cd2-84d1-0bc7579c42fb	00040000-55c3-0cd0-9163-51d06fbb2e8b	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-0cd2-44fd-f8f1660e65c6	00040000-55c3-0cd0-8349-8333fdc9ac44	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3004 (class 0 OID 12102735)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c3-0cd0-8396-ff3484750466	8341	Adlešiči
00050000-55c3-0cd0-523c-495cd40e0bd3	5270	Ajdovščina
00050000-55c3-0cd0-1801-2dda485281d3	6280	Ankaran/Ancarano
00050000-55c3-0cd0-5540-af053f6f2d60	9253	Apače
00050000-55c3-0cd0-5f79-52b49aeb8efc	8253	Artiče
00050000-55c3-0cd0-7632-07e9d2639cbc	4275	Begunje na Gorenjskem
00050000-55c3-0cd0-f659-bc142583a557	1382	Begunje pri Cerknici
00050000-55c3-0cd0-afe4-e0ebb965900d	9231	Beltinci
00050000-55c3-0cd0-7b85-355269c2ee2e	2234	Benedikt
00050000-55c3-0cd0-ca68-d3844478e6ea	2345	Bistrica ob Dravi
00050000-55c3-0cd0-d608-34c92a3a7944	3256	Bistrica ob Sotli
00050000-55c3-0cd0-27f8-90f415800a87	8259	Bizeljsko
00050000-55c3-0cd0-f24b-6b72b0e6ceab	1223	Blagovica
00050000-55c3-0cd0-2f42-13e17a37a9cf	8283	Blanca
00050000-55c3-0cd0-a5c6-06ba60feec3b	4260	Bled
00050000-55c3-0cd0-c553-de56e6844cfa	4273	Blejska Dobrava
00050000-55c3-0cd0-5387-6743c423f38a	9265	Bodonci
00050000-55c3-0cd0-7011-a893fea9af5f	9222	Bogojina
00050000-55c3-0cd0-97fb-4993e9518c52	4263	Bohinjska Bela
00050000-55c3-0cd0-ca95-414755aea131	4264	Bohinjska Bistrica
00050000-55c3-0cd0-0b8d-7c24cc28d18c	4265	Bohinjsko jezero
00050000-55c3-0cd0-c277-16683ebf4464	1353	Borovnica
00050000-55c3-0cd0-d5af-8fa3e1df5429	8294	Boštanj
00050000-55c3-0cd0-7c54-d86a5b1890b3	5230	Bovec
00050000-55c3-0cd0-8c79-a5d771fde6f9	5295	Branik
00050000-55c3-0cd0-dc55-304c1e6b2c31	3314	Braslovče
00050000-55c3-0cd0-30a8-e4bc117e79e5	5223	Breginj
00050000-55c3-0cd0-8174-709866d53941	8280	Brestanica
00050000-55c3-0cd0-bdd8-45f17e96722b	2354	Bresternica
00050000-55c3-0cd0-47a6-99da05665d1b	4243	Brezje
00050000-55c3-0cd0-365b-68aa826c0aff	1351	Brezovica pri Ljubljani
00050000-55c3-0cd0-46b5-1d627eb1e136	8250	Brežice
00050000-55c3-0cd0-0c6b-470398aeb8b7	4210	Brnik - Aerodrom
00050000-55c3-0cd0-0fe8-5bfdf7b89728	8321	Brusnice
00050000-55c3-0cd0-49d6-7c1ab977e352	3255	Buče
00050000-55c3-0cd0-f6da-0edabc5b5412	8276	Bučka 
00050000-55c3-0cd0-af31-e136fdf433dc	9261	Cankova
00050000-55c3-0cd0-a3fa-d362c5baa866	3000	Celje 
00050000-55c3-0cd0-e74f-fc4dff8f208a	3001	Celje - poštni predali
00050000-55c3-0cd0-a87c-d9e36a509a97	4207	Cerklje na Gorenjskem
00050000-55c3-0cd0-f2c8-88ce48417512	8263	Cerklje ob Krki
00050000-55c3-0cd0-a67a-438c4fd17647	1380	Cerknica
00050000-55c3-0cd0-43be-21b76140c0b4	5282	Cerkno
00050000-55c3-0cd0-26f2-cb909d0dcbf6	2236	Cerkvenjak
00050000-55c3-0cd0-8ece-baf909459b1a	2215	Ceršak
00050000-55c3-0cd0-a841-7e5f6d3f63b4	2326	Cirkovce
00050000-55c3-0cd0-2ea8-9a749486bb43	2282	Cirkulane
00050000-55c3-0cd0-ffb5-9d887aada9a2	5273	Col
00050000-55c3-0cd0-ba35-2baec98186dd	8251	Čatež ob Savi
00050000-55c3-0cd0-c7de-0fe1e2151272	1413	Čemšenik
00050000-55c3-0cd0-9e5b-af6914e1398e	5253	Čepovan
00050000-55c3-0cd0-b9b9-c14724df8870	9232	Črenšovci
00050000-55c3-0cd0-4164-f3b29074df14	2393	Črna na Koroškem
00050000-55c3-0cd0-b24b-7374263ed24e	6275	Črni Kal
00050000-55c3-0cd0-d9dc-111fb1d861c7	5274	Črni Vrh nad Idrijo
00050000-55c3-0cd0-2976-308a85e6f7b2	5262	Črniče
00050000-55c3-0cd0-a08d-d237a1915d94	8340	Črnomelj
00050000-55c3-0cd0-11f3-f6acf9532c89	6271	Dekani
00050000-55c3-0cd0-2c17-dcc314466cd0	5210	Deskle
00050000-55c3-0cd0-4c02-d193ac56b22d	2253	Destrnik
00050000-55c3-0cd0-e5af-b79e4e614902	6215	Divača
00050000-55c3-0cd0-93a9-130bb05f37c5	1233	Dob
00050000-55c3-0cd0-97cb-23cb5ce8ca93	3224	Dobje pri Planini
00050000-55c3-0cd0-daec-05c4b961529b	8257	Dobova
00050000-55c3-0cd0-b905-8cc89e242798	1423	Dobovec
00050000-55c3-0cd0-8a25-35bad072d2ea	5263	Dobravlje
00050000-55c3-0cd0-e57a-33590d502186	3204	Dobrna
00050000-55c3-0cd0-f140-182e78ca5793	8211	Dobrnič
00050000-55c3-0cd0-15cd-b60bf8151c79	1356	Dobrova
00050000-55c3-0cd0-15bc-384db66e53e0	9223	Dobrovnik/Dobronak 
00050000-55c3-0cd0-d65a-3debf8122c76	5212	Dobrovo v Brdih
00050000-55c3-0cd0-96c5-445eb82842b3	1431	Dol pri Hrastniku
00050000-55c3-0cd0-7efb-f5c9cf982f5c	1262	Dol pri Ljubljani
00050000-55c3-0cd0-8868-c27996061cd0	1273	Dole pri Litiji
00050000-55c3-0cd0-db1c-431082c03dc5	1331	Dolenja vas
00050000-55c3-0cd0-e587-eaa5d4176e16	8350	Dolenjske Toplice
00050000-55c3-0cd0-2216-cd2fc1354b02	1230	Domžale
00050000-55c3-0cd0-8e7e-a7b1f90d281c	2252	Dornava
00050000-55c3-0cd0-4fad-cb002a70b129	5294	Dornberk
00050000-55c3-0cd0-ece6-5886dfdc37bc	1319	Draga
00050000-55c3-0cd0-743a-b7e2ead304f2	8343	Dragatuš
00050000-55c3-0cd0-4f78-4909b1e89820	3222	Dramlje
00050000-55c3-0cd0-f95a-81d9271324b9	2370	Dravograd
00050000-55c3-0cd0-85a8-3df003ed7492	4203	Duplje
00050000-55c3-0cd0-f64f-83608c6c0d58	6221	Dutovlje
00050000-55c3-0cd0-2023-7fc4c32d6cfb	8361	Dvor
00050000-55c3-0cd0-8d1b-38fc829d24b8	2343	Fala
00050000-55c3-0cd0-1451-b3e0b50fc400	9208	Fokovci
00050000-55c3-0cd0-ce1a-b62ab69a2cb4	2313	Fram
00050000-55c3-0cd0-126f-1e3df2c49005	3213	Frankolovo
00050000-55c3-0cd0-1478-99b4b251a481	1274	Gabrovka
00050000-55c3-0cd0-5522-25dabc490068	8254	Globoko
00050000-55c3-0cd0-7a86-d657fdffa404	5275	Godovič
00050000-55c3-0cd0-f2ca-a7c08df9cca9	4204	Golnik
00050000-55c3-0cd0-4ebf-461c1376407f	3303	Gomilsko
00050000-55c3-0cd0-7b57-0f9f5721afdd	4224	Gorenja vas
00050000-55c3-0cd0-368c-f64e8c6bd6e0	3263	Gorica pri Slivnici
00050000-55c3-0cd0-a121-cbceb93daf16	2272	Gorišnica
00050000-55c3-0cd0-aaf2-b97ee19347f2	9250	Gornja Radgona
00050000-55c3-0cd0-75af-28c7b525264e	3342	Gornji Grad
00050000-55c3-0cd0-0f95-b0e8d4fddf9d	4282	Gozd Martuljek
00050000-55c3-0cd1-80c5-7c1c80a541ea	6272	Gračišče
00050000-55c3-0cd1-dbbc-6e76259c4a1d	9264	Grad
00050000-55c3-0cd1-7227-165fdad0142f	8332	Gradac
00050000-55c3-0cd1-72f0-94f5a97e83e5	1384	Grahovo
00050000-55c3-0cd1-06b6-8d53d66c4436	5242	Grahovo ob Bači
00050000-55c3-0cd1-0854-764d1c5a133e	5251	Grgar
00050000-55c3-0cd1-4667-8daaa1ab4c70	3302	Griže
00050000-55c3-0cd1-4db1-60a420401a52	3231	Grobelno
00050000-55c3-0cd1-a5c8-f19579c87c70	1290	Grosuplje
00050000-55c3-0cd1-9c8e-d5011503a15d	2288	Hajdina
00050000-55c3-0cd1-f206-ff5e05182598	8362	Hinje
00050000-55c3-0cd1-a766-eb9f3a9c22c2	2311	Hoče
00050000-55c3-0cd1-f115-b11acc9be38a	9205	Hodoš/Hodos
00050000-55c3-0cd1-1de3-61c4bc790ba6	1354	Horjul
00050000-55c3-0cd1-bd9f-ff916bc61c48	1372	Hotedršica
00050000-55c3-0cd1-2f49-1cb29eb587d3	1430	Hrastnik
00050000-55c3-0cd1-f44e-300e8e3f1449	6225	Hruševje
00050000-55c3-0cd1-fb3e-4a6e2907b4ac	4276	Hrušica
00050000-55c3-0cd1-3865-a48255fcc8a2	5280	Idrija
00050000-55c3-0cd1-5580-d53ebe9a9779	1292	Ig
00050000-55c3-0cd1-abc8-3825cf735418	6250	Ilirska Bistrica
00050000-55c3-0cd1-e7af-19b347007f85	6251	Ilirska Bistrica-Trnovo
00050000-55c3-0cd1-8771-e036cb675cb4	1295	Ivančna Gorica
00050000-55c3-0cd1-8bbd-98149ae4e018	2259	Ivanjkovci
00050000-55c3-0cd1-af1d-f958a0518c36	1411	Izlake
00050000-55c3-0cd1-fe0d-7bb3f22cb1bd	6310	Izola/Isola
00050000-55c3-0cd1-a264-38a4467ca6d1	2222	Jakobski Dol
00050000-55c3-0cd1-f0ff-077356ac0605	2221	Jarenina
00050000-55c3-0cd1-7243-2407d079f57d	6254	Jelšane
00050000-55c3-0cd1-da10-8665af50152a	4270	Jesenice
00050000-55c3-0cd1-cf91-59cea507c8a1	8261	Jesenice na Dolenjskem
00050000-55c3-0cd1-9eeb-824fff99d8f3	3273	Jurklošter
00050000-55c3-0cd1-56a3-77bac2a042e1	2223	Jurovski Dol
00050000-55c3-0cd1-a36f-47d21d00d440	2256	Juršinci
00050000-55c3-0cd1-6d69-5b08334c9ebd	5214	Kal nad Kanalom
00050000-55c3-0cd1-8ce9-2e3523727cfe	3233	Kalobje
00050000-55c3-0cd1-aea9-53309337507c	4246	Kamna Gorica
00050000-55c3-0cd1-2ff7-3d103dd69861	2351	Kamnica
00050000-55c3-0cd1-d98a-5d7e119117b0	1241	Kamnik
00050000-55c3-0cd1-88cf-189ec7da0011	5213	Kanal
00050000-55c3-0cd1-2654-a6c7094d3f31	8258	Kapele
00050000-55c3-0cd1-ab93-585778a562b8	2362	Kapla
00050000-55c3-0cd1-becd-170adec9f524	2325	Kidričevo
00050000-55c3-0cd1-2134-f19b179b9624	1412	Kisovec
00050000-55c3-0cd1-0a7b-e50e034ff253	6253	Knežak
00050000-55c3-0cd1-7559-54c45eb5a4bd	5222	Kobarid
00050000-55c3-0cd1-fe80-3a2c703d147d	9227	Kobilje
00050000-55c3-0cd1-53c4-c37bf9aebabb	1330	Kočevje
00050000-55c3-0cd1-8beb-7bc4f50856a2	1338	Kočevska Reka
00050000-55c3-0cd1-0244-3e7431e128c9	2276	Kog
00050000-55c3-0cd1-308d-4c7a071feaa9	5211	Kojsko
00050000-55c3-0cd1-028b-e6e81bab378c	6223	Komen
00050000-55c3-0cd1-916b-0811bfc8fb0e	1218	Komenda
00050000-55c3-0cd1-be40-1c868ba6bcc2	6000	Koper/Capodistria 
00050000-55c3-0cd1-cf7e-58cd76ecf92d	6001	Koper/Capodistria - poštni predali
00050000-55c3-0cd1-d2cf-8ba9ce939630	8282	Koprivnica
00050000-55c3-0cd1-4929-880948c476fd	5296	Kostanjevica na Krasu
00050000-55c3-0cd1-5250-8b021fd77daa	8311	Kostanjevica na Krki
00050000-55c3-0cd1-23dd-156d7353d2db	1336	Kostel
00050000-55c3-0cd1-6e5a-21db90551e84	6256	Košana
00050000-55c3-0cd1-c43d-fa6fafe80d90	2394	Kotlje
00050000-55c3-0cd1-b0d9-63885ad7f0fb	6240	Kozina
00050000-55c3-0cd1-ae03-354c2a239699	3260	Kozje
00050000-55c3-0cd1-077a-94bc59494da1	4000	Kranj 
00050000-55c3-0cd1-b958-d6dea51c948f	4001	Kranj - poštni predali
00050000-55c3-0cd1-336e-89d8b43495c9	4280	Kranjska Gora
00050000-55c3-0cd1-c622-d966275d6508	1281	Kresnice
00050000-55c3-0cd1-efe9-05ed238aa81e	4294	Križe
00050000-55c3-0cd1-d519-23396b46284d	9206	Križevci
00050000-55c3-0cd1-a764-d96da1c8ae76	9242	Križevci pri Ljutomeru
00050000-55c3-0cd1-4144-fcab0440ae02	1301	Krka
00050000-55c3-0cd1-4531-af30192fea2f	8296	Krmelj
00050000-55c3-0cd1-a399-f6216f0b6d94	4245	Kropa
00050000-55c3-0cd1-cea6-0dbcb4ea477b	8262	Krška vas
00050000-55c3-0cd1-e56e-0c6c82cf9ef1	8270	Krško
00050000-55c3-0cd1-9306-bb0bb0842ddc	9263	Kuzma
00050000-55c3-0cd1-75f1-efb4b4c3a0f3	2318	Laporje
00050000-55c3-0cd1-8b13-ea5c0fc54908	3270	Laško
00050000-55c3-0cd1-346f-a836785a8159	1219	Laze v Tuhinju
00050000-55c3-0cd1-9d3f-17e33e17116b	2230	Lenart v Slovenskih goricah
00050000-55c3-0cd1-8ffd-85786490739f	9220	Lendava/Lendva
00050000-55c3-0cd1-3a0d-580c42b7d2eb	4248	Lesce
00050000-55c3-0cd1-2d47-5a1a2860a82a	3261	Lesično
00050000-55c3-0cd1-6f99-073cbe26b04d	8273	Leskovec pri Krškem
00050000-55c3-0cd1-2668-18e2462f8287	2372	Libeliče
00050000-55c3-0cd1-bcd8-7de2ecc77101	2341	Limbuš
00050000-55c3-0cd1-b3c9-71d891772114	1270	Litija
00050000-55c3-0cd1-111b-f80c9221bc13	3202	Ljubečna
00050000-55c3-0cd1-a6ea-cef004b2734c	1000	Ljubljana 
00050000-55c3-0cd1-7369-7292e408a43a	1001	Ljubljana - poštni predali
00050000-55c3-0cd1-1f5b-5b80f0b76daf	1231	Ljubljana - Črnuče
00050000-55c3-0cd1-acb9-24e5dd8ad261	1261	Ljubljana - Dobrunje
00050000-55c3-0cd1-9008-e94733f00c04	1260	Ljubljana - Polje
00050000-55c3-0cd1-369a-4360e4b6a55f	1210	Ljubljana - Šentvid
00050000-55c3-0cd1-c55b-4d193ca67318	1211	Ljubljana - Šmartno
00050000-55c3-0cd1-dc08-dafe06bd81bc	3333	Ljubno ob Savinji
00050000-55c3-0cd1-5778-fa0e1f1ac42d	9240	Ljutomer
00050000-55c3-0cd1-b750-3db23b6bf0c7	3215	Loče
00050000-55c3-0cd1-01ab-4f7516c04ea3	5231	Log pod Mangartom
00050000-55c3-0cd1-ba2a-6a5bd63c3e37	1358	Log pri Brezovici
00050000-55c3-0cd1-8ca7-d31a7a987fdc	1370	Logatec
00050000-55c3-0cd1-a373-921e3fcca0f9	1371	Logatec
00050000-55c3-0cd1-127c-b0e6673a86e7	1434	Loka pri Zidanem Mostu
00050000-55c3-0cd1-420f-88e1a673efff	3223	Loka pri Žusmu
00050000-55c3-0cd1-06ed-0690d218fe41	6219	Lokev
00050000-55c3-0cd1-184d-e215a87941aa	1318	Loški Potok
00050000-55c3-0cd1-1dd8-75f43a6cd92e	2324	Lovrenc na Dravskem polju
00050000-55c3-0cd1-f8a9-21fd91b15a05	2344	Lovrenc na Pohorju
00050000-55c3-0cd1-3b28-90f2f7b7b1a3	3334	Luče
00050000-55c3-0cd1-e708-a8e6d9914282	1225	Lukovica
00050000-55c3-0cd1-3954-8604cd7eb2aa	9202	Mačkovci
00050000-55c3-0cd1-80c7-c83dc6568452	2322	Majšperk
00050000-55c3-0cd1-19a1-d767813bf123	2321	Makole
00050000-55c3-0cd1-de2e-f06eb36943d2	9243	Mala Nedelja
00050000-55c3-0cd1-2bea-8604a5a7a177	2229	Malečnik
00050000-55c3-0cd1-509a-3bc488b8380a	6273	Marezige
00050000-55c3-0cd1-b799-23cca8bc0a1e	2000	Maribor 
00050000-55c3-0cd1-1123-b68396328c3c	2001	Maribor - poštni predali
00050000-55c3-0cd1-bbc8-29a00fbcc945	2206	Marjeta na Dravskem polju
00050000-55c3-0cd1-c132-c6f5b5aba6b4	2281	Markovci
00050000-55c3-0cd1-9b38-1b474f0f1cc4	9221	Martjanci
00050000-55c3-0cd1-3b94-65d7dbd71cc3	6242	Materija
00050000-55c3-0cd1-f453-32a7bc3bb73b	4211	Mavčiče
00050000-55c3-0cd1-11f1-b6af5ad66f34	1215	Medvode
00050000-55c3-0cd1-7814-8b8b6a7acaac	1234	Mengeš
00050000-55c3-0cd1-5128-263c510cd534	8330	Metlika
00050000-55c3-0cd1-b3b9-d21775e48b16	2392	Mežica
00050000-55c3-0cd1-34fc-bb16d5a2b936	2204	Miklavž na Dravskem polju
00050000-55c3-0cd1-5e29-458927db6ccb	2275	Miklavž pri Ormožu
00050000-55c3-0cd1-c87e-2903888295e1	5291	Miren
00050000-55c3-0cd1-15cc-b43be17b0a8d	8233	Mirna
00050000-55c3-0cd1-1acf-fa3f905ffe30	8216	Mirna Peč
00050000-55c3-0cd1-1889-a6ab476d81da	2382	Mislinja
00050000-55c3-0cd1-fefb-94ad3f6aa5a8	4281	Mojstrana
00050000-55c3-0cd1-e5a7-8d7fe0cf3584	8230	Mokronog
00050000-55c3-0cd1-4f79-f8c7ca295eef	1251	Moravče
00050000-55c3-0cd1-21ce-2dec40f05d54	9226	Moravske Toplice
00050000-55c3-0cd1-da03-05b50dfca49f	5216	Most na Soči
00050000-55c3-0cd1-b66c-d733dfeac686	1221	Motnik
00050000-55c3-0cd1-25bf-2f61eba9a75a	3330	Mozirje
00050000-55c3-0cd1-3717-165205fbab22	9000	Murska Sobota 
00050000-55c3-0cd1-3795-89d0a1f508ef	9001	Murska Sobota - poštni predali
00050000-55c3-0cd1-d0b0-8f1df1f2abc3	2366	Muta
00050000-55c3-0cd1-670c-f99d6ecc938c	4202	Naklo
00050000-55c3-0cd1-da23-8582ddaad198	3331	Nazarje
00050000-55c3-0cd1-09ab-4ac0713b7e36	1357	Notranje Gorice
00050000-55c3-0cd1-e40e-6a5455a89e30	3203	Nova Cerkev
00050000-55c3-0cd1-b172-a33a90d77ac9	5000	Nova Gorica 
00050000-55c3-0cd1-bb81-ab0f77244f13	5001	Nova Gorica - poštni predali
00050000-55c3-0cd1-7e85-16d6ff6d4ade	1385	Nova vas
00050000-55c3-0cd1-96ad-d9746c75b496	8000	Novo mesto
00050000-55c3-0cd1-7f63-57495d5372d6	8001	Novo mesto - poštni predali
00050000-55c3-0cd1-3932-ad457c00dda0	6243	Obrov
00050000-55c3-0cd1-b18a-3881398548d2	9233	Odranci
00050000-55c3-0cd1-b34d-1dcda2072852	2317	Oplotnica
00050000-55c3-0cd1-f282-c9dc561f4726	2312	Orehova vas
00050000-55c3-0cd1-fc50-beca2d234316	2270	Ormož
00050000-55c3-0cd1-ae83-300a09b565d7	1316	Ortnek
00050000-55c3-0cd1-166e-f0bc43407d4f	1337	Osilnica
00050000-55c3-0cd1-0622-0a0ebc14b8a9	8222	Otočec
00050000-55c3-0cd1-1d3c-6838923646e9	2361	Ožbalt
00050000-55c3-0cd1-59d1-f7d4da9b67a4	2231	Pernica
00050000-55c3-0cd1-03e0-1c53ee65b494	2211	Pesnica pri Mariboru
00050000-55c3-0cd1-648f-9d9fc58cae3b	9203	Petrovci
00050000-55c3-0cd1-0620-48f0516e64b7	3301	Petrovče
00050000-55c3-0cd1-d5a5-93ca0885f269	6330	Piran/Pirano
00050000-55c3-0cd1-9041-fd0aa66cc438	8255	Pišece
00050000-55c3-0cd1-11a1-127fdc43bdf7	6257	Pivka
00050000-55c3-0cd1-738d-f90c791398c1	6232	Planina
00050000-55c3-0cd1-e553-cf8b29eb550f	3225	Planina pri Sevnici
00050000-55c3-0cd1-cc3f-35b9a48ec07b	6276	Pobegi
00050000-55c3-0cd1-4b1f-9cb139a7bd0c	8312	Podbočje
00050000-55c3-0cd1-82c7-633802fde14d	5243	Podbrdo
00050000-55c3-0cd1-e0e0-76e3f9360026	3254	Podčetrtek
00050000-55c3-0cd1-c00b-06a4ba1bbe7f	2273	Podgorci
00050000-55c3-0cd1-226f-5424b4cde6ca	6216	Podgorje
00050000-55c3-0cd1-9953-135b7431f138	2381	Podgorje pri Slovenj Gradcu
00050000-55c3-0cd1-0e5f-b57c99cfc3e1	6244	Podgrad
00050000-55c3-0cd1-7d03-7e10b752272d	1414	Podkum
00050000-55c3-0cd1-1f3b-a4a3027d1e18	2286	Podlehnik
00050000-55c3-0cd1-7180-0555c717621d	5272	Podnanos
00050000-55c3-0cd1-67c1-07d9975b8924	4244	Podnart
00050000-55c3-0cd1-4dda-ebd4028e8664	3241	Podplat
00050000-55c3-0cd1-c83d-b4bbb328b9eb	3257	Podsreda
00050000-55c3-0cd1-ca22-de602e568358	2363	Podvelka
00050000-55c3-0cd1-5812-6d93992ad34d	2208	Pohorje
00050000-55c3-0cd1-b626-475cab48b6c5	2257	Polenšak
00050000-55c3-0cd1-2e47-672567ac5c1a	1355	Polhov Gradec
00050000-55c3-0cd1-78f4-41573a0bc868	4223	Poljane nad Škofjo Loko
00050000-55c3-0cd1-0c40-c6d25b1c2186	2319	Poljčane
00050000-55c3-0cd1-2ac6-999f8129b2c0	1272	Polšnik
00050000-55c3-0cd1-5921-fad58eeb37e3	3313	Polzela
00050000-55c3-0cd1-08b0-10ca703ca86b	3232	Ponikva
00050000-55c3-0cd1-44a9-7a4b24a6425f	6320	Portorož/Portorose
00050000-55c3-0cd1-fc1f-f07249c0903c	6230	Postojna
00050000-55c3-0cd1-9a4c-25d9cd4b1732	2331	Pragersko
00050000-55c3-0cd1-43c6-29e35ce91b41	3312	Prebold
00050000-55c3-0cd1-9dd0-2c40303e153f	4205	Preddvor
00050000-55c3-0cd1-df92-0e9e254fa8d6	6255	Prem
00050000-55c3-0cd1-499b-999a3f272e30	1352	Preserje
00050000-55c3-0cd1-cc26-dbc1d5217a29	6258	Prestranek
00050000-55c3-0cd1-3a15-c7c3c3d4aa92	2391	Prevalje
00050000-55c3-0cd1-17b8-8f241f757ac2	3262	Prevorje
00050000-55c3-0cd1-8237-99f46212dd0c	1276	Primskovo 
00050000-55c3-0cd1-6448-0d246f67dde0	3253	Pristava pri Mestinju
00050000-55c3-0cd1-5bfd-69db1902943e	9207	Prosenjakovci/Partosfalva
00050000-55c3-0cd1-feef-dea2ba70d8e0	5297	Prvačina
00050000-55c3-0cd1-0050-ccfc6f631326	2250	Ptuj
00050000-55c3-0cd1-9fcb-0a8f7aaf0390	2323	Ptujska Gora
00050000-55c3-0cd1-8739-d46052b5d1e5	9201	Puconci
00050000-55c3-0cd1-0850-cf8acb23f4f6	2327	Rače
00050000-55c3-0cd1-e17a-d8b1c346e6e8	1433	Radeče
00050000-55c3-0cd1-6561-a231382ce31f	9252	Radenci
00050000-55c3-0cd1-5dcc-87a60c6236a3	2360	Radlje ob Dravi
00050000-55c3-0cd1-7e01-6b2d5a00afe0	1235	Radomlje
00050000-55c3-0cd1-2e20-c45e28761a32	4240	Radovljica
00050000-55c3-0cd1-8fe1-03a5879801c7	8274	Raka
00050000-55c3-0cd1-ea99-f8c2fae948ba	1381	Rakek
00050000-55c3-0cd1-5bdb-f69817a8a3c3	4283	Rateče - Planica
00050000-55c3-0cd1-fdc3-d5d246e9aea3	2390	Ravne na Koroškem
00050000-55c3-0cd1-fb62-5a9875f723af	9246	Razkrižje
00050000-55c3-0cd1-0606-e3ef528c4806	3332	Rečica ob Savinji
00050000-55c3-0cd1-fd03-b12a6194e3c5	5292	Renče
00050000-55c3-0cd1-d0f1-402e201b5d7c	1310	Ribnica
00050000-55c3-0cd1-5235-986a07bf4785	2364	Ribnica na Pohorju
00050000-55c3-0cd1-0857-da58bb0d64ef	3272	Rimske Toplice
00050000-55c3-0cd1-ce3a-eeb5f90a5395	1314	Rob
00050000-55c3-0cd1-ffff-afd656688ce5	5215	Ročinj
00050000-55c3-0cd1-46b5-693df05aff8f	3250	Rogaška Slatina
00050000-55c3-0cd1-c234-d9e852d8972f	9262	Rogašovci
00050000-55c3-0cd1-0600-688111cf629c	3252	Rogatec
00050000-55c3-0cd1-4770-f0c59a6f3452	1373	Rovte
00050000-55c3-0cd1-6eab-984565178a0e	2342	Ruše
00050000-55c3-0cd1-57ba-11fb45763355	1282	Sava
00050000-55c3-0cd1-435c-1797d12b0e74	6333	Sečovlje/Sicciole
00050000-55c3-0cd1-45bf-560bbcced9ee	4227	Selca
00050000-55c3-0cd1-678b-50879ad30d6e	2352	Selnica ob Dravi
00050000-55c3-0cd1-4e79-ef89e7e8cb1b	8333	Semič
00050000-55c3-0cd1-28e1-b91d44ddb49c	8281	Senovo
00050000-55c3-0cd1-8093-3766c4f04f0a	6224	Senožeče
00050000-55c3-0cd1-abbf-87c497ef61da	8290	Sevnica
00050000-55c3-0cd1-ce58-a2a119e14f73	6210	Sežana
00050000-55c3-0cd1-b468-bd7cf9b54511	2214	Sladki Vrh
00050000-55c3-0cd1-97f2-c9e76106c432	5283	Slap ob Idrijci
00050000-55c3-0cd1-ed53-3e8b3be3eac1	2380	Slovenj Gradec
00050000-55c3-0cd1-4604-7aa197404853	2310	Slovenska Bistrica
00050000-55c3-0cd1-b1da-c718a88794b0	3210	Slovenske Konjice
00050000-55c3-0cd1-4878-b90812d1f2ef	1216	Smlednik
00050000-55c3-0cd1-3bd3-b29eca45446e	5232	Soča
00050000-55c3-0cd1-9701-576bb4d56deb	1317	Sodražica
00050000-55c3-0cd1-4bb7-40ad1932111e	3335	Solčava
00050000-55c3-0cd1-1eb7-d62c06b4337d	5250	Solkan
00050000-55c3-0cd1-5f2c-e550e80b787d	4229	Sorica
00050000-55c3-0cd1-24a6-8dc23dbed39a	4225	Sovodenj
00050000-55c3-0cd1-f5bd-bf4b72906c60	5281	Spodnja Idrija
00050000-55c3-0cd1-51b6-ff8e22c3d439	2241	Spodnji Duplek
00050000-55c3-0cd1-e9f5-68b66ec02e5d	9245	Spodnji Ivanjci
00050000-55c3-0cd1-cdad-90b1cd52bbf2	2277	Središče ob Dravi
00050000-55c3-0cd1-1261-bab2187ad3ce	4267	Srednja vas v Bohinju
00050000-55c3-0cd1-2ce8-79978ebda689	8256	Sromlje 
00050000-55c3-0cd1-429e-c0cd53f3c1a6	5224	Srpenica
00050000-55c3-0cd1-829d-dfdd8d55447e	1242	Stahovica
00050000-55c3-0cd1-dc6f-6e50c294746e	1332	Stara Cerkev
00050000-55c3-0cd1-d35d-f584fe048d0f	8342	Stari trg ob Kolpi
00050000-55c3-0cd1-b2b8-57f9c09cc249	1386	Stari trg pri Ložu
00050000-55c3-0cd1-e731-734d69c7604c	2205	Starše
00050000-55c3-0cd1-e96e-edd0cd220c86	2289	Stoperce
00050000-55c3-0cd1-4d3c-d36572c979d8	8322	Stopiče
00050000-55c3-0cd1-4944-e88cff017f35	3206	Stranice
00050000-55c3-0cd1-2ba1-4ba07df8809b	8351	Straža
00050000-55c3-0cd1-5afb-336b6cfdd5b2	1313	Struge
00050000-55c3-0cd1-79f0-95fe6db3b153	8293	Studenec
00050000-55c3-0cd1-3883-d42bd83886e8	8331	Suhor
00050000-55c3-0cd1-5a5b-5a085f54b143	2233	Sv. Ana v Slovenskih goricah
00050000-55c3-0cd1-8934-70a26c08384e	2235	Sv. Trojica v Slovenskih goricah
00050000-55c3-0cd1-d831-b1fd22668920	2353	Sveti Duh na Ostrem Vrhu
00050000-55c3-0cd1-c351-aa8031d6f6d2	9244	Sveti Jurij ob Ščavnici
00050000-55c3-0cd1-6006-0ecceba71f99	3264	Sveti Štefan
00050000-55c3-0cd1-482b-c3f45d1b9a21	2258	Sveti Tomaž
00050000-55c3-0cd1-b895-3369f9f4c04d	9204	Šalovci
00050000-55c3-0cd1-0a0e-2d6e9e5d5c53	5261	Šempas
00050000-55c3-0cd1-36e4-94154837ea08	5290	Šempeter pri Gorici
00050000-55c3-0cd1-937d-d6f7d5eb4624	3311	Šempeter v Savinjski dolini
00050000-55c3-0cd1-7886-bde3e444e251	4208	Šenčur
00050000-55c3-0cd1-940d-d0dddcf345a8	2212	Šentilj v Slovenskih goricah
00050000-55c3-0cd1-b71b-59f9e47daf92	8297	Šentjanž
00050000-55c3-0cd1-d9af-aace6e8af2e9	2373	Šentjanž pri Dravogradu
00050000-55c3-0cd1-f9d5-c5474bbf9757	8310	Šentjernej
00050000-55c3-0cd1-8e0f-e59700ed858a	3230	Šentjur
00050000-55c3-0cd1-a3ff-f5f2b828690c	3271	Šentrupert
00050000-55c3-0cd1-0e67-64a5cc24a3e3	8232	Šentrupert
00050000-55c3-0cd1-1a3d-d049c7748833	1296	Šentvid pri Stični
00050000-55c3-0cd1-a265-55610a008fb9	8275	Škocjan
00050000-55c3-0cd1-90e7-3e63f97c881c	6281	Škofije
00050000-55c3-0cd1-2bc3-534cc33d84f4	4220	Škofja Loka
00050000-55c3-0cd1-3711-c9258136c2f1	3211	Škofja vas
00050000-55c3-0cd1-8c79-ff67544ed0e4	1291	Škofljica
00050000-55c3-0cd1-656b-397990f4a4ae	6274	Šmarje
00050000-55c3-0cd1-c21e-26b74e3f0092	1293	Šmarje - Sap
00050000-55c3-0cd1-3bb9-986670420295	3240	Šmarje pri Jelšah
00050000-55c3-0cd1-4f1b-9a1db2f13b1f	8220	Šmarješke Toplice
00050000-55c3-0cd1-bd07-88ce9cdbd222	2315	Šmartno na Pohorju
00050000-55c3-0cd1-0fb4-7550e89ebd6f	3341	Šmartno ob Dreti
00050000-55c3-0cd1-4827-74396d571fe5	3327	Šmartno ob Paki
00050000-55c3-0cd1-3c1d-510bdfcf726f	1275	Šmartno pri Litiji
00050000-55c3-0cd1-759b-781de9cdc959	2383	Šmartno pri Slovenj Gradcu
00050000-55c3-0cd1-7fcd-14281be19ad7	3201	Šmartno v Rožni dolini
00050000-55c3-0cd1-4160-6135a356fa81	3325	Šoštanj
00050000-55c3-0cd1-c280-4e5820e89d13	6222	Štanjel
00050000-55c3-0cd1-6b55-925665111a3d	3220	Štore
00050000-55c3-0cd1-aeb2-33408af5828b	3304	Tabor
00050000-55c3-0cd1-011c-2c489cb47e6e	3221	Teharje
00050000-55c3-0cd1-4661-26866e966054	9251	Tišina
00050000-55c3-0cd1-db54-6f57f129a370	5220	Tolmin
00050000-55c3-0cd1-15af-d867bae8b769	3326	Topolšica
00050000-55c3-0cd1-4db2-fa3963b2db82	2371	Trbonje
00050000-55c3-0cd1-4503-1119a337aba7	1420	Trbovlje
00050000-55c3-0cd1-f3b1-e6f45db82c2d	8231	Trebelno 
00050000-55c3-0cd1-0e97-5f2b2f3b231d	8210	Trebnje
00050000-55c3-0cd1-fd74-22347e1bb525	5252	Trnovo pri Gorici
00050000-55c3-0cd1-2b67-65854b25da7d	2254	Trnovska vas
00050000-55c3-0cd1-eb69-b1760f329301	1222	Trojane
00050000-55c3-0cd1-6801-b8528fd78cc3	1236	Trzin
00050000-55c3-0cd1-29d8-6f25c8230c70	4290	Tržič
00050000-55c3-0cd1-bb2f-a7cd803269c6	8295	Tržišče
00050000-55c3-0cd1-8b67-80888b6f4723	1311	Turjak
00050000-55c3-0cd1-ee72-6e21d9df385f	9224	Turnišče
00050000-55c3-0cd1-32d7-4b76a70e3a5d	8323	Uršna sela
00050000-55c3-0cd1-6c03-04b234c1a6f9	1252	Vače
00050000-55c3-0cd1-e15b-dc28a68b5436	3320	Velenje 
00050000-55c3-0cd1-76d1-18bb7682717d	3322	Velenje - poštni predali
00050000-55c3-0cd1-60c2-c6606019bb35	8212	Velika Loka
00050000-55c3-0cd1-7edc-ca39ad96651b	2274	Velika Nedelja
00050000-55c3-0cd1-af7d-430bd57011b8	9225	Velika Polana
00050000-55c3-0cd1-4c49-ae5fca51fcd0	1315	Velike Lašče
00050000-55c3-0cd1-10ac-0e1f19b3bf8b	8213	Veliki Gaber
00050000-55c3-0cd1-2569-0cb1c2acb274	9241	Veržej
00050000-55c3-0cd1-3bd5-f77ddb3ccdf3	1312	Videm - Dobrepolje
00050000-55c3-0cd1-59af-c61f029649b5	2284	Videm pri Ptuju
00050000-55c3-0cd1-ea43-5c7c69e8363f	8344	Vinica
00050000-55c3-0cd1-688b-c7c6f703dab9	5271	Vipava
00050000-55c3-0cd1-f5b3-62d0a90b3125	4212	Visoko
00050000-55c3-0cd1-96ad-5dcc2a46e755	1294	Višnja Gora
00050000-55c3-0cd1-59b3-d1688a71d89e	3205	Vitanje
00050000-55c3-0cd1-454f-e4f648dbb5ee	2255	Vitomarci
00050000-55c3-0cd1-cae3-bce3a3ac6d4c	1217	Vodice
00050000-55c3-0cd1-d528-6270f0fb1954	3212	Vojnik\t
00050000-55c3-0cd1-0d3a-a0ae85ee8417	5293	Volčja Draga
00050000-55c3-0cd1-f78d-35a35d3c46b5	2232	Voličina
00050000-55c3-0cd1-3543-717d09d3ba5e	3305	Vransko
00050000-55c3-0cd1-9f3d-637181468572	6217	Vremski Britof
00050000-55c3-0cd1-e955-3cfde40a99e6	1360	Vrhnika
00050000-55c3-0cd1-a9a9-a58ccbf5cdf2	2365	Vuhred
00050000-55c3-0cd1-0ebc-899cc398399e	2367	Vuzenica
00050000-55c3-0cd1-bf38-9282b3360ec9	8292	Zabukovje 
00050000-55c3-0cd1-890d-0dfe364a7be5	1410	Zagorje ob Savi
00050000-55c3-0cd1-abbe-82427b92a718	1303	Zagradec
00050000-55c3-0cd1-06e0-db3a32b71913	2283	Zavrč
00050000-55c3-0cd1-1b9e-b88a91c0a11c	8272	Zdole 
00050000-55c3-0cd1-cb8b-037c25b887c8	4201	Zgornja Besnica
00050000-55c3-0cd1-ce3f-76394a9cfa31	2242	Zgornja Korena
00050000-55c3-0cd1-65c0-6b2ea8a31ec9	2201	Zgornja Kungota
00050000-55c3-0cd1-17dd-2eea51c8f86a	2316	Zgornja Ložnica
00050000-55c3-0cd1-3d6a-9ed003af2a9b	2314	Zgornja Polskava
00050000-55c3-0cd1-e2da-ce3ba117f2a2	2213	Zgornja Velka
00050000-55c3-0cd1-b272-fd99382c7092	4247	Zgornje Gorje
00050000-55c3-0cd1-1b7d-fd619b53df6b	4206	Zgornje Jezersko
00050000-55c3-0cd1-152f-23b1ca64a906	2285	Zgornji Leskovec
00050000-55c3-0cd1-8538-9cffaac068ec	1432	Zidani Most
00050000-55c3-0cd1-b060-bbfc8c225c13	3214	Zreče
00050000-55c3-0cd1-24aa-f280b62c02e6	4209	Žabnica
00050000-55c3-0cd1-2e79-6004caf8dcea	3310	Žalec
00050000-55c3-0cd1-9861-6cd9e9b2321b	4228	Železniki
00050000-55c3-0cd1-bfba-c317f5e5c966	2287	Žetale
00050000-55c3-0cd1-83a0-c40ebaa14957	4226	Žiri
00050000-55c3-0cd1-376a-1e672834fd39	4274	Žirovnica
00050000-55c3-0cd1-6140-63609b70b56e	8360	Žužemberk
\.


--
-- TOC entry 3021 (class 0 OID 12102913)
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
-- TOC entry 3003 (class 0 OID 12102720)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 12102798)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 12102925)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 12103256)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 12103266)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c3-0cd2-cb4e-23ddb30f4244	00080000-55c3-0cd2-44fd-f8f1660e65c6	0900	AK
00190000-55c3-0cd2-d9eb-7dd04fb502b5	00080000-55c3-0cd2-e7d8-2759e1a1e29c	0987	AK
00190000-55c3-0cd2-9dda-1235816f2700	00080000-55c3-0cd2-407f-f29c89b93ca6	0989	AK
00190000-55c3-0cd2-2899-8bc76a068fb8	00080000-55c3-0cd2-c393-3449b24758bd	0986	AK
00190000-55c3-0cd2-600f-59646c1dac8f	00080000-55c3-0cd2-286a-eb79a2234e8e	0984	AK
00190000-55c3-0cd2-1377-75e7b0c38796	00080000-55c3-0cd2-51d0-7138af45b3fe	0983	AK
00190000-55c3-0cd2-3c89-8742c3e6578a	00080000-55c3-0cd2-84d1-0bc7579c42fb	0982	AK
\.


--
-- TOC entry 3045 (class 0 OID 12103212)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c3-0cd2-aa56-f4f6cedf145e	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3048 (class 0 OID 12103274)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 12102954)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c3-0cd2-916d-1526cc8d5411	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c3-0cd2-0579-fffc1c8fc496	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c3-0cd2-57b3-ba6c9df91f33	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c3-0cd2-fd18-ee393a29b56d	0004	Mali oder	t	24	Mali oder 
00220000-55c3-0cd2-d3bb-cb773b682997	0005	Komorni oder	t	15	Komorni oder
00220000-55c3-0cd2-28c1-a382a97d73eb	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c3-0cd2-2ba1-ce76c44027b4	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3019 (class 0 OID 12102898)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 12102888)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 12103073)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 12103022)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 12102592)
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
-- TOC entry 3028 (class 0 OID 12102964)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 12102630)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c3-0cd0-105b-12c864c9b924	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c3-0cd0-d3b4-d709a2436682	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c3-0cd0-8607-3f86cdd4600e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c3-0cd0-f57d-8b13a423ba77	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c3-0cd0-ac86-0314642a640c	planer	Planer dogodkov v koledarju	t
00020000-55c3-0cd0-0f7e-09ff1a83e1f6	kadrovska	Kadrovska služba	t
00020000-55c3-0cd0-a6a3-54829a002120	arhivar	Ažuriranje arhivalij	t
00020000-55c3-0cd0-761d-34be587468e4	igralec	Igralec	t
00020000-55c3-0cd0-5612-916beda3196e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c3-0cd2-0ee9-085d6b78abb2	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2994 (class 0 OID 12102614)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c3-0cd0-59be-c91d8e8c7480	00020000-55c3-0cd0-8607-3f86cdd4600e
00010000-55c3-0cd0-daad-f439e94d8478	00020000-55c3-0cd0-8607-3f86cdd4600e
00010000-55c3-0cd2-1342-7ff1c8e27707	00020000-55c3-0cd2-0ee9-085d6b78abb2
\.


--
-- TOC entry 3030 (class 0 OID 12102978)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 12102919)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 12102865)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 12103315)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c3-0cd1-4ffa-ef25d94911f6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c3-0cd1-d386-596bb66ee1e1	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c3-0cd1-a283-433e30f75638	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c3-0cd1-3188-7503a6d5d441	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c3-0cd1-b150-5bef3e22be73	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3052 (class 0 OID 12103307)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c3-0cd1-fb00-355306738dfb	00230000-55c3-0cd1-3188-7503a6d5d441	popa
00240000-55c3-0cd1-1e1f-43458da1bb66	00230000-55c3-0cd1-3188-7503a6d5d441	oseba
00240000-55c3-0cd1-d63f-bdfc9647c43c	00230000-55c3-0cd1-3188-7503a6d5d441	sezona
00240000-55c3-0cd1-82d0-cc61ef1066cc	00230000-55c3-0cd1-d386-596bb66ee1e1	prostor
00240000-55c3-0cd1-06e3-31a4e3e5fa72	00230000-55c3-0cd1-3188-7503a6d5d441	besedilo
00240000-55c3-0cd1-16fb-139fb311c017	00230000-55c3-0cd1-3188-7503a6d5d441	uprizoritev
00240000-55c3-0cd1-9bbd-e3817b10a20e	00230000-55c3-0cd1-3188-7503a6d5d441	funkcija
00240000-55c3-0cd1-650c-f572af57d6a3	00230000-55c3-0cd1-3188-7503a6d5d441	tipfunkcije
00240000-55c3-0cd1-48fd-f3bf010b1476	00230000-55c3-0cd1-3188-7503a6d5d441	alternacija
00240000-55c3-0cd1-7e7c-f838c13a413c	00230000-55c3-0cd1-4ffa-ef25d94911f6	pogodba
00240000-55c3-0cd1-0292-ad997e0d0345	00230000-55c3-0cd1-3188-7503a6d5d441	zaposlitev
00240000-55c3-0cd1-24ee-5e32c74e8676	00230000-55c3-0cd1-4ffa-ef25d94911f6	programdela
00240000-55c3-0cd1-9b6c-039e4924c9a7	00230000-55c3-0cd1-3188-7503a6d5d441	zapis
\.


--
-- TOC entry 3051 (class 0 OID 12103302)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 12103032)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c3-0cd2-ce34-d72de7687a64	000e0000-55c3-0cd2-6f46-8188764639b8	00080000-55c3-0cd2-2b48-ccd59d76ed17	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c3-0cd2-ce5f-f36b0c4b9792	000e0000-55c3-0cd2-6f46-8188764639b8	00080000-55c3-0cd2-2b48-ccd59d76ed17	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c3-0cd2-1177-5470417cb5f3	000e0000-55c3-0cd2-6f46-8188764639b8	00080000-55c3-0cd2-bb19-12ed0fb9df3c	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c3-0cd2-9cd9-efda22e2a0af	000e0000-55c3-0cd2-6f46-8188764639b8	00080000-55c3-0cd2-bb19-12ed0fb9df3c	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3001 (class 0 OID 12102692)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 12102875)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c3-0cd2-91bb-d4598ec54627	00180000-55c3-0cd2-2546-6d152d3d7cef	000c0000-55c3-0cd2-ec6c-b8d08815ea7e	00090000-55c3-0cd2-f25b-8b428815de2c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-0cd2-5372-cbea92747e82	00180000-55c3-0cd2-2546-6d152d3d7cef	000c0000-55c3-0cd2-075f-02afddd7c014	00090000-55c3-0cd2-76ed-bf3d3320a9b3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-0cd2-67f1-60267af33133	00180000-55c3-0cd2-2546-6d152d3d7cef	000c0000-55c3-0cd2-14dd-a02187cd8f69	00090000-55c3-0cd2-74af-5a29a3903754	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-0cd2-40c7-e3240ac99bc2	00180000-55c3-0cd2-2546-6d152d3d7cef	000c0000-55c3-0cd2-36bb-b5cbd710785e	00090000-55c3-0cd2-302a-69ed68f592c8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-0cd2-5cde-bc648efe7a5f	00180000-55c3-0cd2-2546-6d152d3d7cef	000c0000-55c3-0cd2-9ef2-1c5bd54c42db	00090000-55c3-0cd2-3617-1dfd65b4aa07	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-0cd2-8c32-dadbe8a717bb	00180000-55c3-0cd2-fcbb-b03bef3bbcc3	\N	00090000-55c3-0cd2-3617-1dfd65b4aa07	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3037 (class 0 OID 12103062)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c3-0cd1-4277-6377a9cf298f	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c3-0cd1-dd83-59d30aa4b1f3	Priredba	Priredba	Priredba	umetnik
000f0000-55c3-0cd1-8d4f-033d9e576f3f	Prevod	Prevod	Prevod	umetnik
000f0000-55c3-0cd1-c885-63f28a4137fc	Režija	Režija	Režija	umetnik
000f0000-55c3-0cd1-9b38-2f5ea3156ef0	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c3-0cd1-db9f-dbc8500ec896	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c3-0cd1-8f5c-1906a22c249b	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c3-0cd1-1466-7b7a27db0390	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c3-0cd1-e909-e01d60256f19	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c3-0cd1-189d-a727e72497fd	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c3-0cd1-10aa-26a830d6d279	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c3-0cd1-be80-a4dafb8a82b1	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c3-0cd1-23fc-c8d90ba5f8e7	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c3-0cd1-f43f-9f79ebd15238	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c3-0cd1-3dbb-48b521939def	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c3-0cd1-575e-2bad5089d4fb	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c3-0cd1-d4cf-6d3078a8bc71	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c3-0cd1-10d2-f5771024cfe0	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3049 (class 0 OID 12103284)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c3-0cd1-4512-14acaa3d8fce	01	Velika predstava	f	1.00	1.00
002b0000-55c3-0cd1-90cc-95854a99ceb5	02	Mala predstava	f	0.50	0.50
002b0000-55c3-0cd1-36b6-3e53ed8a63c0	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c3-0cd1-532b-89498b8fa9cf	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c3-0cd1-edab-dc6c76642ccc	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3006 (class 0 OID 12102755)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 12102601)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c3-0cd0-daad-f439e94d8478	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROEkhKe1vnHu8GTEJnNdwbW3Ul8jzx/B2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c3-0cd2-5b9a-86168a8ecff5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c3-0cd2-8ebc-1cd108d35fda	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c3-0cd2-c027-35b062d7ac27	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c3-0cd2-4fb6-965def39ed21	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c3-0cd2-9f72-4dc895d3f9fc	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c3-0cd2-d662-825faeddabcb	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c3-0cd2-784c-2a44eeaef32b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c3-0cd2-3dcc-fcd1761c2bbc	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c3-0cd2-3b9a-3469119469a5	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c3-0cd2-1342-7ff1c8e27707	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c3-0cd0-59be-c91d8e8c7480	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 12103110)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c3-0cd2-6408-3ee8089187f8	00160000-55c3-0cd2-969b-fc82b778bfa7	00150000-55c3-0cd1-c6f9-d77bd8415a54	00140000-55c3-0cd0-0741-73a5f0880294	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c3-0cd2-d3bb-cb773b682997
000e0000-55c3-0cd2-6f46-8188764639b8	00160000-55c3-0cd2-6a6f-9d760b36767d	00150000-55c3-0cd1-8837-c46c0b94d63b	00140000-55c3-0cd0-e0f1-87e55eda9ec7	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c3-0cd2-28c1-a382a97d73eb
000e0000-55c3-0cd2-7cb6-32dc392b149a	\N	00150000-55c3-0cd1-8837-c46c0b94d63b	00140000-55c3-0cd0-e0f1-87e55eda9ec7	00190000-55c3-0cd2-d9eb-7dd04fb502b5	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c3-0cd2-d3bb-cb773b682997
000e0000-55c3-0cd2-92dc-ffd7496d03cc	\N	00150000-55c3-0cd1-8837-c46c0b94d63b	00140000-55c3-0cd0-e0f1-87e55eda9ec7	00190000-55c3-0cd2-d9eb-7dd04fb502b5	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c3-0cd2-d3bb-cb773b682997
000e0000-55c3-0cd2-411e-b8a8f16ac17d	\N	00150000-55c3-0cd1-8837-c46c0b94d63b	00140000-55c3-0cd0-e0f1-87e55eda9ec7	00190000-55c3-0cd2-d9eb-7dd04fb502b5	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c3-0cd2-916d-1526cc8d5411
\.


--
-- TOC entry 3011 (class 0 OID 12102817)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c3-0cd2-6548-7e114571f698	000e0000-55c3-0cd2-6f46-8188764639b8	1	
00200000-55c3-0cd2-8ee0-e3bcd836d1ba	000e0000-55c3-0cd2-6f46-8188764639b8	2	
\.


--
-- TOC entry 3026 (class 0 OID 12102946)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 12103354)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 12103326)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 12103366)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 12103015)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c3-0cd2-490e-3b0974146f9c	00090000-55c3-0cd2-76ed-bf3d3320a9b3	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-0cd2-ddc1-cc6f312ed457	00090000-55c3-0cd2-74af-5a29a3903754	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-0cd2-c4ab-ae63264d5aa1	00090000-55c3-0cd2-bde0-46c8019f116c	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-0cd2-8f86-482853a4414b	00090000-55c3-0cd2-6594-8b710f6e5e9f	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-0cd2-22af-13b2c0595751	00090000-55c3-0cd2-f25b-8b428815de2c	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-0cd2-4f4b-bc1b5ffb9e73	00090000-55c3-0cd2-c1b5-f0c2de0ce61a	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3013 (class 0 OID 12102849)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 12103100)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c3-0cd0-0741-73a5f0880294	01	Drama	drama (SURS 01)
00140000-55c3-0cd0-ae52-88547755e024	02	Opera	opera (SURS 02)
00140000-55c3-0cd0-e4af-c63ad2e183fa	03	Balet	balet (SURS 03)
00140000-55c3-0cd0-c2e7-1dad9cdcc712	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c3-0cd0-3a43-d8fdb1cdeb85	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c3-0cd0-e0f1-87e55eda9ec7	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c3-0cd0-9010-d7c71732bb6e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3032 (class 0 OID 12103005)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c3-0cd1-e4e1-af1362ecf218	01	Opera	opera
00150000-55c3-0cd1-7212-1cfc1b5f5b3b	02	Opereta	opereta
00150000-55c3-0cd1-c427-9802eb897e38	03	Balet	balet
00150000-55c3-0cd1-8737-8b6719a9a662	04	Plesne prireditve	plesne prireditve
00150000-55c3-0cd1-3bf6-e5fac6c512d9	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c3-0cd1-c928-9cf096e54fdf	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c3-0cd1-edb7-ec88ee28036e	07	Biografska drama	biografska drama
00150000-55c3-0cd1-c6f9-d77bd8415a54	08	Komedija	komedija
00150000-55c3-0cd1-59ac-ad3d56a0eae3	09	Črna komedija	črna komedija
00150000-55c3-0cd1-a784-fe3cb7b216e9	10	E-igra	E-igra
00150000-55c3-0cd1-8837-c46c0b94d63b	11	Kriminalka	kriminalka
00150000-55c3-0cd1-baaf-75dc8279aa54	12	Musical	musical
\.


--
-- TOC entry 2537 (class 2606 OID 12102655)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 12103157)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 12103147)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 12103061)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 12103407)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 12102839)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 12102864)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 12103300)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 12102781)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 12103206)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 12103001)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 12102815)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 12102858)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 12102795)
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
-- TOC entry 2630 (class 2606 OID 12102911)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 12103383)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 12103390)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2778 (class 2606 OID 12103415)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 12102938)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 12102753)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 12102664)
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
-- TOC entry 2544 (class 2606 OID 12102688)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 12102644)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2528 (class 2606 OID 12102629)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 12102944)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 12102977)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 12103095)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 12102717)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 12102741)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 12102917)
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
-- TOC entry 2559 (class 2606 OID 12102731)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 12102802)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 12102929)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 12103263)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 12103271)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 12103254)
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
-- TOC entry 2736 (class 2606 OID 12103282)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 12102961)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 12102902)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 12102893)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 12103083)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 12103029)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 12102600)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 12102968)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 12102618)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2530 (class 2606 OID 12102638)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 12102986)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 12102924)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 12102873)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 12103324)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 12103312)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 12103306)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 12103042)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 12102697)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 12102884)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 12103072)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 12103294)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 12102766)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 12102613)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 12103126)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 12102824)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 12102952)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 12103364)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 12103348)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 12103372)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 12103020)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 12102853)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 12103108)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 12103013)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 1259 OID 12102846)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2678 (class 1259 OID 12103043)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 12103044)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2764 (class 1259 OID 12103385)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2765 (class 1259 OID 12103384)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 12102719)
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
-- TOC entry 2643 (class 1259 OID 12102945)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 12103352)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2752 (class 1259 OID 12103351)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 12103353)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2754 (class 1259 OID 12103350)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2755 (class 1259 OID 12103349)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2637 (class 1259 OID 12102931)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 12102930)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2588 (class 1259 OID 12102825)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 12103002)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 12103004)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 12103003)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 12102797)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 12102796)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 12103283)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2688 (class 1259 OID 12103097)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 12103098)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2690 (class 1259 OID 12103099)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2761 (class 1259 OID 12103373)
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
-- TOC entry 2697 (class 1259 OID 12103131)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2698 (class 1259 OID 12103128)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2699 (class 1259 OID 12103132)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2700 (class 1259 OID 12103130)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2701 (class 1259 OID 12103129)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 12102768)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 12102767)
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
-- TOC entry 2542 (class 1259 OID 12102691)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 12102969)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 12102859)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2532 (class 1259 OID 12102645)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2533 (class 1259 OID 12102646)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 12102989)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 12102988)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 12102987)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 12102803)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 12102805)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2582 (class 1259 OID 12102804)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2744 (class 1259 OID 12103314)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2617 (class 1259 OID 12102897)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2618 (class 1259 OID 12102895)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2619 (class 1259 OID 12102894)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2620 (class 1259 OID 12102896)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 12102619)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2524 (class 1259 OID 12102620)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2646 (class 1259 OID 12102953)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2774 (class 1259 OID 12103408)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2775 (class 1259 OID 12103416)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2776 (class 1259 OID 12103417)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2632 (class 1259 OID 12102918)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 12103030)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 12103031)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 12103211)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2719 (class 1259 OID 12103210)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2720 (class 1259 OID 12103207)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2721 (class 1259 OID 12103208)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2722 (class 1259 OID 12103209)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 12102733)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 12102732)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 12102734)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2516 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2726 (class 1259 OID 12103264)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 12103265)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2711 (class 1259 OID 12103161)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 12103162)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2713 (class 1259 OID 12103159)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2714 (class 1259 OID 12103160)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 12103021)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 12102906)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2624 (class 1259 OID 12102905)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2625 (class 1259 OID 12102903)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2626 (class 1259 OID 12102904)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2707 (class 1259 OID 12103149)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 12103148)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2723 (class 1259 OID 12103255)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2587 (class 1259 OID 12102816)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2741 (class 1259 OID 12103301)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2768 (class 1259 OID 12103391)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2769 (class 1259 OID 12103392)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 12102666)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 12102665)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 12102698)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 12102699)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 12102887)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 12102886)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2614 (class 1259 OID 12102885)
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
-- TOC entry 2594 (class 1259 OID 12102848)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2595 (class 1259 OID 12102844)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2596 (class 1259 OID 12102841)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2597 (class 1259 OID 12102842)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2598 (class 1259 OID 12102840)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2599 (class 1259 OID 12102845)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2600 (class 1259 OID 12102843)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 12102718)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 12102782)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 12102784)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 12102783)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 12102785)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2631 (class 1259 OID 12102912)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 12103096)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 12103127)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 12102689)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 12102690)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 12103014)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 12103325)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 12102754)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2747 (class 1259 OID 12103313)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2651 (class 1259 OID 12102963)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 12102962)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2715 (class 1259 OID 12103158)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2562 (class 1259 OID 12102742)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 12103109)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2758 (class 1259 OID 12103365)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 12103272)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 12103273)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 12102874)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 12102639)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2601 (class 1259 OID 12102847)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2804 (class 2606 OID 12103553)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2807 (class 2606 OID 12103538)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2806 (class 2606 OID 12103543)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2802 (class 2606 OID 12103563)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2808 (class 2606 OID 12103533)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2803 (class 2606 OID 12103558)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2805 (class 2606 OID 12103548)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2838 (class 2606 OID 12103708)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 12103713)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 12103883)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2872 (class 2606 OID 12103878)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 12103468)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2825 (class 2606 OID 12103648)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2866 (class 2606 OID 12103863)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 12103858)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2865 (class 2606 OID 12103868)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 12103853)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2869 (class 2606 OID 12103848)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2823 (class 2606 OID 12103643)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2824 (class 2606 OID 12103638)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 12103528)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 12103678)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 12103688)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2832 (class 2606 OID 12103683)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2795 (class 2606 OID 12103503)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 12103498)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 12103628)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 12103833)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 12103718)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 12103723)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 12103728)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2870 (class 2606 OID 12103873)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2843 (class 2606 OID 12103748)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2846 (class 2606 OID 12103733)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2842 (class 2606 OID 12103753)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2844 (class 2606 OID 12103743)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2845 (class 2606 OID 12103738)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2793 (class 2606 OID 12103493)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 12103488)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 12103453)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2786 (class 2606 OID 12103448)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 12103658)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2809 (class 2606 OID 12103568)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2782 (class 2606 OID 12103428)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2781 (class 2606 OID 12103433)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 12103673)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2829 (class 2606 OID 12103668)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2830 (class 2606 OID 12103663)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2799 (class 2606 OID 12103508)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 12103518)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2798 (class 2606 OID 12103513)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2864 (class 2606 OID 12103843)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2813 (class 2606 OID 12103603)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2815 (class 2606 OID 12103593)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2816 (class 2606 OID 12103588)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2814 (class 2606 OID 12103598)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 12103418)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 12103423)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 12103653)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2875 (class 2606 OID 12103898)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 12103903)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2876 (class 2606 OID 12103908)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2822 (class 2606 OID 12103633)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2836 (class 2606 OID 12103698)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2835 (class 2606 OID 12103703)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 12103808)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 12103803)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 12103788)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 12103793)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2855 (class 2606 OID 12103798)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2791 (class 2606 OID 12103478)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 12103473)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 12103483)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 12103818)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2859 (class 2606 OID 12103823)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2850 (class 2606 OID 12103778)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 12103783)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2852 (class 2606 OID 12103768)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2851 (class 2606 OID 12103773)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2834 (class 2606 OID 12103693)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 12103623)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2818 (class 2606 OID 12103618)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2820 (class 2606 OID 12103608)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2819 (class 2606 OID 12103613)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2847 (class 2606 OID 12103763)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 12103758)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2858 (class 2606 OID 12103813)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2800 (class 2606 OID 12103523)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 12103828)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2863 (class 2606 OID 12103838)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2874 (class 2606 OID 12103888)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2873 (class 2606 OID 12103893)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2783 (class 2606 OID 12103443)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 12103438)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2788 (class 2606 OID 12103458)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 12103463)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 12103583)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 12103578)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2812 (class 2606 OID 12103573)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-06 09:29:23 CEST

--
-- PostgreSQL database dump complete
--

