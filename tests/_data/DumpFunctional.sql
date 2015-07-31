--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-31 16:05:29 CEST

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
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 11351844)
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
-- TOC entry 228 (class 1259 OID 11352343)
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
-- TOC entry 227 (class 1259 OID 11352326)
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
-- TOC entry 221 (class 1259 OID 11352238)
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
-- TOC entry 244 (class 1259 OID 11352559)
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
-- TOC entry 197 (class 1259 OID 11352023)
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
-- TOC entry 200 (class 1259 OID 11352057)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11352461)
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
-- TOC entry 192 (class 1259 OID 11351966)
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
-- TOC entry 229 (class 1259 OID 11352356)
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
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(15,2) DEFAULT 0::numeric NOT NULL,
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
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
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
-- TOC entry 216 (class 1259 OID 11352183)
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
-- TOC entry 195 (class 1259 OID 11352003)
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
-- TOC entry 199 (class 1259 OID 11352051)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11351983)
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
-- TOC entry 205 (class 1259 OID 11352100)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11352540)
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
-- TOC entry 243 (class 1259 OID 11352552)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11352575)
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
-- TOC entry 209 (class 1259 OID 11352125)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11351940)
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
-- TOC entry 184 (class 1259 OID 11351853)
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
-- TOC entry 185 (class 1259 OID 11351864)
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
-- TOC entry 180 (class 1259 OID 11351818)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11351837)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11352132)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11352163)
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
-- TOC entry 224 (class 1259 OID 11352277)
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
-- TOC entry 187 (class 1259 OID 11351897)
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
-- TOC entry 189 (class 1259 OID 11351932)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11352106)
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
-- TOC entry 188 (class 1259 OID 11351917)
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
-- TOC entry 194 (class 1259 OID 11351995)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11352118)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11352421)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 232 (class 1259 OID 11352432)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11352402)
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
    stponprej integer,
    stponprejvelikih integer,
    stponprejmalih integer,
    stponprejmalihkopr integer,
    stponprejsredkopr integer,
    stponprejvelikihkopr integer,
    vrps1 numeric(12,2) DEFAULT NULL::numeric,
    vrps1do numeric(12,2) DEFAULT NULL::numeric,
    vrps1mat numeric(12,2) DEFAULT NULL::numeric,
    vrps1gostovsz numeric(12,2) DEFAULT NULL::numeric,
    stnekomerc integer,
    stizvponprem integer,
    stizvprej integer,
    stizvgostuj integer,
    stizvostalihnek integer,
    stgostovanjslo integer,
    stgostovanjzam integer,
    stgostovanjint integer,
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
    sredstvaavt numeric(12,2) DEFAULT NULL::numeric
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
-- TOC entry 233 (class 1259 OID 11352440)
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
-- TOC entry 212 (class 1259 OID 11352147)
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
-- TOC entry 204 (class 1259 OID 11352091)
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
-- TOC entry 203 (class 1259 OID 11352081)
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
-- TOC entry 223 (class 1259 OID 11352266)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11352215)
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
-- TOC entry 177 (class 1259 OID 11351789)
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
-- TOC entry 176 (class 1259 OID 11351787)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 11352157)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11351827)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11351811)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11352171)
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
-- TOC entry 207 (class 1259 OID 11352112)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11352062)
-- Name: sezona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sezona (
    id uuid NOT NULL,
    imesezone character varying(255) DEFAULT NULL::character varying,
    zacetek date,
    konec date,
    aktivna boolean
);


