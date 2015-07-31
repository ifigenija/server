--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-31 12:56:29 CEST

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
-- TOC entry 183 (class 1259 OID 11336686)
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
-- TOC entry 228 (class 1259 OID 11337185)
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
-- TOC entry 227 (class 1259 OID 11337168)
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
-- TOC entry 221 (class 1259 OID 11337080)
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
-- TOC entry 244 (class 1259 OID 11337401)
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
-- TOC entry 197 (class 1259 OID 11336865)
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
-- TOC entry 200 (class 1259 OID 11336899)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11337303)
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
-- TOC entry 192 (class 1259 OID 11336808)
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
-- TOC entry 229 (class 1259 OID 11337198)
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
-- TOC entry 216 (class 1259 OID 11337025)
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
-- TOC entry 195 (class 1259 OID 11336845)
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
-- TOC entry 199 (class 1259 OID 11336893)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11336825)
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
-- TOC entry 205 (class 1259 OID 11336942)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11337382)
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
-- TOC entry 243 (class 1259 OID 11337394)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11337417)
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
-- TOC entry 209 (class 1259 OID 11336967)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11336782)
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
-- TOC entry 184 (class 1259 OID 11336695)
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
-- TOC entry 185 (class 1259 OID 11336706)
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
-- TOC entry 180 (class 1259 OID 11336660)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11336679)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11336974)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11337005)
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
-- TOC entry 224 (class 1259 OID 11337119)
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
-- TOC entry 187 (class 1259 OID 11336739)
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
-- TOC entry 189 (class 1259 OID 11336774)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11336948)
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
-- TOC entry 188 (class 1259 OID 11336759)
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
-- TOC entry 194 (class 1259 OID 11336837)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11336960)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11337263)
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
-- TOC entry 232 (class 1259 OID 11337274)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11337244)
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
-- TOC entry 233 (class 1259 OID 11337282)
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
-- TOC entry 212 (class 1259 OID 11336989)
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
-- TOC entry 204 (class 1259 OID 11336933)
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
-- TOC entry 203 (class 1259 OID 11336923)
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
-- TOC entry 223 (class 1259 OID 11337108)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11337057)
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
-- TOC entry 177 (class 1259 OID 11336631)
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
-- TOC entry 176 (class 1259 OID 11336629)
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
-- TOC entry 213 (class 1259 OID 11336999)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11336669)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11336653)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11337013)
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
-- TOC entry 207 (class 1259 OID 11336954)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11336904)
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
-- TOC entry 238 (class 1259 OID 11337323)
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
-- TOC entry 237 (class 1259 OID 11337315)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11337310)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11337067)
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
-- TOC entry 186 (class 1259 OID 11336731)
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
-- TOC entry 202 (class 1259 OID 11336910)
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
-- TOC entry 222 (class 1259 OID 11337097)
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
-- TOC entry 234 (class 1259 OID 11337292)
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
-- TOC entry 191 (class 1259 OID 11336794)
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
-- TOC entry 178 (class 1259 OID 11336640)
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
-- TOC entry 226 (class 1259 OID 11337145)
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
-- TOC entry 196 (class 1259 OID 11336856)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11336981)
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
-- TOC entry 240 (class 1259 OID 11337362)
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
-- TOC entry 239 (class 1259 OID 11337334)
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
-- TOC entry 241 (class 1259 OID 11337374)
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
-- TOC entry 218 (class 1259 OID 11337050)
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
-- TOC entry 198 (class 1259 OID 11336888)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11337135)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11337040)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2245 (class 2604 OID 11336634)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2969 (class 0 OID 11336686)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 11337185)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55bb-545c-878c-ac9450c843f7	000d0000-55bb-545c-bca5-a5e3fc5098ae	\N	00090000-55bb-545c-749a-d52c0e8095ef	000b0000-55bb-545c-d0f5-d68235027542	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55bb-545c-3f1d-ab6911272e56	000d0000-55bb-545c-7dc2-94bd6547ba14	00100000-55bb-545c-a765-d4c2ae231a96	00090000-55bb-545c-b81d-4e25349cd019	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55bb-545c-3c5c-50f711759dab	000d0000-55bb-545c-7586-1c4c6af63232	00100000-55bb-545c-ab38-f8f6d0df9018	00090000-55bb-545c-c86a-fcc7f04fd879	\N	0003	t	\N	2015-07-31	\N	2	\N	\N	f	f
000c0000-55bb-545c-7aca-503e34547b82	000d0000-55bb-545c-8edf-ba2365f9ce2c	\N	00090000-55bb-545c-8b09-4b179bf44f55	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55bb-545c-b728-db4e388c0c6d	000d0000-55bb-545c-f7e9-4ffed8b44c0e	\N	00090000-55bb-545c-49f0-8e99264e1484	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55bb-545c-dacf-ddb12b534009	000d0000-55bb-545c-0ad1-bb383ce19553	\N	00090000-55bb-545c-ca03-7c6c883d3f7a	000b0000-55bb-545c-5291-9c84b82c0c21	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55bb-545c-6dd7-9bf2f6cbd352	000d0000-55bb-545c-2b35-2be7a5481df5	00100000-55bb-545c-c132-159700c7e122	00090000-55bb-545c-2e69-18d590ae8374	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55bb-545c-d700-5d22afc2e932	000d0000-55bb-545c-0ccc-c5b9f654c270	\N	00090000-55bb-545c-6250-b83c19232924	000b0000-55bb-545c-001e-0017ae13425e	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55bb-545c-23a5-9cd2e282d615	000d0000-55bb-545c-2b35-2be7a5481df5	00100000-55bb-545c-458e-f5b154c84e3e	00090000-55bb-545c-c45d-a2c965dedabe	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55bb-545c-2818-e15413b9f917	000d0000-55bb-545c-2b35-2be7a5481df5	00100000-55bb-545c-2449-838b64c0aa18	00090000-55bb-545c-7182-8f4e14539cf9	\N	0010	t	\N	2015-07-31	\N	16	\N	\N	f	t
000c0000-55bb-545c-d3d0-cd8bed316847	000d0000-55bb-545c-2b35-2be7a5481df5	00100000-55bb-545c-8573-6f3eeae3abe2	00090000-55bb-545c-b9c9-2e8ab4b74939	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3013 (class 0 OID 11337168)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11337080)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55bb-545c-2a86-6adf5cf6dd10	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55bb-545c-0fb0-bc4676d0087d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55bb-545c-30d6-b014ee7e45f2	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3030 (class 0 OID 11337401)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 11336865)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55bb-545c-468f-3e571471416d	\N	\N	00200000-55bb-545c-94d0-0d4e136cf049	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55bb-545c-6865-d319eec3f948	\N	\N	00200000-55bb-545c-9937-28fd5104fb72	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55bb-545c-2266-8afea4d03ff0	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55bb-545c-324c-3e3428ee5cb3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55bb-545c-31f6-33402e4a19cd	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2986 (class 0 OID 11336899)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 11337303)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11336808)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55bb-545a-f1d9-6fcffce48017	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55bb-545a-b9c3-1bc4a8f29f25	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55bb-545a-df8a-56acf9b97328	AL	ALB	008	Albania 	Albanija	\N
00040000-55bb-545a-f592-beebf344beeb	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55bb-545a-f4c7-52ac096521c6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55bb-545a-b344-01657ad0b637	AD	AND	020	Andorra 	Andora	\N
00040000-55bb-545a-1162-ea54e00b7ee1	AO	AGO	024	Angola 	Angola	\N
00040000-55bb-545a-d409-ef625318ca1d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55bb-545a-43b7-088f99ff722e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55bb-545a-9f3e-395650c5c494	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55bb-545a-a682-cd85192d3fcb	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55bb-545a-ea3c-1e6f7ae7122a	AM	ARM	051	Armenia 	Armenija	\N
00040000-55bb-545a-76bd-426f5fdc31f5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55bb-545a-7523-7f4e196ef79f	AU	AUS	036	Australia 	Avstralija	\N
00040000-55bb-545a-9a8a-367b30f32ec6	AT	AUT	040	Austria 	Avstrija	\N
00040000-55bb-545a-5b5f-4e9142fc63ae	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55bb-545a-3efa-b2d64ce8c6df	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55bb-545a-92c2-d8839d493f1c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55bb-545a-62b5-cac182801fcf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55bb-545a-0587-f6c37b9f01da	BB	BRB	052	Barbados 	Barbados	\N
00040000-55bb-545a-3bf3-25bf10af58c1	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55bb-545a-784e-7164f7ed7730	BE	BEL	056	Belgium 	Belgija	\N
00040000-55bb-545a-aa41-83c215af6a1b	BZ	BLZ	084	Belize 	Belize	\N
00040000-55bb-545a-19de-b26daba14359	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55bb-545a-57ed-9ef9b094a3b3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55bb-545a-1a25-ae940b3583c5	BT	BTN	064	Bhutan 	Butan	\N
00040000-55bb-545a-ce51-7da20fdf4ce8	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55bb-545a-e9f5-c632b773ea90	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55bb-545a-ad43-6881a8b771e7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55bb-545a-43c9-cf8a39c34726	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55bb-545a-030f-30cb768b3418	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55bb-545a-2a1d-d607a43723fd	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55bb-545a-1f59-a4c00af35ded	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55bb-545a-d9ae-6894d30f34fa	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55bb-545a-3d69-88f979e4cd8e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55bb-545a-3e2d-dbaefded2d8d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55bb-545a-7f74-4d8af1d8a4dd	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55bb-545a-503f-1056ff1085e2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55bb-545a-6983-16bb59d98b80	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55bb-545a-9f71-13e18192b545	CA	CAN	124	Canada 	Kanada	\N
00040000-55bb-545a-2d0c-d363bc48591d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55bb-545a-5e78-943d3e9a38d8	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55bb-545a-48b8-3b4f1bcc9c4a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55bb-545a-e48b-aa22e32340c8	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55bb-545a-7111-36c1727a8345	CL	CHL	152	Chile 	Čile	\N
00040000-55bb-545a-a1c9-79035177dab5	CN	CHN	156	China 	Kitajska	\N
00040000-55bb-545a-4157-45457f569ede	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55bb-545a-ca0d-25e1508e7774	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55bb-545a-5a7a-c0128f61e787	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55bb-545a-372f-508e31138c12	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55bb-545a-1d5d-da58b9dc2d70	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55bb-545a-2f31-d5d30fe2daa5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55bb-545a-0aff-64a46fb78ec1	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55bb-545a-fe95-93df46399dcc	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55bb-545a-8318-abab3dd0e80e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55bb-545a-ac38-9c09acd034f8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55bb-545a-bfae-3d6b920f4dde	CU	CUB	192	Cuba 	Kuba	\N
00040000-55bb-545a-9974-5d49cc87ed40	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55bb-545a-52a4-05602334d478	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55bb-545a-037f-ee3783d08d0d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55bb-545a-3915-694e27679dbe	DK	DNK	208	Denmark 	Danska	\N
00040000-55bb-545a-fc5f-78a3710f2bce	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55bb-545a-ae71-824732d9e2f9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55bb-545a-b012-e55e4d9fa7c2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55bb-545a-b476-8255053b7f50	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55bb-545a-4b73-7a6d1ec24868	EG	EGY	818	Egypt 	Egipt	\N
00040000-55bb-545a-60fe-bc120b806294	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55bb-545a-85cc-0b3564557c8f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55bb-545a-e812-391d5a65e372	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55bb-545a-70ca-3195f8e0325b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55bb-545a-1afa-c4a7d7b0d5b5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55bb-545a-aa19-48e841fc9a0c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55bb-545a-71fb-a5ba6d5f60ce	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55bb-545a-098a-3d5e2e4f4140	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55bb-545a-c7fc-03622550b9b6	FI	FIN	246	Finland 	Finska	\N
00040000-55bb-545a-d468-843ef4ba8f11	FR	FRA	250	France 	Francija	\N
00040000-55bb-545a-e433-a30060030b1a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55bb-545a-95d5-dec50c135174	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55bb-545a-72b9-255f98795170	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55bb-545a-b7bc-c73cb296eac0	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55bb-545a-212f-8f6a08406644	GA	GAB	266	Gabon 	Gabon	\N
00040000-55bb-545a-9975-9960bbdfe06d	GM	GMB	270	Gambia 	Gambija	\N
00040000-55bb-545a-739a-cfcb0420cead	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55bb-545a-85c5-aab2b54818bc	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55bb-545a-2fe7-f7d9598b8cdc	GH	GHA	288	Ghana 	Gana	\N
00040000-55bb-545a-cab9-2ad80558f006	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55bb-545a-8cf9-184375b15926	GR	GRC	300	Greece 	Grčija	\N
00040000-55bb-545a-92cf-9f1f93eba205	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55bb-545a-a716-49c86590d139	GD	GRD	308	Grenada 	Grenada	\N
00040000-55bb-545a-f0a3-a07d19acce4a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55bb-545a-cb80-f33b409f4c2a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55bb-545a-0d45-975b37cb14c0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55bb-545a-541d-7c5a6a252ad1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55bb-545a-b548-897a59585a9c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55bb-545a-d723-85004c14fd7b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55bb-545a-8b60-b5cc27aa89ca	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55bb-545a-bd03-955b9f6192d7	HT	HTI	332	Haiti 	Haiti	\N
00040000-55bb-545a-bf6d-418abdce08bd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55bb-545a-0c0a-52b91d959536	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55bb-545a-efdd-90b841725b91	HN	HND	340	Honduras 	Honduras	\N
00040000-55bb-545a-8521-fc87c64a4b95	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55bb-545a-f198-fe52cc19d17d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55bb-545a-1151-08780b6aeef4	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55bb-545a-6fe8-800c8b558a13	IN	IND	356	India 	Indija	\N
00040000-55bb-545a-588f-1144b8ca539a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55bb-545a-c2e8-e1ef4d836a0c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55bb-545a-a2d2-313bad8fd41f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55bb-545a-1ffa-f469259122ea	IE	IRL	372	Ireland 	Irska	\N
00040000-55bb-545a-78fa-b99240cbbbbc	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55bb-545a-4c74-c4d5c4db1b64	IL	ISR	376	Israel 	Izrael	\N
00040000-55bb-545a-b086-cd684dfc0a44	IT	ITA	380	Italy 	Italija	\N
00040000-55bb-545a-5000-16fd59c0433b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55bb-545a-e25f-7a4f3c761df7	JP	JPN	392	Japan 	Japonska	\N
00040000-55bb-545a-37f3-a589781109f7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55bb-545a-f8a7-7e5b5f244bd3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55bb-545a-a26c-765e29281756	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55bb-545a-8af6-754fecfbe85b	KE	KEN	404	Kenya 	Kenija	\N
00040000-55bb-545a-7e37-3a85fbbef492	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55bb-545a-6390-87d469d0be1f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55bb-545a-89f8-7d4abc0b2481	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55bb-545a-8eb7-18668d140cee	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55bb-545a-da0b-fb18ddb3443a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55bb-545a-f833-479f28cd8134	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55bb-545a-ba51-65351c4fa1dc	LV	LVA	428	Latvia 	Latvija	\N
00040000-55bb-545a-9c79-97725dbca2d9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55bb-545a-5f8c-1a20bb68cdfe	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55bb-545a-d097-55e0c9f2c293	LR	LBR	430	Liberia 	Liberija	\N
00040000-55bb-545a-3c96-ac942cd99b5a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55bb-545a-0002-681cc86cea91	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55bb-545a-8c7f-2653172664c0	LT	LTU	440	Lithuania 	Litva	\N
00040000-55bb-545a-87a2-955a92c3c2d3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55bb-545a-ffc6-c790a0be5c0c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55bb-545a-b5c0-4caa999a1aa5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55bb-545a-54c4-e25532d97207	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55bb-545a-d72c-ff7f5b1c2217	MW	MWI	454	Malawi 	Malavi	\N
00040000-55bb-545a-ddc3-fe822c9d1b31	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55bb-545a-d5a7-0841115e3aed	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55bb-545a-4846-e9303e80cb89	ML	MLI	466	Mali 	Mali	\N
00040000-55bb-545a-84ab-2e6c764bf324	MT	MLT	470	Malta 	Malta	\N
00040000-55bb-545a-271f-cc9a1fe7538d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55bb-545a-a9bb-85159c7b3c41	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55bb-545a-c1c5-63fe15f2495a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55bb-545a-f835-3ee9271be319	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55bb-545a-6bed-36387fa9f09d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55bb-545a-5b03-4aeb0280ab99	MX	MEX	484	Mexico 	Mehika	\N
00040000-55bb-545a-1b3f-33379030c6e8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55bb-545a-992e-17ef5a366a63	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55bb-545a-57d7-135674120a68	MC	MCO	492	Monaco 	Monako	\N
00040000-55bb-545a-3248-39222c32d685	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55bb-545a-456b-cddb40532029	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55bb-545a-92bf-5dcda8dce2a6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55bb-545a-4e46-ed5a97806c57	MA	MAR	504	Morocco 	Maroko	\N
00040000-55bb-545a-3e33-e6cf5afa8661	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55bb-545a-1d02-c21794a9e287	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55bb-545a-18a3-b7c1eb40311d	NA	NAM	516	Namibia 	Namibija	\N
00040000-55bb-545a-0edd-02d5cfe8ec4d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55bb-545a-a32e-663376bf20d7	NP	NPL	524	Nepal 	Nepal	\N
00040000-55bb-545a-6036-e89ae60271dd	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55bb-545a-89f0-4b11328c3e0e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55bb-545a-1e3e-691fbbb9358c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55bb-545a-a594-030cbdbe2e6a	NE	NER	562	Niger 	Niger 	\N
00040000-55bb-545a-b81e-e21d96428be5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55bb-545a-faf4-2d556a946b0e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55bb-545a-6b89-a1399dbeb9d0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55bb-545a-9ab5-a6f3eceb5b79	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55bb-545a-c7dd-cfba85eb19f3	NO	NOR	578	Norway 	Norveška	\N
00040000-55bb-545a-6153-d0f2645196a9	OM	OMN	512	Oman 	Oman	\N
00040000-55bb-545a-6408-b053740d87b1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55bb-545a-0956-ab89ef9ef3b6	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55bb-545a-c2dc-4568d720aa50	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55bb-545a-e07e-6ca0a4fa5d7b	PA	PAN	591	Panama 	Panama	\N
00040000-55bb-545a-8ab0-f4c61f134d5e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55bb-545a-f058-731c673535ce	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55bb-545a-093e-5ec648999fd2	PE	PER	604	Peru 	Peru	\N
00040000-55bb-545a-841f-0cdda525ab50	PH	PHL	608	Philippines 	Filipini	\N
00040000-55bb-545a-1079-1e16dd176284	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55bb-545a-da56-ff4411504dbd	PL	POL	616	Poland 	Poljska	\N
00040000-55bb-545a-c10a-212583bfd658	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55bb-545a-5549-f3886151009a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55bb-545a-3d9f-96fa7c1dbe1c	QA	QAT	634	Qatar 	Katar	\N
00040000-55bb-545a-c0b2-1a53c944c2fe	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55bb-545a-6eeb-25541befe1f6	RO	ROU	642	Romania 	Romunija	\N
00040000-55bb-545a-2467-ae5281b9c847	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55bb-545a-31ec-e3569c862c30	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55bb-545a-13c2-80d8a3dfd717	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55bb-545a-8193-23b30eba35cb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55bb-545a-570c-d5a515fc8213	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55bb-545a-4aa5-37066635b136	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55bb-545a-619e-e4762bdca981	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55bb-545a-4c41-7d3c1debfee4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55bb-545a-05d4-19d9349dbf55	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55bb-545a-0f34-df1af77cfcd8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55bb-545a-6270-222fc207fb5b	SM	SMR	674	San Marino 	San Marino	\N
00040000-55bb-545a-b39d-3a3113af4911	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55bb-545a-325e-69e12da8407c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55bb-545a-f85a-57514c0adf0a	SN	SEN	686	Senegal 	Senegal	\N
00040000-55bb-545a-a3de-53bf01de9244	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55bb-545a-c1d7-4317403d52d3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55bb-545a-3758-8381007ad197	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55bb-545a-a2bb-b88e336b9529	SG	SGP	702	Singapore 	Singapur	\N
00040000-55bb-545a-b342-b48aa980cc9b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55bb-545a-3daa-f57f46bc2692	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55bb-545a-7058-0cf00c7602ef	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55bb-545a-e3e1-ee10e71d1684	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55bb-545a-7dde-c121f0a2ca12	SO	SOM	706	Somalia 	Somalija	\N
00040000-55bb-545a-0867-bdb908b524e8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55bb-545a-fc66-2c0d1bd1b02f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55bb-545a-b02e-4ffaf1356583	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55bb-545a-ff9c-3b304c8d82ce	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55bb-545a-d3bc-f42db629a7f1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55bb-545a-80cc-b6c7798e3658	SD	SDN	729	Sudan 	Sudan	\N
00040000-55bb-545a-f5a8-65ff1e3f91bd	SR	SUR	740	Suriname 	Surinam	\N
00040000-55bb-545a-81b3-9f682e6f9b3d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55bb-545a-a275-4919f0854f31	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55bb-545a-a2a1-208c16d675be	SE	SWE	752	Sweden 	Švedska	\N
00040000-55bb-545a-e197-18c171d1bf96	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55bb-545a-8481-e48ff3ea1c3d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55bb-545a-4bac-0c8364462e0b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55bb-545a-f01d-108a3d949c91	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55bb-545a-94b6-eefd470aee9e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55bb-545a-20a2-9fc5046f7f64	TH	THA	764	Thailand 	Tajska	\N
00040000-55bb-545a-2765-c71031ec424a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55bb-545a-adc8-166b09fcba04	TG	TGO	768	Togo 	Togo	\N
00040000-55bb-545a-7e47-7e3463d68559	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55bb-545a-dcb4-264b6b62dcbb	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55bb-545a-4684-2fa95028785c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55bb-545a-1197-1363174f0455	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55bb-545a-43ef-ade3fa0d3138	TR	TUR	792	Turkey 	Turčija	\N
00040000-55bb-545a-6295-97f6f5f02ab4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55bb-545a-d605-8a6b2c357b4f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bb-545a-ec53-4c9afe5bfb8e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55bb-545a-5bd6-ed7aea770f88	UG	UGA	800	Uganda 	Uganda	\N
00040000-55bb-545a-3f68-440bb83ebaf4	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55bb-545a-a968-1edd637b2b5f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55bb-545a-d509-449793640495	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55bb-545a-8877-7f224a32481b	US	USA	840	United States 	Združene države Amerike	\N
00040000-55bb-545a-b960-0b86e5afb8ef	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55bb-545a-cf16-e6417dbc46e2	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55bb-545a-5914-13c23336b06a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55bb-545a-b300-8592e1c120ed	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55bb-545a-91ce-ad77883c5ee1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55bb-545a-28a5-f97d85eaf1ba	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55bb-545a-5885-cef9f649ef5f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bb-545a-889a-3c397fdaff6a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55bb-545a-7a59-8ad5ccede840	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55bb-545a-4736-aaabd6f7d005	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55bb-545a-c130-c9df4baeb2f1	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55bb-545a-a5cb-9d082a47f7ee	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55bb-545a-218a-f3929dfcb3a1	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3015 (class 0 OID 11337198)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55bb-545c-539d-83799b52f478	000e0000-55bb-545c-48f0-160a27d8a089	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55bb-545b-916b-fec5d70478fa	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55bb-545c-1523-51cd67035154	000e0000-55bb-545c-27b8-5b3abac3d149	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55bb-545b-647d-fa2fb624b911	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bb-545c-07d6-9b1994cd09cb	\N	\N	\N	300.00	300.00	0.00	0.00	20.00	60.00	200.11	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bb-545c-7c2c-0a0e78372a33	\N	\N	\N	203.00	203.00	0.00	0.00	30.00	60.90	100.22	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3002 (class 0 OID 11337025)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55bb-545c-2b35-2be7a5481df5	000e0000-55bb-545c-27b8-5b3abac3d149	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55bb-545b-3aad-6d71544dc3d7
000d0000-55bb-545c-bca5-a5e3fc5098ae	000e0000-55bb-545c-27b8-5b3abac3d149	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55bb-545b-3aad-6d71544dc3d7
000d0000-55bb-545c-7dc2-94bd6547ba14	000e0000-55bb-545c-27b8-5b3abac3d149	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55bb-545b-0a87-449893c8fa60
000d0000-55bb-545c-7586-1c4c6af63232	000e0000-55bb-545c-27b8-5b3abac3d149	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55bb-545b-2b22-26e017332984
000d0000-55bb-545c-8edf-ba2365f9ce2c	000e0000-55bb-545c-27b8-5b3abac3d149	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55bb-545b-cc32-68d3adbc9217
000d0000-55bb-545c-f7e9-4ffed8b44c0e	000e0000-55bb-545c-27b8-5b3abac3d149	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55bb-545b-431c-bf2442c09815
000d0000-55bb-545c-0ad1-bb383ce19553	000e0000-55bb-545c-27b8-5b3abac3d149	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55bb-545b-3aad-6d71544dc3d7
000d0000-55bb-545c-0ccc-c5b9f654c270	000e0000-55bb-545c-27b8-5b3abac3d149	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55bb-545b-f693-8b6e0ebb389d
\.


