--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-03 13:34:47 CEST

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
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 11517805)
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
-- TOC entry 228 (class 1259 OID 11518304)
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
-- TOC entry 227 (class 1259 OID 11518287)
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
-- TOC entry 221 (class 1259 OID 11518199)
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
-- TOC entry 244 (class 1259 OID 11518519)
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
-- TOC entry 197 (class 1259 OID 11517984)
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
-- TOC entry 200 (class 1259 OID 11518018)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11518421)
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
-- TOC entry 192 (class 1259 OID 11517927)
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
-- TOC entry 229 (class 1259 OID 11518317)
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
-- TOC entry 216 (class 1259 OID 11518144)
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
-- TOC entry 195 (class 1259 OID 11517964)
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
-- TOC entry 199 (class 1259 OID 11518012)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11517944)
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
-- TOC entry 205 (class 1259 OID 11518061)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11518500)
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
-- TOC entry 243 (class 1259 OID 11518512)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11518535)
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
-- TOC entry 209 (class 1259 OID 11518086)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11517901)
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
-- TOC entry 184 (class 1259 OID 11517814)
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
-- TOC entry 185 (class 1259 OID 11517825)
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
-- TOC entry 180 (class 1259 OID 11517779)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11517798)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11518093)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11518124)
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
-- TOC entry 224 (class 1259 OID 11518238)
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
-- TOC entry 187 (class 1259 OID 11517858)
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
-- TOC entry 189 (class 1259 OID 11517893)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11518067)
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
-- TOC entry 188 (class 1259 OID 11517878)
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
-- TOC entry 194 (class 1259 OID 11517956)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11518079)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11518382)
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
-- TOC entry 232 (class 1259 OID 11518392)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11518363)
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
-- TOC entry 233 (class 1259 OID 11518400)
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
-- TOC entry 212 (class 1259 OID 11518108)
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
-- TOC entry 204 (class 1259 OID 11518052)
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
-- TOC entry 203 (class 1259 OID 11518042)
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
-- TOC entry 223 (class 1259 OID 11518227)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11518176)
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
-- TOC entry 177 (class 1259 OID 11517750)
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
-- TOC entry 176 (class 1259 OID 11517748)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 11518118)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11517788)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11517772)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11518132)
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
-- TOC entry 207 (class 1259 OID 11518073)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11518023)
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
-- TOC entry 238 (class 1259 OID 11518441)
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
-- TOC entry 237 (class 1259 OID 11518433)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11518428)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11518186)
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
-- TOC entry 186 (class 1259 OID 11517850)
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
-- TOC entry 202 (class 1259 OID 11518029)
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
-- TOC entry 222 (class 1259 OID 11518216)
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
-- TOC entry 234 (class 1259 OID 11518410)
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
-- TOC entry 191 (class 1259 OID 11517913)
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
-- TOC entry 178 (class 1259 OID 11517759)
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
-- TOC entry 226 (class 1259 OID 11518264)
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
-- TOC entry 196 (class 1259 OID 11517975)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11518100)
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
-- TOC entry 240 (class 1259 OID 11518480)
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
-- TOC entry 239 (class 1259 OID 11518452)
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
-- TOC entry 241 (class 1259 OID 11518492)
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
-- TOC entry 218 (class 1259 OID 11518169)
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
-- TOC entry 198 (class 1259 OID 11518007)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11518254)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11518159)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2245 (class 2604 OID 11517753)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2968 (class 0 OID 11517805)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 11518304)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55bf-51d7-15b4-279a307cd33c	000d0000-55bf-51d7-f008-dd52a9552f7a	\N	00090000-55bf-51d7-ca82-86d43bfdb51f	000b0000-55bf-51d7-9051-147605507c41	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55bf-51d7-2412-6a8e44f3f05a	000d0000-55bf-51d7-87e9-b6f4e15ed024	00100000-55bf-51d7-623e-a45b3e4996ff	00090000-55bf-51d7-c1a4-f8d65e03d3be	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55bf-51d7-5ae1-04dc979f2379	000d0000-55bf-51d7-e39c-1fd14dc3d9e9	00100000-55bf-51d7-af1c-d463b00ef4cb	00090000-55bf-51d7-ad8a-d93d377cc752	\N	0003	t	\N	2015-08-03	\N	2	\N	\N	f	f
000c0000-55bf-51d7-2ce9-625c5dd3a6ba	000d0000-55bf-51d7-f76c-16770c781740	\N	00090000-55bf-51d7-fc4a-caa639b1f372	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55bf-51d7-db5a-f449b58e22a6	000d0000-55bf-51d7-2030-aa4f9982cd99	\N	00090000-55bf-51d7-9e96-8124bc8538c6	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55bf-51d7-571a-a5c12fc14734	000d0000-55bf-51d7-f1f7-9c708d29c3db	\N	00090000-55bf-51d7-819d-d3b7366c2863	000b0000-55bf-51d7-2dc6-c9cc936103bc	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55bf-51d7-6671-b778e272448d	000d0000-55bf-51d7-7cef-be2f217b7f8c	00100000-55bf-51d7-3183-f0df99b00d35	00090000-55bf-51d7-5693-e60389b2a2cc	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55bf-51d7-4fc9-e3baa25fb01a	000d0000-55bf-51d7-d631-c420f9973e49	\N	00090000-55bf-51d7-e286-1565bf071df3	000b0000-55bf-51d7-13f5-7405f735079e	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55bf-51d7-4e92-2d9b662d7cf6	000d0000-55bf-51d7-7cef-be2f217b7f8c	00100000-55bf-51d7-dec8-a2f9d73d52ac	00090000-55bf-51d7-895c-6f4e0d73c081	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55bf-51d7-8b29-659cfb451383	000d0000-55bf-51d7-7cef-be2f217b7f8c	00100000-55bf-51d7-69bc-c91fc6e96242	00090000-55bf-51d7-6e1e-ee31cb3bf8ef	\N	0010	t	\N	2015-08-03	\N	16	\N	\N	f	t
000c0000-55bf-51d7-bcb4-7588228157c1	000d0000-55bf-51d7-7cef-be2f217b7f8c	00100000-55bf-51d7-ce9b-9302ca41a706	00090000-55bf-51d7-3ff4-93d1f6f3a7ec	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3012 (class 0 OID 11518287)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 11518199)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55bf-51d6-54eb-8641a5af6563	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55bf-51d6-4a59-163f53349cd9	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55bf-51d6-4889-653f9549b49f	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3029 (class 0 OID 11518519)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 11517984)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55bf-51d7-8518-c775b520f6db	\N	\N	00200000-55bf-51d7-65cd-bd44ddfbc423	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55bf-51d7-58b9-158aa3129d69	\N	\N	00200000-55bf-51d7-78e0-4bfe6a7563c7	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55bf-51d7-855c-d21e859bfc41	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55bf-51d7-4e4c-dce615c23253	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55bf-51d7-4afb-461d65db5b19	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2985 (class 0 OID 11518018)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 11518421)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 11517927)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55bf-51d5-d1e3-273c4dbc62f6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55bf-51d5-c89a-7e46d82ac061	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55bf-51d5-67b7-599cd0dd72f7	AL	ALB	008	Albania 	Albanija	\N
00040000-55bf-51d5-9e4c-1090c0a94f01	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55bf-51d5-f552-0708c236bc97	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55bf-51d5-4772-bd5dec73e445	AD	AND	020	Andorra 	Andora	\N
00040000-55bf-51d5-9a1d-c636e3771fe3	AO	AGO	024	Angola 	Angola	\N
00040000-55bf-51d5-1802-1264a0d20f36	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55bf-51d5-5ab6-c75a20bc6ad6	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55bf-51d5-dd71-48eb439d5f83	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-51d5-99a7-56a3d80c4933	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55bf-51d5-66d3-d9669321b9dd	AM	ARM	051	Armenia 	Armenija	\N
00040000-55bf-51d5-c0d1-4dd25a73d55e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55bf-51d5-33be-c79c324033e5	AU	AUS	036	Australia 	Avstralija	\N
00040000-55bf-51d5-433b-280a8cddb66d	AT	AUT	040	Austria 	Avstrija	\N
00040000-55bf-51d5-703f-65b224694f30	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55bf-51d5-39c3-70f3c8536ff3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55bf-51d5-b39c-92c02460327b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55bf-51d5-b965-07163ee6b38a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55bf-51d5-3efe-732fa4d97e31	BB	BRB	052	Barbados 	Barbados	\N
00040000-55bf-51d5-e635-c995eedda027	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55bf-51d5-9cdf-d5eaa1e1b6e5	BE	BEL	056	Belgium 	Belgija	\N
00040000-55bf-51d5-4863-4f49ab45de6d	BZ	BLZ	084	Belize 	Belize	\N
00040000-55bf-51d5-807c-f50af5fae30b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55bf-51d5-1b24-f1c7bf5bc26a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55bf-51d5-b6e4-f83b775ac111	BT	BTN	064	Bhutan 	Butan	\N
00040000-55bf-51d5-5317-cb814aa165f4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55bf-51d5-76fe-6c76704b0d74	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55bf-51d5-cffc-27f3ce1d4772	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55bf-51d5-ff7a-1bd6bf74fabc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55bf-51d5-2227-0dff25a37ee6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55bf-51d5-7af2-97494470d428	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55bf-51d5-14e3-7ab248292cd9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55bf-51d5-70a3-1b00866fc2c1	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55bf-51d5-7ae0-7844da948ce3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55bf-51d5-05bc-798e6a5bc950	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55bf-51d5-70b6-deada5ceae27	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55bf-51d5-509e-e9d2d8ac2eaf	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55bf-51d5-2584-24d5b628c8ce	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55bf-51d5-3f25-dcc4c22612e8	CA	CAN	124	Canada 	Kanada	\N
00040000-55bf-51d5-2c74-04aef39c7f9e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55bf-51d5-f6dc-d37ad3a46397	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55bf-51d5-6a9f-c50096f20ed4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55bf-51d5-8084-382a729d87aa	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55bf-51d5-3939-7480fa3af7f0	CL	CHL	152	Chile 	Čile	\N
00040000-55bf-51d5-4400-a755901e0759	CN	CHN	156	China 	Kitajska	\N
00040000-55bf-51d5-05a9-d264c296bf0e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55bf-51d5-f613-d721987bf412	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55bf-51d5-bf4d-9a1d1f81a886	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55bf-51d5-27ef-ce69e7cf3907	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55bf-51d5-c860-d174fca4df3b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55bf-51d5-6f6b-1b6383b7bd48	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55bf-51d5-110c-4faceeac0dbc	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55bf-51d5-8b16-0cffbf50ae39	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55bf-51d5-756a-af443c3d8130	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55bf-51d5-3efe-fc167c761ba2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55bf-51d5-9fd8-c992cde3fa2a	CU	CUB	192	Cuba 	Kuba	\N
00040000-55bf-51d5-71c9-9a92f5badb62	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55bf-51d5-9f53-e42ec7df963d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55bf-51d5-bab3-b74702686033	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55bf-51d5-6d60-4cdc7120114a	DK	DNK	208	Denmark 	Danska	\N
00040000-55bf-51d5-0c6b-70c296d414c7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55bf-51d5-45e5-e8edd8a05b47	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-51d5-186d-ebe50b5d8a1b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55bf-51d5-b154-98f37826e0c7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55bf-51d5-6449-8e185c216e34	EG	EGY	818	Egypt 	Egipt	\N
00040000-55bf-51d5-ebb0-425b7bc54d9f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55bf-51d5-af23-22eac325f256	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55bf-51d5-f226-eaa83c9053bc	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55bf-51d5-8f30-3b8e5c1c5f50	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55bf-51d5-0253-b671a6885e60	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55bf-51d5-5035-2e7433cf67f5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55bf-51d5-ddf9-d58f030d5f7e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55bf-51d5-b4b7-c582cd7596cd	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55bf-51d5-b6de-679b4c8220b9	FI	FIN	246	Finland 	Finska	\N
00040000-55bf-51d5-c015-d739e1a7a5f8	FR	FRA	250	France 	Francija	\N
00040000-55bf-51d5-6716-22f9b11e41cb	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55bf-51d5-5407-f02f44468334	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55bf-51d5-938e-70594e278db3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55bf-51d5-d5fe-e88f9c581972	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55bf-51d5-5e23-960eba68765e	GA	GAB	266	Gabon 	Gabon	\N
00040000-55bf-51d5-4426-2425ff0a71e0	GM	GMB	270	Gambia 	Gambija	\N
00040000-55bf-51d5-4bbd-6a9bf8e30680	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55bf-51d5-40da-c2fd6aae62c6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55bf-51d5-f539-7b9d454347a9	GH	GHA	288	Ghana 	Gana	\N
00040000-55bf-51d5-2123-29c7d37c8419	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55bf-51d5-432f-1149b628654a	GR	GRC	300	Greece 	Grčija	\N
00040000-55bf-51d5-8875-8fb9da26a455	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55bf-51d5-8da5-507e138f5683	GD	GRD	308	Grenada 	Grenada	\N
00040000-55bf-51d5-9b9b-d44f951a933e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55bf-51d5-91f0-d613a4682dfc	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55bf-51d5-bdcd-89ec4a804331	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55bf-51d5-9b7f-75c43f41e29d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55bf-51d5-c939-c8550e6dc6e9	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55bf-51d5-8229-aa9d196e6523	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55bf-51d5-1578-2bb0bb0e2cb6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55bf-51d5-4197-ccf4e16eaf44	HT	HTI	332	Haiti 	Haiti	\N
00040000-55bf-51d5-bd5f-040b89779349	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55bf-51d5-a9a0-f419f9d1f01a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55bf-51d5-f778-130440ac00c6	HN	HND	340	Honduras 	Honduras	\N
00040000-55bf-51d5-50ef-e4dcbe2d44d5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55bf-51d5-90f8-a82817c44551	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55bf-51d5-a2d6-eb0b29e6c585	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55bf-51d5-4b22-45776d0226b5	IN	IND	356	India 	Indija	\N
00040000-55bf-51d5-8f2a-42ad9b0d3c57	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55bf-51d5-31d2-20b564cf241f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55bf-51d5-6068-698f3a58b4d7	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55bf-51d5-2b9d-ca5eab1838e8	IE	IRL	372	Ireland 	Irska	\N
00040000-55bf-51d5-d51e-a9cea77689a1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55bf-51d5-6628-f8186886f461	IL	ISR	376	Israel 	Izrael	\N
00040000-55bf-51d5-c341-9539b7434d9c	IT	ITA	380	Italy 	Italija	\N
00040000-55bf-51d5-32eb-9d22a9ec65ed	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55bf-51d5-cd5a-7e799e0f164e	JP	JPN	392	Japan 	Japonska	\N
00040000-55bf-51d5-8f36-4d7d6703f0b1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55bf-51d5-8574-1119b1ed56c7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55bf-51d5-e2c1-0d93a4582aa9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55bf-51d5-4dcf-cad24968b998	KE	KEN	404	Kenya 	Kenija	\N
00040000-55bf-51d5-a2ce-39f3d782dba4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55bf-51d5-488f-83b63813a352	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55bf-51d5-062c-68663c4a06a9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55bf-51d5-14e6-639029f0c4a0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55bf-51d5-abc4-a46576486a75	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55bf-51d5-d56f-0042a895945c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55bf-51d5-f0d7-e16bcb1f7de4	LV	LVA	428	Latvia 	Latvija	\N
00040000-55bf-51d5-a3f6-526ecee0051e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55bf-51d5-62ae-289c60f36424	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55bf-51d5-9f81-074c3fd11dfa	LR	LBR	430	Liberia 	Liberija	\N
00040000-55bf-51d5-1cf3-ec1e659b77bd	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55bf-51d5-89fd-1bd53bb7ea52	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55bf-51d5-45ef-facc180f8bc4	LT	LTU	440	Lithuania 	Litva	\N
00040000-55bf-51d5-bc78-422e7e179c49	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55bf-51d5-a3b6-58b8acbbe920	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55bf-51d5-5136-c8ef7705bd59	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55bf-51d5-11d0-c89ec2150543	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55bf-51d5-6512-12018a822a86	MW	MWI	454	Malawi 	Malavi	\N
00040000-55bf-51d5-dcae-cb53081539f4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55bf-51d5-cfae-713db5fd4ad9	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55bf-51d5-d2b5-a0370f42ace1	ML	MLI	466	Mali 	Mali	\N
00040000-55bf-51d5-1fb7-d33518282666	MT	MLT	470	Malta 	Malta	\N
00040000-55bf-51d5-da41-538d74dd6fad	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55bf-51d5-b25c-41340ff7578d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55bf-51d5-4212-4b3423b979aa	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55bf-51d5-1bc8-1c5771cb2b9c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55bf-51d5-d9ca-42e19e462700	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55bf-51d5-672a-db4b22b00d04	MX	MEX	484	Mexico 	Mehika	\N
00040000-55bf-51d5-0273-6eb230423b14	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55bf-51d5-8042-b475f2ac8bbf	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55bf-51d5-b7e9-29a965e80092	MC	MCO	492	Monaco 	Monako	\N
00040000-55bf-51d5-e938-540a02ef1b48	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55bf-51d5-09a8-fba02ca2f296	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55bf-51d5-1d55-8a87ad07f585	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55bf-51d5-d01c-f26743bbdfd6	MA	MAR	504	Morocco 	Maroko	\N
00040000-55bf-51d5-303e-4710a73df416	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55bf-51d5-5a68-039c4497b878	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55bf-51d5-aa55-8ba8be10caa8	NA	NAM	516	Namibia 	Namibija	\N
00040000-55bf-51d5-dd15-809cb012bd48	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55bf-51d5-00d2-0fc2f2652659	NP	NPL	524	Nepal 	Nepal	\N
00040000-55bf-51d5-d2e5-dbbdab8f6b92	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55bf-51d5-a9f2-39007566e3d7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55bf-51d5-c52a-382bf3209ed0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55bf-51d5-bb75-f87bd5eda877	NE	NER	562	Niger 	Niger 	\N
00040000-55bf-51d5-9514-fa230a7ff055	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55bf-51d5-e4bf-d02933c85b76	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55bf-51d5-87ae-c89a60b9becc	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55bf-51d5-365a-69bde1d4f038	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55bf-51d5-2320-3e099f578b42	NO	NOR	578	Norway 	Norveška	\N
00040000-55bf-51d5-6a6f-0264ab7bb00f	OM	OMN	512	Oman 	Oman	\N
00040000-55bf-51d5-d4d0-3a772f923712	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55bf-51d5-741c-d3c7a43ae2b1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55bf-51d5-738a-47bb76ca15e5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55bf-51d5-8700-8ec7e4f05b9d	PA	PAN	591	Panama 	Panama	\N
00040000-55bf-51d5-ca54-1ea3e4d927c4	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55bf-51d5-eec2-51bc46bf35d3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55bf-51d5-193c-182946e1a2eb	PE	PER	604	Peru 	Peru	\N
00040000-55bf-51d5-67d5-d6e27fccab35	PH	PHL	608	Philippines 	Filipini	\N
00040000-55bf-51d5-c6b2-9efadc60049c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55bf-51d5-19a8-04102f82ccda	PL	POL	616	Poland 	Poljska	\N
00040000-55bf-51d5-b7c9-b236a8085fe0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55bf-51d5-79e2-0bd5ad63aa5e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55bf-51d5-20d5-6e35c55c8675	QA	QAT	634	Qatar 	Katar	\N
00040000-55bf-51d5-5b59-8d7985a62c5e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55bf-51d5-436d-f5b0287ddc77	RO	ROU	642	Romania 	Romunija	\N
00040000-55bf-51d5-e629-66df85682ac1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55bf-51d5-32fd-874bbb1309de	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55bf-51d5-14cb-9d59989ce9be	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55bf-51d5-bbde-9049a25d4eeb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55bf-51d5-ee32-08bfd75c1b99	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55bf-51d5-7ad5-2aa1953495c6	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55bf-51d5-cd2f-877d2cb4c1ae	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55bf-51d5-a92d-89d7ff0e3ca3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55bf-51d5-859d-027bf3b8e702	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55bf-51d5-b31f-98768bff8bef	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55bf-51d5-b2d1-5d168542b89d	SM	SMR	674	San Marino 	San Marino	\N
00040000-55bf-51d5-a488-c7fab2e98ad0	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55bf-51d5-c25b-870a38428a96	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55bf-51d5-3e9b-8625a6117bae	SN	SEN	686	Senegal 	Senegal	\N
00040000-55bf-51d5-174b-f6ef01884891	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55bf-51d5-3538-c4e80b9f023f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55bf-51d5-659b-046c0216ccd2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55bf-51d5-5b51-8b97cc261533	SG	SGP	702	Singapore 	Singapur	\N
00040000-55bf-51d5-276d-d42f58d46cfd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55bf-51d5-640f-8d68c4faa3f7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55bf-51d5-36f7-fdc5b0039f27	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55bf-51d5-0c3f-570b6a73e47a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55bf-51d5-a24b-468428e8787b	SO	SOM	706	Somalia 	Somalija	\N
00040000-55bf-51d5-00bd-0eb81088f825	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55bf-51d5-a154-0d43585d05ff	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55bf-51d5-46af-39abb369549f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55bf-51d5-5759-e4ba427d2840	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55bf-51d5-1fb4-92b0a2a1d7e3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55bf-51d5-6b53-37830811b7f1	SD	SDN	729	Sudan 	Sudan	\N
00040000-55bf-51d5-ee44-8b581d80b8d4	SR	SUR	740	Suriname 	Surinam	\N
00040000-55bf-51d5-4448-a6c1126106cf	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55bf-51d5-867e-bcd13ac3b1d5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55bf-51d5-4634-f3c7075f45ee	SE	SWE	752	Sweden 	Švedska	\N
00040000-55bf-51d5-b238-dec89d973aba	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55bf-51d5-bdc2-c94715fa6a6d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55bf-51d5-9e81-57303ebd0bce	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55bf-51d5-bce8-bbc5bb073387	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55bf-51d5-c6af-e94c2f18610e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55bf-51d5-0dfa-15704187c7cf	TH	THA	764	Thailand 	Tajska	\N
00040000-55bf-51d5-cb2d-989e9765f393	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55bf-51d5-a2f4-eecfe0b88a8d	TG	TGO	768	Togo 	Togo	\N
00040000-55bf-51d5-0b74-a4cbcf28dec4	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55bf-51d5-236b-cefcaf1f02ac	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55bf-51d5-e472-594c3d3db2c1	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55bf-51d5-840b-0e836218a4c7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55bf-51d5-43d7-76c1a9f36d09	TR	TUR	792	Turkey 	Turčija	\N
00040000-55bf-51d5-9a61-47a006b0a770	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55bf-51d5-ad87-4729402d4e32	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-51d5-36a2-18a9534cda4f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55bf-51d5-d773-9e050c21830a	UG	UGA	800	Uganda 	Uganda	\N
00040000-55bf-51d5-5dc8-0e0ba3bdc2cd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55bf-51d5-d388-39a59470babc	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55bf-51d5-26f3-51b99c1c3f7e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55bf-51d5-a05b-ac65e3ff791d	US	USA	840	United States 	Združene države Amerike	\N
00040000-55bf-51d5-6b4f-b42a33cc30d6	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55bf-51d5-6820-c3397ddba646	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55bf-51d5-1bdf-1dabfb30f81f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55bf-51d5-b397-cfce44f1c759	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55bf-51d5-a389-337afd036bb2	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55bf-51d5-c6c6-ee0cdd3ba64e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55bf-51d5-01cf-cdf7d5e7efc5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-51d5-2234-8949c9298d28	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55bf-51d5-6582-3f5f1deb9368	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55bf-51d5-898e-5a01d9317953	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55bf-51d5-13bd-2318dbe9bfac	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55bf-51d5-f841-5180ed0bd89a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55bf-51d5-ed05-0a56db7b7da8	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3014 (class 0 OID 11518317)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55bf-51d7-323e-5b2943484ca3	000e0000-55bf-51d7-bdb3-d766d9d3ad20	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55bf-51d6-98b1-48c8be7c2438	premiera	0.00	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55bf-51d7-3346-59cc23343502	000e0000-55bf-51d7-bed9-1a75456a88c7	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55bf-51d6-4ad5-67b471cc5508	premiera	0.00	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-51d7-c71b-440d9869b4f9	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-51d7-da53-f000eee8ba00	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 11518144)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55bf-51d7-7cef-be2f217b7f8c	000e0000-55bf-51d7-bed9-1a75456a88c7	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55bf-51d6-c92a-f5d9465af12e
000d0000-55bf-51d7-f008-dd52a9552f7a	000e0000-55bf-51d7-bed9-1a75456a88c7	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-51d6-c92a-f5d9465af12e
000d0000-55bf-51d7-87e9-b6f4e15ed024	000e0000-55bf-51d7-bed9-1a75456a88c7	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55bf-51d6-b600-645d3e145daf
000d0000-55bf-51d7-e39c-1fd14dc3d9e9	000e0000-55bf-51d7-bed9-1a75456a88c7	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55bf-51d6-1e0c-5c998a8acec3
000d0000-55bf-51d7-f76c-16770c781740	000e0000-55bf-51d7-bed9-1a75456a88c7	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55bf-51d6-d609-3e7da21ca13d
000d0000-55bf-51d7-2030-aa4f9982cd99	000e0000-55bf-51d7-bed9-1a75456a88c7	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55bf-51d6-50df-2cceb5d6c52a
000d0000-55bf-51d7-f1f7-9c708d29c3db	000e0000-55bf-51d7-bed9-1a75456a88c7	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-51d6-c92a-f5d9465af12e
000d0000-55bf-51d7-d631-c420f9973e49	000e0000-55bf-51d7-bed9-1a75456a88c7	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55bf-51d6-2337-89ac058b650c
\.


