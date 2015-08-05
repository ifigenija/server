--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-05 12:21:50 CEST

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
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 11918308)
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
-- TOC entry 228 (class 1259 OID 11918811)
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
-- TOC entry 227 (class 1259 OID 11918794)
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
-- TOC entry 221 (class 1259 OID 11918706)
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
-- TOC entry 244 (class 1259 OID 11919053)
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
-- TOC entry 197 (class 1259 OID 11918487)
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
-- TOC entry 200 (class 1259 OID 11918521)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11918955)
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
-- TOC entry 192 (class 1259 OID 11918430)
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
-- TOC entry 229 (class 1259 OID 11918824)
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
-- TOC entry 216 (class 1259 OID 11918651)
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
-- TOC entry 195 (class 1259 OID 11918467)
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
-- TOC entry 199 (class 1259 OID 11918515)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11918447)
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
-- TOC entry 205 (class 1259 OID 11918568)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11919034)
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
-- TOC entry 243 (class 1259 OID 11919046)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11919069)
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
-- TOC entry 209 (class 1259 OID 11918593)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11918404)
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
-- TOC entry 184 (class 1259 OID 11918317)
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
-- TOC entry 185 (class 1259 OID 11918328)
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
-- TOC entry 180 (class 1259 OID 11918282)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11918301)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11918600)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11918631)
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
-- TOC entry 224 (class 1259 OID 11918745)
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
-- TOC entry 187 (class 1259 OID 11918361)
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
-- TOC entry 189 (class 1259 OID 11918396)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11918574)
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
-- TOC entry 188 (class 1259 OID 11918381)
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
-- TOC entry 194 (class 1259 OID 11918459)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11918586)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11918916)
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
-- TOC entry 232 (class 1259 OID 11918926)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11918872)
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
-- TOC entry 233 (class 1259 OID 11918934)
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
-- TOC entry 212 (class 1259 OID 11918615)
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
-- TOC entry 204 (class 1259 OID 11918559)
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
-- TOC entry 203 (class 1259 OID 11918549)
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
-- TOC entry 223 (class 1259 OID 11918734)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11918683)
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
-- TOC entry 177 (class 1259 OID 11918253)
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
-- TOC entry 176 (class 1259 OID 11918251)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 11918625)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11918291)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11918275)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11918639)
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
-- TOC entry 207 (class 1259 OID 11918580)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11918526)
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
-- TOC entry 238 (class 1259 OID 11918975)
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
-- TOC entry 237 (class 1259 OID 11918967)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11918962)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11918693)
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
-- TOC entry 186 (class 1259 OID 11918353)
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
-- TOC entry 202 (class 1259 OID 11918536)
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
-- TOC entry 222 (class 1259 OID 11918723)
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
-- TOC entry 234 (class 1259 OID 11918944)
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
-- TOC entry 191 (class 1259 OID 11918416)
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
-- TOC entry 178 (class 1259 OID 11918262)
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
-- TOC entry 226 (class 1259 OID 11918771)
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
-- TOC entry 196 (class 1259 OID 11918478)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11918607)
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
-- TOC entry 240 (class 1259 OID 11919014)
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
-- TOC entry 239 (class 1259 OID 11918986)
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
-- TOC entry 241 (class 1259 OID 11919026)
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
-- TOC entry 218 (class 1259 OID 11918676)
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
-- TOC entry 198 (class 1259 OID 11918510)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11918761)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11918666)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 11918256)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2997 (class 0 OID 11918308)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 11918811)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c1-e3bd-f76a-9d9508616ca3	000d0000-55c1-e3bd-3810-64e4bdbdd9cd	\N	00090000-55c1-e3bd-0aa9-ab424e01df8b	000b0000-55c1-e3bd-a5f3-1bbfc2527b6c	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c1-e3bd-bf95-44111c0d3202	000d0000-55c1-e3bd-c0ec-519d05075b52	00100000-55c1-e3bd-9a3d-1bfe5a44cee9	00090000-55c1-e3bd-dc18-9123e4449821	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c1-e3bd-4e72-df6c5909104a	000d0000-55c1-e3bd-4ec3-cba84fe362e9	00100000-55c1-e3bd-a906-974c62efcacd	00090000-55c1-e3bd-88e0-bc46594932d9	\N	0003	t	\N	2015-08-05	\N	2	\N	\N	f	f
000c0000-55c1-e3bd-da07-b79ee51eda28	000d0000-55c1-e3bd-3362-af34e93f97a9	\N	00090000-55c1-e3bd-af7d-ee58a091950c	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c1-e3bd-ba5b-e535807d4b5d	000d0000-55c1-e3bd-57bf-879f6d5e72ac	\N	00090000-55c1-e3bd-a9d1-6f48fadd6ba3	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c1-e3bd-db23-fd0fb0dd336f	000d0000-55c1-e3bd-81ad-01cef51eb187	\N	00090000-55c1-e3bd-767d-7deb52a8ec5a	000b0000-55c1-e3bd-caff-3eb8dfb725ec	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c1-e3bd-a2cb-170018a4a275	000d0000-55c1-e3bd-230d-434e7ab91d24	00100000-55c1-e3bd-b86c-ce4bedc9ac1a	00090000-55c1-e3bd-abf5-e6dfd964d130	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c1-e3bd-41fd-024999857952	000d0000-55c1-e3bd-c0fe-55325c3ddf67	\N	00090000-55c1-e3bd-20c1-b8f31c99a587	000b0000-55c1-e3bd-19bd-d634a8aad617	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c1-e3bd-3b7b-8fa5a9ef1546	000d0000-55c1-e3bd-230d-434e7ab91d24	00100000-55c1-e3bd-85d4-833472677ae0	00090000-55c1-e3bd-86c2-4f459b2ca249	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c1-e3bd-8152-15e75a839bdb	000d0000-55c1-e3bd-230d-434e7ab91d24	00100000-55c1-e3bd-47be-d9bde8690b76	00090000-55c1-e3bd-0f42-ef0afe61874a	\N	0010	t	\N	2015-08-05	\N	16	\N	\N	f	t
000c0000-55c1-e3bd-0462-34c2248d2afe	000d0000-55c1-e3bd-230d-434e7ab91d24	00100000-55c1-e3bd-9aee-2b75880534d4	00090000-55c1-e3bd-ff38-dbf9fe26d5e1	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3041 (class 0 OID 11918794)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 11918706)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c1-e3bd-56ed-b4d320d0a624	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c1-e3bd-8848-bbbd6d78d4e3	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c1-e3bd-a0ea-ae64196f7da0	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3058 (class 0 OID 11919053)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 11918487)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c1-e3bd-fc45-bce9268b2fb9	\N	\N	00200000-55c1-e3bd-650a-5de7cc9dd8c0	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c1-e3bd-ce70-064069ba382b	\N	\N	00200000-55c1-e3bd-f08e-a3a4ae4435a6	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c1-e3bd-7ae4-f7fa51f510bd	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c1-e3bd-ce2b-e9cd4c2ed38f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c1-e3bd-411b-eddb670fda8e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3014 (class 0 OID 11918521)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 11918955)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 11918430)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c1-e3bb-3f33-e1a9042b2ee0	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c1-e3bb-9642-3ac0a596a238	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c1-e3bb-e6c9-f34911d871b8	AL	ALB	008	Albania 	Albanija	\N
00040000-55c1-e3bb-999a-ed846578da55	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c1-e3bb-331b-17691aec94b6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c1-e3bb-b90c-d8fba1f9861f	AD	AND	020	Andorra 	Andora	\N
00040000-55c1-e3bb-f6ad-63985f932400	AO	AGO	024	Angola 	Angola	\N
00040000-55c1-e3bb-2119-d50c35076bb8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c1-e3bb-19b2-b129d548ea39	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c1-e3bb-8af3-104ad1da76ce	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c1-e3bb-8381-670ed67cc62e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c1-e3bb-acc6-cff4e141768c	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c1-e3bb-afd8-75fa97c58908	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c1-e3bb-9eaa-aad45d4c72b6	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c1-e3bb-dcfc-5af14457d7d6	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c1-e3bb-b251-f2999e9664bd	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c1-e3bb-836f-a26c823d7fa2	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c1-e3bb-943f-b27b98cff1ee	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c1-e3bb-47b6-ec6b70666d9a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c1-e3bb-5c9a-0af086c8117b	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c1-e3bb-c8b2-efc9ffbb6120	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c1-e3bb-0f70-750098a5dbad	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c1-e3bb-3fa3-823b844dbc2e	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c1-e3bb-74ca-ec210aafdb32	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c1-e3bb-2c16-47c2e8996d7e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c1-e3bb-78c7-3fe2ca7abb8f	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c1-e3bb-f2ae-14782735d4d3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c1-e3bb-c9cc-145d56244f6c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c1-e3bb-e67c-93709b22019c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c1-e3bb-9e96-6dd325def81a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c1-e3bb-910a-b58abf470e39	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c1-e3bb-e1cc-430a92b950f2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c1-e3bb-a2bd-fe98745ac576	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c1-e3bb-4af0-b7345066c7c6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c1-e3bb-2623-fc64fd4ad729	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c1-e3bb-0cf3-f01bc87ed4b1	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c1-e3bb-8b0c-b5f235c74ad0	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c1-e3bb-ebd6-c02fad11445e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c1-e3bb-67e5-db71f0e4abd8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c1-e3bb-c575-90e0f09af363	CA	CAN	124	Canada 	Kanada	\N
00040000-55c1-e3bb-c45b-0369a3048e6e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c1-e3bb-212a-d375f77c0b68	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c1-e3bb-47cb-5d35e9eafb19	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c1-e3bb-d245-7cce0ad49a0a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c1-e3bb-00c0-7c112bfeeb4b	CL	CHL	152	Chile 	Čile	\N
00040000-55c1-e3bb-3d48-491584223e31	CN	CHN	156	China 	Kitajska	\N
00040000-55c1-e3bb-d0f2-01a6404f87cd	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c1-e3bb-b3dc-49dcc92f2323	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c1-e3bb-e6e1-f9a8dd6af2df	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c1-e3bb-f4ff-331d07d3d828	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c1-e3bb-3922-b9ae3bd80dd6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c1-e3bb-65a7-aa1d36e23647	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c1-e3bb-0bb8-b0ca40679fba	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c1-e3bb-4dd8-0558cd26d76b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c1-e3bb-2af5-327d87a4f14f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c1-e3bb-0e5e-3f59104c5841	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c1-e3bb-710c-8c977d8064ce	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c1-e3bb-7133-a265121ca84e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c1-e3bb-2284-cdd9c3a8406e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c1-e3bb-7180-d8851bbccbfd	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c1-e3bb-f63f-2e78314ad5d6	DK	DNK	208	Denmark 	Danska	\N
00040000-55c1-e3bb-9fa1-f5fffba11bf9	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c1-e3bb-ee1c-72aae3113e45	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c1-e3bb-9f43-6ba9f9b880fa	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c1-e3bb-22f2-44e1980a6bbd	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c1-e3bb-31a6-d6d110ba2bda	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c1-e3bb-15bb-742d538ffaef	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c1-e3bb-14ff-907c0c489c1b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c1-e3bb-75e8-2776f9a38749	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c1-e3bb-7428-96ff1d527ee2	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c1-e3bb-8a19-2fb8817af88f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c1-e3bb-737d-43fa287192e0	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c1-e3bb-7298-528c68249770	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c1-e3bb-5357-7a6fe8f27b4b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c1-e3bb-6a78-7b8e9c621775	FI	FIN	246	Finland 	Finska	\N
00040000-55c1-e3bb-93fb-b9ace8be0eab	FR	FRA	250	France 	Francija	\N
00040000-55c1-e3bb-f7ea-b1a314c97fde	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c1-e3bb-fabc-3636a85f2480	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c1-e3bb-31b7-21fdab28ada5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c1-e3bb-e16b-b57b64a0edd6	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c1-e3bb-5776-fbe1a86161cf	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c1-e3bb-f26a-2e6b85a3a8a1	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c1-e3bb-c020-bb06a4ff532d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c1-e3bb-b1c6-58294f0ed1f0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c1-e3bb-5d03-d284b96dc045	GH	GHA	288	Ghana 	Gana	\N
00040000-55c1-e3bb-8eb1-1fe0a8f1f475	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c1-e3bb-6a17-f115fbdda7d0	GR	GRC	300	Greece 	Grčija	\N
00040000-55c1-e3bb-575c-f3800df3a143	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c1-e3bb-2024-e09216e74917	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c1-e3bb-ea55-887eb5274d85	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c1-e3bb-1f05-d8f26c0c2c55	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c1-e3bb-6017-73ade0fc69bc	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c1-e3bb-c12a-45b3c3547983	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c1-e3bb-8c52-e898615574db	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c1-e3bb-50e1-8f7f79390838	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c1-e3bb-0ee4-dc1a40b9ee59	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c1-e3bb-1333-7fa7a58ae419	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c1-e3bb-a6bb-8b1dc886b298	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c1-e3bb-c7f4-2e240520504d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c1-e3bb-6e9d-bdc74b2fd83e	HN	HND	340	Honduras 	Honduras	\N
00040000-55c1-e3bb-0785-9c02dd1277ba	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c1-e3bb-743e-a8ffb635755d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c1-e3bb-3f16-3b60452952c5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c1-e3bb-dc8f-52c24b684653	IN	IND	356	India 	Indija	\N
00040000-55c1-e3bb-2899-aca0f5c6f532	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c1-e3bb-1aad-641946a5a669	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c1-e3bb-a548-115be25bd4d3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c1-e3bb-e8be-33db8581ad29	IE	IRL	372	Ireland 	Irska	\N
00040000-55c1-e3bb-65d3-dc0adc1ecd74	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c1-e3bb-03db-70198893a3fc	IL	ISR	376	Israel 	Izrael	\N
00040000-55c1-e3bb-b5c1-7fb6968deac1	IT	ITA	380	Italy 	Italija	\N
00040000-55c1-e3bb-dd8a-c8b152187942	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c1-e3bb-345e-e403abf29cca	JP	JPN	392	Japan 	Japonska	\N
00040000-55c1-e3bb-9e30-137a131fd245	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c1-e3bb-152f-7c1a68c60e5c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c1-e3bb-a888-fe3cfb6e0912	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c1-e3bb-1e79-393810995bea	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c1-e3bb-9f04-502485070cb0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c1-e3bb-e565-7b518d0edb83	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c1-e3bb-21dc-df2c3ddbfaea	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c1-e3bb-f9a4-d6e029066aed	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c1-e3bb-8a99-8c7b02240632	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c1-e3bb-fb1b-bf30dcfd09cb	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c1-e3bb-481e-d427492ab2f6	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c1-e3bb-063b-d70db7432023	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c1-e3bb-cded-003e811fa870	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c1-e3bb-8276-2611ab2de3b3	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c1-e3bb-94bf-aa71f55276df	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c1-e3bb-bd70-e0ed0ee2a85d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c1-e3bb-9165-8fced9b72a8e	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c1-e3bb-4c6c-eae73ba09cca	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c1-e3bb-b79b-1cdbf0fc9ce2	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c1-e3bb-bdbb-9564fb3bb0ef	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c1-e3bb-0ecc-1c9535f49542	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c1-e3bb-c492-d2ca4948ce99	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c1-e3bb-f2a3-c929e6363e03	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c1-e3bb-6dbd-5fbc98bf5925	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c1-e3bb-8c1a-7f88b0bb77e1	ML	MLI	466	Mali 	Mali	\N
00040000-55c1-e3bb-282b-a64ad62934e2	MT	MLT	470	Malta 	Malta	\N
00040000-55c1-e3bb-4547-8a7efc09c6ea	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c1-e3bb-bd5d-fa2ad8cf3995	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c1-e3bb-8cd0-63df26986048	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c1-e3bb-6bdd-f6fc21309dfe	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c1-e3bb-dfd7-ce9f7be1e4c1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c1-e3bb-b34f-072a2be08dff	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c1-e3bb-4154-c2453efc259e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c1-e3bb-63cf-8e7e932f9e5b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c1-e3bb-9488-bd430ca1e1b1	MC	MCO	492	Monaco 	Monako	\N
00040000-55c1-e3bb-4322-5a432ed798d1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c1-e3bb-4b92-51d86efb93da	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c1-e3bb-75e4-4f5507edca14	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c1-e3bb-eaa1-d11376909bb2	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c1-e3bb-8372-70151d8a5052	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c1-e3bb-a9aa-8c2178c0601f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c1-e3bb-a482-eb14b080fbcb	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c1-e3bb-e802-26132537c0f4	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c1-e3bb-4b11-55985547f418	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c1-e3bb-32a3-b3c7348f37ce	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c1-e3bb-5941-ec57dd6f62ca	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c1-e3bb-29ad-1c2c0b97853c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c1-e3bb-d922-d6a467088fdf	NE	NER	562	Niger 	Niger 	\N
00040000-55c1-e3bb-3448-43ca27cf9df0	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c1-e3bb-1f9c-d6abf6813d39	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c1-e3bb-3954-52abcae77ecc	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c1-e3bb-1369-5b1d1d9280ff	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c1-e3bb-cf48-0c2cca64cdbe	NO	NOR	578	Norway 	Norveška	\N
00040000-55c1-e3bb-9a09-bddc6aa7a5c3	OM	OMN	512	Oman 	Oman	\N
00040000-55c1-e3bb-a41a-acc92ce03f3e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c1-e3bb-6038-8ff5ebc31159	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c1-e3bb-9b59-4dd502223a5c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c1-e3bb-ec7a-6e79a71b32f9	PA	PAN	591	Panama 	Panama	\N
00040000-55c1-e3bb-4772-9d9c3dacadfc	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c1-e3bb-d6c0-79bb2f6aee06	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c1-e3bb-6c72-2e1c5b449233	PE	PER	604	Peru 	Peru	\N
00040000-55c1-e3bb-0a54-02c0a0ac46ef	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c1-e3bb-8e1a-c06bcda4d57c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c1-e3bb-a031-778b6066b16a	PL	POL	616	Poland 	Poljska	\N
00040000-55c1-e3bb-3180-86efe27fbd84	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c1-e3bb-7fd0-fcd54bc939e4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c1-e3bb-ed41-28458c301dbe	QA	QAT	634	Qatar 	Katar	\N
00040000-55c1-e3bb-fe68-26b5f658b859	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c1-e3bb-1a0b-eed9d0f1d79d	RO	ROU	642	Romania 	Romunija	\N
00040000-55c1-e3bb-3b71-40bd6052a7fc	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c1-e3bb-1891-f7d8d8b4b302	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c1-e3bb-9a63-568dd06e0f58	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c1-e3bb-c894-2cd518697a40	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c1-e3bb-819a-500f6f641d0e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c1-e3bb-a8cd-f7375b265e23	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c1-e3bb-bfbf-4d364ea92bb3	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c1-e3bb-a8ad-feba5c2c7d0a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c1-e3bb-601e-3e6d2a3f5350	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c1-e3bb-c9d7-9bae1ecf25ed	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c1-e3bb-dc2f-054faea89585	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c1-e3bb-b563-e7bbb7f6a8a5	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c1-e3bb-75e1-4cc31ee3a085	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c1-e3bb-8af7-6c80a5ead3b5	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c1-e3bb-f6a3-a93312f15764	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c1-e3bb-f465-63905b3ba9ce	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c1-e3bb-fda4-97a3030c08f7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c1-e3bb-ee40-48c510ec8345	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c1-e3bb-c584-5e225ce7fb4e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c1-e3bb-9fb3-479f253a2150	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c1-e3bb-dea7-16ff53ddeb4f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c1-e3bb-d0c5-7583a081c1fc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c1-e3bb-f9b4-a7f092b11ce6	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c1-e3bb-cb6e-5691b0ffb19b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c1-e3bb-8608-e07bc448cd13	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c1-e3bb-f518-9a7844157f44	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c1-e3bb-0531-3d795f22144b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c1-e3bb-74e8-3ca901b11746	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c1-e3bb-8fc9-df8448fdd3e0	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c1-e3bb-3c7d-c5f3b8413cf8	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c1-e3bb-00db-efd886f89671	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c1-e3bb-811e-3d0a5994540a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c1-e3bb-221e-86dc029ef94d	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c1-e3bb-a266-95cbee3b79cc	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c1-e3bb-e4f3-ce6f31b8787c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c1-e3bb-41a9-49a6356b8190	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c1-e3bb-a5a0-bf5ef0906985	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c1-e3bb-cd6a-a34b8eb3d65a	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c1-e3bb-477d-e1744389dd56	TH	THA	764	Thailand 	Tajska	\N
00040000-55c1-e3bb-10f1-0ee1db05cc2a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c1-e3bb-e1a7-beb683eed82f	TG	TGO	768	Togo 	Togo	\N
00040000-55c1-e3bb-d57f-507a3f4c9a33	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c1-e3bb-bb92-231d2764003b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c1-e3bb-eacc-de1e81cf2228	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c1-e3bb-233b-b2a1a916fd51	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c1-e3bb-ae8e-5ee651120cf5	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c1-e3bb-c13c-b6449619e8b9	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c1-e3bb-54bb-e2e4794a2032	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c1-e3bb-65be-7a7497031dd1	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c1-e3bb-070c-e4b1dc985633	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c1-e3bb-3e69-55de90bd32c9	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c1-e3bb-174c-a740003423a7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c1-e3bb-628d-0a14e4f3514b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c1-e3bb-195d-e066bda4d075	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c1-e3bb-8b9a-e60299e89235	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c1-e3bb-646c-0af51a436f55	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c1-e3bb-d1dd-73b63e6a98e4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c1-e3bb-70d5-22110c7c61cc	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c1-e3bb-ce8e-67487287b12e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c1-e3bb-7869-6a17aa9092a6	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c1-e3bb-5041-45607bb0399a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c1-e3bb-8990-62a3c803f047	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c1-e3bb-cc62-c36d58c4cf5e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c1-e3bb-1fd5-05a9e24e3fba	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c1-e3bb-eddb-5007fb9aa293	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c1-e3bb-3adf-dc94b5d81c5c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c1-e3bb-1967-616a40059428	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3043 (class 0 OID 11918824)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55c1-e3bd-d033-eee3e16fdbf9	000e0000-55c1-e3bd-2f16-a8ee70e0fb9e	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c1-e3bc-b175-dc154833ea02	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c1-e3bd-fa57-24a5f6926ac9	000e0000-55c1-e3bd-c240-4a41b0e403c8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c1-e3bc-8469-984acc027ac3	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c1-e3bd-4487-9328236a6bc3	000e0000-55c1-e3bd-fc6b-44754427bf47	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c1-e3bc-b175-dc154833ea02	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c1-e3bd-5ecc-d1fd6f7b5692	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c1-e3bd-79e1-525267f608ca	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3030 (class 0 OID 11918651)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c1-e3bd-230d-434e7ab91d24	000e0000-55c1-e3bd-c240-4a41b0e403c8	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c1-e3bc-a57f-6ba8d1a0bfee
000d0000-55c1-e3bd-3810-64e4bdbdd9cd	000e0000-55c1-e3bd-c240-4a41b0e403c8	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c1-e3bc-a57f-6ba8d1a0bfee
000d0000-55c1-e3bd-c0ec-519d05075b52	000e0000-55c1-e3bd-c240-4a41b0e403c8	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c1-e3bc-d85a-3f5aacd1b387
000d0000-55c1-e3bd-4ec3-cba84fe362e9	000e0000-55c1-e3bd-c240-4a41b0e403c8	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c1-e3bc-18e7-93591ebd0d94
000d0000-55c1-e3bd-3362-af34e93f97a9	000e0000-55c1-e3bd-c240-4a41b0e403c8	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c1-e3bc-0bc2-64cb98be1b07
000d0000-55c1-e3bd-57bf-879f6d5e72ac	000e0000-55c1-e3bd-c240-4a41b0e403c8	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c1-e3bc-1717-f57684b553eb
000d0000-55c1-e3bd-81ad-01cef51eb187	000e0000-55c1-e3bd-c240-4a41b0e403c8	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c1-e3bc-a57f-6ba8d1a0bfee
000d0000-55c1-e3bd-c0fe-55325c3ddf67	000e0000-55c1-e3bd-c240-4a41b0e403c8	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c1-e3bc-aa4e-019ac0820de0
\.