--
-- TOC entry 238 (class 1259 OID 11352481)
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
-- TOC entry 237 (class 1259 OID 11352473)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11352468)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11352225)
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
-- TOC entry 186 (class 1259 OID 11351889)
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
-- TOC entry 202 (class 1259 OID 11352068)
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
-- TOC entry 222 (class 1259 OID 11352255)
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
-- TOC entry 234 (class 1259 OID 11352450)
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
-- TOC entry 191 (class 1259 OID 11351952)
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
-- TOC entry 178 (class 1259 OID 11351798)
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
-- TOC entry 226 (class 1259 OID 11352303)
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
-- TOC entry 196 (class 1259 OID 11352014)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11352139)
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
-- TOC entry 240 (class 1259 OID 11352520)
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
-- TOC entry 239 (class 1259 OID 11352492)
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
-- TOC entry 241 (class 1259 OID 11352532)
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
-- TOC entry 218 (class 1259 OID 11352208)
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
-- TOC entry 198 (class 1259 OID 11352046)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11352293)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11352198)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2245 (class 2604 OID 11351792)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2969 (class 0 OID 11351844)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 11352343)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55bb-80a8-56b7-1f55051564e4	000d0000-55bb-80a8-b727-ad2cea91147f	\N	00090000-55bb-80a8-bfcd-d49a82a2eada	000b0000-55bb-80a8-8988-088451fb2ad2	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55bb-80a8-d386-ce61efa0abac	000d0000-55bb-80a8-4f72-f58c41b5c7c9	00100000-55bb-80a8-b0b3-89032a5cf9b9	00090000-55bb-80a8-d55b-12729c6461be	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55bb-80a8-ae1b-2c6ff7286981	000d0000-55bb-80a8-2937-8393d3d07f1b	00100000-55bb-80a8-8166-1ebc831e9a7e	00090000-55bb-80a8-9faa-3571f4fef240	\N	0003	t	\N	2015-07-31	\N	2	\N	\N	f	f
000c0000-55bb-80a8-fa20-270b16824a8b	000d0000-55bb-80a8-3a6a-e76fa8e8258b	\N	00090000-55bb-80a8-0901-ee7582ba5197	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55bb-80a8-ec77-1f614d6d96f7	000d0000-55bb-80a8-9de6-d3a5ef87f14d	\N	00090000-55bb-80a8-7d8f-35f301b20a6d	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55bb-80a8-75d0-ad43a2bfc73b	000d0000-55bb-80a8-177f-053153eccfa9	\N	00090000-55bb-80a8-dfa3-de5f66b8dea6	000b0000-55bb-80a8-9f94-fe36c8b46b05	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55bb-80a8-2233-2994c0cf27c2	000d0000-55bb-80a8-7584-033c62b4f4f6	00100000-55bb-80a8-56c7-47ffb1666c8b	00090000-55bb-80a8-81f4-8f2b0628332a	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55bb-80a8-1920-2e357f5b05ed	000d0000-55bb-80a8-7f9b-be9b035efe5e	\N	00090000-55bb-80a8-434c-698c3dabfa08	000b0000-55bb-80a8-7dcb-7693336bca90	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55bb-80a8-dca8-feeb508f3d76	000d0000-55bb-80a8-7584-033c62b4f4f6	00100000-55bb-80a8-f8af-d25efafb5d95	00090000-55bb-80a8-c723-f38753b451f9	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55bb-80a8-2aaa-114c5355be29	000d0000-55bb-80a8-7584-033c62b4f4f6	00100000-55bb-80a8-6ea6-8c3397f4631a	00090000-55bb-80a8-9337-243c7d0c85b5	\N	0010	t	\N	2015-07-31	\N	16	\N	\N	f	t
000c0000-55bb-80a8-9fd9-23ef9a80d68f	000d0000-55bb-80a8-7584-033c62b4f4f6	00100000-55bb-80a8-b6a1-1be58ffb9268	00090000-55bb-80a8-d164-e71f07b723f4	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3013 (class 0 OID 11352326)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11352238)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55bb-80a8-d895-8c609e130d26	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55bb-80a8-69fb-f94d53a77ad8	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55bb-80a8-bcd9-a59ff395be27	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3030 (class 0 OID 11352559)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 11352023)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55bb-80a8-50c5-4800e30aadc4	\N	\N	00200000-55bb-80a8-4a6d-c21377b55e9b	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55bb-80a8-4be4-afe47352437a	\N	\N	00200000-55bb-80a8-e480-bc8c589b9fcf	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55bb-80a8-3b49-0e0ace74c87c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55bb-80a8-d330-c33842800295	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55bb-80a8-d96d-31fd43d7ea5e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2986 (class 0 OID 11352057)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 11352461)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11351966)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55bb-80a6-8ce6-567dd6a372a0	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55bb-80a6-2bb7-01bb7ddd1d5e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55bb-80a6-6c6d-09002d30fb42	AL	ALB	008	Albania 	Albanija	\N
00040000-55bb-80a6-a68e-9ec5d6a39c00	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55bb-80a6-8e27-5c9c6084b1f2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55bb-80a6-4d35-a5951161f8b0	AD	AND	020	Andorra 	Andora	\N
00040000-55bb-80a6-8cb5-41a97189c7d2	AO	AGO	024	Angola 	Angola	\N
00040000-55bb-80a6-0b70-9c579a52f8c5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55bb-80a6-da14-711d1e14ab2a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55bb-80a6-a614-ed3d5b9ef799	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55bb-80a6-dad7-67ea6546da7f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55bb-80a6-47a4-a96aa86f4e7c	AM	ARM	051	Armenia 	Armenija	\N
00040000-55bb-80a6-99bb-d4b8e1d51c98	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55bb-80a6-65d1-d628fd4b4180	AU	AUS	036	Australia 	Avstralija	\N
00040000-55bb-80a6-6294-936414a7fb60	AT	AUT	040	Austria 	Avstrija	\N
00040000-55bb-80a6-ab28-502ff3973188	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55bb-80a6-75d0-ff2bb2392744	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55bb-80a6-5b06-082c7aef5b69	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55bb-80a6-1af6-0d37a10cb641	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55bb-80a6-c0b3-0b1ad75fe81c	BB	BRB	052	Barbados 	Barbados	\N
00040000-55bb-80a6-182a-0505875c3369	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55bb-80a6-d933-03f8b7f07531	BE	BEL	056	Belgium 	Belgija	\N
00040000-55bb-80a6-f5de-45361ed197b9	BZ	BLZ	084	Belize 	Belize	\N
00040000-55bb-80a6-ffe6-061610bd5af0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55bb-80a6-1eb5-f289a844b91e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55bb-80a6-93c6-c71dc40982c0	BT	BTN	064	Bhutan 	Butan	\N
00040000-55bb-80a6-6022-ace2b5994d82	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55bb-80a6-e233-f068b316164b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55bb-80a6-72c2-097eae5b3529	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55bb-80a6-73c5-e110a1bea970	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55bb-80a6-d8f0-b88f20dde7ce	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55bb-80a6-46cc-7c9cf666f72f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55bb-80a6-2f11-dc58984ddafc	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55bb-80a6-78b4-75fb3292a321	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55bb-80a6-3273-21f13c487662	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55bb-80a6-0c80-dac05a61ac2e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55bb-80a6-4acc-ad7d40932370	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55bb-80a6-728b-614e50818fad	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55bb-80a6-7a73-ac7e80cf8c10	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55bb-80a6-8d0a-413e7b021ce6	CA	CAN	124	Canada 	Kanada	\N
00040000-55bb-80a6-5bee-8438c0aeaafc	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55bb-80a6-ea46-dd3c794e4240	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55bb-80a6-2ce8-92c301aef7ee	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55bb-80a6-17ac-84dbb73ce166	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55bb-80a6-5b55-e683b5fe44ba	CL	CHL	152	Chile 	Čile	\N
00040000-55bb-80a6-714c-e548011c6cb1	CN	CHN	156	China 	Kitajska	\N
00040000-55bb-80a6-d0d8-77a477881a35	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55bb-80a6-a808-af98804e9b59	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55bb-80a6-e240-2688597c58ac	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55bb-80a6-7e68-d90bced7c9d5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55bb-80a6-2ce3-4d53efe0c3fe	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55bb-80a6-03a9-426a66447f70	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55bb-80a6-ed6a-eefab96a41dc	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55bb-80a6-0197-8aa137f557f3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55bb-80a6-57fa-c45b197bd38b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55bb-80a6-0c78-284294492920	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55bb-80a6-e663-63c1a26fb816	CU	CUB	192	Cuba 	Kuba	\N
00040000-55bb-80a6-9c3f-af49e3118f22	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55bb-80a6-edb5-650884cd6b73	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55bb-80a6-52c1-4c3c418ee389	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55bb-80a6-a639-4800878ccbd0	DK	DNK	208	Denmark 	Danska	\N
00040000-55bb-80a6-b895-1a64da26b53c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55bb-80a6-cca0-46728517d84d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55bb-80a6-d97b-ee5e6536bc42	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55bb-80a6-8258-d4df67bd7e9a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55bb-80a6-c89d-7098e4458a64	EG	EGY	818	Egypt 	Egipt	\N
00040000-55bb-80a6-b09a-5d0505363176	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55bb-80a6-a957-ca2ecb71eae0	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55bb-80a6-314b-76942d555639	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55bb-80a6-37eb-fc18440c80e8	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55bb-80a6-4077-48eb334ea6e8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55bb-80a6-00b3-3798945dab3c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55bb-80a6-15af-0e917bda97fa	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55bb-80a6-cf45-838bcd4919d3	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55bb-80a6-0eb2-515230b353cc	FI	FIN	246	Finland 	Finska	\N
00040000-55bb-80a6-dbbe-587264c2c176	FR	FRA	250	France 	Francija	\N
00040000-55bb-80a6-2533-c85626af1671	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55bb-80a6-9a64-42a94ee2a03f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55bb-80a6-54c8-f34fdae306d0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55bb-80a6-7e81-1bdff6b89d81	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55bb-80a6-ef1c-23c75c846e7d	GA	GAB	266	Gabon 	Gabon	\N
00040000-55bb-80a6-aae5-33a6c68f28dc	GM	GMB	270	Gambia 	Gambija	\N
00040000-55bb-80a6-d5a6-993e74ba38a7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55bb-80a6-3024-d9a1b20076bf	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55bb-80a6-96ab-93831e078054	GH	GHA	288	Ghana 	Gana	\N
00040000-55bb-80a6-a945-b94bdb3c93b8	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55bb-80a6-4bb9-56ef738c9ddd	GR	GRC	300	Greece 	Grčija	\N
00040000-55bb-80a6-1456-d3fef5b79e10	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55bb-80a6-c221-42510f5ac84a	GD	GRD	308	Grenada 	Grenada	\N
00040000-55bb-80a6-d760-cf069c0992ed	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55bb-80a6-95d3-d565d8f073b0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55bb-80a6-b8fd-209ef00c0633	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55bb-80a6-b77c-7330ecf9afa5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55bb-80a6-919b-60e0116032cd	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55bb-80a6-5e5b-7c8109af0bb8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55bb-80a6-e830-ad5debc9d75c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55bb-80a6-edd3-5db35ba26872	HT	HTI	332	Haiti 	Haiti	\N
00040000-55bb-80a6-1203-262b363dfe5e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55bb-80a6-f3c3-de1bb969caa1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55bb-80a6-53b6-052797fc53d7	HN	HND	340	Honduras 	Honduras	\N
00040000-55bb-80a6-a314-9beffaf23647	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55bb-80a6-ef27-f55220a00045	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55bb-80a6-4095-e1ae07ae1845	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55bb-80a6-9ea9-fde9fd78533b	IN	IND	356	India 	Indija	\N
00040000-55bb-80a6-16ec-9b8e69357d8e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55bb-80a6-97a4-edd5d3ee35c5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55bb-80a6-f491-77a1385266bf	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55bb-80a6-d873-c41de740c77b	IE	IRL	372	Ireland 	Irska	\N
00040000-55bb-80a6-6905-1d87cb9c9a99	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55bb-80a6-fd79-6b8a9ec9af18	IL	ISR	376	Israel 	Izrael	\N
00040000-55bb-80a6-e071-3f83d8ca7d6e	IT	ITA	380	Italy 	Italija	\N
00040000-55bb-80a6-075e-50025cc6f958	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55bb-80a6-283f-11cca7870ea6	JP	JPN	392	Japan 	Japonska	\N
00040000-55bb-80a6-a9d2-ba7db2af7cff	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55bb-80a6-6778-4fbb58f010b8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55bb-80a6-11e4-6f4776f34d9d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55bb-80a6-6942-acb7e92c1e41	KE	KEN	404	Kenya 	Kenija	\N
00040000-55bb-80a6-bae1-fe2a5c7f6996	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55bb-80a6-5546-cc29e198e8e3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55bb-80a6-7bb5-ea2438e3da08	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55bb-80a6-9c14-ce63b4551200	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55bb-80a6-8f6c-4b618ad5f87b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55bb-80a6-2f4f-785bf0ee209f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55bb-80a6-3a2c-d6a2c1cb3c31	LV	LVA	428	Latvia 	Latvija	\N
00040000-55bb-80a6-a0d2-4f51ba04c2d2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55bb-80a6-e042-971fbb57aa40	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55bb-80a6-954d-7e9094bad4da	LR	LBR	430	Liberia 	Liberija	\N
00040000-55bb-80a6-d31e-7603fe56b6ba	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55bb-80a6-848d-a33e81e43315	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55bb-80a6-2449-874fb5971a20	LT	LTU	440	Lithuania 	Litva	\N
00040000-55bb-80a6-9f42-da4862f9c832	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55bb-80a6-7695-e8fc0478971f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55bb-80a6-8580-5d69a9430802	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55bb-80a6-eb51-26f0191031bb	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55bb-80a6-7c4b-e5e5c76a97f6	MW	MWI	454	Malawi 	Malavi	\N
00040000-55bb-80a6-17b9-d72fcde1e761	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55bb-80a6-c4fc-a2a3c1b3915a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55bb-80a6-f6ff-e0264b178fcd	ML	MLI	466	Mali 	Mali	\N
00040000-55bb-80a6-d95f-873c3cba7410	MT	MLT	470	Malta 	Malta	\N
00040000-55bb-80a6-6f16-13cc607fae5f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55bb-80a6-28c9-e9d3e82bbc92	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55bb-80a6-b241-037510c7a356	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55bb-80a6-596a-cb67be22223f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55bb-80a6-ce0e-0dd57882fbcd	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55bb-80a6-7d3e-d3ef8b437a21	MX	MEX	484	Mexico 	Mehika	\N
00040000-55bb-80a6-de64-d36d94eb839d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55bb-80a6-43af-5ec8b6385297	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55bb-80a6-8948-3a3fef2b9892	MC	MCO	492	Monaco 	Monako	\N
00040000-55bb-80a6-efb7-76a5eafdf60b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55bb-80a6-ce76-7c913b130ccc	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55bb-80a6-a3ba-fc0b707e3686	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55bb-80a6-5c49-bef498aeb2b6	MA	MAR	504	Morocco 	Maroko	\N
00040000-55bb-80a6-8055-8985ee26bccc	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55bb-80a6-04d8-634279b2d018	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55bb-80a6-7ba7-2c1817b8db7e	NA	NAM	516	Namibia 	Namibija	\N
00040000-55bb-80a6-682d-8aced14ba9b5	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55bb-80a6-8aef-b094acb3b9dd	NP	NPL	524	Nepal 	Nepal	\N
00040000-55bb-80a6-5c72-e4618d24c5d0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55bb-80a6-58be-f04dfc735c22	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55bb-80a6-dc78-9ab87e68c34f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55bb-80a6-09fc-cb7ed57e5c94	NE	NER	562	Niger 	Niger 	\N
00040000-55bb-80a6-eb87-01bbfc8c07a8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55bb-80a6-e7d8-9314c89a57aa	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55bb-80a6-9e02-c8b945e7a69c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55bb-80a6-c2ea-55f0a9da138c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55bb-80a6-5653-9041991bf383	NO	NOR	578	Norway 	Norveška	\N
00040000-55bb-80a6-2805-b839f73cab3e	OM	OMN	512	Oman 	Oman	\N
00040000-55bb-80a6-9d30-1093f1ea1f94	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55bb-80a6-8326-a980759adb19	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55bb-80a6-df7c-28b3f63ce957	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55bb-80a6-eb6b-29a434a995e0	PA	PAN	591	Panama 	Panama	\N
00040000-55bb-80a6-db23-57537e3bfc9a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55bb-80a6-98fe-813adc1875f6	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55bb-80a6-32f2-07dcd124f19e	PE	PER	604	Peru 	Peru	\N
00040000-55bb-80a6-b315-0f5e4fddd764	PH	PHL	608	Philippines 	Filipini	\N
00040000-55bb-80a6-c7fe-31ce9cbfba8d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55bb-80a6-229d-a8d7ac25699c	PL	POL	616	Poland 	Poljska	\N
00040000-55bb-80a6-75f7-223725b9edfd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55bb-80a6-3cba-f00ab5959b24	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55bb-80a6-c98e-9504b4013c89	QA	QAT	634	Qatar 	Katar	\N
00040000-55bb-80a6-7ae1-5287b8fafa1b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55bb-80a6-c156-2806b47003fb	RO	ROU	642	Romania 	Romunija	\N
00040000-55bb-80a6-27e8-e5a845374c4e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55bb-80a6-b929-0b90d45a699d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55bb-80a6-b33b-4b690f2e19b5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55bb-80a6-90a9-edcbaf79c8db	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55bb-80a6-db0c-94e396951591	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55bb-80a6-fd82-5f2f0ecd30f1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55bb-80a6-4638-effc7fbf1fa9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55bb-80a6-15fb-5f00db0bddde	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55bb-80a6-c2e5-8281e233e84c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55bb-80a6-242e-a51b14b89b58	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55bb-80a6-34e3-3dff00f9e58e	SM	SMR	674	San Marino 	San Marino	\N
00040000-55bb-80a6-bde1-94f31c0d70cc	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55bb-80a6-2cf0-95c002f07500	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55bb-80a6-5ff4-40a84f72c450	SN	SEN	686	Senegal 	Senegal	\N
00040000-55bb-80a6-c36f-587f586617f6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55bb-80a6-a180-f2a8ed653967	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55bb-80a6-a29c-5a4ece54ac43	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55bb-80a6-05a3-8209bdae77d7	SG	SGP	702	Singapore 	Singapur	\N
00040000-55bb-80a6-87ea-d2368f3d5cb2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55bb-80a6-693a-0b2b48591a45	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55bb-80a6-82e7-559fd215f6f0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55bb-80a6-ac64-4aaad574f6c1	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55bb-80a6-d597-f08a7c5b26f6	SO	SOM	706	Somalia 	Somalija	\N
00040000-55bb-80a6-03ff-d1c1d1b8e039	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55bb-80a6-f604-2fb3e1d1e1d5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55bb-80a6-adaa-295ed94c17b2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55bb-80a6-1856-1e93fb9e73c9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55bb-80a6-3a64-4e216a3ccda0	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55bb-80a6-bd94-f138616bafd0	SD	SDN	729	Sudan 	Sudan	\N
00040000-55bb-80a6-7aec-3a4c94ed4604	SR	SUR	740	Suriname 	Surinam	\N
00040000-55bb-80a6-0ae5-fd9ae86bbd26	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55bb-80a6-d229-ec2f34fefdf7	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55bb-80a6-282c-3e9391df7132	SE	SWE	752	Sweden 	Švedska	\N
00040000-55bb-80a6-ee5b-8777c1a1a57b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55bb-80a6-ebd8-880addc39efb	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55bb-80a6-5eab-8dab1bf6802c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55bb-80a6-a617-f1427eea2d7b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55bb-80a6-c7e2-429f640e4673	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55bb-80a6-7288-f576cfc48a97	TH	THA	764	Thailand 	Tajska	\N
00040000-55bb-80a6-3fa8-059ad2fcbc4b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55bb-80a6-babb-338be43e4124	TG	TGO	768	Togo 	Togo	\N
00040000-55bb-80a6-a439-44648b051dcc	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55bb-80a6-4cbc-26024495c0df	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55bb-80a6-8b21-8528c8ac5a8a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55bb-80a6-ed1a-4a6cd91e6d59	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55bb-80a6-1464-d2843e3e95c5	TR	TUR	792	Turkey 	Turčija	\N
00040000-55bb-80a6-0910-87a9277dbc8e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55bb-80a6-667a-7e28450bd98b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bb-80a6-ff8c-6c6abbc22f9b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55bb-80a6-9ab1-253291495307	UG	UGA	800	Uganda 	Uganda	\N
00040000-55bb-80a6-8fb6-a8d28a27636b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55bb-80a6-996a-dc79691c23c7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55bb-80a6-009a-fd23d854f901	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55bb-80a6-f93e-41447b88d558	US	USA	840	United States 	Združene države Amerike	\N
00040000-55bb-80a6-aaa4-df103a241250	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55bb-80a6-0423-0fda9a17cb4a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55bb-80a6-533b-7ee0576971bd	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55bb-80a6-3abc-11a7da12a8bc	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55bb-80a6-4c74-052e3fd8432c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55bb-80a6-708d-dcd5bbacbd00	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55bb-80a6-e4ae-2ce04008a7fd	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bb-80a6-ef42-53ba90dc2db3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55bb-80a6-2b44-ffe85babfdc2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55bb-80a6-7f59-4934d72aef9c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55bb-80a6-5727-9423bde37368	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55bb-80a6-3339-a7a0453254b9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55bb-80a6-fd60-abda36873e07	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3015 (class 0 OID 11352356)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55bb-80a8-a4bb-c03487df3a14	000e0000-55bb-80a8-d849-e11de795f40b	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55bb-80a7-2071-614af25ce535	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55bb-80a8-d45f-ffb5f2e0c010	000e0000-55bb-80a8-43f3-f731c5afad20	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55bb-80a7-8b4c-b6f7c4bc38d2	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bb-80a8-cf1a-465d2d41f2b5	\N	\N	\N	300.00	300.00	0.00	0.00	20.00	60.00	200.11	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bb-80a8-1c16-bbd10105289c	\N	\N	\N	203.00	203.00	0.00	0.00	30.00	60.90	100.22	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3002 (class 0 OID 11352183)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55bb-80a8-7584-033c62b4f4f6	000e0000-55bb-80a8-43f3-f731c5afad20	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55bb-80a7-8536-5ee027e3764e
000d0000-55bb-80a8-b727-ad2cea91147f	000e0000-55bb-80a8-43f3-f731c5afad20	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55bb-80a7-8536-5ee027e3764e
000d0000-55bb-80a8-4f72-f58c41b5c7c9	000e0000-55bb-80a8-43f3-f731c5afad20	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55bb-80a7-ae46-71ebac3a74a3
000d0000-55bb-80a8-2937-8393d3d07f1b	000e0000-55bb-80a8-43f3-f731c5afad20	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55bb-80a7-54be-8f2aba9c510c
000d0000-55bb-80a8-3a6a-e76fa8e8258b	000e0000-55bb-80a8-43f3-f731c5afad20	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55bb-80a7-61ee-24cced62e0e4
000d0000-55bb-80a8-9de6-d3a5ef87f14d	000e0000-55bb-80a8-43f3-f731c5afad20	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55bb-80a7-6725-d0c3dcddb1e4
000d0000-55bb-80a8-177f-053153eccfa9	000e0000-55bb-80a8-43f3-f731c5afad20	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55bb-80a7-8536-5ee027e3764e
000d0000-55bb-80a8-7f9b-be9b035efe5e	000e0000-55bb-80a8-43f3-f731c5afad20	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55bb-80a7-86e4-d77d76374957
\.


--
-- TOC entry 2981 (class 0 OID 11352003)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 11352051)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 11351983)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55bb-80a8-5a08-ebc2ff1ad812	00080000-55bb-80a8-ebd9-b9c17adb8868	00090000-55bb-80a8-9337-243c7d0c85b5	AK		
\.