--
-- TOC entry 2981 (class 0 OID 11336845)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 11336893)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 11336825)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55bb-545c-7965-759ee61ec657	00080000-55bb-545c-ef27-e53c42fc324b	00090000-55bb-545c-7182-8f4e14539cf9	AK		
\.


--
-- TOC entry 2956 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11336942)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11337382)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11337394)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 11337417)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11336967)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 11336782)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55bb-545b-a5fa-86c408058b0b	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55bb-545b-a1c0-43cdc7c86e22	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55bb-545b-9cc1-deafa9ef6613	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55bb-545b-5f95-b307405430c4	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55bb-545b-863d-006e6a65cace	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55bb-545b-2e23-e74a7eef076d	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55bb-545b-f559-bc04d48faaf7	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55bb-545b-4b77-165398357ca9	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bb-545b-759d-23fd68e1b6ca	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bb-545b-f91a-7ae16be058f4	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55bb-545b-1c1b-87a3805b0af4	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55bb-545b-485e-cd5590cd915c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55bb-545b-d134-bdf006ab5b5d	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55bb-545b-f592-93647e0d454f	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55bb-545c-5022-cc80198cecd0	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55bb-545c-686a-137141bf9b72	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55bb-545c-29ac-d4e64dfecd0c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55bb-545c-329e-855ab97afd5c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55bb-545c-9a5f-e3c97c024e28	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55bb-545c-c291-de0c31992bd8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2970 (class 0 OID 11336695)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55bb-545c-b189-c0e66c5a5f51	00000000-55bb-545c-686a-137141bf9b72	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55bb-545c-5467-445aeddf6084	00000000-55bb-545c-686a-137141bf9b72	00010000-55bb-545b-0e5c-b667aec87873	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55bb-545c-68ff-608af70936c0	00000000-55bb-545c-29ac-d4e64dfecd0c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2971 (class 0 OID 11336706)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55bb-545c-749a-d52c0e8095ef	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55bb-545c-8b09-4b179bf44f55	00010000-55bb-545c-dc9b-25b5c49acd69	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55bb-545c-c86a-fcc7f04fd879	00010000-55bb-545c-eb41-0ae395b47e71	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55bb-545c-c45d-a2c965dedabe	00010000-55bb-545c-79f6-9f22a1716813	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55bb-545c-6d5a-667bf1dd447d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55bb-545c-ca03-7c6c883d3f7a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55bb-545c-b9c9-2e8ab4b74939	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55bb-545c-2e69-18d590ae8374	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55bb-545c-7182-8f4e14539cf9	00010000-55bb-545c-dca4-0c8528be6895	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55bb-545c-b81d-4e25349cd019	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55bb-545c-ff2e-6211fcb60788	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55bb-545c-49f0-8e99264e1484	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55bb-545c-6250-b83c19232924	00010000-55bb-545c-c738-22a73929c86c	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2958 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 11336660)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55bb-545a-a9ed-1218c9a4413e	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55bb-545a-e491-748de1639e1d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55bb-545a-aa28-62d6c09fdb6a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55bb-545a-dd0e-b6449aeee17d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55bb-545a-aefa-a9bf371e897f	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55bb-545a-5bc9-7288d99eb1b0	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55bb-545a-e687-e694655041de	Abonma-read	Abonma - branje	f
00030000-55bb-545a-486c-a9acde2d2a3c	Abonma-write	Abonma - spreminjanje	f
00030000-55bb-545a-83ef-23165d382772	Alternacija-read	Alternacija - branje	f
00030000-55bb-545a-37d3-77b05536c4a9	Alternacija-write	Alternacija - spreminjanje	f
00030000-55bb-545a-9ed0-9e3df7837fa9	Arhivalija-read	Arhivalija - branje	f
00030000-55bb-545a-24ce-5a6238c6dae3	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55bb-545a-d09c-658ebc25c266	Besedilo-read	Besedilo - branje	f
00030000-55bb-545a-bdcc-dd074d514f41	Besedilo-write	Besedilo - spreminjanje	f
00030000-55bb-545a-368e-d221521eff51	DogodekIzven-read	DogodekIzven - branje	f
00030000-55bb-545a-71a6-3acda5a45358	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55bb-545a-0a16-3e86ec120a28	Dogodek-read	Dogodek - branje	f
00030000-55bb-545a-074a-72069096d434	Dogodek-write	Dogodek - spreminjanje	f
00030000-55bb-545a-ad8f-dedc8ebf213a	DrugiVir-read	DrugiVir - branje	f
00030000-55bb-545a-19cf-18f888fe8968	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55bb-545a-4fd9-8c899107587c	Drzava-read	Drzava - branje	f
00030000-55bb-545a-810b-f37c711b7ee5	Drzava-write	Drzava - spreminjanje	f
00030000-55bb-545a-9dfc-fe60aa665bb0	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55bb-545a-4783-d08d419ef5d9	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55bb-545a-e006-cea82b04975a	Funkcija-read	Funkcija - branje	f
00030000-55bb-545a-1e70-6d50133465ff	Funkcija-write	Funkcija - spreminjanje	f
00030000-55bb-545a-f854-ae8cf1a74511	Gostovanje-read	Gostovanje - branje	f
00030000-55bb-545a-89f2-6b11541b8f02	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55bb-545a-dfb6-13da50222dce	Gostujoca-read	Gostujoca - branje	f
00030000-55bb-545a-36e8-1909d9f45634	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55bb-545a-40e6-326df794742b	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55bb-545a-4fcf-f102c9d95bfe	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55bb-545a-7b1a-3f3ec3819c54	Kupec-read	Kupec - branje	f
00030000-55bb-545a-11b6-396005dd9636	Kupec-write	Kupec - spreminjanje	f
00030000-55bb-545a-a5ce-7a5964f3abe7	NacinPlacina-read	NacinPlacina - branje	f
00030000-55bb-545a-1b89-ebe66d42134b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55bb-545a-2f7a-da905c884ad2	Option-read	Option - branje	f
00030000-55bb-545a-f1e0-26d896ea2c37	Option-write	Option - spreminjanje	f
00030000-55bb-545a-df63-d2dc3a6006dd	OptionValue-read	OptionValue - branje	f
00030000-55bb-545a-0ba3-32176678b287	OptionValue-write	OptionValue - spreminjanje	f
00030000-55bb-545a-9a4f-583b5a0b9dc9	Oseba-read	Oseba - branje	f
00030000-55bb-545a-9f62-6b51708645d3	Oseba-write	Oseba - spreminjanje	f
00030000-55bb-545a-d5a7-9a8e2e7b3570	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55bb-545a-506b-dfb5aa044720	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55bb-545a-495a-6854a51a3fd0	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55bb-545a-7f1c-e4580e3a74cf	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55bb-545a-82dd-d1d740e34e39	Pogodba-read	Pogodba - branje	f
00030000-55bb-545a-9538-c88babc2c314	Pogodba-write	Pogodba - spreminjanje	f
00030000-55bb-545a-788f-86829e1cf282	Popa-read	Popa - branje	f
00030000-55bb-545a-2ef6-bfc8d7f8142b	Popa-write	Popa - spreminjanje	f
00030000-55bb-545a-6f8a-ee29bce9e21d	Posta-read	Posta - branje	f
00030000-55bb-545a-84ae-3b7eb094c19e	Posta-write	Posta - spreminjanje	f
00030000-55bb-545a-5d58-6837221f78af	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55bb-545a-8938-c852db8662ed	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55bb-545a-1f32-fee96c42b110	PostniNaslov-read	PostniNaslov - branje	f
00030000-55bb-545a-0152-01ba17589ce8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55bb-545a-8eb6-025bcb70b84b	Predstava-read	Predstava - branje	f
00030000-55bb-545a-1cb8-e9cf4b81c268	Predstava-write	Predstava - spreminjanje	f
00030000-55bb-545a-8d24-9284d927c85e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55bb-545a-37b1-d22f5426756f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55bb-545a-808f-8293fb082629	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55bb-545a-1661-7953bcebcc95	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55bb-545a-aa1e-4d1df78e2dc3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55bb-545a-d6a1-f43f2dda1173	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55bb-545a-5d2c-21a79ebff009	ProgramDela-read	ProgramDela - branje	f
00030000-55bb-545a-9421-a1ffdbf4affb	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55bb-545a-3662-78b0ad1a3b57	ProgramFestival-read	ProgramFestival - branje	f
00030000-55bb-545a-1db6-83b9a597442a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55bb-545a-84a9-7806e4ef8452	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55bb-545a-9d2a-2dce794c90df	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55bb-545a-5fd8-d2c9009da8e8	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55bb-545a-0c30-545489ba01ba	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55bb-545a-d351-e1c1575720ab	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55bb-545a-5c6a-7770bad64f78	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55bb-545a-1ae6-93da355ccdb7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55bb-545a-0211-82e0a73d1e7b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55bb-545a-f996-fa1dd9cf3683	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55bb-545a-034f-0a6beccced9f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55bb-545a-5817-91b3709af3fd	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55bb-545a-5b01-78009beeee86	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55bb-545a-b980-55bf4e04406b	ProgramRazno-read	ProgramRazno - branje	f
00030000-55bb-545a-acb5-3a7972d9634f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55bb-545a-36de-205ff4ac5c41	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55bb-545a-acbf-ad3ed28998a1	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55bb-545a-4c4e-8432ce657ca0	Prostor-read	Prostor - branje	f
00030000-55bb-545a-4f7d-9b1436ea4c37	Prostor-write	Prostor - spreminjanje	f
00030000-55bb-545a-82ff-bdde74d04efa	Racun-read	Racun - branje	f
00030000-55bb-545a-7011-7b30f6f47961	Racun-write	Racun - spreminjanje	f
00030000-55bb-545a-dc27-19433fd9dc65	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55bb-545a-b39f-5c39480fca81	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55bb-545a-149a-f350e64d3071	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55bb-545a-a0dc-c7ab889b019d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55bb-545a-a3a3-70fdc11545e6	Rekvizit-read	Rekvizit - branje	f
00030000-55bb-545a-6a5e-4f6ac0534823	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55bb-545a-2907-2c71a5ac929a	Revizija-read	Revizija - branje	f
00030000-55bb-545a-b160-c3934563445c	Revizija-write	Revizija - spreminjanje	f
00030000-55bb-545a-8ef4-6c19fb344363	Rezervacija-read	Rezervacija - branje	f
00030000-55bb-545a-1b28-8425206b7cbc	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55bb-545a-aafd-2aeb751eac2c	SedezniRed-read	SedezniRed - branje	f
00030000-55bb-545a-58c2-d62ae816f078	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55bb-545a-b715-70e19b143f87	Sedez-read	Sedez - branje	f
00030000-55bb-545a-6247-2f889e1b2220	Sedez-write	Sedez - spreminjanje	f
00030000-55bb-545a-764d-284871b715eb	Sezona-read	Sezona - branje	f
00030000-55bb-545a-74ae-3c53397ad941	Sezona-write	Sezona - spreminjanje	f
00030000-55bb-545a-5233-4c8cb1614059	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55bb-545a-f7e1-f616f83c092b	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55bb-545a-7ce4-a33f324adb02	Stevilcenje-read	Stevilcenje - branje	f
00030000-55bb-545a-a1db-81e23ac27f2a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55bb-545a-b668-6a438f3836e8	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55bb-545a-b28e-839b2caa1082	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55bb-545a-31f3-ee86eba65aff	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55bb-545a-6e26-166c83f45b0e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55bb-545a-1007-23c4028c005c	Telefonska-read	Telefonska - branje	f
00030000-55bb-545a-98c4-9518b0e948e3	Telefonska-write	Telefonska - spreminjanje	f
00030000-55bb-545a-d65f-4312590f6f45	TerminStoritve-read	TerminStoritve - branje	f
00030000-55bb-545a-06bb-50055a910b4c	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55bb-545a-03b9-84945a6dfa65	TipFunkcije-read	TipFunkcije - branje	f
00030000-55bb-545b-9c5a-3289190270e5	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55bb-545b-0149-0be7a54162df	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55bb-545b-1345-fb62504664f2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55bb-545b-20f1-d6410d02f031	Trr-read	Trr - branje	f
00030000-55bb-545b-31ee-60612d32593c	Trr-write	Trr - spreminjanje	f
00030000-55bb-545b-54a9-184b27060767	Uprizoritev-read	Uprizoritev - branje	f
00030000-55bb-545b-cbd1-83c676376a82	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55bb-545b-41b1-174deca32cc3	Vaja-read	Vaja - branje	f
00030000-55bb-545b-314b-45a0b7eb5f80	Vaja-write	Vaja - spreminjanje	f
00030000-55bb-545b-841f-28a23d15d77a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55bb-545b-e7e1-f9d44e376ea7	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55bb-545b-6556-3d1ad3f3236c	Zaposlitev-read	Zaposlitev - branje	f
00030000-55bb-545b-4b5a-ee1a6f360795	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55bb-545b-d4d5-23e96905b809	Zasedenost-read	Zasedenost - branje	f
00030000-55bb-545b-e98e-9eb8ffd1c7ff	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55bb-545b-bd6b-3b385e47dc12	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55bb-545b-cb74-65f9e2149075	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55bb-545b-b00c-44c106d1b74f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55bb-545b-428f-0649f50ca44c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55bb-545b-a161-738d3dbbab3c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55bb-545b-3896-2bdabe5158ec	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55bb-545b-84c3-97711da54c25	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55bb-545b-8c3b-1c25ed43e9f4	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55bb-545b-63ca-b2d7ac69dad0	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bb-545b-32a0-9a19ff4a20ff	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bb-545b-a06f-a0ee1dbeb772	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bb-545b-a4d7-fb72f6df41cf	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bb-545b-1b6d-6a37647b1512	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55bb-545b-e0d6-bad9c5191159	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55bb-545b-3aba-d7c162d146e1	Datoteka-write	Datoteka - spreminjanje	f
00030000-55bb-545b-0372-5db0fb1a6f9b	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2968 (class 0 OID 11336679)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55bb-545b-ed94-b25bbae5f03d	00030000-55bb-545a-e491-748de1639e1d
00020000-55bb-545b-bccf-71ff6a464a17	00030000-55bb-545a-4fd9-8c899107587c
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-e687-e694655041de
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-486c-a9acde2d2a3c
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-83ef-23165d382772
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-37d3-77b05536c4a9
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-9ed0-9e3df7837fa9
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-0a16-3e86ec120a28
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-dd0e-b6449aeee17d
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-074a-72069096d434
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-4fd9-8c899107587c
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-810b-f37c711b7ee5
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-e006-cea82b04975a
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-1e70-6d50133465ff
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-f854-ae8cf1a74511
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-89f2-6b11541b8f02
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-dfb6-13da50222dce
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-36e8-1909d9f45634
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-40e6-326df794742b
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-4fcf-f102c9d95bfe
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-2f7a-da905c884ad2
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-df63-d2dc3a6006dd
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-9a4f-583b5a0b9dc9
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-9f62-6b51708645d3
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-788f-86829e1cf282
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-2ef6-bfc8d7f8142b
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-6f8a-ee29bce9e21d
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-84ae-3b7eb094c19e
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-1f32-fee96c42b110
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-0152-01ba17589ce8
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-8eb6-025bcb70b84b
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-1cb8-e9cf4b81c268
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-aa1e-4d1df78e2dc3
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-d6a1-f43f2dda1173
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-4c4e-8432ce657ca0
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-4f7d-9b1436ea4c37
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-149a-f350e64d3071
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-a0dc-c7ab889b019d
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-a3a3-70fdc11545e6
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-6a5e-4f6ac0534823
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-764d-284871b715eb
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-74ae-3c53397ad941
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545a-03b9-84945a6dfa65
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545b-54a9-184b27060767
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545b-cbd1-83c676376a82
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545b-41b1-174deca32cc3
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545b-314b-45a0b7eb5f80
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545b-d4d5-23e96905b809
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545b-e98e-9eb8ffd1c7ff
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545b-bd6b-3b385e47dc12
00020000-55bb-545b-d414-0f4e59c81bcf	00030000-55bb-545b-b00c-44c106d1b74f
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-e687-e694655041de
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-9ed0-9e3df7837fa9
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-0a16-3e86ec120a28
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-4fd9-8c899107587c
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-f854-ae8cf1a74511
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-dfb6-13da50222dce
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-40e6-326df794742b
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-4fcf-f102c9d95bfe
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-2f7a-da905c884ad2
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-df63-d2dc3a6006dd
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-9a4f-583b5a0b9dc9
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-9f62-6b51708645d3
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-788f-86829e1cf282
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-6f8a-ee29bce9e21d
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-1f32-fee96c42b110
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-0152-01ba17589ce8
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-8eb6-025bcb70b84b
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-4c4e-8432ce657ca0
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-149a-f350e64d3071
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-a3a3-70fdc11545e6
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-764d-284871b715eb
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-1007-23c4028c005c
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545a-98c4-9518b0e948e3
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545b-20f1-d6410d02f031
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545b-31ee-60612d32593c
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545b-6556-3d1ad3f3236c
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545b-4b5a-ee1a6f360795
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545b-bd6b-3b385e47dc12
00020000-55bb-545b-15a8-8f90bf2db23f	00030000-55bb-545b-b00c-44c106d1b74f
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-e687-e694655041de
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-83ef-23165d382772
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-9ed0-9e3df7837fa9
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-24ce-5a6238c6dae3
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-d09c-658ebc25c266
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-368e-d221521eff51
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-0a16-3e86ec120a28
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-4fd9-8c899107587c
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-e006-cea82b04975a
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-f854-ae8cf1a74511
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-dfb6-13da50222dce
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-40e6-326df794742b
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-2f7a-da905c884ad2
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-df63-d2dc3a6006dd
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-9a4f-583b5a0b9dc9
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-788f-86829e1cf282
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-6f8a-ee29bce9e21d
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-8eb6-025bcb70b84b
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-aa1e-4d1df78e2dc3
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-4c4e-8432ce657ca0
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-149a-f350e64d3071
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-a3a3-70fdc11545e6
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-764d-284871b715eb
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545a-03b9-84945a6dfa65
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545b-41b1-174deca32cc3
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545b-d4d5-23e96905b809
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545b-bd6b-3b385e47dc12
00020000-55bb-545b-9769-a346a380a8b9	00030000-55bb-545b-b00c-44c106d1b74f
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-e687-e694655041de
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-486c-a9acde2d2a3c
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-37d3-77b05536c4a9
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-9ed0-9e3df7837fa9
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-0a16-3e86ec120a28
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-4fd9-8c899107587c
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-f854-ae8cf1a74511
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-dfb6-13da50222dce
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-2f7a-da905c884ad2
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-df63-d2dc3a6006dd
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-788f-86829e1cf282
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-6f8a-ee29bce9e21d
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-8eb6-025bcb70b84b
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-4c4e-8432ce657ca0
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-149a-f350e64d3071
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-a3a3-70fdc11545e6
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-764d-284871b715eb
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545a-03b9-84945a6dfa65
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545b-bd6b-3b385e47dc12
00020000-55bb-545b-a46e-2be07abb9d44	00030000-55bb-545b-b00c-44c106d1b74f
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-e687-e694655041de
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-9ed0-9e3df7837fa9
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-0a16-3e86ec120a28
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-4fd9-8c899107587c
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-f854-ae8cf1a74511
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-dfb6-13da50222dce
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-2f7a-da905c884ad2
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-df63-d2dc3a6006dd
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-788f-86829e1cf282
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-6f8a-ee29bce9e21d
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-8eb6-025bcb70b84b
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-4c4e-8432ce657ca0
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-149a-f350e64d3071
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-a3a3-70fdc11545e6
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-764d-284871b715eb
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-d65f-4312590f6f45
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-aa28-62d6c09fdb6a
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545a-03b9-84945a6dfa65
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545b-bd6b-3b385e47dc12
00020000-55bb-545b-2c1a-8a5ed6cc53d1	00030000-55bb-545b-b00c-44c106d1b74f
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-a9ed-1218c9a4413e
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-e491-748de1639e1d
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-aa28-62d6c09fdb6a
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-dd0e-b6449aeee17d
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-aefa-a9bf371e897f
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-5bc9-7288d99eb1b0
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-e687-e694655041de
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-486c-a9acde2d2a3c
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-83ef-23165d382772
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-37d3-77b05536c4a9
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-9ed0-9e3df7837fa9
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-24ce-5a6238c6dae3
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-d09c-658ebc25c266
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-bdcc-dd074d514f41
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-368e-d221521eff51
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-71a6-3acda5a45358
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-0a16-3e86ec120a28
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-074a-72069096d434
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-4fd9-8c899107587c
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-810b-f37c711b7ee5
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-ad8f-dedc8ebf213a
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-19cf-18f888fe8968
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-9dfc-fe60aa665bb0
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-4783-d08d419ef5d9
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-e006-cea82b04975a
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-1e70-6d50133465ff
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-f854-ae8cf1a74511
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-89f2-6b11541b8f02
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-dfb6-13da50222dce
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-36e8-1909d9f45634
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-40e6-326df794742b
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-4fcf-f102c9d95bfe
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-7b1a-3f3ec3819c54
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-11b6-396005dd9636
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-a5ce-7a5964f3abe7
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-1b89-ebe66d42134b
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-2f7a-da905c884ad2
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-f1e0-26d896ea2c37
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-df63-d2dc3a6006dd
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-0ba3-32176678b287
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-9a4f-583b5a0b9dc9
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-9f62-6b51708645d3
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-d5a7-9a8e2e7b3570
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-506b-dfb5aa044720
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-495a-6854a51a3fd0
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-7f1c-e4580e3a74cf
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-82dd-d1d740e34e39
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-9538-c88babc2c314
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-788f-86829e1cf282
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-2ef6-bfc8d7f8142b
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-6f8a-ee29bce9e21d
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-84ae-3b7eb094c19e
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-5d58-6837221f78af
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-8938-c852db8662ed
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-1f32-fee96c42b110
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-0152-01ba17589ce8
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-8eb6-025bcb70b84b
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-1cb8-e9cf4b81c268
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-8d24-9284d927c85e
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-37b1-d22f5426756f
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-808f-8293fb082629
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-1661-7953bcebcc95
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-aa1e-4d1df78e2dc3
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-d6a1-f43f2dda1173
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-5d2c-21a79ebff009
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-9421-a1ffdbf4affb
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-3662-78b0ad1a3b57
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-1db6-83b9a597442a
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-84a9-7806e4ef8452
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-9d2a-2dce794c90df
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-5fd8-d2c9009da8e8
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-0c30-545489ba01ba
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-d351-e1c1575720ab
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-5c6a-7770bad64f78
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-1ae6-93da355ccdb7
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-0211-82e0a73d1e7b
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-f996-fa1dd9cf3683
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-034f-0a6beccced9f
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-5817-91b3709af3fd
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-5b01-78009beeee86
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-b980-55bf4e04406b
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-acb5-3a7972d9634f
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-36de-205ff4ac5c41
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-acbf-ad3ed28998a1
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-4c4e-8432ce657ca0
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-4f7d-9b1436ea4c37
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-82ff-bdde74d04efa
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-7011-7b30f6f47961
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-dc27-19433fd9dc65
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-b39f-5c39480fca81
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-149a-f350e64d3071
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-a0dc-c7ab889b019d
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-a3a3-70fdc11545e6
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-6a5e-4f6ac0534823
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-2907-2c71a5ac929a
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-b160-c3934563445c
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-8ef4-6c19fb344363
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-1b28-8425206b7cbc
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-aafd-2aeb751eac2c
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-58c2-d62ae816f078
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-b715-70e19b143f87
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-6247-2f889e1b2220
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-764d-284871b715eb
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-74ae-3c53397ad941
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-5233-4c8cb1614059
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-f7e1-f616f83c092b
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-7ce4-a33f324adb02
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-a1db-81e23ac27f2a
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-b668-6a438f3836e8
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-b28e-839b2caa1082
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-31f3-ee86eba65aff
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-6e26-166c83f45b0e
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-1007-23c4028c005c
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-98c4-9518b0e948e3
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-d65f-4312590f6f45
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-06bb-50055a910b4c
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545a-03b9-84945a6dfa65
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-9c5a-3289190270e5
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-0149-0be7a54162df
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-1345-fb62504664f2
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-20f1-d6410d02f031
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-31ee-60612d32593c
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-54a9-184b27060767
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-cbd1-83c676376a82
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-41b1-174deca32cc3
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-314b-45a0b7eb5f80
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-841f-28a23d15d77a
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-e7e1-f9d44e376ea7
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-6556-3d1ad3f3236c
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-4b5a-ee1a6f360795
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-d4d5-23e96905b809
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-e98e-9eb8ffd1c7ff
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-bd6b-3b385e47dc12
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-cb74-65f9e2149075
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-b00c-44c106d1b74f
00020000-55bb-545c-f3ba-21c7329a24e0	00030000-55bb-545b-428f-0649f50ca44c
\.