--
-- TOC entry 3009 (class 0 OID 11918467)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 11918515)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11918447)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c1-e3bd-83e8-3de030b6aca8	00080000-55c1-e3bd-16b5-cfb15abce17d	00090000-55c1-e3bd-0f42-ef0afe61874a	AK		
\.


--
-- TOC entry 2984 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 11918568)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 11919034)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 11919046)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 11919069)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 11918593)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11918404)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c1-e3bb-f1e5-f348a1f6ebb5	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c1-e3bb-af70-476b7b226277	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c1-e3bb-87b4-4f0774301da7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c1-e3bb-7781-752725e9a98b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c1-e3bb-21ac-27a1b3f4078a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c1-e3bb-bfbf-92a4a83b9fb7	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c1-e3bb-22c2-a4b666e7c4e4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c1-e3bb-b405-7045b1adb552	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c1-e3bb-f418-2fa12ab431c7	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c1-e3bb-7426-c1643669f083	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c1-e3bb-c9d6-b5172df394ef	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c1-e3bb-b9cd-cadba775e99d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c1-e3bb-d318-3ebd2151130f	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c1-e3bb-83b2-2bddf44135e2	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c1-e3bd-5fc0-9b24f32b730e	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c1-e3bd-87e2-393543be345f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c1-e3bd-7858-587463310d66	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c1-e3bd-94e7-0b30beea44e5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c1-e3bd-ee11-fde00cd2cfe3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c1-e3bd-8c66-f0d633d12c19	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2998 (class 0 OID 11918317)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c1-e3bd-fcc6-a7c2e941937c	00000000-55c1-e3bd-87e2-393543be345f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c1-e3bd-b64c-28ccd7151ce4	00000000-55c1-e3bd-87e2-393543be345f	00010000-55c1-e3bb-3a69-9271329e34c4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c1-e3bd-67d6-a339de4b8624	00000000-55c1-e3bd-7858-587463310d66	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2999 (class 0 OID 11918328)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c1-e3bd-0aa9-ab424e01df8b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c1-e3bd-af7d-ee58a091950c	00010000-55c1-e3bd-57e2-385ba2562030	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c1-e3bd-88e0-bc46594932d9	00010000-55c1-e3bd-52f8-8c6d0b9d6500	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c1-e3bd-86c2-4f459b2ca249	00010000-55c1-e3bd-9212-f46e911b61db	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c1-e3bd-c87c-a1f023416352	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c1-e3bd-767d-7deb52a8ec5a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c1-e3bd-ff38-dbf9fe26d5e1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c1-e3bd-abf5-e6dfd964d130	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c1-e3bd-0f42-ef0afe61874a	00010000-55c1-e3bd-41cf-5f74baba7c42	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c1-e3bd-dc18-9123e4449821	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c1-e3bd-f9b2-16ab80364f17	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c1-e3bd-a9d1-6f48fadd6ba3	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c1-e3bd-20c1-b8f31c99a587	00010000-55c1-e3bd-afc4-a4366aea6c28	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2986 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 11918282)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c1-e3bb-a5fd-6a251278fa36	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c1-e3bb-a674-ede7cf3a7261	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c1-e3bb-0589-62a74e034ab8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c1-e3bb-7cdb-929416fa8fe0	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c1-e3bb-b26c-81aadadd1374	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c1-e3bb-bf6d-fa60a8723d1a	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c1-e3bb-6b0d-30a9316de94e	Abonma-read	Abonma - branje	f
00030000-55c1-e3bb-a0ef-4103ed0d9652	Abonma-write	Abonma - spreminjanje	f
00030000-55c1-e3bb-9029-2707329b7706	Alternacija-read	Alternacija - branje	f
00030000-55c1-e3bb-3de9-4c1ea8067aa0	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c1-e3bb-f6b0-9fcfe3b2c60b	Arhivalija-read	Arhivalija - branje	f
00030000-55c1-e3bb-5b71-c2335d616728	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c1-e3bb-8a9b-9d4b2872c1b2	Besedilo-read	Besedilo - branje	f
00030000-55c1-e3bb-4816-d1ff350a09f6	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c1-e3bb-4411-36b49307b397	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c1-e3bb-3887-a9d55dcf22c7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c1-e3bb-7b02-d9a05e4f5342	Dogodek-read	Dogodek - branje	f
00030000-55c1-e3bb-e22c-3e80ae279f40	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c1-e3bb-7de3-e10035cc9623	DrugiVir-read	DrugiVir - branje	f
00030000-55c1-e3bb-1634-f6fa22e2446b	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c1-e3bb-458b-b3efcf156475	Drzava-read	Drzava - branje	f
00030000-55c1-e3bb-7472-901df0793184	Drzava-write	Drzava - spreminjanje	f
00030000-55c1-e3bb-df0e-65283ddf65cc	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c1-e3bb-c512-1e339493bd64	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c1-e3bb-9eee-48ae34404240	Funkcija-read	Funkcija - branje	f
00030000-55c1-e3bb-d62b-34128a2dd13b	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c1-e3bb-a2e1-f2102bcaadf2	Gostovanje-read	Gostovanje - branje	f
00030000-55c1-e3bb-78c5-6c71c87fc345	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c1-e3bb-504d-9dd61a51e30e	Gostujoca-read	Gostujoca - branje	f
00030000-55c1-e3bb-a86f-e1f086b65ce2	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c1-e3bb-379b-ccb5fdaba6e9	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c1-e3bb-4307-7ad5fbdf951d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c1-e3bb-e2cd-61e3df8ac5b3	Kupec-read	Kupec - branje	f
00030000-55c1-e3bb-2978-86f24caa807b	Kupec-write	Kupec - spreminjanje	f
00030000-55c1-e3bb-029a-fe8ed0af0a18	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c1-e3bb-7ef9-e03d8e80e9a1	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c1-e3bb-d488-5eac0c9e9d22	Option-read	Option - branje	f
00030000-55c1-e3bb-352a-465758357300	Option-write	Option - spreminjanje	f
00030000-55c1-e3bb-7301-5fd5c51a6293	OptionValue-read	OptionValue - branje	f
00030000-55c1-e3bb-a842-a5978988f9df	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c1-e3bb-4de0-b9faf03ff0c3	Oseba-read	Oseba - branje	f
00030000-55c1-e3bb-665d-fb27a94e47df	Oseba-write	Oseba - spreminjanje	f
00030000-55c1-e3bb-a404-77d2b7cbf9b8	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c1-e3bb-3393-81ef4907df14	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c1-e3bb-1aea-b1352bc2a139	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c1-e3bb-ec93-8e72d4488ba3	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c1-e3bb-f6d9-dde17e7c3c30	Pogodba-read	Pogodba - branje	f
00030000-55c1-e3bb-2979-1874ce07bd29	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c1-e3bb-6ce3-07116186c9c3	Popa-read	Popa - branje	f
00030000-55c1-e3bb-a05a-7c3e6d480f4f	Popa-write	Popa - spreminjanje	f
00030000-55c1-e3bb-093a-a11899dd0dd2	Posta-read	Posta - branje	f
00030000-55c1-e3bb-ddf2-ba11aa940c2a	Posta-write	Posta - spreminjanje	f
00030000-55c1-e3bb-ee0f-b23e89c3a27a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c1-e3bb-f72f-ad786b0f96c7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c1-e3bb-c7f8-0851ef2481e1	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c1-e3bb-3673-1e0504281f31	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c1-e3bb-ed04-3cf3dcc162a2	Predstava-read	Predstava - branje	f
00030000-55c1-e3bb-05ff-f376ed26c926	Predstava-write	Predstava - spreminjanje	f
00030000-55c1-e3bb-3d34-84113f22e8e6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c1-e3bb-30a6-2891e1856818	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c1-e3bb-cd4d-c3b0c4155ae6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c1-e3bb-627a-0910cbf142b7	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c1-e3bb-bd3d-b7e9c935f375	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c1-e3bb-0e94-2a061ecbeff2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c1-e3bb-751d-f8406f2d399b	ProgramDela-read	ProgramDela - branje	f
00030000-55c1-e3bb-e43c-768a7fb189bb	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c1-e3bb-7ade-8e4e3eb966b9	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c1-e3bb-78c7-9a6183992a71	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c1-e3bb-8291-aec251befbf8	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c1-e3bb-0be7-595ebd5b69a2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c1-e3bb-8d9a-a5e111a0b541	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c1-e3bb-d460-7f007e082382	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c1-e3bb-080f-0bfa0212c2f1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c1-e3bb-d5f6-5766d3b3739d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c1-e3bb-3f10-af41eb342b91	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c1-e3bb-044f-92c90e98b78d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c1-e3bb-a6b1-473476398972	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c1-e3bb-d03c-484705ea8b1e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c1-e3bb-6c11-5f85069981ec	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c1-e3bb-1f09-a4a03ef3db4b	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c1-e3bb-87c2-bd1aa6973991	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c1-e3bb-e08f-8559e34e2c86	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c1-e3bb-4f7b-77d7a58cb7dc	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c1-e3bb-472b-5933b056d258	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c1-e3bb-d06e-3ecd75e970d6	Prostor-read	Prostor - branje	f
00030000-55c1-e3bb-a50c-ffcbf4cebcde	Prostor-write	Prostor - spreminjanje	f
00030000-55c1-e3bb-5bef-737f2fed9083	Racun-read	Racun - branje	f
00030000-55c1-e3bb-7d4d-060872ee5cd4	Racun-write	Racun - spreminjanje	f
00030000-55c1-e3bb-d5d1-9b84f4512982	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c1-e3bb-3ca8-bd4d1dea3407	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c1-e3bb-cc7f-522b030da54e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c1-e3bb-800c-3ed064755918	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c1-e3bb-7341-a2b4a3dd2946	Rekvizit-read	Rekvizit - branje	f
00030000-55c1-e3bb-128b-99b85891f221	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c1-e3bb-5c86-cfa5de155a88	Revizija-read	Revizija - branje	f
00030000-55c1-e3bb-c2d9-ad966a74c7cb	Revizija-write	Revizija - spreminjanje	f
00030000-55c1-e3bb-15ae-ae6d1bf7e3c7	Rezervacija-read	Rezervacija - branje	f
00030000-55c1-e3bb-8720-edb56223df43	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c1-e3bb-4b2a-8dbc6f5667b3	SedezniRed-read	SedezniRed - branje	f
00030000-55c1-e3bb-a529-60a48844d5a4	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c1-e3bb-7ad3-df8e31fe708b	Sedez-read	Sedez - branje	f
00030000-55c1-e3bb-2163-c9bc8b1f5688	Sedez-write	Sedez - spreminjanje	f
00030000-55c1-e3bb-810f-3538117ee808	Sezona-read	Sezona - branje	f
00030000-55c1-e3bb-2b9e-49cefe90cc47	Sezona-write	Sezona - spreminjanje	f
00030000-55c1-e3bb-3697-f2eb24b01007	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c1-e3bb-d530-3676aa6819e5	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c1-e3bb-c181-be51b4c91376	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c1-e3bb-bae5-ee46f9e6f56d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c1-e3bb-7fea-7ee663b0c5c7	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c1-e3bb-7fca-e20ccdc39ddc	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c1-e3bb-3fb4-2752c17334b7	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c1-e3bb-7222-7b3603f844f8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c1-e3bb-9a2b-b81042eb1bc3	Telefonska-read	Telefonska - branje	f
00030000-55c1-e3bb-4c43-fadb88b14ff8	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c1-e3bb-69f0-78c57c2f016b	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c1-e3bb-d7ce-ac1eabb99081	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c1-e3bb-5faa-3950996ca4c4	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c1-e3bb-00b8-c38f8e582c4e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c1-e3bb-3ef4-7e8a6c711b22	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c1-e3bb-22de-63bd42a7643f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c1-e3bb-f3a9-fbfa14b555a8	Trr-read	Trr - branje	f
00030000-55c1-e3bb-4234-6bc2b7d3dffe	Trr-write	Trr - spreminjanje	f
00030000-55c1-e3bb-12f6-54a8d3a3bf6f	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c1-e3bb-d9de-ce4884d33c7e	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c1-e3bb-e06d-ee74a9618b91	Vaja-read	Vaja - branje	f
00030000-55c1-e3bb-eb7c-0e2d3b1d0062	Vaja-write	Vaja - spreminjanje	f
00030000-55c1-e3bb-6fac-daadf319eb4a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c1-e3bb-3e75-c96f49b31805	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c1-e3bb-7ef2-4afc66d61f2c	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c1-e3bb-f290-8f665614b4d6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c1-e3bb-23b5-b42d4882b180	Zasedenost-read	Zasedenost - branje	f
00030000-55c1-e3bb-b30a-73be65215978	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c1-e3bb-1162-48a00d674f37	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c1-e3bb-9fdc-75d2101d7bf8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c1-e3bb-1052-a6b184aa9b86	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c1-e3bb-e04c-f5a7dbae7691	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c1-e3bb-e0da-f71aec3f3d64	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c1-e3bb-7b25-5a87c6fa164b	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c1-e3bb-fc09-c994de283cf8	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c1-e3bb-b6bf-81ac0635d8b0	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c1-e3bb-c702-cb8078539c2c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c1-e3bb-f316-b75233c5d312	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c1-e3bb-590b-40f5b4e61833	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c1-e3bb-75dd-99fdfec736b3	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c1-e3bb-62c9-c580d0d9b6ed	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c1-e3bb-0cdf-7a20246dd74d	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c1-e3bb-42a2-390d57098cad	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c1-e3bb-9d1c-1ab96df6f363	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2996 (class 0 OID 11918301)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c1-e3bb-633e-5dc2068e6bd3	00030000-55c1-e3bb-a674-ede7cf3a7261
00020000-55c1-e3bb-a198-bfd2d23b7b7e	00030000-55c1-e3bb-458b-b3efcf156475
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-6b0d-30a9316de94e
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-a0ef-4103ed0d9652
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-9029-2707329b7706
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-3de9-4c1ea8067aa0
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-f6b0-9fcfe3b2c60b
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-7b02-d9a05e4f5342
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-7cdb-929416fa8fe0
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-e22c-3e80ae279f40
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-458b-b3efcf156475
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-7472-901df0793184
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-9eee-48ae34404240
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-d62b-34128a2dd13b
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-a2e1-f2102bcaadf2
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-78c5-6c71c87fc345
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-504d-9dd61a51e30e
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-a86f-e1f086b65ce2
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-379b-ccb5fdaba6e9
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-4307-7ad5fbdf951d
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-d488-5eac0c9e9d22
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-7301-5fd5c51a6293
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-4de0-b9faf03ff0c3
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-665d-fb27a94e47df
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-6ce3-07116186c9c3
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-a05a-7c3e6d480f4f
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-093a-a11899dd0dd2
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-ddf2-ba11aa940c2a
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-c7f8-0851ef2481e1
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-3673-1e0504281f31
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-ed04-3cf3dcc162a2
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-05ff-f376ed26c926
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-bd3d-b7e9c935f375
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-0e94-2a061ecbeff2
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-d06e-3ecd75e970d6
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-a50c-ffcbf4cebcde
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-cc7f-522b030da54e
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-800c-3ed064755918
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-7341-a2b4a3dd2946
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-128b-99b85891f221
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-810f-3538117ee808
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-2b9e-49cefe90cc47
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-5faa-3950996ca4c4
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-12f6-54a8d3a3bf6f
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-d9de-ce4884d33c7e
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-e06d-ee74a9618b91
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-eb7c-0e2d3b1d0062
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-23b5-b42d4882b180
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-b30a-73be65215978
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-1162-48a00d674f37
00020000-55c1-e3bb-2938-70e6f58ffab7	00030000-55c1-e3bb-1052-a6b184aa9b86
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-6b0d-30a9316de94e
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-f6b0-9fcfe3b2c60b
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-7b02-d9a05e4f5342
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-458b-b3efcf156475
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-a2e1-f2102bcaadf2
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-504d-9dd61a51e30e
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-379b-ccb5fdaba6e9
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-4307-7ad5fbdf951d
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-d488-5eac0c9e9d22
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-7301-5fd5c51a6293
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-4de0-b9faf03ff0c3
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-665d-fb27a94e47df
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-6ce3-07116186c9c3
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-093a-a11899dd0dd2
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-c7f8-0851ef2481e1
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-3673-1e0504281f31
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-ed04-3cf3dcc162a2
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-d06e-3ecd75e970d6
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-cc7f-522b030da54e
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-7341-a2b4a3dd2946
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-810f-3538117ee808
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-9a2b-b81042eb1bc3
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-4c43-fadb88b14ff8
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-f3a9-fbfa14b555a8
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-4234-6bc2b7d3dffe
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-7ef2-4afc66d61f2c
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-f290-8f665614b4d6
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-1162-48a00d674f37
00020000-55c1-e3bb-c0cf-a212a1dbb08a	00030000-55c1-e3bb-1052-a6b184aa9b86
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-6b0d-30a9316de94e
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-9029-2707329b7706
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-f6b0-9fcfe3b2c60b
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-5b71-c2335d616728
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-8a9b-9d4b2872c1b2
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-4411-36b49307b397
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-7b02-d9a05e4f5342
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-458b-b3efcf156475
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-9eee-48ae34404240
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-a2e1-f2102bcaadf2
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-504d-9dd61a51e30e
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-379b-ccb5fdaba6e9
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-d488-5eac0c9e9d22
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-7301-5fd5c51a6293
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-4de0-b9faf03ff0c3
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-6ce3-07116186c9c3
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-093a-a11899dd0dd2
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-ed04-3cf3dcc162a2
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-bd3d-b7e9c935f375
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-d06e-3ecd75e970d6
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-cc7f-522b030da54e
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-7341-a2b4a3dd2946
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-810f-3538117ee808
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-5faa-3950996ca4c4
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-e06d-ee74a9618b91
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-23b5-b42d4882b180
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-1162-48a00d674f37
00020000-55c1-e3bb-eea4-94179d8548f3	00030000-55c1-e3bb-1052-a6b184aa9b86
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-6b0d-30a9316de94e
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-a0ef-4103ed0d9652
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-3de9-4c1ea8067aa0
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-f6b0-9fcfe3b2c60b
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-7b02-d9a05e4f5342
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-458b-b3efcf156475
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-a2e1-f2102bcaadf2
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-504d-9dd61a51e30e
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-d488-5eac0c9e9d22
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-7301-5fd5c51a6293
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-6ce3-07116186c9c3
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-093a-a11899dd0dd2
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-ed04-3cf3dcc162a2
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-d06e-3ecd75e970d6
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-cc7f-522b030da54e
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-7341-a2b4a3dd2946
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-810f-3538117ee808
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-5faa-3950996ca4c4
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-1162-48a00d674f37
00020000-55c1-e3bb-7c76-795cf1ec4318	00030000-55c1-e3bb-1052-a6b184aa9b86
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-6b0d-30a9316de94e
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-f6b0-9fcfe3b2c60b
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-7b02-d9a05e4f5342
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-458b-b3efcf156475
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-a2e1-f2102bcaadf2
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-504d-9dd61a51e30e
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-d488-5eac0c9e9d22
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-7301-5fd5c51a6293
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-6ce3-07116186c9c3
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-093a-a11899dd0dd2
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-ed04-3cf3dcc162a2
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-d06e-3ecd75e970d6
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-cc7f-522b030da54e
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-7341-a2b4a3dd2946
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-810f-3538117ee808
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-69f0-78c57c2f016b
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-0589-62a74e034ab8
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-5faa-3950996ca4c4
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-1162-48a00d674f37
00020000-55c1-e3bb-a3db-a1625be4f898	00030000-55c1-e3bb-1052-a6b184aa9b86
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-a5fd-6a251278fa36
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-a674-ede7cf3a7261
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-0589-62a74e034ab8
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7cdb-929416fa8fe0
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-b26c-81aadadd1374
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-bf6d-fa60a8723d1a
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-6b0d-30a9316de94e
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-a0ef-4103ed0d9652
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-9029-2707329b7706
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-3de9-4c1ea8067aa0
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-f6b0-9fcfe3b2c60b
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-5b71-c2335d616728
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-8a9b-9d4b2872c1b2
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-4816-d1ff350a09f6
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-4411-36b49307b397
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-3887-a9d55dcf22c7
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7b02-d9a05e4f5342
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-e22c-3e80ae279f40
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-458b-b3efcf156475
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7472-901df0793184
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7de3-e10035cc9623
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-1634-f6fa22e2446b
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-df0e-65283ddf65cc
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-c512-1e339493bd64
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-9eee-48ae34404240
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-d62b-34128a2dd13b
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-a2e1-f2102bcaadf2
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-78c5-6c71c87fc345
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-504d-9dd61a51e30e
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-a86f-e1f086b65ce2
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-379b-ccb5fdaba6e9
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-4307-7ad5fbdf951d
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-e2cd-61e3df8ac5b3
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-2978-86f24caa807b
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-029a-fe8ed0af0a18
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7ef9-e03d8e80e9a1
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-d488-5eac0c9e9d22
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-352a-465758357300
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7301-5fd5c51a6293
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-a842-a5978988f9df
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-4de0-b9faf03ff0c3
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-665d-fb27a94e47df
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-a404-77d2b7cbf9b8
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-3393-81ef4907df14
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-1aea-b1352bc2a139
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-ec93-8e72d4488ba3
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-f6d9-dde17e7c3c30
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-2979-1874ce07bd29
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-6ce3-07116186c9c3
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-a05a-7c3e6d480f4f
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-093a-a11899dd0dd2
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-ddf2-ba11aa940c2a
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-ee0f-b23e89c3a27a
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-f72f-ad786b0f96c7
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-c7f8-0851ef2481e1
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-3673-1e0504281f31
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-ed04-3cf3dcc162a2
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-05ff-f376ed26c926
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-3d34-84113f22e8e6
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-30a6-2891e1856818
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-cd4d-c3b0c4155ae6
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-627a-0910cbf142b7
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-bd3d-b7e9c935f375
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-0e94-2a061ecbeff2
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-751d-f8406f2d399b
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-e43c-768a7fb189bb
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7ade-8e4e3eb966b9
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-78c7-9a6183992a71
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-8291-aec251befbf8
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-0be7-595ebd5b69a2
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-8d9a-a5e111a0b541
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-d460-7f007e082382
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-080f-0bfa0212c2f1
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-d5f6-5766d3b3739d
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-3f10-af41eb342b91
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-044f-92c90e98b78d
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-a6b1-473476398972
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-d03c-484705ea8b1e
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-6c11-5f85069981ec
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-1f09-a4a03ef3db4b
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-87c2-bd1aa6973991
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-e08f-8559e34e2c86
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-4f7b-77d7a58cb7dc
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-472b-5933b056d258
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-d06e-3ecd75e970d6
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-a50c-ffcbf4cebcde
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-5bef-737f2fed9083
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7d4d-060872ee5cd4
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-d5d1-9b84f4512982
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-3ca8-bd4d1dea3407
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-cc7f-522b030da54e
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-800c-3ed064755918
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7341-a2b4a3dd2946
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-128b-99b85891f221
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-5c86-cfa5de155a88
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-c2d9-ad966a74c7cb
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-15ae-ae6d1bf7e3c7
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-8720-edb56223df43
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-4b2a-8dbc6f5667b3
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-a529-60a48844d5a4
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7ad3-df8e31fe708b
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-2163-c9bc8b1f5688
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-810f-3538117ee808
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-2b9e-49cefe90cc47
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-3697-f2eb24b01007
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-d530-3676aa6819e5
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-c181-be51b4c91376
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-bae5-ee46f9e6f56d
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7fea-7ee663b0c5c7
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7fca-e20ccdc39ddc
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-3fb4-2752c17334b7
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7222-7b3603f844f8
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-9a2b-b81042eb1bc3
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-4c43-fadb88b14ff8
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-69f0-78c57c2f016b
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-d7ce-ac1eabb99081
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-5faa-3950996ca4c4
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-00b8-c38f8e582c4e
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-3ef4-7e8a6c711b22
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-22de-63bd42a7643f
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-f3a9-fbfa14b555a8
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-4234-6bc2b7d3dffe
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-12f6-54a8d3a3bf6f
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-d9de-ce4884d33c7e
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-e06d-ee74a9618b91
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-eb7c-0e2d3b1d0062
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-6fac-daadf319eb4a
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-3e75-c96f49b31805
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-7ef2-4afc66d61f2c
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-f290-8f665614b4d6
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-23b5-b42d4882b180
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-b30a-73be65215978
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-1162-48a00d674f37
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-9fdc-75d2101d7bf8
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-1052-a6b184aa9b86
00020000-55c1-e3bd-6658-ca09ecd7665a	00030000-55c1-e3bb-e04c-f5a7dbae7691
\.