--
-- TOC entry 2980 (class 0 OID 11517964)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 11518012)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11517944)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55bf-51d7-20bc-aa0cac9c8bbf	00080000-55bf-51d6-3687-73a475161842	00090000-55bf-51d7-6e1e-ee31cb3bf8ef	AK		
\.


--
-- TOC entry 2955 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 11518061)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11518500)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11518512)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 11518535)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 11518086)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 11517901)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55bf-51d5-dcc3-f91b746e148c	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55bf-51d5-3953-f3d4f9451a07	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55bf-51d5-81b2-6f99b1a0a988	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55bf-51d5-2636-d1ae3b94b95f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55bf-51d5-af0e-22a90724861c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55bf-51d5-7043-e8afe7a49d96	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55bf-51d5-c512-d1e8dd332717	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55bf-51d5-305a-d9d2761a7330	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-51d5-d82a-786210c292a7	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-51d5-7dc2-d11622fb1574	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55bf-51d5-3a31-b0a208e37b64	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55bf-51d5-df8f-1e13c2ea00d4	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55bf-51d5-d57f-3fad635267c0	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55bf-51d5-7508-11f46c3940f1	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55bf-51d6-fc8e-c0d03c15bc8b	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55bf-51d6-ae0b-220f3d5cb7ae	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55bf-51d6-16c6-a13314882ecf	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55bf-51d6-16f0-e20d93b8fd19	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55bf-51d6-1a6f-7cb2d03f8a69	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55bf-51d6-9013-be706d7b7b35	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2969 (class 0 OID 11517814)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55bf-51d6-dd39-dfbbe87ff869	00000000-55bf-51d6-ae0b-220f3d5cb7ae	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55bf-51d6-b75c-bdd27b1ca092	00000000-55bf-51d6-ae0b-220f3d5cb7ae	00010000-55bf-51d5-6c5d-705766b36d0a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55bf-51d6-a780-fb768863daf2	00000000-55bf-51d6-16c6-a13314882ecf	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2970 (class 0 OID 11517825)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55bf-51d7-ca82-86d43bfdb51f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55bf-51d7-fc4a-caa639b1f372	00010000-55bf-51d6-675e-1b94acaa423e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55bf-51d7-ad8a-d93d377cc752	00010000-55bf-51d6-1b7d-6731ba863b04	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55bf-51d7-895c-6f4e0d73c081	00010000-55bf-51d6-e572-a1fa5161fac8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55bf-51d7-1eab-54ecd5517081	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55bf-51d7-819d-d3b7366c2863	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55bf-51d7-3ff4-93d1f6f3a7ec	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55bf-51d7-5693-e60389b2a2cc	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55bf-51d7-6e1e-ee31cb3bf8ef	00010000-55bf-51d6-d0d7-472c26b1635b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55bf-51d7-c1a4-f8d65e03d3be	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55bf-51d7-e7d8-0653b0aab4ca	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55bf-51d7-9e96-8124bc8538c6	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55bf-51d7-e286-1565bf071df3	00010000-55bf-51d6-bf05-6711de3e713b	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2957 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 11517779)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55bf-51d5-1b19-8c0c2cce8c05	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55bf-51d5-cbd1-7e5c404b9c51	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55bf-51d5-faf0-8a5397143cf4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55bf-51d5-cdba-8610400a5a0e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55bf-51d5-6bd6-01b51954e92c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55bf-51d5-fbaa-c914920eb309	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55bf-51d5-21f9-252aec2276ae	Abonma-read	Abonma - branje	f
00030000-55bf-51d5-6289-793de1398fdb	Abonma-write	Abonma - spreminjanje	f
00030000-55bf-51d5-e3e9-dc88d973b84f	Alternacija-read	Alternacija - branje	f
00030000-55bf-51d5-8e69-c0f1a0b0972b	Alternacija-write	Alternacija - spreminjanje	f
00030000-55bf-51d5-5294-538a7111641c	Arhivalija-read	Arhivalija - branje	f
00030000-55bf-51d5-ecbc-3fc5441986ff	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55bf-51d5-d36c-4b0f4c7c22f7	Besedilo-read	Besedilo - branje	f
00030000-55bf-51d5-f3b9-c101e8d0ad55	Besedilo-write	Besedilo - spreminjanje	f
00030000-55bf-51d5-a617-433e821d928c	DogodekIzven-read	DogodekIzven - branje	f
00030000-55bf-51d5-6cce-f50a2e3145a4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55bf-51d5-45ae-bf0d83ee2b6c	Dogodek-read	Dogodek - branje	f
00030000-55bf-51d5-1559-62e134d84a8e	Dogodek-write	Dogodek - spreminjanje	f
00030000-55bf-51d5-623d-dd2d49ca7c68	DrugiVir-read	DrugiVir - branje	f
00030000-55bf-51d5-fa1a-2b316147a271	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55bf-51d5-ce6b-3591b7f27faf	Drzava-read	Drzava - branje	f
00030000-55bf-51d5-8d62-e9e6fac66992	Drzava-write	Drzava - spreminjanje	f
00030000-55bf-51d5-a89a-1b1a9ee1f8c5	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55bf-51d5-3255-3c67b0bf0d6a	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55bf-51d5-2243-64067bd9e5ea	Funkcija-read	Funkcija - branje	f
00030000-55bf-51d5-f45d-8b7f09f127d2	Funkcija-write	Funkcija - spreminjanje	f
00030000-55bf-51d5-f811-43e72af68d4b	Gostovanje-read	Gostovanje - branje	f
00030000-55bf-51d5-85af-1fa50e1c7ac6	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55bf-51d5-7421-f3e641c99e40	Gostujoca-read	Gostujoca - branje	f
00030000-55bf-51d5-5e32-68e5455c72af	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55bf-51d5-0310-e7bf71715cf5	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55bf-51d5-0769-cfe31c662282	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55bf-51d5-7828-d96b6a6b8dfc	Kupec-read	Kupec - branje	f
00030000-55bf-51d5-4886-aa6fef98b86a	Kupec-write	Kupec - spreminjanje	f
00030000-55bf-51d5-fa42-5eb187cfe84a	NacinPlacina-read	NacinPlacina - branje	f
00030000-55bf-51d5-1751-56d98c7c1bd4	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55bf-51d5-9dbe-5cb9b164f353	Option-read	Option - branje	f
00030000-55bf-51d5-1aa0-5799a0a6538c	Option-write	Option - spreminjanje	f
00030000-55bf-51d5-7ff4-fbd176dc884d	OptionValue-read	OptionValue - branje	f
00030000-55bf-51d5-d48b-d2201e2a3762	OptionValue-write	OptionValue - spreminjanje	f
00030000-55bf-51d5-9942-18c82dc750a5	Oseba-read	Oseba - branje	f
00030000-55bf-51d5-95c0-10526f807d82	Oseba-write	Oseba - spreminjanje	f
00030000-55bf-51d5-22e1-e81806d9c28d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55bf-51d5-cc63-68ea62550f34	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55bf-51d5-f451-d430132ee8f9	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55bf-51d5-3067-3cb0ce48bf5a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55bf-51d5-fd41-0a43c0724129	Pogodba-read	Pogodba - branje	f
00030000-55bf-51d5-a0ac-38ef42f2e7e0	Pogodba-write	Pogodba - spreminjanje	f
00030000-55bf-51d5-fc12-ce7a75a66abd	Popa-read	Popa - branje	f
00030000-55bf-51d5-01c0-25f9c619e142	Popa-write	Popa - spreminjanje	f
00030000-55bf-51d5-a23a-ac7be9a4f4fc	Posta-read	Posta - branje	f
00030000-55bf-51d5-65cd-660bd02797b0	Posta-write	Posta - spreminjanje	f
00030000-55bf-51d5-e2cc-9ec5c7dce157	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55bf-51d5-cc96-5ad9d3824426	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55bf-51d5-9650-afc879b957ed	PostniNaslov-read	PostniNaslov - branje	f
00030000-55bf-51d5-3992-ce2aafa9cacf	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55bf-51d5-36dd-d1a3048362cf	Predstava-read	Predstava - branje	f
00030000-55bf-51d5-1a05-c421ed3b3d9b	Predstava-write	Predstava - spreminjanje	f
00030000-55bf-51d5-28ce-fc1ee251fa06	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55bf-51d5-bb87-1f6d78a465fb	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55bf-51d5-6670-f0e323d6449a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55bf-51d5-1ac6-eb82a3fb213d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55bf-51d5-7921-5f37a05c22db	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55bf-51d5-d84c-88848951cdc2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55bf-51d5-2b4b-c880bf0c0d39	ProgramDela-read	ProgramDela - branje	f
00030000-55bf-51d5-a8f2-34bbc9fe0614	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55bf-51d5-a113-83f6e702cfa8	ProgramFestival-read	ProgramFestival - branje	f
00030000-55bf-51d5-418b-848fca902517	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55bf-51d5-727f-2bd928bd1bbc	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55bf-51d5-bedf-aa7720deb625	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55bf-51d5-3c04-bd2a196a86b6	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55bf-51d5-57ba-ac97b7ee088e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55bf-51d5-9dd2-3c4cfb466ca7	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55bf-51d5-c430-1b68371eee4b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55bf-51d5-be97-d1f773ca6b97	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55bf-51d5-d20a-8ca1ac5da4e1	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55bf-51d5-b9b4-7ac56b58631d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55bf-51d5-18db-b195b0c6aec1	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55bf-51d5-5c95-c8a1489ef5da	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55bf-51d5-fa47-437502084f04	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55bf-51d5-ea44-205f7e914ae8	ProgramRazno-read	ProgramRazno - branje	f
00030000-55bf-51d5-3020-668d64c19f52	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55bf-51d5-9613-ec1d5b7f7901	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55bf-51d5-110b-6f819787849c	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55bf-51d5-52d9-715fd6245111	Prostor-read	Prostor - branje	f
00030000-55bf-51d5-91d7-222e38660b63	Prostor-write	Prostor - spreminjanje	f
00030000-55bf-51d5-8b81-3064acc07d79	Racun-read	Racun - branje	f
00030000-55bf-51d5-b819-dba848cbcfab	Racun-write	Racun - spreminjanje	f
00030000-55bf-51d5-b91a-6a467c347561	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55bf-51d5-e42f-19624edac4a8	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55bf-51d5-3c0b-1a1fc891f4c7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55bf-51d5-ad2f-fa175bd07eb5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55bf-51d5-a929-966f82a6dede	Rekvizit-read	Rekvizit - branje	f
00030000-55bf-51d5-495e-cf323877acb6	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55bf-51d5-dd1e-b9bf0bbc2021	Revizija-read	Revizija - branje	f
00030000-55bf-51d5-d464-c10a5445e6ba	Revizija-write	Revizija - spreminjanje	f
00030000-55bf-51d5-f29e-80cac182b726	Rezervacija-read	Rezervacija - branje	f
00030000-55bf-51d5-6d66-34cf185997c1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55bf-51d5-5db4-82274a310218	SedezniRed-read	SedezniRed - branje	f
00030000-55bf-51d5-d210-4a8d3b6c4b7f	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55bf-51d5-8cea-c98e4f7538a6	Sedez-read	Sedez - branje	f
00030000-55bf-51d5-4d43-06d598141b8d	Sedez-write	Sedez - spreminjanje	f
00030000-55bf-51d5-c5c0-aeff2c4ab45e	Sezona-read	Sezona - branje	f
00030000-55bf-51d5-9ccd-65164143671e	Sezona-write	Sezona - spreminjanje	f
00030000-55bf-51d5-105a-f856d7fdc13a	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55bf-51d5-49ca-a026ae7fc991	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55bf-51d5-aace-cb1e74d08d49	Stevilcenje-read	Stevilcenje - branje	f
00030000-55bf-51d5-1138-d00f7c2271e3	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55bf-51d5-049e-28e3f2ac0bf1	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55bf-51d5-1334-0a025321a8e8	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55bf-51d5-18ff-68806b5d2a47	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55bf-51d5-72f8-4527046a38f3	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55bf-51d5-834d-e75c8d0fbeda	Telefonska-read	Telefonska - branje	f
00030000-55bf-51d5-f555-03d0290ab4db	Telefonska-write	Telefonska - spreminjanje	f
00030000-55bf-51d5-eaa9-47a350625ad1	TerminStoritve-read	TerminStoritve - branje	f
00030000-55bf-51d5-3599-a0c0228fba58	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55bf-51d5-650f-7e07567b29bf	TipFunkcije-read	TipFunkcije - branje	f
00030000-55bf-51d5-c2f3-329f2c4ce226	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55bf-51d5-cacf-d9ef9274efd9	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55bf-51d5-7c79-2e8a5c978bfb	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55bf-51d5-9106-61ab87454b41	Trr-read	Trr - branje	f
00030000-55bf-51d5-775a-1602bac9b974	Trr-write	Trr - spreminjanje	f
00030000-55bf-51d5-d548-acfbf1a81033	Uprizoritev-read	Uprizoritev - branje	f
00030000-55bf-51d5-dbb4-00e782bdc9a7	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55bf-51d5-1771-9194bfd3483e	Vaja-read	Vaja - branje	f
00030000-55bf-51d5-e0be-44b102400a77	Vaja-write	Vaja - spreminjanje	f
00030000-55bf-51d5-3288-2a674340499d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55bf-51d5-3092-17942bf98712	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55bf-51d5-17bd-4a403853c5c8	Zaposlitev-read	Zaposlitev - branje	f
00030000-55bf-51d5-5e62-ddf0dcebb42f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55bf-51d5-f32c-4c3b706bc2f2	Zasedenost-read	Zasedenost - branje	f
00030000-55bf-51d5-b0cb-2c86235c752d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55bf-51d5-7256-be0b087b2213	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55bf-51d5-751c-0e2f6d091a94	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55bf-51d5-0466-0ff484f2090d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55bf-51d5-adca-52c3e112083f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55bf-51d5-6439-1b61e168dc7c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55bf-51d5-6fa2-230af87bfa94	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55bf-51d5-1f41-64b93bb27c69	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55bf-51d5-88e0-ee457a3406f2	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55bf-51d5-a836-5c8878bbe1c1	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-51d5-9879-bb006cb362c2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-51d5-cbc1-0225638d1349	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-51d5-ce1e-6c81c71e226a	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-51d5-1000-7a95b815f920	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55bf-51d5-f4cd-7fe5f56aa892	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55bf-51d5-aea6-69bc2952d086	Datoteka-write	Datoteka - spreminjanje	f
00030000-55bf-51d5-74a8-a3317be0a686	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2967 (class 0 OID 11517798)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55bf-51d5-0fe3-27c243f19f8f	00030000-55bf-51d5-cbd1-7e5c404b9c51
00020000-55bf-51d5-1662-cfe60522d5e0	00030000-55bf-51d5-ce6b-3591b7f27faf
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-21f9-252aec2276ae
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-6289-793de1398fdb
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-e3e9-dc88d973b84f
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-8e69-c0f1a0b0972b
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-5294-538a7111641c
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-45ae-bf0d83ee2b6c
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-cdba-8610400a5a0e
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-1559-62e134d84a8e
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-ce6b-3591b7f27faf
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-8d62-e9e6fac66992
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-2243-64067bd9e5ea
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-f45d-8b7f09f127d2
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-f811-43e72af68d4b
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-85af-1fa50e1c7ac6
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-7421-f3e641c99e40
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-5e32-68e5455c72af
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-0310-e7bf71715cf5
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-0769-cfe31c662282
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-9dbe-5cb9b164f353
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-7ff4-fbd176dc884d
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-9942-18c82dc750a5
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-95c0-10526f807d82
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-fc12-ce7a75a66abd
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-01c0-25f9c619e142
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-a23a-ac7be9a4f4fc
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-65cd-660bd02797b0
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-9650-afc879b957ed
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-3992-ce2aafa9cacf
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-36dd-d1a3048362cf
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-1a05-c421ed3b3d9b
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-7921-5f37a05c22db
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-d84c-88848951cdc2
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-52d9-715fd6245111
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-91d7-222e38660b63
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-3c0b-1a1fc891f4c7
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-ad2f-fa175bd07eb5
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-a929-966f82a6dede
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-495e-cf323877acb6
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-c5c0-aeff2c4ab45e
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-9ccd-65164143671e
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-650f-7e07567b29bf
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-d548-acfbf1a81033
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-dbb4-00e782bdc9a7
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-1771-9194bfd3483e
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-e0be-44b102400a77
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-f32c-4c3b706bc2f2
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-b0cb-2c86235c752d
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-7256-be0b087b2213
00020000-55bf-51d5-8fb5-91ebcf4c7f50	00030000-55bf-51d5-0466-0ff484f2090d
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-21f9-252aec2276ae
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-5294-538a7111641c
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-45ae-bf0d83ee2b6c
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-ce6b-3591b7f27faf
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-f811-43e72af68d4b
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-7421-f3e641c99e40
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-0310-e7bf71715cf5
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-0769-cfe31c662282
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-9dbe-5cb9b164f353
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-7ff4-fbd176dc884d
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-9942-18c82dc750a5
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-95c0-10526f807d82
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-fc12-ce7a75a66abd
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-a23a-ac7be9a4f4fc
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-9650-afc879b957ed
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-3992-ce2aafa9cacf
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-36dd-d1a3048362cf
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-52d9-715fd6245111
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-3c0b-1a1fc891f4c7
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-a929-966f82a6dede
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-c5c0-aeff2c4ab45e
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-834d-e75c8d0fbeda
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-f555-03d0290ab4db
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-9106-61ab87454b41
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-775a-1602bac9b974
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-17bd-4a403853c5c8
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-5e62-ddf0dcebb42f
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-7256-be0b087b2213
00020000-55bf-51d5-c9a3-0d1d9841b129	00030000-55bf-51d5-0466-0ff484f2090d
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-21f9-252aec2276ae
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-e3e9-dc88d973b84f
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-5294-538a7111641c
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-ecbc-3fc5441986ff
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-d36c-4b0f4c7c22f7
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-a617-433e821d928c
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-45ae-bf0d83ee2b6c
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-ce6b-3591b7f27faf
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-2243-64067bd9e5ea
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-f811-43e72af68d4b
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-7421-f3e641c99e40
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-0310-e7bf71715cf5
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-9dbe-5cb9b164f353
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-7ff4-fbd176dc884d
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-9942-18c82dc750a5
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-fc12-ce7a75a66abd
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-a23a-ac7be9a4f4fc
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-36dd-d1a3048362cf
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-7921-5f37a05c22db
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-52d9-715fd6245111
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-3c0b-1a1fc891f4c7
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-a929-966f82a6dede
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-c5c0-aeff2c4ab45e
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-650f-7e07567b29bf
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-1771-9194bfd3483e
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-f32c-4c3b706bc2f2
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-7256-be0b087b2213
00020000-55bf-51d5-768f-b559d97ff433	00030000-55bf-51d5-0466-0ff484f2090d
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-21f9-252aec2276ae
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-6289-793de1398fdb
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-8e69-c0f1a0b0972b
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-5294-538a7111641c
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-45ae-bf0d83ee2b6c
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-ce6b-3591b7f27faf
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-f811-43e72af68d4b
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-7421-f3e641c99e40
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-9dbe-5cb9b164f353
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-7ff4-fbd176dc884d
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-fc12-ce7a75a66abd
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-a23a-ac7be9a4f4fc
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-36dd-d1a3048362cf
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-52d9-715fd6245111
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-3c0b-1a1fc891f4c7
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-a929-966f82a6dede
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-c5c0-aeff2c4ab45e
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-650f-7e07567b29bf
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-7256-be0b087b2213
00020000-55bf-51d5-ebec-5a27ed9488cf	00030000-55bf-51d5-0466-0ff484f2090d
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-21f9-252aec2276ae
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-5294-538a7111641c
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-45ae-bf0d83ee2b6c
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-ce6b-3591b7f27faf
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-f811-43e72af68d4b
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-7421-f3e641c99e40
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-9dbe-5cb9b164f353
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-7ff4-fbd176dc884d
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-fc12-ce7a75a66abd
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-a23a-ac7be9a4f4fc
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-36dd-d1a3048362cf
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-52d9-715fd6245111
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-3c0b-1a1fc891f4c7
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-a929-966f82a6dede
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-c5c0-aeff2c4ab45e
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-eaa9-47a350625ad1
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-faf0-8a5397143cf4
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-650f-7e07567b29bf
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-7256-be0b087b2213
00020000-55bf-51d5-a094-371779ced2c1	00030000-55bf-51d5-0466-0ff484f2090d
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-1b19-8c0c2cce8c05
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-cbd1-7e5c404b9c51
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-faf0-8a5397143cf4
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-cdba-8610400a5a0e
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-6bd6-01b51954e92c
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-fbaa-c914920eb309
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-21f9-252aec2276ae
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-6289-793de1398fdb
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-e3e9-dc88d973b84f
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-8e69-c0f1a0b0972b
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-5294-538a7111641c
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-ecbc-3fc5441986ff
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-d36c-4b0f4c7c22f7
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-f3b9-c101e8d0ad55
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-a617-433e821d928c
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-6cce-f50a2e3145a4
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-45ae-bf0d83ee2b6c
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-1559-62e134d84a8e
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-ce6b-3591b7f27faf
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-8d62-e9e6fac66992
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-623d-dd2d49ca7c68
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-fa1a-2b316147a271
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-a89a-1b1a9ee1f8c5
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-3255-3c67b0bf0d6a
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-2243-64067bd9e5ea
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-f45d-8b7f09f127d2
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-f811-43e72af68d4b
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-85af-1fa50e1c7ac6
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-7421-f3e641c99e40
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-5e32-68e5455c72af
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-0310-e7bf71715cf5
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-0769-cfe31c662282
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-7828-d96b6a6b8dfc
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-4886-aa6fef98b86a
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-fa42-5eb187cfe84a
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-1751-56d98c7c1bd4
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-9dbe-5cb9b164f353
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-1aa0-5799a0a6538c
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-7ff4-fbd176dc884d
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-d48b-d2201e2a3762
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-9942-18c82dc750a5
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-95c0-10526f807d82
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-22e1-e81806d9c28d
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-cc63-68ea62550f34
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-f451-d430132ee8f9
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-3067-3cb0ce48bf5a
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-fd41-0a43c0724129
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-a0ac-38ef42f2e7e0
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-fc12-ce7a75a66abd
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-01c0-25f9c619e142
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-a23a-ac7be9a4f4fc
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-65cd-660bd02797b0
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-e2cc-9ec5c7dce157
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-cc96-5ad9d3824426
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-9650-afc879b957ed
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-3992-ce2aafa9cacf
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-36dd-d1a3048362cf
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-1a05-c421ed3b3d9b
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-28ce-fc1ee251fa06
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-bb87-1f6d78a465fb
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-6670-f0e323d6449a
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-1ac6-eb82a3fb213d
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-7921-5f37a05c22db
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-d84c-88848951cdc2
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-2b4b-c880bf0c0d39
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-a8f2-34bbc9fe0614
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-a113-83f6e702cfa8
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-418b-848fca902517
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-727f-2bd928bd1bbc
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-bedf-aa7720deb625
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-3c04-bd2a196a86b6
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-57ba-ac97b7ee088e
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-9dd2-3c4cfb466ca7
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-c430-1b68371eee4b
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-be97-d1f773ca6b97
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-d20a-8ca1ac5da4e1
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-b9b4-7ac56b58631d
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-18db-b195b0c6aec1
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-5c95-c8a1489ef5da
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-fa47-437502084f04
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-ea44-205f7e914ae8
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-3020-668d64c19f52
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-9613-ec1d5b7f7901
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-110b-6f819787849c
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-52d9-715fd6245111
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-91d7-222e38660b63
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-8b81-3064acc07d79
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-b819-dba848cbcfab
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-b91a-6a467c347561
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-e42f-19624edac4a8
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-3c0b-1a1fc891f4c7
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-ad2f-fa175bd07eb5
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-a929-966f82a6dede
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-495e-cf323877acb6
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-dd1e-b9bf0bbc2021
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-d464-c10a5445e6ba
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-f29e-80cac182b726
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-6d66-34cf185997c1
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-5db4-82274a310218
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-d210-4a8d3b6c4b7f
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-8cea-c98e4f7538a6
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-4d43-06d598141b8d
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-c5c0-aeff2c4ab45e
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-9ccd-65164143671e
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-105a-f856d7fdc13a
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-49ca-a026ae7fc991
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-aace-cb1e74d08d49
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-1138-d00f7c2271e3
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-049e-28e3f2ac0bf1
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-1334-0a025321a8e8
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-18ff-68806b5d2a47
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-72f8-4527046a38f3
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-834d-e75c8d0fbeda
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-f555-03d0290ab4db
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-eaa9-47a350625ad1
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-3599-a0c0228fba58
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-650f-7e07567b29bf
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-c2f3-329f2c4ce226
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-cacf-d9ef9274efd9
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-7c79-2e8a5c978bfb
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-9106-61ab87454b41
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-775a-1602bac9b974
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-d548-acfbf1a81033
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-dbb4-00e782bdc9a7
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-1771-9194bfd3483e
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-e0be-44b102400a77
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-3288-2a674340499d
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-3092-17942bf98712
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-17bd-4a403853c5c8
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-5e62-ddf0dcebb42f
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-f32c-4c3b706bc2f2
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-b0cb-2c86235c752d
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-7256-be0b087b2213
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-751c-0e2f6d091a94
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-0466-0ff484f2090d
00020000-55bf-51d6-f9f9-3c3ddf754b5e	00030000-55bf-51d5-adca-52c3e112083f
\.