--
-- TOC entry 2996 (class 0 OID 11336974)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 11337005)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 11337119)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55bb-545c-d0f5-d68235027542	00090000-55bb-545c-749a-d52c0e8095ef	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55bb-545c-5291-9c84b82c0c21	00090000-55bb-545c-ca03-7c6c883d3f7a	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55bb-545c-001e-0017ae13425e	00090000-55bb-545c-6250-b83c19232924	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2973 (class 0 OID 11336739)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55bb-545c-ef27-e53c42fc324b	00040000-55bb-545a-7058-0cf00c7602ef	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-545c-60e5-16d3f9489a67	00040000-55bb-545a-7058-0cf00c7602ef	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55bb-545c-2cce-57b41b16c1df	00040000-55bb-545a-7058-0cf00c7602ef	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-545c-6a7d-d7e1c3465399	00040000-55bb-545a-7058-0cf00c7602ef	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-545c-9c15-b1bf9803815e	00040000-55bb-545a-7058-0cf00c7602ef	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-545c-3e3b-6ac8b0eff144	00040000-55bb-545a-a682-cd85192d3fcb	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-545c-6b75-2d928edf3ae5	00040000-55bb-545a-ac38-9c09acd034f8	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-545c-98e7-a60f0927ef64	00040000-55bb-545a-9a8a-367b30f32ec6	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bb-545c-3c19-994bd891fab9	00040000-55bb-545a-7058-0cf00c7602ef	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2975 (class 0 OID 11336774)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55bb-545b-e524-4b5de5191d10	8341	Adlešiči
00050000-55bb-545b-4cbf-9e9e59a377bb	5270	Ajdovščina
00050000-55bb-545b-1d30-44803275355a	6280	Ankaran/Ancarano
00050000-55bb-545b-6d57-b5308fcace99	9253	Apače
00050000-55bb-545b-8e49-0e821a83d55c	8253	Artiče
00050000-55bb-545b-1b21-619e925e8562	4275	Begunje na Gorenjskem
00050000-55bb-545b-6f0c-30de488bad18	1382	Begunje pri Cerknici
00050000-55bb-545b-4bed-611d23c1710c	9231	Beltinci
00050000-55bb-545b-dab9-dc417f34cbae	2234	Benedikt
00050000-55bb-545b-b7a8-6354e9e15dd9	2345	Bistrica ob Dravi
00050000-55bb-545b-e4de-bd048de06afd	3256	Bistrica ob Sotli
00050000-55bb-545b-18d8-579ea4def930	8259	Bizeljsko
00050000-55bb-545b-4af8-37c9c2d9ad52	1223	Blagovica
00050000-55bb-545b-b171-973ab3362396	8283	Blanca
00050000-55bb-545b-f091-8db058c8f0db	4260	Bled
00050000-55bb-545b-029b-05035b390ca3	4273	Blejska Dobrava
00050000-55bb-545b-b78e-19590fda5cc9	9265	Bodonci
00050000-55bb-545b-2fce-659485cbd1e3	9222	Bogojina
00050000-55bb-545b-f1df-0011b6cfd6dc	4263	Bohinjska Bela
00050000-55bb-545b-72b2-d274699f5b28	4264	Bohinjska Bistrica
00050000-55bb-545b-d180-5fc779ff2ded	4265	Bohinjsko jezero
00050000-55bb-545b-a691-976e21eeec0b	1353	Borovnica
00050000-55bb-545b-25c0-296881738916	8294	Boštanj
00050000-55bb-545b-6a3b-950b2d3f61f7	5230	Bovec
00050000-55bb-545b-9888-829c49a1ac08	5295	Branik
00050000-55bb-545b-f531-f08568316901	3314	Braslovče
00050000-55bb-545b-2495-deb9f2da42de	5223	Breginj
00050000-55bb-545b-6c9e-c9c50140dafa	8280	Brestanica
00050000-55bb-545b-bc27-6a8b250f1779	2354	Bresternica
00050000-55bb-545b-0789-8f32b3133fed	4243	Brezje
00050000-55bb-545b-edcf-d8215682ef50	1351	Brezovica pri Ljubljani
00050000-55bb-545b-29a1-6cff00e5a379	8250	Brežice
00050000-55bb-545b-de4f-6e131c774fac	4210	Brnik - Aerodrom
00050000-55bb-545b-e3bb-8b2316c0be79	8321	Brusnice
00050000-55bb-545b-3f42-e3b5f5b215e0	3255	Buče
00050000-55bb-545b-97aa-2fd786e979a8	8276	Bučka 
00050000-55bb-545b-471b-8f07c09c5f0e	9261	Cankova
00050000-55bb-545b-adc5-568fd13c0e5c	3000	Celje 
00050000-55bb-545b-250b-3ea249d85135	3001	Celje - poštni predali
00050000-55bb-545b-4d70-9c59286704d8	4207	Cerklje na Gorenjskem
00050000-55bb-545b-130b-2a37e64c0823	8263	Cerklje ob Krki
00050000-55bb-545b-31e9-d03cfcb32a4a	1380	Cerknica
00050000-55bb-545b-0899-eb8f7028bdf1	5282	Cerkno
00050000-55bb-545b-1a97-c5538af3736c	2236	Cerkvenjak
00050000-55bb-545b-3a7a-487822e12084	2215	Ceršak
00050000-55bb-545b-3519-63cea93d784d	2326	Cirkovce
00050000-55bb-545b-185a-88ed81076a17	2282	Cirkulane
00050000-55bb-545b-375a-289688806cd5	5273	Col
00050000-55bb-545b-9e1e-6206f4e1d58c	8251	Čatež ob Savi
00050000-55bb-545b-5b48-6eefe4993c0e	1413	Čemšenik
00050000-55bb-545b-52e7-831a1b58f3c7	5253	Čepovan
00050000-55bb-545b-f03e-4d95e121bca1	9232	Črenšovci
00050000-55bb-545b-1932-0854b1913572	2393	Črna na Koroškem
00050000-55bb-545b-c0e3-c1a3dfc818d3	6275	Črni Kal
00050000-55bb-545b-6258-5550e1192ee5	5274	Črni Vrh nad Idrijo
00050000-55bb-545b-580d-e05a870b0323	5262	Črniče
00050000-55bb-545b-0713-16f26307aa90	8340	Črnomelj
00050000-55bb-545b-cbf8-07199ab1121b	6271	Dekani
00050000-55bb-545b-e085-b77ef549a036	5210	Deskle
00050000-55bb-545b-fe53-71889ec653e1	2253	Destrnik
00050000-55bb-545b-d575-b0958b66db29	6215	Divača
00050000-55bb-545b-1ecf-4199ac2fe577	1233	Dob
00050000-55bb-545b-3961-c651e68356b8	3224	Dobje pri Planini
00050000-55bb-545b-a66e-b161a20d86ae	8257	Dobova
00050000-55bb-545b-9e99-3029c57b2b5d	1423	Dobovec
00050000-55bb-545b-4b01-ae10e81fb09f	5263	Dobravlje
00050000-55bb-545b-7364-4b699ba9c5ac	3204	Dobrna
00050000-55bb-545b-a604-180c66810fce	8211	Dobrnič
00050000-55bb-545b-6171-fa8ed8ff9cbd	1356	Dobrova
00050000-55bb-545b-7b51-64dbf2cacdb7	9223	Dobrovnik/Dobronak 
00050000-55bb-545b-c6c9-694e6b583bcc	5212	Dobrovo v Brdih
00050000-55bb-545b-c846-27a9f345dd60	1431	Dol pri Hrastniku
00050000-55bb-545b-828d-53bdb9594575	1262	Dol pri Ljubljani
00050000-55bb-545b-269c-15f840c20515	1273	Dole pri Litiji
00050000-55bb-545b-0dfa-c806a34a1bc8	1331	Dolenja vas
00050000-55bb-545b-e7bf-929ff3ca5c14	8350	Dolenjske Toplice
00050000-55bb-545b-95e6-20ac29bbb513	1230	Domžale
00050000-55bb-545b-165f-2d28831e7d4f	2252	Dornava
00050000-55bb-545b-99c6-73abe687f970	5294	Dornberk
00050000-55bb-545b-67bd-cdf946c51d2b	1319	Draga
00050000-55bb-545b-fc58-06316fb669a7	8343	Dragatuš
00050000-55bb-545b-e5ca-213c7e627a2b	3222	Dramlje
00050000-55bb-545b-21b5-3a3021588279	2370	Dravograd
00050000-55bb-545b-6b3f-b0b83ab891d9	4203	Duplje
00050000-55bb-545b-342f-26832d52e02f	6221	Dutovlje
00050000-55bb-545b-aee2-057b9423c955	8361	Dvor
00050000-55bb-545b-00db-7ba4260d5583	2343	Fala
00050000-55bb-545b-10f6-7f34a60ab991	9208	Fokovci
00050000-55bb-545b-84ab-c6e3b9e50cf9	2313	Fram
00050000-55bb-545b-8e71-22bf50a3c745	3213	Frankolovo
00050000-55bb-545b-eed5-216a55ff14bb	1274	Gabrovka
00050000-55bb-545b-7f65-409bdca32d97	8254	Globoko
00050000-55bb-545b-3884-ad7adef38c1a	5275	Godovič
00050000-55bb-545b-edb4-e8267c2eaa10	4204	Golnik
00050000-55bb-545b-d001-5734ded1e846	3303	Gomilsko
00050000-55bb-545b-aab9-659d3fc2c811	4224	Gorenja vas
00050000-55bb-545b-ec76-78f0d1d33c3c	3263	Gorica pri Slivnici
00050000-55bb-545b-c05c-c1639cefe170	2272	Gorišnica
00050000-55bb-545b-3274-2c9411562013	9250	Gornja Radgona
00050000-55bb-545b-3567-8bb306f2d90e	3342	Gornji Grad
00050000-55bb-545b-2102-dbf0f63f3794	4282	Gozd Martuljek
00050000-55bb-545b-1cd6-0cc7384fca6c	6272	Gračišče
00050000-55bb-545b-085b-74181d4ad140	9264	Grad
00050000-55bb-545b-fa95-4b51ed5e611e	8332	Gradac
00050000-55bb-545b-2a63-5e56cd92606b	1384	Grahovo
00050000-55bb-545b-d34b-05dc0b213643	5242	Grahovo ob Bači
00050000-55bb-545b-6a6a-98d34d9cc94a	5251	Grgar
00050000-55bb-545b-45bd-e46dfe3d198e	3302	Griže
00050000-55bb-545b-6cfb-ab32e02d1e3a	3231	Grobelno
00050000-55bb-545b-b29b-8ccab4b33854	1290	Grosuplje
00050000-55bb-545b-3889-6ee28cc37606	2288	Hajdina
00050000-55bb-545b-171e-9aa918b86fb2	8362	Hinje
00050000-55bb-545b-acb4-1a01f7ce913e	2311	Hoče
00050000-55bb-545b-1786-b24e23462651	9205	Hodoš/Hodos
00050000-55bb-545b-7859-be16a0a410be	1354	Horjul
00050000-55bb-545b-c75c-d78faad45814	1372	Hotedršica
00050000-55bb-545b-b7b2-1d2e2c31578c	1430	Hrastnik
00050000-55bb-545b-3728-9e64fcd7b07e	6225	Hruševje
00050000-55bb-545b-b7a8-cbb193dd8673	4276	Hrušica
00050000-55bb-545b-650f-1d63b58f482c	5280	Idrija
00050000-55bb-545b-4b36-f078e94f1b57	1292	Ig
00050000-55bb-545b-cb61-47c98c04d176	6250	Ilirska Bistrica
00050000-55bb-545b-a4d7-0525b2336ccb	6251	Ilirska Bistrica-Trnovo
00050000-55bb-545b-b704-e88db9062694	1295	Ivančna Gorica
00050000-55bb-545b-14bc-25e5b64c3892	2259	Ivanjkovci
00050000-55bb-545b-d373-3a7eefc2f979	1411	Izlake
00050000-55bb-545b-7ab1-e5b0692a49d2	6310	Izola/Isola
00050000-55bb-545b-912f-441a55391c3d	2222	Jakobski Dol
00050000-55bb-545b-b208-5c5743605686	2221	Jarenina
00050000-55bb-545b-fcc5-1d9bea3c0883	6254	Jelšane
00050000-55bb-545b-c320-43b9ec9563a8	4270	Jesenice
00050000-55bb-545b-d58a-16104eed0635	8261	Jesenice na Dolenjskem
00050000-55bb-545b-0e6d-1225ffefcab7	3273	Jurklošter
00050000-55bb-545b-771d-27aafc85a519	2223	Jurovski Dol
00050000-55bb-545b-89b8-cc35aca56fab	2256	Juršinci
00050000-55bb-545b-4b92-219723e45273	5214	Kal nad Kanalom
00050000-55bb-545b-c717-a034e59f444c	3233	Kalobje
00050000-55bb-545b-a2d4-283324ee9709	4246	Kamna Gorica
00050000-55bb-545b-52d6-e997536cb125	2351	Kamnica
00050000-55bb-545b-5a5a-2352c68e3573	1241	Kamnik
00050000-55bb-545b-3878-e53f9412c2e7	5213	Kanal
00050000-55bb-545b-a5e9-632978c27b9c	8258	Kapele
00050000-55bb-545b-e4cb-37af18c2e23e	2362	Kapla
00050000-55bb-545b-b4af-8ace04507878	2325	Kidričevo
00050000-55bb-545b-a063-ce862083d11b	1412	Kisovec
00050000-55bb-545b-6d4e-dbe333f093d8	6253	Knežak
00050000-55bb-545b-3dd1-e54741922307	5222	Kobarid
00050000-55bb-545b-90a0-60f64f7f166b	9227	Kobilje
00050000-55bb-545b-49e0-9abf56cd2efd	1330	Kočevje
00050000-55bb-545b-7172-908ca9be8574	1338	Kočevska Reka
00050000-55bb-545b-f661-ee0f63d8d171	2276	Kog
00050000-55bb-545b-37e3-c952cfa9dc82	5211	Kojsko
00050000-55bb-545b-edd2-3d2cf7dfc149	6223	Komen
00050000-55bb-545b-7070-6e99f59b3ca0	1218	Komenda
00050000-55bb-545b-22d6-ae67b8fd1a7a	6000	Koper/Capodistria 
00050000-55bb-545b-5ec3-c5b6ad5d0307	6001	Koper/Capodistria - poštni predali
00050000-55bb-545b-4688-eb54c253ece2	8282	Koprivnica
00050000-55bb-545b-59fc-b796db1ab208	5296	Kostanjevica na Krasu
00050000-55bb-545b-45a3-0b58e09d1e15	8311	Kostanjevica na Krki
00050000-55bb-545b-4efb-a755db9ff102	1336	Kostel
00050000-55bb-545b-9c4a-3987fb88971a	6256	Košana
00050000-55bb-545b-d50e-860dddb698da	2394	Kotlje
00050000-55bb-545b-2db4-44f6f99d9034	6240	Kozina
00050000-55bb-545b-52ca-fc831e993972	3260	Kozje
00050000-55bb-545b-85a5-90ff8ff6d90b	4000	Kranj 
00050000-55bb-545b-c21f-179822c14118	4001	Kranj - poštni predali
00050000-55bb-545b-e159-c6be8c3105e4	4280	Kranjska Gora
00050000-55bb-545b-0b21-0c6089709494	1281	Kresnice
00050000-55bb-545b-0377-2032282a1bbf	4294	Križe
00050000-55bb-545b-3d6d-0fc19f80ec96	9206	Križevci
00050000-55bb-545b-d180-852f21d3b915	9242	Križevci pri Ljutomeru
00050000-55bb-545b-c0e1-a29c68d6e8ba	1301	Krka
00050000-55bb-545b-308a-1d25d96437d4	8296	Krmelj
00050000-55bb-545b-7bf8-123f85dac56a	4245	Kropa
00050000-55bb-545b-ca90-0ac48e5c2579	8262	Krška vas
00050000-55bb-545b-b801-cba4f95ad10c	8270	Krško
00050000-55bb-545b-e78b-3ddf97e3a0a6	9263	Kuzma
00050000-55bb-545b-f175-3c9808f58672	2318	Laporje
00050000-55bb-545b-0e35-38c7e9ec3024	3270	Laško
00050000-55bb-545b-ab37-5886816dc448	1219	Laze v Tuhinju
00050000-55bb-545b-e044-589e8f790514	2230	Lenart v Slovenskih goricah
00050000-55bb-545b-4be5-391083faa9af	9220	Lendava/Lendva
00050000-55bb-545b-1136-b1472a57affa	4248	Lesce
00050000-55bb-545b-a8a7-d793afef9df9	3261	Lesično
00050000-55bb-545b-39d6-000c7639a7e3	8273	Leskovec pri Krškem
00050000-55bb-545b-7939-91d11304dba1	2372	Libeliče
00050000-55bb-545b-d713-215ef105a4b6	2341	Limbuš
00050000-55bb-545b-410b-ec3ee31c7344	1270	Litija
00050000-55bb-545b-1a1a-23579f147b11	3202	Ljubečna
00050000-55bb-545b-d6b6-9ec0abd25d4c	1000	Ljubljana 
00050000-55bb-545b-d840-dd8d129c1879	1001	Ljubljana - poštni predali
00050000-55bb-545b-c22b-5fd74533a6ca	1231	Ljubljana - Črnuče
00050000-55bb-545b-bf9a-e412a5f6182b	1261	Ljubljana - Dobrunje
00050000-55bb-545b-49c6-318af7c10e88	1260	Ljubljana - Polje
00050000-55bb-545b-b362-99e34a1608a0	1210	Ljubljana - Šentvid
00050000-55bb-545b-dead-816b93b1c61e	1211	Ljubljana - Šmartno
00050000-55bb-545b-8d4e-18239729d597	3333	Ljubno ob Savinji
00050000-55bb-545b-f5cb-0a628e43ba1f	9240	Ljutomer
00050000-55bb-545b-610c-47b08da41fa3	3215	Loče
00050000-55bb-545b-a8c9-c375dceb181b	5231	Log pod Mangartom
00050000-55bb-545b-0a0b-3064c209dcda	1358	Log pri Brezovici
00050000-55bb-545b-1098-4943cbb1b394	1370	Logatec
00050000-55bb-545b-3dda-f46a5cb6bddb	1371	Logatec
00050000-55bb-545b-6ef9-2d406e7c4b8b	1434	Loka pri Zidanem Mostu
00050000-55bb-545b-d371-91426302e930	3223	Loka pri Žusmu
00050000-55bb-545b-0e50-9474379a0f33	6219	Lokev
00050000-55bb-545b-ca61-9240bfbb44c2	1318	Loški Potok
00050000-55bb-545b-af37-e7cad48c13af	2324	Lovrenc na Dravskem polju
00050000-55bb-545b-2c0e-aaa2d0853037	2344	Lovrenc na Pohorju
00050000-55bb-545b-4ac5-f827dabe7229	3334	Luče
00050000-55bb-545b-f3f8-e4aff47db8e6	1225	Lukovica
00050000-55bb-545b-57df-f3660824de2e	9202	Mačkovci
00050000-55bb-545b-089f-66dc30424583	2322	Majšperk
00050000-55bb-545b-0e18-b2391cbf4727	2321	Makole
00050000-55bb-545b-0932-ddaad33027a6	9243	Mala Nedelja
00050000-55bb-545b-8ee1-9ad4248d10db	2229	Malečnik
00050000-55bb-545b-f4a4-28628609c441	6273	Marezige
00050000-55bb-545b-e658-f60b8b0e9338	2000	Maribor 
00050000-55bb-545b-9db0-e11c321997b5	2001	Maribor - poštni predali
00050000-55bb-545b-bea9-028111aa3458	2206	Marjeta na Dravskem polju
00050000-55bb-545b-cca4-bb70c22be7db	2281	Markovci
00050000-55bb-545b-abaa-b0f975bf2de3	9221	Martjanci
00050000-55bb-545b-b7a8-3ebb8099fb4a	6242	Materija
00050000-55bb-545b-ce20-f65295d4ef4d	4211	Mavčiče
00050000-55bb-545b-04ef-bcf20bc71445	1215	Medvode
00050000-55bb-545b-9597-472e5982be35	1234	Mengeš
00050000-55bb-545b-7cc7-86e2a3cd97a5	8330	Metlika
00050000-55bb-545b-33ff-ec417f425302	2392	Mežica
00050000-55bb-545b-62ac-92bbb713b01d	2204	Miklavž na Dravskem polju
00050000-55bb-545b-f4d2-686be875927e	2275	Miklavž pri Ormožu
00050000-55bb-545b-0263-a4aa629752e9	5291	Miren
00050000-55bb-545b-26ae-129e833b7dd8	8233	Mirna
00050000-55bb-545b-4b02-7216d11d2642	8216	Mirna Peč
00050000-55bb-545b-72ba-c17880fa2499	2382	Mislinja
00050000-55bb-545b-c94b-d2e586533803	4281	Mojstrana
00050000-55bb-545b-a266-5bee39a7a876	8230	Mokronog
00050000-55bb-545b-f8be-160cf378eeb6	1251	Moravče
00050000-55bb-545b-1609-5c14743dfd52	9226	Moravske Toplice
00050000-55bb-545b-8a23-93f6e12641f1	5216	Most na Soči
00050000-55bb-545b-4d8f-9f8293d087ee	1221	Motnik
00050000-55bb-545b-63f9-d57d79209b5e	3330	Mozirje
00050000-55bb-545b-b0e6-0c707597e331	9000	Murska Sobota 
00050000-55bb-545b-517a-46c8dbed3e54	9001	Murska Sobota - poštni predali
00050000-55bb-545b-1f69-8b86465ea9b3	2366	Muta
00050000-55bb-545b-c2b4-13408f0b7dd1	4202	Naklo
00050000-55bb-545b-efde-03945a1f11e2	3331	Nazarje
00050000-55bb-545b-6766-f9eaad7bd1b3	1357	Notranje Gorice
00050000-55bb-545b-343e-a56b59eabdb8	3203	Nova Cerkev
00050000-55bb-545b-fafc-5d6e97929cf5	5000	Nova Gorica 
00050000-55bb-545b-b11c-b7f0ab744f2f	5001	Nova Gorica - poštni predali
00050000-55bb-545b-e17a-88f30f28bc8b	1385	Nova vas
00050000-55bb-545b-20a3-a76d682fe4a7	8000	Novo mesto
00050000-55bb-545b-053e-49d60fb0435a	8001	Novo mesto - poštni predali
00050000-55bb-545b-84a9-bf305227139e	6243	Obrov
00050000-55bb-545b-69e3-fc10808f8a9f	9233	Odranci
00050000-55bb-545b-9922-3f6dfa995ece	2317	Oplotnica
00050000-55bb-545b-5ec7-3e5398dea112	2312	Orehova vas
00050000-55bb-545b-020a-479571e4e505	2270	Ormož
00050000-55bb-545b-997b-73692b5bc6d2	1316	Ortnek
00050000-55bb-545b-4fa3-fd13fb2c529f	1337	Osilnica
00050000-55bb-545b-a543-a30301e4be26	8222	Otočec
00050000-55bb-545b-a156-acd0237e3f97	2361	Ožbalt
00050000-55bb-545b-43fc-c0d1b6d93fba	2231	Pernica
00050000-55bb-545b-85f5-08fcf3b5ccee	2211	Pesnica pri Mariboru
00050000-55bb-545b-99da-c732dbd07a80	9203	Petrovci
00050000-55bb-545b-1ebf-a8a697d6a958	3301	Petrovče
00050000-55bb-545b-82f8-50f89a9e7b49	6330	Piran/Pirano
00050000-55bb-545b-5754-6a112ecdd7cc	8255	Pišece
00050000-55bb-545b-a983-cc5d9ca7d97f	6257	Pivka
00050000-55bb-545b-abc5-613fd1348fd4	6232	Planina
00050000-55bb-545b-3ed4-977a91f9326a	3225	Planina pri Sevnici
00050000-55bb-545b-eb34-87a8802d133a	6276	Pobegi
00050000-55bb-545b-70a1-1e1021330bad	8312	Podbočje
00050000-55bb-545b-2c95-92d473963b41	5243	Podbrdo
00050000-55bb-545b-204a-4d38e7db5e42	3254	Podčetrtek
00050000-55bb-545b-d3d5-18e90ba80efa	2273	Podgorci
00050000-55bb-545b-19e8-f3de9ad185dd	6216	Podgorje
00050000-55bb-545b-fd5d-ca9b3edb821e	2381	Podgorje pri Slovenj Gradcu
00050000-55bb-545b-e499-92c2608f5e77	6244	Podgrad
00050000-55bb-545b-abc3-59ac15698796	1414	Podkum
00050000-55bb-545b-77dd-f05eacdfae3a	2286	Podlehnik
00050000-55bb-545b-9bfa-fc33e6e1d8d5	5272	Podnanos
00050000-55bb-545b-c898-93a2c8cded32	4244	Podnart
00050000-55bb-545b-0b37-1c3831da20f2	3241	Podplat
00050000-55bb-545b-63bb-ce7e97966751	3257	Podsreda
00050000-55bb-545b-e8cd-b3e9b9b26aea	2363	Podvelka
00050000-55bb-545b-0042-69946096be10	2208	Pohorje
00050000-55bb-545b-6d75-bfa7d8a3b529	2257	Polenšak
00050000-55bb-545b-2514-c51b5ddcd730	1355	Polhov Gradec
00050000-55bb-545b-c0b7-9c2892d818f5	4223	Poljane nad Škofjo Loko
00050000-55bb-545b-5e20-0e65cda6e2ab	2319	Poljčane
00050000-55bb-545b-8b37-782c73662036	1272	Polšnik
00050000-55bb-545b-a7e5-3a2d0a7d1b39	3313	Polzela
00050000-55bb-545b-5e40-9981463b7ec4	3232	Ponikva
00050000-55bb-545b-8114-6732a3ebd623	6320	Portorož/Portorose
00050000-55bb-545b-6f67-888976b48078	6230	Postojna
00050000-55bb-545b-7d26-792816fb6fe3	2331	Pragersko
00050000-55bb-545b-e2f1-911c9436470c	3312	Prebold
00050000-55bb-545b-09a3-ef5d82b4d0f2	4205	Preddvor
00050000-55bb-545b-b3af-30cf1b2344bc	6255	Prem
00050000-55bb-545b-d1f3-47a9a4e129a9	1352	Preserje
00050000-55bb-545b-7215-a39744e181d2	6258	Prestranek
00050000-55bb-545b-3e26-6dda41889687	2391	Prevalje
00050000-55bb-545b-9511-fa2ff3265ed2	3262	Prevorje
00050000-55bb-545b-13b9-c45ea8bb2a72	1276	Primskovo 
00050000-55bb-545b-9252-cfc3c9c0b68c	3253	Pristava pri Mestinju
00050000-55bb-545b-d507-a4894c37ca46	9207	Prosenjakovci/Partosfalva
00050000-55bb-545b-edc7-cbe2fd3cd7f3	5297	Prvačina
00050000-55bb-545b-be37-ff2c72f5beb2	2250	Ptuj
00050000-55bb-545b-3292-f2987491c0ae	2323	Ptujska Gora
00050000-55bb-545b-1700-d790c33debc8	9201	Puconci
00050000-55bb-545b-444d-85c37845203a	2327	Rače
00050000-55bb-545b-0448-d733747ea0d6	1433	Radeče
00050000-55bb-545b-acc8-994ec6fbce70	9252	Radenci
00050000-55bb-545b-9943-78686040fc7c	2360	Radlje ob Dravi
00050000-55bb-545b-3420-5270ec342994	1235	Radomlje
00050000-55bb-545b-eafb-c0ac1c704e9b	4240	Radovljica
00050000-55bb-545b-4ebd-37357ddd64d0	8274	Raka
00050000-55bb-545b-f16d-6075389ee9fc	1381	Rakek
00050000-55bb-545b-2ab7-a61c582e75ee	4283	Rateče - Planica
00050000-55bb-545b-e67e-9d1ad57e62dc	2390	Ravne na Koroškem
00050000-55bb-545b-898c-6729fa7f4995	9246	Razkrižje
00050000-55bb-545b-a28c-14628610cc83	3332	Rečica ob Savinji
00050000-55bb-545b-4844-a9e4c8683de5	5292	Renče
00050000-55bb-545b-a17a-dd3eddd92c92	1310	Ribnica
00050000-55bb-545b-891e-79dc5a00bc06	2364	Ribnica na Pohorju
00050000-55bb-545b-a1a7-5ea42c991aa4	3272	Rimske Toplice
00050000-55bb-545b-276a-240006fc1fa3	1314	Rob
00050000-55bb-545b-2d2a-410ddf954aa7	5215	Ročinj
00050000-55bb-545b-3d79-bd21fb62af43	3250	Rogaška Slatina
00050000-55bb-545b-22f5-cc7b84033a13	9262	Rogašovci
00050000-55bb-545b-60a1-c4b7f38e2650	3252	Rogatec
00050000-55bb-545b-adfe-d4ac3d185990	1373	Rovte
00050000-55bb-545b-fd86-4e5167058332	2342	Ruše
00050000-55bb-545b-00a6-9b26f4ec1c2d	1282	Sava
00050000-55bb-545b-d621-66a32fb4f9df	6333	Sečovlje/Sicciole
00050000-55bb-545b-a0db-04ac29f3fe50	4227	Selca
00050000-55bb-545b-c6c8-f5afc2d63af5	2352	Selnica ob Dravi
00050000-55bb-545b-8b13-58d1634e8281	8333	Semič
00050000-55bb-545b-f9a8-de5b8a7156f1	8281	Senovo
00050000-55bb-545b-c67e-acf937f1f03b	6224	Senožeče
00050000-55bb-545b-3160-6bc327fa1ca0	8290	Sevnica
00050000-55bb-545b-e21a-cc57fbbd8644	6210	Sežana
00050000-55bb-545b-7e3f-481fcb558538	2214	Sladki Vrh
00050000-55bb-545b-a794-0466647a6032	5283	Slap ob Idrijci
00050000-55bb-545b-b371-f2910c37f04c	2380	Slovenj Gradec
00050000-55bb-545b-7ef2-185c8e0521a1	2310	Slovenska Bistrica
00050000-55bb-545b-d655-17e3992a88d4	3210	Slovenske Konjice
00050000-55bb-545b-56d6-1f8a223d5573	1216	Smlednik
00050000-55bb-545b-cf8a-ad9bb9e4f9e5	5232	Soča
00050000-55bb-545b-b947-1f31d2ecda9e	1317	Sodražica
00050000-55bb-545b-f141-364f6e4abafc	3335	Solčava
00050000-55bb-545b-b6dd-2376b32de73c	5250	Solkan
00050000-55bb-545b-8c76-45f32d6ca1c1	4229	Sorica
00050000-55bb-545b-aebc-0e2736cebcbe	4225	Sovodenj
00050000-55bb-545b-565e-1f3e3bd00ab1	5281	Spodnja Idrija
00050000-55bb-545b-444b-661633e8b341	2241	Spodnji Duplek
00050000-55bb-545b-2504-8630073ed83a	9245	Spodnji Ivanjci
00050000-55bb-545b-a37d-ca493d014c30	2277	Središče ob Dravi
00050000-55bb-545b-f08a-9c8dddb4c4a0	4267	Srednja vas v Bohinju
00050000-55bb-545b-c513-09056377ac03	8256	Sromlje 
00050000-55bb-545b-238b-e865902d7b64	5224	Srpenica
00050000-55bb-545b-117f-6577644d5c85	1242	Stahovica
00050000-55bb-545b-77b5-8f7af29de7c1	1332	Stara Cerkev
00050000-55bb-545b-938f-4c9a454a0160	8342	Stari trg ob Kolpi
00050000-55bb-545b-0ae7-a1e414ca70e7	1386	Stari trg pri Ložu
00050000-55bb-545b-07ff-c91cb120aca5	2205	Starše
00050000-55bb-545b-be16-6e6dd5561564	2289	Stoperce
00050000-55bb-545b-5e83-9f45403d64b6	8322	Stopiče
00050000-55bb-545b-ae3c-9c8a34ab3fa4	3206	Stranice
00050000-55bb-545b-e496-61294ce18c9b	8351	Straža
00050000-55bb-545b-7833-995264a51734	1313	Struge
00050000-55bb-545b-a4e8-59e1abee89bb	8293	Studenec
00050000-55bb-545b-b147-9a56c82fa1ce	8331	Suhor
00050000-55bb-545b-586f-125d4bb5e3d0	2233	Sv. Ana v Slovenskih goricah
00050000-55bb-545b-5bf0-e83a6b488a92	2235	Sv. Trojica v Slovenskih goricah
00050000-55bb-545b-e073-8a253498ce87	2353	Sveti Duh na Ostrem Vrhu
00050000-55bb-545b-7954-0ad2141412dd	9244	Sveti Jurij ob Ščavnici
00050000-55bb-545b-3004-3490537a9e27	3264	Sveti Štefan
00050000-55bb-545b-ec98-e9bce306f225	2258	Sveti Tomaž
00050000-55bb-545b-8387-af04a580f5da	9204	Šalovci
00050000-55bb-545b-aa7e-4ff89d27d61a	5261	Šempas
00050000-55bb-545b-95c2-ee4410be57c9	5290	Šempeter pri Gorici
00050000-55bb-545b-dd70-a7eec918780e	3311	Šempeter v Savinjski dolini
00050000-55bb-545b-d365-b9ffc255a8bb	4208	Šenčur
00050000-55bb-545b-5149-461059ff97ae	2212	Šentilj v Slovenskih goricah
00050000-55bb-545b-2a5c-dd2fe2be4fe3	8297	Šentjanž
00050000-55bb-545b-a64a-f6d99b77098d	2373	Šentjanž pri Dravogradu
00050000-55bb-545b-458f-eff353b47365	8310	Šentjernej
00050000-55bb-545b-8032-1313688bf2cf	3230	Šentjur
00050000-55bb-545b-a96a-4b7f541e2c38	3271	Šentrupert
00050000-55bb-545b-fdd9-4c2492e735c9	8232	Šentrupert
00050000-55bb-545b-0903-c4bcf585d72e	1296	Šentvid pri Stični
00050000-55bb-545b-5b80-c6e4687f62a3	8275	Škocjan
00050000-55bb-545b-8e8e-67cd3f6ec5b5	6281	Škofije
00050000-55bb-545b-de20-7dbf02dbe21c	4220	Škofja Loka
00050000-55bb-545b-7fb3-0ac5faa9d460	3211	Škofja vas
00050000-55bb-545b-4a0c-c5bd38a48678	1291	Škofljica
00050000-55bb-545b-f4a6-71bcbf85e9ea	6274	Šmarje
00050000-55bb-545b-67d8-100f4effec1d	1293	Šmarje - Sap
00050000-55bb-545b-47ef-f97528383cf2	3240	Šmarje pri Jelšah
00050000-55bb-545b-d09b-cfddc5ac23e0	8220	Šmarješke Toplice
00050000-55bb-545b-bbbc-d2582122b1fa	2315	Šmartno na Pohorju
00050000-55bb-545b-dc81-f1f3baf9ba52	3341	Šmartno ob Dreti
00050000-55bb-545b-adcc-a605dd801f18	3327	Šmartno ob Paki
00050000-55bb-545b-acc3-854c7bb697dd	1275	Šmartno pri Litiji
00050000-55bb-545b-c5ea-019cd91c474b	2383	Šmartno pri Slovenj Gradcu
00050000-55bb-545b-c125-f9a68e12fa72	3201	Šmartno v Rožni dolini
00050000-55bb-545b-bede-6739294dc2d3	3325	Šoštanj
00050000-55bb-545b-8654-fe9b024d98fc	6222	Štanjel
00050000-55bb-545b-66d6-2f76affdb359	3220	Štore
00050000-55bb-545b-71f0-7c59ec118992	3304	Tabor
00050000-55bb-545b-720e-16c584e890e1	3221	Teharje
00050000-55bb-545b-af1d-8437e3b5d98f	9251	Tišina
00050000-55bb-545b-0282-ca829c14b5b2	5220	Tolmin
00050000-55bb-545b-0577-0b79fdb626a7	3326	Topolšica
00050000-55bb-545b-fd97-c6580139717c	2371	Trbonje
00050000-55bb-545b-4fd7-4276b5edc8c9	1420	Trbovlje
00050000-55bb-545b-9a18-03ad4ac61a1f	8231	Trebelno 
00050000-55bb-545b-48b4-e08f19ca5a61	8210	Trebnje
00050000-55bb-545b-603d-1517eddf84b1	5252	Trnovo pri Gorici
00050000-55bb-545b-8c4c-530d465e174e	2254	Trnovska vas
00050000-55bb-545b-cc60-8e69d490b378	1222	Trojane
00050000-55bb-545b-4a20-f7b4b07dee65	1236	Trzin
00050000-55bb-545b-adb5-e2546b35a41a	4290	Tržič
00050000-55bb-545b-45cd-f6c8c4d48dff	8295	Tržišče
00050000-55bb-545b-e307-ace3f49a1215	1311	Turjak
00050000-55bb-545b-6850-ce3accf35f48	9224	Turnišče
00050000-55bb-545b-ce8a-908260998e21	8323	Uršna sela
00050000-55bb-545b-36d9-73fb06503e1d	1252	Vače
00050000-55bb-545b-8839-71481c6aa820	3320	Velenje 
00050000-55bb-545b-95b0-e6b43df0610d	3322	Velenje - poštni predali
00050000-55bb-545b-f47f-f76d30228f20	8212	Velika Loka
00050000-55bb-545b-a735-ed989e5adaf6	2274	Velika Nedelja
00050000-55bb-545b-d6a9-816615a2c88c	9225	Velika Polana
00050000-55bb-545b-05fa-ccc3f3210861	1315	Velike Lašče
00050000-55bb-545b-1223-14a869e99ad4	8213	Veliki Gaber
00050000-55bb-545b-be95-f1832142f777	9241	Veržej
00050000-55bb-545b-faa3-b4e1b1aae627	1312	Videm - Dobrepolje
00050000-55bb-545b-21bd-5dce93f273b1	2284	Videm pri Ptuju
00050000-55bb-545b-8140-28283b0f55e8	8344	Vinica
00050000-55bb-545b-d1c3-bceacfc35a19	5271	Vipava
00050000-55bb-545b-da6b-714349dff372	4212	Visoko
00050000-55bb-545b-7f43-88ea171beefb	1294	Višnja Gora
00050000-55bb-545b-f672-518ccce86cb7	3205	Vitanje
00050000-55bb-545b-9be6-fe11c1650d3d	2255	Vitomarci
00050000-55bb-545b-53d1-00117965b809	1217	Vodice
00050000-55bb-545b-0c00-bce5e3efc5ca	3212	Vojnik\t
00050000-55bb-545b-a01b-f2768d627d01	5293	Volčja Draga
00050000-55bb-545b-8fe0-28d89d2d1c49	2232	Voličina
00050000-55bb-545b-034b-1ce5097bbd04	3305	Vransko
00050000-55bb-545b-2d2f-dc6c01dc23b4	6217	Vremski Britof
00050000-55bb-545b-7af1-db7c956bfc2a	1360	Vrhnika
00050000-55bb-545b-1d40-6db978f09e65	2365	Vuhred
00050000-55bb-545b-7d4f-36e3737ceb05	2367	Vuzenica
00050000-55bb-545b-3e40-b26e2bf14484	8292	Zabukovje 
00050000-55bb-545b-b073-250185ba4914	1410	Zagorje ob Savi
00050000-55bb-545b-d808-1eed056edd08	1303	Zagradec
00050000-55bb-545b-2d43-5e58953ee875	2283	Zavrč
00050000-55bb-545b-cb7c-638249984364	8272	Zdole 
00050000-55bb-545b-d925-7b60132ff348	4201	Zgornja Besnica
00050000-55bb-545b-c002-a8d9b747eef0	2242	Zgornja Korena
00050000-55bb-545b-c8bf-67bd936eac5e	2201	Zgornja Kungota
00050000-55bb-545b-f598-c1357221c3f8	2316	Zgornja Ložnica
00050000-55bb-545b-c8c4-91cef840ffc3	2314	Zgornja Polskava
00050000-55bb-545b-6c9d-bb279d359af3	2213	Zgornja Velka
00050000-55bb-545b-337d-907a67828552	4247	Zgornje Gorje
00050000-55bb-545b-f60d-2388ac913523	4206	Zgornje Jezersko
00050000-55bb-545b-d4e2-3f829b65d211	2285	Zgornji Leskovec
00050000-55bb-545b-f22d-c9c9472a0056	1432	Zidani Most
00050000-55bb-545b-dbcb-b7ab36ccbd99	3214	Zreče
00050000-55bb-545b-6ca5-41f956171483	4209	Žabnica
00050000-55bb-545b-6eff-4d33b0460b05	3310	Žalec
00050000-55bb-545b-0e16-234cf978ebce	4228	Železniki
00050000-55bb-545b-74c2-32d4702af87f	2287	Žetale
00050000-55bb-545b-0d77-6c11da4f3ac1	4226	Žiri
00050000-55bb-545b-84c5-0b494b0d5087	4274	Žirovnica
00050000-55bb-545b-d87e-6d79665ea60e	8360	Žužemberk
\.


