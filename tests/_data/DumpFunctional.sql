--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-03 12:27:13 CEST

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
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 11484934)
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
-- TOC entry 228 (class 1259 OID 11485433)
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
-- TOC entry 227 (class 1259 OID 11485416)
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
-- TOC entry 221 (class 1259 OID 11485328)
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
-- TOC entry 244 (class 1259 OID 11485647)
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
-- TOC entry 197 (class 1259 OID 11485113)
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
-- TOC entry 200 (class 1259 OID 11485147)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11485549)
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
-- TOC entry 192 (class 1259 OID 11485056)
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
-- TOC entry 229 (class 1259 OID 11485446)
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
-- TOC entry 216 (class 1259 OID 11485273)
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
-- TOC entry 195 (class 1259 OID 11485093)
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
-- TOC entry 199 (class 1259 OID 11485141)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11485073)
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
-- TOC entry 205 (class 1259 OID 11485190)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11485628)
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
-- TOC entry 243 (class 1259 OID 11485640)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11485663)
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
-- TOC entry 209 (class 1259 OID 11485215)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11485030)
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
-- TOC entry 184 (class 1259 OID 11484943)
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
-- TOC entry 185 (class 1259 OID 11484954)
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
-- TOC entry 180 (class 1259 OID 11484908)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11484927)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11485222)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11485253)
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
-- TOC entry 224 (class 1259 OID 11485367)
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
-- TOC entry 187 (class 1259 OID 11484987)
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
-- TOC entry 189 (class 1259 OID 11485022)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11485196)
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
-- TOC entry 188 (class 1259 OID 11485007)
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
-- TOC entry 194 (class 1259 OID 11485085)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11485208)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11485510)
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
-- TOC entry 232 (class 1259 OID 11485520)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11485491)
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
-- TOC entry 233 (class 1259 OID 11485528)
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
-- TOC entry 212 (class 1259 OID 11485237)
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
-- TOC entry 204 (class 1259 OID 11485181)
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
-- TOC entry 203 (class 1259 OID 11485171)
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
-- TOC entry 223 (class 1259 OID 11485356)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11485305)
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
-- TOC entry 177 (class 1259 OID 11484879)
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
-- TOC entry 176 (class 1259 OID 11484877)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 11485247)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11484917)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11484901)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11485261)
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
-- TOC entry 207 (class 1259 OID 11485202)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11485152)
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
-- TOC entry 238 (class 1259 OID 11485569)
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
-- TOC entry 237 (class 1259 OID 11485561)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11485556)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11485315)
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
-- TOC entry 186 (class 1259 OID 11484979)
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
-- TOC entry 202 (class 1259 OID 11485158)
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
-- TOC entry 222 (class 1259 OID 11485345)
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
-- TOC entry 234 (class 1259 OID 11485538)
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
-- TOC entry 191 (class 1259 OID 11485042)
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
-- TOC entry 178 (class 1259 OID 11484888)
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
-- TOC entry 226 (class 1259 OID 11485393)
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
-- TOC entry 196 (class 1259 OID 11485104)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11485229)
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
-- TOC entry 240 (class 1259 OID 11485608)
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
-- TOC entry 239 (class 1259 OID 11485580)
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
-- TOC entry 241 (class 1259 OID 11485620)
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
-- TOC entry 218 (class 1259 OID 11485298)
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
-- TOC entry 198 (class 1259 OID 11485136)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11485383)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11485288)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2245 (class 2604 OID 11484882)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2967 (class 0 OID 11484934)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 11485433)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55bf-4200-94e2-99d5c35ed748	000d0000-55bf-4200-a9de-acd3942e8942	\N	00090000-55bf-4200-0c3c-159982437e1c	000b0000-55bf-4200-5553-f734c0b97833	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55bf-4200-9d9b-b0302d29de51	000d0000-55bf-4200-072e-1f0854f75895	00100000-55bf-4200-de04-e75c61afe338	00090000-55bf-4200-249a-c837376c00f0	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55bf-4200-efc5-89efc97fc2f8	000d0000-55bf-4200-9c32-0bf714e208c9	00100000-55bf-4200-5388-d6f641c24007	00090000-55bf-4200-3f51-dc39f325c671	\N	0003	t	\N	2015-08-03	\N	2	\N	\N	f	f
000c0000-55bf-4200-c7d7-0f8a0883a14e	000d0000-55bf-4200-2248-64fda0b536e9	\N	00090000-55bf-4200-51ab-313dd768f847	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55bf-4200-cbb7-281ce16d1253	000d0000-55bf-4200-9d8f-c39f22e84168	\N	00090000-55bf-4200-772e-cd3c83e02168	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55bf-4200-9320-00963a018c24	000d0000-55bf-4200-c2ec-6206d9818ead	\N	00090000-55bf-4200-87d9-d8aedb98773e	000b0000-55bf-4200-3b02-ecdb93571ad2	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55bf-4200-f1d0-640e47a316be	000d0000-55bf-4200-389e-80d96a035759	00100000-55bf-4200-38e1-436663a3e2bc	00090000-55bf-4200-81ab-53b60dd2500e	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55bf-4200-8761-bf40243dd4cd	000d0000-55bf-4200-df5e-ac08b30fa19a	\N	00090000-55bf-4200-ec03-2a3e3d554b5b	000b0000-55bf-4200-5398-63d036181201	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55bf-4200-766a-b0b416870b84	000d0000-55bf-4200-389e-80d96a035759	00100000-55bf-4200-f11f-2a16bbecb1bf	00090000-55bf-4200-628f-8516c3cd7a43	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55bf-4200-0da2-b7ebb6b27657	000d0000-55bf-4200-389e-80d96a035759	00100000-55bf-4200-6123-056b268817ac	00090000-55bf-4200-a08f-0b789fa481d5	\N	0010	t	\N	2015-08-03	\N	16	\N	\N	f	t
000c0000-55bf-4200-ede8-20b417c520c8	000d0000-55bf-4200-389e-80d96a035759	00100000-55bf-4200-9141-6c0bde79be49	00090000-55bf-4200-68cb-207fffd9e49f	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3011 (class 0 OID 11485416)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 11485328)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55bf-4200-4101-79a15d3fe912	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55bf-4200-459f-2e8a15bf8b4d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55bf-4200-3183-12f2dc55766a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 11485647)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 11485113)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55bf-4200-76e7-c28f4b4056cc	\N	\N	00200000-55bf-4200-feed-280ed234c853	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55bf-4200-4bf6-1b3931fca778	\N	\N	00200000-55bf-4200-e075-4c85c0811b10	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55bf-4200-18ad-a86e846d5e5f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55bf-4200-bf33-fbe2f1bfbfd4	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55bf-4200-7cd5-670c73d7e8f0	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2984 (class 0 OID 11485147)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 11485549)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 11485056)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55bf-41fe-c484-c85d434ce623	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55bf-41fe-1a39-696d98c4c4dc	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55bf-41fe-dd84-05e80246f0ad	AL	ALB	008	Albania 	Albanija	\N
00040000-55bf-41fe-6980-4555fda3f182	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55bf-41fe-a4c1-60f016075e91	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55bf-41fe-20a1-5092c797a763	AD	AND	020	Andorra 	Andora	\N
00040000-55bf-41fe-f788-70398589b395	AO	AGO	024	Angola 	Angola	\N
00040000-55bf-41fe-9d4b-ed25ca6467a5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55bf-41fe-131b-65385c7ef8c0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55bf-41fe-8924-8ca7178b04ac	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-41fe-778a-8805c248c950	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55bf-41fe-68fd-2db6ad9888c7	AM	ARM	051	Armenia 	Armenija	\N
00040000-55bf-41fe-11ed-a0359ab66a2f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55bf-41fe-6f73-de53c59d7e6a	AU	AUS	036	Australia 	Avstralija	\N
00040000-55bf-41fe-815e-cb6b76fdff26	AT	AUT	040	Austria 	Avstrija	\N
00040000-55bf-41fe-4fa9-f48be103fc3d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55bf-41fe-0d29-01f4a0a1423b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55bf-41fe-85e8-e7beb18364a1	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55bf-41fe-ab3c-1825162d80f8	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55bf-41fe-8ff2-8e8117e54363	BB	BRB	052	Barbados 	Barbados	\N
00040000-55bf-41fe-2c35-6533febc54a6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55bf-41fe-32b5-e1469cd5368c	BE	BEL	056	Belgium 	Belgija	\N
00040000-55bf-41fe-c92b-747830325854	BZ	BLZ	084	Belize 	Belize	\N
00040000-55bf-41fe-7d5f-6463146e2e7d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55bf-41fe-4063-e7a67f766bc1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55bf-41fe-8fec-906463fdcddd	BT	BTN	064	Bhutan 	Butan	\N
00040000-55bf-41fe-c675-c16da6d9c5df	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55bf-41fe-46e5-97b4b83b9ba1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55bf-41fe-e2f5-c279dd1d0691	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55bf-41fe-c23e-b0b669272989	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55bf-41fe-fef3-a99071e5ccaf	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55bf-41fe-330b-c2ef18f1637b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55bf-41fe-a0a3-17dac873218e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55bf-41fe-3f20-7821ebaa22ea	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55bf-41fe-4c60-363400dd422c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55bf-41fe-770d-aaec667cd87b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55bf-41fe-9f1c-a5f84408f962	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55bf-41fe-af32-5f020165489c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55bf-41fe-60be-9e78f160c7c4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55bf-41fe-f0fd-04a5d5874ea8	CA	CAN	124	Canada 	Kanada	\N
00040000-55bf-41fe-497e-8ad3a8cdab86	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55bf-41fe-a8ff-d11436845c9a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55bf-41fe-51d8-542f02d33b3d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55bf-41fe-18a7-7fb0723abf4b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55bf-41fe-a084-7839990909f8	CL	CHL	152	Chile 	Čile	\N
00040000-55bf-41fe-bda6-a15294fcd9df	CN	CHN	156	China 	Kitajska	\N
00040000-55bf-41fe-a3df-0358000773dc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55bf-41fe-3932-de3989d38661	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55bf-41fe-cad5-cf2f1fa0db81	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55bf-41fe-bdc9-352c68282c9f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55bf-41fe-e820-8a2560b7f9cb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55bf-41fe-2433-72a50f36bf6b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55bf-41fe-de2a-aa2d4fcb85cd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55bf-41fe-43c0-0d02cc30f5b6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55bf-41fe-acf4-880674fff21f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55bf-41fe-a550-46b432c4601d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55bf-41fe-4166-aefefe9540cf	CU	CUB	192	Cuba 	Kuba	\N
00040000-55bf-41fe-ff91-198a5e8d7dc3	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55bf-41fe-c8a4-f75feefa94e7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55bf-41fe-6f42-329c1101561a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55bf-41fe-ab22-9a7efe63d885	DK	DNK	208	Denmark 	Danska	\N
00040000-55bf-41fe-6679-edb0b502ed26	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55bf-41fe-65cd-fb1b918f3d61	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-41fe-5a4b-c2b3c36fa0c0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55bf-41fe-0a69-9a9731a20a35	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55bf-41fe-df26-d55453c8c797	EG	EGY	818	Egypt 	Egipt	\N
00040000-55bf-41fe-ed65-5dd7fd1c6a76	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55bf-41fe-3fb3-79ea9d456dd8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55bf-41fe-a391-cacfe1c8ef6a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55bf-41fe-0d46-a07b25182c31	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55bf-41fe-6189-0e689df58383	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55bf-41fe-7f01-3128a1ea0d52	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55bf-41fe-2592-dd6afaf0b2d8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55bf-41fe-2d21-fad59045a9db	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55bf-41fe-1170-3305067abb34	FI	FIN	246	Finland 	Finska	\N
00040000-55bf-41fe-12c9-65127a1bb653	FR	FRA	250	France 	Francija	\N
00040000-55bf-41fe-9aab-eed9c6939592	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55bf-41fe-88b5-437f3c96236a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55bf-41fe-7183-a0b53122ef47	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55bf-41fe-9300-0d8f009f8965	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55bf-41fe-4696-df7cc315150f	GA	GAB	266	Gabon 	Gabon	\N
00040000-55bf-41fe-57fb-ea66f3eb486a	GM	GMB	270	Gambia 	Gambija	\N
00040000-55bf-41fe-acb0-50edaa022f5d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55bf-41fe-2b20-bff432c77a73	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55bf-41fe-c242-b371dfa56549	GH	GHA	288	Ghana 	Gana	\N
00040000-55bf-41fe-3dba-25ae9ae79f6d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55bf-41fe-86e5-09b1c2ce817b	GR	GRC	300	Greece 	Grčija	\N
00040000-55bf-41fe-ba59-f9f63410fe02	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55bf-41fe-90aa-7bfe85dfb615	GD	GRD	308	Grenada 	Grenada	\N
00040000-55bf-41fe-3761-e914fa2d05ef	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55bf-41fe-0c06-6d7ec093a9eb	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55bf-41fe-2b07-6e3a65cf8eae	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55bf-41fe-cdb3-1ab2a1248437	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55bf-41fe-e6d4-3c3da6ca7176	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55bf-41fe-a5d3-adce57958103	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55bf-41fe-5338-f21c317dfb72	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55bf-41fe-7638-763cfd677185	HT	HTI	332	Haiti 	Haiti	\N
00040000-55bf-41fe-f8cd-1c0292642e8f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55bf-41fe-3f18-01dffffbe630	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55bf-41fe-e7ad-ecdde0cd0bcd	HN	HND	340	Honduras 	Honduras	\N
00040000-55bf-41fe-cc6c-593c9ae7548e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55bf-41fe-3477-e100af5c2593	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55bf-41fe-90cf-8502a35621de	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55bf-41fe-37c1-a0c6f2791d97	IN	IND	356	India 	Indija	\N
00040000-55bf-41fe-3acd-b09dda2d6cad	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55bf-41fe-58e4-165d4dec55e7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55bf-41fe-ff2c-1b0cd90491b1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55bf-41fe-60ef-43faeb1c5fb7	IE	IRL	372	Ireland 	Irska	\N
00040000-55bf-41fe-c373-5f4c39588c50	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55bf-41fe-769d-ee58680d9da9	IL	ISR	376	Israel 	Izrael	\N
00040000-55bf-41fe-2bd3-1818dafcbf5d	IT	ITA	380	Italy 	Italija	\N
00040000-55bf-41fe-aa00-f64fa8433fd4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55bf-41fe-076f-89ac852f45a4	JP	JPN	392	Japan 	Japonska	\N
00040000-55bf-41fe-b3fa-4f1bc9ae403e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55bf-41fe-a157-505a8b217d67	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55bf-41fe-3224-138f740eb205	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55bf-41fe-72ad-6b88ec028491	KE	KEN	404	Kenya 	Kenija	\N
00040000-55bf-41fe-6984-e9c2e70d278b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55bf-41fe-18f4-c0b5bd4ec43d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55bf-41fe-53b6-692e9b98cca7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55bf-41fe-194a-734bb94b4dd2	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55bf-41fe-2e71-e58ecdeeaa6e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55bf-41fe-9327-1295e65d2976	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55bf-41fe-dcf7-bf423fd623c2	LV	LVA	428	Latvia 	Latvija	\N
00040000-55bf-41fe-2b07-f2fb7e97bab9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55bf-41fe-dce3-d7e7f78fac2f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55bf-41fe-904a-06d2ad1fbbea	LR	LBR	430	Liberia 	Liberija	\N
00040000-55bf-41fe-3faa-cc6e14624d7a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55bf-41fe-da55-a2737cd5caaa	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55bf-41fe-f629-9e10c935d6d4	LT	LTU	440	Lithuania 	Litva	\N
00040000-55bf-41fe-e520-bbac87df2789	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55bf-41fe-3ea0-7f561499d923	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55bf-41fe-ff58-af0ebd9c536f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55bf-41fe-357b-b639ea337ecf	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55bf-41fe-d1d4-4aa76b044af7	MW	MWI	454	Malawi 	Malavi	\N
00040000-55bf-41fe-8356-6ebc8c11ab6d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55bf-41fe-9af4-825b6c8540a4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55bf-41fe-9cde-312bee6caca2	ML	MLI	466	Mali 	Mali	\N
00040000-55bf-41fe-c51a-5c0a64a0f936	MT	MLT	470	Malta 	Malta	\N
00040000-55bf-41fe-7bd6-77a39b4879da	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55bf-41fe-267b-1c6ee1fe9bbe	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55bf-41fe-d553-a5de7534ea4a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55bf-41fe-e77b-f9aa3d01d93a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55bf-41fe-d55f-2f4b053d860a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55bf-41fe-00c8-cd525af55778	MX	MEX	484	Mexico 	Mehika	\N
00040000-55bf-41fe-ccd7-c1b4529d3d9e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55bf-41fe-d6ec-4bfc142771f2	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55bf-41fe-b5fa-aca828a76fb8	MC	MCO	492	Monaco 	Monako	\N
00040000-55bf-41fe-493d-a303e6ce0569	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55bf-41fe-1484-c750d0daff7d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55bf-41fe-eb6b-c7e370a664a9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55bf-41fe-acac-61e2a6e3f971	MA	MAR	504	Morocco 	Maroko	\N
00040000-55bf-41fe-8beb-3ee12db40adf	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55bf-41fe-3547-d36b5b05ae2f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55bf-41fe-df52-4a116c7287c6	NA	NAM	516	Namibia 	Namibija	\N
00040000-55bf-41fe-5e1a-ec5dac01d51a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55bf-41fe-3035-413f06197e52	NP	NPL	524	Nepal 	Nepal	\N
00040000-55bf-41fe-78a8-2bb95e636916	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55bf-41fe-394f-022aa235b487	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55bf-41fe-2a57-0c3e672cfbb1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55bf-41fe-6a79-5dacb3db098c	NE	NER	562	Niger 	Niger 	\N
00040000-55bf-41fe-a107-3180ca49a2b9	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55bf-41fe-6000-da599193ff02	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55bf-41fe-ffc6-09af1e5badf1	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55bf-41fe-f39d-43d9994863ff	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55bf-41fe-bf06-8e06c76913c6	NO	NOR	578	Norway 	Norveška	\N
00040000-55bf-41fe-7c1a-b9185a6cdbd3	OM	OMN	512	Oman 	Oman	\N
00040000-55bf-41fe-61b2-0ce65e4dedde	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55bf-41fe-5356-e2dd4c304184	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55bf-41fe-745b-7cf05eb320e3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55bf-41fe-8092-449e8b094e7d	PA	PAN	591	Panama 	Panama	\N
00040000-55bf-41fe-cf85-eb2e186868ae	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55bf-41fe-ea1f-fc9ca4723853	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55bf-41fe-43d5-6d6f0f87a0f0	PE	PER	604	Peru 	Peru	\N
00040000-55bf-41fe-ac8d-14e6c8436f48	PH	PHL	608	Philippines 	Filipini	\N
00040000-55bf-41fe-5cad-cb97e43a1059	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55bf-41fe-6c0b-6b3c9ca28d66	PL	POL	616	Poland 	Poljska	\N
00040000-55bf-41fe-bf09-62a80a92c9dc	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55bf-41fe-3e7a-1be1b54e40c8	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55bf-41fe-d1d0-add4bccf861c	QA	QAT	634	Qatar 	Katar	\N
00040000-55bf-41fe-35a5-83459753724c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55bf-41fe-17fe-59747c56b2be	RO	ROU	642	Romania 	Romunija	\N
00040000-55bf-41fe-51fc-25ad0177e2a9	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55bf-41fe-e203-0af4675b4e91	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55bf-41fe-1ac7-5ba0b79b3507	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55bf-41fe-b239-c71f262c24a3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55bf-41fe-6842-a2412a6fdfcf	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55bf-41fe-b3b1-e69d1c486298	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55bf-41fe-074c-1a97b8304316	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55bf-41fe-7a84-3faa25aa28b1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55bf-41fe-e597-cc1bacb8e5ad	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55bf-41fe-e8de-9c587c11ea84	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55bf-41fe-2031-922cca72a12d	SM	SMR	674	San Marino 	San Marino	\N
00040000-55bf-41fe-78e3-5733e97456e9	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55bf-41fe-c541-81dcf3b65852	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55bf-41fe-6a6e-fe8858e32d93	SN	SEN	686	Senegal 	Senegal	\N
00040000-55bf-41fe-40a4-f083fc7e185b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55bf-41fe-1981-71b130688b98	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55bf-41fe-1ff7-11d3707dddb0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55bf-41fe-7b87-d0109a8bf5cc	SG	SGP	702	Singapore 	Singapur	\N
00040000-55bf-41fe-79ec-27f27bbe2bf0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55bf-41fe-a8a1-6e6802b9086f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55bf-41fe-3fde-c4aa40112f4e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55bf-41fe-47da-d4b4a4ad1bf8	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55bf-41fe-6de4-8bae1166f7c0	SO	SOM	706	Somalia 	Somalija	\N
00040000-55bf-41fe-f35c-3ecfb7f6132b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55bf-41fe-2996-3dd24e260acd	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55bf-41fe-0aa8-6feeea1ad962	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55bf-41fe-dee5-3fdd8f62a405	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55bf-41fe-4a49-bc1dab5d0e23	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55bf-41fe-17c1-341bc5f55c75	SD	SDN	729	Sudan 	Sudan	\N
00040000-55bf-41fe-90cf-4611ce8b56de	SR	SUR	740	Suriname 	Surinam	\N
00040000-55bf-41fe-df4a-7d62f0943929	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55bf-41fe-f228-2f647d2b8873	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55bf-41fe-0650-500d27b1834b	SE	SWE	752	Sweden 	Švedska	\N
00040000-55bf-41fe-3aac-4ea4e63bfb4b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55bf-41fe-c628-d674f4a670bd	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55bf-41fe-9ddf-5c2b042fd177	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55bf-41fe-bdcb-71ecda916272	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55bf-41fe-27c9-9fd8bc2f406c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55bf-41fe-8ed6-dfb6985b306e	TH	THA	764	Thailand 	Tajska	\N
00040000-55bf-41fe-b4a7-e1e7d81b8804	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55bf-41fe-15be-691a7b6e8e79	TG	TGO	768	Togo 	Togo	\N
00040000-55bf-41fe-5387-1579833df680	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55bf-41fe-0472-b8902c0bb890	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55bf-41fe-756c-206743f7e0f0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55bf-41fe-6bf7-36ec160c654f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55bf-41fe-6d4c-a3113f308679	TR	TUR	792	Turkey 	Turčija	\N
00040000-55bf-41fe-e5bf-5074f470f353	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55bf-41fe-a414-5a1edfc14670	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-41fe-8af5-34fc51f7bab7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55bf-41fe-275f-b776a1ac495b	UG	UGA	800	Uganda 	Uganda	\N
00040000-55bf-41fe-419f-1b85ccc8608d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55bf-41fe-a510-6e8b89fc1340	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55bf-41fe-4009-9064e1ad4777	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55bf-41fe-3b30-c359c1ad9076	US	USA	840	United States 	Združene države Amerike	\N
00040000-55bf-41fe-3e52-2d014b6020d9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55bf-41fe-1b15-b1a5f14d1e49	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55bf-41fe-03f3-e7b17428d633	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55bf-41fe-af5b-9b4211f5467c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55bf-41fe-ecb6-4e9c446c378e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55bf-41fe-f504-66295d24fb95	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55bf-41fe-60db-83b0b4fa63aa	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-41fe-aaf7-ce38daf92ae3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55bf-41fe-55d3-caf8de1204f4	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55bf-41fe-7884-78070fd9e7cd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55bf-41fe-f8c9-2a647adaf858	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55bf-41fe-83c8-db95d0630a06	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55bf-41fe-bdd9-815f8ac1bb9e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3013 (class 0 OID 11485446)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55bf-4200-cac1-68abc7fc77ce	000e0000-55bf-4200-7b9b-d15c040e98cf	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55bf-41ff-d471-c221f5583fae	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55bf-4200-7569-6adfdf5bef4e	000e0000-55bf-4200-7d90-e0cafeb80e20	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55bf-41ff-e756-bcdb2dfc7d07	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-4200-745d-167fbbac08f4	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-4200-e100-b356ec2c6b6e	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3000 (class 0 OID 11485273)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55bf-4200-389e-80d96a035759	000e0000-55bf-4200-7d90-e0cafeb80e20	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55bf-41ff-407c-41fb7add2d64
000d0000-55bf-4200-a9de-acd3942e8942	000e0000-55bf-4200-7d90-e0cafeb80e20	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-41ff-407c-41fb7add2d64
000d0000-55bf-4200-072e-1f0854f75895	000e0000-55bf-4200-7d90-e0cafeb80e20	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55bf-41ff-7b8b-43da0748cf69
000d0000-55bf-4200-9c32-0bf714e208c9	000e0000-55bf-4200-7d90-e0cafeb80e20	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55bf-41ff-fb43-abaeaa73d2cb
000d0000-55bf-4200-2248-64fda0b536e9	000e0000-55bf-4200-7d90-e0cafeb80e20	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55bf-41ff-a326-81cc3c206cf6
000d0000-55bf-4200-9d8f-c39f22e84168	000e0000-55bf-4200-7d90-e0cafeb80e20	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55bf-41ff-e288-6fe86a5cae5c
000d0000-55bf-4200-c2ec-6206d9818ead	000e0000-55bf-4200-7d90-e0cafeb80e20	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-41ff-407c-41fb7add2d64
000d0000-55bf-4200-df5e-ac08b30fa19a	000e0000-55bf-4200-7d90-e0cafeb80e20	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55bf-41ff-66aa-4e3e429feb74
\.