--
-- TOC entry 2956 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11352100)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11352540)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11352552)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 11352575)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11352125)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 11351940)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55bb-80a7-e9cd-6d6acffc882b	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55bb-80a7-8503-992f445173db	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55bb-80a7-829a-b645a8b7b0b8	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55bb-80a7-908b-241f2cf8b326	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55bb-80a7-ab66-9133abcbb5b9	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55bb-80a7-95a9-d0424dce3def	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55bb-80a7-10c0-aae2de37fdc4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55bb-80a7-07c4-de685fedb949	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bb-80a7-943c-71389f062336	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bb-80a7-fe07-11584a438e6b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55bb-80a7-f1a4-ee31263344b1	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55bb-80a7-8dba-139e1b772db9	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55bb-80a7-9c95-f648abfb8986	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55bb-80a7-a417-586b0356cb73	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55bb-80a8-c5b7-cc6bc94cb335	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55bb-80a8-5c95-bb8a8311ee21	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55bb-80a8-a77b-43480a708c4e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55bb-80a8-0748-745dc224d18a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55bb-80a8-3fec-b97e0bed14cf	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55bb-80a8-3e35-c5abfda16f01	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2970 (class 0 OID 11351853)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55bb-80a8-8941-e59f1db7165f	00000000-55bb-80a8-5c95-bb8a8311ee21	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55bb-80a8-b0fd-5f59ab8e4f2b	00000000-55bb-80a8-5c95-bb8a8311ee21	00010000-55bb-80a7-1ee2-9db8a6853c18	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55bb-80a8-f2de-12f7d3e39caf	00000000-55bb-80a8-a77b-43480a708c4e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2971 (class 0 OID 11351864)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55bb-80a8-bfcd-d49a82a2eada	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55bb-80a8-0901-ee7582ba5197	00010000-55bb-80a8-db4c-00f4e44bcf59	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55bb-80a8-9faa-3571f4fef240	00010000-55bb-80a8-3413-d471707cfb28	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55bb-80a8-c723-f38753b451f9	00010000-55bb-80a8-ab9b-4414abcf38a5	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55bb-80a8-d20b-d10a30169cad	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55bb-80a8-dfa3-de5f66b8dea6	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55bb-80a8-d164-e71f07b723f4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55bb-80a8-81f4-8f2b0628332a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55bb-80a8-9337-243c7d0c85b5	00010000-55bb-80a8-844d-9c9e0ac1180d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55bb-80a8-d55b-12729c6461be	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55bb-80a8-75e9-2801243cc6ce	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55bb-80a8-7d8f-35f301b20a6d	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55bb-80a8-434c-698c3dabfa08	00010000-55bb-80a8-dddc-dfcd4969c2da	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2958 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 11351818)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55bb-80a7-aee5-a4bc8601cc80	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55bb-80a7-a512-d20880bc3548	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55bb-80a7-f915-ad68f8990b38	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55bb-80a7-2d70-0f0aa90e7e6a	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55bb-80a7-d72f-34da9e5099e8	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55bb-80a7-a941-f036a92f6789	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55bb-80a7-4b4f-be529da08510	Abonma-read	Abonma - branje	f
00030000-55bb-80a7-d367-73347a6bdf67	Abonma-write	Abonma - spreminjanje	f
00030000-55bb-80a7-f1e2-5ae2ee821379	Alternacija-read	Alternacija - branje	f
00030000-55bb-80a7-19d9-64abd3dab863	Alternacija-write	Alternacija - spreminjanje	f
00030000-55bb-80a7-c308-443d709b8420	Arhivalija-read	Arhivalija - branje	f
00030000-55bb-80a7-684d-ae4bda977eed	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55bb-80a7-dd8c-d504ff862876	Besedilo-read	Besedilo - branje	f
00030000-55bb-80a7-94f2-caeca8af9da6	Besedilo-write	Besedilo - spreminjanje	f
00030000-55bb-80a7-c300-e7655b515192	DogodekIzven-read	DogodekIzven - branje	f
00030000-55bb-80a7-e334-5fc884b327bf	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55bb-80a7-0f46-be54421e0d86	Dogodek-read	Dogodek - branje	f
00030000-55bb-80a7-5b1e-1dd4a9cf0bed	Dogodek-write	Dogodek - spreminjanje	f
00030000-55bb-80a7-0cb2-9eb1a97a8db9	DrugiVir-read	DrugiVir - branje	f
00030000-55bb-80a7-286d-e70b1150695c	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55bb-80a7-3bfb-cbed3c4153b0	Drzava-read	Drzava - branje	f
00030000-55bb-80a7-7bcb-99ea5c51f664	Drzava-write	Drzava - spreminjanje	f
00030000-55bb-80a7-8b82-3baa78d5b238	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55bb-80a7-cd82-4c5de0b1ae53	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55bb-80a7-fc2e-90b8f7d80e13	Funkcija-read	Funkcija - branje	f
00030000-55bb-80a7-428d-b6442febd9a9	Funkcija-write	Funkcija - spreminjanje	f
00030000-55bb-80a7-c7da-ea250ab522d6	Gostovanje-read	Gostovanje - branje	f
00030000-55bb-80a7-ab5d-ba2f17bdaef4	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55bb-80a7-0d73-ee33addd003b	Gostujoca-read	Gostujoca - branje	f
00030000-55bb-80a7-0277-b01e0906f4ad	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55bb-80a7-d8eb-824614c610aa	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55bb-80a7-5a0f-2dd6111632de	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55bb-80a7-941b-dddc507598ef	Kupec-read	Kupec - branje	f
00030000-55bb-80a7-ec13-3a1f089bb295	Kupec-write	Kupec - spreminjanje	f
00030000-55bb-80a7-f778-7d99e718ad65	NacinPlacina-read	NacinPlacina - branje	f
00030000-55bb-80a7-d069-39ce62e02651	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55bb-80a7-6bc0-fd784f6de9ac	Option-read	Option - branje	f
00030000-55bb-80a7-65f5-d41efa7382fc	Option-write	Option - spreminjanje	f
00030000-55bb-80a7-29e8-f59ba49af928	OptionValue-read	OptionValue - branje	f
00030000-55bb-80a7-6543-dc9733735fda	OptionValue-write	OptionValue - spreminjanje	f
00030000-55bb-80a7-5939-78106b8e5335	Oseba-read	Oseba - branje	f
00030000-55bb-80a7-e86e-b9bf825311c8	Oseba-write	Oseba - spreminjanje	f
00030000-55bb-80a7-4f50-b2ea1de2bbe0	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55bb-80a7-1af0-dba18e57b561	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55bb-80a7-7f6f-a81fc80a1f6b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55bb-80a7-c633-e1249165446d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55bb-80a7-bce3-6639d357b216	Pogodba-read	Pogodba - branje	f
00030000-55bb-80a7-3230-50f4e23ec02c	Pogodba-write	Pogodba - spreminjanje	f
00030000-55bb-80a7-d332-41bf2d27d7c6	Popa-read	Popa - branje	f
00030000-55bb-80a7-1de1-755da7c9921c	Popa-write	Popa - spreminjanje	f
00030000-55bb-80a7-5235-6d5b4e1d48df	Posta-read	Posta - branje	f
00030000-55bb-80a7-1737-97073c0e64fb	Posta-write	Posta - spreminjanje	f
00030000-55bb-80a7-0f33-fb6e7397f4e0	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55bb-80a7-d3b3-a1c55806e9df	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55bb-80a7-400f-ddfe576b9568	PostniNaslov-read	PostniNaslov - branje	f
00030000-55bb-80a7-8033-22bfe9415f74	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55bb-80a7-92cf-d98555e1e13f	Predstava-read	Predstava - branje	f
00030000-55bb-80a7-3d83-a4f179123452	Predstava-write	Predstava - spreminjanje	f
00030000-55bb-80a7-951d-2709959d8f71	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55bb-80a7-afa8-6e1fcbf8ad59	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55bb-80a7-6e13-70c3a30e115c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55bb-80a7-94cf-09e1dcbcb25c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55bb-80a7-41ba-72e9ede47292	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55bb-80a7-db96-a52783f65763	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55bb-80a7-230b-7dc7d43168c6	ProgramDela-read	ProgramDela - branje	f
00030000-55bb-80a7-d88b-f3736f4cfcc8	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55bb-80a7-91cd-93b12f1aab8c	ProgramFestival-read	ProgramFestival - branje	f
00030000-55bb-80a7-3af7-dcbd71b05bf0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55bb-80a7-02d4-94933c6ee324	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55bb-80a7-9c05-725c39e2a120	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55bb-80a7-b7d1-b5891c7ca139	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55bb-80a7-b1dc-02eb09594b6e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55bb-80a7-e01a-2d3edc78d559	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55bb-80a7-fe01-9a5fb981b160	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55bb-80a7-a841-b116a0a23fad	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55bb-80a7-56d4-24ca356c2805	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55bb-80a7-e53e-2e9627a12b74	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55bb-80a7-5cc5-37222869fa89	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55bb-80a7-c223-1dac4d7c863f	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55bb-80a7-b346-b02637e26ee9	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55bb-80a7-3054-3e82cfd5acc3	ProgramRazno-read	ProgramRazno - branje	f
00030000-55bb-80a7-5d35-36fb00f76a4d	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55bb-80a7-946c-8a4c6fe64d90	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55bb-80a7-603d-8be2f106b848	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55bb-80a7-8152-8bbbaeca88c2	Prostor-read	Prostor - branje	f
00030000-55bb-80a7-7d49-364712c95988	Prostor-write	Prostor - spreminjanje	f
00030000-55bb-80a7-12ba-445ab5e7861a	Racun-read	Racun - branje	f
00030000-55bb-80a7-f6c3-6acd680a0e70	Racun-write	Racun - spreminjanje	f
00030000-55bb-80a7-0bc8-25fb0b857b2f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55bb-80a7-9afb-ee456db63a88	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55bb-80a7-7bdd-4414d1bbca68	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55bb-80a7-76f8-cf4555b8f1f7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55bb-80a7-8452-617929d2d531	Rekvizit-read	Rekvizit - branje	f
00030000-55bb-80a7-70c7-e10a07d60db8	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55bb-80a7-0176-df5b38941214	Revizija-read	Revizija - branje	f
00030000-55bb-80a7-7d25-17687694f5a4	Revizija-write	Revizija - spreminjanje	f
00030000-55bb-80a7-a37b-ddc7486a8e28	Rezervacija-read	Rezervacija - branje	f
00030000-55bb-80a7-2069-e7b9992d9810	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55bb-80a7-9d37-e3b50a0de7c5	SedezniRed-read	SedezniRed - branje	f
00030000-55bb-80a7-f5ca-43019cc91fef	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55bb-80a7-54b5-1b8c904b5ea9	Sedez-read	Sedez - branje	f
00030000-55bb-80a7-c193-e37d5ffbe225	Sedez-write	Sedez - spreminjanje	f
00030000-55bb-80a7-9714-759c1e8889c1	Sezona-read	Sezona - branje	f
00030000-55bb-80a7-a748-19b953739228	Sezona-write	Sezona - spreminjanje	f
00030000-55bb-80a7-1090-9edc3f2a17c9	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55bb-80a7-ab90-e1148185d5c9	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55bb-80a7-c78e-a329f62a8205	Stevilcenje-read	Stevilcenje - branje	f
00030000-55bb-80a7-ad28-eac423ac3e3b	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55bb-80a7-cf07-851f3ecbe76a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55bb-80a7-a000-8bedb8e77988	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55bb-80a7-bc50-816b7617d6b0	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55bb-80a7-9fcb-a06ec3a4bf58	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55bb-80a7-8234-03de98b66b5a	Telefonska-read	Telefonska - branje	f
00030000-55bb-80a7-680b-369e8a0d8887	Telefonska-write	Telefonska - spreminjanje	f
00030000-55bb-80a7-5b8e-a5c094ad2cc9	TerminStoritve-read	TerminStoritve - branje	f
00030000-55bb-80a7-1812-ce129d3db270	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55bb-80a7-f532-5bf2344e6a0a	TipFunkcije-read	TipFunkcije - branje	f
00030000-55bb-80a7-4ec6-62758ef7d263	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55bb-80a7-ed9a-0b14a89242a3	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55bb-80a7-a0ce-1e8011d0e82d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55bb-80a7-b810-90997fe41603	Trr-read	Trr - branje	f
00030000-55bb-80a7-5f07-52e2606359c1	Trr-write	Trr - spreminjanje	f
00030000-55bb-80a7-6e61-7649bd00c22a	Uprizoritev-read	Uprizoritev - branje	f
00030000-55bb-80a7-ad8d-4928dccc13f0	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55bb-80a7-cfea-f0ff2daed0db	Vaja-read	Vaja - branje	f
00030000-55bb-80a7-0e76-cf43c29028ab	Vaja-write	Vaja - spreminjanje	f
00030000-55bb-80a7-29be-9ac7c7b7ca2a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55bb-80a7-26a8-c786436c16d4	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55bb-80a7-fa67-df0a3eb4b820	Zaposlitev-read	Zaposlitev - branje	f
00030000-55bb-80a7-6559-eeba03cfeffb	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55bb-80a7-607e-3767777b331b	Zasedenost-read	Zasedenost - branje	f
00030000-55bb-80a7-eebd-8ba6aaac607b	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55bb-80a7-59f1-5fd8677c7e71	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55bb-80a7-6ab2-1d03f3e7dbb4	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55bb-80a7-a596-efdeca061033	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55bb-80a7-a3b7-c141dcec4654	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55bb-80a7-9423-2b05aac43e11	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55bb-80a7-a10a-889a20fa05d9	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55bb-80a7-edbb-d93dd331c64b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55bb-80a7-068d-8a2b8ec46a98	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55bb-80a7-a326-c5fc1ee3809e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bb-80a7-27ac-214bd555dbe7	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bb-80a7-b839-791951e7f8dd	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bb-80a7-9dcb-d4d261dc2482	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bb-80a7-e276-4b8bab1dd24c	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55bb-80a7-7108-8efaf557ac12	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55bb-80a7-6f46-e17ed921ce6a	Datoteka-write	Datoteka - spreminjanje	f
00030000-55bb-80a7-32ed-6e24217ff28e	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2968 (class 0 OID 11351837)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55bb-80a7-aa1a-87d70d15db46	00030000-55bb-80a7-a512-d20880bc3548
00020000-55bb-80a7-57db-ed0cc7b08910	00030000-55bb-80a7-3bfb-cbed3c4153b0
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-4b4f-be529da08510
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-d367-73347a6bdf67
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-f1e2-5ae2ee821379
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-19d9-64abd3dab863
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-c308-443d709b8420
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-0f46-be54421e0d86
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-2d70-0f0aa90e7e6a
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-5b1e-1dd4a9cf0bed
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-3bfb-cbed3c4153b0
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-7bcb-99ea5c51f664
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-fc2e-90b8f7d80e13
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-428d-b6442febd9a9
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-c7da-ea250ab522d6
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-ab5d-ba2f17bdaef4
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-0d73-ee33addd003b
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-0277-b01e0906f4ad
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-d8eb-824614c610aa
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-5a0f-2dd6111632de
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-6bc0-fd784f6de9ac
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-29e8-f59ba49af928
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-5939-78106b8e5335
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-e86e-b9bf825311c8
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-d332-41bf2d27d7c6
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-1de1-755da7c9921c
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-5235-6d5b4e1d48df
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-1737-97073c0e64fb
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-400f-ddfe576b9568
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-8033-22bfe9415f74
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-92cf-d98555e1e13f
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-3d83-a4f179123452
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-41ba-72e9ede47292
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-db96-a52783f65763
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-8152-8bbbaeca88c2
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-7d49-364712c95988
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-7bdd-4414d1bbca68
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-76f8-cf4555b8f1f7
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-8452-617929d2d531
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-70c7-e10a07d60db8
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-9714-759c1e8889c1
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-a748-19b953739228
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-f532-5bf2344e6a0a
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-6e61-7649bd00c22a
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-ad8d-4928dccc13f0
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-cfea-f0ff2daed0db
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-0e76-cf43c29028ab
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-607e-3767777b331b
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-eebd-8ba6aaac607b
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-59f1-5fd8677c7e71
00020000-55bb-80a7-36f6-052a5f2ea272	00030000-55bb-80a7-a596-efdeca061033
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-4b4f-be529da08510
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-c308-443d709b8420
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-0f46-be54421e0d86
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-3bfb-cbed3c4153b0
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-c7da-ea250ab522d6
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-0d73-ee33addd003b
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-d8eb-824614c610aa
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-5a0f-2dd6111632de
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-6bc0-fd784f6de9ac
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-29e8-f59ba49af928
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-5939-78106b8e5335
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-e86e-b9bf825311c8
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-d332-41bf2d27d7c6
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-5235-6d5b4e1d48df
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-400f-ddfe576b9568
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-8033-22bfe9415f74
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-92cf-d98555e1e13f
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-8152-8bbbaeca88c2
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-7bdd-4414d1bbca68
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-8452-617929d2d531
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-9714-759c1e8889c1
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-8234-03de98b66b5a
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-680b-369e8a0d8887
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-b810-90997fe41603
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-5f07-52e2606359c1
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-fa67-df0a3eb4b820
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-6559-eeba03cfeffb
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-59f1-5fd8677c7e71
00020000-55bb-80a7-a85f-11842418945f	00030000-55bb-80a7-a596-efdeca061033
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-4b4f-be529da08510
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-f1e2-5ae2ee821379
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-c308-443d709b8420
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-684d-ae4bda977eed
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-dd8c-d504ff862876
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-c300-e7655b515192
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-0f46-be54421e0d86
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-3bfb-cbed3c4153b0
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-fc2e-90b8f7d80e13
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-c7da-ea250ab522d6
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-0d73-ee33addd003b
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-d8eb-824614c610aa
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-6bc0-fd784f6de9ac
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-29e8-f59ba49af928
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-5939-78106b8e5335
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-d332-41bf2d27d7c6
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-5235-6d5b4e1d48df
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-92cf-d98555e1e13f
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-41ba-72e9ede47292
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-8152-8bbbaeca88c2
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-7bdd-4414d1bbca68
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-8452-617929d2d531
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-9714-759c1e8889c1
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-f532-5bf2344e6a0a
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-cfea-f0ff2daed0db
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-607e-3767777b331b
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-59f1-5fd8677c7e71
00020000-55bb-80a7-bbf4-a5425ec3296b	00030000-55bb-80a7-a596-efdeca061033
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-4b4f-be529da08510
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-d367-73347a6bdf67
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-19d9-64abd3dab863
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-c308-443d709b8420
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-0f46-be54421e0d86
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-3bfb-cbed3c4153b0
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-c7da-ea250ab522d6
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-0d73-ee33addd003b
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-6bc0-fd784f6de9ac
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-29e8-f59ba49af928
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-d332-41bf2d27d7c6
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-5235-6d5b4e1d48df
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-92cf-d98555e1e13f
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-8152-8bbbaeca88c2
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-7bdd-4414d1bbca68
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-8452-617929d2d531
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-9714-759c1e8889c1
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-f532-5bf2344e6a0a
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-59f1-5fd8677c7e71
00020000-55bb-80a7-123d-d736dcdad75c	00030000-55bb-80a7-a596-efdeca061033
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-4b4f-be529da08510
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-c308-443d709b8420
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-0f46-be54421e0d86
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-3bfb-cbed3c4153b0
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-c7da-ea250ab522d6
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-0d73-ee33addd003b
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-6bc0-fd784f6de9ac
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-29e8-f59ba49af928
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-d332-41bf2d27d7c6
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-5235-6d5b4e1d48df
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-92cf-d98555e1e13f
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-8152-8bbbaeca88c2
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-7bdd-4414d1bbca68
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-8452-617929d2d531
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-9714-759c1e8889c1
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-5b8e-a5c094ad2cc9
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-f915-ad68f8990b38
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-f532-5bf2344e6a0a
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-59f1-5fd8677c7e71
00020000-55bb-80a7-215d-257d10baf1a1	00030000-55bb-80a7-a596-efdeca061033
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-aee5-a4bc8601cc80
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-a512-d20880bc3548
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-f915-ad68f8990b38
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-2d70-0f0aa90e7e6a
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-d72f-34da9e5099e8
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-a941-f036a92f6789
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-4b4f-be529da08510
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-d367-73347a6bdf67
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-f1e2-5ae2ee821379
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-19d9-64abd3dab863
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-c308-443d709b8420
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-684d-ae4bda977eed
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-dd8c-d504ff862876
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-94f2-caeca8af9da6
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-c300-e7655b515192
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-e334-5fc884b327bf
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-0f46-be54421e0d86
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-5b1e-1dd4a9cf0bed
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-3bfb-cbed3c4153b0
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-7bcb-99ea5c51f664
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-0cb2-9eb1a97a8db9
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-286d-e70b1150695c
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-8b82-3baa78d5b238
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-cd82-4c5de0b1ae53
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-fc2e-90b8f7d80e13
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-428d-b6442febd9a9
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-c7da-ea250ab522d6
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-ab5d-ba2f17bdaef4
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-0d73-ee33addd003b
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-0277-b01e0906f4ad
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-d8eb-824614c610aa
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-5a0f-2dd6111632de
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-941b-dddc507598ef
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-ec13-3a1f089bb295
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-f778-7d99e718ad65
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-d069-39ce62e02651
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-6bc0-fd784f6de9ac
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-65f5-d41efa7382fc
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-29e8-f59ba49af928
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-6543-dc9733735fda
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-5939-78106b8e5335
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-e86e-b9bf825311c8
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-4f50-b2ea1de2bbe0
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-1af0-dba18e57b561
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-7f6f-a81fc80a1f6b
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-c633-e1249165446d
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-bce3-6639d357b216
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-3230-50f4e23ec02c
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-d332-41bf2d27d7c6
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-1de1-755da7c9921c
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-5235-6d5b4e1d48df
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-1737-97073c0e64fb
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-0f33-fb6e7397f4e0
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-d3b3-a1c55806e9df
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-400f-ddfe576b9568
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-8033-22bfe9415f74
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-92cf-d98555e1e13f
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-3d83-a4f179123452
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-951d-2709959d8f71
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-afa8-6e1fcbf8ad59
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-6e13-70c3a30e115c
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-94cf-09e1dcbcb25c
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-41ba-72e9ede47292
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-db96-a52783f65763
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-230b-7dc7d43168c6
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-d88b-f3736f4cfcc8
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-91cd-93b12f1aab8c
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-3af7-dcbd71b05bf0
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-02d4-94933c6ee324
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-9c05-725c39e2a120
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-b7d1-b5891c7ca139
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-b1dc-02eb09594b6e
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-e01a-2d3edc78d559
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-fe01-9a5fb981b160
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-a841-b116a0a23fad
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-56d4-24ca356c2805
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-e53e-2e9627a12b74
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-5cc5-37222869fa89
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-c223-1dac4d7c863f
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-b346-b02637e26ee9
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-3054-3e82cfd5acc3
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-5d35-36fb00f76a4d
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-946c-8a4c6fe64d90
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-603d-8be2f106b848
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-8152-8bbbaeca88c2
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-7d49-364712c95988
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-12ba-445ab5e7861a
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-f6c3-6acd680a0e70
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-0bc8-25fb0b857b2f
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-9afb-ee456db63a88
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-7bdd-4414d1bbca68
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-76f8-cf4555b8f1f7
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-8452-617929d2d531
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-70c7-e10a07d60db8
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-0176-df5b38941214
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-7d25-17687694f5a4
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-a37b-ddc7486a8e28
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-2069-e7b9992d9810
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-9d37-e3b50a0de7c5
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-f5ca-43019cc91fef
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-54b5-1b8c904b5ea9
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-c193-e37d5ffbe225
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-9714-759c1e8889c1
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-a748-19b953739228
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-1090-9edc3f2a17c9
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-ab90-e1148185d5c9
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-c78e-a329f62a8205
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-ad28-eac423ac3e3b
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-cf07-851f3ecbe76a
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-a000-8bedb8e77988
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-bc50-816b7617d6b0
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-9fcb-a06ec3a4bf58
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-8234-03de98b66b5a
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-680b-369e8a0d8887
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-5b8e-a5c094ad2cc9
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-1812-ce129d3db270
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-f532-5bf2344e6a0a
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-4ec6-62758ef7d263
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-ed9a-0b14a89242a3
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-a0ce-1e8011d0e82d
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-b810-90997fe41603
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-5f07-52e2606359c1
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-6e61-7649bd00c22a
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-ad8d-4928dccc13f0
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-cfea-f0ff2daed0db
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-0e76-cf43c29028ab
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-29be-9ac7c7b7ca2a
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-26a8-c786436c16d4
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-fa67-df0a3eb4b820
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-6559-eeba03cfeffb
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-607e-3767777b331b
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-eebd-8ba6aaac607b
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-59f1-5fd8677c7e71
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-6ab2-1d03f3e7dbb4
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-a596-efdeca061033
00020000-55bb-80a8-39bc-174cb251a946	00030000-55bb-80a7-a3b7-c141dcec4654
\.