--
-- TOC entry 3024 (class 0 OID 11918600)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11918631)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 11918745)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c1-e3bd-a5f3-1bbfc2527b6c	00090000-55c1-e3bd-0aa9-ab424e01df8b	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c1-e3bd-caff-3eb8dfb725ec	00090000-55c1-e3bd-767d-7deb52a8ec5a	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c1-e3bd-19bd-d634a8aad617	00090000-55c1-e3bd-20c1-b8f31c99a587	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3001 (class 0 OID 11918361)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c1-e3bd-16b5-cfb15abce17d	00040000-55c1-e3bb-dea7-16ff53ddeb4f	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-e3bd-e9b0-d3e371a2299b	00040000-55c1-e3bb-dea7-16ff53ddeb4f	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c1-e3bd-ece5-7baecc1c27ed	00040000-55c1-e3bb-dea7-16ff53ddeb4f	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-e3bd-9224-15785a2c923d	00040000-55c1-e3bb-dea7-16ff53ddeb4f	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-e3bd-d349-d78843a482ce	00040000-55c1-e3bb-dea7-16ff53ddeb4f	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-e3bd-ecdc-293e108a4ebd	00040000-55c1-e3bb-8381-670ed67cc62e	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-e3bd-eb6d-ccdb5f95b1f8	00040000-55c1-e3bb-0e5e-3f59104c5841	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-e3bd-4251-13b26ee603d4	00040000-55c1-e3bb-dcfc-5af14457d7d6	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-e3bd-f18a-8efeafbc7af8	00040000-55c1-e3bb-dea7-16ff53ddeb4f	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3003 (class 0 OID 11918396)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c1-e3bb-18dc-401a458cc1c6	8341	Adlešiči
00050000-55c1-e3bb-4d94-637812db818c	5270	Ajdovščina
00050000-55c1-e3bb-b6c8-d8aba146fda7	6280	Ankaran/Ancarano
00050000-55c1-e3bb-10de-c47c0f462ab8	9253	Apače
00050000-55c1-e3bb-83e1-89ddc5341505	8253	Artiče
00050000-55c1-e3bb-379c-38dcf1f3bef3	4275	Begunje na Gorenjskem
00050000-55c1-e3bb-aafb-75e02ac5a4c8	1382	Begunje pri Cerknici
00050000-55c1-e3bb-574d-a35b0b70e5d9	9231	Beltinci
00050000-55c1-e3bb-f30e-c4bf2ebac69d	2234	Benedikt
00050000-55c1-e3bb-cd76-3b881ec77af8	2345	Bistrica ob Dravi
00050000-55c1-e3bb-7f76-2d6512503acd	3256	Bistrica ob Sotli
00050000-55c1-e3bb-a044-bdd1b423913f	8259	Bizeljsko
00050000-55c1-e3bb-5294-a2366fc48e71	1223	Blagovica
00050000-55c1-e3bb-f5a9-21efeaaf4b3b	8283	Blanca
00050000-55c1-e3bb-be8c-0e396a707265	4260	Bled
00050000-55c1-e3bb-d983-f13e1f3b9d4c	4273	Blejska Dobrava
00050000-55c1-e3bb-e829-211caf59e6e0	9265	Bodonci
00050000-55c1-e3bb-fd81-1576c37b8bc0	9222	Bogojina
00050000-55c1-e3bb-9664-97fb2dd53082	4263	Bohinjska Bela
00050000-55c1-e3bb-b327-9cb87701b32a	4264	Bohinjska Bistrica
00050000-55c1-e3bb-c808-8d803c80c30b	4265	Bohinjsko jezero
00050000-55c1-e3bb-18d4-42d26d5f5215	1353	Borovnica
00050000-55c1-e3bb-d94c-4b0915666757	8294	Boštanj
00050000-55c1-e3bb-8384-7a6010faabbb	5230	Bovec
00050000-55c1-e3bb-0707-c9352ea376bd	5295	Branik
00050000-55c1-e3bb-602b-d8271efd344b	3314	Braslovče
00050000-55c1-e3bb-55b4-5da96bd8a5cf	5223	Breginj
00050000-55c1-e3bb-2800-d657bdca2eb2	8280	Brestanica
00050000-55c1-e3bb-c8a4-893de2ab31e1	2354	Bresternica
00050000-55c1-e3bb-959d-fb73eccbb020	4243	Brezje
00050000-55c1-e3bb-c54a-a3d250752c62	1351	Brezovica pri Ljubljani
00050000-55c1-e3bb-22fb-91213bd0612f	8250	Brežice
00050000-55c1-e3bb-d101-b79fa33f3e6f	4210	Brnik - Aerodrom
00050000-55c1-e3bb-8db6-aa6f246aad56	8321	Brusnice
00050000-55c1-e3bb-f418-42135f785b8a	3255	Buče
00050000-55c1-e3bb-e954-99665d0885dc	8276	Bučka 
00050000-55c1-e3bb-3465-d2741870792f	9261	Cankova
00050000-55c1-e3bb-d693-368790c99f17	3000	Celje 
00050000-55c1-e3bb-5178-592643e717e1	3001	Celje - poštni predali
00050000-55c1-e3bb-82a1-07d7225bded2	4207	Cerklje na Gorenjskem
00050000-55c1-e3bb-e66e-595aaa3a7bdc	8263	Cerklje ob Krki
00050000-55c1-e3bb-13d3-3eff2772cc57	1380	Cerknica
00050000-55c1-e3bb-95b8-16f520f57d9e	5282	Cerkno
00050000-55c1-e3bb-d7c8-e83cd512ca5a	2236	Cerkvenjak
00050000-55c1-e3bb-803c-f712c2fb73e8	2215	Ceršak
00050000-55c1-e3bb-eb2f-794e5c3d740e	2326	Cirkovce
00050000-55c1-e3bb-3f16-a129ec46efac	2282	Cirkulane
00050000-55c1-e3bb-f90b-f0ef9c808306	5273	Col
00050000-55c1-e3bb-2573-85bce003bcc3	8251	Čatež ob Savi
00050000-55c1-e3bb-83db-695f83793d33	1413	Čemšenik
00050000-55c1-e3bb-add1-218bbd8c9292	5253	Čepovan
00050000-55c1-e3bb-17cd-0ee0b625e484	9232	Črenšovci
00050000-55c1-e3bb-bb7e-b0e6f14d5468	2393	Črna na Koroškem
00050000-55c1-e3bb-0289-b850d59a2ab0	6275	Črni Kal
00050000-55c1-e3bb-0ab0-472244c622f3	5274	Črni Vrh nad Idrijo
00050000-55c1-e3bb-b5db-36c32604dde5	5262	Črniče
00050000-55c1-e3bb-f7db-53194561ed45	8340	Črnomelj
00050000-55c1-e3bb-8dd8-4b289f16f523	6271	Dekani
00050000-55c1-e3bb-a1d2-5beae364f9aa	5210	Deskle
00050000-55c1-e3bb-dbd6-58161c375143	2253	Destrnik
00050000-55c1-e3bb-565c-44c1916d76a9	6215	Divača
00050000-55c1-e3bb-29f3-56b3b3bc6ed4	1233	Dob
00050000-55c1-e3bb-8e5e-5318b7876077	3224	Dobje pri Planini
00050000-55c1-e3bb-412f-c90198b80619	8257	Dobova
00050000-55c1-e3bb-9789-cbf6e5043b9e	1423	Dobovec
00050000-55c1-e3bb-6216-c81f9095a8b8	5263	Dobravlje
00050000-55c1-e3bb-b1d4-90bea425e9c4	3204	Dobrna
00050000-55c1-e3bb-de39-97894bc6126f	8211	Dobrnič
00050000-55c1-e3bb-32ef-9afa25f0292a	1356	Dobrova
00050000-55c1-e3bb-45bf-c4bed00c1cdd	9223	Dobrovnik/Dobronak 
00050000-55c1-e3bb-0ede-3c3a22503da9	5212	Dobrovo v Brdih
00050000-55c1-e3bb-6ccd-c0c4c8aebe4c	1431	Dol pri Hrastniku
00050000-55c1-e3bb-bee7-51d1883f0fb5	1262	Dol pri Ljubljani
00050000-55c1-e3bb-492c-8a6976c1dd46	1273	Dole pri Litiji
00050000-55c1-e3bb-9cca-8c534e2bf228	1331	Dolenja vas
00050000-55c1-e3bb-9ab2-24a1f60c2bf9	8350	Dolenjske Toplice
00050000-55c1-e3bb-11cd-8a08bd12ce95	1230	Domžale
00050000-55c1-e3bb-9adc-9f834382ba64	2252	Dornava
00050000-55c1-e3bb-9377-b3dfdffbc1f2	5294	Dornberk
00050000-55c1-e3bb-ab6b-72b074686b28	1319	Draga
00050000-55c1-e3bb-d705-ced724c06b0a	8343	Dragatuš
00050000-55c1-e3bb-4ef0-2a91984ff3f3	3222	Dramlje
00050000-55c1-e3bb-c232-5be5ad97c72d	2370	Dravograd
00050000-55c1-e3bb-bd4d-f2901e5b25c5	4203	Duplje
00050000-55c1-e3bb-8073-918ad4a06b49	6221	Dutovlje
00050000-55c1-e3bb-1685-1f5575b693ae	8361	Dvor
00050000-55c1-e3bb-0242-1a38941edfba	2343	Fala
00050000-55c1-e3bb-e765-2701e37aa523	9208	Fokovci
00050000-55c1-e3bb-e024-bf1c216d7a8e	2313	Fram
00050000-55c1-e3bb-f5ee-9c16e75a6fb5	3213	Frankolovo
00050000-55c1-e3bb-6be5-713beaf9f69c	1274	Gabrovka
00050000-55c1-e3bb-29ff-82414a0f68bd	8254	Globoko
00050000-55c1-e3bb-f200-e0b85364249f	5275	Godovič
00050000-55c1-e3bb-9654-587cfb66eb15	4204	Golnik
00050000-55c1-e3bb-cf4e-f7e369268c2f	3303	Gomilsko
00050000-55c1-e3bb-483b-792c3f1954fb	4224	Gorenja vas
00050000-55c1-e3bb-5d7c-2eacdc7a71e4	3263	Gorica pri Slivnici
00050000-55c1-e3bb-e4ba-8d80fa693b50	2272	Gorišnica
00050000-55c1-e3bb-0472-e1a07de1cce5	9250	Gornja Radgona
00050000-55c1-e3bb-1459-61ab3747e89d	3342	Gornji Grad
00050000-55c1-e3bb-be47-1260b6583b30	4282	Gozd Martuljek
00050000-55c1-e3bb-556f-5ffe73d8308f	6272	Gračišče
00050000-55c1-e3bb-58a3-1c27bebd6239	9264	Grad
00050000-55c1-e3bb-0145-10d713d590a0	8332	Gradac
00050000-55c1-e3bb-b792-9cc99d0a4541	1384	Grahovo
00050000-55c1-e3bb-f8c6-70f8a9251a2a	5242	Grahovo ob Bači
00050000-55c1-e3bb-6378-f57a752909b8	5251	Grgar
00050000-55c1-e3bb-7033-eface36da06d	3302	Griže
00050000-55c1-e3bb-9cee-22ffdd1dbcae	3231	Grobelno
00050000-55c1-e3bb-00ce-58f1012c446b	1290	Grosuplje
00050000-55c1-e3bb-bfd1-5bbf269965c4	2288	Hajdina
00050000-55c1-e3bb-4018-4627db3b33b2	8362	Hinje
00050000-55c1-e3bb-1f26-f953e3dabe96	2311	Hoče
00050000-55c1-e3bb-95b6-d4a9ae219931	9205	Hodoš/Hodos
00050000-55c1-e3bb-52dc-2c7bfd473718	1354	Horjul
00050000-55c1-e3bb-6d0a-62b19a0a3cbb	1372	Hotedršica
00050000-55c1-e3bb-4fcb-6db94742dca1	1430	Hrastnik
00050000-55c1-e3bb-7bce-02206f71dc2c	6225	Hruševje
00050000-55c1-e3bb-be28-a8abcb8056d6	4276	Hrušica
00050000-55c1-e3bb-9e53-4551611e3694	5280	Idrija
00050000-55c1-e3bb-5d01-41e88624ce53	1292	Ig
00050000-55c1-e3bb-83c1-5defc3d0f8e7	6250	Ilirska Bistrica
00050000-55c1-e3bb-df15-f1ebcd7a568c	6251	Ilirska Bistrica-Trnovo
00050000-55c1-e3bb-f9e5-565b66d37d24	1295	Ivančna Gorica
00050000-55c1-e3bb-fb33-a55d20832354	2259	Ivanjkovci
00050000-55c1-e3bb-e7b8-5f2f0ce4bd18	1411	Izlake
00050000-55c1-e3bb-ba08-e166dc85f308	6310	Izola/Isola
00050000-55c1-e3bb-05b4-cb25a6d5a82f	2222	Jakobski Dol
00050000-55c1-e3bb-7aab-bb92ce5d88f6	2221	Jarenina
00050000-55c1-e3bb-2ad8-d9329aa28abe	6254	Jelšane
00050000-55c1-e3bb-fae5-d7b96bf26ef1	4270	Jesenice
00050000-55c1-e3bb-48bd-fee226e5898c	8261	Jesenice na Dolenjskem
00050000-55c1-e3bb-9c45-3019e6a2e396	3273	Jurklošter
00050000-55c1-e3bb-86cc-a8ca76169d6e	2223	Jurovski Dol
00050000-55c1-e3bb-be6a-00a332e67983	2256	Juršinci
00050000-55c1-e3bb-e4fc-4348d74ed3bb	5214	Kal nad Kanalom
00050000-55c1-e3bb-8350-b04dc6be93b5	3233	Kalobje
00050000-55c1-e3bb-652c-662291a12471	4246	Kamna Gorica
00050000-55c1-e3bb-2caa-2b618a0625e2	2351	Kamnica
00050000-55c1-e3bb-b8d1-8861a0e2d120	1241	Kamnik
00050000-55c1-e3bb-8c5e-f61fb790330f	5213	Kanal
00050000-55c1-e3bb-390f-491bdc13d4c6	8258	Kapele
00050000-55c1-e3bb-393b-738336c3c7ac	2362	Kapla
00050000-55c1-e3bb-8f05-c500233dd89e	2325	Kidričevo
00050000-55c1-e3bb-050a-27430afdcd6d	1412	Kisovec
00050000-55c1-e3bb-3be2-59e08e2bc886	6253	Knežak
00050000-55c1-e3bb-e9f3-4dc0edff995b	5222	Kobarid
00050000-55c1-e3bb-c355-9bafab33a33c	9227	Kobilje
00050000-55c1-e3bb-7ee1-812ca9ef31f0	1330	Kočevje
00050000-55c1-e3bb-4665-4b2541a2e47b	1338	Kočevska Reka
00050000-55c1-e3bb-a913-c3048cce6ef1	2276	Kog
00050000-55c1-e3bb-85d7-4d3ccbe529e9	5211	Kojsko
00050000-55c1-e3bb-1e0b-9d3000a29b74	6223	Komen
00050000-55c1-e3bb-d03f-05f6e5374ce1	1218	Komenda
00050000-55c1-e3bb-88df-75f37768e918	6000	Koper/Capodistria 
00050000-55c1-e3bb-0070-281b12289462	6001	Koper/Capodistria - poštni predali
00050000-55c1-e3bb-3445-c4e6c338888f	8282	Koprivnica
00050000-55c1-e3bb-19dc-660b9f84658c	5296	Kostanjevica na Krasu
00050000-55c1-e3bb-4cfd-c2c56b862060	8311	Kostanjevica na Krki
00050000-55c1-e3bb-df3b-bfe33a6f36e1	1336	Kostel
00050000-55c1-e3bb-095c-f2ccd5389793	6256	Košana
00050000-55c1-e3bb-9d9d-24b055fe4074	2394	Kotlje
00050000-55c1-e3bb-f7ea-7b944e47a918	6240	Kozina
00050000-55c1-e3bb-f2c1-2ebaa04ff01a	3260	Kozje
00050000-55c1-e3bb-c79d-f3305b20248e	4000	Kranj 
00050000-55c1-e3bb-9a82-3a26ba443b0f	4001	Kranj - poštni predali
00050000-55c1-e3bb-ad5e-28156380cbd8	4280	Kranjska Gora
00050000-55c1-e3bb-cd0b-9a6516fc457b	1281	Kresnice
00050000-55c1-e3bb-07e1-11d9fff9fc91	4294	Križe
00050000-55c1-e3bb-2c00-af3728a80df0	9206	Križevci
00050000-55c1-e3bb-d8cf-a3bc3b2fccb5	9242	Križevci pri Ljutomeru
00050000-55c1-e3bb-f481-400c350f1e2e	1301	Krka
00050000-55c1-e3bb-9d9f-133f67cc76d8	8296	Krmelj
00050000-55c1-e3bb-cbd0-f4af64ea1033	4245	Kropa
00050000-55c1-e3bb-3e91-caa1cc7814b7	8262	Krška vas
00050000-55c1-e3bb-1013-4785b80d72b2	8270	Krško
00050000-55c1-e3bb-9af7-67083a4c2e2a	9263	Kuzma
00050000-55c1-e3bb-52c6-218ee0b6fe2e	2318	Laporje
00050000-55c1-e3bb-cebc-e7d643563fe6	3270	Laško
00050000-55c1-e3bb-bc7b-7c012fba69b9	1219	Laze v Tuhinju
00050000-55c1-e3bb-4a48-60d789e0fa86	2230	Lenart v Slovenskih goricah
00050000-55c1-e3bb-e7a3-267efa884f73	9220	Lendava/Lendva
00050000-55c1-e3bb-a842-c82e38844f3b	4248	Lesce
00050000-55c1-e3bb-88cf-51fc8b25262e	3261	Lesično
00050000-55c1-e3bb-dbee-f67cefdb2e5d	8273	Leskovec pri Krškem
00050000-55c1-e3bb-bb15-8a707b35bc2d	2372	Libeliče
00050000-55c1-e3bb-a14f-9dcbe7221730	2341	Limbuš
00050000-55c1-e3bb-29eb-73ff5d16e232	1270	Litija
00050000-55c1-e3bb-da3e-4fd1e4230059	3202	Ljubečna
00050000-55c1-e3bb-3a75-2183c6208584	1000	Ljubljana 
00050000-55c1-e3bb-a276-b4a5b4b04086	1001	Ljubljana - poštni predali
00050000-55c1-e3bb-7307-78518a1979de	1231	Ljubljana - Črnuče
00050000-55c1-e3bb-665f-590be71236f5	1261	Ljubljana - Dobrunje
00050000-55c1-e3bb-6c0a-011a784704a1	1260	Ljubljana - Polje
00050000-55c1-e3bb-9a9c-dd680a6e30ff	1210	Ljubljana - Šentvid
00050000-55c1-e3bb-0d0c-0b9e9e02ec1f	1211	Ljubljana - Šmartno
00050000-55c1-e3bb-41f9-1dda3dded5b6	3333	Ljubno ob Savinji
00050000-55c1-e3bb-7bcf-8ace5bf91b86	9240	Ljutomer
00050000-55c1-e3bb-e335-36c58c1e07a3	3215	Loče
00050000-55c1-e3bb-faa0-deda394f2b36	5231	Log pod Mangartom
00050000-55c1-e3bb-9ee9-de38a8ad7377	1358	Log pri Brezovici
00050000-55c1-e3bb-be2a-2de47ad2cbc5	1370	Logatec
00050000-55c1-e3bb-89f5-ae112fa3282e	1371	Logatec
00050000-55c1-e3bb-dd5f-c869cb3982c4	1434	Loka pri Zidanem Mostu
00050000-55c1-e3bb-82f3-ca62fa26b5ac	3223	Loka pri Žusmu
00050000-55c1-e3bb-d00d-db4cb53c3719	6219	Lokev
00050000-55c1-e3bb-ff3f-3bb878ea3676	1318	Loški Potok
00050000-55c1-e3bb-2512-7a4f8715822d	2324	Lovrenc na Dravskem polju
00050000-55c1-e3bb-d604-a1ecc3c61549	2344	Lovrenc na Pohorju
00050000-55c1-e3bb-7f30-3c590f1e8789	3334	Luče
00050000-55c1-e3bb-0536-5b639beb91fe	1225	Lukovica
00050000-55c1-e3bb-1eec-278f76fe03c8	9202	Mačkovci
00050000-55c1-e3bb-01b8-836055ebf2d9	2322	Majšperk
00050000-55c1-e3bb-323c-165ddf85c565	2321	Makole
00050000-55c1-e3bb-f435-ddc25e6767c4	9243	Mala Nedelja
00050000-55c1-e3bb-4bfd-8c778cc4623c	2229	Malečnik
00050000-55c1-e3bb-078d-9801c4fa3211	6273	Marezige
00050000-55c1-e3bb-0888-c3211d65f958	2000	Maribor 
00050000-55c1-e3bb-da7c-4f919e2503c0	2001	Maribor - poštni predali
00050000-55c1-e3bb-7b9d-f0cc37c46537	2206	Marjeta na Dravskem polju
00050000-55c1-e3bb-2b4a-17d6a6fa40a4	2281	Markovci
00050000-55c1-e3bb-c275-8a0d4599853a	9221	Martjanci
00050000-55c1-e3bb-b75e-8ec051686f45	6242	Materija
00050000-55c1-e3bb-bb04-7888bf68ee40	4211	Mavčiče
00050000-55c1-e3bb-eef9-f291c257e984	1215	Medvode
00050000-55c1-e3bb-6bcd-26fda64f3f3c	1234	Mengeš
00050000-55c1-e3bb-e102-b1666316bbf2	8330	Metlika
00050000-55c1-e3bb-a810-413d330bc451	2392	Mežica
00050000-55c1-e3bb-8929-60e584bb8d0e	2204	Miklavž na Dravskem polju
00050000-55c1-e3bb-f7d3-c232d1b96f85	2275	Miklavž pri Ormožu
00050000-55c1-e3bb-bcc7-d7136ebebcc0	5291	Miren
00050000-55c1-e3bb-0f23-bbf3caa54413	8233	Mirna
00050000-55c1-e3bb-7759-52c97407ffac	8216	Mirna Peč
00050000-55c1-e3bb-32f5-51d440981fc5	2382	Mislinja
00050000-55c1-e3bb-4612-1b38f226176c	4281	Mojstrana
00050000-55c1-e3bb-2c28-d1c901e9ffe6	8230	Mokronog
00050000-55c1-e3bb-9aab-870713fc7d65	1251	Moravče
00050000-55c1-e3bb-df34-eafce945be94	9226	Moravske Toplice
00050000-55c1-e3bb-c485-979fa7cf784d	5216	Most na Soči
00050000-55c1-e3bb-1582-4b08fbb09525	1221	Motnik
00050000-55c1-e3bb-cb4b-d3adf13629f4	3330	Mozirje
00050000-55c1-e3bb-0cad-c4446d9baab4	9000	Murska Sobota 
00050000-55c1-e3bb-27b9-98dee1d5575c	9001	Murska Sobota - poštni predali
00050000-55c1-e3bb-1c3f-f89b5f838142	2366	Muta
00050000-55c1-e3bb-7775-14208b31bb93	4202	Naklo
00050000-55c1-e3bb-3883-188730293f3b	3331	Nazarje
00050000-55c1-e3bb-bc2f-9e9b89846a7e	1357	Notranje Gorice
00050000-55c1-e3bb-0c9b-fb43c662363a	3203	Nova Cerkev
00050000-55c1-e3bb-4bb3-637c6d13f80b	5000	Nova Gorica 
00050000-55c1-e3bb-9285-bcf21cd38257	5001	Nova Gorica - poštni predali
00050000-55c1-e3bb-fb6a-99c18f5573ff	1385	Nova vas
00050000-55c1-e3bb-36ed-821163373a9a	8000	Novo mesto
00050000-55c1-e3bb-ffcb-c1a3fe09baf1	8001	Novo mesto - poštni predali
00050000-55c1-e3bb-9454-2d9866630df0	6243	Obrov
00050000-55c1-e3bb-b24b-b22f12996c49	9233	Odranci
00050000-55c1-e3bb-564f-e5bfdd7bb224	2317	Oplotnica
00050000-55c1-e3bb-5850-939c6381b674	2312	Orehova vas
00050000-55c1-e3bb-0ffa-9440aaa82358	2270	Ormož
00050000-55c1-e3bb-9241-2d3e214c8585	1316	Ortnek
00050000-55c1-e3bb-7944-74b1dbb65e5e	1337	Osilnica
00050000-55c1-e3bb-36fc-340645dd8d0f	8222	Otočec
00050000-55c1-e3bb-db9b-ec5f09ea0ad5	2361	Ožbalt
00050000-55c1-e3bb-c21a-0bf4ad863819	2231	Pernica
00050000-55c1-e3bb-b3d5-17d4e65a3a3a	2211	Pesnica pri Mariboru
00050000-55c1-e3bb-63a8-648be58ce625	9203	Petrovci
00050000-55c1-e3bb-c501-fd9ed5247025	3301	Petrovče
00050000-55c1-e3bb-1990-9383e08258e0	6330	Piran/Pirano
00050000-55c1-e3bb-3662-421f3c0ff9cf	8255	Pišece
00050000-55c1-e3bb-6914-594a37e1b9ea	6257	Pivka
00050000-55c1-e3bb-1e36-3590e7ded8a0	6232	Planina
00050000-55c1-e3bb-b91b-eceeb38c8428	3225	Planina pri Sevnici
00050000-55c1-e3bb-2d22-eefe6970b6de	6276	Pobegi
00050000-55c1-e3bb-4f09-b172c871b30c	8312	Podbočje
00050000-55c1-e3bb-7f87-ec187b83eb4b	5243	Podbrdo
00050000-55c1-e3bb-a5bd-e382e01e9001	3254	Podčetrtek
00050000-55c1-e3bb-0ad1-17ee41dca327	2273	Podgorci
00050000-55c1-e3bb-7257-d6e128cb7db0	6216	Podgorje
00050000-55c1-e3bb-1689-21888dd4b4dd	2381	Podgorje pri Slovenj Gradcu
00050000-55c1-e3bb-7ba1-28b6b1d93690	6244	Podgrad
00050000-55c1-e3bb-9978-e6d9ac4f0fe3	1414	Podkum
00050000-55c1-e3bb-6b2f-408eb4909ae3	2286	Podlehnik
00050000-55c1-e3bb-b8b7-2ae59ae49923	5272	Podnanos
00050000-55c1-e3bb-367d-0f83d40d6f58	4244	Podnart
00050000-55c1-e3bb-fe6d-0078645de877	3241	Podplat
00050000-55c1-e3bb-7421-089326648905	3257	Podsreda
00050000-55c1-e3bb-0084-4fea1ddabb07	2363	Podvelka
00050000-55c1-e3bb-3a2f-efb6784300eb	2208	Pohorje
00050000-55c1-e3bb-f8b1-bf941e6cbefb	2257	Polenšak
00050000-55c1-e3bb-c22a-6304f5f30f1c	1355	Polhov Gradec
00050000-55c1-e3bb-9868-d046ff04bc08	4223	Poljane nad Škofjo Loko
00050000-55c1-e3bb-b92f-7569243b5dc4	2319	Poljčane
00050000-55c1-e3bb-7c19-8b1d152f33e5	1272	Polšnik
00050000-55c1-e3bb-2d52-cd74bb614358	3313	Polzela
00050000-55c1-e3bb-a87e-c3e0d5831564	3232	Ponikva
00050000-55c1-e3bb-dd92-c01ed840110e	6320	Portorož/Portorose
00050000-55c1-e3bb-b377-ab01fc943533	6230	Postojna
00050000-55c1-e3bb-5e98-29c4287be0b6	2331	Pragersko
00050000-55c1-e3bb-578a-fb544b59f021	3312	Prebold
00050000-55c1-e3bb-ba6a-43d0e753216d	4205	Preddvor
00050000-55c1-e3bb-b2de-c3c0b0c4ca6a	6255	Prem
00050000-55c1-e3bb-9c4c-8558f2e3bf38	1352	Preserje
00050000-55c1-e3bb-4824-76800feeeb67	6258	Prestranek
00050000-55c1-e3bb-eaec-30b8d51ae810	2391	Prevalje
00050000-55c1-e3bb-d238-f704228933bb	3262	Prevorje
00050000-55c1-e3bb-4ddd-4b121c200ba9	1276	Primskovo 
00050000-55c1-e3bb-419f-b5f2f70cf5a7	3253	Pristava pri Mestinju
00050000-55c1-e3bb-1b93-4ad7bedab451	9207	Prosenjakovci/Partosfalva
00050000-55c1-e3bb-98d0-8492c87bb1e6	5297	Prvačina
00050000-55c1-e3bb-d346-9637e643f4c2	2250	Ptuj
00050000-55c1-e3bb-566f-31bf9e69e21b	2323	Ptujska Gora
00050000-55c1-e3bb-4d2e-9e44ed839b3e	9201	Puconci
00050000-55c1-e3bb-4eeb-f12446d904e4	2327	Rače
00050000-55c1-e3bb-1a38-5a119fcca6b7	1433	Radeče
00050000-55c1-e3bb-1808-3df9562b23cd	9252	Radenci
00050000-55c1-e3bb-0910-acdaa37daa4d	2360	Radlje ob Dravi
00050000-55c1-e3bb-d894-31ef800b3d93	1235	Radomlje
00050000-55c1-e3bb-6c29-8f46e5da8cd4	4240	Radovljica
00050000-55c1-e3bb-d965-0a07074e81ad	8274	Raka
00050000-55c1-e3bb-9afb-62512eda4877	1381	Rakek
00050000-55c1-e3bb-73bd-b289e09dbf74	4283	Rateče - Planica
00050000-55c1-e3bb-170f-ef2dbc48885b	2390	Ravne na Koroškem
00050000-55c1-e3bb-deeb-25380116757c	9246	Razkrižje
00050000-55c1-e3bb-63a5-9ca939cfca8e	3332	Rečica ob Savinji
00050000-55c1-e3bb-5d87-a0466376d46b	5292	Renče
00050000-55c1-e3bb-942a-e801c3e59805	1310	Ribnica
00050000-55c1-e3bb-fa10-4994648c704c	2364	Ribnica na Pohorju
00050000-55c1-e3bb-6a85-2f7ef41e7b37	3272	Rimske Toplice
00050000-55c1-e3bb-cf83-d0676405e7a4	1314	Rob
00050000-55c1-e3bb-8d5f-f790f27871c0	5215	Ročinj
00050000-55c1-e3bb-427b-b233b36c7ca0	3250	Rogaška Slatina
00050000-55c1-e3bb-b501-5db7991ee1a5	9262	Rogašovci
00050000-55c1-e3bb-3d7f-2a69afb2d36b	3252	Rogatec
00050000-55c1-e3bb-fe12-ec1773c67fdb	1373	Rovte
00050000-55c1-e3bb-153b-56596fc4e4d5	2342	Ruše
00050000-55c1-e3bb-909b-c59272f8b0a4	1282	Sava
00050000-55c1-e3bb-3c4a-414a173d3cca	6333	Sečovlje/Sicciole
00050000-55c1-e3bb-65ff-d6c0c5467312	4227	Selca
00050000-55c1-e3bb-7230-03ef53c48909	2352	Selnica ob Dravi
00050000-55c1-e3bb-1b9e-f85641a01f8c	8333	Semič
00050000-55c1-e3bb-327f-6b6675a3ee55	8281	Senovo
00050000-55c1-e3bb-c8fc-e8aa4d516226	6224	Senožeče
00050000-55c1-e3bb-0c64-b6a4d297a17f	8290	Sevnica
00050000-55c1-e3bb-b4f7-69325bbc386e	6210	Sežana
00050000-55c1-e3bb-3a16-a930f3fae875	2214	Sladki Vrh
00050000-55c1-e3bb-847e-cf9ed9ca35dd	5283	Slap ob Idrijci
00050000-55c1-e3bb-a4e6-18795f77f9de	2380	Slovenj Gradec
00050000-55c1-e3bb-e22d-8b4ec3afa4bd	2310	Slovenska Bistrica
00050000-55c1-e3bb-8da3-859001ae0ef3	3210	Slovenske Konjice
00050000-55c1-e3bb-55eb-8ec6bae6bd0b	1216	Smlednik
00050000-55c1-e3bb-97e4-0aaf143ad64d	5232	Soča
00050000-55c1-e3bb-d15b-75d5f261b8dd	1317	Sodražica
00050000-55c1-e3bb-8062-0b348bada67f	3335	Solčava
00050000-55c1-e3bb-9ce9-7e371b53f509	5250	Solkan
00050000-55c1-e3bb-e1da-11834fc4a387	4229	Sorica
00050000-55c1-e3bb-ca9d-79ab2e439d2d	4225	Sovodenj
00050000-55c1-e3bb-fc1a-2df4d845adec	5281	Spodnja Idrija
00050000-55c1-e3bb-cf00-187fae08f9a9	2241	Spodnji Duplek
00050000-55c1-e3bb-377a-d417d955b29a	9245	Spodnji Ivanjci
00050000-55c1-e3bb-123d-76b56088faf4	2277	Središče ob Dravi
00050000-55c1-e3bb-9e3f-b567638127ee	4267	Srednja vas v Bohinju
00050000-55c1-e3bb-fbff-ffe35c92d851	8256	Sromlje 
00050000-55c1-e3bb-676e-8e55e1da1680	5224	Srpenica
00050000-55c1-e3bb-8941-88e1c300e263	1242	Stahovica
00050000-55c1-e3bb-d59f-b46a6cbe4563	1332	Stara Cerkev
00050000-55c1-e3bb-fce9-90bc41682227	8342	Stari trg ob Kolpi
00050000-55c1-e3bb-2194-6e2fb0770cd5	1386	Stari trg pri Ložu
00050000-55c1-e3bb-f4b7-d4f644480f6a	2205	Starše
00050000-55c1-e3bb-56b9-150256394f94	2289	Stoperce
00050000-55c1-e3bb-a753-a541c72b2ce7	8322	Stopiče
00050000-55c1-e3bb-89fd-fdeac4f2555f	3206	Stranice
00050000-55c1-e3bb-38ec-a5461b547267	8351	Straža
00050000-55c1-e3bb-f1fe-b6395f9c1dbc	1313	Struge
00050000-55c1-e3bb-5700-b554a8ffc6bd	8293	Studenec
00050000-55c1-e3bb-c880-7841d9001a55	8331	Suhor
00050000-55c1-e3bb-4bdf-cf50fcfc9e5e	2233	Sv. Ana v Slovenskih goricah
00050000-55c1-e3bb-7aaa-61ed8356832d	2235	Sv. Trojica v Slovenskih goricah
00050000-55c1-e3bb-2c1f-1d6ba12e0f2c	2353	Sveti Duh na Ostrem Vrhu
00050000-55c1-e3bb-6193-8ce4c94f31a4	9244	Sveti Jurij ob Ščavnici
00050000-55c1-e3bb-7718-0f091b575f9c	3264	Sveti Štefan
00050000-55c1-e3bb-9ffe-d528ba689105	2258	Sveti Tomaž
00050000-55c1-e3bb-0a8d-0227797e6926	9204	Šalovci
00050000-55c1-e3bb-ba21-645a38bd368c	5261	Šempas
00050000-55c1-e3bb-aa6b-da1a0374da81	5290	Šempeter pri Gorici
00050000-55c1-e3bb-56fa-e50aea2c45d9	3311	Šempeter v Savinjski dolini
00050000-55c1-e3bb-c2ad-2ab68c8d8265	4208	Šenčur
00050000-55c1-e3bb-c3f8-d7d4e6d9f45d	2212	Šentilj v Slovenskih goricah
00050000-55c1-e3bb-ce95-19c17be59d0e	8297	Šentjanž
00050000-55c1-e3bb-8d5d-828d227325aa	2373	Šentjanž pri Dravogradu
00050000-55c1-e3bb-6af0-62eeb38dc169	8310	Šentjernej
00050000-55c1-e3bb-77b0-3f066867e806	3230	Šentjur
00050000-55c1-e3bb-9b0d-c9736fe32018	3271	Šentrupert
00050000-55c1-e3bb-9035-224bff2d1d37	8232	Šentrupert
00050000-55c1-e3bb-7d9a-f20c3703683d	1296	Šentvid pri Stični
00050000-55c1-e3bb-a842-c7438ecd6e1d	8275	Škocjan
00050000-55c1-e3bb-d8b3-451fdf04c978	6281	Škofije
00050000-55c1-e3bb-4f68-ec913c44b9a7	4220	Škofja Loka
00050000-55c1-e3bb-950a-2887bbc033fe	3211	Škofja vas
00050000-55c1-e3bb-8661-f687826acd7a	1291	Škofljica
00050000-55c1-e3bb-981d-01daf3b3ab10	6274	Šmarje
00050000-55c1-e3bb-90f2-16a058fd837d	1293	Šmarje - Sap
00050000-55c1-e3bb-0abc-5d05d513fab8	3240	Šmarje pri Jelšah
00050000-55c1-e3bb-fd36-cfa9315b6b43	8220	Šmarješke Toplice
00050000-55c1-e3bb-7403-0f84a52451c7	2315	Šmartno na Pohorju
00050000-55c1-e3bb-8c46-7ab41cd77e43	3341	Šmartno ob Dreti
00050000-55c1-e3bb-31ba-de9ab89b9f33	3327	Šmartno ob Paki
00050000-55c1-e3bb-994b-309ca24bf03d	1275	Šmartno pri Litiji
00050000-55c1-e3bb-72aa-6a6a4506a3f4	2383	Šmartno pri Slovenj Gradcu
00050000-55c1-e3bb-b825-0146c8df6dd2	3201	Šmartno v Rožni dolini
00050000-55c1-e3bb-08a9-fe429340457e	3325	Šoštanj
00050000-55c1-e3bb-ee0d-aa12ac75bcf4	6222	Štanjel
00050000-55c1-e3bb-44b7-705aa6acfe8d	3220	Štore
00050000-55c1-e3bb-cac6-211aaad6cb4e	3304	Tabor
00050000-55c1-e3bb-2f38-a0fc8d620783	3221	Teharje
00050000-55c1-e3bb-ec6a-322f9674a799	9251	Tišina
00050000-55c1-e3bb-cf6a-145e6eceafdd	5220	Tolmin
00050000-55c1-e3bb-2b22-61727140c7dd	3326	Topolšica
00050000-55c1-e3bb-7237-a1805f3494d8	2371	Trbonje
00050000-55c1-e3bb-14be-511f6039baea	1420	Trbovlje
00050000-55c1-e3bb-185c-b98072854873	8231	Trebelno 
00050000-55c1-e3bb-137f-2987efbc4493	8210	Trebnje
00050000-55c1-e3bb-97af-140f1f12fb44	5252	Trnovo pri Gorici
00050000-55c1-e3bb-291c-4a36c7db7921	2254	Trnovska vas
00050000-55c1-e3bb-8f8a-cdee38536acb	1222	Trojane
00050000-55c1-e3bb-1c2f-120dce0e1c50	1236	Trzin
00050000-55c1-e3bb-1f78-b670153d1e98	4290	Tržič
00050000-55c1-e3bb-3102-334f2e958f01	8295	Tržišče
00050000-55c1-e3bb-5662-b601470a97f1	1311	Turjak
00050000-55c1-e3bb-9bd1-48468181eb21	9224	Turnišče
00050000-55c1-e3bb-11b1-8c0d23b4c8d8	8323	Uršna sela
00050000-55c1-e3bb-2b6f-0bb9c6487974	1252	Vače
00050000-55c1-e3bb-50fe-d0445909e1dd	3320	Velenje 
00050000-55c1-e3bb-e6f1-e794cfbeb3db	3322	Velenje - poštni predali
00050000-55c1-e3bb-6a34-2666d37a61a2	8212	Velika Loka
00050000-55c1-e3bb-eece-3f43ea765ff5	2274	Velika Nedelja
00050000-55c1-e3bb-67d8-ccb9999af53f	9225	Velika Polana
00050000-55c1-e3bb-3c51-4e101c82bb94	1315	Velike Lašče
00050000-55c1-e3bb-c26b-40c9c7690d14	8213	Veliki Gaber
00050000-55c1-e3bb-78ed-088356902870	9241	Veržej
00050000-55c1-e3bb-d3ec-5b19e3620104	1312	Videm - Dobrepolje
00050000-55c1-e3bb-1aa0-f4b030693825	2284	Videm pri Ptuju
00050000-55c1-e3bb-54bb-e264d9396af8	8344	Vinica
00050000-55c1-e3bb-4469-8b953a63be01	5271	Vipava
00050000-55c1-e3bb-ffdf-d9e954fc538c	4212	Visoko
00050000-55c1-e3bb-be62-94754c148cec	1294	Višnja Gora
00050000-55c1-e3bb-b8e8-b1d7feb3791f	3205	Vitanje
00050000-55c1-e3bb-3a67-91281fc000eb	2255	Vitomarci
00050000-55c1-e3bb-971a-5099bcbcb941	1217	Vodice
00050000-55c1-e3bb-2d4d-4ded119acad0	3212	Vojnik\t
00050000-55c1-e3bb-a738-21aaa2e65a00	5293	Volčja Draga
00050000-55c1-e3bb-10ff-98da13ceef00	2232	Voličina
00050000-55c1-e3bb-fb3f-0b5780eb69fe	3305	Vransko
00050000-55c1-e3bb-0a64-c92163eccec4	6217	Vremski Britof
00050000-55c1-e3bb-ffc0-67c0326adfea	1360	Vrhnika
00050000-55c1-e3bb-5026-62291e26b561	2365	Vuhred
00050000-55c1-e3bb-90b1-7f30161513e5	2367	Vuzenica
00050000-55c1-e3bb-4485-1e479374a1b0	8292	Zabukovje 
00050000-55c1-e3bb-e26e-1acf453b0e7d	1410	Zagorje ob Savi
00050000-55c1-e3bb-513c-b7045998f423	1303	Zagradec
00050000-55c1-e3bb-0f7e-34d7ff7233ed	2283	Zavrč
00050000-55c1-e3bb-3731-7b4f59a123b0	8272	Zdole 
00050000-55c1-e3bb-96f1-40e57030c33b	4201	Zgornja Besnica
00050000-55c1-e3bb-51a3-8da381b4e251	2242	Zgornja Korena
00050000-55c1-e3bb-e5db-47ce8cf9fe05	2201	Zgornja Kungota
00050000-55c1-e3bb-031c-c0b6c5bde1d7	2316	Zgornja Ložnica
00050000-55c1-e3bb-c462-624b0d3b4dd0	2314	Zgornja Polskava
00050000-55c1-e3bb-5df9-c968f6950ce4	2213	Zgornja Velka
00050000-55c1-e3bb-3ac5-ec8004bccb04	4247	Zgornje Gorje
00050000-55c1-e3bb-79a8-a834fdebfdce	4206	Zgornje Jezersko
00050000-55c1-e3bb-4bab-a8070c98b860	2285	Zgornji Leskovec
00050000-55c1-e3bb-5335-56c438458cdf	1432	Zidani Most
00050000-55c1-e3bb-a4cb-e26264967f7c	3214	Zreče
00050000-55c1-e3bb-dea4-86812aa5dfb5	4209	Žabnica
00050000-55c1-e3bb-6c7d-2e96624674b3	3310	Žalec
00050000-55c1-e3bb-1b5a-1998a8a1fa94	4228	Železniki
00050000-55c1-e3bb-87e6-08e0f615ee0b	2287	Žetale
00050000-55c1-e3bb-2327-58a87372fa58	4226	Žiri
00050000-55c1-e3bb-bc39-784d2156d0d3	4274	Žirovnica
00050000-55c1-e3bb-6131-b0fe29df504a	8360	Žužemberk
\.