--
-- TOC entry 2979 (class 0 OID 11485093)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 11485141)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 11485073)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55bf-4200-46f8-41afa8e2aca7	00080000-55bf-4200-feaf-49b3327f9c08	00090000-55bf-4200-a08f-0b789fa481d5	AK		
\.


--
-- TOC entry 2954 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11485190)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11485628)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11485640)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11485663)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11485215)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 11485030)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55bf-41ff-a85f-6c59118e496d	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55bf-41ff-7f90-42fbd0c09f4b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55bf-41ff-ec2c-d10e87ef1370	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55bf-41ff-47e6-74876c799d9a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55bf-41ff-874d-0e44ace33a45	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55bf-41ff-100c-e576e10fbcb0	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55bf-41ff-5a78-196fbba78d54	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55bf-41ff-fadf-2dddaf9314e1	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-41ff-8d82-4a8515c2f8b9	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-41ff-89f3-23c9981bfbc4	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55bf-41ff-77c4-b3b5a17e2db0	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55bf-41ff-dbe3-64c585e4deee	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55bf-41ff-677e-71e44f05e5ea	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55bf-41ff-a3f6-9c1e4fea609c	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55bf-4200-06f0-8ab4fe5bd659	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55bf-4200-a047-07d060658e3f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55bf-4200-e2c6-0b6b57c79e42	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55bf-4200-c333-0191579826bc	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55bf-4200-ef40-1a903db0991e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55bf-4200-b67e-328b5d55544e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2968 (class 0 OID 11484943)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55bf-4200-e8de-9c91407f9718	00000000-55bf-4200-a047-07d060658e3f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55bf-4200-580c-cf048fb4727f	00000000-55bf-4200-a047-07d060658e3f	00010000-55bf-41ff-a911-1fe1fa72447b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55bf-4200-086d-217e932d225e	00000000-55bf-4200-e2c6-0b6b57c79e42	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2969 (class 0 OID 11484954)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55bf-4200-0c3c-159982437e1c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55bf-4200-51ab-313dd768f847	00010000-55bf-4200-2383-b6075396cee0	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55bf-4200-3f51-dc39f325c671	00010000-55bf-4200-b499-cddd39113076	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55bf-4200-628f-8516c3cd7a43	00010000-55bf-4200-767f-14f4071a46ae	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55bf-4200-13df-ac6202f1eec5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55bf-4200-87d9-d8aedb98773e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55bf-4200-68cb-207fffd9e49f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55bf-4200-81ab-53b60dd2500e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55bf-4200-a08f-0b789fa481d5	00010000-55bf-4200-0a37-029092691334	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55bf-4200-249a-c837376c00f0	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55bf-4200-d684-64953f63b4b1	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55bf-4200-772e-cd3c83e02168	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55bf-4200-ec03-2a3e3d554b5b	00010000-55bf-4200-37ea-01234fe8f170	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 11484908)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55bf-41fe-1f79-a5a5fb0277a2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55bf-41fe-d753-6464b8057f50	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55bf-41fe-9047-5c550bd9f36a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55bf-41fe-496b-8520daceda21	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55bf-41fe-a350-5043438335df	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55bf-41fe-5b66-7fc7058439be	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55bf-41fe-b906-6a525aea0079	Abonma-read	Abonma - branje	f
00030000-55bf-41fe-c5c4-5b603854d390	Abonma-write	Abonma - spreminjanje	f
00030000-55bf-41fe-da36-85637f688c24	Alternacija-read	Alternacija - branje	f
00030000-55bf-41fe-de00-061465c56517	Alternacija-write	Alternacija - spreminjanje	f
00030000-55bf-41fe-223e-29732a2ee671	Arhivalija-read	Arhivalija - branje	f
00030000-55bf-41fe-2342-f143f9fbeb4f	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55bf-41fe-b3ea-c7bdafb65eec	Besedilo-read	Besedilo - branje	f
00030000-55bf-41fe-2566-a5c6c597413e	Besedilo-write	Besedilo - spreminjanje	f
00030000-55bf-41fe-4e14-7e0f8107dd3e	DogodekIzven-read	DogodekIzven - branje	f
00030000-55bf-41fe-526e-7527939623c2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55bf-41fe-a3e7-6286f6f4338f	Dogodek-read	Dogodek - branje	f
00030000-55bf-41fe-bb5b-c62ef57c1746	Dogodek-write	Dogodek - spreminjanje	f
00030000-55bf-41fe-cc2b-12c99964c301	DrugiVir-read	DrugiVir - branje	f
00030000-55bf-41fe-c5a9-77e3d9e1a6ec	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55bf-41fe-6465-fd128706352e	Drzava-read	Drzava - branje	f
00030000-55bf-41fe-4d40-b400e0a68a22	Drzava-write	Drzava - spreminjanje	f
00030000-55bf-41fe-9ace-26bb37c2e860	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55bf-41fe-5d3d-0190cc9dbff2	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55bf-41fe-fb7d-9fffe9b7d25e	Funkcija-read	Funkcija - branje	f
00030000-55bf-41fe-4877-637fdcad701f	Funkcija-write	Funkcija - spreminjanje	f
00030000-55bf-41fe-6ab8-11ead80d2d68	Gostovanje-read	Gostovanje - branje	f
00030000-55bf-41fe-883c-d8371825fc28	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55bf-41fe-e69b-c189b3555a64	Gostujoca-read	Gostujoca - branje	f
00030000-55bf-41fe-58fd-739607caf5d1	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55bf-41fe-370e-5ea93aa680e2	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55bf-41fe-03d7-b6e945b2b9d4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55bf-41fe-9a0f-96a53632be0f	Kupec-read	Kupec - branje	f
00030000-55bf-41fe-be53-d7104b7f9b98	Kupec-write	Kupec - spreminjanje	f
00030000-55bf-41fe-40a3-f83e428d9fd8	NacinPlacina-read	NacinPlacina - branje	f
00030000-55bf-41fe-5f40-d5b2eefae9b0	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55bf-41fe-cd0e-df6db0384f40	Option-read	Option - branje	f
00030000-55bf-41fe-ebf7-40186fc93a60	Option-write	Option - spreminjanje	f
00030000-55bf-41fe-dce5-5fb89a430ded	OptionValue-read	OptionValue - branje	f
00030000-55bf-41fe-a7fe-181d7496486f	OptionValue-write	OptionValue - spreminjanje	f
00030000-55bf-41fe-787e-7e8b3c0589ca	Oseba-read	Oseba - branje	f
00030000-55bf-41fe-8e85-d37894b16ed3	Oseba-write	Oseba - spreminjanje	f
00030000-55bf-41fe-0563-1f6bcb6f88ca	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55bf-41fe-29d0-96560ae9e6a3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55bf-41fe-a6b0-be14288946f0	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55bf-41fe-35fb-6d87e0029533	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55bf-41fe-fe00-70fcfa83f952	Pogodba-read	Pogodba - branje	f
00030000-55bf-41fe-1116-e401f046cdd3	Pogodba-write	Pogodba - spreminjanje	f
00030000-55bf-41fe-2dbb-1deba83cb48f	Popa-read	Popa - branje	f
00030000-55bf-41fe-9e6c-56fcb9c8a186	Popa-write	Popa - spreminjanje	f
00030000-55bf-41fe-0e4f-46bf27328e1f	Posta-read	Posta - branje	f
00030000-55bf-41fe-d130-ea22cc28d805	Posta-write	Posta - spreminjanje	f
00030000-55bf-41fe-b4e9-d77bdb7859e1	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55bf-41fe-9368-c3e8ac468f0d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55bf-41fe-f37b-385ee9dad683	PostniNaslov-read	PostniNaslov - branje	f
00030000-55bf-41fe-659e-b05f3eaee3d5	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55bf-41fe-4f0e-c6ec3ed66f5e	Predstava-read	Predstava - branje	f
00030000-55bf-41fe-ac4a-36612722083f	Predstava-write	Predstava - spreminjanje	f
00030000-55bf-41fe-1225-f06e035b8033	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55bf-41fe-824c-6306780c7ae0	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55bf-41fe-041f-7e5580809c42	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55bf-41fe-5b6e-07e5c517510d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55bf-41fe-2968-7d71add81e80	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55bf-41fe-f716-ae0d1de66fd9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55bf-41fe-377d-ab7480d04aed	ProgramDela-read	ProgramDela - branje	f
00030000-55bf-41fe-3603-4c01216c7174	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55bf-41fe-0ab6-78dca9c61926	ProgramFestival-read	ProgramFestival - branje	f
00030000-55bf-41fe-5de9-b77e11c4b801	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55bf-41fe-4af6-6d06b6e96b96	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55bf-41fe-4cf6-311cd4f47cbc	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55bf-41fe-8134-a15e0e50bbc0	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55bf-41fe-9a6e-8c5c7673f77b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55bf-41fe-1024-a7d8b149154d	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55bf-41fe-d962-ee1a4b197a2e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55bf-41fe-aa47-ae45206886a0	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55bf-41fe-11f7-2c6a8036c7b0	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55bf-41fe-ff42-bb38e19ee8a1	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55bf-41fe-73e1-d7ec9c3263cb	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55bf-41fe-01e4-c11ff4f9632c	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55bf-41fe-d0ab-de3da904e38e	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55bf-41fe-346e-6f55f6541070	ProgramRazno-read	ProgramRazno - branje	f
00030000-55bf-41fe-02aa-aa090101cf40	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55bf-41fe-1cb9-f453d22b98a6	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55bf-41fe-8f48-957ff2383cec	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55bf-41fe-a691-afe92d51a2f6	Prostor-read	Prostor - branje	f
00030000-55bf-41fe-2969-804e33b202d8	Prostor-write	Prostor - spreminjanje	f
00030000-55bf-41fe-ec96-a1e4b351355e	Racun-read	Racun - branje	f
00030000-55bf-41fe-a8b2-4821de99f535	Racun-write	Racun - spreminjanje	f
00030000-55bf-41fe-60a6-82a3acc5c4c2	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55bf-41fe-2812-691eba997e7b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55bf-41fe-d5c6-beca98c73a5f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55bf-41fe-6527-6eb1d373d7c3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55bf-41fe-3f65-210918d54107	Rekvizit-read	Rekvizit - branje	f
00030000-55bf-41fe-23ae-b2fb6c106464	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55bf-41fe-3868-c7eb2e6c50b8	Revizija-read	Revizija - branje	f
00030000-55bf-41fe-4b0e-703be163fab4	Revizija-write	Revizija - spreminjanje	f
00030000-55bf-41fe-0a2d-373f85dbcaba	Rezervacija-read	Rezervacija - branje	f
00030000-55bf-41fe-703c-f6c5b32623a7	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55bf-41fe-6797-cd59a8778436	SedezniRed-read	SedezniRed - branje	f
00030000-55bf-41fe-cdf4-a484be036a21	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55bf-41fe-1e3a-aeed6b86afcc	Sedez-read	Sedez - branje	f
00030000-55bf-41fe-4abc-ed805f0c0d77	Sedez-write	Sedez - spreminjanje	f
00030000-55bf-41fe-5a14-b0bfd88e71bf	Sezona-read	Sezona - branje	f
00030000-55bf-41fe-c07a-c8f09c4c18cf	Sezona-write	Sezona - spreminjanje	f
00030000-55bf-41fe-bd9b-8ee13d9dd166	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55bf-41fe-02c5-6393b4437e62	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55bf-41fe-2bd9-e5bf57c5230d	Stevilcenje-read	Stevilcenje - branje	f
00030000-55bf-41fe-7475-bf7eaa69b199	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55bf-41fe-39b2-06f88645c787	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55bf-41fe-01e9-2547b34c8433	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55bf-41fe-15ee-5db67b2c31f4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55bf-41fe-ff9a-a563d820d075	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55bf-41fe-8ca2-ced045563887	Telefonska-read	Telefonska - branje	f
00030000-55bf-41fe-116d-6396bc284da7	Telefonska-write	Telefonska - spreminjanje	f
00030000-55bf-41fe-bb88-959acfa99cea	TerminStoritve-read	TerminStoritve - branje	f
00030000-55bf-41fe-7e24-3ad314062f1e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55bf-41fe-e0c7-6431da1387a1	TipFunkcije-read	TipFunkcije - branje	f
00030000-55bf-41fe-4222-ab7811cda7e5	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55bf-41fe-490b-6a19efe5dab7	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55bf-41fe-80d8-6f9f09d02c57	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55bf-41fe-aa4c-9b51ab39a34c	Trr-read	Trr - branje	f
00030000-55bf-41fe-d9c0-2dc39ae0dd64	Trr-write	Trr - spreminjanje	f
00030000-55bf-41fe-7370-45964ddcf019	Uprizoritev-read	Uprizoritev - branje	f
00030000-55bf-41fe-0e66-f278c3a54e67	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55bf-41fe-8955-49574f0d64da	Vaja-read	Vaja - branje	f
00030000-55bf-41fe-3959-4e9bd06047ba	Vaja-write	Vaja - spreminjanje	f
00030000-55bf-41fe-4a3d-7188b26db50d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55bf-41fe-d837-153f13a28847	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55bf-41fe-91ae-856c1d0a80cf	Zaposlitev-read	Zaposlitev - branje	f
00030000-55bf-41fe-699c-9550625a043d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55bf-41fe-e458-1cc6990c7684	Zasedenost-read	Zasedenost - branje	f
00030000-55bf-41fe-1d5a-927a2e4753bd	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55bf-41fe-ac54-dae56a8af628	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55bf-41fe-cfcd-9f52dacbbeec	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55bf-41fe-0e4e-a70e73a678b2	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55bf-41fe-7f20-9892dc3c8c14	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55bf-41fe-085b-e9126ab87b51	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55bf-41fe-02e0-16d7a6e622f8	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55bf-41fe-715c-2877ce7fff5a	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55bf-41fe-f07a-edabc5d6c2fc	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55bf-41fe-3427-aebe28147a1a	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-41fe-382c-d0b6c860699a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-41fe-6ce7-4bcf1101da37	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-41fe-4924-e9e6813a8902	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-41fe-3105-7c4318d790d3	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55bf-41fe-ea73-76d885fea94a	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55bf-41fe-ba89-ebf303d1dfdc	Datoteka-write	Datoteka - spreminjanje	f
00030000-55bf-41fe-8c13-b626bd592bd3	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2966 (class 0 OID 11484927)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55bf-41fe-010e-22c38d7256c3	00030000-55bf-41fe-d753-6464b8057f50
00020000-55bf-41fe-5ac3-ac4dd23a7bb1	00030000-55bf-41fe-6465-fd128706352e
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-b906-6a525aea0079
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-c5c4-5b603854d390
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-da36-85637f688c24
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-de00-061465c56517
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-223e-29732a2ee671
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-a3e7-6286f6f4338f
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-496b-8520daceda21
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-bb5b-c62ef57c1746
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-6465-fd128706352e
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-4d40-b400e0a68a22
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-fb7d-9fffe9b7d25e
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-4877-637fdcad701f
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-6ab8-11ead80d2d68
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-883c-d8371825fc28
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-e69b-c189b3555a64
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-58fd-739607caf5d1
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-370e-5ea93aa680e2
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-03d7-b6e945b2b9d4
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-cd0e-df6db0384f40
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-dce5-5fb89a430ded
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-787e-7e8b3c0589ca
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-8e85-d37894b16ed3
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-2dbb-1deba83cb48f
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-9e6c-56fcb9c8a186
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-0e4f-46bf27328e1f
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-d130-ea22cc28d805
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-f37b-385ee9dad683
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-659e-b05f3eaee3d5
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-4f0e-c6ec3ed66f5e
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-ac4a-36612722083f
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-2968-7d71add81e80
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-f716-ae0d1de66fd9
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-a691-afe92d51a2f6
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-2969-804e33b202d8
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-d5c6-beca98c73a5f
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-6527-6eb1d373d7c3
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-3f65-210918d54107
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-23ae-b2fb6c106464
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-5a14-b0bfd88e71bf
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-c07a-c8f09c4c18cf
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-e0c7-6431da1387a1
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-7370-45964ddcf019
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-0e66-f278c3a54e67
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-8955-49574f0d64da
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-3959-4e9bd06047ba
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-e458-1cc6990c7684
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-1d5a-927a2e4753bd
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-ac54-dae56a8af628
00020000-55bf-41fe-cda6-bf7c095612f7	00030000-55bf-41fe-0e4e-a70e73a678b2
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-b906-6a525aea0079
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-223e-29732a2ee671
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-a3e7-6286f6f4338f
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-6465-fd128706352e
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-6ab8-11ead80d2d68
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-e69b-c189b3555a64
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-370e-5ea93aa680e2
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-03d7-b6e945b2b9d4
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-cd0e-df6db0384f40
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-dce5-5fb89a430ded
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-787e-7e8b3c0589ca
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-8e85-d37894b16ed3
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-2dbb-1deba83cb48f
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-0e4f-46bf27328e1f
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-f37b-385ee9dad683
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-659e-b05f3eaee3d5
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-4f0e-c6ec3ed66f5e
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-a691-afe92d51a2f6
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-d5c6-beca98c73a5f
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-3f65-210918d54107
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-5a14-b0bfd88e71bf
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-8ca2-ced045563887
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-116d-6396bc284da7
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-aa4c-9b51ab39a34c
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-d9c0-2dc39ae0dd64
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-91ae-856c1d0a80cf
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-699c-9550625a043d
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-ac54-dae56a8af628
00020000-55bf-41fe-3dfa-241c06cf6eed	00030000-55bf-41fe-0e4e-a70e73a678b2
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-b906-6a525aea0079
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-da36-85637f688c24
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-223e-29732a2ee671
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-2342-f143f9fbeb4f
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-b3ea-c7bdafb65eec
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-4e14-7e0f8107dd3e
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-a3e7-6286f6f4338f
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-6465-fd128706352e
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-fb7d-9fffe9b7d25e
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-6ab8-11ead80d2d68
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-e69b-c189b3555a64
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-370e-5ea93aa680e2
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-cd0e-df6db0384f40
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-dce5-5fb89a430ded
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-787e-7e8b3c0589ca
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-2dbb-1deba83cb48f
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-0e4f-46bf27328e1f
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-4f0e-c6ec3ed66f5e
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-2968-7d71add81e80
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-a691-afe92d51a2f6
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-d5c6-beca98c73a5f
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-3f65-210918d54107
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-5a14-b0bfd88e71bf
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-e0c7-6431da1387a1
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-8955-49574f0d64da
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-e458-1cc6990c7684
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-ac54-dae56a8af628
00020000-55bf-41fe-5dbf-1d4a35a5b93d	00030000-55bf-41fe-0e4e-a70e73a678b2
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-b906-6a525aea0079
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-c5c4-5b603854d390
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-de00-061465c56517
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-223e-29732a2ee671
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-a3e7-6286f6f4338f
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-6465-fd128706352e
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-6ab8-11ead80d2d68
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-e69b-c189b3555a64
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-cd0e-df6db0384f40
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-dce5-5fb89a430ded
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-2dbb-1deba83cb48f
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-0e4f-46bf27328e1f
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-4f0e-c6ec3ed66f5e
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-a691-afe92d51a2f6
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-d5c6-beca98c73a5f
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-3f65-210918d54107
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-5a14-b0bfd88e71bf
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-e0c7-6431da1387a1
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-ac54-dae56a8af628
00020000-55bf-41fe-71aa-4dc76773de57	00030000-55bf-41fe-0e4e-a70e73a678b2
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-b906-6a525aea0079
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-223e-29732a2ee671
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-a3e7-6286f6f4338f
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-6465-fd128706352e
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-6ab8-11ead80d2d68
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-e69b-c189b3555a64
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-cd0e-df6db0384f40
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-dce5-5fb89a430ded
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-2dbb-1deba83cb48f
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-0e4f-46bf27328e1f
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-4f0e-c6ec3ed66f5e
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-a691-afe92d51a2f6
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-d5c6-beca98c73a5f
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-3f65-210918d54107
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-5a14-b0bfd88e71bf
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-bb88-959acfa99cea
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-9047-5c550bd9f36a
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-e0c7-6431da1387a1
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-ac54-dae56a8af628
00020000-55bf-41fe-4fec-41787e7f8ff8	00030000-55bf-41fe-0e4e-a70e73a678b2
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-1f79-a5a5fb0277a2
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-d753-6464b8057f50
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-9047-5c550bd9f36a
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-496b-8520daceda21
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-a350-5043438335df
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-5b66-7fc7058439be
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-b906-6a525aea0079
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-c5c4-5b603854d390
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-da36-85637f688c24
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-de00-061465c56517
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-223e-29732a2ee671
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-2342-f143f9fbeb4f
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-b3ea-c7bdafb65eec
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-2566-a5c6c597413e
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-4e14-7e0f8107dd3e
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-526e-7527939623c2
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-a3e7-6286f6f4338f
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-bb5b-c62ef57c1746
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-6465-fd128706352e
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-4d40-b400e0a68a22
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-cc2b-12c99964c301
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-c5a9-77e3d9e1a6ec
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-9ace-26bb37c2e860
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-5d3d-0190cc9dbff2
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-fb7d-9fffe9b7d25e
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-4877-637fdcad701f
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-6ab8-11ead80d2d68
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-883c-d8371825fc28
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-e69b-c189b3555a64
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-58fd-739607caf5d1
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-370e-5ea93aa680e2
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-03d7-b6e945b2b9d4
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-9a0f-96a53632be0f
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-be53-d7104b7f9b98
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-40a3-f83e428d9fd8
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-5f40-d5b2eefae9b0
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-cd0e-df6db0384f40
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-ebf7-40186fc93a60
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-dce5-5fb89a430ded
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-a7fe-181d7496486f
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-787e-7e8b3c0589ca
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-8e85-d37894b16ed3
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-0563-1f6bcb6f88ca
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-29d0-96560ae9e6a3
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-a6b0-be14288946f0
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-35fb-6d87e0029533
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-fe00-70fcfa83f952
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-1116-e401f046cdd3
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-2dbb-1deba83cb48f
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-9e6c-56fcb9c8a186
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-0e4f-46bf27328e1f
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-d130-ea22cc28d805
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-b4e9-d77bdb7859e1
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-9368-c3e8ac468f0d
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-f37b-385ee9dad683
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-659e-b05f3eaee3d5
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-4f0e-c6ec3ed66f5e
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-ac4a-36612722083f
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-1225-f06e035b8033
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-824c-6306780c7ae0
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-041f-7e5580809c42
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-5b6e-07e5c517510d
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-2968-7d71add81e80
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-f716-ae0d1de66fd9
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-377d-ab7480d04aed
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-3603-4c01216c7174
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-0ab6-78dca9c61926
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-5de9-b77e11c4b801
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-4af6-6d06b6e96b96
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-4cf6-311cd4f47cbc
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-8134-a15e0e50bbc0
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-9a6e-8c5c7673f77b
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-1024-a7d8b149154d
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-d962-ee1a4b197a2e
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-aa47-ae45206886a0
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-11f7-2c6a8036c7b0
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-ff42-bb38e19ee8a1
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-73e1-d7ec9c3263cb
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-01e4-c11ff4f9632c
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-d0ab-de3da904e38e
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-346e-6f55f6541070
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-02aa-aa090101cf40
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-1cb9-f453d22b98a6
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-8f48-957ff2383cec
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-a691-afe92d51a2f6
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-2969-804e33b202d8
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-ec96-a1e4b351355e
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-a8b2-4821de99f535
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-60a6-82a3acc5c4c2
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-2812-691eba997e7b
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-d5c6-beca98c73a5f
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-6527-6eb1d373d7c3
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-3f65-210918d54107
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-23ae-b2fb6c106464
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-3868-c7eb2e6c50b8
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-4b0e-703be163fab4
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-0a2d-373f85dbcaba
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-703c-f6c5b32623a7
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-6797-cd59a8778436
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-cdf4-a484be036a21
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-1e3a-aeed6b86afcc
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-4abc-ed805f0c0d77
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-5a14-b0bfd88e71bf
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-c07a-c8f09c4c18cf
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-bd9b-8ee13d9dd166
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-02c5-6393b4437e62
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-2bd9-e5bf57c5230d
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-7475-bf7eaa69b199
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-39b2-06f88645c787
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-01e9-2547b34c8433
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-15ee-5db67b2c31f4
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-ff9a-a563d820d075
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-8ca2-ced045563887
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-116d-6396bc284da7
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-bb88-959acfa99cea
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-7e24-3ad314062f1e
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-e0c7-6431da1387a1
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-4222-ab7811cda7e5
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-490b-6a19efe5dab7
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-80d8-6f9f09d02c57
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-aa4c-9b51ab39a34c
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-d9c0-2dc39ae0dd64
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-7370-45964ddcf019
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-0e66-f278c3a54e67
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-8955-49574f0d64da
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-3959-4e9bd06047ba
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-4a3d-7188b26db50d
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-d837-153f13a28847
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-91ae-856c1d0a80cf
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-699c-9550625a043d
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-e458-1cc6990c7684
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-1d5a-927a2e4753bd
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-ac54-dae56a8af628
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-cfcd-9f52dacbbeec
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-0e4e-a70e73a678b2
00020000-55bf-4200-8932-3f61970711fd	00030000-55bf-41fe-7f20-9892dc3c8c14
\.