--
-- TOC entry 2996 (class 0 OID 11352132)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 11352163)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 11352277)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55bb-80a8-8988-088451fb2ad2	00090000-55bb-80a8-bfcd-d49a82a2eada	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55bb-80a8-9f94-fe36c8b46b05	00090000-55bb-80a8-dfa3-de5f66b8dea6	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55bb-80a8-7dcb-7693336bca90	00090000-55bb-80a8-434c-698c3dabfa08	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2973 (class 0 OID 11351897)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55bb-80a8-ebd9-b9c17adb8868	00040000-55bb-80a6-82e7-559fd215f6f0	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-80a8-a9ba-1357be11790b	00040000-55bb-80a6-82e7-559fd215f6f0	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55bb-80a8-52d9-e57526088c51	00040000-55bb-80a6-82e7-559fd215f6f0	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-80a8-5756-8c8beb6105d3	00040000-55bb-80a6-82e7-559fd215f6f0	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-80a8-b862-10eaedf7c03c	00040000-55bb-80a6-82e7-559fd215f6f0	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-80a8-6240-5112ef455aac	00040000-55bb-80a6-dad7-67ea6546da7f	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-80a8-ccc6-9422b78876fc	00040000-55bb-80a6-0c78-284294492920	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-80a8-7c3a-de779a0f3070	00040000-55bb-80a6-6294-936414a7fb60	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-80a8-b9da-5f799fc7737d	00040000-55bb-80a6-82e7-559fd215f6f0	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2975 (class 0 OID 11351932)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55bb-80a7-1851-975ff754f30d	8341	Adlešiči
00050000-55bb-80a7-c4f8-4eed794c4c9a	5270	Ajdovščina
00050000-55bb-80a7-9a05-03e0b5ad92c4	6280	Ankaran/Ancarano
00050000-55bb-80a7-d8ca-74f3b32b2fe2	9253	Apače
00050000-55bb-80a7-bff6-a62c8969e2aa	8253	Artiče
00050000-55bb-80a7-ee36-8c2a30c94a99	4275	Begunje na Gorenjskem
00050000-55bb-80a7-9840-6c9804e3ec83	1382	Begunje pri Cerknici
00050000-55bb-80a7-c80a-99d86e821900	9231	Beltinci
00050000-55bb-80a7-b10e-ff34307ffba2	2234	Benedikt
00050000-55bb-80a7-fe9d-e48853f262bf	2345	Bistrica ob Dravi
00050000-55bb-80a7-3b26-4bae7225077b	3256	Bistrica ob Sotli
00050000-55bb-80a7-629a-260b7838222f	8259	Bizeljsko
00050000-55bb-80a7-4e19-77ad4bbddcd7	1223	Blagovica
00050000-55bb-80a7-d4d0-91de1ad148fa	8283	Blanca
00050000-55bb-80a7-1384-357f3a0b9c7b	4260	Bled
00050000-55bb-80a7-da5c-5927f8a799a1	4273	Blejska Dobrava
00050000-55bb-80a7-fa22-c66de07632f5	9265	Bodonci
00050000-55bb-80a7-fe3d-ed46640ad202	9222	Bogojina
00050000-55bb-80a7-f3a5-23f8f70042fd	4263	Bohinjska Bela
00050000-55bb-80a7-c984-98e39d63de63	4264	Bohinjska Bistrica
00050000-55bb-80a7-ac31-d828ed8e3a46	4265	Bohinjsko jezero
00050000-55bb-80a7-05f7-e215031c0707	1353	Borovnica
00050000-55bb-80a7-81b6-542165f8374f	8294	Boštanj
00050000-55bb-80a7-8e6f-59393d2a0651	5230	Bovec
00050000-55bb-80a7-16ac-04a6af4981d6	5295	Branik
00050000-55bb-80a7-8b8a-a77b02e8c96b	3314	Braslovče
00050000-55bb-80a7-ac7f-ba8964b7d3f8	5223	Breginj
00050000-55bb-80a7-0d02-e9b2c3371379	8280	Brestanica
00050000-55bb-80a7-71e3-fd0b1740a7ca	2354	Bresternica
00050000-55bb-80a7-183d-c420965fc557	4243	Brezje
00050000-55bb-80a7-92a7-e2c95a3e635b	1351	Brezovica pri Ljubljani
00050000-55bb-80a7-55c4-9b3974b1c118	8250	Brežice
00050000-55bb-80a7-fff2-6857460cd17b	4210	Brnik - Aerodrom
00050000-55bb-80a7-614d-cb9814852788	8321	Brusnice
00050000-55bb-80a7-579f-31ab0fca9326	3255	Buče
00050000-55bb-80a7-b3f6-2d6ecaaa8110	8276	Bučka 
00050000-55bb-80a7-b528-35ab0a33ef73	9261	Cankova
00050000-55bb-80a7-deb4-98597bbeb876	3000	Celje 
00050000-55bb-80a7-88b6-981909e3cad0	3001	Celje - poštni predali
00050000-55bb-80a7-c10b-615a3d59f373	4207	Cerklje na Gorenjskem
00050000-55bb-80a7-13d7-cf708c839a89	8263	Cerklje ob Krki
00050000-55bb-80a7-229f-476d0a8f058c	1380	Cerknica
00050000-55bb-80a7-48af-d78b8125d3e8	5282	Cerkno
00050000-55bb-80a7-6926-e3ba2611897a	2236	Cerkvenjak
00050000-55bb-80a7-ceed-7fe82e434150	2215	Ceršak
00050000-55bb-80a7-7f3f-77da6af26f06	2326	Cirkovce
00050000-55bb-80a7-0366-5377b5226578	2282	Cirkulane
00050000-55bb-80a7-2264-62c6273f4f9a	5273	Col
00050000-55bb-80a7-20f4-12e7e3d4d390	8251	Čatež ob Savi
00050000-55bb-80a7-1ab7-ec7fdedf2a27	1413	Čemšenik
00050000-55bb-80a7-c731-703ee94833ca	5253	Čepovan
00050000-55bb-80a7-0d1f-821d05aa72eb	9232	Črenšovci
00050000-55bb-80a7-2abd-9e93b7993190	2393	Črna na Koroškem
00050000-55bb-80a7-664e-1beacd6d571d	6275	Črni Kal
00050000-55bb-80a7-e9fa-992e9aab45ca	5274	Črni Vrh nad Idrijo
00050000-55bb-80a7-eeb2-b1c2f57fa67e	5262	Črniče
00050000-55bb-80a7-5f03-f44645db9a98	8340	Črnomelj
00050000-55bb-80a7-c557-661381777bd7	6271	Dekani
00050000-55bb-80a7-c82d-5e5e55e0f0d4	5210	Deskle
00050000-55bb-80a7-5f83-cbaca65efc72	2253	Destrnik
00050000-55bb-80a7-ff16-5737064c7b0c	6215	Divača
00050000-55bb-80a7-6222-aea363f6b228	1233	Dob
00050000-55bb-80a7-608c-6c109eb126c0	3224	Dobje pri Planini
00050000-55bb-80a7-25b3-3c46c837bcaf	8257	Dobova
00050000-55bb-80a7-48e3-6791a31711a5	1423	Dobovec
00050000-55bb-80a7-e4d5-44abb1f5fb50	5263	Dobravlje
00050000-55bb-80a7-0a70-ebfbb194791c	3204	Dobrna
00050000-55bb-80a7-2c74-8fddd0d82823	8211	Dobrnič
00050000-55bb-80a7-daa2-001b94710772	1356	Dobrova
00050000-55bb-80a7-1617-e0a01f33a970	9223	Dobrovnik/Dobronak 
00050000-55bb-80a7-2093-86d293dee653	5212	Dobrovo v Brdih
00050000-55bb-80a7-2b9b-103b477432a2	1431	Dol pri Hrastniku
00050000-55bb-80a7-d5dc-9ea9ea430d3b	1262	Dol pri Ljubljani
00050000-55bb-80a7-4619-a8a0a962980f	1273	Dole pri Litiji
00050000-55bb-80a7-0643-a68c73392800	1331	Dolenja vas
00050000-55bb-80a7-c6a6-6154d8a0010a	8350	Dolenjske Toplice
00050000-55bb-80a7-3619-8736061dfb48	1230	Domžale
00050000-55bb-80a7-42f5-b82fe8105d49	2252	Dornava
00050000-55bb-80a7-ea30-209efcb74166	5294	Dornberk
00050000-55bb-80a7-fd47-8e93d4ec767e	1319	Draga
00050000-55bb-80a7-838f-bda69e8d33a3	8343	Dragatuš
00050000-55bb-80a7-41f5-20141155eb01	3222	Dramlje
00050000-55bb-80a7-3e8a-fb5e6a23a789	2370	Dravograd
00050000-55bb-80a7-a10a-99e019d1ac09	4203	Duplje
00050000-55bb-80a7-6c05-11f0d2983aa9	6221	Dutovlje
00050000-55bb-80a7-9c90-cc356afb7722	8361	Dvor
00050000-55bb-80a7-82f5-fe986b17d3ec	2343	Fala
00050000-55bb-80a7-2c5c-4931b79e8279	9208	Fokovci
00050000-55bb-80a7-8884-957f15cb2492	2313	Fram
00050000-55bb-80a7-ade1-b99d4ba4ed63	3213	Frankolovo
00050000-55bb-80a7-77b3-96ef1eb2daa6	1274	Gabrovka
00050000-55bb-80a7-4fa1-e1b6934f0638	8254	Globoko
00050000-55bb-80a7-303d-ddd527898975	5275	Godovič
00050000-55bb-80a7-9984-57cf9af2adcf	4204	Golnik
00050000-55bb-80a7-f763-0cf9f0ce9b51	3303	Gomilsko
00050000-55bb-80a7-186d-2a75c465af55	4224	Gorenja vas
00050000-55bb-80a7-2d47-47810c1d93cd	3263	Gorica pri Slivnici
00050000-55bb-80a7-975a-132ff35f0e5e	2272	Gorišnica
00050000-55bb-80a7-f01d-92f11afb854a	9250	Gornja Radgona
00050000-55bb-80a7-2c38-7923866139fa	3342	Gornji Grad
00050000-55bb-80a7-4ee9-d91f231d6855	4282	Gozd Martuljek
00050000-55bb-80a7-74dd-a3736ecf2156	6272	Gračišče
00050000-55bb-80a7-aa0d-095e61e071ca	9264	Grad
00050000-55bb-80a7-cd0b-0fa554c76285	8332	Gradac
00050000-55bb-80a7-ec4c-1e98eda271a7	1384	Grahovo
00050000-55bb-80a7-d6f1-430d00de00d5	5242	Grahovo ob Bači
00050000-55bb-80a7-776c-d17d88934d69	5251	Grgar
00050000-55bb-80a7-aec1-0de34edc9a94	3302	Griže
00050000-55bb-80a7-30e3-2067dc625676	3231	Grobelno
00050000-55bb-80a7-7104-5a095e469313	1290	Grosuplje
00050000-55bb-80a7-5fe4-11d3d77f9e46	2288	Hajdina
00050000-55bb-80a7-7623-6d2ddb8afec1	8362	Hinje
00050000-55bb-80a7-8967-72fbd4ae5d2b	2311	Hoče
00050000-55bb-80a7-aca1-4f55f044f20f	9205	Hodoš/Hodos
00050000-55bb-80a7-d5d1-ee7e1dec6454	1354	Horjul
00050000-55bb-80a7-077f-7b51f5afef5e	1372	Hotedršica
00050000-55bb-80a7-a06a-5ccd3113bf62	1430	Hrastnik
00050000-55bb-80a7-e8ec-2dc7f522481f	6225	Hruševje
00050000-55bb-80a7-7cdc-dc4226baf1ee	4276	Hrušica
00050000-55bb-80a7-e95a-50a16b505cae	5280	Idrija
00050000-55bb-80a7-1942-42031b81ee0d	1292	Ig
00050000-55bb-80a7-2d64-fe6371a75dc3	6250	Ilirska Bistrica
00050000-55bb-80a7-9924-b1eb3c9299bb	6251	Ilirska Bistrica-Trnovo
00050000-55bb-80a7-40a9-c89ee98f2d14	1295	Ivančna Gorica
00050000-55bb-80a7-bed7-b066de515ff4	2259	Ivanjkovci
00050000-55bb-80a7-0bc6-fd9cf1de360b	1411	Izlake
00050000-55bb-80a7-3845-7bf061b5fbe7	6310	Izola/Isola
00050000-55bb-80a7-cc9c-0a7a254d2eb9	2222	Jakobski Dol
00050000-55bb-80a7-619b-431835990ba5	2221	Jarenina
00050000-55bb-80a7-6492-cc7bce604e58	6254	Jelšane
00050000-55bb-80a7-c97a-eeee92956f86	4270	Jesenice
00050000-55bb-80a7-e437-c37bb8ae5069	8261	Jesenice na Dolenjskem
00050000-55bb-80a7-e52e-826fbb978825	3273	Jurklošter
00050000-55bb-80a7-3d4d-51048aae0bb1	2223	Jurovski Dol
00050000-55bb-80a7-dc84-624d9cb035db	2256	Juršinci
00050000-55bb-80a7-d4d2-096d643ce1ae	5214	Kal nad Kanalom
00050000-55bb-80a7-c7a6-149a1628511f	3233	Kalobje
00050000-55bb-80a7-e13b-223fe4fb3be8	4246	Kamna Gorica
00050000-55bb-80a7-5085-491c493ef46b	2351	Kamnica
00050000-55bb-80a7-54e8-99256c0fd03a	1241	Kamnik
00050000-55bb-80a7-c94c-500457ac069a	5213	Kanal
00050000-55bb-80a7-1a98-8c08743fa718	8258	Kapele
00050000-55bb-80a7-ac22-4a29040d2801	2362	Kapla
00050000-55bb-80a7-f0dd-b27800b9c3ff	2325	Kidričevo
00050000-55bb-80a7-229c-720a9e1efb4f	1412	Kisovec
00050000-55bb-80a7-8969-32ba8b9653f7	6253	Knežak
00050000-55bb-80a7-b37c-ed8f8bcb36e8	5222	Kobarid
00050000-55bb-80a7-0c2e-c50246f98e43	9227	Kobilje
00050000-55bb-80a7-70db-0279119da5b7	1330	Kočevje
00050000-55bb-80a7-a468-dd68b86e084b	1338	Kočevska Reka
00050000-55bb-80a7-c1cb-76d3b70d27eb	2276	Kog
00050000-55bb-80a7-05f2-d6956cd6b129	5211	Kojsko
00050000-55bb-80a7-ff1d-73ecdddaddb3	6223	Komen
00050000-55bb-80a7-7fd2-3b2652c6d8df	1218	Komenda
00050000-55bb-80a7-5c60-6a52284c5f04	6000	Koper/Capodistria 
00050000-55bb-80a7-3cae-b544c33faebe	6001	Koper/Capodistria - poštni predali
00050000-55bb-80a7-d696-edb14c61cd41	8282	Koprivnica
00050000-55bb-80a7-6fd5-7442116869fd	5296	Kostanjevica na Krasu
00050000-55bb-80a7-a031-f78936dccc24	8311	Kostanjevica na Krki
00050000-55bb-80a7-9f2e-d459269e3fe3	1336	Kostel
00050000-55bb-80a7-1cb0-5adbddf58496	6256	Košana
00050000-55bb-80a7-6df0-16b1dd04ba9f	2394	Kotlje
00050000-55bb-80a7-7568-387a671eedd9	6240	Kozina
00050000-55bb-80a7-e908-3dafd41c0362	3260	Kozje
00050000-55bb-80a7-9f98-618edc7babbb	4000	Kranj 
00050000-55bb-80a7-e589-343c4d814fc4	4001	Kranj - poštni predali
00050000-55bb-80a7-5197-fbd4ddd315ca	4280	Kranjska Gora
00050000-55bb-80a7-7857-951bdbd278f5	1281	Kresnice
00050000-55bb-80a7-8032-bc024e345bf7	4294	Križe
00050000-55bb-80a7-0e81-677ed3b95f46	9206	Križevci
00050000-55bb-80a7-7c06-8d29b6db9cc7	9242	Križevci pri Ljutomeru
00050000-55bb-80a7-398a-5340cd3e75d1	1301	Krka
00050000-55bb-80a7-0404-8d98383906e4	8296	Krmelj
00050000-55bb-80a7-e6e0-8ca8e7a8c08b	4245	Kropa
00050000-55bb-80a7-f5f2-685022d07916	8262	Krška vas
00050000-55bb-80a7-b078-76b9f57e97ac	8270	Krško
00050000-55bb-80a7-4f82-1e385745716a	9263	Kuzma
00050000-55bb-80a7-a7d7-4e917086b4f8	2318	Laporje
00050000-55bb-80a7-31e9-2f132da4331c	3270	Laško
00050000-55bb-80a7-09f1-2912ec28963c	1219	Laze v Tuhinju
00050000-55bb-80a7-7ee2-0380b9b0c41d	2230	Lenart v Slovenskih goricah
00050000-55bb-80a7-8093-470ae0310f66	9220	Lendava/Lendva
00050000-55bb-80a7-02ff-34028c96af86	4248	Lesce
00050000-55bb-80a7-7f11-dc723ee0de91	3261	Lesično
00050000-55bb-80a7-fe29-bfc0ca840d70	8273	Leskovec pri Krškem
00050000-55bb-80a7-1ecb-59c4cbbf4843	2372	Libeliče
00050000-55bb-80a7-25c5-b5079be3cf62	2341	Limbuš
00050000-55bb-80a7-cbb2-ba0da93be734	1270	Litija
00050000-55bb-80a7-0b56-359f862fe95e	3202	Ljubečna
00050000-55bb-80a7-ae20-75eba0f5d790	1000	Ljubljana 
00050000-55bb-80a7-62c3-ca348b011bb9	1001	Ljubljana - poštni predali
00050000-55bb-80a7-090f-a024516ba6e0	1231	Ljubljana - Črnuče
00050000-55bb-80a7-a97e-2c62a75614c5	1261	Ljubljana - Dobrunje
00050000-55bb-80a7-6644-b2d305a4d999	1260	Ljubljana - Polje
00050000-55bb-80a7-6edc-e06fff27d733	1210	Ljubljana - Šentvid
00050000-55bb-80a7-3211-73acb44a3674	1211	Ljubljana - Šmartno
00050000-55bb-80a7-54ce-263423a5a4e9	3333	Ljubno ob Savinji
00050000-55bb-80a7-f72a-1e07e76bee71	9240	Ljutomer
00050000-55bb-80a7-acc5-d0809e67c79f	3215	Loče
00050000-55bb-80a7-4c85-9a5696ba34cf	5231	Log pod Mangartom
00050000-55bb-80a7-2bff-b071730efa82	1358	Log pri Brezovici
00050000-55bb-80a7-f106-8e74fbac00ea	1370	Logatec
00050000-55bb-80a7-42c0-3e441d16539c	1371	Logatec
00050000-55bb-80a7-357b-0c7646d74d0f	1434	Loka pri Zidanem Mostu
00050000-55bb-80a7-7698-8afd88e4f692	3223	Loka pri Žusmu
00050000-55bb-80a7-8da5-412f144d0d3a	6219	Lokev
00050000-55bb-80a7-2b21-556924185124	1318	Loški Potok
00050000-55bb-80a7-7e23-120be954c8a5	2324	Lovrenc na Dravskem polju
00050000-55bb-80a7-443c-0da33e3f8bea	2344	Lovrenc na Pohorju
00050000-55bb-80a7-ba10-8737e7e55bbb	3334	Luče
00050000-55bb-80a7-2122-dc9f17a91d6b	1225	Lukovica
00050000-55bb-80a7-c33f-0affaf583356	9202	Mačkovci
00050000-55bb-80a7-6411-590810dc136d	2322	Majšperk
00050000-55bb-80a7-b19a-eb0a5c8123b8	2321	Makole
00050000-55bb-80a7-69f2-68ef6447c00e	9243	Mala Nedelja
00050000-55bb-80a7-77eb-2324eb8dc358	2229	Malečnik
00050000-55bb-80a7-23f4-c3df631d2c4e	6273	Marezige
00050000-55bb-80a7-b892-2bbd7f1251b7	2000	Maribor 
00050000-55bb-80a7-248c-0794f8d6c076	2001	Maribor - poštni predali
00050000-55bb-80a7-7656-a6e3cdd58b32	2206	Marjeta na Dravskem polju
00050000-55bb-80a7-f044-4b965e2a963c	2281	Markovci
00050000-55bb-80a7-90ba-c48ac8a0bcb2	9221	Martjanci
00050000-55bb-80a7-a2ed-2d35bd5515f5	6242	Materija
00050000-55bb-80a7-7a5f-93f3c3638607	4211	Mavčiče
00050000-55bb-80a7-269a-6e2687c16da5	1215	Medvode
00050000-55bb-80a7-55a0-4d45a8f55abc	1234	Mengeš
00050000-55bb-80a7-af4b-eb288c222e8b	8330	Metlika
00050000-55bb-80a7-0e3e-641d27ffdb2f	2392	Mežica
00050000-55bb-80a7-938b-29d46467ebf8	2204	Miklavž na Dravskem polju
00050000-55bb-80a7-4f52-27aa0058867c	2275	Miklavž pri Ormožu
00050000-55bb-80a7-b844-416f263ddd38	5291	Miren
00050000-55bb-80a7-b458-e08143f34581	8233	Mirna
00050000-55bb-80a7-2c83-7c15a54a3db5	8216	Mirna Peč
00050000-55bb-80a7-ad2f-bf21610b599a	2382	Mislinja
00050000-55bb-80a7-c4ac-37ec0a1856bf	4281	Mojstrana
00050000-55bb-80a7-e06e-f3b2e2e3fc81	8230	Mokronog
00050000-55bb-80a7-a6ea-ca3970ae7820	1251	Moravče
00050000-55bb-80a7-eb61-2e24e2706269	9226	Moravske Toplice
00050000-55bb-80a7-e163-438781fa1421	5216	Most na Soči
00050000-55bb-80a7-771d-72e9bcc73dec	1221	Motnik
00050000-55bb-80a7-a01d-95a123c1dec2	3330	Mozirje
00050000-55bb-80a7-042e-d83970a6cb0e	9000	Murska Sobota 
00050000-55bb-80a7-2ca6-c696e864d388	9001	Murska Sobota - poštni predali
00050000-55bb-80a7-3ff7-61cc425fb549	2366	Muta
00050000-55bb-80a7-6967-e1b39e647f13	4202	Naklo
00050000-55bb-80a7-26e1-818ff47e1c86	3331	Nazarje
00050000-55bb-80a7-2279-d426aac747c0	1357	Notranje Gorice
00050000-55bb-80a7-7b1d-e905b3231bdf	3203	Nova Cerkev
00050000-55bb-80a7-fd65-e462f227d1f1	5000	Nova Gorica 
00050000-55bb-80a7-42ae-8a55970989b4	5001	Nova Gorica - poštni predali
00050000-55bb-80a7-3f1f-f7c344f786d1	1385	Nova vas
00050000-55bb-80a7-59e0-9149f8ada0f1	8000	Novo mesto
00050000-55bb-80a7-3220-edd20321fa51	8001	Novo mesto - poštni predali
00050000-55bb-80a7-5b08-4d93c130e185	6243	Obrov
00050000-55bb-80a7-e8dc-5f5b8ea5903b	9233	Odranci
00050000-55bb-80a7-c703-f263e4b60c55	2317	Oplotnica
00050000-55bb-80a7-d6a7-05f3622313f3	2312	Orehova vas
00050000-55bb-80a7-c005-46b9fffb5461	2270	Ormož
00050000-55bb-80a7-b742-af57cc520a23	1316	Ortnek
00050000-55bb-80a7-bfa8-cd262eeddb8f	1337	Osilnica
00050000-55bb-80a7-46a6-72287dff3612	8222	Otočec
00050000-55bb-80a7-fb5c-7cef0a16cbcc	2361	Ožbalt
00050000-55bb-80a7-c795-b473f4a61382	2231	Pernica
00050000-55bb-80a7-52e1-62579a186433	2211	Pesnica pri Mariboru
00050000-55bb-80a7-18f0-3099dc7be9eb	9203	Petrovci
00050000-55bb-80a7-258a-01ac4c40472f	3301	Petrovče
00050000-55bb-80a7-b3a0-4600d078f4b6	6330	Piran/Pirano
00050000-55bb-80a7-b45c-32dd32e70da2	8255	Pišece
00050000-55bb-80a7-0c8b-bf542d1a99e6	6257	Pivka
00050000-55bb-80a7-c26c-fce43a12b97d	6232	Planina
00050000-55bb-80a7-1930-0abaa953264e	3225	Planina pri Sevnici
00050000-55bb-80a7-0779-88a70bdbe9d9	6276	Pobegi
00050000-55bb-80a7-ccd9-9a22f5446efb	8312	Podbočje
00050000-55bb-80a7-5253-5acf3b8761cf	5243	Podbrdo
00050000-55bb-80a7-2641-95bf34c648dc	3254	Podčetrtek
00050000-55bb-80a7-c5a8-45bf3352acfe	2273	Podgorci
00050000-55bb-80a7-b93d-0ab584c90dad	6216	Podgorje
00050000-55bb-80a7-4fc5-214b00214165	2381	Podgorje pri Slovenj Gradcu
00050000-55bb-80a7-0c5f-02b8bb0dfe48	6244	Podgrad
00050000-55bb-80a7-7825-e0386978069d	1414	Podkum
00050000-55bb-80a7-a5a2-0705507ee188	2286	Podlehnik
00050000-55bb-80a7-024a-08eee75880d7	5272	Podnanos
00050000-55bb-80a7-a190-790667a98981	4244	Podnart
00050000-55bb-80a7-574d-19e737e1bb28	3241	Podplat
00050000-55bb-80a7-8899-5587bab71cca	3257	Podsreda
00050000-55bb-80a7-a1c2-2537a1514014	2363	Podvelka
00050000-55bb-80a7-dacb-ff6fba0425bb	2208	Pohorje
00050000-55bb-80a7-ba77-7df44a4a443c	2257	Polenšak
00050000-55bb-80a7-f6d6-d6a3e8f71d0b	1355	Polhov Gradec
00050000-55bb-80a7-a025-24e8f77cc701	4223	Poljane nad Škofjo Loko
00050000-55bb-80a7-5e97-a552b6289978	2319	Poljčane
00050000-55bb-80a7-ced9-7add10911834	1272	Polšnik
00050000-55bb-80a7-08b9-d61ce9821796	3313	Polzela
00050000-55bb-80a7-bba7-ff54b0bd9e19	3232	Ponikva
00050000-55bb-80a7-e36c-1516f93a5453	6320	Portorož/Portorose
00050000-55bb-80a7-523f-a892e7f76d70	6230	Postojna
00050000-55bb-80a7-d845-70ed54c59a31	2331	Pragersko
00050000-55bb-80a7-4cae-9bdbb5e2a6cd	3312	Prebold
00050000-55bb-80a7-ea6f-e72ab015a175	4205	Preddvor
00050000-55bb-80a7-ff7f-b6e5f28369c2	6255	Prem
00050000-55bb-80a7-4262-db1992c57b39	1352	Preserje
00050000-55bb-80a7-31fa-66ce6a2e0d23	6258	Prestranek
00050000-55bb-80a7-8194-cb22b4b9ed91	2391	Prevalje
00050000-55bb-80a7-70b6-1285ac748b42	3262	Prevorje
00050000-55bb-80a7-4f02-efa7247d356c	1276	Primskovo 
00050000-55bb-80a7-7b7e-af67e4ab2c96	3253	Pristava pri Mestinju
00050000-55bb-80a7-7aea-2e0f0d4b61d7	9207	Prosenjakovci/Partosfalva
00050000-55bb-80a7-a74e-f2cdd734a1fd	5297	Prvačina
00050000-55bb-80a7-fa78-c779adc55021	2250	Ptuj
00050000-55bb-80a7-6854-c66a8e95eddb	2323	Ptujska Gora
00050000-55bb-80a7-81be-f8bc24fee277	9201	Puconci
00050000-55bb-80a7-32c7-a1e53d66c30d	2327	Rače
00050000-55bb-80a7-e5ab-c42cda09ae51	1433	Radeče
00050000-55bb-80a7-5607-ad35c147ac0a	9252	Radenci
00050000-55bb-80a7-865c-c43e10ea97d2	2360	Radlje ob Dravi
00050000-55bb-80a7-7a3d-8499ef8c1384	1235	Radomlje
00050000-55bb-80a7-49fe-062fccfc82ca	4240	Radovljica
00050000-55bb-80a7-4fbc-accf35308d0e	8274	Raka
00050000-55bb-80a7-04da-c7409d40e7a9	1381	Rakek
00050000-55bb-80a7-1861-2eb20a19865e	4283	Rateče - Planica
00050000-55bb-80a7-cb1a-b435ba9f1319	2390	Ravne na Koroškem
00050000-55bb-80a7-2ab1-3edfca521577	9246	Razkrižje
00050000-55bb-80a7-b49d-7d8ea21d383e	3332	Rečica ob Savinji
00050000-55bb-80a7-a558-eb076e353b0b	5292	Renče
00050000-55bb-80a7-d66b-8faebaa923a4	1310	Ribnica
00050000-55bb-80a7-3ffb-184709038301	2364	Ribnica na Pohorju
00050000-55bb-80a7-5609-94cc7739d0d0	3272	Rimske Toplice
00050000-55bb-80a7-93a7-e35702751903	1314	Rob
00050000-55bb-80a7-bb8a-29cfbcc477bb	5215	Ročinj
00050000-55bb-80a7-dd5d-017e6e7845ef	3250	Rogaška Slatina
00050000-55bb-80a7-54e1-f80fa85c9500	9262	Rogašovci
00050000-55bb-80a7-0627-282bbc05f674	3252	Rogatec
00050000-55bb-80a7-7a25-3a34c13cb556	1373	Rovte
00050000-55bb-80a7-a60c-a68a17a47815	2342	Ruše
00050000-55bb-80a7-77ed-5bbf86b67ffc	1282	Sava
00050000-55bb-80a7-8a76-e56a078933a7	6333	Sečovlje/Sicciole
00050000-55bb-80a7-d05e-5a88f706d662	4227	Selca
00050000-55bb-80a7-d207-3e3aa42b77c3	2352	Selnica ob Dravi
00050000-55bb-80a7-c3fd-179e86a4afd3	8333	Semič
00050000-55bb-80a7-2fd0-ec9d68fe6b1d	8281	Senovo
00050000-55bb-80a7-4823-2d1f1974757b	6224	Senožeče
00050000-55bb-80a7-fe22-98e5d7e6a1d1	8290	Sevnica
00050000-55bb-80a7-0ab7-0272e89c99fc	6210	Sežana
00050000-55bb-80a7-81c8-d2d503cbf2b9	2214	Sladki Vrh
00050000-55bb-80a7-32d3-e7e6b91dd02d	5283	Slap ob Idrijci
00050000-55bb-80a7-87fb-51d62110e433	2380	Slovenj Gradec
00050000-55bb-80a7-5bb0-a3661e9d1958	2310	Slovenska Bistrica
00050000-55bb-80a7-df36-856d82d2d9c9	3210	Slovenske Konjice
00050000-55bb-80a7-a3a4-23ef5d3ad735	1216	Smlednik
00050000-55bb-80a7-eb43-26c68e72695f	5232	Soča
00050000-55bb-80a7-516c-237fcda8d62c	1317	Sodražica
00050000-55bb-80a7-66a0-42f308962836	3335	Solčava
00050000-55bb-80a7-28a8-064a2b76df94	5250	Solkan
00050000-55bb-80a7-c51c-e96b29c6a620	4229	Sorica
00050000-55bb-80a7-44c6-22ff3bacbe6f	4225	Sovodenj
00050000-55bb-80a7-19c8-e0364215058c	5281	Spodnja Idrija
00050000-55bb-80a7-95e4-530f4cab3c8b	2241	Spodnji Duplek
00050000-55bb-80a7-62c3-22f3bfe11f42	9245	Spodnji Ivanjci
00050000-55bb-80a7-4d99-9fa402d94882	2277	Središče ob Dravi
00050000-55bb-80a7-7d50-efaa6c90481c	4267	Srednja vas v Bohinju
00050000-55bb-80a7-2587-404f5dd41894	8256	Sromlje 
00050000-55bb-80a7-7107-09c3621a4f25	5224	Srpenica
00050000-55bb-80a7-fc2b-befb1b198ffe	1242	Stahovica
00050000-55bb-80a7-2cd9-87d8a1d4b282	1332	Stara Cerkev
00050000-55bb-80a7-0f50-e9bbc83b7d33	8342	Stari trg ob Kolpi
00050000-55bb-80a7-f3bd-65929714350b	1386	Stari trg pri Ložu
00050000-55bb-80a7-fc7f-1b186cd0680e	2205	Starše
00050000-55bb-80a7-450a-aea73705e3b1	2289	Stoperce
00050000-55bb-80a7-a909-9dacda92233a	8322	Stopiče
00050000-55bb-80a7-fea1-623364e3efc2	3206	Stranice
00050000-55bb-80a7-9e18-89f3940d7175	8351	Straža
00050000-55bb-80a7-b961-25b88fa179fa	1313	Struge
00050000-55bb-80a7-262b-7245c8b68a5a	8293	Studenec
00050000-55bb-80a7-c48a-7720b4dd1e6c	8331	Suhor
00050000-55bb-80a7-a260-2f7faba42879	2233	Sv. Ana v Slovenskih goricah
00050000-55bb-80a7-6140-92606791fdde	2235	Sv. Trojica v Slovenskih goricah
00050000-55bb-80a7-9452-b5c56acc7946	2353	Sveti Duh na Ostrem Vrhu
00050000-55bb-80a7-280c-eab75623f9b3	9244	Sveti Jurij ob Ščavnici
00050000-55bb-80a7-65b4-10edde87c9be	3264	Sveti Štefan
00050000-55bb-80a7-adc5-b9417f1dd1cf	2258	Sveti Tomaž
00050000-55bb-80a7-dee6-9256461ac062	9204	Šalovci
00050000-55bb-80a7-9b57-434b8fd277a9	5261	Šempas
00050000-55bb-80a7-9a16-35ec14f16e86	5290	Šempeter pri Gorici
00050000-55bb-80a7-d8f3-f77116082af7	3311	Šempeter v Savinjski dolini
00050000-55bb-80a7-e3fe-f9b7ecc0de14	4208	Šenčur
00050000-55bb-80a7-adcd-6564c4ca49b3	2212	Šentilj v Slovenskih goricah
00050000-55bb-80a7-6fe7-0bcb6d63dcbe	8297	Šentjanž
00050000-55bb-80a7-6f46-576fbc8e04fd	2373	Šentjanž pri Dravogradu
00050000-55bb-80a7-c2a4-c61bf4e437e1	8310	Šentjernej
00050000-55bb-80a7-00cd-76e9faed9651	3230	Šentjur
00050000-55bb-80a7-dde9-65fa91a8718a	3271	Šentrupert
00050000-55bb-80a7-f1a5-021f19bfa140	8232	Šentrupert
00050000-55bb-80a7-7fe3-8425b6d7fcde	1296	Šentvid pri Stični
00050000-55bb-80a7-3283-fdbb19a85616	8275	Škocjan
00050000-55bb-80a7-fb50-e4d9e41ed55b	6281	Škofije
00050000-55bb-80a7-5ee3-362aad56bc04	4220	Škofja Loka
00050000-55bb-80a7-bed4-3a3d8e9e2f40	3211	Škofja vas
00050000-55bb-80a7-3f86-75e04ddf31bd	1291	Škofljica
00050000-55bb-80a7-7a23-3ee142396fee	6274	Šmarje
00050000-55bb-80a7-2043-16f8da8fd799	1293	Šmarje - Sap
00050000-55bb-80a7-f8c4-1cb6fec325ba	3240	Šmarje pri Jelšah
00050000-55bb-80a7-f61b-c3e3e40a5c34	8220	Šmarješke Toplice
00050000-55bb-80a7-b528-2ce10f32e4da	2315	Šmartno na Pohorju
00050000-55bb-80a7-7f2b-8728bda49ce8	3341	Šmartno ob Dreti
00050000-55bb-80a7-e800-24cc0d59eb99	3327	Šmartno ob Paki
00050000-55bb-80a7-b8c0-317bd55ced09	1275	Šmartno pri Litiji
00050000-55bb-80a7-87ea-a8682de72e09	2383	Šmartno pri Slovenj Gradcu
00050000-55bb-80a7-f419-a259f01d277b	3201	Šmartno v Rožni dolini
00050000-55bb-80a7-ab1f-1e692b006c52	3325	Šoštanj
00050000-55bb-80a7-f104-3992ec110088	6222	Štanjel
00050000-55bb-80a7-cf72-25cdad1919cd	3220	Štore
00050000-55bb-80a7-c1e5-a1d5f05518b4	3304	Tabor
00050000-55bb-80a7-33aa-746e1075a5b8	3221	Teharje
00050000-55bb-80a7-5352-1747eaa19dff	9251	Tišina
00050000-55bb-80a7-4259-de68e9e6e28b	5220	Tolmin
00050000-55bb-80a7-1d8a-89ff4406331e	3326	Topolšica
00050000-55bb-80a7-5c99-e757c9872f3d	2371	Trbonje
00050000-55bb-80a7-7bb5-1ae85f329861	1420	Trbovlje
00050000-55bb-80a7-3dc8-de9f109cd0b3	8231	Trebelno 
00050000-55bb-80a7-e976-4bb7f2e1687e	8210	Trebnje
00050000-55bb-80a7-73b4-477cfe4f95a8	5252	Trnovo pri Gorici
00050000-55bb-80a7-0470-bb8ea2ccd0d0	2254	Trnovska vas
00050000-55bb-80a7-1a62-35ea3a4dc253	1222	Trojane
00050000-55bb-80a7-b875-f35ee80ea29a	1236	Trzin
00050000-55bb-80a7-e1fd-c3b41a2a6528	4290	Tržič
00050000-55bb-80a7-13ed-a778df1544b0	8295	Tržišče
00050000-55bb-80a7-c8ac-21b82df692dc	1311	Turjak
00050000-55bb-80a7-d118-b1a7b548a571	9224	Turnišče
00050000-55bb-80a7-afe6-55a3a0742e5b	8323	Uršna sela
00050000-55bb-80a7-86ca-364bd6be308c	1252	Vače
00050000-55bb-80a7-b7b1-6777307f6f62	3320	Velenje 
00050000-55bb-80a7-8f32-88290016d8dd	3322	Velenje - poštni predali
00050000-55bb-80a7-0f83-f1f417c28feb	8212	Velika Loka
00050000-55bb-80a7-480d-cc6a8813fc3c	2274	Velika Nedelja
00050000-55bb-80a7-53b2-9f0f1ad4ff53	9225	Velika Polana
00050000-55bb-80a7-227c-afd2e7adf366	1315	Velike Lašče
00050000-55bb-80a7-b011-e9324f2680e3	8213	Veliki Gaber
00050000-55bb-80a7-9ead-98fdad0ec283	9241	Veržej
00050000-55bb-80a7-7084-543cf1cd56b4	1312	Videm - Dobrepolje
00050000-55bb-80a7-da3b-759c584cc40e	2284	Videm pri Ptuju
00050000-55bb-80a7-83cb-16343ee40ec0	8344	Vinica
00050000-55bb-80a7-bf40-27f0a57e6320	5271	Vipava
00050000-55bb-80a7-8baa-b24fa3121694	4212	Visoko
00050000-55bb-80a7-cb04-48f03f286a66	1294	Višnja Gora
00050000-55bb-80a7-aa03-489e7e678c4a	3205	Vitanje
00050000-55bb-80a7-9da6-ba6b5095dc86	2255	Vitomarci
00050000-55bb-80a7-16dd-a7260e14e816	1217	Vodice
00050000-55bb-80a7-a0f7-6e40089109fb	3212	Vojnik\t
00050000-55bb-80a7-75d7-60e1fa08fb62	5293	Volčja Draga
00050000-55bb-80a7-15b0-ed8a3e4831fb	2232	Voličina
00050000-55bb-80a7-8b51-6ca9a6a4ee50	3305	Vransko
00050000-55bb-80a7-2699-b9d0635dfe81	6217	Vremski Britof
00050000-55bb-80a7-ea72-110843cf495d	1360	Vrhnika
00050000-55bb-80a7-c655-cf67854483a4	2365	Vuhred
00050000-55bb-80a7-6a57-09b7a9562304	2367	Vuzenica
00050000-55bb-80a7-ccb5-f842e0d41660	8292	Zabukovje 
00050000-55bb-80a7-c58b-1190cb3f1f32	1410	Zagorje ob Savi
00050000-55bb-80a7-3d94-339a15ade7d3	1303	Zagradec
00050000-55bb-80a7-23ef-b5f657f18e02	2283	Zavrč
00050000-55bb-80a7-3900-daa3a5710db5	8272	Zdole 
00050000-55bb-80a7-4a5e-eca389e74c16	4201	Zgornja Besnica
00050000-55bb-80a7-4146-dc46d2ee23bf	2242	Zgornja Korena
00050000-55bb-80a7-507d-2834eea57a3b	2201	Zgornja Kungota
00050000-55bb-80a7-a158-d5fa384eb6cc	2316	Zgornja Ložnica
00050000-55bb-80a7-46d3-b2cfc902f9ba	2314	Zgornja Polskava
00050000-55bb-80a7-d24c-c83a5371f1b1	2213	Zgornja Velka
00050000-55bb-80a7-45de-f8bf316f7188	4247	Zgornje Gorje
00050000-55bb-80a7-78af-7feb1e58a589	4206	Zgornje Jezersko
00050000-55bb-80a7-9807-36b5bb949e14	2285	Zgornji Leskovec
00050000-55bb-80a7-10d8-6dea08abba28	1432	Zidani Most
00050000-55bb-80a7-336a-cdeba4a5ecec	3214	Zreče
00050000-55bb-80a7-3b91-697d5f1c5416	4209	Žabnica
00050000-55bb-80a7-1b07-3be667942119	3310	Žalec
00050000-55bb-80a7-c9fd-0d0733d1a6bd	4228	Železniki
00050000-55bb-80a7-32be-a5f4775225a6	2287	Žetale
00050000-55bb-80a7-413a-9b2cc190ea4e	4226	Žiri
00050000-55bb-80a7-ea74-0d2b986019d4	4274	Žirovnica
00050000-55bb-80a7-9390-3bb574455902	8360	Žužemberk
\.