--
-- TOC entry 2995 (class 0 OID 11518093)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 11518124)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11518238)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55bf-51d7-9051-147605507c41	00090000-55bf-51d7-ca82-86d43bfdb51f	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55bf-51d7-2dc6-c9cc936103bc	00090000-55bf-51d7-819d-d3b7366c2863	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55bf-51d7-13f5-7405f735079e	00090000-55bf-51d7-e286-1565bf071df3	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2972 (class 0 OID 11517858)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55bf-51d6-3687-73a475161842	00040000-55bf-51d5-36f7-fdc5b0039f27	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-51d6-d6b4-2b4c03d20b49	00040000-55bf-51d5-36f7-fdc5b0039f27	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55bf-51d6-066d-cdd645930ad2	00040000-55bf-51d5-36f7-fdc5b0039f27	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-51d6-7de6-d32e7660ce9c	00040000-55bf-51d5-36f7-fdc5b0039f27	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-51d6-1cb4-fd23f130b350	00040000-55bf-51d5-36f7-fdc5b0039f27	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-51d6-8641-33a97d600622	00040000-55bf-51d5-99a7-56a3d80c4933	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-51d6-c5cc-003da509f32c	00040000-55bf-51d5-3efe-fc167c761ba2	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-51d6-ff7a-ea775925ac7b	00040000-55bf-51d5-433b-280a8cddb66d	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-51d7-a1f3-7dc00ddbd231	00040000-55bf-51d5-36f7-fdc5b0039f27	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2974 (class 0 OID 11517893)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55bf-51d5-ed56-336cc3fec777	8341	Adlešiči
00050000-55bf-51d5-26fe-f076b4140d6b	5270	Ajdovščina
00050000-55bf-51d5-82c7-334d8883fe78	6280	Ankaran/Ancarano
00050000-55bf-51d5-6720-988bc085533d	9253	Apače
00050000-55bf-51d5-8e8c-f00bce880fcc	8253	Artiče
00050000-55bf-51d5-b53d-5f84388d1705	4275	Begunje na Gorenjskem
00050000-55bf-51d5-b001-1d062c8c0038	1382	Begunje pri Cerknici
00050000-55bf-51d5-1010-86eaa768c755	9231	Beltinci
00050000-55bf-51d5-ea28-1e4da5d05013	2234	Benedikt
00050000-55bf-51d5-30f5-c663cbae353b	2345	Bistrica ob Dravi
00050000-55bf-51d5-7f17-6e07637a9f4d	3256	Bistrica ob Sotli
00050000-55bf-51d5-1d10-ffa176c9a257	8259	Bizeljsko
00050000-55bf-51d5-9482-fcb97f6f8e87	1223	Blagovica
00050000-55bf-51d5-090e-db439f71966a	8283	Blanca
00050000-55bf-51d5-b5ee-5bf2638e5c86	4260	Bled
00050000-55bf-51d5-013d-00832a395e11	4273	Blejska Dobrava
00050000-55bf-51d5-54bf-f65a5e165eec	9265	Bodonci
00050000-55bf-51d5-0374-750177cc10af	9222	Bogojina
00050000-55bf-51d5-7bd8-955c2bc48417	4263	Bohinjska Bela
00050000-55bf-51d5-0f45-cc6133aa8036	4264	Bohinjska Bistrica
00050000-55bf-51d5-b51e-b2c9ed0d1012	4265	Bohinjsko jezero
00050000-55bf-51d5-2439-2e7e3b529603	1353	Borovnica
00050000-55bf-51d5-5815-32a14f5168f7	8294	Boštanj
00050000-55bf-51d5-3cb8-bf1e9edf56b8	5230	Bovec
00050000-55bf-51d5-bf33-056012da46a5	5295	Branik
00050000-55bf-51d5-3553-13db98c62b28	3314	Braslovče
00050000-55bf-51d5-1aee-ee799cad2c7f	5223	Breginj
00050000-55bf-51d5-e272-14dd6e5913f7	8280	Brestanica
00050000-55bf-51d5-8027-8ef297723096	2354	Bresternica
00050000-55bf-51d5-cf9d-d6e059339139	4243	Brezje
00050000-55bf-51d5-282e-67bcc9a01d30	1351	Brezovica pri Ljubljani
00050000-55bf-51d5-b399-64b5be87091f	8250	Brežice
00050000-55bf-51d5-4afc-7094042f0cd0	4210	Brnik - Aerodrom
00050000-55bf-51d5-87b4-ddd7edfefb09	8321	Brusnice
00050000-55bf-51d5-b841-15bf532222d9	3255	Buče
00050000-55bf-51d5-2539-d6ee02d07903	8276	Bučka 
00050000-55bf-51d5-e098-3cec4526b85c	9261	Cankova
00050000-55bf-51d5-40e6-63af1fa1f0b4	3000	Celje 
00050000-55bf-51d5-139d-c339ca7e60c6	3001	Celje - poštni predali
00050000-55bf-51d5-b7d7-5581ca8beadf	4207	Cerklje na Gorenjskem
00050000-55bf-51d5-25fc-87018741f0f0	8263	Cerklje ob Krki
00050000-55bf-51d5-e6f8-4bbb33f71a8a	1380	Cerknica
00050000-55bf-51d5-a9f4-081a631691a3	5282	Cerkno
00050000-55bf-51d5-b120-a17c22b2e279	2236	Cerkvenjak
00050000-55bf-51d5-dae1-289ac3bcb241	2215	Ceršak
00050000-55bf-51d5-edb6-cc5948ca8691	2326	Cirkovce
00050000-55bf-51d5-52e1-92ab5294e7e0	2282	Cirkulane
00050000-55bf-51d5-6369-ce72e97fd071	5273	Col
00050000-55bf-51d5-15e0-ff6a35b8a3ea	8251	Čatež ob Savi
00050000-55bf-51d5-7fe3-78391eddf1c6	1413	Čemšenik
00050000-55bf-51d5-b266-31e6156b0c1b	5253	Čepovan
00050000-55bf-51d5-1c54-4a7250c6a20c	9232	Črenšovci
00050000-55bf-51d5-c773-a8d03eb24ba4	2393	Črna na Koroškem
00050000-55bf-51d5-88b8-011545a59bbc	6275	Črni Kal
00050000-55bf-51d5-a3e8-e141985211bd	5274	Črni Vrh nad Idrijo
00050000-55bf-51d5-86cc-d423dcff0522	5262	Črniče
00050000-55bf-51d5-f8e0-a96264a157ab	8340	Črnomelj
00050000-55bf-51d5-6e71-71deccd137b5	6271	Dekani
00050000-55bf-51d5-1895-d15793493c4c	5210	Deskle
00050000-55bf-51d5-5668-78d4f2817da1	2253	Destrnik
00050000-55bf-51d5-34d0-98dfe3ce004f	6215	Divača
00050000-55bf-51d5-5a0a-4b96de52da35	1233	Dob
00050000-55bf-51d5-757b-25d6966b3f19	3224	Dobje pri Planini
00050000-55bf-51d5-9e11-77c2c6b44efe	8257	Dobova
00050000-55bf-51d5-abf1-c582a51402b4	1423	Dobovec
00050000-55bf-51d5-37c6-15e259cd26bc	5263	Dobravlje
00050000-55bf-51d5-307e-7df09018a361	3204	Dobrna
00050000-55bf-51d5-403f-98f1926feba6	8211	Dobrnič
00050000-55bf-51d5-15f9-1d3febf7387b	1356	Dobrova
00050000-55bf-51d5-b285-a9ba97543085	9223	Dobrovnik/Dobronak 
00050000-55bf-51d5-4f65-e5b0b2e9b717	5212	Dobrovo v Brdih
00050000-55bf-51d5-1be6-f67e60156d92	1431	Dol pri Hrastniku
00050000-55bf-51d5-5d6b-78a0e4cf69e9	1262	Dol pri Ljubljani
00050000-55bf-51d5-5d6a-839af8447de9	1273	Dole pri Litiji
00050000-55bf-51d5-e49d-c3f62a2c00e9	1331	Dolenja vas
00050000-55bf-51d5-ed9a-dda1a6e8ce96	8350	Dolenjske Toplice
00050000-55bf-51d5-dec6-e4e495a66cbf	1230	Domžale
00050000-55bf-51d5-eafa-db917aa9c609	2252	Dornava
00050000-55bf-51d5-7c67-514722cda550	5294	Dornberk
00050000-55bf-51d5-75da-87498f81cac6	1319	Draga
00050000-55bf-51d5-c9e9-ac1b871dab06	8343	Dragatuš
00050000-55bf-51d5-3892-c6e63211ce4c	3222	Dramlje
00050000-55bf-51d5-d4e5-51b1966ce6c9	2370	Dravograd
00050000-55bf-51d5-4075-61a77e5cfa04	4203	Duplje
00050000-55bf-51d5-814f-0dbc76b3e70b	6221	Dutovlje
00050000-55bf-51d5-9c40-c46109ff7e5c	8361	Dvor
00050000-55bf-51d5-4dba-8abd8cfb34c7	2343	Fala
00050000-55bf-51d5-e938-34453273453e	9208	Fokovci
00050000-55bf-51d5-996c-2b14196406c8	2313	Fram
00050000-55bf-51d5-2d8b-367ad4f4eb80	3213	Frankolovo
00050000-55bf-51d5-a14a-9847d67f9bc5	1274	Gabrovka
00050000-55bf-51d5-3baa-02ae8a66eca9	8254	Globoko
00050000-55bf-51d5-357e-08527cbd4022	5275	Godovič
00050000-55bf-51d5-df73-a3971ff8c893	4204	Golnik
00050000-55bf-51d5-3adc-217a4fd1b2b0	3303	Gomilsko
00050000-55bf-51d5-4f99-16a5aaf2d67b	4224	Gorenja vas
00050000-55bf-51d5-70cf-b1d4fd011068	3263	Gorica pri Slivnici
00050000-55bf-51d5-808d-181693ed9583	2272	Gorišnica
00050000-55bf-51d5-eb6e-77473a0a4920	9250	Gornja Radgona
00050000-55bf-51d5-0919-ce9741c8a862	3342	Gornji Grad
00050000-55bf-51d5-760c-60f02655cb6d	4282	Gozd Martuljek
00050000-55bf-51d5-6d8b-8ed87b00a3b1	6272	Gračišče
00050000-55bf-51d5-7e99-a63377f51e2b	9264	Grad
00050000-55bf-51d5-bbaa-c6d91885586d	8332	Gradac
00050000-55bf-51d5-506a-607354d53453	1384	Grahovo
00050000-55bf-51d5-7f1b-fb8b9c52eb3c	5242	Grahovo ob Bači
00050000-55bf-51d5-86ab-6b54365d6fbe	5251	Grgar
00050000-55bf-51d5-ad15-2bc130ed1b75	3302	Griže
00050000-55bf-51d5-0908-b77291d57121	3231	Grobelno
00050000-55bf-51d5-0069-79f572ab4361	1290	Grosuplje
00050000-55bf-51d5-c797-667a92554186	2288	Hajdina
00050000-55bf-51d5-06a8-a5472bda3029	8362	Hinje
00050000-55bf-51d5-ef76-39fdce3768df	2311	Hoče
00050000-55bf-51d5-e3a8-457fffc85855	9205	Hodoš/Hodos
00050000-55bf-51d5-ea1a-be8bda39886f	1354	Horjul
00050000-55bf-51d5-f36a-4dd3e939220e	1372	Hotedršica
00050000-55bf-51d5-9c54-4a6d2a1c71cc	1430	Hrastnik
00050000-55bf-51d5-04f2-9588dc29493c	6225	Hruševje
00050000-55bf-51d5-40fd-8487924dde6d	4276	Hrušica
00050000-55bf-51d5-a948-bf1ddd05ed43	5280	Idrija
00050000-55bf-51d5-6f23-294854dbf875	1292	Ig
00050000-55bf-51d5-ec5a-d2310cc54395	6250	Ilirska Bistrica
00050000-55bf-51d5-12a9-b67a8fe0ebeb	6251	Ilirska Bistrica-Trnovo
00050000-55bf-51d5-b5f3-1761f8aaeec4	1295	Ivančna Gorica
00050000-55bf-51d5-f846-f9b517de3b70	2259	Ivanjkovci
00050000-55bf-51d5-f94e-8eb70bc6380c	1411	Izlake
00050000-55bf-51d5-ea57-7bdb0ff80a0e	6310	Izola/Isola
00050000-55bf-51d5-8aa1-be4ea83f997b	2222	Jakobski Dol
00050000-55bf-51d5-ef28-43c05cb689f9	2221	Jarenina
00050000-55bf-51d5-4428-4463989e10e4	6254	Jelšane
00050000-55bf-51d5-ff6d-cffea0372801	4270	Jesenice
00050000-55bf-51d5-c1ad-439f832763fd	8261	Jesenice na Dolenjskem
00050000-55bf-51d5-f8ac-d064c64ad01a	3273	Jurklošter
00050000-55bf-51d5-78b1-d6d190a7b430	2223	Jurovski Dol
00050000-55bf-51d5-d8a6-7c0d992deb37	2256	Juršinci
00050000-55bf-51d5-0c90-33770e51d920	5214	Kal nad Kanalom
00050000-55bf-51d5-9b77-9beef5f3d9da	3233	Kalobje
00050000-55bf-51d5-06b3-aca903936d10	4246	Kamna Gorica
00050000-55bf-51d5-2a07-494c1373033c	2351	Kamnica
00050000-55bf-51d5-a4a6-207568c35e22	1241	Kamnik
00050000-55bf-51d5-e987-ee90cc98321b	5213	Kanal
00050000-55bf-51d5-78ba-40071c15ee54	8258	Kapele
00050000-55bf-51d5-e692-cbae0d0395ed	2362	Kapla
00050000-55bf-51d5-4899-0c11d4aefa69	2325	Kidričevo
00050000-55bf-51d5-e190-027e4ef714e5	1412	Kisovec
00050000-55bf-51d5-d95a-0ae485901df1	6253	Knežak
00050000-55bf-51d5-1338-f34a074f5c7a	5222	Kobarid
00050000-55bf-51d5-fe70-45e2a47429e4	9227	Kobilje
00050000-55bf-51d5-7a22-32355553738d	1330	Kočevje
00050000-55bf-51d5-5c56-9125e1e8db17	1338	Kočevska Reka
00050000-55bf-51d5-8e73-4321987e4993	2276	Kog
00050000-55bf-51d5-6e02-42ae5228daa5	5211	Kojsko
00050000-55bf-51d5-2515-9b48e62ccb30	6223	Komen
00050000-55bf-51d5-dfce-bb9c6e9d6278	1218	Komenda
00050000-55bf-51d5-d193-8f40e867594d	6000	Koper/Capodistria 
00050000-55bf-51d5-5ee9-ab17d2afc8e0	6001	Koper/Capodistria - poštni predali
00050000-55bf-51d5-ead2-044673b1877f	8282	Koprivnica
00050000-55bf-51d5-9fe9-8246bcd47ee2	5296	Kostanjevica na Krasu
00050000-55bf-51d5-1182-884bd9797d85	8311	Kostanjevica na Krki
00050000-55bf-51d5-ac32-31eddbfe4d84	1336	Kostel
00050000-55bf-51d5-75a3-95ff8fe18a50	6256	Košana
00050000-55bf-51d5-ed16-b285229b0647	2394	Kotlje
00050000-55bf-51d5-1704-5045f0ca80db	6240	Kozina
00050000-55bf-51d5-7679-2ee47178ffbe	3260	Kozje
00050000-55bf-51d5-3289-1e4cbd2969b0	4000	Kranj 
00050000-55bf-51d5-903e-b4a657776703	4001	Kranj - poštni predali
00050000-55bf-51d5-2fd8-ac531a476853	4280	Kranjska Gora
00050000-55bf-51d5-664b-24c3987d73fe	1281	Kresnice
00050000-55bf-51d5-883f-8bf1f1cd77dd	4294	Križe
00050000-55bf-51d5-be2c-812b41bb23f5	9206	Križevci
00050000-55bf-51d5-11c3-1cadb2b6bee2	9242	Križevci pri Ljutomeru
00050000-55bf-51d5-d2b7-70da6dfb1f50	1301	Krka
00050000-55bf-51d5-a1fa-2e39a0f2b5aa	8296	Krmelj
00050000-55bf-51d5-9c55-a8b24d6833c8	4245	Kropa
00050000-55bf-51d5-66c4-9c50c90316a0	8262	Krška vas
00050000-55bf-51d5-9ce1-c98eceaafe46	8270	Krško
00050000-55bf-51d5-0298-a42b217213f1	9263	Kuzma
00050000-55bf-51d5-41e9-c0ca57cb4e11	2318	Laporje
00050000-55bf-51d5-4dc4-0dd39af1c785	3270	Laško
00050000-55bf-51d5-4811-8157a8ae8387	1219	Laze v Tuhinju
00050000-55bf-51d5-7f3e-7050e935d79c	2230	Lenart v Slovenskih goricah
00050000-55bf-51d5-7e58-4ba5529362f7	9220	Lendava/Lendva
00050000-55bf-51d5-fc66-362c65f108d0	4248	Lesce
00050000-55bf-51d5-9e43-2571708d2eba	3261	Lesično
00050000-55bf-51d5-fbb2-d3eee461fae5	8273	Leskovec pri Krškem
00050000-55bf-51d5-ae02-ceb81d31d936	2372	Libeliče
00050000-55bf-51d5-c744-71a65e727536	2341	Limbuš
00050000-55bf-51d5-98dd-7a17037c160f	1270	Litija
00050000-55bf-51d5-7753-0c0b921d3f9d	3202	Ljubečna
00050000-55bf-51d5-95f8-07bf1fd4cfa3	1000	Ljubljana 
00050000-55bf-51d5-09f2-38bf6ee9d483	1001	Ljubljana - poštni predali
00050000-55bf-51d5-dec0-87364cc3e684	1231	Ljubljana - Črnuče
00050000-55bf-51d5-44a9-13567ba5a963	1261	Ljubljana - Dobrunje
00050000-55bf-51d5-17ce-280c9d5f4185	1260	Ljubljana - Polje
00050000-55bf-51d5-0cd5-1d489419462a	1210	Ljubljana - Šentvid
00050000-55bf-51d5-5ced-f8f1ca1e086c	1211	Ljubljana - Šmartno
00050000-55bf-51d5-bbcd-9613148e66d0	3333	Ljubno ob Savinji
00050000-55bf-51d5-44fc-9d7792bf56cb	9240	Ljutomer
00050000-55bf-51d5-132b-8ca63971e21f	3215	Loče
00050000-55bf-51d5-b514-61ed5d12f792	5231	Log pod Mangartom
00050000-55bf-51d5-a471-2fe61f07c4c8	1358	Log pri Brezovici
00050000-55bf-51d5-f583-26038fa17ef8	1370	Logatec
00050000-55bf-51d5-2ee7-91e0a5e4d0f2	1371	Logatec
00050000-55bf-51d5-abbb-251371db5db6	1434	Loka pri Zidanem Mostu
00050000-55bf-51d5-96be-1fe9436edaba	3223	Loka pri Žusmu
00050000-55bf-51d5-3724-3050959ac5eb	6219	Lokev
00050000-55bf-51d5-4d3e-e3be343b35ec	1318	Loški Potok
00050000-55bf-51d5-faef-1b36e3d05000	2324	Lovrenc na Dravskem polju
00050000-55bf-51d5-aaa9-242223f4b2d4	2344	Lovrenc na Pohorju
00050000-55bf-51d5-90ae-692aaa5068b3	3334	Luče
00050000-55bf-51d5-4f9b-9853c7ed92f9	1225	Lukovica
00050000-55bf-51d5-03f8-47dbd67b8b3d	9202	Mačkovci
00050000-55bf-51d5-8c14-67023574dfb9	2322	Majšperk
00050000-55bf-51d5-dcab-77829df2fb07	2321	Makole
00050000-55bf-51d5-c48d-2062b915d118	9243	Mala Nedelja
00050000-55bf-51d5-cd13-04a833cb0601	2229	Malečnik
00050000-55bf-51d5-3b5c-d746fcc4609f	6273	Marezige
00050000-55bf-51d5-7a06-0f33e0560557	2000	Maribor 
00050000-55bf-51d5-cb06-50b70da585ed	2001	Maribor - poštni predali
00050000-55bf-51d5-447a-13a189af0599	2206	Marjeta na Dravskem polju
00050000-55bf-51d5-c54b-9810bb129934	2281	Markovci
00050000-55bf-51d5-8b9f-a824b6bd4972	9221	Martjanci
00050000-55bf-51d5-afaf-f9f126c83414	6242	Materija
00050000-55bf-51d5-6d75-193d62ffcddb	4211	Mavčiče
00050000-55bf-51d5-9ff5-5b7f8c951849	1215	Medvode
00050000-55bf-51d5-7dab-a03ac0b1b1aa	1234	Mengeš
00050000-55bf-51d5-f169-be5510349e53	8330	Metlika
00050000-55bf-51d5-b26e-3b6041771847	2392	Mežica
00050000-55bf-51d5-90e7-675598649c5c	2204	Miklavž na Dravskem polju
00050000-55bf-51d5-8c91-7f06f35d1bf5	2275	Miklavž pri Ormožu
00050000-55bf-51d5-2af8-5018a764440b	5291	Miren
00050000-55bf-51d5-9d63-40c531d9bc37	8233	Mirna
00050000-55bf-51d5-577b-7959af6d1299	8216	Mirna Peč
00050000-55bf-51d5-415e-570f0e23686a	2382	Mislinja
00050000-55bf-51d5-98ab-1559d03ce75b	4281	Mojstrana
00050000-55bf-51d5-6499-897edee6538e	8230	Mokronog
00050000-55bf-51d5-e964-5775ddec91e6	1251	Moravče
00050000-55bf-51d5-e9a7-44f0771c7f93	9226	Moravske Toplice
00050000-55bf-51d5-bb54-d7842291364a	5216	Most na Soči
00050000-55bf-51d5-16b9-587c7e1a64c8	1221	Motnik
00050000-55bf-51d5-f891-c4f790deac58	3330	Mozirje
00050000-55bf-51d5-ee6b-2795a355d63e	9000	Murska Sobota 
00050000-55bf-51d5-51e4-911109f72bc6	9001	Murska Sobota - poštni predali
00050000-55bf-51d5-b587-816c99cecf0f	2366	Muta
00050000-55bf-51d5-4859-1e23a395bd20	4202	Naklo
00050000-55bf-51d5-f553-449a96dd7818	3331	Nazarje
00050000-55bf-51d5-d312-8fd4df30adbe	1357	Notranje Gorice
00050000-55bf-51d5-bea5-0191627ed6bb	3203	Nova Cerkev
00050000-55bf-51d5-25f6-d51f27a39286	5000	Nova Gorica 
00050000-55bf-51d5-037e-b021afa9ac62	5001	Nova Gorica - poštni predali
00050000-55bf-51d5-ff8c-30348e2a52c2	1385	Nova vas
00050000-55bf-51d5-d134-30383a7b6219	8000	Novo mesto
00050000-55bf-51d5-77cf-b8399e2ba213	8001	Novo mesto - poštni predali
00050000-55bf-51d5-7da5-63fc87a777d9	6243	Obrov
00050000-55bf-51d5-fb06-1b3b7756a1df	9233	Odranci
00050000-55bf-51d5-8ef7-d94bba2c2c35	2317	Oplotnica
00050000-55bf-51d5-7f9b-c252a625dfbc	2312	Orehova vas
00050000-55bf-51d5-19b5-0ade12c7a87b	2270	Ormož
00050000-55bf-51d5-3bb3-de9e2b1cc5e6	1316	Ortnek
00050000-55bf-51d5-6da2-e8dd166324c9	1337	Osilnica
00050000-55bf-51d5-5dc3-bba5c4e4673e	8222	Otočec
00050000-55bf-51d5-01e3-777337bf5018	2361	Ožbalt
00050000-55bf-51d5-3eae-932c3fb4cb91	2231	Pernica
00050000-55bf-51d5-aa8f-6104f5bd8404	2211	Pesnica pri Mariboru
00050000-55bf-51d5-b5c9-bfd2b916f674	9203	Petrovci
00050000-55bf-51d5-5d9c-4aade16da8ad	3301	Petrovče
00050000-55bf-51d5-8e06-a8b3803acfd0	6330	Piran/Pirano
00050000-55bf-51d5-6755-43d157d65fe8	8255	Pišece
00050000-55bf-51d5-2271-3e3e10ca6b93	6257	Pivka
00050000-55bf-51d5-ea82-b218dc6e847c	6232	Planina
00050000-55bf-51d5-c043-1c1b395cc112	3225	Planina pri Sevnici
00050000-55bf-51d5-7d76-53807659a4db	6276	Pobegi
00050000-55bf-51d5-ca0f-4ee178b0a1cb	8312	Podbočje
00050000-55bf-51d5-2d7b-f1fa9ace1b0b	5243	Podbrdo
00050000-55bf-51d5-764d-ef75c8a0f7ef	3254	Podčetrtek
00050000-55bf-51d5-c440-7747e2ffdbc2	2273	Podgorci
00050000-55bf-51d5-46fa-0f1bb61aeefd	6216	Podgorje
00050000-55bf-51d5-74ea-5f61c851cd1c	2381	Podgorje pri Slovenj Gradcu
00050000-55bf-51d5-d872-9f3381e9c664	6244	Podgrad
00050000-55bf-51d5-aa9d-19ab1890e57d	1414	Podkum
00050000-55bf-51d5-ab5e-06f4a6c7be1d	2286	Podlehnik
00050000-55bf-51d5-b9ac-15f312cd9796	5272	Podnanos
00050000-55bf-51d5-8cd0-cf3a9671377e	4244	Podnart
00050000-55bf-51d5-6add-af943caacada	3241	Podplat
00050000-55bf-51d5-9b32-ef7a29109b35	3257	Podsreda
00050000-55bf-51d5-d09a-1e3cecfc433b	2363	Podvelka
00050000-55bf-51d5-400f-d71f408c311f	2208	Pohorje
00050000-55bf-51d5-5de7-b4896200bef6	2257	Polenšak
00050000-55bf-51d5-d57e-daf6b59ef465	1355	Polhov Gradec
00050000-55bf-51d5-b356-06854e31a437	4223	Poljane nad Škofjo Loko
00050000-55bf-51d5-1af9-7668dabf3a59	2319	Poljčane
00050000-55bf-51d5-a1a5-8394b715aabb	1272	Polšnik
00050000-55bf-51d5-8919-9b0faa6cf70f	3313	Polzela
00050000-55bf-51d5-dac7-05f5c072f0be	3232	Ponikva
00050000-55bf-51d5-6b02-79c03631cdbb	6320	Portorož/Portorose
00050000-55bf-51d5-5b36-2cc30db246ba	6230	Postojna
00050000-55bf-51d5-e541-a3951f70ed9e	2331	Pragersko
00050000-55bf-51d5-2af4-2aee6b3888c2	3312	Prebold
00050000-55bf-51d5-7800-dbac1931f1fa	4205	Preddvor
00050000-55bf-51d5-a57e-8f76edf72800	6255	Prem
00050000-55bf-51d5-a37f-f68d4f03006a	1352	Preserje
00050000-55bf-51d5-f919-e17f65a4c7a4	6258	Prestranek
00050000-55bf-51d5-ae65-f87f6d50ad7c	2391	Prevalje
00050000-55bf-51d5-a354-0a23358dde54	3262	Prevorje
00050000-55bf-51d5-5dc4-ebc49f993676	1276	Primskovo 
00050000-55bf-51d5-d645-825b9817ba54	3253	Pristava pri Mestinju
00050000-55bf-51d5-37d1-aaad5defa2fb	9207	Prosenjakovci/Partosfalva
00050000-55bf-51d5-bd81-b2e3b57ddb50	5297	Prvačina
00050000-55bf-51d5-a230-eb21dfe40169	2250	Ptuj
00050000-55bf-51d5-00ce-15bcb0fc0991	2323	Ptujska Gora
00050000-55bf-51d5-5faa-9a3e62eaca36	9201	Puconci
00050000-55bf-51d5-6760-eb36e4167e15	2327	Rače
00050000-55bf-51d5-85a7-751e07430dac	1433	Radeče
00050000-55bf-51d5-a07f-051e523d768d	9252	Radenci
00050000-55bf-51d5-a96d-f65f4fe13d58	2360	Radlje ob Dravi
00050000-55bf-51d5-011c-a060c3f190d2	1235	Radomlje
00050000-55bf-51d5-e3ee-19815bc53398	4240	Radovljica
00050000-55bf-51d5-86e5-264451ac1fc9	8274	Raka
00050000-55bf-51d5-ba03-60a03bb941bb	1381	Rakek
00050000-55bf-51d5-b189-81ade0539900	4283	Rateče - Planica
00050000-55bf-51d5-f32f-d048f24dbd14	2390	Ravne na Koroškem
00050000-55bf-51d5-70f4-915ffd5e88e1	9246	Razkrižje
00050000-55bf-51d5-d086-333c7c575087	3332	Rečica ob Savinji
00050000-55bf-51d5-73d8-9058010af8c4	5292	Renče
00050000-55bf-51d5-b152-4aec06fed150	1310	Ribnica
00050000-55bf-51d5-601d-3c1d1536b0c9	2364	Ribnica na Pohorju
00050000-55bf-51d5-29de-f2ce2d401024	3272	Rimske Toplice
00050000-55bf-51d5-b824-d92f020ec4bb	1314	Rob
00050000-55bf-51d5-0e3b-c49ff0e4777e	5215	Ročinj
00050000-55bf-51d5-8495-b22daa2bf229	3250	Rogaška Slatina
00050000-55bf-51d5-387f-24f7503e45a1	9262	Rogašovci
00050000-55bf-51d5-3569-a293d853eed5	3252	Rogatec
00050000-55bf-51d5-f2cf-9fb00ef96155	1373	Rovte
00050000-55bf-51d5-65aa-85992dbdc5db	2342	Ruše
00050000-55bf-51d5-09da-9e03a4bf4481	1282	Sava
00050000-55bf-51d5-f77c-7c3dc5657bdd	6333	Sečovlje/Sicciole
00050000-55bf-51d5-c565-837aa63993a2	4227	Selca
00050000-55bf-51d5-ae85-207c581b7594	2352	Selnica ob Dravi
00050000-55bf-51d5-0c30-ff3dc4e70a88	8333	Semič
00050000-55bf-51d5-68d9-9b18cdb8a060	8281	Senovo
00050000-55bf-51d5-0d0e-405be543aa4f	6224	Senožeče
00050000-55bf-51d5-98a5-79a8d07806c3	8290	Sevnica
00050000-55bf-51d5-6694-5c983d845067	6210	Sežana
00050000-55bf-51d5-92ca-a36a03e33721	2214	Sladki Vrh
00050000-55bf-51d5-46c0-7b164c419c3b	5283	Slap ob Idrijci
00050000-55bf-51d5-f6cc-d67dd56cbb54	2380	Slovenj Gradec
00050000-55bf-51d5-0334-fddf726dca7a	2310	Slovenska Bistrica
00050000-55bf-51d5-c4d0-350fb0020e51	3210	Slovenske Konjice
00050000-55bf-51d5-1698-69bf6f29780f	1216	Smlednik
00050000-55bf-51d5-5a6f-fa44233b9905	5232	Soča
00050000-55bf-51d5-401b-0b816f9863d4	1317	Sodražica
00050000-55bf-51d5-d01e-2031971598f3	3335	Solčava
00050000-55bf-51d5-33d4-0941ef7eb6a0	5250	Solkan
00050000-55bf-51d5-6390-aad1888a62fa	4229	Sorica
00050000-55bf-51d5-3e76-f3480367caf8	4225	Sovodenj
00050000-55bf-51d5-18dc-42619125fe93	5281	Spodnja Idrija
00050000-55bf-51d5-de14-5ede5eebf08c	2241	Spodnji Duplek
00050000-55bf-51d5-efe2-dd8b54426944	9245	Spodnji Ivanjci
00050000-55bf-51d5-3f0b-c10a38116f62	2277	Središče ob Dravi
00050000-55bf-51d5-7424-6c778f47e6bf	4267	Srednja vas v Bohinju
00050000-55bf-51d5-563a-90745df7ced3	8256	Sromlje 
00050000-55bf-51d5-609f-8709583e6b30	5224	Srpenica
00050000-55bf-51d5-3a5b-a306a716f935	1242	Stahovica
00050000-55bf-51d5-333f-d30ab6f679f4	1332	Stara Cerkev
00050000-55bf-51d5-33a2-3ef09655ff47	8342	Stari trg ob Kolpi
00050000-55bf-51d5-7c94-03dce758ad80	1386	Stari trg pri Ložu
00050000-55bf-51d5-a902-d8ae41918c61	2205	Starše
00050000-55bf-51d5-362e-99032a1d439f	2289	Stoperce
00050000-55bf-51d5-078c-f01c27953b5e	8322	Stopiče
00050000-55bf-51d5-fd41-4a2804ad8e4a	3206	Stranice
00050000-55bf-51d5-344b-767ff1034a43	8351	Straža
00050000-55bf-51d5-6636-629efee8e14f	1313	Struge
00050000-55bf-51d5-4ccb-e2e92f0ff466	8293	Studenec
00050000-55bf-51d5-4bdc-73e187e958b7	8331	Suhor
00050000-55bf-51d5-91e4-a7469a10397b	2233	Sv. Ana v Slovenskih goricah
00050000-55bf-51d5-3a44-2710fe58118b	2235	Sv. Trojica v Slovenskih goricah
00050000-55bf-51d5-9ec9-c626d8915c32	2353	Sveti Duh na Ostrem Vrhu
00050000-55bf-51d5-f711-a7f049c29656	9244	Sveti Jurij ob Ščavnici
00050000-55bf-51d5-052e-a4c33d90eba0	3264	Sveti Štefan
00050000-55bf-51d5-22c5-d3eb8e606b7d	2258	Sveti Tomaž
00050000-55bf-51d5-1850-b29ae85bf20f	9204	Šalovci
00050000-55bf-51d5-6353-a0cc3c2d85d5	5261	Šempas
00050000-55bf-51d5-40f9-780a9471d24a	5290	Šempeter pri Gorici
00050000-55bf-51d5-3dfd-de537c959b6b	3311	Šempeter v Savinjski dolini
00050000-55bf-51d5-767b-dff8d0a790ce	4208	Šenčur
00050000-55bf-51d5-1df7-8f7b1228c6b1	2212	Šentilj v Slovenskih goricah
00050000-55bf-51d5-9daf-7745ca45decc	8297	Šentjanž
00050000-55bf-51d5-77e9-dc61f661e9ab	2373	Šentjanž pri Dravogradu
00050000-55bf-51d5-0f27-d399cd002859	8310	Šentjernej
00050000-55bf-51d5-e4a8-31523f1e0188	3230	Šentjur
00050000-55bf-51d5-278c-067791d4f9ad	3271	Šentrupert
00050000-55bf-51d5-bcde-79da4a511963	8232	Šentrupert
00050000-55bf-51d5-b3e5-b8e3229f3f66	1296	Šentvid pri Stični
00050000-55bf-51d5-ef45-d9e4e8bbd673	8275	Škocjan
00050000-55bf-51d5-250e-8fae2aa2966d	6281	Škofije
00050000-55bf-51d5-4195-dd18b54b0bdd	4220	Škofja Loka
00050000-55bf-51d5-9dfb-6607d1cd49f5	3211	Škofja vas
00050000-55bf-51d5-c86c-5ce2d640e3e0	1291	Škofljica
00050000-55bf-51d5-5b98-f8ecf146e75e	6274	Šmarje
00050000-55bf-51d5-8940-31789b5c7ef9	1293	Šmarje - Sap
00050000-55bf-51d5-778c-5d04d36bfca5	3240	Šmarje pri Jelšah
00050000-55bf-51d5-8642-dc0b4e11cd9a	8220	Šmarješke Toplice
00050000-55bf-51d5-e513-5afc050f79b8	2315	Šmartno na Pohorju
00050000-55bf-51d5-e205-e9f1807fc24e	3341	Šmartno ob Dreti
00050000-55bf-51d5-3196-872db524b1c1	3327	Šmartno ob Paki
00050000-55bf-51d5-06f9-448a5f0dbe5a	1275	Šmartno pri Litiji
00050000-55bf-51d5-f1f0-707c5f6fe5f2	2383	Šmartno pri Slovenj Gradcu
00050000-55bf-51d5-eab9-105b130c0021	3201	Šmartno v Rožni dolini
00050000-55bf-51d5-889c-2bfa3db5c9ec	3325	Šoštanj
00050000-55bf-51d5-ca5a-080697df6eb0	6222	Štanjel
00050000-55bf-51d5-d773-40844c31ef8e	3220	Štore
00050000-55bf-51d5-12c1-1e1378fa7026	3304	Tabor
00050000-55bf-51d5-3291-6175c6eeafbf	3221	Teharje
00050000-55bf-51d5-a357-638e7bd44bac	9251	Tišina
00050000-55bf-51d5-6bbb-a95b4c045fe8	5220	Tolmin
00050000-55bf-51d5-1b75-10ebf35364d8	3326	Topolšica
00050000-55bf-51d5-8d73-54d977af8b5b	2371	Trbonje
00050000-55bf-51d5-cdfa-94525ee2162b	1420	Trbovlje
00050000-55bf-51d5-b03d-c5408ee12249	8231	Trebelno 
00050000-55bf-51d5-3052-2cfb72f83286	8210	Trebnje
00050000-55bf-51d5-e5b1-4b9f6f67efa6	5252	Trnovo pri Gorici
00050000-55bf-51d5-9627-b14561b7b62b	2254	Trnovska vas
00050000-55bf-51d5-1f8d-91409029b5e9	1222	Trojane
00050000-55bf-51d5-2089-937ba8528357	1236	Trzin
00050000-55bf-51d5-4007-1cce0b4a41e8	4290	Tržič
00050000-55bf-51d5-1fdb-29dc8d4af97d	8295	Tržišče
00050000-55bf-51d5-de9a-065b385e4de5	1311	Turjak
00050000-55bf-51d5-5480-bb6a1250161e	9224	Turnišče
00050000-55bf-51d5-7c5a-02fd0963a3e2	8323	Uršna sela
00050000-55bf-51d5-90f2-935ec12ffb24	1252	Vače
00050000-55bf-51d5-6aab-8e4431ddc3f3	3320	Velenje 
00050000-55bf-51d5-30cf-422f35ca013b	3322	Velenje - poštni predali
00050000-55bf-51d5-1e16-31c1ba076d92	8212	Velika Loka
00050000-55bf-51d5-353a-1032287e7969	2274	Velika Nedelja
00050000-55bf-51d5-940b-b43fb5411339	9225	Velika Polana
00050000-55bf-51d5-f638-6edf32bf652c	1315	Velike Lašče
00050000-55bf-51d5-5ad8-596c56876f2a	8213	Veliki Gaber
00050000-55bf-51d5-be7a-e6c788388324	9241	Veržej
00050000-55bf-51d5-545d-be26d155b61a	1312	Videm - Dobrepolje
00050000-55bf-51d5-da3e-e1c2001eda3a	2284	Videm pri Ptuju
00050000-55bf-51d5-47b2-c2871297f15e	8344	Vinica
00050000-55bf-51d5-a329-1caeb6f8c2b4	5271	Vipava
00050000-55bf-51d5-e67d-5181f8aaf818	4212	Visoko
00050000-55bf-51d5-ed0f-8f2c7c0aa497	1294	Višnja Gora
00050000-55bf-51d5-a7f0-8cdfe2f1f072	3205	Vitanje
00050000-55bf-51d5-f4ea-d9ca2ebcaa29	2255	Vitomarci
00050000-55bf-51d5-ad78-7463feb07ad9	1217	Vodice
00050000-55bf-51d5-3283-923e83aeba2d	3212	Vojnik\t
00050000-55bf-51d5-6705-476ea63f64bc	5293	Volčja Draga
00050000-55bf-51d5-89fb-733edd077c21	2232	Voličina
00050000-55bf-51d5-1553-8665d649d042	3305	Vransko
00050000-55bf-51d5-2ea4-74938803f94c	6217	Vremski Britof
00050000-55bf-51d5-bdb5-bb95049127e3	1360	Vrhnika
00050000-55bf-51d5-6e33-7b47726b06d0	2365	Vuhred
00050000-55bf-51d5-08db-49cca2bae3fd	2367	Vuzenica
00050000-55bf-51d5-0434-071f9d95a366	8292	Zabukovje 
00050000-55bf-51d5-94d1-e2e6fb7ed3e3	1410	Zagorje ob Savi
00050000-55bf-51d5-3c13-61e8bc7ba790	1303	Zagradec
00050000-55bf-51d5-7e0e-120e60dedf06	2283	Zavrč
00050000-55bf-51d5-80bc-3f6a9565c825	8272	Zdole 
00050000-55bf-51d5-493b-1713dfeac3e2	4201	Zgornja Besnica
00050000-55bf-51d5-f1f3-00c4ff8b8569	2242	Zgornja Korena
00050000-55bf-51d5-9922-af0092877a84	2201	Zgornja Kungota
00050000-55bf-51d5-6277-64d58e72c4df	2316	Zgornja Ložnica
00050000-55bf-51d5-5d2d-5ccfefea422b	2314	Zgornja Polskava
00050000-55bf-51d5-80e7-3215f88c6d20	2213	Zgornja Velka
00050000-55bf-51d5-d9af-0b376b85acc3	4247	Zgornje Gorje
00050000-55bf-51d5-05b2-fc2e66db39dd	4206	Zgornje Jezersko
00050000-55bf-51d5-df8b-29b81df74b1b	2285	Zgornji Leskovec
00050000-55bf-51d5-4eeb-43dad6c7218d	1432	Zidani Most
00050000-55bf-51d5-d397-dbc9ae3e9e53	3214	Zreče
00050000-55bf-51d5-b20b-2fc5c2c83b13	4209	Žabnica
00050000-55bf-51d5-2349-a05373370250	3310	Žalec
00050000-55bf-51d5-0c70-d73aad6dc0f9	4228	Železniki
00050000-55bf-51d5-95b1-bbbf9f7733d6	2287	Žetale
00050000-55bf-51d5-6b29-cdc2d8a7ef5c	4226	Žiri
00050000-55bf-51d5-4c99-011eb17b7336	4274	Žirovnica
00050000-55bf-51d5-4356-58a4b496e98e	8360	Žužemberk
\.