--
-- TOC entry 2994 (class 0 OID 11485222)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 11485253)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 11485367)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55bf-4200-5553-f734c0b97833	00090000-55bf-4200-0c3c-159982437e1c	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55bf-4200-3b02-ecdb93571ad2	00090000-55bf-4200-87d9-d8aedb98773e	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55bf-4200-5398-63d036181201	00090000-55bf-4200-ec03-2a3e3d554b5b	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2971 (class 0 OID 11484987)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55bf-4200-feaf-49b3327f9c08	00040000-55bf-41fe-3fde-c4aa40112f4e	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4200-9742-d6647bafb7ac	00040000-55bf-41fe-3fde-c4aa40112f4e	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55bf-4200-5b8a-1d48e3d378b2	00040000-55bf-41fe-3fde-c4aa40112f4e	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4200-fc3b-6a270cf80ea1	00040000-55bf-41fe-3fde-c4aa40112f4e	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4200-44e0-90f5e207eb82	00040000-55bf-41fe-3fde-c4aa40112f4e	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4200-379f-125767fbf2c6	00040000-55bf-41fe-778a-8805c248c950	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4200-5e7a-f976cff6af61	00040000-55bf-41fe-a550-46b432c4601d	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4200-f6f5-02b21787d310	00040000-55bf-41fe-815e-cb6b76fdff26	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4200-de9d-f648dccbec27	00040000-55bf-41fe-3fde-c4aa40112f4e	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2973 (class 0 OID 11485022)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55bf-41ff-bcd3-42ed6f2e2104	8341	Adlešiči
00050000-55bf-41ff-97e6-1b4f291dbdbf	5270	Ajdovščina
00050000-55bf-41ff-ec65-cdf4b4a34b1d	6280	Ankaran/Ancarano
00050000-55bf-41ff-eab8-aabb208b3a6e	9253	Apače
00050000-55bf-41ff-b707-c695985fc8e3	8253	Artiče
00050000-55bf-41ff-4565-5986cd491e93	4275	Begunje na Gorenjskem
00050000-55bf-41ff-2944-681518315e1d	1382	Begunje pri Cerknici
00050000-55bf-41ff-d367-073d07727d1a	9231	Beltinci
00050000-55bf-41ff-da90-a9a51eb181c8	2234	Benedikt
00050000-55bf-41ff-cdca-a3263d8accd4	2345	Bistrica ob Dravi
00050000-55bf-41ff-7411-61738a61aaa2	3256	Bistrica ob Sotli
00050000-55bf-41ff-8c43-5954a531edad	8259	Bizeljsko
00050000-55bf-41ff-b2e6-1a10c13e5365	1223	Blagovica
00050000-55bf-41ff-c790-ab268901fc79	8283	Blanca
00050000-55bf-41ff-b2d2-42a90cedcc80	4260	Bled
00050000-55bf-41ff-bda9-e5566544f5d4	4273	Blejska Dobrava
00050000-55bf-41ff-8ce4-dc2f1c28d4f2	9265	Bodonci
00050000-55bf-41ff-2406-579f46ddb814	9222	Bogojina
00050000-55bf-41ff-f64b-52aeffc4f8f9	4263	Bohinjska Bela
00050000-55bf-41ff-2dc2-873d64b8d929	4264	Bohinjska Bistrica
00050000-55bf-41ff-2bc8-b3ad8d659176	4265	Bohinjsko jezero
00050000-55bf-41ff-07e1-4014c47f0ab8	1353	Borovnica
00050000-55bf-41ff-f772-0082f8ff3e0d	8294	Boštanj
00050000-55bf-41ff-84bd-d097cb2b40cc	5230	Bovec
00050000-55bf-41ff-c619-5dd9ae0fff03	5295	Branik
00050000-55bf-41ff-b15f-6ae667fbed41	3314	Braslovče
00050000-55bf-41ff-19d3-9838ec36d18a	5223	Breginj
00050000-55bf-41ff-716d-7bb5cd234e51	8280	Brestanica
00050000-55bf-41ff-6148-c604ea8faeff	2354	Bresternica
00050000-55bf-41ff-e40b-fb15758d8ced	4243	Brezje
00050000-55bf-41ff-1056-9f6e18e38266	1351	Brezovica pri Ljubljani
00050000-55bf-41ff-52e4-1b317329cdaa	8250	Brežice
00050000-55bf-41ff-d59a-5810b798e52f	4210	Brnik - Aerodrom
00050000-55bf-41ff-3996-81ebaab80c21	8321	Brusnice
00050000-55bf-41ff-7fd8-be6e657feedd	3255	Buče
00050000-55bf-41ff-f519-836e360e8f72	8276	Bučka 
00050000-55bf-41ff-fda9-7aa058418088	9261	Cankova
00050000-55bf-41ff-fa5d-6ad15fc80955	3000	Celje 
00050000-55bf-41ff-cd1b-2943b74f42e3	3001	Celje - poštni predali
00050000-55bf-41ff-f53e-dc9548ad871b	4207	Cerklje na Gorenjskem
00050000-55bf-41ff-e1c3-26655e730703	8263	Cerklje ob Krki
00050000-55bf-41ff-362d-8234d055f21c	1380	Cerknica
00050000-55bf-41ff-2cad-a25a7b1981f3	5282	Cerkno
00050000-55bf-41ff-2140-42182477492d	2236	Cerkvenjak
00050000-55bf-41ff-befe-641f3f6d4c6e	2215	Ceršak
00050000-55bf-41ff-5044-19ccd7e75fc0	2326	Cirkovce
00050000-55bf-41ff-aa06-9e7b7f282183	2282	Cirkulane
00050000-55bf-41ff-9040-317175432c5e	5273	Col
00050000-55bf-41ff-462c-56a826bad27e	8251	Čatež ob Savi
00050000-55bf-41ff-2079-67b20053612e	1413	Čemšenik
00050000-55bf-41ff-f61f-9037a75ea035	5253	Čepovan
00050000-55bf-41ff-5fef-2d72c03182a2	9232	Črenšovci
00050000-55bf-41ff-0860-599b5972efb2	2393	Črna na Koroškem
00050000-55bf-41ff-511d-e24ce3b51c86	6275	Črni Kal
00050000-55bf-41ff-d5b7-99b23bbd286a	5274	Črni Vrh nad Idrijo
00050000-55bf-41ff-aa4b-5ac3702f0e20	5262	Črniče
00050000-55bf-41ff-8eba-3c5131d57ded	8340	Črnomelj
00050000-55bf-41ff-b24c-4053ce137942	6271	Dekani
00050000-55bf-41ff-7f55-4ef3b1c1adc9	5210	Deskle
00050000-55bf-41ff-f2b0-b82e53f4114b	2253	Destrnik
00050000-55bf-41ff-ba35-436af5d9219c	6215	Divača
00050000-55bf-41ff-bcdd-523970e07b74	1233	Dob
00050000-55bf-41ff-508f-ecd465fb3c7b	3224	Dobje pri Planini
00050000-55bf-41ff-f8b6-132d670c3296	8257	Dobova
00050000-55bf-41ff-6e39-ebd16cb35814	1423	Dobovec
00050000-55bf-41ff-5a18-005fd47f49ef	5263	Dobravlje
00050000-55bf-41ff-e34a-b86b8eed1fa5	3204	Dobrna
00050000-55bf-41ff-d7e3-6489717519cd	8211	Dobrnič
00050000-55bf-41ff-f397-7ee4a2a59613	1356	Dobrova
00050000-55bf-41ff-d2a3-ead724dd7359	9223	Dobrovnik/Dobronak 
00050000-55bf-41ff-44d6-a5c280173575	5212	Dobrovo v Brdih
00050000-55bf-41ff-00e4-87f22f584fd2	1431	Dol pri Hrastniku
00050000-55bf-41ff-25bc-5f117c4cfdc0	1262	Dol pri Ljubljani
00050000-55bf-41ff-97a6-46443e6dfddb	1273	Dole pri Litiji
00050000-55bf-41ff-c727-35c87329b8b6	1331	Dolenja vas
00050000-55bf-41ff-43f3-b2d3454952dd	8350	Dolenjske Toplice
00050000-55bf-41ff-6bcb-32c088c6a986	1230	Domžale
00050000-55bf-41ff-6c1e-dd4477e68dc9	2252	Dornava
00050000-55bf-41ff-d05f-e3bff5c3be0a	5294	Dornberk
00050000-55bf-41ff-36d3-9acad0a4c077	1319	Draga
00050000-55bf-41ff-d5eb-7d3f39030745	8343	Dragatuš
00050000-55bf-41ff-c59e-c797e95e8478	3222	Dramlje
00050000-55bf-41ff-d436-9094d89ba317	2370	Dravograd
00050000-55bf-41ff-045c-19528f65a6be	4203	Duplje
00050000-55bf-41ff-bd31-5a24d59f40a5	6221	Dutovlje
00050000-55bf-41ff-83a3-c8516325c1c7	8361	Dvor
00050000-55bf-41ff-3bb0-37d530142b09	2343	Fala
00050000-55bf-41ff-b9bd-5183e2a6f56d	9208	Fokovci
00050000-55bf-41ff-d717-1d1636dbbf91	2313	Fram
00050000-55bf-41ff-1935-727ec720a91e	3213	Frankolovo
00050000-55bf-41ff-b66f-30fa47645550	1274	Gabrovka
00050000-55bf-41ff-4f0d-62610714a098	8254	Globoko
00050000-55bf-41ff-361d-c4007faa95e0	5275	Godovič
00050000-55bf-41ff-9dec-ed60dde906f3	4204	Golnik
00050000-55bf-41ff-644d-ff70503c80aa	3303	Gomilsko
00050000-55bf-41ff-2f6e-fcb7f530587b	4224	Gorenja vas
00050000-55bf-41ff-90d4-e6cecba29978	3263	Gorica pri Slivnici
00050000-55bf-41ff-4de3-4601f1662dba	2272	Gorišnica
00050000-55bf-41ff-6702-78152489263b	9250	Gornja Radgona
00050000-55bf-41ff-f9e1-53b6d2885519	3342	Gornji Grad
00050000-55bf-41ff-fa5f-fba038fb82fc	4282	Gozd Martuljek
00050000-55bf-41ff-7d5e-13f571be7298	6272	Gračišče
00050000-55bf-41ff-62b6-908a6e04d51a	9264	Grad
00050000-55bf-41ff-7fec-cdba8a99d8e0	8332	Gradac
00050000-55bf-41ff-0fd0-be6c14d1b69e	1384	Grahovo
00050000-55bf-41ff-8d23-9fc0f3a8a868	5242	Grahovo ob Bači
00050000-55bf-41ff-6fb2-faaf9b9365ab	5251	Grgar
00050000-55bf-41ff-1361-f9990af22208	3302	Griže
00050000-55bf-41ff-87c8-b134daa52740	3231	Grobelno
00050000-55bf-41ff-390e-4aa394092613	1290	Grosuplje
00050000-55bf-41ff-590c-1696c6a2a4b1	2288	Hajdina
00050000-55bf-41ff-058a-e0905752859a	8362	Hinje
00050000-55bf-41ff-8c18-88b26ac6d064	2311	Hoče
00050000-55bf-41ff-0b4b-a32b7f1937be	9205	Hodoš/Hodos
00050000-55bf-41ff-1f3c-d65e0d80d6ea	1354	Horjul
00050000-55bf-41ff-e938-011dc00980be	1372	Hotedršica
00050000-55bf-41ff-4d9b-d9626b8daa40	1430	Hrastnik
00050000-55bf-41ff-0476-b11de6db5bcc	6225	Hruševje
00050000-55bf-41ff-7795-4e114925013c	4276	Hrušica
00050000-55bf-41ff-2ba7-b226b69d1fcb	5280	Idrija
00050000-55bf-41ff-e833-93be2b230b32	1292	Ig
00050000-55bf-41ff-8f3e-97843992a3b9	6250	Ilirska Bistrica
00050000-55bf-41ff-d409-6861ef1921b5	6251	Ilirska Bistrica-Trnovo
00050000-55bf-41ff-517e-a606df439232	1295	Ivančna Gorica
00050000-55bf-41ff-ccf7-2c4e6a55c0e6	2259	Ivanjkovci
00050000-55bf-41ff-5d2c-777ac397e3d5	1411	Izlake
00050000-55bf-41ff-5416-abc681d3c04d	6310	Izola/Isola
00050000-55bf-41ff-d4ef-d66a5f640f61	2222	Jakobski Dol
00050000-55bf-41ff-dd91-521b8bd03651	2221	Jarenina
00050000-55bf-41ff-ab10-e150a7e62ec4	6254	Jelšane
00050000-55bf-41ff-52fa-cf1d46f5ec75	4270	Jesenice
00050000-55bf-41ff-ff89-8ea4f45e9263	8261	Jesenice na Dolenjskem
00050000-55bf-41ff-9749-0863be9df158	3273	Jurklošter
00050000-55bf-41ff-b337-11a1a59b47e4	2223	Jurovski Dol
00050000-55bf-41ff-b88e-cc49b7fe5d76	2256	Juršinci
00050000-55bf-41ff-e77c-a8671e5423d4	5214	Kal nad Kanalom
00050000-55bf-41ff-9610-7a79ab0d4cc0	3233	Kalobje
00050000-55bf-41ff-ba08-ecd1e852964c	4246	Kamna Gorica
00050000-55bf-41ff-d0b2-2d1a5963e70e	2351	Kamnica
00050000-55bf-41ff-6df1-758a96800a0f	1241	Kamnik
00050000-55bf-41ff-9d6d-0b6bf6086542	5213	Kanal
00050000-55bf-41ff-3a47-b8c546859346	8258	Kapele
00050000-55bf-41ff-347e-74869f0a512c	2362	Kapla
00050000-55bf-41ff-4423-55e0961c8162	2325	Kidričevo
00050000-55bf-41ff-1969-6b4907fbdcea	1412	Kisovec
00050000-55bf-41ff-812c-f0d3e2bc7854	6253	Knežak
00050000-55bf-41ff-f748-26659dbc58ba	5222	Kobarid
00050000-55bf-41ff-c981-faa29cf2a96c	9227	Kobilje
00050000-55bf-41ff-e284-c3344dd34117	1330	Kočevje
00050000-55bf-41ff-e7da-ce48ecb52167	1338	Kočevska Reka
00050000-55bf-41ff-09d9-5275cde0360d	2276	Kog
00050000-55bf-41ff-f4c6-ced661725b13	5211	Kojsko
00050000-55bf-41ff-b649-3bd44d603d6c	6223	Komen
00050000-55bf-41ff-8f03-07b90f59c214	1218	Komenda
00050000-55bf-41ff-6568-da2085fd656a	6000	Koper/Capodistria 
00050000-55bf-41ff-8f56-fe787b936862	6001	Koper/Capodistria - poštni predali
00050000-55bf-41ff-9a60-fd452cf3f033	8282	Koprivnica
00050000-55bf-41ff-c2b5-9fed6d33d062	5296	Kostanjevica na Krasu
00050000-55bf-41ff-33f5-5ffc349c5b70	8311	Kostanjevica na Krki
00050000-55bf-41ff-f040-c68f977edac1	1336	Kostel
00050000-55bf-41ff-e281-9d7f3f3d76c6	6256	Košana
00050000-55bf-41ff-3ba0-d3361a13cc78	2394	Kotlje
00050000-55bf-41ff-f27c-2b3d6df54690	6240	Kozina
00050000-55bf-41ff-72a9-35406fea2e34	3260	Kozje
00050000-55bf-41ff-415f-9bde7a9ba4c1	4000	Kranj 
00050000-55bf-41ff-f616-7a484ba4654a	4001	Kranj - poštni predali
00050000-55bf-41ff-3cde-dc2f1e5c902b	4280	Kranjska Gora
00050000-55bf-41ff-dad9-7d09307b3bc1	1281	Kresnice
00050000-55bf-41ff-0d52-c7cd0cfcbce7	4294	Križe
00050000-55bf-41ff-2b8e-5f846a342d68	9206	Križevci
00050000-55bf-41ff-e759-6df293e34bad	9242	Križevci pri Ljutomeru
00050000-55bf-41ff-55d2-530b76f3fb54	1301	Krka
00050000-55bf-41ff-df70-7883e7d68a3b	8296	Krmelj
00050000-55bf-41ff-45db-93ca45ed936e	4245	Kropa
00050000-55bf-41ff-7566-864daa7134da	8262	Krška vas
00050000-55bf-41ff-c733-9fb47ce35b73	8270	Krško
00050000-55bf-41ff-acd7-2dcb840dda7a	9263	Kuzma
00050000-55bf-41ff-4300-37b941f4b5a9	2318	Laporje
00050000-55bf-41ff-9ae3-704c6864fb54	3270	Laško
00050000-55bf-41ff-df94-33df40a0407d	1219	Laze v Tuhinju
00050000-55bf-41ff-0694-0bdf1d516c95	2230	Lenart v Slovenskih goricah
00050000-55bf-41ff-cd04-2aa61afaaa67	9220	Lendava/Lendva
00050000-55bf-41ff-fbf6-f34f2c015319	4248	Lesce
00050000-55bf-41ff-c0a5-2a8d732f8472	3261	Lesično
00050000-55bf-41ff-ecf5-fdaef84552a6	8273	Leskovec pri Krškem
00050000-55bf-41ff-4f00-2e6720519be1	2372	Libeliče
00050000-55bf-41ff-1f33-a1f15aae74af	2341	Limbuš
00050000-55bf-41ff-35cc-8bcac42d932c	1270	Litija
00050000-55bf-41ff-2ece-ee2c7c679a2a	3202	Ljubečna
00050000-55bf-41ff-4057-84b1135f5ac8	1000	Ljubljana 
00050000-55bf-41ff-54fe-f17990719215	1001	Ljubljana - poštni predali
00050000-55bf-41ff-1f12-cf8d880c5533	1231	Ljubljana - Črnuče
00050000-55bf-41ff-5be2-6f6cdf3ca10e	1261	Ljubljana - Dobrunje
00050000-55bf-41ff-005c-e2372f20b8c1	1260	Ljubljana - Polje
00050000-55bf-41ff-2c37-e7309595f96e	1210	Ljubljana - Šentvid
00050000-55bf-41ff-b156-ea1f77ec13cd	1211	Ljubljana - Šmartno
00050000-55bf-41ff-ad48-18ed34d701df	3333	Ljubno ob Savinji
00050000-55bf-41ff-99a4-43944a5f948f	9240	Ljutomer
00050000-55bf-41ff-0626-c94bd838e310	3215	Loče
00050000-55bf-41ff-5a13-baf9b5a2a7f3	5231	Log pod Mangartom
00050000-55bf-41ff-682c-81770ccf0cc1	1358	Log pri Brezovici
00050000-55bf-41ff-a098-6f9395e899e5	1370	Logatec
00050000-55bf-41ff-c90b-59c726fc89b7	1371	Logatec
00050000-55bf-41ff-991c-672c596e3940	1434	Loka pri Zidanem Mostu
00050000-55bf-41ff-edc8-152c0aa974df	3223	Loka pri Žusmu
00050000-55bf-41ff-beb7-25121233e65d	6219	Lokev
00050000-55bf-41ff-f0f2-0821ca0b9480	1318	Loški Potok
00050000-55bf-41ff-3344-428ff999cccf	2324	Lovrenc na Dravskem polju
00050000-55bf-41ff-4fa6-551b2e2827d8	2344	Lovrenc na Pohorju
00050000-55bf-41ff-8038-975d92137876	3334	Luče
00050000-55bf-41ff-97af-9b4a507c0d25	1225	Lukovica
00050000-55bf-41ff-0394-481d02cd2138	9202	Mačkovci
00050000-55bf-41ff-c5ab-87452adcae7f	2322	Majšperk
00050000-55bf-41ff-fe6f-b55545204b90	2321	Makole
00050000-55bf-41ff-ffd8-2c26b7b53995	9243	Mala Nedelja
00050000-55bf-41ff-fbb7-48fd5ab43d51	2229	Malečnik
00050000-55bf-41ff-d17e-b12d31d9804b	6273	Marezige
00050000-55bf-41ff-9d25-73ef3a97443d	2000	Maribor 
00050000-55bf-41ff-f764-0b78646d1a5b	2001	Maribor - poštni predali
00050000-55bf-41ff-5d0c-5e8544e9d83b	2206	Marjeta na Dravskem polju
00050000-55bf-41ff-6307-d48e9268a9e7	2281	Markovci
00050000-55bf-41ff-7cfe-65619e5d6656	9221	Martjanci
00050000-55bf-41ff-d7cb-a9200fbbb8d6	6242	Materija
00050000-55bf-41ff-e7de-6169b5e2b9e3	4211	Mavčiče
00050000-55bf-41ff-4f8e-31989b6b56af	1215	Medvode
00050000-55bf-41ff-a5c0-65e95acfbe18	1234	Mengeš
00050000-55bf-41ff-e21c-2e87648f98f6	8330	Metlika
00050000-55bf-41ff-23d7-f098994cc120	2392	Mežica
00050000-55bf-41ff-39ff-7a6045cb43ed	2204	Miklavž na Dravskem polju
00050000-55bf-41ff-770a-62e653921c54	2275	Miklavž pri Ormožu
00050000-55bf-41ff-5c2f-cae47e5b4dbd	5291	Miren
00050000-55bf-41ff-eb82-91bfdb93963f	8233	Mirna
00050000-55bf-41ff-0a92-55465931bc98	8216	Mirna Peč
00050000-55bf-41ff-f249-ea6745cfec77	2382	Mislinja
00050000-55bf-41ff-63c5-9750a4820f0a	4281	Mojstrana
00050000-55bf-41ff-eab6-56d2892720cf	8230	Mokronog
00050000-55bf-41ff-f672-260ff1077385	1251	Moravče
00050000-55bf-41ff-a7c6-bee8d4c15147	9226	Moravske Toplice
00050000-55bf-41ff-c808-f450f29abaf6	5216	Most na Soči
00050000-55bf-41ff-3ef0-8874355d0b19	1221	Motnik
00050000-55bf-41ff-4ae2-283de126582f	3330	Mozirje
00050000-55bf-41ff-0755-da9e13009b46	9000	Murska Sobota 
00050000-55bf-41ff-75c8-bba27a25c82f	9001	Murska Sobota - poštni predali
00050000-55bf-41ff-7f28-d691a49238e4	2366	Muta
00050000-55bf-41ff-ba34-6ba018b4bd17	4202	Naklo
00050000-55bf-41ff-aeaf-e6f18ec96586	3331	Nazarje
00050000-55bf-41ff-d13a-a3ce8df703e3	1357	Notranje Gorice
00050000-55bf-41ff-673c-68f4b11f395a	3203	Nova Cerkev
00050000-55bf-41ff-418b-c8f341f54a0d	5000	Nova Gorica 
00050000-55bf-41ff-45dd-0564197d2618	5001	Nova Gorica - poštni predali
00050000-55bf-41ff-1f8b-5a015de7f203	1385	Nova vas
00050000-55bf-41ff-4fb6-98236ea9ed84	8000	Novo mesto
00050000-55bf-41ff-938f-3025ce6c2049	8001	Novo mesto - poštni predali
00050000-55bf-41ff-4062-4bc9799b6646	6243	Obrov
00050000-55bf-41ff-2b33-3ecd997a8d1a	9233	Odranci
00050000-55bf-41ff-39fb-1cdc56b9a6b5	2317	Oplotnica
00050000-55bf-41ff-4982-1bc557c39824	2312	Orehova vas
00050000-55bf-41ff-8143-e76d69e93701	2270	Ormož
00050000-55bf-41ff-2cca-daf2839e6354	1316	Ortnek
00050000-55bf-41ff-ff73-7537910037d3	1337	Osilnica
00050000-55bf-41ff-f85d-b624df5c85b6	8222	Otočec
00050000-55bf-41ff-3a1f-fb54e9d24a92	2361	Ožbalt
00050000-55bf-41ff-a60b-e5fd0caa6f0b	2231	Pernica
00050000-55bf-41ff-9724-a80045dc9c63	2211	Pesnica pri Mariboru
00050000-55bf-41ff-a039-87018ffb6075	9203	Petrovci
00050000-55bf-41ff-7a1a-f31ad5e47505	3301	Petrovče
00050000-55bf-41ff-996c-40d8775203f6	6330	Piran/Pirano
00050000-55bf-41ff-e647-053170d79da0	8255	Pišece
00050000-55bf-41ff-993f-b062ccef53e3	6257	Pivka
00050000-55bf-41ff-6fda-92e19cadff02	6232	Planina
00050000-55bf-41ff-701a-55757850cf29	3225	Planina pri Sevnici
00050000-55bf-41ff-871a-58ed443d31c0	6276	Pobegi
00050000-55bf-41ff-3ca0-be6b318d75d4	8312	Podbočje
00050000-55bf-41ff-fcb1-11004904f0e6	5243	Podbrdo
00050000-55bf-41ff-f364-a12deac10b11	3254	Podčetrtek
00050000-55bf-41ff-105b-a9a7a7b61d1c	2273	Podgorci
00050000-55bf-41ff-b072-2469bf22bc80	6216	Podgorje
00050000-55bf-41ff-6010-19ec6a9a3824	2381	Podgorje pri Slovenj Gradcu
00050000-55bf-41ff-fc7d-a66f34658387	6244	Podgrad
00050000-55bf-41ff-a9de-25f33981f909	1414	Podkum
00050000-55bf-41ff-083d-ef4a8b8e4841	2286	Podlehnik
00050000-55bf-41ff-8d42-1e4d260addee	5272	Podnanos
00050000-55bf-41ff-2bff-58831f363d72	4244	Podnart
00050000-55bf-41ff-db7f-5d80f68bd9a4	3241	Podplat
00050000-55bf-41ff-edfc-bafeb7051d8d	3257	Podsreda
00050000-55bf-41ff-cd26-500b966ae683	2363	Podvelka
00050000-55bf-41ff-e704-8dc20e2b211f	2208	Pohorje
00050000-55bf-41ff-614f-90c2bd554ec8	2257	Polenšak
00050000-55bf-41ff-cd50-360996080280	1355	Polhov Gradec
00050000-55bf-41ff-8c3c-e1e6a4c28140	4223	Poljane nad Škofjo Loko
00050000-55bf-41ff-20a4-f7439e107f32	2319	Poljčane
00050000-55bf-41ff-dc20-389e5d53f2db	1272	Polšnik
00050000-55bf-41ff-f51d-3fcf6528d8ca	3313	Polzela
00050000-55bf-41ff-3f6c-34679541cff5	3232	Ponikva
00050000-55bf-41ff-371a-21c613f58036	6320	Portorož/Portorose
00050000-55bf-41ff-361d-d5f241d661c9	6230	Postojna
00050000-55bf-41ff-c9b5-849f4bbe79f2	2331	Pragersko
00050000-55bf-41ff-7359-e8cfae0a085c	3312	Prebold
00050000-55bf-41ff-0963-aa33c765e6fa	4205	Preddvor
00050000-55bf-41ff-c772-a86baa6fba8f	6255	Prem
00050000-55bf-41ff-57b9-fddb3bd608f2	1352	Preserje
00050000-55bf-41ff-b43d-881c425dfaa5	6258	Prestranek
00050000-55bf-41ff-1a99-58b682bf0fb2	2391	Prevalje
00050000-55bf-41ff-bb3f-03ee133e3750	3262	Prevorje
00050000-55bf-41ff-fa30-6f23b88ef977	1276	Primskovo 
00050000-55bf-41ff-256f-9753ac616d24	3253	Pristava pri Mestinju
00050000-55bf-41ff-27c4-62fe8806ca75	9207	Prosenjakovci/Partosfalva
00050000-55bf-41ff-ba86-0e353a86d260	5297	Prvačina
00050000-55bf-41ff-614d-16cf15144ec1	2250	Ptuj
00050000-55bf-41ff-b4c8-ff1ed8fe6edc	2323	Ptujska Gora
00050000-55bf-41ff-4aae-ac7dd54c9be0	9201	Puconci
00050000-55bf-41ff-dc5f-6f07fdee2fe1	2327	Rače
00050000-55bf-41ff-2d2e-2f79466a5069	1433	Radeče
00050000-55bf-41ff-bde0-78547c1c2808	9252	Radenci
00050000-55bf-41ff-97ed-e49f9a3a9e26	2360	Radlje ob Dravi
00050000-55bf-41ff-c418-f56c1b164c00	1235	Radomlje
00050000-55bf-41ff-12db-94eb47e584e0	4240	Radovljica
00050000-55bf-41ff-14f4-9fa4d14f2e03	8274	Raka
00050000-55bf-41ff-794f-03931c54aee8	1381	Rakek
00050000-55bf-41ff-ad87-f26135169bdd	4283	Rateče - Planica
00050000-55bf-41ff-b016-e124e9f1e2d1	2390	Ravne na Koroškem
00050000-55bf-41ff-701d-b4f07f3f0621	9246	Razkrižje
00050000-55bf-41ff-4716-0683dcc102f0	3332	Rečica ob Savinji
00050000-55bf-41ff-e381-180f15f29de4	5292	Renče
00050000-55bf-41ff-5ac9-f47073bc0170	1310	Ribnica
00050000-55bf-41ff-c20a-5d1cd5fa42e0	2364	Ribnica na Pohorju
00050000-55bf-41ff-7c11-ea96e2e67122	3272	Rimske Toplice
00050000-55bf-41ff-ec88-5630df7b777f	1314	Rob
00050000-55bf-41ff-3391-4625c4b99edb	5215	Ročinj
00050000-55bf-41ff-c16f-be247364466a	3250	Rogaška Slatina
00050000-55bf-41ff-7b36-6c875d9fed90	9262	Rogašovci
00050000-55bf-41ff-d651-888b5d219ce4	3252	Rogatec
00050000-55bf-41ff-d201-d1098aaba538	1373	Rovte
00050000-55bf-41ff-be7f-7895b314bb75	2342	Ruše
00050000-55bf-41ff-765d-0c95c30fc831	1282	Sava
00050000-55bf-41ff-5206-84384f1eb5f2	6333	Sečovlje/Sicciole
00050000-55bf-41ff-da0f-c7d6700a6350	4227	Selca
00050000-55bf-41ff-c9c3-212deba5df02	2352	Selnica ob Dravi
00050000-55bf-41ff-b8fe-6a7da5d22f6d	8333	Semič
00050000-55bf-41ff-30be-a32c68bfd257	8281	Senovo
00050000-55bf-41ff-5193-a94fb68fcc95	6224	Senožeče
00050000-55bf-41ff-ded4-572cff9bb8cd	8290	Sevnica
00050000-55bf-41ff-a204-9349766dc87a	6210	Sežana
00050000-55bf-41ff-791c-e626271c2e68	2214	Sladki Vrh
00050000-55bf-41ff-a63c-d65ec5245770	5283	Slap ob Idrijci
00050000-55bf-41ff-051f-9e60cba4d49e	2380	Slovenj Gradec
00050000-55bf-41ff-6d65-6be270f5b37d	2310	Slovenska Bistrica
00050000-55bf-41ff-1d2d-c3a238488cb3	3210	Slovenske Konjice
00050000-55bf-41ff-622b-8e0b369c8b95	1216	Smlednik
00050000-55bf-41ff-bb60-d8105ce469e6	5232	Soča
00050000-55bf-41ff-896b-79fc6e8b3051	1317	Sodražica
00050000-55bf-41ff-7e5e-11268d5649fa	3335	Solčava
00050000-55bf-41ff-52da-052d5256e525	5250	Solkan
00050000-55bf-41ff-3076-cf44d4cb07d6	4229	Sorica
00050000-55bf-41ff-17f3-6370f0802643	4225	Sovodenj
00050000-55bf-41ff-9c43-6f291bc3a405	5281	Spodnja Idrija
00050000-55bf-41ff-f68b-215b811b27bd	2241	Spodnji Duplek
00050000-55bf-41ff-95dd-87b78c6919ad	9245	Spodnji Ivanjci
00050000-55bf-41ff-043e-bfcbe5d7e063	2277	Središče ob Dravi
00050000-55bf-41ff-8527-1419efe37fde	4267	Srednja vas v Bohinju
00050000-55bf-41ff-36d9-93aa6e55afcf	8256	Sromlje 
00050000-55bf-41ff-41d4-a1b1ec4e94ea	5224	Srpenica
00050000-55bf-41ff-7687-e7090f63365c	1242	Stahovica
00050000-55bf-41ff-6a36-13b275f79967	1332	Stara Cerkev
00050000-55bf-41ff-25ff-edaa52a05a37	8342	Stari trg ob Kolpi
00050000-55bf-41ff-970c-915f5b9d19d9	1386	Stari trg pri Ložu
00050000-55bf-41ff-7d73-4b4ef63a4ee2	2205	Starše
00050000-55bf-41ff-c416-902fcab74d12	2289	Stoperce
00050000-55bf-41ff-7696-d865d90a82ca	8322	Stopiče
00050000-55bf-41ff-22b3-06231d15dd00	3206	Stranice
00050000-55bf-41ff-7a4b-e99a69cbf617	8351	Straža
00050000-55bf-41ff-4fc9-197abc3ebf5d	1313	Struge
00050000-55bf-41ff-e380-de1d9fce92b6	8293	Studenec
00050000-55bf-41ff-0599-0bf74486a792	8331	Suhor
00050000-55bf-41ff-3177-126a6d6d34c1	2233	Sv. Ana v Slovenskih goricah
00050000-55bf-41ff-151f-327bcaafc857	2235	Sv. Trojica v Slovenskih goricah
00050000-55bf-41ff-e42a-3e07be34c39a	2353	Sveti Duh na Ostrem Vrhu
00050000-55bf-41ff-abc9-8a2cf1444058	9244	Sveti Jurij ob Ščavnici
00050000-55bf-41ff-e640-ef44f76507ca	3264	Sveti Štefan
00050000-55bf-41ff-0cc1-f6ac1b3e44a3	2258	Sveti Tomaž
00050000-55bf-41ff-8994-82fa83ad7873	9204	Šalovci
00050000-55bf-41ff-4728-e04531a3cf27	5261	Šempas
00050000-55bf-41ff-c613-29c87007f247	5290	Šempeter pri Gorici
00050000-55bf-41ff-9a1f-f61a9afcd114	3311	Šempeter v Savinjski dolini
00050000-55bf-41ff-82b3-658199a35110	4208	Šenčur
00050000-55bf-41ff-e008-abe194b35545	2212	Šentilj v Slovenskih goricah
00050000-55bf-41ff-4802-f810ea31d8eb	8297	Šentjanž
00050000-55bf-41ff-3ee2-3724f594ac09	2373	Šentjanž pri Dravogradu
00050000-55bf-41ff-c793-95f371aceace	8310	Šentjernej
00050000-55bf-41ff-58d8-840e0497909b	3230	Šentjur
00050000-55bf-41ff-65c4-b2cf8959265b	3271	Šentrupert
00050000-55bf-41ff-5721-96d7fc780d62	8232	Šentrupert
00050000-55bf-41ff-717d-285fedf6a077	1296	Šentvid pri Stični
00050000-55bf-41ff-8284-48a87fd26a46	8275	Škocjan
00050000-55bf-41ff-8093-45e673dd3dca	6281	Škofije
00050000-55bf-41ff-4e9b-06ee319dd9c9	4220	Škofja Loka
00050000-55bf-41ff-ad57-4268cb97717f	3211	Škofja vas
00050000-55bf-41ff-ce2c-d4d41808b4f6	1291	Škofljica
00050000-55bf-41ff-27d0-4745a76bd424	6274	Šmarje
00050000-55bf-41ff-6929-7390ea5981b4	1293	Šmarje - Sap
00050000-55bf-41ff-a5c3-bcdf85e4c73f	3240	Šmarje pri Jelšah
00050000-55bf-41ff-7f3f-bb5d33110be3	8220	Šmarješke Toplice
00050000-55bf-41ff-e703-be37bfb56ca1	2315	Šmartno na Pohorju
00050000-55bf-41ff-76e5-70d41aa157e7	3341	Šmartno ob Dreti
00050000-55bf-41ff-dd8e-2fd4f98c3111	3327	Šmartno ob Paki
00050000-55bf-41ff-7b3a-f5394eb6ab11	1275	Šmartno pri Litiji
00050000-55bf-41ff-82e1-e4d6e02d667a	2383	Šmartno pri Slovenj Gradcu
00050000-55bf-41ff-2b2a-ed3d31bfb7ff	3201	Šmartno v Rožni dolini
00050000-55bf-41ff-2fed-7330fda61920	3325	Šoštanj
00050000-55bf-41ff-5a12-4883ece0fff1	6222	Štanjel
00050000-55bf-41ff-f192-66101620503c	3220	Štore
00050000-55bf-41ff-6216-e8747f55069b	3304	Tabor
00050000-55bf-41ff-d796-0deb19b3e5b0	3221	Teharje
00050000-55bf-41ff-a78a-a3a42d73183d	9251	Tišina
00050000-55bf-41ff-d4fe-24c5cf916979	5220	Tolmin
00050000-55bf-41ff-1985-ed603e1458e9	3326	Topolšica
00050000-55bf-41ff-e319-90b6fdf944eb	2371	Trbonje
00050000-55bf-41ff-d509-fd997c8880c8	1420	Trbovlje
00050000-55bf-41ff-49e5-ece2add9dff5	8231	Trebelno 
00050000-55bf-41ff-c234-25a87ed52d1c	8210	Trebnje
00050000-55bf-41ff-e09f-643beb3b4665	5252	Trnovo pri Gorici
00050000-55bf-41ff-103a-aae36bd14720	2254	Trnovska vas
00050000-55bf-41ff-9cc1-c448ba7994ff	1222	Trojane
00050000-55bf-41ff-dcdf-c89e5d2146c2	1236	Trzin
00050000-55bf-41ff-6ea7-daac0720278b	4290	Tržič
00050000-55bf-41ff-78d4-f125a8adfe95	8295	Tržišče
00050000-55bf-41ff-dc55-f64e966b2c11	1311	Turjak
00050000-55bf-41ff-4f34-879508dacd00	9224	Turnišče
00050000-55bf-41ff-48ab-8522a3bac799	8323	Uršna sela
00050000-55bf-41ff-8bc2-2e05c342e129	1252	Vače
00050000-55bf-41ff-09b2-be9aebd9b56c	3320	Velenje 
00050000-55bf-41ff-f9c3-0dac1d5aff82	3322	Velenje - poštni predali
00050000-55bf-41ff-ca04-f8cd409a7429	8212	Velika Loka
00050000-55bf-41ff-5a73-1d4e221e7036	2274	Velika Nedelja
00050000-55bf-41ff-5117-bed168ee72e4	9225	Velika Polana
00050000-55bf-41ff-b2c9-abfb6be2f7b2	1315	Velike Lašče
00050000-55bf-41ff-10cf-bf871e377046	8213	Veliki Gaber
00050000-55bf-41ff-d29a-5af536d9138b	9241	Veržej
00050000-55bf-41ff-58ea-5bc22db17f19	1312	Videm - Dobrepolje
00050000-55bf-41ff-2fe5-e8f0bb1b7288	2284	Videm pri Ptuju
00050000-55bf-41ff-542f-9f63e87c1d7a	8344	Vinica
00050000-55bf-41ff-f01b-f910bc4108f4	5271	Vipava
00050000-55bf-41ff-9117-e613a92fe3f6	4212	Visoko
00050000-55bf-41ff-33bf-c66763619de0	1294	Višnja Gora
00050000-55bf-41ff-e1bc-7b2d38b09cc7	3205	Vitanje
00050000-55bf-41ff-3c1d-59220f4c67c0	2255	Vitomarci
00050000-55bf-41ff-71eb-9da845d4d63b	1217	Vodice
00050000-55bf-41ff-6b0b-515744128279	3212	Vojnik\t
00050000-55bf-41ff-52d3-c0e4b53c9143	5293	Volčja Draga
00050000-55bf-41ff-3d2d-54da9e692b98	2232	Voličina
00050000-55bf-41ff-fb3b-11274bb37ea2	3305	Vransko
00050000-55bf-41ff-98a6-6c81a64efddc	6217	Vremski Britof
00050000-55bf-41ff-0f5e-3bd2a4a2d0b3	1360	Vrhnika
00050000-55bf-41ff-67cf-0defc9d8a186	2365	Vuhred
00050000-55bf-41ff-2e3e-293cf953c8dd	2367	Vuzenica
00050000-55bf-41ff-c00e-2ca32abada0b	8292	Zabukovje 
00050000-55bf-41ff-3a78-e266536905d1	1410	Zagorje ob Savi
00050000-55bf-41ff-7a93-acf426ca9f5d	1303	Zagradec
00050000-55bf-41ff-f60a-ee8231f66c39	2283	Zavrč
00050000-55bf-41ff-2ac9-7a9afc748a0e	8272	Zdole 
00050000-55bf-41ff-7091-00bd28d47aba	4201	Zgornja Besnica
00050000-55bf-41ff-64e9-61f5af1f3821	2242	Zgornja Korena
00050000-55bf-41ff-4f2e-9214b363b8f3	2201	Zgornja Kungota
00050000-55bf-41ff-e68e-a67d68507636	2316	Zgornja Ložnica
00050000-55bf-41ff-dacb-90a47c3c28be	2314	Zgornja Polskava
00050000-55bf-41ff-4782-9cb1dd9d8cd6	2213	Zgornja Velka
00050000-55bf-41ff-339e-23fbe9c05d53	4247	Zgornje Gorje
00050000-55bf-41ff-71d0-6e5989683684	4206	Zgornje Jezersko
00050000-55bf-41ff-5d2f-9f28ee2af41d	2285	Zgornji Leskovec
00050000-55bf-41ff-13e7-1687e8aee138	1432	Zidani Most
00050000-55bf-41ff-c8bf-2d23e8d69d8d	3214	Zreče
00050000-55bf-41ff-2691-47349afb0a03	4209	Žabnica
00050000-55bf-41ff-9f72-f0d1a2329253	3310	Žalec
00050000-55bf-41ff-1fca-7932ba7f5610	4228	Železniki
00050000-55bf-41ff-8dc7-13d03eb74c7a	2287	Žetale
00050000-55bf-41ff-d2ea-4238cb152ff0	4226	Žiri
00050000-55bf-41ff-d4e1-f1e9b11b9124	4274	Žirovnica
00050000-55bf-41ff-bfcc-3789c93c0e8d	8360	Žužemberk
\.