--
-- TOC entry 2992 (class 0 OID 11352106)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 11351917)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 11351995)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 11352118)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 11352421)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 11352432)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55bb-80a8-7e56-79f0a9d21a90	00080000-55bb-80a8-b9da-5f799fc7737d	0900	AK
00190000-55bb-80a8-f31f-d08332e835c3	00080000-55bb-80a8-52d9-e57526088c51	0987	AK
00190000-55bb-80a8-a392-b4444c071016	00080000-55bb-80a8-a9ba-1357be11790b	0989	AK
00190000-55bb-80a8-7e30-1494560311a1	00080000-55bb-80a8-5756-8c8beb6105d3	0986	AK
00190000-55bb-80a8-dec0-d65405d89880	00080000-55bb-80a8-6240-5112ef455aac	0984	AK
00190000-55bb-80a8-47fe-0498bac2ca8b	00080000-55bb-80a8-ccc6-9422b78876fc	0983	AK
00190000-55bb-80a8-ef85-2d793d782866	00080000-55bb-80a8-7c3a-de779a0f3070	0982	AK
\.


--
-- TOC entry 3016 (class 0 OID 11352402)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55bb-80a8-28d8-27516f8173d9	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2961 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 11352440)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 11352147)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55bb-80a8-bbda-3c93e08c5a97	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55bb-80a8-cea7-3fff7c3a7dce	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55bb-80a8-a327-3d0056b0dff6	0003	Kazinska	t	84	Kazinska dvorana
00220000-55bb-80a8-e728-197cbd2b2fe4	0004	Mali oder	t	24	Mali oder 
00220000-55bb-80a8-c730-8b01b0610415	0005	Komorni oder	t	15	Komorni oder
00220000-55bb-80a8-e10b-e03bcd1ff9fc	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55bb-80a8-1dea-7083be6a6384	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2990 (class 0 OID 11352091)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11352081)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11352266)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 11352215)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 11351789)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2999 (class 0 OID 11352157)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 11351827)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55bb-80a7-aa1a-87d70d15db46	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55bb-80a7-57db-ed0cc7b08910	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55bb-80a7-3ce4-035826504b85	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55bb-80a7-05a4-5d454c0bfd89	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55bb-80a7-36f6-052a5f2ea272	planer	Planer dogodkov v koledarju	t
00020000-55bb-80a7-a85f-11842418945f	kadrovska	Kadrovska služba	t
00020000-55bb-80a7-bbf4-a5425ec3296b	arhivar	Ažuriranje arhivalij	t
00020000-55bb-80a7-123d-d736dcdad75c	igralec	Igralec	t
00020000-55bb-80a7-215d-257d10baf1a1	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55bb-80a8-39bc-174cb251a946	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2965 (class 0 OID 11351811)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55bb-80a7-1ee2-9db8a6853c18	00020000-55bb-80a7-3ce4-035826504b85
00010000-55bb-80a7-dc6a-4d19019545be	00020000-55bb-80a7-3ce4-035826504b85
00010000-55bb-80a8-57ed-e80b8fb19dd5	00020000-55bb-80a8-39bc-174cb251a946
\.