--
-- TOC entry 2992 (class 0 OID 11336948)
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
-- TOC entry 2974 (class 0 OID 11336759)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 11336837)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 11336960)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 11337263)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 11337274)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55bb-545c-dc01-08bf084508dc	00080000-55bb-545c-3c19-994bd891fab9	0900	AK
00190000-55bb-545c-557e-19bdd393b46c	00080000-55bb-545c-2cce-57b41b16c1df	0987	AK
00190000-55bb-545c-d1c1-0ecc4d4a1af7	00080000-55bb-545c-60e5-16d3f9489a67	0989	AK
00190000-55bb-545c-f71f-103b3a3a0e32	00080000-55bb-545c-6a7d-d7e1c3465399	0986	AK
00190000-55bb-545c-b664-8906436bcf3b	00080000-55bb-545c-3e3b-6ac8b0eff144	0984	AK
00190000-55bb-545c-8c50-f465fdd66c09	00080000-55bb-545c-6b75-2d928edf3ae5	0983	AK
00190000-55bb-545c-afa5-c4627953b109	00080000-55bb-545c-98e7-a60f0927ef64	0982	AK
\.


--
-- TOC entry 3016 (class 0 OID 11337244)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55bb-545c-248a-7ccdd6495c18	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3019 (class 0 OID 11337282)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 11336989)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55bb-545c-827c-f1742d26ce85	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55bb-545c-f636-338011990459	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55bb-545c-333c-5900e9c50be2	0003	Kazinska	t	84	Kazinska dvorana
00220000-55bb-545c-e6cc-a33dba85048c	0004	Mali oder	t	24	Mali oder 
00220000-55bb-545c-dc4d-cf163bfcdded	0005	Komorni oder	t	15	Komorni oder
00220000-55bb-545c-71d4-18614cd4f4d1	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55bb-545c-e330-22e2d0b3d963	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2990 (class 0 OID 11336933)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11336923)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11337108)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 11337057)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 11336631)
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
-- TOC entry 2999 (class 0 OID 11336999)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 11336669)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55bb-545b-ed94-b25bbae5f03d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55bb-545b-bccf-71ff6a464a17	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55bb-545b-6e33-c7e8e23ae8b5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55bb-545b-a1a2-5e75ec272bb5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55bb-545b-d414-0f4e59c81bcf	planer	Planer dogodkov v koledarju	t
00020000-55bb-545b-15a8-8f90bf2db23f	kadrovska	Kadrovska služba	t
00020000-55bb-545b-9769-a346a380a8b9	arhivar	Ažuriranje arhivalij	t
00020000-55bb-545b-a46e-2be07abb9d44	igralec	Igralec	t
00020000-55bb-545b-2c1a-8a5ed6cc53d1	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55bb-545c-f3ba-21c7329a24e0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2965 (class 0 OID 11336653)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55bb-545b-0e5c-b667aec87873	00020000-55bb-545b-6e33-c7e8e23ae8b5
00010000-55bb-545b-85fc-9d1d1f422e45	00020000-55bb-545b-6e33-c7e8e23ae8b5
00010000-55bb-545c-b617-706575c30643	00020000-55bb-545c-f3ba-21c7329a24e0
\.