--
-- TOC entry 2990 (class 0 OID 11485196)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 11485007)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11485085)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 11485208)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 11485510)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 11485520)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55bf-4200-51d9-a51621134f80	00080000-55bf-4200-de9d-f648dccbec27	0900	AK
00190000-55bf-4200-5a52-41079428fd9f	00080000-55bf-4200-5b8a-1d48e3d378b2	0987	AK
00190000-55bf-4200-36d3-6bb076cbd7b9	00080000-55bf-4200-9742-d6647bafb7ac	0989	AK
00190000-55bf-4200-9bb8-c9a4915e6537	00080000-55bf-4200-fc3b-6a270cf80ea1	0986	AK
00190000-55bf-4200-94f3-c85f32faed19	00080000-55bf-4200-379f-125767fbf2c6	0984	AK
00190000-55bf-4200-54c8-d27c8ff948d0	00080000-55bf-4200-5e7a-f976cff6af61	0983	AK
00190000-55bf-4200-323f-71dfe3ecdda8	00080000-55bf-4200-f6f5-02b21787d310	0982	AK
\.


--
-- TOC entry 3014 (class 0 OID 11485491)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55bf-4200-f86a-2ae161a25a78	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2959 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 11485528)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 11485237)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55bf-4200-abc9-9f244a16762a	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55bf-4200-fe7e-53c4b2f32253	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55bf-4200-ceb9-9152a72ed6c6	0003	Kazinska	t	84	Kazinska dvorana
00220000-55bf-4200-0a1c-2b61e57f3b11	0004	Mali oder	t	24	Mali oder 
00220000-55bf-4200-1411-ec7060010ecb	0005	Komorni oder	t	15	Komorni oder
00220000-55bf-4200-45d6-11085004bb4d	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55bf-4200-81c7-5a303efff37e	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2988 (class 0 OID 11485181)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11485171)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11485356)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 11485305)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 11484879)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2997 (class 0 OID 11485247)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 11484917)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55bf-41fe-010e-22c38d7256c3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55bf-41fe-5ac3-ac4dd23a7bb1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55bf-41fe-b792-c972729c8d56	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55bf-41fe-c64c-ea870b681b24	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55bf-41fe-cda6-bf7c095612f7	planer	Planer dogodkov v koledarju	t
00020000-55bf-41fe-3dfa-241c06cf6eed	kadrovska	Kadrovska služba	t
00020000-55bf-41fe-5dbf-1d4a35a5b93d	arhivar	Ažuriranje arhivalij	t
00020000-55bf-41fe-71aa-4dc76773de57	igralec	Igralec	t
00020000-55bf-41fe-4fec-41787e7f8ff8	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55bf-4200-8932-3f61970711fd	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2963 (class 0 OID 11484901)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55bf-41ff-a911-1fe1fa72447b	00020000-55bf-41fe-b792-c972729c8d56
00010000-55bf-41ff-13ad-a04c2f5a92f6	00020000-55bf-41fe-b792-c972729c8d56
00010000-55bf-4200-8397-340785a89443	00020000-55bf-4200-8932-3f61970711fd
\.