--
-- TOC entry 2991 (class 0 OID 11518067)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 11517878)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 11517956)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11518079)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 11518382)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 11518392)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55bf-51d7-e906-eb69e927487d	00080000-55bf-51d7-a1f3-7dc00ddbd231	0900	AK
00190000-55bf-51d7-9e5f-408f129924c8	00080000-55bf-51d6-066d-cdd645930ad2	0987	AK
00190000-55bf-51d7-46fd-c5e9d68bb039	00080000-55bf-51d6-d6b4-2b4c03d20b49	0989	AK
00190000-55bf-51d7-5012-fa41a96d924b	00080000-55bf-51d6-7de6-d32e7660ce9c	0986	AK
00190000-55bf-51d7-3872-b03513c1fe34	00080000-55bf-51d6-8641-33a97d600622	0984	AK
00190000-55bf-51d7-6ff3-cd2cecb7950a	00080000-55bf-51d6-c5cc-003da509f32c	0983	AK
00190000-55bf-51d7-2c61-e8bbe0ec228f	00080000-55bf-51d6-ff7a-ea775925ac7b	0982	AK
\.


--
-- TOC entry 3015 (class 0 OID 11518363)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55bf-51d7-b7e8-ffe311a1325f	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2960 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 11518400)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 11518108)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55bf-51d6-2172-067786c8782b	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55bf-51d6-f558-cd72951e7e6a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55bf-51d6-b918-ea7a23f8c829	0003	Kazinska	t	84	Kazinska dvorana
00220000-55bf-51d6-c9d3-89ce5e95fce0	0004	Mali oder	t	24	Mali oder 
00220000-55bf-51d6-c3ad-3bd3d06016e0	0005	Komorni oder	t	15	Komorni oder
00220000-55bf-51d6-e22e-397ce932d3af	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55bf-51d6-80a1-d481e9e38039	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2989 (class 0 OID 11518052)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 11518042)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 11518227)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11518176)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 11517750)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2998 (class 0 OID 11518118)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 11517788)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55bf-51d5-0fe3-27c243f19f8f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55bf-51d5-1662-cfe60522d5e0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55bf-51d5-83e4-ea660094f3d5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55bf-51d5-e48d-3d917edcae9f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55bf-51d5-8fb5-91ebcf4c7f50	planer	Planer dogodkov v koledarju	t
00020000-55bf-51d5-c9a3-0d1d9841b129	kadrovska	Kadrovska služba	t
00020000-55bf-51d5-768f-b559d97ff433	arhivar	Ažuriranje arhivalij	t
00020000-55bf-51d5-ebec-5a27ed9488cf	igralec	Igralec	t
00020000-55bf-51d5-a094-371779ced2c1	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55bf-51d6-f9f9-3c3ddf754b5e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2964 (class 0 OID 11517772)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55bf-51d5-6c5d-705766b36d0a	00020000-55bf-51d5-83e4-ea660094f3d5
00010000-55bf-51d5-ae2c-21381754fdd1	00020000-55bf-51d5-83e4-ea660094f3d5
00010000-55bf-51d7-2434-0dc5141260cb	00020000-55bf-51d6-f9f9-3c3ddf754b5e
\.