--
-- TOC entry 3001 (class 0 OID 11337013)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11336954)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11336904)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 11337323)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55bb-545b-7f79-1623b05563e3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55bb-545b-e4a8-05ad0b62435a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55bb-545b-8657-a6397cac13f1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55bb-545b-7659-4bab0c0f69ad	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55bb-545b-ec70-afbbe62ccd1c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3023 (class 0 OID 11337315)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55bb-545b-aac9-718ff6c5f2e1	00230000-55bb-545b-7659-4bab0c0f69ad	popa
00240000-55bb-545b-909a-40b7fccd3281	00230000-55bb-545b-7659-4bab0c0f69ad	oseba
00240000-55bb-545b-f0cc-282c87606ba8	00230000-55bb-545b-e4a8-05ad0b62435a	prostor
00240000-55bb-545b-188c-3968233944ea	00230000-55bb-545b-7659-4bab0c0f69ad	besedilo
00240000-55bb-545b-e4ec-6b9c39fcbb72	00230000-55bb-545b-7659-4bab0c0f69ad	uprizoritev
00240000-55bb-545b-99fe-21480f2a8c02	00230000-55bb-545b-7659-4bab0c0f69ad	funkcija
00240000-55bb-545b-09c2-e1a31caab3e1	00230000-55bb-545b-7659-4bab0c0f69ad	tipfunkcije
00240000-55bb-545b-2e3d-76287e83140e	00230000-55bb-545b-7659-4bab0c0f69ad	alternacija
00240000-55bb-545b-086b-9297fd2e1673	00230000-55bb-545b-7f79-1623b05563e3	pogodba
00240000-55bb-545b-52dc-96911dbb745a	00230000-55bb-545b-7659-4bab0c0f69ad	zaposlitev
00240000-55bb-545b-a269-86df76251bd3	00230000-55bb-545b-7f79-1623b05563e3	programdela
00240000-55bb-545b-2592-49df62ba52a2	00230000-55bb-545b-7659-4bab0c0f69ad	zapis
\.