--
-- TOC entry 2999 (class 0 OID 11485261)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11485202)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 11485152)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 11485569)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55bf-41ff-c7ec-eabad52ce560	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55bf-41ff-abc8-ea87ec5b4925	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55bf-41ff-a3d5-b4c746af174f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55bf-41ff-3c41-531728f9f787	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55bf-41ff-af2a-1c3643f35682	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3021 (class 0 OID 11485561)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55bf-41ff-4e01-db7b525dc497	00230000-55bf-41ff-3c41-531728f9f787	popa
00240000-55bf-41ff-5405-d949c155432b	00230000-55bf-41ff-3c41-531728f9f787	oseba
00240000-55bf-41ff-2600-6480b4925d13	00230000-55bf-41ff-abc8-ea87ec5b4925	prostor
00240000-55bf-41ff-5787-7afb015e11a5	00230000-55bf-41ff-3c41-531728f9f787	besedilo
00240000-55bf-41ff-f980-2942f9b1990a	00230000-55bf-41ff-3c41-531728f9f787	uprizoritev
00240000-55bf-41ff-e0b4-04a77be9f9bb	00230000-55bf-41ff-3c41-531728f9f787	funkcija
00240000-55bf-41ff-8f2f-2b0d7162e54e	00230000-55bf-41ff-3c41-531728f9f787	tipfunkcije
00240000-55bf-41ff-7f61-2389b920ef92	00230000-55bf-41ff-3c41-531728f9f787	alternacija
00240000-55bf-41ff-102c-2f01e2e8efa7	00230000-55bf-41ff-c7ec-eabad52ce560	pogodba
00240000-55bf-41ff-4bf8-44365a4544fb	00230000-55bf-41ff-3c41-531728f9f787	zaposlitev
00240000-55bf-41ff-56e5-cf2d15df81cf	00230000-55bf-41ff-c7ec-eabad52ce560	programdela
00240000-55bf-41ff-47d4-1480c50e38af	00230000-55bf-41ff-3c41-531728f9f787	zapis
\.