--
-- TOC entry 3000 (class 0 OID 11518132)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 11518073)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 11518023)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 11518441)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55bf-51d6-182b-1bdbb0d5181b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55bf-51d6-c86f-e0cd7272fa86	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55bf-51d6-7cf1-05894659963a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55bf-51d6-0203-60a8a99def04	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55bf-51d6-dd96-b1d114322246	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3022 (class 0 OID 11518433)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55bf-51d6-e2bc-9e8b745ca08f	00230000-55bf-51d6-0203-60a8a99def04	popa
00240000-55bf-51d6-f802-bbf93be1a526	00230000-55bf-51d6-0203-60a8a99def04	oseba
00240000-55bf-51d6-9f4b-e8a9e9dbb62f	00230000-55bf-51d6-c86f-e0cd7272fa86	prostor
00240000-55bf-51d6-8d21-720d33e3db38	00230000-55bf-51d6-0203-60a8a99def04	besedilo
00240000-55bf-51d6-3b96-aa2f39351172	00230000-55bf-51d6-0203-60a8a99def04	uprizoritev
00240000-55bf-51d6-bfae-31e192574a66	00230000-55bf-51d6-0203-60a8a99def04	funkcija
00240000-55bf-51d6-d4ca-ec13fd6b112c	00230000-55bf-51d6-0203-60a8a99def04	tipfunkcije
00240000-55bf-51d6-3402-1520cd432c68	00230000-55bf-51d6-0203-60a8a99def04	alternacija
00240000-55bf-51d6-a5cc-0053cf4379e5	00230000-55bf-51d6-182b-1bdbb0d5181b	pogodba
00240000-55bf-51d6-bb40-2ae621582f78	00230000-55bf-51d6-0203-60a8a99def04	zaposlitev
00240000-55bf-51d6-ca0c-e8e3eb670ed9	00230000-55bf-51d6-182b-1bdbb0d5181b	programdela
00240000-55bf-51d6-3798-92ec4c67f55e	00230000-55bf-51d6-0203-60a8a99def04	zapis
\.