--
-- TOC entry 3001 (class 0 OID 11352171)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11352112)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11352062)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 11352481)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55bb-80a7-1c71-4bfb62aa35d0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55bb-80a7-7a26-2773ef3d9331	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55bb-80a7-7f9d-b4106df95919	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55bb-80a7-e703-5d8f3bf306bc	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55bb-80a7-b3b4-7fac995d290d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3023 (class 0 OID 11352473)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55bb-80a7-3993-18558d1336e0	00230000-55bb-80a7-e703-5d8f3bf306bc	popa
00240000-55bb-80a7-501b-e71cbc5d1846	00230000-55bb-80a7-e703-5d8f3bf306bc	oseba
00240000-55bb-80a7-274b-92854274afeb	00230000-55bb-80a7-7a26-2773ef3d9331	prostor
00240000-55bb-80a7-bc82-f0f59deea31a	00230000-55bb-80a7-e703-5d8f3bf306bc	besedilo
00240000-55bb-80a7-e16d-827f4a12cb5a	00230000-55bb-80a7-e703-5d8f3bf306bc	uprizoritev
00240000-55bb-80a7-ad6c-dd2d0c486f36	00230000-55bb-80a7-e703-5d8f3bf306bc	funkcija
00240000-55bb-80a7-05ed-e3be39bd47b6	00230000-55bb-80a7-e703-5d8f3bf306bc	tipfunkcije
00240000-55bb-80a7-6e3a-c8d3e037eb62	00230000-55bb-80a7-e703-5d8f3bf306bc	alternacija
00240000-55bb-80a7-55d7-41cff83773aa	00230000-55bb-80a7-1c71-4bfb62aa35d0	pogodba
00240000-55bb-80a7-40c3-695f2ded63b4	00230000-55bb-80a7-e703-5d8f3bf306bc	zaposlitev
00240000-55bb-80a7-5823-74471f81b581	00230000-55bb-80a7-1c71-4bfb62aa35d0	programdela
00240000-55bb-80a7-ba80-b3d3a050bbff	00230000-55bb-80a7-e703-5d8f3bf306bc	zapis
\.