--
-- TOC entry 3020 (class 0 OID 11485556)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11485315)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55bf-4200-7e89-9c04cbd5d548	000e0000-55bf-4200-7d90-e0cafeb80e20	00080000-55bf-4200-feaf-49b3327f9c08	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55bf-4200-fea2-64c3f30289b9	000e0000-55bf-4200-7d90-e0cafeb80e20	00080000-55bf-4200-feaf-49b3327f9c08	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55bf-4200-7174-7020ccea9372	000e0000-55bf-4200-7d90-e0cafeb80e20	00080000-55bf-4200-44e0-90f5e207eb82	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55bf-4200-6046-8ac15cfb0092	000e0000-55bf-4200-7d90-e0cafeb80e20	00080000-55bf-4200-44e0-90f5e207eb82	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2970 (class 0 OID 11484979)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 11485158)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55bf-4200-29a3-7686620aa6de	00180000-55bf-4200-76e7-c28f4b4056cc	000c0000-55bf-4200-94e2-99d5c35ed748	00090000-55bf-4200-a08f-0b789fa481d5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-4200-f904-9797979d5960	00180000-55bf-4200-76e7-c28f4b4056cc	000c0000-55bf-4200-9d9b-b0302d29de51	00090000-55bf-4200-249a-c837376c00f0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-4200-b83b-03704aa3d5a6	00180000-55bf-4200-76e7-c28f4b4056cc	000c0000-55bf-4200-efc5-89efc97fc2f8	00090000-55bf-4200-3f51-dc39f325c671	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-4200-667f-9a41ed98127a	00180000-55bf-4200-76e7-c28f4b4056cc	000c0000-55bf-4200-c7d7-0f8a0883a14e	00090000-55bf-4200-51ab-313dd768f847	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-4200-9598-f94e77add300	00180000-55bf-4200-76e7-c28f4b4056cc	000c0000-55bf-4200-cbb7-281ce16d1253	00090000-55bf-4200-772e-cd3c83e02168	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-4200-efc1-2fe042e17110	00180000-55bf-4200-18ad-a86e846d5e5f	\N	00090000-55bf-4200-772e-cd3c83e02168	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3006 (class 0 OID 11485345)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55bf-41ff-e151-0e69c2765505	Avtor	Avtorji	Avtorka	umetnik
000f0000-55bf-41ff-62f1-4c0a7d09fa7b	Priredba	Priredba	Priredba	umetnik
000f0000-55bf-41ff-8180-7f8cc9551d51	Prevod	Prevod	Prevod	umetnik
000f0000-55bf-41ff-7b8b-43da0748cf69	Režija	Režija	Režija	umetnik
000f0000-55bf-41ff-21a0-2ed3f0029106	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55bf-41ff-db83-5efa02428694	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55bf-41ff-ffdc-f4a9ec87c12e	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55bf-41ff-9b4b-6393f12d84ea	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55bf-41ff-e288-6fe86a5cae5c	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55bf-41ff-c29b-253bb9b0a60c	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55bf-41ff-66aa-4e3e429feb74	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55bf-41ff-4ed1-f3486d9fbbbd	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55bf-41ff-48f3-d81f2725c343	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55bf-41ff-2e52-4da3a223da33	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55bf-41ff-407c-41fb7add2d64	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55bf-41ff-89ea-fb597119899e	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55bf-41ff-a326-81cc3c206cf6	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55bf-41ff-fb43-abaeaa73d2cb	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3018 (class 0 OID 11485538)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55bf-41ff-284a-95fc352bf346	01	Velika predstava	f	1.00	1.00
002b0000-55bf-41ff-6b85-6a345707299c	02	Mala predstava	f	0.50	0.50
002b0000-55bf-41ff-a8a4-3869f5371ca5	03	Mala koprodukcija	t	0.40	1.00
002b0000-55bf-41ff-d471-c221f5583fae	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55bf-41ff-e756-bcdb2dfc7d07	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2975 (class 0 OID 11485042)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 11484888)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55bf-41ff-13ad-a04c2f5a92f6	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROQEib./jIGXryteoc9Di51MewCxz2sjC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55bf-4200-b499-cddd39113076	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55bf-4200-2383-b6075396cee0	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55bf-4200-0a37-029092691334	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55bf-4200-37ea-01234fe8f170	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55bf-4200-767f-14f4071a46ae	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55bf-4200-6ff8-869f85742dde	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55bf-4200-daf0-85f74b83dd1c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55bf-4200-da83-d103be10d423	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55bf-4200-688f-ad2be1e4143c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55bf-4200-8397-340785a89443	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55bf-41ff-a911-1fe1fa72447b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3010 (class 0 OID 11485393)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55bf-4200-7b9b-d15c040e98cf	00160000-55bf-4200-4101-79a15d3fe912	00150000-55bf-41ff-126e-29c16d7e7326	00140000-55bf-41fe-24ea-3af1a1ecefcb	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55bf-4200-1411-ec7060010ecb
000e0000-55bf-4200-7d90-e0cafeb80e20	00160000-55bf-4200-3183-12f2dc55766a	00150000-55bf-41ff-fa06-a9569929da97	00140000-55bf-41fe-0ec7-a446ae4e87a6	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55bf-4200-45d6-11085004bb4d
000e0000-55bf-4200-1ac3-a209878f58a3	\N	00150000-55bf-41ff-fa06-a9569929da97	00140000-55bf-41fe-0ec7-a446ae4e87a6	00190000-55bf-4200-5a52-41079428fd9f	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55bf-4200-1411-ec7060010ecb
000e0000-55bf-4200-922e-ed4d6a81da60	\N	00150000-55bf-41ff-fa06-a9569929da97	00140000-55bf-41fe-0ec7-a446ae4e87a6	00190000-55bf-4200-5a52-41079428fd9f	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55bf-4200-1411-ec7060010ecb
000e0000-55bf-4200-3774-a9ceca7b571c	\N	00150000-55bf-41ff-fa06-a9569929da97	00140000-55bf-41fe-0ec7-a446ae4e87a6	00190000-55bf-4200-5a52-41079428fd9f	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55bf-4200-abc9-9f244a16762a
\.