--
-- TOC entry 3022 (class 0 OID 11337310)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 11337067)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55bb-545c-ed38-32788bf06fc0	000e0000-55bb-545c-27b8-5b3abac3d149	00080000-55bb-545c-ef27-e53c42fc324b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55bb-545c-9b1a-f4732ddad2b4	000e0000-55bb-545c-27b8-5b3abac3d149	00080000-55bb-545c-ef27-e53c42fc324b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55bb-545c-fc50-b418263b972a	000e0000-55bb-545c-27b8-5b3abac3d149	00080000-55bb-545c-9c15-b1bf9803815e	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55bb-545c-f822-5b893719236c	000e0000-55bb-545c-27b8-5b3abac3d149	00080000-55bb-545c-9c15-b1bf9803815e	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2972 (class 0 OID 11336731)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 11336910)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55bb-545c-38cc-a2e23147a43a	00180000-55bb-545c-468f-3e571471416d	000c0000-55bb-545c-878c-ac9450c843f7	00090000-55bb-545c-7182-8f4e14539cf9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bb-545c-0295-49de316a736f	00180000-55bb-545c-468f-3e571471416d	000c0000-55bb-545c-3f1d-ab6911272e56	00090000-55bb-545c-b81d-4e25349cd019	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bb-545c-ef98-98a5109d6d74	00180000-55bb-545c-468f-3e571471416d	000c0000-55bb-545c-3c5c-50f711759dab	00090000-55bb-545c-c86a-fcc7f04fd879	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bb-545c-bfab-29916217cda4	00180000-55bb-545c-468f-3e571471416d	000c0000-55bb-545c-7aca-503e34547b82	00090000-55bb-545c-8b09-4b179bf44f55	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bb-545c-d9da-5ad1a70da211	00180000-55bb-545c-468f-3e571471416d	000c0000-55bb-545c-b728-db4e388c0c6d	00090000-55bb-545c-49f0-8e99264e1484	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bb-545c-8f0b-272b13604978	00180000-55bb-545c-2266-8afea4d03ff0	\N	00090000-55bb-545c-49f0-8e99264e1484	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3008 (class 0 OID 11337097)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55bb-545b-3aad-6d71544dc3d7	Igralec ali animator	Igralci in animatorji	Igralka ali animatorka	igralec
000f0000-55bb-545b-eae1-5aa9cf5673a8	Baletnik ali plesalec	Baletniki in plesalci	Baletnica ali plesalka	igralec
000f0000-55bb-545b-1311-2e5295d4ece3	Avtor	Avtorji	Avtorka	umetnik
000f0000-55bb-545b-0a87-449893c8fa60	Režiser	Režiserji	Režiserka	umetnik
000f0000-55bb-545b-80c6-9bdf4cb56028	Scenograf	Scenografi	Scenografka	tehnik
000f0000-55bb-545b-4aab-7a9df22351da	Kostumograf	Kostumografi	Kostumografinja	tehnik
000f0000-55bb-545b-7f3f-5fb99f2a95c5	Oblikovalec maske	Oblikovalci maske	Oblikovalka maske	tehnik
000f0000-55bb-545b-f3a3-6a72a494fa5d	Avtor glasbe	Avtorji glasbe	Avtorica glasbe	umetnik
000f0000-55bb-545b-431c-bf2442c09815	Oblikovalec svetlobe	Oblikovalci svetlobe	Oblikovalka svetlobe	tehnik
000f0000-55bb-545b-13f5-eaf75655c535	Koreograf	Koreografi	Koreografinja	umetnik
000f0000-55bb-545b-b980-07032262a794	Dramaturg	Dramaturgi	Dramaturginja	umetnik
000f0000-55bb-545b-f693-8b6e0ebb389d	Lektor	Lektorji	Lektorica	umetnik
000f0000-55bb-545b-8379-1ec984530320	Prevajalec	Prevajalci	Prevajalka	umetnik
000f0000-55bb-545b-6afc-279afce8e1db	Oblikovalec videa	Oblikovalci videa	Oblikovalka videa	umetnik
000f0000-55bb-545b-ebb3-bac2db9d929c	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijska ustvarjalka	umetnik
000f0000-55bb-545b-705a-1e51e934b138	Nerazvrščeno	Nerazvrščeno	Nerazvrščeno	\N
000f0000-55bb-545b-2b22-26e017332984	Inšpicient	Inšpicienti	Inšpicientka	inspicient
000f0000-55bb-545b-2b80-74406867e184	Šepetalec	Šepetalci	Šepetalka	sepetalec
000f0000-55bb-545b-cc32-68d3adbc9217	Tehnični vodja	Tehnične vodje	Tehnični vodja	tehnik
\.