--
-- TOC entry 3020 (class 0 OID 11918574)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 11918381)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 11918459)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 11918586)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3045 (class 0 OID 11918916)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 11918926)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c1-e3bd-4bea-6d65156ea417	00080000-55c1-e3bd-f18a-8efeafbc7af8	0900	AK
00190000-55c1-e3bd-65a0-b10d58d68736	00080000-55c1-e3bd-ece5-7baecc1c27ed	0987	AK
00190000-55c1-e3bd-8332-ae660df510b9	00080000-55c1-e3bd-e9b0-d3e371a2299b	0989	AK
00190000-55c1-e3bd-a9a3-8ea96d0cac84	00080000-55c1-e3bd-9224-15785a2c923d	0986	AK
00190000-55c1-e3bd-5e63-a2ef9939731b	00080000-55c1-e3bd-ecdc-293e108a4ebd	0984	AK
00190000-55c1-e3bd-8ffe-be21107d8ca1	00080000-55c1-e3bd-eb6d-ccdb5f95b1f8	0983	AK
00190000-55c1-e3bd-70bf-41aab8f83578	00080000-55c1-e3bd-4251-13b26ee603d4	0982	AK
\.


--
-- TOC entry 3044 (class 0 OID 11918872)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c1-e3bd-69fe-5297c1608ab5	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2989 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 11918934)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11918615)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c1-e3bd-1433-06e06d68c093	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c1-e3bd-a97e-70de98c234c4	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c1-e3bd-f97b-6bcd937d278a	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c1-e3bd-6407-40b33b9d0621	0004	Mali oder	t	24	Mali oder 
00220000-55c1-e3bd-7521-65ce361aadc9	0005	Komorni oder	t	15	Komorni oder
00220000-55c1-e3bd-bbd9-8679dc7494d4	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c1-e3bd-50a3-257f027b831b	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3018 (class 0 OID 11918559)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 11918549)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 11918734)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 11918683)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11918253)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 3027 (class 0 OID 11918625)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11918291)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c1-e3bb-633e-5dc2068e6bd3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c1-e3bb-a198-bfd2d23b7b7e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c1-e3bb-dcd4-9e2495be3822	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c1-e3bb-6d83-35a4ce95e18c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c1-e3bb-2938-70e6f58ffab7	planer	Planer dogodkov v koledarju	t
00020000-55c1-e3bb-c0cf-a212a1dbb08a	kadrovska	Kadrovska služba	t
00020000-55c1-e3bb-eea4-94179d8548f3	arhivar	Ažuriranje arhivalij	t
00020000-55c1-e3bb-7c76-795cf1ec4318	igralec	Igralec	t
00020000-55c1-e3bb-a3db-a1625be4f898	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c1-e3bd-6658-ca09ecd7665a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2993 (class 0 OID 11918275)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c1-e3bb-3a69-9271329e34c4	00020000-55c1-e3bb-dcd4-9e2495be3822
00010000-55c1-e3bb-e403-8e9821d2414d	00020000-55c1-e3bb-dcd4-9e2495be3822
00010000-55c1-e3bd-db97-f5c6c85d1a5e	00020000-55c1-e3bd-6658-ca09ecd7665a
\.