--
-- TOC entry 2980 (class 0 OID 11485104)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55bf-4200-feed-280ed234c853	000e0000-55bf-4200-7d90-e0cafeb80e20	1	
00200000-55bf-4200-e075-4c85c0811b10	000e0000-55bf-4200-7d90-e0cafeb80e20	2	
\.


--
-- TOC entry 2995 (class 0 OID 11485229)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 11485608)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 11485580)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 11485620)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 11485298)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55bf-4200-de04-e75c61afe338	00090000-55bf-4200-249a-c837376c00f0	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-4200-5388-d6f641c24007	00090000-55bf-4200-3f51-dc39f325c671	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-4200-38e1-436663a3e2bc	00090000-55bf-4200-81ab-53b60dd2500e	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-4200-f11f-2a16bbecb1bf	00090000-55bf-4200-628f-8516c3cd7a43	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-4200-6123-056b268817ac	00090000-55bf-4200-a08f-0b789fa481d5	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-4200-9141-6c0bde79be49	00090000-55bf-4200-68cb-207fffd9e49f	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2982 (class 0 OID 11485136)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11485383)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55bf-41fe-24ea-3af1a1ecefcb	01	Drama	drama (SURS 01)
00140000-55bf-41fe-61a5-d524e95d930b	02	Opera	opera (SURS 02)
00140000-55bf-41fe-683c-33f01300988d	03	Balet	balet (SURS 03)
00140000-55bf-41fe-33c8-8ee4a7bf9753	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55bf-41fe-15aa-43d59453c62f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55bf-41fe-0ec7-a446ae4e87a6	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55bf-41fe-9bda-a61fb00d5b4e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3001 (class 0 OID 11485288)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55bf-41ff-5c84-535a117d580c	01	Opera	opera
00150000-55bf-41ff-5e41-cf97e54c7c2d	02	Opereta	opereta
00150000-55bf-41ff-f92a-a68e2c01f58c	03	Balet	balet
00150000-55bf-41ff-5b4f-a8d8cdc82537	04	Plesne prireditve	plesne prireditve
00150000-55bf-41ff-009f-f7d623e5cd6b	05	Lutkovno gledališče	lutkovno gledališče
00150000-55bf-41ff-d333-5b6e4035bfa2	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55bf-41ff-0de2-066a6dbe5b03	07	Biografska drama	biografska drama
00150000-55bf-41ff-126e-29c16d7e7326	08	Komedija	komedija
00150000-55bf-41ff-0576-39b175502120	09	Črna komedija	črna komedija
00150000-55bf-41ff-db7a-6feb9ceada28	10	E-igra	E-igra
00150000-55bf-41ff-fa06-a9569929da97	11	Kriminalka	kriminalka
00150000-55bf-41ff-aa84-2f6fc340a115	12	Musical	musical
\.