--
-- TOC entry 3020 (class 0 OID 11337292)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55bb-545b-8aff-00bdfcaa32de	01	Velika predstava	f	1.00	1.00
002b0000-55bb-545b-b467-36d574bf948c	02	Mala predstava	f	0.50	0.50
002b0000-55bb-545b-96a7-80384bd1107c	03	Mala koprodukcija	t	0.40	1.00
002b0000-55bb-545b-916b-fec5d70478fa	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55bb-545b-647d-fa2fb624b911	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2977 (class 0 OID 11336794)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 11336640)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55bb-545b-85fc-9d1d1f422e45	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROwEp59JKgyLDSc5oXoByjWvxHDR9QhEC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55bb-545c-eb41-0ae395b47e71	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55bb-545c-dc9b-25b5c49acd69	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55bb-545c-dca4-0c8528be6895	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55bb-545c-c738-22a73929c86c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55bb-545c-79f6-9f22a1716813	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55bb-545c-9256-40b2c3b4583a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55bb-545c-7211-01305ac2bdf6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55bb-545c-0de4-96ce5796c8fe	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55bb-545c-31e4-061fd2a87467	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55bb-545c-b617-706575c30643	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55bb-545b-0e5c-b667aec87873	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3012 (class 0 OID 11337145)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55bb-545c-48f0-160a27d8a089	00160000-55bb-545c-2a86-6adf5cf6dd10	00150000-55bb-545b-f6aa-7dc9d48e34de	00140000-55bb-545a-343d-a055b2977c58	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55bb-545c-dc4d-cf163bfcdded
000e0000-55bb-545c-27b8-5b3abac3d149	00160000-55bb-545c-30d6-b014ee7e45f2	00150000-55bb-545b-cf75-2cf8248b2d12	00140000-55bb-545a-40fd-2ac5e86cdc9a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55bb-545c-71d4-18614cd4f4d1
000e0000-55bb-545c-adc0-fe7fe20606f9	\N	00150000-55bb-545b-cf75-2cf8248b2d12	00140000-55bb-545a-40fd-2ac5e86cdc9a	00190000-55bb-545c-557e-19bdd393b46c	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55bb-545c-dc4d-cf163bfcdded
000e0000-55bb-545c-cb36-9246e674be8a	\N	00150000-55bb-545b-cf75-2cf8248b2d12	00140000-55bb-545a-40fd-2ac5e86cdc9a	00190000-55bb-545c-557e-19bdd393b46c	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55bb-545c-dc4d-cf163bfcdded
000e0000-55bb-545c-c3cd-9fbd4f828efa	\N	00150000-55bb-545b-cf75-2cf8248b2d12	00140000-55bb-545a-40fd-2ac5e86cdc9a	00190000-55bb-545c-557e-19bdd393b46c	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55bb-545c-827c-f1742d26ce85
\.