--
-- TOC entry 3021 (class 0 OID 11518428)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 11518186)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55bf-51d7-8558-00ed94e96171	000e0000-55bf-51d7-bed9-1a75456a88c7	00080000-55bf-51d6-3687-73a475161842	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55bf-51d7-bc92-a0f9d8890ed5	000e0000-55bf-51d7-bed9-1a75456a88c7	00080000-55bf-51d6-3687-73a475161842	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55bf-51d7-dc40-488a3447fd48	000e0000-55bf-51d7-bed9-1a75456a88c7	00080000-55bf-51d6-1cb4-fd23f130b350	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55bf-51d7-ef68-dfd5804c18e8	000e0000-55bf-51d7-bed9-1a75456a88c7	00080000-55bf-51d6-1cb4-fd23f130b350	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2971 (class 0 OID 11517850)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11518029)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55bf-51d7-7abf-4bd22be7eab0	00180000-55bf-51d7-8518-c775b520f6db	000c0000-55bf-51d7-15b4-279a307cd33c	00090000-55bf-51d7-6e1e-ee31cb3bf8ef	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-51d7-011b-90dcff7880db	00180000-55bf-51d7-8518-c775b520f6db	000c0000-55bf-51d7-2412-6a8e44f3f05a	00090000-55bf-51d7-c1a4-f8d65e03d3be	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-51d7-0295-8400388c5fb7	00180000-55bf-51d7-8518-c775b520f6db	000c0000-55bf-51d7-5ae1-04dc979f2379	00090000-55bf-51d7-ad8a-d93d377cc752	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-51d7-14cb-e4c977bfcdd8	00180000-55bf-51d7-8518-c775b520f6db	000c0000-55bf-51d7-2ce9-625c5dd3a6ba	00090000-55bf-51d7-fc4a-caa639b1f372	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-51d7-04d2-671d00ab760c	00180000-55bf-51d7-8518-c775b520f6db	000c0000-55bf-51d7-db5a-f449b58e22a6	00090000-55bf-51d7-9e96-8124bc8538c6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-51d7-ec13-692ce5ddc59b	00180000-55bf-51d7-855c-d21e859bfc41	\N	00090000-55bf-51d7-9e96-8124bc8538c6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3007 (class 0 OID 11518216)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55bf-51d6-8869-59fe88537415	Avtor	Avtorji	Avtorka	umetnik
000f0000-55bf-51d6-1f75-b23559480644	Priredba	Priredba	Priredba	umetnik
000f0000-55bf-51d6-fe19-51e0fb76fa26	Prevod	Prevod	Prevod	umetnik
000f0000-55bf-51d6-b600-645d3e145daf	Režija	Režija	Režija	umetnik
000f0000-55bf-51d6-61a8-c3c1e58438cc	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55bf-51d6-a4a0-ce85f2ed292b	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55bf-51d6-be6c-98c4b4f61cf4	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55bf-51d6-9d91-14f43f80a358	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55bf-51d6-50df-2cceb5d6c52a	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55bf-51d6-e6a7-fcddd91e17ae	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55bf-51d6-2337-89ac058b650c	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55bf-51d6-512e-215613ffb78a	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55bf-51d6-8ed2-c138eaff3d17	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55bf-51d6-368a-4ee299c2eae0	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55bf-51d6-c92a-f5d9465af12e	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55bf-51d6-3824-3c36237938f6	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55bf-51d6-d609-3e7da21ca13d	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55bf-51d6-1e0c-5c998a8acec3	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3019 (class 0 OID 11518410)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55bf-51d6-f5cc-144c7f746b6f	01	Velika predstava	f	1.00	1.00
002b0000-55bf-51d6-6b91-d09d6591f322	02	Mala predstava	f	0.50	0.50
002b0000-55bf-51d6-31e3-3c43a35f379d	03	Mala koprodukcija	t	0.40	1.00
002b0000-55bf-51d6-98b1-48c8be7c2438	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55bf-51d6-4ad5-67b471cc5508	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2976 (class 0 OID 11517913)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 11517759)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55bf-51d5-ae2c-21381754fdd1	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROuQzOGPLPehBOY03waC4qKW5f5/Z8lW.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55bf-51d6-1b7d-6731ba863b04	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55bf-51d6-675e-1b94acaa423e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55bf-51d6-d0d7-472c26b1635b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55bf-51d6-bf05-6711de3e713b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55bf-51d6-e572-a1fa5161fac8	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55bf-51d7-fb06-add883b8a899	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55bf-51d7-43c5-c12bdd8b1a92	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55bf-51d7-84e9-6370989c5cf2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55bf-51d7-2719-b908efa09bc7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55bf-51d7-2434-0dc5141260cb	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55bf-51d5-6c5d-705766b36d0a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3011 (class 0 OID 11518264)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55bf-51d7-bdb3-d766d9d3ad20	00160000-55bf-51d6-54eb-8641a5af6563	00150000-55bf-51d6-05c5-9ea2a552ca1a	00140000-55bf-51d5-0f83-6ac3f8a92d43	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55bf-51d6-c3ad-3bd3d06016e0
000e0000-55bf-51d7-bed9-1a75456a88c7	00160000-55bf-51d6-4889-653f9549b49f	00150000-55bf-51d6-f93c-6fb8d754f4c6	00140000-55bf-51d5-3e3b-2ff770242416	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55bf-51d6-e22e-397ce932d3af
000e0000-55bf-51d7-70a6-212f5b5e7a39	\N	00150000-55bf-51d6-f93c-6fb8d754f4c6	00140000-55bf-51d5-3e3b-2ff770242416	00190000-55bf-51d7-9e5f-408f129924c8	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55bf-51d6-c3ad-3bd3d06016e0
000e0000-55bf-51d7-9b8d-948e7b00ce9b	\N	00150000-55bf-51d6-f93c-6fb8d754f4c6	00140000-55bf-51d5-3e3b-2ff770242416	00190000-55bf-51d7-9e5f-408f129924c8	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55bf-51d6-c3ad-3bd3d06016e0
000e0000-55bf-51d7-57ee-672d3a9b1033	\N	00150000-55bf-51d6-f93c-6fb8d754f4c6	00140000-55bf-51d5-3e3b-2ff770242416	00190000-55bf-51d7-9e5f-408f129924c8	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55bf-51d6-2172-067786c8782b
\.