--
-- TOC entry 3022 (class 0 OID 11352468)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 11352225)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55bb-80a8-e99b-7f3487bafa2e	000e0000-55bb-80a8-43f3-f731c5afad20	00080000-55bb-80a8-ebd9-b9c17adb8868	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55bb-80a8-5b4f-9ba3486bdffa	000e0000-55bb-80a8-43f3-f731c5afad20	00080000-55bb-80a8-ebd9-b9c17adb8868	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55bb-80a8-ac66-528d8f50d37e	000e0000-55bb-80a8-43f3-f731c5afad20	00080000-55bb-80a8-b862-10eaedf7c03c	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55bb-80a8-1fff-94f96f31abff	000e0000-55bb-80a8-43f3-f731c5afad20	00080000-55bb-80a8-b862-10eaedf7c03c	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2972 (class 0 OID 11351889)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 11352068)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55bb-80a9-c93a-f65aafe1dbd9	00180000-55bb-80a8-50c5-4800e30aadc4	000c0000-55bb-80a8-56b7-1f55051564e4	00090000-55bb-80a8-9337-243c7d0c85b5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bb-80a9-7f35-745d8e608e6d	00180000-55bb-80a8-50c5-4800e30aadc4	000c0000-55bb-80a8-d386-ce61efa0abac	00090000-55bb-80a8-d55b-12729c6461be	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bb-80a9-2343-bd672437b550	00180000-55bb-80a8-50c5-4800e30aadc4	000c0000-55bb-80a8-ae1b-2c6ff7286981	00090000-55bb-80a8-9faa-3571f4fef240	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bb-80a9-702c-57b7713be58b	00180000-55bb-80a8-50c5-4800e30aadc4	000c0000-55bb-80a8-fa20-270b16824a8b	00090000-55bb-80a8-0901-ee7582ba5197	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bb-80a9-b211-4ec1d1816467	00180000-55bb-80a8-50c5-4800e30aadc4	000c0000-55bb-80a8-ec77-1f614d6d96f7	00090000-55bb-80a8-7d8f-35f301b20a6d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bb-80a9-b84d-4c8b1fd5deeb	00180000-55bb-80a8-3b49-0e0ace74c87c	\N	00090000-55bb-80a8-7d8f-35f301b20a6d	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3008 (class 0 OID 11352255)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55bb-80a7-167e-d7b8acba379c	Avtor	Avtorji	Avtorka	umetnik
000f0000-55bb-80a7-3cf0-b5dcc98baa8d	Priredba	Priredba	Priredba	umetnik
000f0000-55bb-80a7-c600-6325b068655c	Prevod	Prevod	Prevod	umetnik
000f0000-55bb-80a7-ae46-71ebac3a74a3	Režija	Režija	Režija	umetnik
000f0000-55bb-80a7-ffc4-9f1e6d000162	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55bb-80a7-bfdc-41a981604512	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55bb-80a7-8f15-5b5b929865d5	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55bb-80a7-c14d-944cb1ae234e	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55bb-80a7-6725-d0c3dcddb1e4	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55bb-80a7-f6be-2061dc69b3e2	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55bb-80a7-86e4-d77d76374957	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55bb-80a7-5db2-bf96f381feb5	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55bb-80a7-caf8-a384decf73df	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55bb-80a7-f6e8-d82e3e61f84d	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55bb-80a7-8536-5ee027e3764e	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55bb-80a7-4767-242c3b8aab44	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55bb-80a7-61ee-24cced62e0e4	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55bb-80a7-54be-8f2aba9c510c	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3020 (class 0 OID 11352450)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55bb-80a7-7fe9-d9785aaaab0a	01	Velika predstava	f	1.00	1.00
002b0000-55bb-80a7-5de0-2ee74c5e5a45	02	Mala predstava	f	0.50	0.50
002b0000-55bb-80a7-abd7-b16528f6d2fc	03	Mala koprodukcija	t	0.40	1.00
002b0000-55bb-80a7-2071-614af25ce535	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55bb-80a7-8b4c-b6f7c4bc38d2	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2977 (class 0 OID 11351952)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 11351798)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55bb-80a7-dc6a-4d19019545be	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROuNiVivvaIO6pNGNZxVL20sveLGLsx4O	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55bb-80a8-3413-d471707cfb28	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55bb-80a8-db4c-00f4e44bcf59	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55bb-80a8-844d-9c9e0ac1180d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55bb-80a8-dddc-dfcd4969c2da	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55bb-80a8-ab9b-4414abcf38a5	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55bb-80a8-848b-71637699afd6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55bb-80a8-3dc4-8d713447675a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55bb-80a8-f36f-e88ca022ce96	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55bb-80a8-a84d-d68f58577cf7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55bb-80a8-57ed-e80b8fb19dd5	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55bb-80a7-1ee2-9db8a6853c18	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3012 (class 0 OID 11352303)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55bb-80a8-d849-e11de795f40b	00160000-55bb-80a8-d895-8c609e130d26	00150000-55bb-80a7-3fcf-d1d8b491dea8	00140000-55bb-80a6-66eb-2b457ca8267a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55bb-80a8-c730-8b01b0610415
000e0000-55bb-80a8-43f3-f731c5afad20	00160000-55bb-80a8-bcd9-a59ff395be27	00150000-55bb-80a7-1cfd-749fec3141f4	00140000-55bb-80a6-4a5f-7e8af3594a41	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55bb-80a8-e10b-e03bcd1ff9fc
000e0000-55bb-80a8-939a-91c94b1cd417	\N	00150000-55bb-80a7-1cfd-749fec3141f4	00140000-55bb-80a6-4a5f-7e8af3594a41	00190000-55bb-80a8-f31f-d08332e835c3	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55bb-80a8-c730-8b01b0610415
000e0000-55bb-80a8-e77e-775d54f71763	\N	00150000-55bb-80a7-1cfd-749fec3141f4	00140000-55bb-80a6-4a5f-7e8af3594a41	00190000-55bb-80a8-f31f-d08332e835c3	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55bb-80a8-c730-8b01b0610415
000e0000-55bb-80a8-0ecd-16d564ef6da4	\N	00150000-55bb-80a7-1cfd-749fec3141f4	00140000-55bb-80a6-4a5f-7e8af3594a41	00190000-55bb-80a8-f31f-d08332e835c3	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55bb-80a8-bbda-3c93e08c5a97
\.