--
-- TOC entry 3029 (class 0 OID 11918639)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 11918580)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 11918526)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 11918975)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c1-e3bc-5a6b-07639ec54904	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c1-e3bc-ab49-0d323b00847a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c1-e3bc-0daa-9065954eb45a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c1-e3bc-b067-dffe3a4b93f6	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c1-e3bc-305f-d074fdc11d29	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3051 (class 0 OID 11918967)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c1-e3bc-de71-463d23b2f042	00230000-55c1-e3bc-b067-dffe3a4b93f6	popa
00240000-55c1-e3bc-6f09-69e53752caf5	00230000-55c1-e3bc-b067-dffe3a4b93f6	oseba
00240000-55c1-e3bc-bb29-a10a01df253b	00230000-55c1-e3bc-b067-dffe3a4b93f6	sezona
00240000-55c1-e3bc-d764-ca47603e4078	00230000-55c1-e3bc-ab49-0d323b00847a	prostor
00240000-55c1-e3bc-d971-86bc9544fa86	00230000-55c1-e3bc-b067-dffe3a4b93f6	besedilo
00240000-55c1-e3bc-d11a-9c0d533ad09b	00230000-55c1-e3bc-b067-dffe3a4b93f6	uprizoritev
00240000-55c1-e3bc-51e0-f29213ad564d	00230000-55c1-e3bc-b067-dffe3a4b93f6	funkcija
00240000-55c1-e3bc-4048-a782faf8a468	00230000-55c1-e3bc-b067-dffe3a4b93f6	tipfunkcije
00240000-55c1-e3bc-75c9-9535a69ec833	00230000-55c1-e3bc-b067-dffe3a4b93f6	alternacija
00240000-55c1-e3bc-6642-ee4c29421802	00230000-55c1-e3bc-5a6b-07639ec54904	pogodba
00240000-55c1-e3bc-c00e-238c5f3f697f	00230000-55c1-e3bc-b067-dffe3a4b93f6	zaposlitev
00240000-55c1-e3bc-6966-f9a411d852b3	00230000-55c1-e3bc-5a6b-07639ec54904	programdela
00240000-55c1-e3bc-f6a6-70def7b51fa3	00230000-55c1-e3bc-b067-dffe3a4b93f6	zapis
\.