--
-- TOC entry 2507 (class 2606 OID 11484942)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 11485440)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 11485430)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 11485344)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11485661)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 11485126)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 11485151)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11485554)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 11485068)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 11485485)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 11485284)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 11485102)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 11485145)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 11485082)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 11485194)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 11485637)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 11485644)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2747 (class 2606 OID 11485669)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 11485221)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 11485040)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 11484951)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2514 (class 2606 OID 11484975)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 11484931)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2498 (class 2606 OID 11484916)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 11485227)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 11485260)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 11485378)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 11485004)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 11485028)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 11485200)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 11485018)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 11485089)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 11485212)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 11485517)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 11485525)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 11485508)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 11485536)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 11485244)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 11485185)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 11485176)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11485366)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 11485312)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 11484887)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 11485251)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 11484905)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2500 (class 2606 OID 11484925)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 11485269)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 11485207)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 11485157)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 11485578)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 11485566)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 11485560)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 11485325)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 11484984)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 11485167)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11485355)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 11485548)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 11485053)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 11484900)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 11485409)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 11485111)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 11485235)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 11485618)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 11485602)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 11485626)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 11485303)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 11485140)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 11485391)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 11485296)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 1259 OID 11485133)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2647 (class 1259 OID 11485326)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2648 (class 1259 OID 11485327)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2733 (class 1259 OID 11485639)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2734 (class 1259 OID 11485638)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2521 (class 1259 OID 11485006)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2468 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2469 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2470 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2612 (class 1259 OID 11485228)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2720 (class 1259 OID 11485606)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2721 (class 1259 OID 11485605)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2722 (class 1259 OID 11485607)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2723 (class 1259 OID 11485604)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2724 (class 1259 OID 11485603)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2606 (class 1259 OID 11485214)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 11485213)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 11485112)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 11485285)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 11485287)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2636 (class 1259 OID 11485286)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2546 (class 1259 OID 11485084)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 11485083)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2703 (class 1259 OID 11485537)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2657 (class 1259 OID 11485380)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2658 (class 1259 OID 11485381)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2659 (class 1259 OID 11485382)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2730 (class 1259 OID 11485627)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2482 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2483 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2666 (class 1259 OID 11485414)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2667 (class 1259 OID 11485411)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2668 (class 1259 OID 11485415)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2669 (class 1259 OID 11485413)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2670 (class 1259 OID 11485412)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2536 (class 1259 OID 11485055)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 11485054)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2474 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2512 (class 1259 OID 11484978)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2622 (class 1259 OID 11485252)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2576 (class 1259 OID 11485146)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2502 (class 1259 OID 11484932)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2503 (class 1259 OID 11484933)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2627 (class 1259 OID 11485272)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2628 (class 1259 OID 11485271)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2629 (class 1259 OID 11485270)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2550 (class 1259 OID 11485090)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2551 (class 1259 OID 11485092)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2552 (class 1259 OID 11485091)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2713 (class 1259 OID 11485568)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2586 (class 1259 OID 11485180)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2587 (class 1259 OID 11485178)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2588 (class 1259 OID 11485177)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2589 (class 1259 OID 11485179)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2493 (class 1259 OID 11484906)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2494 (class 1259 OID 11484907)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 11485236)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2743 (class 1259 OID 11485662)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2744 (class 1259 OID 11485670)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2745 (class 1259 OID 11485671)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2601 (class 1259 OID 11485201)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2643 (class 1259 OID 11485313)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2644 (class 1259 OID 11485314)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2687 (class 1259 OID 11485490)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2688 (class 1259 OID 11485489)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2689 (class 1259 OID 11485486)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2690 (class 1259 OID 11485487)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2691 (class 1259 OID 11485488)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2525 (class 1259 OID 11485020)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 11485019)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2527 (class 1259 OID 11485021)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2486 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2695 (class 1259 OID 11485518)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2696 (class 1259 OID 11485519)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2680 (class 1259 OID 11485444)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2681 (class 1259 OID 11485445)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2682 (class 1259 OID 11485442)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2683 (class 1259 OID 11485443)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2640 (class 1259 OID 11485304)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 11485189)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2593 (class 1259 OID 11485188)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2594 (class 1259 OID 11485186)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2595 (class 1259 OID 11485187)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2464 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2676 (class 1259 OID 11485432)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2677 (class 1259 OID 11485431)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2692 (class 1259 OID 11485509)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2557 (class 1259 OID 11485103)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2710 (class 1259 OID 11485555)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2737 (class 1259 OID 11485645)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2738 (class 1259 OID 11485646)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2508 (class 1259 OID 11484953)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2509 (class 1259 OID 11484952)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2517 (class 1259 OID 11484985)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 11484986)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2581 (class 1259 OID 11485170)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2582 (class 1259 OID 11485169)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2583 (class 1259 OID 11485168)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2477 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2478 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2564 (class 1259 OID 11485135)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2565 (class 1259 OID 11485131)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2566 (class 1259 OID 11485128)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2567 (class 1259 OID 11485129)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2568 (class 1259 OID 11485127)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2569 (class 1259 OID 11485132)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2570 (class 1259 OID 11485130)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2524 (class 1259 OID 11485005)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2542 (class 1259 OID 11485069)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 11485071)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2544 (class 1259 OID 11485070)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2545 (class 1259 OID 11485072)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2600 (class 1259 OID 11485195)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 11485379)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2671 (class 1259 OID 11485410)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2515 (class 1259 OID 11484976)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2516 (class 1259 OID 11484977)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2637 (class 1259 OID 11485297)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 11485579)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 11485041)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2716 (class 1259 OID 11485567)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2620 (class 1259 OID 11485246)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2621 (class 1259 OID 11485245)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2684 (class 1259 OID 11485441)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2532 (class 1259 OID 11485029)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 11485392)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 11485619)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2701 (class 1259 OID 11485526)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 11485527)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2501 (class 1259 OID 11484926)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2571 (class 1259 OID 11485134)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2773 (class 2606 OID 11485807)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2776 (class 2606 OID 11485792)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2775 (class 2606 OID 11485797)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2771 (class 2606 OID 11485817)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2777 (class 2606 OID 11485787)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2772 (class 2606 OID 11485812)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2774 (class 2606 OID 11485802)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2807 (class 2606 OID 11485962)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 11485967)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 11486137)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2841 (class 2606 OID 11486132)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2758 (class 2606 OID 11485722)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2794 (class 2606 OID 11485902)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2835 (class 2606 OID 11486117)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2836 (class 2606 OID 11486112)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2834 (class 2606 OID 11486122)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2837 (class 2606 OID 11486107)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2838 (class 2606 OID 11486102)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2792 (class 2606 OID 11485897)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2793 (class 2606 OID 11485892)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2770 (class 2606 OID 11485782)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 11485932)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 11485942)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2801 (class 2606 OID 11485937)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2764 (class 2606 OID 11485757)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 11485752)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 11485882)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2831 (class 2606 OID 11486087)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2810 (class 2606 OID 11485972)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2809 (class 2606 OID 11485977)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2808 (class 2606 OID 11485982)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2839 (class 2606 OID 11486127)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2812 (class 2606 OID 11486002)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2815 (class 2606 OID 11485987)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2811 (class 2606 OID 11486007)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2813 (class 2606 OID 11485997)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2814 (class 2606 OID 11485992)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2762 (class 2606 OID 11485747)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 11485742)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 11485707)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2755 (class 2606 OID 11485702)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2796 (class 2606 OID 11485912)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2778 (class 2606 OID 11485822)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 11485682)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2750 (class 2606 OID 11485687)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2797 (class 2606 OID 11485927)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2798 (class 2606 OID 11485922)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2799 (class 2606 OID 11485917)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2768 (class 2606 OID 11485762)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2766 (class 2606 OID 11485772)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2767 (class 2606 OID 11485767)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2833 (class 2606 OID 11486097)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2782 (class 2606 OID 11485857)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2784 (class 2606 OID 11485847)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2785 (class 2606 OID 11485842)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2783 (class 2606 OID 11485852)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2749 (class 2606 OID 11485672)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2748 (class 2606 OID 11485677)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2795 (class 2606 OID 11485907)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2844 (class 2606 OID 11486152)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 11486157)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2845 (class 2606 OID 11486162)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2791 (class 2606 OID 11485887)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2805 (class 2606 OID 11485952)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2804 (class 2606 OID 11485957)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2822 (class 2606 OID 11486062)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2823 (class 2606 OID 11486057)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2826 (class 2606 OID 11486042)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2825 (class 2606 OID 11486047)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2824 (class 2606 OID 11486052)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2760 (class 2606 OID 11485732)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 11485727)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2759 (class 2606 OID 11485737)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2829 (class 2606 OID 11486072)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2828 (class 2606 OID 11486077)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2819 (class 2606 OID 11486032)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2818 (class 2606 OID 11486037)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2821 (class 2606 OID 11486022)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2820 (class 2606 OID 11486027)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2803 (class 2606 OID 11485947)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2786 (class 2606 OID 11485877)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2787 (class 2606 OID 11485872)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2789 (class 2606 OID 11485862)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2788 (class 2606 OID 11485867)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2816 (class 2606 OID 11486017)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2817 (class 2606 OID 11486012)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2827 (class 2606 OID 11486067)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2769 (class 2606 OID 11485777)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2830 (class 2606 OID 11486082)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2832 (class 2606 OID 11486092)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2843 (class 2606 OID 11486142)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2842 (class 2606 OID 11486147)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2752 (class 2606 OID 11485697)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2753 (class 2606 OID 11485692)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2757 (class 2606 OID 11485712)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2756 (class 2606 OID 11485717)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 11485837)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 11485832)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2781 (class 2606 OID 11485827)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-03 12:27:13 CEST

--
-- PostgreSQL database dump complete
--