--
-- TOC entry 2981 (class 0 OID 11517975)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55bf-51d7-65cd-bd44ddfbc423	000e0000-55bf-51d7-bed9-1a75456a88c7	1	
00200000-55bf-51d7-78e0-4bfe6a7563c7	000e0000-55bf-51d7-bed9-1a75456a88c7	2	
\.


--
-- TOC entry 2996 (class 0 OID 11518100)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 11518480)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 11518452)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11518492)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 11518169)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55bf-51d7-623e-a45b3e4996ff	00090000-55bf-51d7-c1a4-f8d65e03d3be	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-51d7-af1c-d463b00ef4cb	00090000-55bf-51d7-ad8a-d93d377cc752	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-51d7-3183-f0df99b00d35	00090000-55bf-51d7-5693-e60389b2a2cc	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-51d7-dec8-a2f9d73d52ac	00090000-55bf-51d7-895c-6f4e0d73c081	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-51d7-69bc-c91fc6e96242	00090000-55bf-51d7-6e1e-ee31cb3bf8ef	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-51d7-ce9b-9302ca41a706	00090000-55bf-51d7-3ff4-93d1f6f3a7ec	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2983 (class 0 OID 11518007)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 11518254)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55bf-51d5-0f83-6ac3f8a92d43	01	Drama	drama (SURS 01)
00140000-55bf-51d5-7524-d8ff26059030	02	Opera	opera (SURS 02)
00140000-55bf-51d5-00a4-b7336afa548e	03	Balet	balet (SURS 03)
00140000-55bf-51d5-d376-e48e4710a6f3	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55bf-51d5-37b0-fb85003be6e1	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55bf-51d5-3e3b-2ff770242416	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55bf-51d5-456b-3b857662a11b	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3002 (class 0 OID 11518159)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55bf-51d6-7bec-1b20f0ce70c7	01	Opera	opera
00150000-55bf-51d6-d402-672a3fbdb5a6	02	Opereta	opereta
00150000-55bf-51d6-c4cd-ba12fc5206ed	03	Balet	balet
00150000-55bf-51d6-0986-ec6eab55c8f9	04	Plesne prireditve	plesne prireditve
00150000-55bf-51d6-097f-9ae939742a45	05	Lutkovno gledališče	lutkovno gledališče
00150000-55bf-51d6-0ba0-d9bba11b255e	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55bf-51d6-f575-e1fb7c990417	07	Biografska drama	biografska drama
00150000-55bf-51d6-05c5-9ea2a552ca1a	08	Komedija	komedija
00150000-55bf-51d6-74b4-75c465b17d73	09	Črna komedija	črna komedija
00150000-55bf-51d6-bbe4-088a5e031cd5	10	E-igra	E-igra
00150000-55bf-51d6-f93c-6fb8d754f4c6	11	Kriminalka	kriminalka
00150000-55bf-51d6-ec56-1941510724d5	12	Musical	musical
\.