--
-- TOC entry 3050 (class 0 OID 11918962)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 11918693)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c1-e3bd-cb84-138a97074d88	000e0000-55c1-e3bd-c240-4a41b0e403c8	00080000-55c1-e3bd-16b5-cfb15abce17d	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c1-e3bd-b2ed-0c73ce9b2fbb	000e0000-55c1-e3bd-c240-4a41b0e403c8	00080000-55c1-e3bd-16b5-cfb15abce17d	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c1-e3bd-d84c-47168d59c8d6	000e0000-55c1-e3bd-c240-4a41b0e403c8	00080000-55c1-e3bd-d349-d78843a482ce	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c1-e3bd-c890-78078a19d2dc	000e0000-55c1-e3bd-c240-4a41b0e403c8	00080000-55c1-e3bd-d349-d78843a482ce	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3000 (class 0 OID 11918353)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 11918536)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c1-e3bd-c18b-9ad875e8418d	00180000-55c1-e3bd-fc45-bce9268b2fb9	000c0000-55c1-e3bd-f76a-9d9508616ca3	00090000-55c1-e3bd-0f42-ef0afe61874a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c1-e3bd-f2d6-e88792f04f66	00180000-55c1-e3bd-fc45-bce9268b2fb9	000c0000-55c1-e3bd-bf95-44111c0d3202	00090000-55c1-e3bd-dc18-9123e4449821	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c1-e3bd-016d-3cb3d6200b15	00180000-55c1-e3bd-fc45-bce9268b2fb9	000c0000-55c1-e3bd-4e72-df6c5909104a	00090000-55c1-e3bd-88e0-bc46594932d9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c1-e3bd-f30c-f65885d5f851	00180000-55c1-e3bd-fc45-bce9268b2fb9	000c0000-55c1-e3bd-da07-b79ee51eda28	00090000-55c1-e3bd-af7d-ee58a091950c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c1-e3bd-95bc-ef90d07de531	00180000-55c1-e3bd-fc45-bce9268b2fb9	000c0000-55c1-e3bd-ba5b-e535807d4b5d	00090000-55c1-e3bd-a9d1-6f48fadd6ba3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c1-e3bd-b3ad-08487e990fe0	00180000-55c1-e3bd-7ae4-f7fa51f510bd	\N	00090000-55c1-e3bd-a9d1-6f48fadd6ba3	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3036 (class 0 OID 11918723)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c1-e3bc-c374-ee92a1d08312	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c1-e3bc-1c07-ea9d57e52d38	Priredba	Priredba	Priredba	umetnik
000f0000-55c1-e3bc-87b9-e34915ac2933	Prevod	Prevod	Prevod	umetnik
000f0000-55c1-e3bc-d85a-3f5aacd1b387	Režija	Režija	Režija	umetnik
000f0000-55c1-e3bc-4287-a02e56ca04a0	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c1-e3bc-732c-0c4cc9ebbf3e	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c1-e3bc-b458-4ac539dc7b40	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c1-e3bc-ffb9-a60c6e7cecbe	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c1-e3bc-1717-f57684b553eb	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c1-e3bc-05fb-aa238f8ca830	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c1-e3bc-aa4e-019ac0820de0	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c1-e3bc-a6c1-a776399f817d	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c1-e3bc-7f45-06fc9ddde7c4	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c1-e3bc-b8b6-5e601bf79152	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c1-e3bc-a57f-6ba8d1a0bfee	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c1-e3bc-b71d-4553225934ec	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c1-e3bc-0bc2-64cb98be1b07	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c1-e3bc-18e7-93591ebd0d94	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3048 (class 0 OID 11918944)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c1-e3bc-f859-af9f55cf5cde	01	Velika predstava	f	1.00	1.00
002b0000-55c1-e3bc-9e79-dff5fba50d1f	02	Mala predstava	f	0.50	0.50
002b0000-55c1-e3bc-15c7-b9d298f6cc3d	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c1-e3bc-b175-dc154833ea02	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c1-e3bc-8469-984acc027ac3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3005 (class 0 OID 11918416)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 11918262)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c1-e3bb-e403-8e9821d2414d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROXBB/CsLw8c1BB6/fueKxAVOtwWkgyTm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c1-e3bd-52f8-8c6d0b9d6500	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c1-e3bd-57e2-385ba2562030	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c1-e3bd-41cf-5f74baba7c42	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c1-e3bd-afc4-a4366aea6c28	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c1-e3bd-9212-f46e911b61db	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c1-e3bd-ef72-3a4e9fef164b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c1-e3bd-5376-9adec58be0f7	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c1-e3bd-8f4d-ee73ffc1be2c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c1-e3bd-5eb1-d64720f0db79	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c1-e3bd-db97-f5c6c85d1a5e	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c1-e3bb-3a69-9271329e34c4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 11918771)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c1-e3bd-2f16-a8ee70e0fb9e	00160000-55c1-e3bd-56ed-b4d320d0a624	00150000-55c1-e3bc-bd0c-0aa8f6f6300a	00140000-55c1-e3bb-4189-3c3455669225	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c1-e3bd-7521-65ce361aadc9
000e0000-55c1-e3bd-c240-4a41b0e403c8	00160000-55c1-e3bd-a0ea-ae64196f7da0	00150000-55c1-e3bc-926f-b1ab190a8872	00140000-55c1-e3bb-ffe4-b57c5d4cd377	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c1-e3bd-bbd9-8679dc7494d4
000e0000-55c1-e3bd-fc6b-44754427bf47	\N	00150000-55c1-e3bc-926f-b1ab190a8872	00140000-55c1-e3bb-ffe4-b57c5d4cd377	00190000-55c1-e3bd-65a0-b10d58d68736	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c1-e3bd-7521-65ce361aadc9
000e0000-55c1-e3bd-a6a6-097b3f354d77	\N	00150000-55c1-e3bc-926f-b1ab190a8872	00140000-55c1-e3bb-ffe4-b57c5d4cd377	00190000-55c1-e3bd-65a0-b10d58d68736	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c1-e3bd-7521-65ce361aadc9
000e0000-55c1-e3bd-8fd4-09c982081f0a	\N	00150000-55c1-e3bc-926f-b1ab190a8872	00140000-55c1-e3bb-ffe4-b57c5d4cd377	00190000-55c1-e3bd-65a0-b10d58d68736	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c1-e3bd-1433-06e06d68c093
\.