--
-- TOC entry 2982 (class 0 OID 11336856)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55bb-545c-94d0-0d4e136cf049	000e0000-55bb-545c-27b8-5b3abac3d149	1	
00200000-55bb-545c-9937-28fd5104fb72	000e0000-55bb-545c-27b8-5b3abac3d149	2	
\.


--
-- TOC entry 2997 (class 0 OID 11336981)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11337362)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 11337334)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11337374)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11337050)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55bb-545c-a765-d4c2ae231a96	00090000-55bb-545c-b81d-4e25349cd019	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bb-545c-ab38-f8f6d0df9018	00090000-55bb-545c-c86a-fcc7f04fd879	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bb-545c-c132-159700c7e122	00090000-55bb-545c-2e69-18d590ae8374	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bb-545c-458e-f5b154c84e3e	00090000-55bb-545c-c45d-a2c965dedabe	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bb-545c-2449-838b64c0aa18	00090000-55bb-545c-7182-8f4e14539cf9	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bb-545c-8573-6f3eeae3abe2	00090000-55bb-545c-b9c9-2e8ab4b74939	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2984 (class 0 OID 11336888)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 11337135)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55bb-545a-343d-a055b2977c58	01	Drama	drama (SURS 01)
00140000-55bb-545a-6d8d-6fc3506bb53d	02	Opera	opera (SURS 02)
00140000-55bb-545a-0f73-1e30efc08672	03	Balet	balet (SURS 03)
00140000-55bb-545a-4dc2-69efd27f25e7	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55bb-545a-1b31-b163ef178ffe	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55bb-545a-40fd-2ac5e86cdc9a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55bb-545a-0aec-7e38756de1c3	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3003 (class 0 OID 11337040)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55bb-545b-ae77-04f60677fc7f	01	Opera	opera
00150000-55bb-545b-9c14-9baa40e4dd5c	02	Opereta	opereta
00150000-55bb-545b-8d5a-1351c0d4d66f	03	Balet	balet
00150000-55bb-545b-d838-b1c6ddc1e949	04	Plesne prireditve	plesne prireditve
00150000-55bb-545b-b26b-af757195c9ea	05	Lutkovno gledališče	lutkovno gledališče
00150000-55bb-545b-9b4f-b7d37846c61d	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55bb-545b-612b-799dfbd5dab8	07	Biografska drama	biografska drama
00150000-55bb-545b-f6aa-7dc9d48e34de	08	Komedija	komedija
00150000-55bb-545b-2915-12dff4b8ae3f	09	Črna komedija	črna komedija
00150000-55bb-545b-c1c3-dc2e1ff3a598	10	E-igra	E-igra
00150000-55bb-545b-cf75-2cf8248b2d12	11	Kriminalka	kriminalka
00150000-55bb-545b-72a6-f7dd8e04b11e	12	Musical	musical
\.


--
-- TOC entry 2509 (class 2606 OID 11336694)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 11337192)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 11337182)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11337096)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 11337415)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 11336878)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 11336903)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 11337308)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 11336820)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 11337238)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 11337036)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 11336854)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 11336897)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 11336834)
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
-- TOC entry 2601 (class 2606 OID 11336946)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 11337391)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11337398)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2749 (class 2606 OID 11337423)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 11336973)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 11336792)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 11336703)
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
-- TOC entry 2516 (class 2606 OID 11336727)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 11336683)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2500 (class 2606 OID 11336668)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 11336979)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 11337012)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 11337130)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 11336756)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 11336780)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 11336952)
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
-- TOC entry 2531 (class 2606 OID 11336770)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 11336841)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 11336964)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 11337271)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 11337279)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 11337261)
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
-- TOC entry 2707 (class 2606 OID 11337290)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 11336996)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 11336937)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 11336928)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 11337118)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 11337064)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 11336639)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 11337003)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 11336657)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2502 (class 2606 OID 11336677)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 11337021)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 11336959)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 11336909)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 11337332)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 11337320)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 11337314)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 11337077)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 11336736)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 11336919)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11337107)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11337302)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 11336805)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 11336652)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 11337161)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 11336863)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 11336987)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 11337372)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 11337356)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 11337380)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 11337055)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 11336892)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 11337143)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 11337048)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 1259 OID 11336885)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2649 (class 1259 OID 11337078)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2650 (class 1259 OID 11337079)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 11337393)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2736 (class 1259 OID 11337392)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2523 (class 1259 OID 11336758)
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
-- TOC entry 2614 (class 1259 OID 11336980)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 11337360)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2723 (class 1259 OID 11337359)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2724 (class 1259 OID 11337361)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2725 (class 1259 OID 11337358)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2726 (class 1259 OID 11337357)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2608 (class 1259 OID 11336966)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2609 (class 1259 OID 11336965)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2560 (class 1259 OID 11336864)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 11337037)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 11337039)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 11337038)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2548 (class 1259 OID 11336836)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2549 (class 1259 OID 11336835)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2705 (class 1259 OID 11337291)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2659 (class 1259 OID 11337132)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 11337133)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2661 (class 1259 OID 11337134)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2732 (class 1259 OID 11337381)
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
-- TOC entry 2668 (class 1259 OID 11337166)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2669 (class 1259 OID 11337163)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2670 (class 1259 OID 11337167)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2671 (class 1259 OID 11337165)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2672 (class 1259 OID 11337164)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2538 (class 1259 OID 11336807)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 11336806)
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
-- TOC entry 2514 (class 1259 OID 11336730)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 11337004)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2578 (class 1259 OID 11336898)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 11336684)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2505 (class 1259 OID 11336685)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 11337024)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 11337023)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 11337022)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2552 (class 1259 OID 11336842)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 11336844)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2554 (class 1259 OID 11336843)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2715 (class 1259 OID 11337322)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2588 (class 1259 OID 11336932)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2589 (class 1259 OID 11336930)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2590 (class 1259 OID 11336929)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2591 (class 1259 OID 11336931)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2495 (class 1259 OID 11336658)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2496 (class 1259 OID 11336659)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2617 (class 1259 OID 11336988)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 11337416)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2746 (class 1259 OID 11337424)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 11337425)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2603 (class 1259 OID 11336953)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 11337065)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 11337066)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 11337243)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2690 (class 1259 OID 11337242)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2691 (class 1259 OID 11337239)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2692 (class 1259 OID 11337240)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2693 (class 1259 OID 11337241)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2527 (class 1259 OID 11336772)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2528 (class 1259 OID 11336771)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2529 (class 1259 OID 11336773)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2488 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2697 (class 1259 OID 11337272)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2698 (class 1259 OID 11337273)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2682 (class 1259 OID 11337196)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2683 (class 1259 OID 11337197)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2684 (class 1259 OID 11337194)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2685 (class 1259 OID 11337195)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 11337056)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 11336941)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2595 (class 1259 OID 11336940)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2596 (class 1259 OID 11336938)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2597 (class 1259 OID 11336939)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2466 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2678 (class 1259 OID 11337184)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 11337183)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2694 (class 1259 OID 11337262)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2559 (class 1259 OID 11336855)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2712 (class 1259 OID 11337309)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 11337399)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 11337400)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2510 (class 1259 OID 11336705)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2511 (class 1259 OID 11336704)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2519 (class 1259 OID 11336737)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 11336738)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2583 (class 1259 OID 11336922)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 11336921)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2585 (class 1259 OID 11336920)
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
-- TOC entry 2566 (class 1259 OID 11336887)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2567 (class 1259 OID 11336883)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2568 (class 1259 OID 11336880)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 11336881)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 11336879)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 11336884)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2572 (class 1259 OID 11336882)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2526 (class 1259 OID 11336757)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 11336821)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 11336823)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2546 (class 1259 OID 11336822)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2547 (class 1259 OID 11336824)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2602 (class 1259 OID 11336947)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2664 (class 1259 OID 11337131)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 11337162)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2517 (class 1259 OID 11336728)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2518 (class 1259 OID 11336729)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 11337049)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 11337333)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 11336793)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2718 (class 1259 OID 11337321)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2622 (class 1259 OID 11336998)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 11336997)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 11337193)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2534 (class 1259 OID 11336781)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 11337144)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 11337373)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2703 (class 1259 OID 11337280)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 11337281)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2503 (class 1259 OID 11336678)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2573 (class 1259 OID 11336886)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2775 (class 2606 OID 11337561)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2778 (class 2606 OID 11337546)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2777 (class 2606 OID 11337551)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2773 (class 2606 OID 11337571)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2779 (class 2606 OID 11337541)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2774 (class 2606 OID 11337566)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2776 (class 2606 OID 11337556)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2809 (class 2606 OID 11337716)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 11337721)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 11337891)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2843 (class 2606 OID 11337886)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 11337476)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2796 (class 2606 OID 11337656)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2837 (class 2606 OID 11337871)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2838 (class 2606 OID 11337866)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2836 (class 2606 OID 11337876)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 11337861)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2840 (class 2606 OID 11337856)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2794 (class 2606 OID 11337651)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2795 (class 2606 OID 11337646)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2772 (class 2606 OID 11337536)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 11337686)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 11337696)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2803 (class 2606 OID 11337691)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2766 (class 2606 OID 11337511)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 11337506)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2792 (class 2606 OID 11337636)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 11337841)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2812 (class 2606 OID 11337726)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 11337731)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 11337736)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2841 (class 2606 OID 11337881)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2814 (class 2606 OID 11337756)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2817 (class 2606 OID 11337741)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2813 (class 2606 OID 11337761)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2815 (class 2606 OID 11337751)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2816 (class 2606 OID 11337746)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2764 (class 2606 OID 11337501)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 11337496)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 11337461)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2757 (class 2606 OID 11337456)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2798 (class 2606 OID 11337666)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 11337576)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 11337436)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2752 (class 2606 OID 11337441)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 11337681)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2800 (class 2606 OID 11337676)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 11337671)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2770 (class 2606 OID 11337516)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 11337526)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2769 (class 2606 OID 11337521)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2835 (class 2606 OID 11337851)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2784 (class 2606 OID 11337611)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2786 (class 2606 OID 11337601)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2787 (class 2606 OID 11337596)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2785 (class 2606 OID 11337606)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2751 (class 2606 OID 11337426)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2750 (class 2606 OID 11337431)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2797 (class 2606 OID 11337661)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2846 (class 2606 OID 11337906)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 11337911)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 11337916)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2793 (class 2606 OID 11337641)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2807 (class 2606 OID 11337706)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2806 (class 2606 OID 11337711)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2824 (class 2606 OID 11337816)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2825 (class 2606 OID 11337811)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2828 (class 2606 OID 11337796)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 11337801)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2826 (class 2606 OID 11337806)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2762 (class 2606 OID 11337486)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 11337481)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 11337491)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 11337826)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2830 (class 2606 OID 11337831)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2821 (class 2606 OID 11337786)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 11337791)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2823 (class 2606 OID 11337776)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2822 (class 2606 OID 11337781)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2805 (class 2606 OID 11337701)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 11337631)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2789 (class 2606 OID 11337626)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2791 (class 2606 OID 11337616)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2790 (class 2606 OID 11337621)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2818 (class 2606 OID 11337771)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2819 (class 2606 OID 11337766)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2829 (class 2606 OID 11337821)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2771 (class 2606 OID 11337531)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2832 (class 2606 OID 11337836)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 11337846)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2845 (class 2606 OID 11337896)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2844 (class 2606 OID 11337901)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2754 (class 2606 OID 11337451)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 11337446)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2759 (class 2606 OID 11337466)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2758 (class 2606 OID 11337471)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 11337591)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 11337586)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2783 (class 2606 OID 11337581)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-31 12:56:29 CEST

--
-- PostgreSQL database dump complete
--