--
-- TOC entry 2982 (class 0 OID 11352014)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55bb-80a8-4a6d-c21377b55e9b	000e0000-55bb-80a8-43f3-f731c5afad20	1	
00200000-55bb-80a8-e480-bc8c589b9fcf	000e0000-55bb-80a8-43f3-f731c5afad20	2	
\.


--
-- TOC entry 2997 (class 0 OID 11352139)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11352520)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 11352492)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11352532)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11352208)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55bb-80a8-b0b3-89032a5cf9b9	00090000-55bb-80a8-d55b-12729c6461be	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bb-80a8-8166-1ebc831e9a7e	00090000-55bb-80a8-9faa-3571f4fef240	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bb-80a8-56c7-47ffb1666c8b	00090000-55bb-80a8-81f4-8f2b0628332a	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bb-80a8-f8af-d25efafb5d95	00090000-55bb-80a8-c723-f38753b451f9	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bb-80a8-6ea6-8c3397f4631a	00090000-55bb-80a8-9337-243c7d0c85b5	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bb-80a8-b6a1-1be58ffb9268	00090000-55bb-80a8-d164-e71f07b723f4	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2984 (class 0 OID 11352046)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 11352293)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55bb-80a6-66eb-2b457ca8267a	01	Drama	drama (SURS 01)
00140000-55bb-80a6-4d99-fdcf481b3b55	02	Opera	opera (SURS 02)
00140000-55bb-80a6-2bf8-d08084095504	03	Balet	balet (SURS 03)
00140000-55bb-80a6-a080-878e436e8a1a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55bb-80a6-c921-cb72842ffa2e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55bb-80a6-4a5f-7e8af3594a41	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55bb-80a6-1158-ffb9cb702211	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3003 (class 0 OID 11352198)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55bb-80a7-85d2-d8110e7ff5d4	01	Opera	opera
00150000-55bb-80a7-ff7d-bbe172c3baca	02	Opereta	opereta
00150000-55bb-80a7-ceb1-9c403ad03807	03	Balet	balet
00150000-55bb-80a7-c0af-87ddbc856b2c	04	Plesne prireditve	plesne prireditve
00150000-55bb-80a7-e015-ae79387e51a2	05	Lutkovno gledališče	lutkovno gledališče
00150000-55bb-80a7-3415-8457afe62bb9	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55bb-80a7-c40f-01fd70556d5c	07	Biografska drama	biografska drama
00150000-55bb-80a7-3fcf-d1d8b491dea8	08	Komedija	komedija
00150000-55bb-80a7-506b-3feea955fa6a	09	Črna komedija	črna komedija
00150000-55bb-80a7-f76f-dcd0797bbb2d	10	E-igra	E-igra
00150000-55bb-80a7-1cfd-749fec3141f4	11	Kriminalka	kriminalka
00150000-55bb-80a7-48c3-109ccc2f7dea	12	Musical	musical
\.


--
-- TOC entry 2509 (class 2606 OID 11351852)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 11352350)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 11352340)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11352254)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 11352573)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 11352036)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 11352061)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 11352466)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 11351978)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 11352396)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 11352194)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 11352012)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 11352055)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 11351992)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 11352104)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 11352549)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11352556)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2749 (class 2606 OID 11352581)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 11352131)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 11351950)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 11351861)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2516 (class 2606 OID 11351885)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 11351841)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2500 (class 2606 OID 11351826)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 11352137)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 11352170)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 11352288)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 11351914)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 11351938)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 11352110)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 11351928)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 11351999)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 11352122)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 11352429)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 11352437)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 11352419)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 11352448)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 11352154)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 11352095)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 11352086)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 11352276)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 11352222)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 11351797)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 11352161)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 11351815)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2502 (class 2606 OID 11351835)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 11352179)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 11352117)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 11352067)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 11352490)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 11352478)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 11352472)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 11352235)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 11351894)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 11352077)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11352265)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11352460)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 11351963)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 11351810)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 11352319)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 11352021)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 11352145)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 11352530)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 11352514)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 11352538)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 11352213)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 11352050)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 11352301)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 11352206)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 1259 OID 11352043)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2649 (class 1259 OID 11352236)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2650 (class 1259 OID 11352237)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 11352551)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2736 (class 1259 OID 11352550)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2523 (class 1259 OID 11351916)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2470 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2472 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2614 (class 1259 OID 11352138)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 11352518)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2723 (class 1259 OID 11352517)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2724 (class 1259 OID 11352519)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2725 (class 1259 OID 11352516)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2726 (class 1259 OID 11352515)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2608 (class 1259 OID 11352124)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2609 (class 1259 OID 11352123)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2560 (class 1259 OID 11352022)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 11352195)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 11352197)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 11352196)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2548 (class 1259 OID 11351994)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2549 (class 1259 OID 11351993)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2705 (class 1259 OID 11352449)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2659 (class 1259 OID 11352290)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 11352291)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2661 (class 1259 OID 11352292)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2732 (class 1259 OID 11352539)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2484 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2485 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2668 (class 1259 OID 11352324)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2669 (class 1259 OID 11352321)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2670 (class 1259 OID 11352325)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2671 (class 1259 OID 11352323)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2672 (class 1259 OID 11352322)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2538 (class 1259 OID 11351965)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 11351964)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2475 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2514 (class 1259 OID 11351888)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 11352162)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2578 (class 1259 OID 11352056)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 11351842)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2505 (class 1259 OID 11351843)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 11352182)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 11352181)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 11352180)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2552 (class 1259 OID 11352000)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 11352002)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2554 (class 1259 OID 11352001)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2715 (class 1259 OID 11352480)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2588 (class 1259 OID 11352090)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2589 (class 1259 OID 11352088)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2590 (class 1259 OID 11352087)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2591 (class 1259 OID 11352089)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2495 (class 1259 OID 11351816)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2496 (class 1259 OID 11351817)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2617 (class 1259 OID 11352146)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 11352574)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2746 (class 1259 OID 11352582)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 11352583)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2603 (class 1259 OID 11352111)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 11352223)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 11352224)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 11352401)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2690 (class 1259 OID 11352400)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2691 (class 1259 OID 11352397)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2692 (class 1259 OID 11352398)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2693 (class 1259 OID 11352399)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2527 (class 1259 OID 11351930)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2528 (class 1259 OID 11351929)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2529 (class 1259 OID 11351931)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2488 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2697 (class 1259 OID 11352430)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2698 (class 1259 OID 11352431)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2682 (class 1259 OID 11352354)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2683 (class 1259 OID 11352355)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2684 (class 1259 OID 11352352)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2685 (class 1259 OID 11352353)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 11352214)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 11352099)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2595 (class 1259 OID 11352098)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2596 (class 1259 OID 11352096)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2597 (class 1259 OID 11352097)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2466 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2678 (class 1259 OID 11352342)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 11352341)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2694 (class 1259 OID 11352420)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2559 (class 1259 OID 11352013)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2712 (class 1259 OID 11352467)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 11352557)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 11352558)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2510 (class 1259 OID 11351863)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2511 (class 1259 OID 11351862)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2519 (class 1259 OID 11351895)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 11351896)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2583 (class 1259 OID 11352080)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 11352079)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2585 (class 1259 OID 11352078)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2479 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2480 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2481 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2566 (class 1259 OID 11352045)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2567 (class 1259 OID 11352041)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2568 (class 1259 OID 11352038)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 11352039)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 11352037)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 11352042)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2572 (class 1259 OID 11352040)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2526 (class 1259 OID 11351915)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 11351979)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 11351981)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2546 (class 1259 OID 11351980)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2547 (class 1259 OID 11351982)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2602 (class 1259 OID 11352105)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2664 (class 1259 OID 11352289)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 11352320)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2517 (class 1259 OID 11351886)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2518 (class 1259 OID 11351887)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 11352207)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 11352491)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 11351951)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2718 (class 1259 OID 11352479)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2622 (class 1259 OID 11352156)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 11352155)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 11352351)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2534 (class 1259 OID 11351939)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 11352302)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 11352531)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2703 (class 1259 OID 11352438)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 11352439)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2503 (class 1259 OID 11351836)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2573 (class 1259 OID 11352044)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2775 (class 2606 OID 11352719)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2778 (class 2606 OID 11352704)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2777 (class 2606 OID 11352709)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2773 (class 2606 OID 11352729)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2779 (class 2606 OID 11352699)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2774 (class 2606 OID 11352724)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2776 (class 2606 OID 11352714)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2809 (class 2606 OID 11352874)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 11352879)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 11353049)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2843 (class 2606 OID 11353044)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 11352634)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2796 (class 2606 OID 11352814)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2837 (class 2606 OID 11353029)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2838 (class 2606 OID 11353024)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2836 (class 2606 OID 11353034)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 11353019)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2840 (class 2606 OID 11353014)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2794 (class 2606 OID 11352809)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2795 (class 2606 OID 11352804)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2772 (class 2606 OID 11352694)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 11352844)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 11352854)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2803 (class 2606 OID 11352849)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2766 (class 2606 OID 11352669)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 11352664)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2792 (class 2606 OID 11352794)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 11352999)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2812 (class 2606 OID 11352884)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 11352889)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 11352894)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2841 (class 2606 OID 11353039)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2814 (class 2606 OID 11352914)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2817 (class 2606 OID 11352899)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2813 (class 2606 OID 11352919)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2815 (class 2606 OID 11352909)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2816 (class 2606 OID 11352904)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2764 (class 2606 OID 11352659)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 11352654)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 11352619)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2757 (class 2606 OID 11352614)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2798 (class 2606 OID 11352824)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 11352734)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 11352594)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2752 (class 2606 OID 11352599)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 11352839)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2800 (class 2606 OID 11352834)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 11352829)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2770 (class 2606 OID 11352674)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 11352684)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2769 (class 2606 OID 11352679)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2835 (class 2606 OID 11353009)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2784 (class 2606 OID 11352769)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2786 (class 2606 OID 11352759)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2787 (class 2606 OID 11352754)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2785 (class 2606 OID 11352764)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2751 (class 2606 OID 11352584)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2750 (class 2606 OID 11352589)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2797 (class 2606 OID 11352819)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2846 (class 2606 OID 11353064)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 11353069)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 11353074)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2793 (class 2606 OID 11352799)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2807 (class 2606 OID 11352864)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2806 (class 2606 OID 11352869)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2824 (class 2606 OID 11352974)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2825 (class 2606 OID 11352969)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2828 (class 2606 OID 11352954)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 11352959)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2826 (class 2606 OID 11352964)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2762 (class 2606 OID 11352644)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 11352639)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 11352649)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 11352984)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2830 (class 2606 OID 11352989)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2821 (class 2606 OID 11352944)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 11352949)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2823 (class 2606 OID 11352934)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2822 (class 2606 OID 11352939)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2805 (class 2606 OID 11352859)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 11352789)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2789 (class 2606 OID 11352784)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2791 (class 2606 OID 11352774)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2790 (class 2606 OID 11352779)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2818 (class 2606 OID 11352929)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2819 (class 2606 OID 11352924)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2829 (class 2606 OID 11352979)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2771 (class 2606 OID 11352689)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2832 (class 2606 OID 11352994)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 11353004)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2845 (class 2606 OID 11353054)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2844 (class 2606 OID 11353059)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2754 (class 2606 OID 11352609)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 11352604)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2759 (class 2606 OID 11352624)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2758 (class 2606 OID 11352629)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 11352749)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 11352744)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2783 (class 2606 OID 11352739)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-31 16:05:30 CEST

--
-- PostgreSQL database dump complete
--