--
-- TOC entry 3010 (class 0 OID 11918478)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c1-e3bd-650a-5de7cc9dd8c0	000e0000-55c1-e3bd-c240-4a41b0e403c8	1	
00200000-55c1-e3bd-f08e-a3a4ae4435a6	000e0000-55c1-e3bd-c240-4a41b0e403c8	2	
\.


--
-- TOC entry 3025 (class 0 OID 11918607)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 11919014)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 11918986)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 11919026)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 11918676)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c1-e3bd-9a3d-1bfe5a44cee9	00090000-55c1-e3bd-dc18-9123e4449821	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c1-e3bd-a906-974c62efcacd	00090000-55c1-e3bd-88e0-bc46594932d9	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c1-e3bd-b86c-ce4bedc9ac1a	00090000-55c1-e3bd-abf5-e6dfd964d130	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c1-e3bd-85d4-833472677ae0	00090000-55c1-e3bd-86c2-4f459b2ca249	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c1-e3bd-47be-d9bde8690b76	00090000-55c1-e3bd-0f42-ef0afe61874a	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c1-e3bd-9aee-2b75880534d4	00090000-55c1-e3bd-ff38-dbf9fe26d5e1	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3012 (class 0 OID 11918510)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 11918761)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c1-e3bb-4189-3c3455669225	01	Drama	drama (SURS 01)
00140000-55c1-e3bb-46f3-c52f81ea774b	02	Opera	opera (SURS 02)
00140000-55c1-e3bb-31ab-9eab736cd111	03	Balet	balet (SURS 03)
00140000-55c1-e3bb-2216-ddf5faa5cb73	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c1-e3bb-5920-b1396eca8c5a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c1-e3bb-ffe4-b57c5d4cd377	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c1-e3bb-01cc-9e2807a1e1c1	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3031 (class 0 OID 11918666)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c1-e3bc-97a5-30d153c1fbfb	01	Opera	opera
00150000-55c1-e3bc-789a-a8ad2729051a	02	Opereta	opereta
00150000-55c1-e3bc-7b13-52428b608492	03	Balet	balet
00150000-55c1-e3bc-b34d-5eec87b7f710	04	Plesne prireditve	plesne prireditve
00150000-55c1-e3bc-d885-8646b01449cc	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c1-e3bc-94eb-ccf6c0207aa3	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c1-e3bc-681e-95f8196fea6b	07	Biografska drama	biografska drama
00150000-55c1-e3bc-bd0c-0aa8f6f6300a	08	Komedija	komedija
00150000-55c1-e3bc-60df-2ad359224512	09	Črna komedija	črna komedija
00150000-55c1-e3bc-79a8-92f29d257ea7	10	E-igra	E-igra
00150000-55c1-e3bc-926f-b1ab190a8872	11	Kriminalka	kriminalka
00150000-55c1-e3bc-9b18-c05d20878cda	12	Musical	musical
\.