--
-- TOC entry 2508 (class 2606 OID 11517813)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 11518311)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 11518301)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 11518215)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 11518533)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 11517997)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 11518022)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 11518426)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 11517939)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 11518357)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 11518155)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 11517973)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 11518016)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 11517953)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 11518065)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 11518509)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 11518516)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2748 (class 2606 OID 11518541)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 11518092)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 11517911)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 11517822)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2515 (class 2606 OID 11517846)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 11517802)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2499 (class 2606 OID 11517787)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 11518098)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 11518131)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 11518249)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 11517875)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 11517899)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 11518071)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 11517889)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 11517960)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 11518083)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 11518389)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 11518397)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 11518380)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 11518408)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 11518115)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 11518056)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 11518047)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 11518237)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 11518183)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 11517758)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 11518122)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 11517776)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2501 (class 2606 OID 11517796)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 11518140)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 11518078)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 11518028)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 11518450)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 11518438)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 11518432)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 11518196)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 11517855)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 11518038)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 11518226)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 11518420)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 11517924)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 11517771)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 11518280)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 11517982)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 11518106)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 11518490)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 11518474)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 11518498)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 11518174)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 11518011)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 11518262)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 11518167)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 1259 OID 11518004)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2648 (class 1259 OID 11518197)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 11518198)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 11518511)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2735 (class 1259 OID 11518510)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2522 (class 1259 OID 11517877)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2469 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2471 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 11518099)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2721 (class 1259 OID 11518478)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2722 (class 1259 OID 11518477)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2723 (class 1259 OID 11518479)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2724 (class 1259 OID 11518476)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2725 (class 1259 OID 11518475)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2607 (class 1259 OID 11518085)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2608 (class 1259 OID 11518084)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2559 (class 1259 OID 11517983)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 11518156)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 11518158)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2637 (class 1259 OID 11518157)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2547 (class 1259 OID 11517955)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 11517954)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2704 (class 1259 OID 11518409)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2658 (class 1259 OID 11518251)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 11518252)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2660 (class 1259 OID 11518253)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2731 (class 1259 OID 11518499)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2483 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2484 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2667 (class 1259 OID 11518285)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2668 (class 1259 OID 11518282)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2669 (class 1259 OID 11518286)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2670 (class 1259 OID 11518284)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2671 (class 1259 OID 11518283)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2537 (class 1259 OID 11517926)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2538 (class 1259 OID 11517925)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2474 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2513 (class 1259 OID 11517849)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2623 (class 1259 OID 11518123)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2577 (class 1259 OID 11518017)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2503 (class 1259 OID 11517803)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2504 (class 1259 OID 11517804)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2628 (class 1259 OID 11518143)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2629 (class 1259 OID 11518142)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2630 (class 1259 OID 11518141)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 11517961)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 11517963)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2553 (class 1259 OID 11517962)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2714 (class 1259 OID 11518440)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2587 (class 1259 OID 11518051)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2588 (class 1259 OID 11518049)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2589 (class 1259 OID 11518048)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2590 (class 1259 OID 11518050)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 11517777)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2495 (class 1259 OID 11517778)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 11518107)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2744 (class 1259 OID 11518534)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2745 (class 1259 OID 11518542)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2746 (class 1259 OID 11518543)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2602 (class 1259 OID 11518072)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2644 (class 1259 OID 11518184)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2645 (class 1259 OID 11518185)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2688 (class 1259 OID 11518362)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2689 (class 1259 OID 11518361)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2690 (class 1259 OID 11518358)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2691 (class 1259 OID 11518359)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2692 (class 1259 OID 11518360)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2526 (class 1259 OID 11517891)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 11517890)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2528 (class 1259 OID 11517892)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2487 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2696 (class 1259 OID 11518390)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2697 (class 1259 OID 11518391)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2681 (class 1259 OID 11518315)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2682 (class 1259 OID 11518316)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2683 (class 1259 OID 11518313)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2684 (class 1259 OID 11518314)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2641 (class 1259 OID 11518175)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2593 (class 1259 OID 11518060)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2594 (class 1259 OID 11518059)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2595 (class 1259 OID 11518057)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2596 (class 1259 OID 11518058)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2465 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2677 (class 1259 OID 11518303)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2678 (class 1259 OID 11518302)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2693 (class 1259 OID 11518381)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2558 (class 1259 OID 11517974)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2711 (class 1259 OID 11518427)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2738 (class 1259 OID 11518517)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2739 (class 1259 OID 11518518)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2509 (class 1259 OID 11517824)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2510 (class 1259 OID 11517823)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2518 (class 1259 OID 11517856)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2519 (class 1259 OID 11517857)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2582 (class 1259 OID 11518041)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2583 (class 1259 OID 11518040)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2584 (class 1259 OID 11518039)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2478 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2479 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2480 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2565 (class 1259 OID 11518006)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2566 (class 1259 OID 11518002)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2567 (class 1259 OID 11517999)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2568 (class 1259 OID 11518000)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2569 (class 1259 OID 11517998)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2570 (class 1259 OID 11518003)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2571 (class 1259 OID 11518001)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2525 (class 1259 OID 11517876)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 11517940)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 11517942)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2545 (class 1259 OID 11517941)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2546 (class 1259 OID 11517943)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2601 (class 1259 OID 11518066)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2663 (class 1259 OID 11518250)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 11518281)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2516 (class 1259 OID 11517847)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2517 (class 1259 OID 11517848)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2638 (class 1259 OID 11518168)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 11518451)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 11517912)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2717 (class 1259 OID 11518439)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2621 (class 1259 OID 11518117)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2622 (class 1259 OID 11518116)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2685 (class 1259 OID 11518312)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2468 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 11517900)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2664 (class 1259 OID 11518263)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2728 (class 1259 OID 11518491)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2702 (class 1259 OID 11518398)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 11518399)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2502 (class 1259 OID 11517797)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2572 (class 1259 OID 11518005)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2774 (class 2606 OID 11518679)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2777 (class 2606 OID 11518664)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2776 (class 2606 OID 11518669)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2772 (class 2606 OID 11518689)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2778 (class 2606 OID 11518659)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2773 (class 2606 OID 11518684)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2775 (class 2606 OID 11518674)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2808 (class 2606 OID 11518834)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2807 (class 2606 OID 11518839)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 11519009)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2842 (class 2606 OID 11519004)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2759 (class 2606 OID 11518594)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2795 (class 2606 OID 11518774)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2836 (class 2606 OID 11518989)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2837 (class 2606 OID 11518984)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2835 (class 2606 OID 11518994)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2838 (class 2606 OID 11518979)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2839 (class 2606 OID 11518974)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2793 (class 2606 OID 11518769)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2794 (class 2606 OID 11518764)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2771 (class 2606 OID 11518654)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 11518804)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2801 (class 2606 OID 11518814)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2802 (class 2606 OID 11518809)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2765 (class 2606 OID 11518629)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 11518624)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2791 (class 2606 OID 11518754)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2832 (class 2606 OID 11518959)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2811 (class 2606 OID 11518844)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2810 (class 2606 OID 11518849)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 11518854)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2840 (class 2606 OID 11518999)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2813 (class 2606 OID 11518874)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2816 (class 2606 OID 11518859)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2812 (class 2606 OID 11518879)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2814 (class 2606 OID 11518869)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2815 (class 2606 OID 11518864)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2763 (class 2606 OID 11518619)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2764 (class 2606 OID 11518614)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2755 (class 2606 OID 11518579)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2756 (class 2606 OID 11518574)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2797 (class 2606 OID 11518784)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2779 (class 2606 OID 11518694)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 11518554)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2751 (class 2606 OID 11518559)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2798 (class 2606 OID 11518799)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2799 (class 2606 OID 11518794)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2800 (class 2606 OID 11518789)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2769 (class 2606 OID 11518634)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2767 (class 2606 OID 11518644)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2768 (class 2606 OID 11518639)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2834 (class 2606 OID 11518969)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2783 (class 2606 OID 11518729)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2785 (class 2606 OID 11518719)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2786 (class 2606 OID 11518714)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2784 (class 2606 OID 11518724)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2750 (class 2606 OID 11518544)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2749 (class 2606 OID 11518549)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2796 (class 2606 OID 11518779)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2845 (class 2606 OID 11519024)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2847 (class 2606 OID 11519029)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2846 (class 2606 OID 11519034)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2792 (class 2606 OID 11518759)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2806 (class 2606 OID 11518824)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2805 (class 2606 OID 11518829)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2823 (class 2606 OID 11518934)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2824 (class 2606 OID 11518929)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2827 (class 2606 OID 11518914)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2826 (class 2606 OID 11518919)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2825 (class 2606 OID 11518924)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2761 (class 2606 OID 11518604)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2762 (class 2606 OID 11518599)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 11518609)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2830 (class 2606 OID 11518944)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2829 (class 2606 OID 11518949)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2820 (class 2606 OID 11518904)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2819 (class 2606 OID 11518909)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2822 (class 2606 OID 11518894)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2821 (class 2606 OID 11518899)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2804 (class 2606 OID 11518819)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 11518749)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2788 (class 2606 OID 11518744)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2790 (class 2606 OID 11518734)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2789 (class 2606 OID 11518739)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2817 (class 2606 OID 11518889)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2818 (class 2606 OID 11518884)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2828 (class 2606 OID 11518939)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2770 (class 2606 OID 11518649)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 11518954)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 11518964)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2844 (class 2606 OID 11519014)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2843 (class 2606 OID 11519019)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2753 (class 2606 OID 11518569)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2754 (class 2606 OID 11518564)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2758 (class 2606 OID 11518584)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 11518589)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 11518709)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2781 (class 2606 OID 11518704)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2782 (class 2606 OID 11518699)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-03 13:34:48 CEST

--
-- PostgreSQL database dump complete
--