--
-- TOC entry 2536 (class 2606 OID 11918316)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11918818)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 11918808)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 11918722)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 11919067)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 11918500)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 11918525)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 11918960)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 11918442)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 11918866)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 11918662)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 11918476)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 11918519)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 11918456)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 11918572)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 11919043)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 11919050)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2777 (class 2606 OID 11919075)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 11918599)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 11918414)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 11918325)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2543 (class 2606 OID 11918349)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 11918305)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2527 (class 2606 OID 11918290)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 11918605)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11918638)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 11918756)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 11918378)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 11918402)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 11918578)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 11918392)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 11918463)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 11918590)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 11918923)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 11918931)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 11918914)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 11918942)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 11918622)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 11918563)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 11918554)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 11918744)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 11918690)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 11918261)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11918629)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 11918279)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2529 (class 2606 OID 11918299)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 11918647)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 11918585)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 11918534)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 11918984)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 11918972)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11918966)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 11918703)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 11918358)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 11918545)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 11918733)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 11918954)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 11918427)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 11918274)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 11918787)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 11918485)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 11918613)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 11919024)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 11919008)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 11919032)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 11918681)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 11918514)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 11918769)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 11918674)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 1259 OID 11918507)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 11918704)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2678 (class 1259 OID 11918705)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2763 (class 1259 OID 11919045)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2764 (class 1259 OID 11919044)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2550 (class 1259 OID 11918380)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2497 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2498 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2499 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2642 (class 1259 OID 11918606)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 11919012)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2751 (class 1259 OID 11919011)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2752 (class 1259 OID 11919013)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2753 (class 1259 OID 11919010)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2754 (class 1259 OID 11919009)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2636 (class 1259 OID 11918592)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2637 (class 1259 OID 11918591)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2587 (class 1259 OID 11918486)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2664 (class 1259 OID 11918663)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 11918665)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2666 (class 1259 OID 11918664)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2575 (class 1259 OID 11918458)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2576 (class 1259 OID 11918457)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2733 (class 1259 OID 11918943)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2687 (class 1259 OID 11918758)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2688 (class 1259 OID 11918759)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2689 (class 1259 OID 11918760)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2760 (class 1259 OID 11919033)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2511 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2512 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2696 (class 1259 OID 11918792)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2697 (class 1259 OID 11918789)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2698 (class 1259 OID 11918793)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2699 (class 1259 OID 11918791)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2700 (class 1259 OID 11918790)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2565 (class 1259 OID 11918429)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 11918428)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2502 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2541 (class 1259 OID 11918352)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2652 (class 1259 OID 11918630)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 11918520)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 11918306)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2532 (class 1259 OID 11918307)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2657 (class 1259 OID 11918650)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2658 (class 1259 OID 11918649)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 11918648)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2579 (class 1259 OID 11918464)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 11918466)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2581 (class 1259 OID 11918465)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2743 (class 1259 OID 11918974)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2616 (class 1259 OID 11918558)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2617 (class 1259 OID 11918556)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2618 (class 1259 OID 11918555)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2619 (class 1259 OID 11918557)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2522 (class 1259 OID 11918280)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2523 (class 1259 OID 11918281)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2645 (class 1259 OID 11918614)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2773 (class 1259 OID 11919068)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2774 (class 1259 OID 11919076)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2775 (class 1259 OID 11919077)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2631 (class 1259 OID 11918579)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2673 (class 1259 OID 11918691)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2674 (class 1259 OID 11918692)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2717 (class 1259 OID 11918871)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2718 (class 1259 OID 11918870)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2719 (class 1259 OID 11918867)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2720 (class 1259 OID 11918868)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2721 (class 1259 OID 11918869)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2554 (class 1259 OID 11918394)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2555 (class 1259 OID 11918393)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2556 (class 1259 OID 11918395)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2515 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2725 (class 1259 OID 11918924)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2726 (class 1259 OID 11918925)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2710 (class 1259 OID 11918822)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2711 (class 1259 OID 11918823)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2712 (class 1259 OID 11918820)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2713 (class 1259 OID 11918821)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2670 (class 1259 OID 11918682)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2622 (class 1259 OID 11918567)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2623 (class 1259 OID 11918566)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2624 (class 1259 OID 11918564)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2625 (class 1259 OID 11918565)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2493 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2706 (class 1259 OID 11918810)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2707 (class 1259 OID 11918809)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 11918915)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2586 (class 1259 OID 11918477)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 11918961)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2767 (class 1259 OID 11919051)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2768 (class 1259 OID 11919052)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2537 (class 1259 OID 11918327)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2538 (class 1259 OID 11918326)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2546 (class 1259 OID 11918359)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 11918360)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 11918548)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2612 (class 1259 OID 11918547)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2613 (class 1259 OID 11918546)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2506 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2507 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2508 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2593 (class 1259 OID 11918509)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2594 (class 1259 OID 11918505)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2595 (class 1259 OID 11918502)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2596 (class 1259 OID 11918503)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2597 (class 1259 OID 11918501)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2598 (class 1259 OID 11918506)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2599 (class 1259 OID 11918504)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2553 (class 1259 OID 11918379)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 11918443)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 11918445)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2573 (class 1259 OID 11918444)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2574 (class 1259 OID 11918446)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2630 (class 1259 OID 11918573)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2692 (class 1259 OID 11918757)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2701 (class 1259 OID 11918788)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 11918350)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 11918351)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2667 (class 1259 OID 11918675)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2749 (class 1259 OID 11918985)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 11918415)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2746 (class 1259 OID 11918973)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2650 (class 1259 OID 11918624)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2651 (class 1259 OID 11918623)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2714 (class 1259 OID 11918819)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2496 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2561 (class 1259 OID 11918403)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 11918770)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2757 (class 1259 OID 11919025)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2731 (class 1259 OID 11918932)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2732 (class 1259 OID 11918933)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 11918535)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 11918300)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2600 (class 1259 OID 11918508)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2803 (class 2606 OID 11919213)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2806 (class 2606 OID 11919198)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2805 (class 2606 OID 11919203)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2801 (class 2606 OID 11919223)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2807 (class 2606 OID 11919193)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2802 (class 2606 OID 11919218)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2804 (class 2606 OID 11919208)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2837 (class 2606 OID 11919368)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2836 (class 2606 OID 11919373)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2870 (class 2606 OID 11919543)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2871 (class 2606 OID 11919538)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2788 (class 2606 OID 11919128)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2824 (class 2606 OID 11919308)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2865 (class 2606 OID 11919523)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2866 (class 2606 OID 11919518)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2864 (class 2606 OID 11919528)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 11919513)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2868 (class 2606 OID 11919508)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2822 (class 2606 OID 11919303)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2823 (class 2606 OID 11919298)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2800 (class 2606 OID 11919188)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2832 (class 2606 OID 11919338)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2830 (class 2606 OID 11919348)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2831 (class 2606 OID 11919343)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2794 (class 2606 OID 11919163)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2795 (class 2606 OID 11919158)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2820 (class 2606 OID 11919288)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2861 (class 2606 OID 11919493)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2840 (class 2606 OID 11919378)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2839 (class 2606 OID 11919383)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 11919388)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2869 (class 2606 OID 11919533)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2842 (class 2606 OID 11919408)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2845 (class 2606 OID 11919393)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2841 (class 2606 OID 11919413)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2843 (class 2606 OID 11919403)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2844 (class 2606 OID 11919398)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2792 (class 2606 OID 11919153)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2793 (class 2606 OID 11919148)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2784 (class 2606 OID 11919113)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2785 (class 2606 OID 11919108)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2826 (class 2606 OID 11919318)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2808 (class 2606 OID 11919228)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2781 (class 2606 OID 11919088)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2780 (class 2606 OID 11919093)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2827 (class 2606 OID 11919333)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2828 (class 2606 OID 11919328)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2829 (class 2606 OID 11919323)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2798 (class 2606 OID 11919168)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2796 (class 2606 OID 11919178)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2797 (class 2606 OID 11919173)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2863 (class 2606 OID 11919503)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2812 (class 2606 OID 11919263)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2814 (class 2606 OID 11919253)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2815 (class 2606 OID 11919248)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2813 (class 2606 OID 11919258)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2779 (class 2606 OID 11919078)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2778 (class 2606 OID 11919083)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2825 (class 2606 OID 11919313)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2874 (class 2606 OID 11919558)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 11919563)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2875 (class 2606 OID 11919568)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2821 (class 2606 OID 11919293)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2835 (class 2606 OID 11919358)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2834 (class 2606 OID 11919363)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2852 (class 2606 OID 11919468)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2853 (class 2606 OID 11919463)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 11919448)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2855 (class 2606 OID 11919453)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2854 (class 2606 OID 11919458)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2790 (class 2606 OID 11919138)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 11919133)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 11919143)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2859 (class 2606 OID 11919478)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2858 (class 2606 OID 11919483)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2849 (class 2606 OID 11919438)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2848 (class 2606 OID 11919443)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2851 (class 2606 OID 11919428)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2850 (class 2606 OID 11919433)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2833 (class 2606 OID 11919353)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2816 (class 2606 OID 11919283)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2817 (class 2606 OID 11919278)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2819 (class 2606 OID 11919268)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2818 (class 2606 OID 11919273)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2846 (class 2606 OID 11919423)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 11919418)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2857 (class 2606 OID 11919473)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2799 (class 2606 OID 11919183)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 11919488)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 11919498)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2873 (class 2606 OID 11919548)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2872 (class 2606 OID 11919553)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2782 (class 2606 OID 11919103)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2783 (class 2606 OID 11919098)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2787 (class 2606 OID 11919118)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2786 (class 2606 OID 11919123)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 11919243)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2810 (class 2606 OID 11919238)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2811 (class 2606 OID 11919233)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-05 12:21:50 CEST

--
-- PostgreSQL database dump complete
--

