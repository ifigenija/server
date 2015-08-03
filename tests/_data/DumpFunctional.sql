--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-03 13:13:11 CEST

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
-- TOC entry 183 (class 1259 OID 11515116)
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
-- TOC entry 228 (class 1259 OID 11515615)
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
-- TOC entry 227 (class 1259 OID 11515598)
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
-- TOC entry 221 (class 1259 OID 11515510)
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
-- TOC entry 244 (class 1259 OID 11515829)
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
-- TOC entry 197 (class 1259 OID 11515295)
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
-- TOC entry 200 (class 1259 OID 11515329)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11515731)
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
-- TOC entry 192 (class 1259 OID 11515238)
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
-- TOC entry 229 (class 1259 OID 11515628)
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
-- TOC entry 216 (class 1259 OID 11515455)
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
-- TOC entry 195 (class 1259 OID 11515275)
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
-- TOC entry 199 (class 1259 OID 11515323)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11515255)
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
-- TOC entry 205 (class 1259 OID 11515372)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11515810)
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
-- TOC entry 243 (class 1259 OID 11515822)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11515845)
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
-- TOC entry 209 (class 1259 OID 11515397)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11515212)
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
-- TOC entry 184 (class 1259 OID 11515125)
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
-- TOC entry 185 (class 1259 OID 11515136)
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
-- TOC entry 180 (class 1259 OID 11515090)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11515109)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11515404)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11515435)
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
-- TOC entry 224 (class 1259 OID 11515549)
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
-- TOC entry 187 (class 1259 OID 11515169)
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
-- TOC entry 189 (class 1259 OID 11515204)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11515378)
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
-- TOC entry 188 (class 1259 OID 11515189)
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
-- TOC entry 194 (class 1259 OID 11515267)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11515390)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11515692)
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
-- TOC entry 232 (class 1259 OID 11515702)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11515673)
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
-- TOC entry 233 (class 1259 OID 11515710)
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
-- TOC entry 212 (class 1259 OID 11515419)
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
-- TOC entry 204 (class 1259 OID 11515363)
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
-- TOC entry 203 (class 1259 OID 11515353)
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
-- TOC entry 223 (class 1259 OID 11515538)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11515487)
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
-- TOC entry 177 (class 1259 OID 11515061)
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
-- TOC entry 176 (class 1259 OID 11515059)
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
-- TOC entry 213 (class 1259 OID 11515429)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11515099)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11515083)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11515443)
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
-- TOC entry 207 (class 1259 OID 11515384)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11515334)
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
-- TOC entry 238 (class 1259 OID 11515751)
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
-- TOC entry 237 (class 1259 OID 11515743)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11515738)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11515497)
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
-- TOC entry 186 (class 1259 OID 11515161)
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
-- TOC entry 202 (class 1259 OID 11515340)
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
-- TOC entry 222 (class 1259 OID 11515527)
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
-- TOC entry 234 (class 1259 OID 11515720)
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
-- TOC entry 191 (class 1259 OID 11515224)
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
-- TOC entry 178 (class 1259 OID 11515070)
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
-- TOC entry 226 (class 1259 OID 11515575)
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
-- TOC entry 196 (class 1259 OID 11515286)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11515411)
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
-- TOC entry 240 (class 1259 OID 11515790)
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
-- TOC entry 239 (class 1259 OID 11515762)
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
-- TOC entry 241 (class 1259 OID 11515802)
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
-- TOC entry 218 (class 1259 OID 11515480)
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
-- TOC entry 198 (class 1259 OID 11515318)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11515565)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11515470)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2245 (class 2604 OID 11515064)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2967 (class 0 OID 11515116)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 11515615)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55bf-4cc6-54aa-da912c7dd07d	000d0000-55bf-4cc6-3941-d2bc06f17ba1	\N	00090000-55bf-4cc6-b6f9-bc8840516c18	000b0000-55bf-4cc6-f863-b6575d0456df	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55bf-4cc6-db90-2110be0d7d51	000d0000-55bf-4cc6-cc66-2ef009183c84	00100000-55bf-4cc6-0f6c-f854ba832b4b	00090000-55bf-4cc6-5850-644e2e652ec6	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55bf-4cc6-7540-750c9bc975f7	000d0000-55bf-4cc6-0044-76c563d37fac	00100000-55bf-4cc6-aae9-f2205fa42d67	00090000-55bf-4cc6-1256-0d11978bd57f	\N	0003	t	\N	2015-08-03	\N	2	\N	\N	f	f
000c0000-55bf-4cc6-6613-53365fcb872f	000d0000-55bf-4cc6-e47d-8a95eb0246b2	\N	00090000-55bf-4cc6-a338-3299dcf3c667	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55bf-4cc6-6740-b53677f4b240	000d0000-55bf-4cc6-6cc9-0af1f50aa047	\N	00090000-55bf-4cc6-a388-1923bf8d56c8	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55bf-4cc6-92ce-9aa872dbf2a6	000d0000-55bf-4cc6-6ac2-31ab370f570a	\N	00090000-55bf-4cc6-0938-6b50c223f402	000b0000-55bf-4cc6-27ab-7cd2bc9cea6b	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55bf-4cc6-ef6e-84c0221b2be0	000d0000-55bf-4cc6-5441-4fcec6d8ae5d	00100000-55bf-4cc6-825a-79a3eaa8055b	00090000-55bf-4cc6-6e44-3c35417459fa	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55bf-4cc6-7454-623b7c5bf365	000d0000-55bf-4cc6-fe15-e4682cf66496	\N	00090000-55bf-4cc6-b900-262b7bd2cebc	000b0000-55bf-4cc6-4251-4288aafdca9c	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55bf-4cc6-a613-5e00b61ce2f2	000d0000-55bf-4cc6-5441-4fcec6d8ae5d	00100000-55bf-4cc6-0732-d58336bb18fb	00090000-55bf-4cc6-eda4-741bbd40c9bb	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55bf-4cc6-b65b-0f59ab9b4439	000d0000-55bf-4cc6-5441-4fcec6d8ae5d	00100000-55bf-4cc6-20c6-3ecec41b8eca	00090000-55bf-4cc6-f28d-a8e37ae95c3c	\N	0010	t	\N	2015-08-03	\N	16	\N	\N	f	t
000c0000-55bf-4cc6-b43d-46f4a10498e9	000d0000-55bf-4cc6-5441-4fcec6d8ae5d	00100000-55bf-4cc6-e725-67dba100dbf3	00090000-55bf-4cc6-7952-bf638d881e7a	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3011 (class 0 OID 11515598)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 11515510)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55bf-4cc6-8093-2318aa4e4a57	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55bf-4cc6-24bf-e45ccbef4dc6	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55bf-4cc6-73e3-afb40a882079	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 11515829)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 11515295)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55bf-4cc6-d0fc-b9f48c41e3b8	\N	\N	00200000-55bf-4cc6-e33c-270a424977ad	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55bf-4cc6-cae5-d70066d4f1c3	\N	\N	00200000-55bf-4cc6-8cfd-f1da117a54a1	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55bf-4cc6-a217-902ad7762bb5	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55bf-4cc6-c165-c37250fd29f5	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55bf-4cc6-b5f6-e34012fe0cd8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2984 (class 0 OID 11515329)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 11515731)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 11515238)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55bf-4cc5-26ab-9b9ad7537665	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55bf-4cc5-576b-46bd392dbf85	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55bf-4cc5-ac3a-390cfde865c2	AL	ALB	008	Albania 	Albanija	\N
00040000-55bf-4cc5-70f9-dcc07314dea0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55bf-4cc5-9860-0e587d9f16ba	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55bf-4cc5-c140-b8a8fd39d0bc	AD	AND	020	Andorra 	Andora	\N
00040000-55bf-4cc5-d81e-05bafb0ce507	AO	AGO	024	Angola 	Angola	\N
00040000-55bf-4cc5-b40f-e1a6a9207f8e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55bf-4cc5-84c0-6b97a09d4a6a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55bf-4cc5-f09c-4b8ce856287b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-4cc5-2cd5-fbfe13ecbd5c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55bf-4cc5-3cfd-1b4caa54a71a	AM	ARM	051	Armenia 	Armenija	\N
00040000-55bf-4cc5-56eb-bae892c0a490	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55bf-4cc5-e333-f93ca0391d6b	AU	AUS	036	Australia 	Avstralija	\N
00040000-55bf-4cc5-4272-faa61de6ddd7	AT	AUT	040	Austria 	Avstrija	\N
00040000-55bf-4cc5-8762-1adf9d891276	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55bf-4cc5-9f7a-771f63ddf833	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55bf-4cc5-4279-f4a6df9b7253	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55bf-4cc5-e06a-d4e91c6d3937	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55bf-4cc5-9815-e749bfbbbe93	BB	BRB	052	Barbados 	Barbados	\N
00040000-55bf-4cc5-1c35-b3c1d7280e97	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55bf-4cc5-e5ac-2540e4b8d19c	BE	BEL	056	Belgium 	Belgija	\N
00040000-55bf-4cc5-a739-6596659acf5c	BZ	BLZ	084	Belize 	Belize	\N
00040000-55bf-4cc5-c3e9-35aefb69fdba	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55bf-4cc5-c2be-50edf936b369	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55bf-4cc5-d9ae-1ecc1abf0b71	BT	BTN	064	Bhutan 	Butan	\N
00040000-55bf-4cc5-5479-49ee24917e9c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55bf-4cc5-37da-3862880a45fb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55bf-4cc5-8cd2-689a719ab40a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55bf-4cc5-233e-4110847af0e9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55bf-4cc5-49a2-ccdcb1dbf8ba	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55bf-4cc5-d41a-ac1b0c1db78e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55bf-4cc5-df36-f662de49443d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55bf-4cc5-5809-f0dee85836bf	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55bf-4cc5-af48-c9ee5754af1d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55bf-4cc5-3cf7-84145dbaa4c5	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55bf-4cc5-d6cb-be7a5791be28	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55bf-4cc5-fc44-842ea03181e5	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55bf-4cc5-4797-c4569bd8a90f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55bf-4cc5-ca38-685c7fe81394	CA	CAN	124	Canada 	Kanada	\N
00040000-55bf-4cc5-5bf5-287d393169fb	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55bf-4cc5-7889-c5217bb6fb22	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55bf-4cc5-4d75-f5324fe2c3d2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55bf-4cc5-baae-c331768b3fcb	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55bf-4cc5-df2f-65596013b5fd	CL	CHL	152	Chile 	Čile	\N
00040000-55bf-4cc5-ad66-bf2c5ec01d48	CN	CHN	156	China 	Kitajska	\N
00040000-55bf-4cc5-9685-759bf69a56bd	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55bf-4cc5-ea30-896cdf7730e0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55bf-4cc5-9b58-fddf676d2e14	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55bf-4cc5-3c91-9a32578774c2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55bf-4cc5-6548-b18f3674bbf2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55bf-4cc5-d76b-76d12430e212	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55bf-4cc5-d1cd-b2893259220a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55bf-4cc5-3c8b-d25818015a20	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55bf-4cc5-e9bc-9e5d7805ea1b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55bf-4cc5-6584-dfbc904e884e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55bf-4cc5-6501-ce3bc8f80bc5	CU	CUB	192	Cuba 	Kuba	\N
00040000-55bf-4cc5-5a54-b57379e56208	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55bf-4cc5-3574-1173c76c140c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55bf-4cc5-b13b-d3e670ff67dc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55bf-4cc5-4a55-5f7990659831	DK	DNK	208	Denmark 	Danska	\N
00040000-55bf-4cc5-c946-a3732d459cee	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55bf-4cc5-31e2-538ecbee98ef	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-4cc5-2495-b055ae5c8eb0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55bf-4cc5-8e3e-a7cbbd379fa3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55bf-4cc5-b258-ff99f1ca174e	EG	EGY	818	Egypt 	Egipt	\N
00040000-55bf-4cc5-34ae-e475ac34569f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55bf-4cc5-2afb-8364ac0c6272	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55bf-4cc5-fb97-89588009ad66	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55bf-4cc5-59ad-6003d8fa5db3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55bf-4cc5-beba-6490bf4f55c2	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55bf-4cc5-79d8-ed69a301c8fb	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55bf-4cc5-ea1d-d175699b69b0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55bf-4cc5-aa05-6b3fc15e2889	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55bf-4cc5-9f99-74d4a1f9b8e7	FI	FIN	246	Finland 	Finska	\N
00040000-55bf-4cc5-0073-0d303460835a	FR	FRA	250	France 	Francija	\N
00040000-55bf-4cc5-3238-fc4a636c4c82	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55bf-4cc5-0b25-3e7e9178d6f2	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55bf-4cc5-89da-d36b17aae9cf	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55bf-4cc5-3c4f-764c2fd2128e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55bf-4cc5-5724-e1a0c04fed30	GA	GAB	266	Gabon 	Gabon	\N
00040000-55bf-4cc5-4803-6effea812a69	GM	GMB	270	Gambia 	Gambija	\N
00040000-55bf-4cc5-8126-d47f2e7e623e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55bf-4cc5-1e76-e668e949c2d3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55bf-4cc5-eb89-d78e5a2bf417	GH	GHA	288	Ghana 	Gana	\N
00040000-55bf-4cc5-e110-b562afccf803	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55bf-4cc5-52ba-4c977e8167a5	GR	GRC	300	Greece 	Grčija	\N
00040000-55bf-4cc5-ce31-dc1b23fe7be8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55bf-4cc5-2c38-7723f6e2ace8	GD	GRD	308	Grenada 	Grenada	\N
00040000-55bf-4cc5-8867-39bd805ebe37	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55bf-4cc5-e60c-cc3c8f75dd43	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55bf-4cc5-5a25-8c5539e36763	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55bf-4cc5-7426-b448aa0f0011	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55bf-4cc5-497f-0822e848ca62	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55bf-4cc5-17dd-0f66066e6a4c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55bf-4cc5-1c2c-e4cb7863b767	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55bf-4cc5-f41d-0b73aa7b8f53	HT	HTI	332	Haiti 	Haiti	\N
00040000-55bf-4cc5-f209-57622ea6c7b3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55bf-4cc5-769c-db9afecb1f16	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55bf-4cc5-da76-848c9a016302	HN	HND	340	Honduras 	Honduras	\N
00040000-55bf-4cc5-d9d7-b90ac69451b3	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55bf-4cc5-5dd2-35a827bbd2bf	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55bf-4cc5-64a8-b6ac64db4695	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55bf-4cc5-2664-3b180f2dc08f	IN	IND	356	India 	Indija	\N
00040000-55bf-4cc5-aed4-02347bf097ee	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55bf-4cc5-7a77-fb3f1a04327b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55bf-4cc5-03ed-6f3b14983ace	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55bf-4cc5-5abf-4916636fbb6f	IE	IRL	372	Ireland 	Irska	\N
00040000-55bf-4cc5-c5c4-810c42cd5f10	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55bf-4cc5-4f2c-2014e3fd5d49	IL	ISR	376	Israel 	Izrael	\N
00040000-55bf-4cc5-3c2c-3aa2da688d2a	IT	ITA	380	Italy 	Italija	\N
00040000-55bf-4cc5-d92a-d5f287f75316	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55bf-4cc5-f195-cd78de74fe58	JP	JPN	392	Japan 	Japonska	\N
00040000-55bf-4cc5-0c42-078e1ab0745f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55bf-4cc5-c04c-96ca7a6c3ac3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55bf-4cc5-fd70-eb836087b2ae	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55bf-4cc5-0a68-1dce54ca6c24	KE	KEN	404	Kenya 	Kenija	\N
00040000-55bf-4cc5-3af0-3f8eb6cd08f7	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55bf-4cc5-c3ee-642fea52e2ff	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55bf-4cc5-9941-9dcb36c93533	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55bf-4cc5-fe74-69c1831e9ec7	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55bf-4cc5-feed-c101b9a2b4b9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55bf-4cc5-dc29-b120b6d2af47	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55bf-4cc5-6beb-4f4d3df32529	LV	LVA	428	Latvia 	Latvija	\N
00040000-55bf-4cc5-5564-2c13b30ebd6a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55bf-4cc5-83a9-e45d0a162500	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55bf-4cc5-47d7-3aa32d94b5ce	LR	LBR	430	Liberia 	Liberija	\N
00040000-55bf-4cc5-c111-3b7863c2a786	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55bf-4cc5-b609-7198d74581bf	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55bf-4cc5-15cb-a25f4204d1d1	LT	LTU	440	Lithuania 	Litva	\N
00040000-55bf-4cc5-adb5-f46c36089b0f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55bf-4cc5-676e-4afea2562ffa	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55bf-4cc5-f32c-d98ce559cc1e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55bf-4cc5-8900-b4a5e8c69ddf	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55bf-4cc5-1da6-3a378a7aef8d	MW	MWI	454	Malawi 	Malavi	\N
00040000-55bf-4cc5-9e02-faef701209d8	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55bf-4cc5-1bfb-3ad897744f2f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55bf-4cc5-3298-d0945ecdbe99	ML	MLI	466	Mali 	Mali	\N
00040000-55bf-4cc5-2af0-ab2b2cfbe1c2	MT	MLT	470	Malta 	Malta	\N
00040000-55bf-4cc5-9dfe-5f0236c2ccfc	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55bf-4cc5-f02f-366fec1b104b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55bf-4cc5-af14-2923bff9a781	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55bf-4cc5-7087-75da3ca32666	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55bf-4cc5-bd08-7eefa0df24a0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55bf-4cc5-4efc-264cc618e36a	MX	MEX	484	Mexico 	Mehika	\N
00040000-55bf-4cc5-3ad1-899cc631f5e1	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55bf-4cc5-0885-198e159b04de	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55bf-4cc5-a847-253749921094	MC	MCO	492	Monaco 	Monako	\N
00040000-55bf-4cc5-5da1-ba8b43ea258c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55bf-4cc5-ec79-cfdf2c343636	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55bf-4cc5-04e0-a104efd8be2a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55bf-4cc5-7452-d8cb5f7c2195	MA	MAR	504	Morocco 	Maroko	\N
00040000-55bf-4cc5-4908-59f719de4909	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55bf-4cc5-f49a-0fe4a99e9236	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55bf-4cc5-3e14-fc63ade55173	NA	NAM	516	Namibia 	Namibija	\N
00040000-55bf-4cc5-57ea-7e7ad8a4accc	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55bf-4cc5-b117-69d0207d7d32	NP	NPL	524	Nepal 	Nepal	\N
00040000-55bf-4cc5-517b-a1dc309c32e6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55bf-4cc5-d38e-b229fbba4652	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55bf-4cc5-bf53-19fdccbcdebe	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55bf-4cc5-9483-a11c827bfec6	NE	NER	562	Niger 	Niger 	\N
00040000-55bf-4cc5-1e06-222785472e26	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55bf-4cc5-0bae-32fc4df75789	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55bf-4cc5-ad76-3ae2802490c6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55bf-4cc5-5fca-9f719a964ebf	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55bf-4cc5-fdbf-f6bcc9217ebb	NO	NOR	578	Norway 	Norveška	\N
00040000-55bf-4cc5-ba06-70f23390c435	OM	OMN	512	Oman 	Oman	\N
00040000-55bf-4cc5-4ad7-cc6b3beb3bc5	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55bf-4cc5-c317-c3737ab2c500	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55bf-4cc5-167f-508d6045a467	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55bf-4cc5-411e-7fe96104b7fb	PA	PAN	591	Panama 	Panama	\N
00040000-55bf-4cc5-a1e7-2753200ca604	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55bf-4cc5-8936-80acb1fcd24a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55bf-4cc5-e7b5-1641a2b0e939	PE	PER	604	Peru 	Peru	\N
00040000-55bf-4cc5-61d7-1595cb936989	PH	PHL	608	Philippines 	Filipini	\N
00040000-55bf-4cc5-ca60-61bb009b5706	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55bf-4cc5-75e0-ddb69d815c3c	PL	POL	616	Poland 	Poljska	\N
00040000-55bf-4cc5-ec03-a261f4b36024	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55bf-4cc5-6716-e228431c736d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55bf-4cc5-9dff-dc7b0b8555cb	QA	QAT	634	Qatar 	Katar	\N
00040000-55bf-4cc5-e82c-5b300c389899	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55bf-4cc5-2545-fbb8fc22fc7d	RO	ROU	642	Romania 	Romunija	\N
00040000-55bf-4cc5-5f0f-77c7aa3f6c8e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55bf-4cc5-5df4-08743b814b4a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55bf-4cc5-61ed-2def84f10ac5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55bf-4cc5-428e-83239047a98b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55bf-4cc5-2f71-998cea40fc25	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55bf-4cc5-1660-c7dba80745f0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55bf-4cc5-b9bb-989a7a53b882	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55bf-4cc5-ef51-f7fb519bdd6d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55bf-4cc5-3feb-ce3fef45d2c4	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55bf-4cc5-c8d8-43c46785df11	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55bf-4cc5-1dee-15a5b2322260	SM	SMR	674	San Marino 	San Marino	\N
00040000-55bf-4cc5-7ecf-6910db4e0b1b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55bf-4cc5-e082-6301c36fe70f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55bf-4cc5-9649-c6a11bf8fe0d	SN	SEN	686	Senegal 	Senegal	\N
00040000-55bf-4cc5-94e0-b0c3f572bb28	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55bf-4cc5-b9f8-fb1b2187473d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55bf-4cc5-57b7-c3a0a9540588	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55bf-4cc5-3718-de7fe73795f7	SG	SGP	702	Singapore 	Singapur	\N
00040000-55bf-4cc5-9d54-c776e8987e21	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55bf-4cc5-dede-fa3d653119fe	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55bf-4cc5-7f12-880d1466fd62	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55bf-4cc5-8c30-237c920a5365	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55bf-4cc5-447f-7554ec40945e	SO	SOM	706	Somalia 	Somalija	\N
00040000-55bf-4cc5-70d7-9a8c8bc9584e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55bf-4cc5-08e8-293c5cf63e9b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55bf-4cc5-e9cf-7409f1bdd947	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55bf-4cc5-6a8f-3cc446ed00bc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55bf-4cc5-9dfb-8c50e5eb8fb9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55bf-4cc5-2cbf-3795f864ad7f	SD	SDN	729	Sudan 	Sudan	\N
00040000-55bf-4cc5-1f34-0942fcc67fef	SR	SUR	740	Suriname 	Surinam	\N
00040000-55bf-4cc5-ad6b-b0b82441c790	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55bf-4cc5-4852-8d6e16b4f959	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55bf-4cc5-32f4-b0e0f34e51f4	SE	SWE	752	Sweden 	Švedska	\N
00040000-55bf-4cc5-b598-d9e779b50c44	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55bf-4cc5-f7f8-ccb8bb222278	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55bf-4cc5-f51b-fb1b9403e6d8	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55bf-4cc5-faaa-4d2a7b54608b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55bf-4cc5-70d7-f2b326a0ccde	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55bf-4cc5-dea4-216d339b1bb0	TH	THA	764	Thailand 	Tajska	\N
00040000-55bf-4cc5-ca6f-d9867595e391	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55bf-4cc5-c527-f5567e7467b3	TG	TGO	768	Togo 	Togo	\N
00040000-55bf-4cc5-7b34-1647246cc6d9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55bf-4cc5-70c4-48c7f4e55257	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55bf-4cc5-9b34-5ab37b2da2e7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55bf-4cc5-0013-b10db681464d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55bf-4cc5-321c-6cdf2452fe4a	TR	TUR	792	Turkey 	Turčija	\N
00040000-55bf-4cc5-7c38-9e06731adf2e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55bf-4cc5-d88a-cab532d3c54f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-4cc5-7d87-19aee4a3b84e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55bf-4cc5-abd5-5e9a0f01a676	UG	UGA	800	Uganda 	Uganda	\N
00040000-55bf-4cc5-f8f5-7a34a58b6b94	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55bf-4cc5-3b23-afa993bc7b21	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55bf-4cc5-aa63-11a0e268af96	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55bf-4cc5-8878-b4a1f7277511	US	USA	840	United States 	Združene države Amerike	\N
00040000-55bf-4cc5-db5a-6a737fd79e70	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55bf-4cc5-2108-ec21f1796e4a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55bf-4cc5-e845-f51e4492d4df	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55bf-4cc5-d8e6-93296c0c3ad0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55bf-4cc5-b3fc-3d49d90d6791	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55bf-4cc5-c913-68eeb690f6ed	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55bf-4cc5-689b-51c113d5d73a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-4cc5-482d-73a4351ba45c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55bf-4cc5-bb37-8e870055fd9f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55bf-4cc5-3e8f-b9ecf70ad1d4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55bf-4cc5-6a12-e2f6a63b1ee6	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55bf-4cc5-abf7-b99a1ae49551	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55bf-4cc5-2382-a576935ff039	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3013 (class 0 OID 11515628)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55bf-4cc6-559a-03e42f41a12a	000e0000-55bf-4cc6-fa0a-12eea8c29e0b	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55bf-4cc5-e160-44db9347a193	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55bf-4cc6-dfaa-bef2dc4710b2	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55bf-4cc5-91e4-5995f2bcfda8	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-4cc6-f996-500e657c25be	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-4cc6-ba6b-90a07a20fe8b	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3000 (class 0 OID 11515455)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55bf-4cc6-5441-4fcec6d8ae5d	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55bf-4cc5-2716-f6ecdc2a7e6e
000d0000-55bf-4cc6-3941-d2bc06f17ba1	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-4cc5-2716-f6ecdc2a7e6e
000d0000-55bf-4cc6-cc66-2ef009183c84	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55bf-4cc5-db04-da1a8fd78281
000d0000-55bf-4cc6-0044-76c563d37fac	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55bf-4cc5-edac-6b63df720b98
000d0000-55bf-4cc6-e47d-8a95eb0246b2	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55bf-4cc5-0394-d071941ba5da
000d0000-55bf-4cc6-6cc9-0af1f50aa047	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55bf-4cc5-d3a3-c9b1f8472f16
000d0000-55bf-4cc6-6ac2-31ab370f570a	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-4cc5-2716-f6ecdc2a7e6e
000d0000-55bf-4cc6-fe15-e4682cf66496	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55bf-4cc5-0d57-a9e7eaa4a838
\.


--
-- TOC entry 2979 (class 0 OID 11515275)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 11515323)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 11515255)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55bf-4cc6-24a6-b84912a614ee	00080000-55bf-4cc6-6788-c85e09481597	00090000-55bf-4cc6-f28d-a8e37ae95c3c	AK		
\.


--
-- TOC entry 2954 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11515372)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11515810)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11515822)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11515845)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11515397)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 11515212)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55bf-4cc5-f91c-47cfef4e4902	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55bf-4cc5-5a30-1bc5c400dde7	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55bf-4cc5-5334-e98cc43742a6	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55bf-4cc5-4742-512c4aa3b84d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55bf-4cc5-b685-da5facc5717e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55bf-4cc5-b974-96bda7373f63	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55bf-4cc5-9d7c-d81c5397d82b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55bf-4cc5-1369-e107e0846d2d	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-4cc5-9ba6-88675231b792	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-4cc5-4ce6-7b6456eee963	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55bf-4cc5-68d9-985e32239251	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55bf-4cc5-4d39-bd7a7ad07a07	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55bf-4cc5-3e42-41b76065ae6c	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55bf-4cc5-c466-529d2ec80759	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55bf-4cc6-a7ad-78b1f0ff6a99	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55bf-4cc6-66ea-ca69025e6435	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55bf-4cc6-fc3c-e00bdb73bd35	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55bf-4cc6-797f-12fc32a337ab	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55bf-4cc6-2d8a-c882df939fb1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55bf-4cc6-4969-811ff39f4e3b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2968 (class 0 OID 11515125)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55bf-4cc6-cd2a-9e7b377a0482	00000000-55bf-4cc6-66ea-ca69025e6435	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55bf-4cc6-2edd-abdfc0359322	00000000-55bf-4cc6-66ea-ca69025e6435	00010000-55bf-4cc5-6f69-d64cc37d5af6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55bf-4cc6-5189-bb80f160fc9c	00000000-55bf-4cc6-fc3c-e00bdb73bd35	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2969 (class 0 OID 11515136)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55bf-4cc6-b6f9-bc8840516c18	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55bf-4cc6-a338-3299dcf3c667	00010000-55bf-4cc6-5cfa-1bc0246f7707	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55bf-4cc6-1256-0d11978bd57f	00010000-55bf-4cc6-5ea2-9e92fcb95d4d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55bf-4cc6-eda4-741bbd40c9bb	00010000-55bf-4cc6-5375-5782fcb10b37	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55bf-4cc6-9f2d-dfe8ced50a1f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55bf-4cc6-0938-6b50c223f402	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55bf-4cc6-7952-bf638d881e7a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55bf-4cc6-6e44-3c35417459fa	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55bf-4cc6-f28d-a8e37ae95c3c	00010000-55bf-4cc6-e4aa-56ed227fdd84	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55bf-4cc6-5850-644e2e652ec6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55bf-4cc6-9aec-8303495edefc	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55bf-4cc6-a388-1923bf8d56c8	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55bf-4cc6-b900-262b7bd2cebc	00010000-55bf-4cc6-f6d2-ec0a11abea48	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 11515090)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55bf-4cc5-78d4-b69e95daae8f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55bf-4cc5-2bec-d3fa37b6516a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55bf-4cc5-4200-82ee4f8f747c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55bf-4cc5-bb48-b0221321d546	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55bf-4cc5-d3c1-e8e75294ef28	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55bf-4cc5-8ffa-17f077afc858	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55bf-4cc5-dc6e-87283766c8db	Abonma-read	Abonma - branje	f
00030000-55bf-4cc5-f789-cff60dcafeeb	Abonma-write	Abonma - spreminjanje	f
00030000-55bf-4cc5-4fe4-0d9c570f588d	Alternacija-read	Alternacija - branje	f
00030000-55bf-4cc5-b4a0-acdb02481b2b	Alternacija-write	Alternacija - spreminjanje	f
00030000-55bf-4cc5-533c-0d6ad9173abd	Arhivalija-read	Arhivalija - branje	f
00030000-55bf-4cc5-9d3b-be8b0a011c0e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55bf-4cc5-0c4b-cc37b3abff07	Besedilo-read	Besedilo - branje	f
00030000-55bf-4cc5-26da-3a06e7c5f8fa	Besedilo-write	Besedilo - spreminjanje	f
00030000-55bf-4cc5-15c9-3e36ce115a2b	DogodekIzven-read	DogodekIzven - branje	f
00030000-55bf-4cc5-1193-e5d159a5caa9	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55bf-4cc5-4afb-82bf20183513	Dogodek-read	Dogodek - branje	f
00030000-55bf-4cc5-d9d1-d687b91c2a62	Dogodek-write	Dogodek - spreminjanje	f
00030000-55bf-4cc5-a794-dd7ae6e8f63b	DrugiVir-read	DrugiVir - branje	f
00030000-55bf-4cc5-9b0c-5062c7bc6bec	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55bf-4cc5-b56e-b1dd6e1dbfbb	Drzava-read	Drzava - branje	f
00030000-55bf-4cc5-9b65-6a56a18aa7c3	Drzava-write	Drzava - spreminjanje	f
00030000-55bf-4cc5-ee73-1f1581b4accb	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55bf-4cc5-22de-0e872ffa6de7	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55bf-4cc5-ed3d-b6f63eccc378	Funkcija-read	Funkcija - branje	f
00030000-55bf-4cc5-a5d7-e3398824dcb0	Funkcija-write	Funkcija - spreminjanje	f
00030000-55bf-4cc5-23fd-a0c1eecf8f89	Gostovanje-read	Gostovanje - branje	f
00030000-55bf-4cc5-1c4b-9ceb4920a6d3	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55bf-4cc5-605d-abeaa4417c9f	Gostujoca-read	Gostujoca - branje	f
00030000-55bf-4cc5-46b4-97a25461cab3	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55bf-4cc5-42e7-3b71b15bce36	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55bf-4cc5-dd3c-c5673ab17cd5	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55bf-4cc5-3b60-12ff90e92d3a	Kupec-read	Kupec - branje	f
00030000-55bf-4cc5-e153-1f8fbb7f711c	Kupec-write	Kupec - spreminjanje	f
00030000-55bf-4cc5-d79b-614a29924639	NacinPlacina-read	NacinPlacina - branje	f
00030000-55bf-4cc5-6acb-1dcd6ca095e4	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55bf-4cc5-f5e7-35584eca1f3f	Option-read	Option - branje	f
00030000-55bf-4cc5-16fb-c48a1e8d526f	Option-write	Option - spreminjanje	f
00030000-55bf-4cc5-aeb6-c3f99199f8e2	OptionValue-read	OptionValue - branje	f
00030000-55bf-4cc5-f0ef-cb13675bb655	OptionValue-write	OptionValue - spreminjanje	f
00030000-55bf-4cc5-e247-a281be34cbad	Oseba-read	Oseba - branje	f
00030000-55bf-4cc5-d5b5-70e041a18352	Oseba-write	Oseba - spreminjanje	f
00030000-55bf-4cc5-a4d3-75b402d53973	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55bf-4cc5-d1a2-36c812e63652	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55bf-4cc5-e344-6e7635960aa1	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55bf-4cc5-ed08-5fec0a0cf505	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55bf-4cc5-d04d-4aebc751cda1	Pogodba-read	Pogodba - branje	f
00030000-55bf-4cc5-dab0-7f278e68c54c	Pogodba-write	Pogodba - spreminjanje	f
00030000-55bf-4cc5-5119-98e8d7eccef7	Popa-read	Popa - branje	f
00030000-55bf-4cc5-2118-2789e8ab36a8	Popa-write	Popa - spreminjanje	f
00030000-55bf-4cc5-01a1-ff5fa47964b7	Posta-read	Posta - branje	f
00030000-55bf-4cc5-cafe-89f71702d83f	Posta-write	Posta - spreminjanje	f
00030000-55bf-4cc5-d447-96f17c27f404	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55bf-4cc5-85fb-15863b451855	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55bf-4cc5-c331-cc379f2421a2	PostniNaslov-read	PostniNaslov - branje	f
00030000-55bf-4cc5-db50-9a2424f0b75d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55bf-4cc5-67cc-cceebab8e8b5	Predstava-read	Predstava - branje	f
00030000-55bf-4cc5-a78b-f023bab5e9ea	Predstava-write	Predstava - spreminjanje	f
00030000-55bf-4cc5-894c-1f35c14079e6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55bf-4cc5-1b0e-7a4887842e3d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55bf-4cc5-4b75-af040d4ba34b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55bf-4cc5-9b20-58981d5188d0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55bf-4cc5-4d6e-0029ced40b37	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55bf-4cc5-7831-984a815f5226	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55bf-4cc5-6994-5cdc3e42981e	ProgramDela-read	ProgramDela - branje	f
00030000-55bf-4cc5-f8cb-a2025c46f76c	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55bf-4cc5-31c1-bcb6c5aa4dc9	ProgramFestival-read	ProgramFestival - branje	f
00030000-55bf-4cc5-9798-2c03f8108222	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55bf-4cc5-2c26-5f51092af8cc	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55bf-4cc5-f48d-db70c1e17ef8	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55bf-4cc5-06c3-c8fdc7585a4d	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55bf-4cc5-3a6a-262c9a9b2992	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55bf-4cc5-77ca-106284c18207	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55bf-4cc5-bb3a-285cbe23d6c3	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55bf-4cc5-1864-1497e89f9972	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55bf-4cc5-5793-d45bed64c8ff	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55bf-4cc5-3abc-590505346b3a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55bf-4cc5-faff-47bc3b514570	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55bf-4cc5-a3fa-d3c2711c1aa2	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55bf-4cc5-d335-5bf20234c424	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55bf-4cc5-88fb-23aa15ad3e95	ProgramRazno-read	ProgramRazno - branje	f
00030000-55bf-4cc5-46f1-152e939d6313	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55bf-4cc5-fec8-05e947b14bb9	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55bf-4cc5-9321-a20dc0e33d56	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55bf-4cc5-28e0-0f178b31b132	Prostor-read	Prostor - branje	f
00030000-55bf-4cc5-295c-ddb9a29add7b	Prostor-write	Prostor - spreminjanje	f
00030000-55bf-4cc5-8e71-72eca56589aa	Racun-read	Racun - branje	f
00030000-55bf-4cc5-f7b8-8c793cf738f1	Racun-write	Racun - spreminjanje	f
00030000-55bf-4cc5-d2c7-46b422e40a27	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55bf-4cc5-2dae-7405182bc312	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55bf-4cc5-079d-b7ca97d64bc7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55bf-4cc5-bfe9-d9c03edd3edb	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55bf-4cc5-a19f-b26a03e853d3	Rekvizit-read	Rekvizit - branje	f
00030000-55bf-4cc5-49f8-1dd9f6f63b0f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55bf-4cc5-6b01-1e6539c3bd7c	Revizija-read	Revizija - branje	f
00030000-55bf-4cc5-c6cc-8b2a10e1ac05	Revizija-write	Revizija - spreminjanje	f
00030000-55bf-4cc5-4bf2-73eb8ce978f8	Rezervacija-read	Rezervacija - branje	f
00030000-55bf-4cc5-d122-83fb9bb90bca	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55bf-4cc5-3ec0-d349e843f61a	SedezniRed-read	SedezniRed - branje	f
00030000-55bf-4cc5-cd51-cc68c5d86ed7	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55bf-4cc5-40f1-70345adafd9e	Sedez-read	Sedez - branje	f
00030000-55bf-4cc5-2022-e0774ad9dd5c	Sedez-write	Sedez - spreminjanje	f
00030000-55bf-4cc5-07c3-89a19ca379d9	Sezona-read	Sezona - branje	f
00030000-55bf-4cc5-d261-57c1cad26ab3	Sezona-write	Sezona - spreminjanje	f
00030000-55bf-4cc5-1247-6d2748027741	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55bf-4cc5-be21-59c7461ed961	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55bf-4cc5-c816-85f8a81c05b6	Stevilcenje-read	Stevilcenje - branje	f
00030000-55bf-4cc5-c0c9-dbf805e529e1	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55bf-4cc5-8da3-3e0ec2612dd6	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55bf-4cc5-39dc-a936876f7bc4	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55bf-4cc5-07ee-38730a5d3524	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55bf-4cc5-ebde-e0e66d8ae7a2	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55bf-4cc5-dfa8-152e5ce37301	Telefonska-read	Telefonska - branje	f
00030000-55bf-4cc5-23c8-2d7bd4c44400	Telefonska-write	Telefonska - spreminjanje	f
00030000-55bf-4cc5-5b33-da38edc648d3	TerminStoritve-read	TerminStoritve - branje	f
00030000-55bf-4cc5-f225-337f3734c686	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55bf-4cc5-2a08-8d28656a6383	TipFunkcije-read	TipFunkcije - branje	f
00030000-55bf-4cc5-8bac-c3b4bd6a271b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55bf-4cc5-401e-60bd76b2e33b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55bf-4cc5-0bf6-3cd2a795f578	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55bf-4cc5-bc8f-9c6232f19d11	Trr-read	Trr - branje	f
00030000-55bf-4cc5-d233-1e6552855d13	Trr-write	Trr - spreminjanje	f
00030000-55bf-4cc5-6d4c-2122e1c6d5e7	Uprizoritev-read	Uprizoritev - branje	f
00030000-55bf-4cc5-9dff-c034c5b382cb	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55bf-4cc5-0452-e36a7a657800	Vaja-read	Vaja - branje	f
00030000-55bf-4cc5-2800-c981e83532d1	Vaja-write	Vaja - spreminjanje	f
00030000-55bf-4cc5-5498-705a02742ff5	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55bf-4cc5-825e-64c54ccf55d2	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55bf-4cc5-f559-665b6abd3426	Zaposlitev-read	Zaposlitev - branje	f
00030000-55bf-4cc5-d543-194a3e234176	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55bf-4cc5-11ed-a74762bf0e33	Zasedenost-read	Zasedenost - branje	f
00030000-55bf-4cc5-a18f-53283c68f8a7	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55bf-4cc5-950e-c23b718442f1	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55bf-4cc5-6bd5-e7395ae3f4cd	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55bf-4cc5-ba2d-80c7ebb696c3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55bf-4cc5-b6d7-f01c045c415b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55bf-4cc5-f233-6bbeb0b494a3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55bf-4cc5-cd8c-697133c42f8f	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55bf-4cc5-ab1f-ba8de362e00f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55bf-4cc5-a0a3-86c45d0c1e78	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55bf-4cc5-069e-66ecf667f044	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-4cc5-9c32-06f1c3bd3385	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-4cc5-18be-c170db8b4f4b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-4cc5-c5ff-90b0110a914c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-4cc5-3939-81b273e2ae05	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55bf-4cc5-2aee-f308048218cc	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55bf-4cc5-0ad4-b82342854e7b	Datoteka-write	Datoteka - spreminjanje	f
00030000-55bf-4cc5-1f85-6c5c99891544	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2966 (class 0 OID 11515109)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55bf-4cc5-1dc2-9a3789ab996c	00030000-55bf-4cc5-2bec-d3fa37b6516a
00020000-55bf-4cc5-5ed9-8d850f82a244	00030000-55bf-4cc5-b56e-b1dd6e1dbfbb
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-dc6e-87283766c8db
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-f789-cff60dcafeeb
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-4fe4-0d9c570f588d
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-b4a0-acdb02481b2b
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-533c-0d6ad9173abd
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-4afb-82bf20183513
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-bb48-b0221321d546
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-d9d1-d687b91c2a62
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-b56e-b1dd6e1dbfbb
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-9b65-6a56a18aa7c3
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-ed3d-b6f63eccc378
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-a5d7-e3398824dcb0
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-23fd-a0c1eecf8f89
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-1c4b-9ceb4920a6d3
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-605d-abeaa4417c9f
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-46b4-97a25461cab3
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-42e7-3b71b15bce36
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-dd3c-c5673ab17cd5
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-f5e7-35584eca1f3f
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-aeb6-c3f99199f8e2
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-e247-a281be34cbad
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-d5b5-70e041a18352
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-5119-98e8d7eccef7
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-2118-2789e8ab36a8
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-01a1-ff5fa47964b7
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-cafe-89f71702d83f
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-c331-cc379f2421a2
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-db50-9a2424f0b75d
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-67cc-cceebab8e8b5
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-a78b-f023bab5e9ea
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-4d6e-0029ced40b37
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-7831-984a815f5226
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-28e0-0f178b31b132
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-295c-ddb9a29add7b
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-079d-b7ca97d64bc7
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-bfe9-d9c03edd3edb
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-a19f-b26a03e853d3
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-49f8-1dd9f6f63b0f
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-07c3-89a19ca379d9
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-d261-57c1cad26ab3
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-2a08-8d28656a6383
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-6d4c-2122e1c6d5e7
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-9dff-c034c5b382cb
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-0452-e36a7a657800
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-2800-c981e83532d1
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-11ed-a74762bf0e33
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-a18f-53283c68f8a7
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-950e-c23b718442f1
00020000-55bf-4cc5-1b22-09a1150ecafd	00030000-55bf-4cc5-ba2d-80c7ebb696c3
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-dc6e-87283766c8db
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-533c-0d6ad9173abd
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-4afb-82bf20183513
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-b56e-b1dd6e1dbfbb
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-23fd-a0c1eecf8f89
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-605d-abeaa4417c9f
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-42e7-3b71b15bce36
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-dd3c-c5673ab17cd5
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-f5e7-35584eca1f3f
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-aeb6-c3f99199f8e2
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-e247-a281be34cbad
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-d5b5-70e041a18352
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-5119-98e8d7eccef7
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-01a1-ff5fa47964b7
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-c331-cc379f2421a2
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-db50-9a2424f0b75d
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-67cc-cceebab8e8b5
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-28e0-0f178b31b132
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-079d-b7ca97d64bc7
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-a19f-b26a03e853d3
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-07c3-89a19ca379d9
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-dfa8-152e5ce37301
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-23c8-2d7bd4c44400
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-bc8f-9c6232f19d11
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-d233-1e6552855d13
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-f559-665b6abd3426
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-d543-194a3e234176
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-950e-c23b718442f1
00020000-55bf-4cc5-dcfc-12293699d63f	00030000-55bf-4cc5-ba2d-80c7ebb696c3
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-dc6e-87283766c8db
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-4fe4-0d9c570f588d
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-533c-0d6ad9173abd
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-9d3b-be8b0a011c0e
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-0c4b-cc37b3abff07
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-15c9-3e36ce115a2b
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-4afb-82bf20183513
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-b56e-b1dd6e1dbfbb
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-ed3d-b6f63eccc378
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-23fd-a0c1eecf8f89
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-605d-abeaa4417c9f
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-42e7-3b71b15bce36
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-f5e7-35584eca1f3f
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-aeb6-c3f99199f8e2
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-e247-a281be34cbad
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-5119-98e8d7eccef7
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-01a1-ff5fa47964b7
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-67cc-cceebab8e8b5
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-4d6e-0029ced40b37
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-28e0-0f178b31b132
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-079d-b7ca97d64bc7
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-a19f-b26a03e853d3
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-07c3-89a19ca379d9
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-2a08-8d28656a6383
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-0452-e36a7a657800
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-11ed-a74762bf0e33
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-950e-c23b718442f1
00020000-55bf-4cc5-525c-1f0e2039e9d6	00030000-55bf-4cc5-ba2d-80c7ebb696c3
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-dc6e-87283766c8db
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-f789-cff60dcafeeb
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-b4a0-acdb02481b2b
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-533c-0d6ad9173abd
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-4afb-82bf20183513
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-b56e-b1dd6e1dbfbb
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-23fd-a0c1eecf8f89
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-605d-abeaa4417c9f
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-f5e7-35584eca1f3f
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-aeb6-c3f99199f8e2
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-5119-98e8d7eccef7
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-01a1-ff5fa47964b7
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-67cc-cceebab8e8b5
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-28e0-0f178b31b132
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-079d-b7ca97d64bc7
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-a19f-b26a03e853d3
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-07c3-89a19ca379d9
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-2a08-8d28656a6383
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-950e-c23b718442f1
00020000-55bf-4cc5-10dd-ae65596e921a	00030000-55bf-4cc5-ba2d-80c7ebb696c3
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-dc6e-87283766c8db
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-533c-0d6ad9173abd
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-4afb-82bf20183513
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-b56e-b1dd6e1dbfbb
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-23fd-a0c1eecf8f89
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-605d-abeaa4417c9f
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-f5e7-35584eca1f3f
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-aeb6-c3f99199f8e2
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-5119-98e8d7eccef7
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-01a1-ff5fa47964b7
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-67cc-cceebab8e8b5
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-28e0-0f178b31b132
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-079d-b7ca97d64bc7
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-a19f-b26a03e853d3
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-07c3-89a19ca379d9
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-5b33-da38edc648d3
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-4200-82ee4f8f747c
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-2a08-8d28656a6383
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-950e-c23b718442f1
00020000-55bf-4cc5-ed4d-3e60512787f8	00030000-55bf-4cc5-ba2d-80c7ebb696c3
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-78d4-b69e95daae8f
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-2bec-d3fa37b6516a
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-4200-82ee4f8f747c
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-bb48-b0221321d546
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d3c1-e8e75294ef28
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-8ffa-17f077afc858
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-dc6e-87283766c8db
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-f789-cff60dcafeeb
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-4fe4-0d9c570f588d
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-b4a0-acdb02481b2b
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-533c-0d6ad9173abd
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-9d3b-be8b0a011c0e
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-0c4b-cc37b3abff07
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-26da-3a06e7c5f8fa
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-15c9-3e36ce115a2b
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-1193-e5d159a5caa9
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-4afb-82bf20183513
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d9d1-d687b91c2a62
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-b56e-b1dd6e1dbfbb
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-9b65-6a56a18aa7c3
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-a794-dd7ae6e8f63b
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-9b0c-5062c7bc6bec
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-ee73-1f1581b4accb
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-22de-0e872ffa6de7
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-ed3d-b6f63eccc378
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-a5d7-e3398824dcb0
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-23fd-a0c1eecf8f89
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-1c4b-9ceb4920a6d3
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-605d-abeaa4417c9f
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-46b4-97a25461cab3
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-42e7-3b71b15bce36
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-dd3c-c5673ab17cd5
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-3b60-12ff90e92d3a
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-e153-1f8fbb7f711c
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d79b-614a29924639
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-6acb-1dcd6ca095e4
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-f5e7-35584eca1f3f
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-16fb-c48a1e8d526f
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-aeb6-c3f99199f8e2
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-f0ef-cb13675bb655
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-e247-a281be34cbad
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d5b5-70e041a18352
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-a4d3-75b402d53973
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d1a2-36c812e63652
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-e344-6e7635960aa1
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-ed08-5fec0a0cf505
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d04d-4aebc751cda1
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-dab0-7f278e68c54c
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-5119-98e8d7eccef7
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-2118-2789e8ab36a8
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-01a1-ff5fa47964b7
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-cafe-89f71702d83f
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d447-96f17c27f404
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-85fb-15863b451855
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-c331-cc379f2421a2
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-db50-9a2424f0b75d
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-67cc-cceebab8e8b5
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-a78b-f023bab5e9ea
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-894c-1f35c14079e6
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-1b0e-7a4887842e3d
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-4b75-af040d4ba34b
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-9b20-58981d5188d0
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-4d6e-0029ced40b37
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-7831-984a815f5226
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-6994-5cdc3e42981e
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-f8cb-a2025c46f76c
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-31c1-bcb6c5aa4dc9
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-9798-2c03f8108222
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-2c26-5f51092af8cc
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-f48d-db70c1e17ef8
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-06c3-c8fdc7585a4d
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-3a6a-262c9a9b2992
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-77ca-106284c18207
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-bb3a-285cbe23d6c3
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-1864-1497e89f9972
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-5793-d45bed64c8ff
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-3abc-590505346b3a
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-faff-47bc3b514570
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-a3fa-d3c2711c1aa2
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d335-5bf20234c424
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-88fb-23aa15ad3e95
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-46f1-152e939d6313
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-fec8-05e947b14bb9
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-9321-a20dc0e33d56
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-28e0-0f178b31b132
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-295c-ddb9a29add7b
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-8e71-72eca56589aa
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-f7b8-8c793cf738f1
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d2c7-46b422e40a27
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-2dae-7405182bc312
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-079d-b7ca97d64bc7
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-bfe9-d9c03edd3edb
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-a19f-b26a03e853d3
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-49f8-1dd9f6f63b0f
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-6b01-1e6539c3bd7c
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-c6cc-8b2a10e1ac05
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-4bf2-73eb8ce978f8
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d122-83fb9bb90bca
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-3ec0-d349e843f61a
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-cd51-cc68c5d86ed7
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-40f1-70345adafd9e
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-2022-e0774ad9dd5c
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-07c3-89a19ca379d9
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d261-57c1cad26ab3
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-1247-6d2748027741
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-be21-59c7461ed961
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-c816-85f8a81c05b6
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-c0c9-dbf805e529e1
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-8da3-3e0ec2612dd6
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-39dc-a936876f7bc4
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-07ee-38730a5d3524
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-ebde-e0e66d8ae7a2
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-dfa8-152e5ce37301
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-23c8-2d7bd4c44400
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-5b33-da38edc648d3
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-f225-337f3734c686
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-2a08-8d28656a6383
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-8bac-c3b4bd6a271b
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-401e-60bd76b2e33b
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-0bf6-3cd2a795f578
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-bc8f-9c6232f19d11
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d233-1e6552855d13
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-6d4c-2122e1c6d5e7
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-9dff-c034c5b382cb
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-0452-e36a7a657800
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-2800-c981e83532d1
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-5498-705a02742ff5
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-825e-64c54ccf55d2
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-f559-665b6abd3426
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-d543-194a3e234176
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-11ed-a74762bf0e33
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-a18f-53283c68f8a7
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-950e-c23b718442f1
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-6bd5-e7395ae3f4cd
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-ba2d-80c7ebb696c3
00020000-55bf-4cc6-edfa-31119c8d51dd	00030000-55bf-4cc5-b6d7-f01c045c415b
\.


--
-- TOC entry 2994 (class 0 OID 11515404)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 11515435)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 11515549)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55bf-4cc6-f863-b6575d0456df	00090000-55bf-4cc6-b6f9-bc8840516c18	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55bf-4cc6-27ab-7cd2bc9cea6b	00090000-55bf-4cc6-0938-6b50c223f402	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55bf-4cc6-4251-4288aafdca9c	00090000-55bf-4cc6-b900-262b7bd2cebc	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2971 (class 0 OID 11515169)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55bf-4cc6-6788-c85e09481597	00040000-55bf-4cc5-7f12-880d1466fd62	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4cc6-5966-021e0d532864	00040000-55bf-4cc5-7f12-880d1466fd62	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55bf-4cc6-9e34-460efb39f644	00040000-55bf-4cc5-7f12-880d1466fd62	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4cc6-7816-4932326cebf0	00040000-55bf-4cc5-7f12-880d1466fd62	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4cc6-0f33-af749eca61d1	00040000-55bf-4cc5-7f12-880d1466fd62	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4cc6-a6ac-5edaef935fb5	00040000-55bf-4cc5-2cd5-fbfe13ecbd5c	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4cc6-d391-66d050c96812	00040000-55bf-4cc5-6584-dfbc904e884e	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4cc6-eea9-3ec047709850	00040000-55bf-4cc5-4272-faa61de6ddd7	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-4cc6-6173-364126b0077e	00040000-55bf-4cc5-7f12-880d1466fd62	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2973 (class 0 OID 11515204)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55bf-4cc5-6970-9bb8d05f5f2b	8341	Adlešiči
00050000-55bf-4cc5-fd4d-da2a215ed3e6	5270	Ajdovščina
00050000-55bf-4cc5-2049-263ff9850b94	6280	Ankaran/Ancarano
00050000-55bf-4cc5-b2fa-a4df35bca46e	9253	Apače
00050000-55bf-4cc5-9ddf-d55c454bfcfe	8253	Artiče
00050000-55bf-4cc5-2ea9-733cfa34a211	4275	Begunje na Gorenjskem
00050000-55bf-4cc5-baf1-84c49fdd07de	1382	Begunje pri Cerknici
00050000-55bf-4cc5-741e-8167fd0b09c9	9231	Beltinci
00050000-55bf-4cc5-003c-46fcab34acc3	2234	Benedikt
00050000-55bf-4cc5-992a-a2d003994702	2345	Bistrica ob Dravi
00050000-55bf-4cc5-b37b-a77143a286b2	3256	Bistrica ob Sotli
00050000-55bf-4cc5-7c32-7dd0ed3c4061	8259	Bizeljsko
00050000-55bf-4cc5-c4bc-a55b772365b3	1223	Blagovica
00050000-55bf-4cc5-aac6-56d910cc6886	8283	Blanca
00050000-55bf-4cc5-de46-6d2fc9c8f3e9	4260	Bled
00050000-55bf-4cc5-afc9-821c76fba1ad	4273	Blejska Dobrava
00050000-55bf-4cc5-2707-1d004571b160	9265	Bodonci
00050000-55bf-4cc5-f820-2500f3c1030d	9222	Bogojina
00050000-55bf-4cc5-a208-c51dcd96931a	4263	Bohinjska Bela
00050000-55bf-4cc5-fb12-42d4c684a762	4264	Bohinjska Bistrica
00050000-55bf-4cc5-6add-f2d29faa0c5c	4265	Bohinjsko jezero
00050000-55bf-4cc5-bd46-514ddf60915e	1353	Borovnica
00050000-55bf-4cc5-678f-a41fe9a58d0d	8294	Boštanj
00050000-55bf-4cc5-4821-c7d01992e290	5230	Bovec
00050000-55bf-4cc5-3379-868bc558b0d0	5295	Branik
00050000-55bf-4cc5-31ed-5f0c5a0cd95b	3314	Braslovče
00050000-55bf-4cc5-e9ed-f01624727657	5223	Breginj
00050000-55bf-4cc5-2f2d-464b0daf6544	8280	Brestanica
00050000-55bf-4cc5-eca6-214fb1d8eef7	2354	Bresternica
00050000-55bf-4cc5-ec2e-ee08f1a92c22	4243	Brezje
00050000-55bf-4cc5-a42a-266d1f9fff2f	1351	Brezovica pri Ljubljani
00050000-55bf-4cc5-c50d-752efc30eefe	8250	Brežice
00050000-55bf-4cc5-f51d-c67b6556e8ea	4210	Brnik - Aerodrom
00050000-55bf-4cc5-856a-3442715c9206	8321	Brusnice
00050000-55bf-4cc5-80d0-81c8a9aa9906	3255	Buče
00050000-55bf-4cc5-ee8a-bd54d2bd9727	8276	Bučka 
00050000-55bf-4cc5-ff11-9e4ef973f987	9261	Cankova
00050000-55bf-4cc5-5215-7c8f247ed5b8	3000	Celje 
00050000-55bf-4cc5-9829-983c7a2ff510	3001	Celje - poštni predali
00050000-55bf-4cc5-5a54-ded09a229413	4207	Cerklje na Gorenjskem
00050000-55bf-4cc5-d94a-4c020a0edb40	8263	Cerklje ob Krki
00050000-55bf-4cc5-0dd0-78d4198c7f8d	1380	Cerknica
00050000-55bf-4cc5-aecd-45699d821d5a	5282	Cerkno
00050000-55bf-4cc5-9284-044a7e9fa806	2236	Cerkvenjak
00050000-55bf-4cc5-5ddc-727434342a72	2215	Ceršak
00050000-55bf-4cc5-b89f-d1b7a886d522	2326	Cirkovce
00050000-55bf-4cc5-f27f-cd605cb928b4	2282	Cirkulane
00050000-55bf-4cc5-90b2-af58e99ea13f	5273	Col
00050000-55bf-4cc5-abca-88816bd57b4a	8251	Čatež ob Savi
00050000-55bf-4cc5-27c0-2187a70b92f0	1413	Čemšenik
00050000-55bf-4cc5-99f6-758d742f2510	5253	Čepovan
00050000-55bf-4cc5-17ae-3baf595eb376	9232	Črenšovci
00050000-55bf-4cc5-869a-166fc66284f0	2393	Črna na Koroškem
00050000-55bf-4cc5-1ecf-7f16bc1d6509	6275	Črni Kal
00050000-55bf-4cc5-b30f-98331739da62	5274	Črni Vrh nad Idrijo
00050000-55bf-4cc5-ec48-127c11386482	5262	Črniče
00050000-55bf-4cc5-e2c7-110368a81be8	8340	Črnomelj
00050000-55bf-4cc5-2653-aa0fdac90331	6271	Dekani
00050000-55bf-4cc5-db1e-a9a8b4fd32bd	5210	Deskle
00050000-55bf-4cc5-806a-862f0d90beaf	2253	Destrnik
00050000-55bf-4cc5-6d9b-53a63d9d0e91	6215	Divača
00050000-55bf-4cc5-cfdb-87524e024755	1233	Dob
00050000-55bf-4cc5-c07a-3f5fb4066b90	3224	Dobje pri Planini
00050000-55bf-4cc5-7bef-229dbd824a8f	8257	Dobova
00050000-55bf-4cc5-5b6f-b4f749ebc4de	1423	Dobovec
00050000-55bf-4cc5-e8a8-25b056ecf6f2	5263	Dobravlje
00050000-55bf-4cc5-f97c-82f8266a489b	3204	Dobrna
00050000-55bf-4cc5-260a-ebe5faf7d47b	8211	Dobrnič
00050000-55bf-4cc5-d594-6b5b0ecefa0c	1356	Dobrova
00050000-55bf-4cc5-f30d-5ff167b0c173	9223	Dobrovnik/Dobronak 
00050000-55bf-4cc5-9e0c-14114fe1ae8d	5212	Dobrovo v Brdih
00050000-55bf-4cc5-acf0-9677102edc2f	1431	Dol pri Hrastniku
00050000-55bf-4cc5-eef6-fcd67abc582c	1262	Dol pri Ljubljani
00050000-55bf-4cc5-2291-bba4a7b43b3f	1273	Dole pri Litiji
00050000-55bf-4cc5-9d45-b56e85b62e91	1331	Dolenja vas
00050000-55bf-4cc5-4f10-1491368fa354	8350	Dolenjske Toplice
00050000-55bf-4cc5-90ad-32a51e84e1a7	1230	Domžale
00050000-55bf-4cc5-6a9c-e4cd3a51fd9d	2252	Dornava
00050000-55bf-4cc5-5598-e95e10572624	5294	Dornberk
00050000-55bf-4cc5-f688-7dfc9da85c33	1319	Draga
00050000-55bf-4cc5-9b3a-55ee5a4ceaba	8343	Dragatuš
00050000-55bf-4cc5-1f0a-0df12603d054	3222	Dramlje
00050000-55bf-4cc5-38f2-7779d5f4656b	2370	Dravograd
00050000-55bf-4cc5-e2d2-36175ff6d765	4203	Duplje
00050000-55bf-4cc5-089f-55174eb97d4d	6221	Dutovlje
00050000-55bf-4cc5-55cb-89365a68c903	8361	Dvor
00050000-55bf-4cc5-27fd-93cb3351b34c	2343	Fala
00050000-55bf-4cc5-7135-5930e0d0f2e4	9208	Fokovci
00050000-55bf-4cc5-6d1e-53ed63e0edd4	2313	Fram
00050000-55bf-4cc5-0812-173134c1cbc0	3213	Frankolovo
00050000-55bf-4cc5-50eb-9fe54b3dba92	1274	Gabrovka
00050000-55bf-4cc5-4d99-0a8be42c4ecd	8254	Globoko
00050000-55bf-4cc5-1ccc-19b01d493afb	5275	Godovič
00050000-55bf-4cc5-7105-1abbdb994737	4204	Golnik
00050000-55bf-4cc5-630a-56b3ee53673c	3303	Gomilsko
00050000-55bf-4cc5-1cc6-2d526aa0ce13	4224	Gorenja vas
00050000-55bf-4cc5-92b8-c668b0c43c5a	3263	Gorica pri Slivnici
00050000-55bf-4cc5-a33f-6e2f350dfdcb	2272	Gorišnica
00050000-55bf-4cc5-8ea0-87ce662f0c6e	9250	Gornja Radgona
00050000-55bf-4cc5-5c0e-0f6298aa44b8	3342	Gornji Grad
00050000-55bf-4cc5-b8b1-f122b78a4c0c	4282	Gozd Martuljek
00050000-55bf-4cc5-c03c-99bd4ebbc565	6272	Gračišče
00050000-55bf-4cc5-e628-71455125d20f	9264	Grad
00050000-55bf-4cc5-4841-78f951d95bac	8332	Gradac
00050000-55bf-4cc5-dedf-4573b7b7e751	1384	Grahovo
00050000-55bf-4cc5-0efb-d8eeca8ed8fb	5242	Grahovo ob Bači
00050000-55bf-4cc5-54ca-c52d07f95aa1	5251	Grgar
00050000-55bf-4cc5-bb37-844547a906f6	3302	Griže
00050000-55bf-4cc5-5007-a461fbd1a9d6	3231	Grobelno
00050000-55bf-4cc5-6532-1059def7e1f4	1290	Grosuplje
00050000-55bf-4cc5-0a07-80351004187e	2288	Hajdina
00050000-55bf-4cc5-f592-a124b805808f	8362	Hinje
00050000-55bf-4cc5-251e-d02fd53c29c4	2311	Hoče
00050000-55bf-4cc5-0b57-76d9d231ad38	9205	Hodoš/Hodos
00050000-55bf-4cc5-600b-e79530baa558	1354	Horjul
00050000-55bf-4cc5-69fa-1904870025e6	1372	Hotedršica
00050000-55bf-4cc5-ef77-57676d75ae9b	1430	Hrastnik
00050000-55bf-4cc5-ed1a-23ffc900753c	6225	Hruševje
00050000-55bf-4cc5-5030-3991a2b5dbed	4276	Hrušica
00050000-55bf-4cc5-ca8b-64f59b08d08d	5280	Idrija
00050000-55bf-4cc5-d154-268d5ff4ff98	1292	Ig
00050000-55bf-4cc5-a6d4-3e9b35cb1ef8	6250	Ilirska Bistrica
00050000-55bf-4cc5-bc20-1b5335018efc	6251	Ilirska Bistrica-Trnovo
00050000-55bf-4cc5-4d07-3712d04aac48	1295	Ivančna Gorica
00050000-55bf-4cc5-8217-1e3a7561e193	2259	Ivanjkovci
00050000-55bf-4cc5-4c45-41bad5d837a3	1411	Izlake
00050000-55bf-4cc5-a92f-7e26b83fc976	6310	Izola/Isola
00050000-55bf-4cc5-da64-f2eb4e7c6972	2222	Jakobski Dol
00050000-55bf-4cc5-f35f-a89d0de1f59c	2221	Jarenina
00050000-55bf-4cc5-aa7a-0e4bb3f4f687	6254	Jelšane
00050000-55bf-4cc5-b61e-59033398f691	4270	Jesenice
00050000-55bf-4cc5-7ec8-051e055fcf0e	8261	Jesenice na Dolenjskem
00050000-55bf-4cc5-8684-4baab72fcf76	3273	Jurklošter
00050000-55bf-4cc5-dd41-7f0c9a0d3d25	2223	Jurovski Dol
00050000-55bf-4cc5-1f06-cc6953cb80b3	2256	Juršinci
00050000-55bf-4cc5-0b9e-b9e95ae2a76c	5214	Kal nad Kanalom
00050000-55bf-4cc5-0784-a0f22f3483e4	3233	Kalobje
00050000-55bf-4cc5-f4e1-831e960bb847	4246	Kamna Gorica
00050000-55bf-4cc5-7134-826f933d4e58	2351	Kamnica
00050000-55bf-4cc5-6257-c5701e568017	1241	Kamnik
00050000-55bf-4cc5-3688-c3d0d637454b	5213	Kanal
00050000-55bf-4cc5-83f9-dc2da9f1f033	8258	Kapele
00050000-55bf-4cc5-9033-1cddd805066e	2362	Kapla
00050000-55bf-4cc5-06ed-7ebbb4c3adf9	2325	Kidričevo
00050000-55bf-4cc5-a45b-3b2450443423	1412	Kisovec
00050000-55bf-4cc5-a3ff-fbd9ef1c4ecf	6253	Knežak
00050000-55bf-4cc5-83d6-a6a117480d12	5222	Kobarid
00050000-55bf-4cc5-d59c-28b545c1d1f0	9227	Kobilje
00050000-55bf-4cc5-a1f5-949e5611f2ec	1330	Kočevje
00050000-55bf-4cc5-3458-16b9078815a2	1338	Kočevska Reka
00050000-55bf-4cc5-ad53-c4f0053a433f	2276	Kog
00050000-55bf-4cc5-1a3b-69d1287b4b48	5211	Kojsko
00050000-55bf-4cc5-508b-ae9ba468537e	6223	Komen
00050000-55bf-4cc5-088a-7f20caabe3c1	1218	Komenda
00050000-55bf-4cc5-b01b-7f43ce37cb37	6000	Koper/Capodistria 
00050000-55bf-4cc5-0660-c3c45a4df6e0	6001	Koper/Capodistria - poštni predali
00050000-55bf-4cc5-fc7c-e073d4336853	8282	Koprivnica
00050000-55bf-4cc5-c8a8-15c94895df4c	5296	Kostanjevica na Krasu
00050000-55bf-4cc5-a5b8-e23efac26af4	8311	Kostanjevica na Krki
00050000-55bf-4cc5-1a19-64783ac95207	1336	Kostel
00050000-55bf-4cc5-303f-93f850cf3f1f	6256	Košana
00050000-55bf-4cc5-bb13-8cdcb931c15a	2394	Kotlje
00050000-55bf-4cc5-bd0c-ecb2315a3092	6240	Kozina
00050000-55bf-4cc5-d031-1ba54ee4c17d	3260	Kozje
00050000-55bf-4cc5-30c9-2712682305ed	4000	Kranj 
00050000-55bf-4cc5-d633-ff020634c0a7	4001	Kranj - poštni predali
00050000-55bf-4cc5-f9f6-c489ecd6a731	4280	Kranjska Gora
00050000-55bf-4cc5-1c42-8218e2260228	1281	Kresnice
00050000-55bf-4cc5-b1be-25167ecec931	4294	Križe
00050000-55bf-4cc5-c87e-15a4aed93cb0	9206	Križevci
00050000-55bf-4cc5-22a4-c0034d91c7f9	9242	Križevci pri Ljutomeru
00050000-55bf-4cc5-4ae3-8a7d3daf4252	1301	Krka
00050000-55bf-4cc5-5e32-6146cf5a1794	8296	Krmelj
00050000-55bf-4cc5-e592-a3bce21ef40e	4245	Kropa
00050000-55bf-4cc5-b0f7-16255759828d	8262	Krška vas
00050000-55bf-4cc5-669c-48ef66b98f15	8270	Krško
00050000-55bf-4cc5-110c-be5fba595031	9263	Kuzma
00050000-55bf-4cc5-9aa8-3563862054bf	2318	Laporje
00050000-55bf-4cc5-6cfc-297ec7073a75	3270	Laško
00050000-55bf-4cc5-d07f-b594ad308b38	1219	Laze v Tuhinju
00050000-55bf-4cc5-d72e-c76fb9ac178a	2230	Lenart v Slovenskih goricah
00050000-55bf-4cc5-322c-60eb26932c82	9220	Lendava/Lendva
00050000-55bf-4cc5-4d8f-fb7a45547dae	4248	Lesce
00050000-55bf-4cc5-6686-753873a0e7f6	3261	Lesično
00050000-55bf-4cc5-f1bb-8600332742df	8273	Leskovec pri Krškem
00050000-55bf-4cc5-0540-86b575c73152	2372	Libeliče
00050000-55bf-4cc5-7082-cf441d65e07d	2341	Limbuš
00050000-55bf-4cc5-6a0b-1bb0212c9f80	1270	Litija
00050000-55bf-4cc5-9896-6c892fbbbd1f	3202	Ljubečna
00050000-55bf-4cc5-f80f-54e4078a3467	1000	Ljubljana 
00050000-55bf-4cc5-ac4c-0cdcc72deb1e	1001	Ljubljana - poštni predali
00050000-55bf-4cc5-ab8e-047ca41df40f	1231	Ljubljana - Črnuče
00050000-55bf-4cc5-8c3b-e72aa22efb78	1261	Ljubljana - Dobrunje
00050000-55bf-4cc5-8deb-12b26c5f3ab4	1260	Ljubljana - Polje
00050000-55bf-4cc5-b002-d299283b8d1d	1210	Ljubljana - Šentvid
00050000-55bf-4cc5-b8a7-18705717ef57	1211	Ljubljana - Šmartno
00050000-55bf-4cc5-1eb3-b9a02b682860	3333	Ljubno ob Savinji
00050000-55bf-4cc5-c1e2-23b9d5e8eb33	9240	Ljutomer
00050000-55bf-4cc5-ef5f-2f3feebc8a2d	3215	Loče
00050000-55bf-4cc5-0da5-2584b69c5816	5231	Log pod Mangartom
00050000-55bf-4cc5-1b04-59979a665ada	1358	Log pri Brezovici
00050000-55bf-4cc5-6153-16a7f510d60c	1370	Logatec
00050000-55bf-4cc5-0a59-0cd150111e6c	1371	Logatec
00050000-55bf-4cc5-fc8e-3c43c19dbe98	1434	Loka pri Zidanem Mostu
00050000-55bf-4cc5-73a7-d9ea06fda489	3223	Loka pri Žusmu
00050000-55bf-4cc5-3ad3-d01d96729471	6219	Lokev
00050000-55bf-4cc5-332f-70653ba1c32b	1318	Loški Potok
00050000-55bf-4cc5-c5e5-0508fd052be3	2324	Lovrenc na Dravskem polju
00050000-55bf-4cc5-be7b-f547c5b48c35	2344	Lovrenc na Pohorju
00050000-55bf-4cc5-551f-febb6f13a5ba	3334	Luče
00050000-55bf-4cc5-dd37-43989b5c71d1	1225	Lukovica
00050000-55bf-4cc5-2efe-becb4ed480f5	9202	Mačkovci
00050000-55bf-4cc5-1967-c1ba84b2bc09	2322	Majšperk
00050000-55bf-4cc5-fb3e-04f88c7f6ab4	2321	Makole
00050000-55bf-4cc5-abef-8556de9df811	9243	Mala Nedelja
00050000-55bf-4cc5-f349-2f8948c34811	2229	Malečnik
00050000-55bf-4cc5-85fb-f93ca8bcdffc	6273	Marezige
00050000-55bf-4cc5-1465-b4bfc123e019	2000	Maribor 
00050000-55bf-4cc5-277c-5d2e5b33836f	2001	Maribor - poštni predali
00050000-55bf-4cc5-5a60-5251c1013d7d	2206	Marjeta na Dravskem polju
00050000-55bf-4cc5-813d-5c70e336abb7	2281	Markovci
00050000-55bf-4cc5-4b5b-c27cb8d14a41	9221	Martjanci
00050000-55bf-4cc5-5321-c439ad3bdfe0	6242	Materija
00050000-55bf-4cc5-276b-a047a1a1e962	4211	Mavčiče
00050000-55bf-4cc5-7479-fb7cb8821f24	1215	Medvode
00050000-55bf-4cc5-85cb-a9b200215bd3	1234	Mengeš
00050000-55bf-4cc5-0bfd-aa3cd3824a05	8330	Metlika
00050000-55bf-4cc5-cb56-9a7e575778b9	2392	Mežica
00050000-55bf-4cc5-b2d9-1fe213cffb1e	2204	Miklavž na Dravskem polju
00050000-55bf-4cc5-4f9f-b81bf8623ad9	2275	Miklavž pri Ormožu
00050000-55bf-4cc5-6cad-44d5ba0b03a9	5291	Miren
00050000-55bf-4cc5-6d25-1c226a62cb1f	8233	Mirna
00050000-55bf-4cc5-4b50-7f337a57e0d5	8216	Mirna Peč
00050000-55bf-4cc5-06ac-a1b0d59a760e	2382	Mislinja
00050000-55bf-4cc5-9246-52f8b45a50ba	4281	Mojstrana
00050000-55bf-4cc5-610a-7aa560d05608	8230	Mokronog
00050000-55bf-4cc5-1bd6-60a404ef929e	1251	Moravče
00050000-55bf-4cc5-709d-183a5ba473a1	9226	Moravske Toplice
00050000-55bf-4cc5-eedb-0fff896f9e9d	5216	Most na Soči
00050000-55bf-4cc5-e192-bf0d3f999124	1221	Motnik
00050000-55bf-4cc5-8d1f-b6680f67118f	3330	Mozirje
00050000-55bf-4cc5-44c6-9de6c824aab8	9000	Murska Sobota 
00050000-55bf-4cc5-8943-d5eb2dd6070d	9001	Murska Sobota - poštni predali
00050000-55bf-4cc5-5c02-d4149744bf6b	2366	Muta
00050000-55bf-4cc5-a6df-7dc9e2b06b27	4202	Naklo
00050000-55bf-4cc5-5326-94b4d5a47e8b	3331	Nazarje
00050000-55bf-4cc5-fe13-57fd9ea1a54e	1357	Notranje Gorice
00050000-55bf-4cc5-3eef-5af56787620e	3203	Nova Cerkev
00050000-55bf-4cc5-a8fc-e1e6fffd11ab	5000	Nova Gorica 
00050000-55bf-4cc5-61fa-111ef6dc07aa	5001	Nova Gorica - poštni predali
00050000-55bf-4cc5-2a82-8ec1a5c7b94e	1385	Nova vas
00050000-55bf-4cc5-38fb-be1e2580621d	8000	Novo mesto
00050000-55bf-4cc5-baaf-cc18ec2421be	8001	Novo mesto - poštni predali
00050000-55bf-4cc5-e574-2bc774fa758b	6243	Obrov
00050000-55bf-4cc5-c9fb-dad2d81bc33f	9233	Odranci
00050000-55bf-4cc5-3f07-acda5a41ae78	2317	Oplotnica
00050000-55bf-4cc5-691e-3f0427c7d1b1	2312	Orehova vas
00050000-55bf-4cc5-e73d-1c46069d0b79	2270	Ormož
00050000-55bf-4cc5-3352-cb8c2b579e98	1316	Ortnek
00050000-55bf-4cc5-dfae-025948c5e661	1337	Osilnica
00050000-55bf-4cc5-7483-f85fbdb1347f	8222	Otočec
00050000-55bf-4cc5-21f6-83b9cb43a5d4	2361	Ožbalt
00050000-55bf-4cc5-f8c9-c9be1e047f5f	2231	Pernica
00050000-55bf-4cc5-d139-2962815d2ca4	2211	Pesnica pri Mariboru
00050000-55bf-4cc5-aed4-4268bf153b07	9203	Petrovci
00050000-55bf-4cc5-d83f-7d53b973a354	3301	Petrovče
00050000-55bf-4cc5-58f8-9356d22e0f5d	6330	Piran/Pirano
00050000-55bf-4cc5-d877-bb285233e6bb	8255	Pišece
00050000-55bf-4cc5-4ecb-9c7741e1753e	6257	Pivka
00050000-55bf-4cc5-2527-0991357fd41d	6232	Planina
00050000-55bf-4cc5-c917-3a0883db58d6	3225	Planina pri Sevnici
00050000-55bf-4cc5-743c-de0236e3b246	6276	Pobegi
00050000-55bf-4cc5-fd21-fec0cdab2bc9	8312	Podbočje
00050000-55bf-4cc5-f085-5d50f2ceea5c	5243	Podbrdo
00050000-55bf-4cc5-542c-9260eec2f6b6	3254	Podčetrtek
00050000-55bf-4cc5-9fc4-5eef03781292	2273	Podgorci
00050000-55bf-4cc5-5879-9e9810a14efd	6216	Podgorje
00050000-55bf-4cc5-18bd-8999127d243a	2381	Podgorje pri Slovenj Gradcu
00050000-55bf-4cc5-059f-0727f63cdcd8	6244	Podgrad
00050000-55bf-4cc5-1124-9e4dac77c52d	1414	Podkum
00050000-55bf-4cc5-0c50-bb54d610f94a	2286	Podlehnik
00050000-55bf-4cc5-00cc-a5c9e25d0c02	5272	Podnanos
00050000-55bf-4cc5-1296-4f5a5f8b1286	4244	Podnart
00050000-55bf-4cc5-fc22-47f2071759c6	3241	Podplat
00050000-55bf-4cc5-f85b-5dcd8ec9b557	3257	Podsreda
00050000-55bf-4cc5-407b-12f686630968	2363	Podvelka
00050000-55bf-4cc5-c5e0-1d816b42080d	2208	Pohorje
00050000-55bf-4cc5-5553-866981500eb7	2257	Polenšak
00050000-55bf-4cc5-0350-98cbe54ca253	1355	Polhov Gradec
00050000-55bf-4cc5-deeb-dab9553b07b9	4223	Poljane nad Škofjo Loko
00050000-55bf-4cc5-7037-2fa2ce2fb309	2319	Poljčane
00050000-55bf-4cc5-f1c5-66b8016ed06d	1272	Polšnik
00050000-55bf-4cc5-2fa2-078fd8445c29	3313	Polzela
00050000-55bf-4cc5-dc8e-bd8e4dd50925	3232	Ponikva
00050000-55bf-4cc5-7fe8-485960d07ae5	6320	Portorož/Portorose
00050000-55bf-4cc5-2bce-b31356ae2e9c	6230	Postojna
00050000-55bf-4cc5-4517-01bfa305cd7b	2331	Pragersko
00050000-55bf-4cc5-1ff1-95d1406a8d31	3312	Prebold
00050000-55bf-4cc5-3e84-b9a6f91d75f8	4205	Preddvor
00050000-55bf-4cc5-f26e-55f1b7e766e3	6255	Prem
00050000-55bf-4cc5-b173-8ac5643e58fa	1352	Preserje
00050000-55bf-4cc5-8b58-a22cb4daf840	6258	Prestranek
00050000-55bf-4cc5-c63c-78e13a19e83a	2391	Prevalje
00050000-55bf-4cc5-f6d0-ede4d45348d3	3262	Prevorje
00050000-55bf-4cc5-a36e-ad1ec4575894	1276	Primskovo 
00050000-55bf-4cc5-9a10-34be8bbb25ad	3253	Pristava pri Mestinju
00050000-55bf-4cc5-8a73-fbca090758d3	9207	Prosenjakovci/Partosfalva
00050000-55bf-4cc5-a6c4-933c2030a5f3	5297	Prvačina
00050000-55bf-4cc5-7cc3-37c27b6fb0bd	2250	Ptuj
00050000-55bf-4cc5-ec1f-61388034c059	2323	Ptujska Gora
00050000-55bf-4cc5-fc75-0fdd1f16ef0b	9201	Puconci
00050000-55bf-4cc5-c7b3-13081a8dddf7	2327	Rače
00050000-55bf-4cc5-1b57-a634cf7bd00b	1433	Radeče
00050000-55bf-4cc5-d52a-de9d04280ac9	9252	Radenci
00050000-55bf-4cc5-4bfd-c95f3df98d07	2360	Radlje ob Dravi
00050000-55bf-4cc5-3001-93bebb9d3327	1235	Radomlje
00050000-55bf-4cc5-2415-20a30629a586	4240	Radovljica
00050000-55bf-4cc5-71cf-bcabb77cda67	8274	Raka
00050000-55bf-4cc5-2112-a60674d829ec	1381	Rakek
00050000-55bf-4cc5-67a7-ca607c9985cc	4283	Rateče - Planica
00050000-55bf-4cc5-8b14-77dcbc3e0904	2390	Ravne na Koroškem
00050000-55bf-4cc5-ec07-f821767dfb41	9246	Razkrižje
00050000-55bf-4cc5-02f8-1b1e578eda24	3332	Rečica ob Savinji
00050000-55bf-4cc5-1672-6d8c670b1977	5292	Renče
00050000-55bf-4cc5-d0d9-bedda3bd8ca4	1310	Ribnica
00050000-55bf-4cc5-8d76-8f3be5b83ab0	2364	Ribnica na Pohorju
00050000-55bf-4cc5-2b65-9d18455a1ec8	3272	Rimske Toplice
00050000-55bf-4cc5-8131-1e28b62e3d89	1314	Rob
00050000-55bf-4cc5-c2eb-8963eb07e526	5215	Ročinj
00050000-55bf-4cc5-ee77-ceb353ec297f	3250	Rogaška Slatina
00050000-55bf-4cc5-52a6-a5cfdd47c5f2	9262	Rogašovci
00050000-55bf-4cc5-2605-82642f5d63c2	3252	Rogatec
00050000-55bf-4cc5-42ae-864e1e787ce3	1373	Rovte
00050000-55bf-4cc5-1107-6c1adb337512	2342	Ruše
00050000-55bf-4cc5-d002-5890ca92eca9	1282	Sava
00050000-55bf-4cc5-25e8-d36d1f001d03	6333	Sečovlje/Sicciole
00050000-55bf-4cc5-5004-a04803fae106	4227	Selca
00050000-55bf-4cc5-528c-ea2e1af19419	2352	Selnica ob Dravi
00050000-55bf-4cc5-d326-0b524be44322	8333	Semič
00050000-55bf-4cc5-cb3a-6313a4d2615c	8281	Senovo
00050000-55bf-4cc5-f1f7-7e71d7522f2e	6224	Senožeče
00050000-55bf-4cc5-dd32-c37e62490fb6	8290	Sevnica
00050000-55bf-4cc5-cfb1-817f9185e4de	6210	Sežana
00050000-55bf-4cc5-f16c-9592fa5fa653	2214	Sladki Vrh
00050000-55bf-4cc5-9049-fb4ad39e7648	5283	Slap ob Idrijci
00050000-55bf-4cc5-9565-5a1ac045dad1	2380	Slovenj Gradec
00050000-55bf-4cc5-4d60-aaab3c8acb1e	2310	Slovenska Bistrica
00050000-55bf-4cc5-e572-fc5fe969c4da	3210	Slovenske Konjice
00050000-55bf-4cc5-da31-5444ca3ac46f	1216	Smlednik
00050000-55bf-4cc5-4164-c2a2fdbc2a98	5232	Soča
00050000-55bf-4cc5-f1f5-e26a70d02d1e	1317	Sodražica
00050000-55bf-4cc5-8ee0-074c4fb13609	3335	Solčava
00050000-55bf-4cc5-0f49-699efa69f508	5250	Solkan
00050000-55bf-4cc5-85cc-e79397bd008f	4229	Sorica
00050000-55bf-4cc5-0f09-240273ea9d60	4225	Sovodenj
00050000-55bf-4cc5-fcfe-629fc9c336b2	5281	Spodnja Idrija
00050000-55bf-4cc5-29e2-fe6373e78baa	2241	Spodnji Duplek
00050000-55bf-4cc5-45b6-f65451a71091	9245	Spodnji Ivanjci
00050000-55bf-4cc5-51fb-1a90f7804520	2277	Središče ob Dravi
00050000-55bf-4cc5-a21c-e2a1ca4e1b6d	4267	Srednja vas v Bohinju
00050000-55bf-4cc5-bc92-d5777c9f2d48	8256	Sromlje 
00050000-55bf-4cc5-6ee2-330524e89632	5224	Srpenica
00050000-55bf-4cc5-2a00-661ad33ceb96	1242	Stahovica
00050000-55bf-4cc5-99af-cfc6a804407e	1332	Stara Cerkev
00050000-55bf-4cc5-056c-15f8df740acb	8342	Stari trg ob Kolpi
00050000-55bf-4cc5-dbea-99b109f0eb54	1386	Stari trg pri Ložu
00050000-55bf-4cc5-1090-f47cbdd57395	2205	Starše
00050000-55bf-4cc5-d41d-c65f761b60e2	2289	Stoperce
00050000-55bf-4cc5-84da-8ce9d7ea74b6	8322	Stopiče
00050000-55bf-4cc5-1b2a-fd38a54135cb	3206	Stranice
00050000-55bf-4cc5-cb06-e2602c6f4539	8351	Straža
00050000-55bf-4cc5-dd20-0099772a6136	1313	Struge
00050000-55bf-4cc5-a2de-476c9134ee47	8293	Studenec
00050000-55bf-4cc5-7d48-b409dd363c86	8331	Suhor
00050000-55bf-4cc5-ebcd-eef678f6381f	2233	Sv. Ana v Slovenskih goricah
00050000-55bf-4cc5-bed9-b8075631eaa6	2235	Sv. Trojica v Slovenskih goricah
00050000-55bf-4cc5-b86b-b325c5ad4a7d	2353	Sveti Duh na Ostrem Vrhu
00050000-55bf-4cc5-5e2b-ba1b4735f1ad	9244	Sveti Jurij ob Ščavnici
00050000-55bf-4cc5-3cca-0519ab0cbb05	3264	Sveti Štefan
00050000-55bf-4cc5-dd0e-7bcbbd9dc0ee	2258	Sveti Tomaž
00050000-55bf-4cc5-6c19-e8c3fb0b05b0	9204	Šalovci
00050000-55bf-4cc5-8e79-dee9cb89e188	5261	Šempas
00050000-55bf-4cc5-f959-570eaeeba360	5290	Šempeter pri Gorici
00050000-55bf-4cc5-013c-21100a2898b1	3311	Šempeter v Savinjski dolini
00050000-55bf-4cc5-4fb0-c8b997800c1d	4208	Šenčur
00050000-55bf-4cc5-b3f9-7611f21928d2	2212	Šentilj v Slovenskih goricah
00050000-55bf-4cc5-1a22-97848a533efd	8297	Šentjanž
00050000-55bf-4cc5-6c08-2772c7c34da0	2373	Šentjanž pri Dravogradu
00050000-55bf-4cc5-8de9-e46438b60cb7	8310	Šentjernej
00050000-55bf-4cc5-af93-02add78b6a0b	3230	Šentjur
00050000-55bf-4cc5-ae91-68047112ce45	3271	Šentrupert
00050000-55bf-4cc5-d82e-5476ed04e54c	8232	Šentrupert
00050000-55bf-4cc5-9e0e-dc8ab3e789ab	1296	Šentvid pri Stični
00050000-55bf-4cc5-8c65-940a55bdcb8f	8275	Škocjan
00050000-55bf-4cc5-d671-866b905046f4	6281	Škofije
00050000-55bf-4cc5-d9e3-121dfbada9fc	4220	Škofja Loka
00050000-55bf-4cc5-fb24-d63f0fe74e2d	3211	Škofja vas
00050000-55bf-4cc5-5ec2-475ddc28719e	1291	Škofljica
00050000-55bf-4cc5-1306-fd1a65c3239c	6274	Šmarje
00050000-55bf-4cc5-34ba-71828390a71f	1293	Šmarje - Sap
00050000-55bf-4cc5-7a53-df788b2b7871	3240	Šmarje pri Jelšah
00050000-55bf-4cc5-c935-4006b77eb0f1	8220	Šmarješke Toplice
00050000-55bf-4cc5-db57-095b6299c147	2315	Šmartno na Pohorju
00050000-55bf-4cc5-9189-6354aa8dad65	3341	Šmartno ob Dreti
00050000-55bf-4cc5-fe8b-0217dd001530	3327	Šmartno ob Paki
00050000-55bf-4cc5-00ad-74295c1e5a16	1275	Šmartno pri Litiji
00050000-55bf-4cc5-466e-cc97223036e1	2383	Šmartno pri Slovenj Gradcu
00050000-55bf-4cc5-ba8a-83d56c462b1a	3201	Šmartno v Rožni dolini
00050000-55bf-4cc5-f9bb-0ab5cfdf5a9b	3325	Šoštanj
00050000-55bf-4cc5-2f08-207bd2547bed	6222	Štanjel
00050000-55bf-4cc5-b31c-4148b76d5e82	3220	Štore
00050000-55bf-4cc5-9442-08b4db7a6147	3304	Tabor
00050000-55bf-4cc5-cf65-95b30a9ac694	3221	Teharje
00050000-55bf-4cc5-3fdf-0cf7c1e66760	9251	Tišina
00050000-55bf-4cc5-cd44-bd9b7b92165b	5220	Tolmin
00050000-55bf-4cc5-8ba9-39c09bcdb53d	3326	Topolšica
00050000-55bf-4cc5-a3f9-81347cc3bd4a	2371	Trbonje
00050000-55bf-4cc5-c84d-d347462e4468	1420	Trbovlje
00050000-55bf-4cc5-b51c-bbff867d66be	8231	Trebelno 
00050000-55bf-4cc5-df16-af15968beddd	8210	Trebnje
00050000-55bf-4cc5-c20f-63bdc43394bd	5252	Trnovo pri Gorici
00050000-55bf-4cc5-70ff-440c5e096383	2254	Trnovska vas
00050000-55bf-4cc5-d09c-e69101588023	1222	Trojane
00050000-55bf-4cc5-49b7-afedd5f0f467	1236	Trzin
00050000-55bf-4cc5-35a2-a26c092dcc4e	4290	Tržič
00050000-55bf-4cc5-b4d9-0a2ec0baf28d	8295	Tržišče
00050000-55bf-4cc5-99a4-eb256c8d926e	1311	Turjak
00050000-55bf-4cc5-9cb7-8b303d6c9284	9224	Turnišče
00050000-55bf-4cc5-56df-fd1d6256ec33	8323	Uršna sela
00050000-55bf-4cc5-f850-096d64d42e80	1252	Vače
00050000-55bf-4cc5-3ae0-4a3da46c0306	3320	Velenje 
00050000-55bf-4cc5-cda4-b69733f2aa03	3322	Velenje - poštni predali
00050000-55bf-4cc5-3d40-c28db691a9bc	8212	Velika Loka
00050000-55bf-4cc5-d3bf-cddb46722feb	2274	Velika Nedelja
00050000-55bf-4cc5-f077-86dc179372ab	9225	Velika Polana
00050000-55bf-4cc5-c67f-96aac1763ef8	1315	Velike Lašče
00050000-55bf-4cc5-8909-9af4f925d676	8213	Veliki Gaber
00050000-55bf-4cc5-3f96-e252edf6bacb	9241	Veržej
00050000-55bf-4cc5-f04c-68c0c30a3b81	1312	Videm - Dobrepolje
00050000-55bf-4cc5-f718-ec4aeeb48172	2284	Videm pri Ptuju
00050000-55bf-4cc5-b011-8cb933a05cc8	8344	Vinica
00050000-55bf-4cc5-7097-29563ba1db43	5271	Vipava
00050000-55bf-4cc5-328c-2e41805de36a	4212	Visoko
00050000-55bf-4cc5-8932-95c8a7aba00e	1294	Višnja Gora
00050000-55bf-4cc5-67cc-2ee0a3a40239	3205	Vitanje
00050000-55bf-4cc5-a1cd-cf06383cc910	2255	Vitomarci
00050000-55bf-4cc5-35a0-dc09f388e437	1217	Vodice
00050000-55bf-4cc5-c723-1a5ff286cbe0	3212	Vojnik\t
00050000-55bf-4cc5-2430-4b48c31f4a13	5293	Volčja Draga
00050000-55bf-4cc5-0944-fdfe06d58d52	2232	Voličina
00050000-55bf-4cc5-8fc7-4b755d0ce13d	3305	Vransko
00050000-55bf-4cc5-944a-6863b21a6727	6217	Vremski Britof
00050000-55bf-4cc5-5fc7-a18d7972e1f1	1360	Vrhnika
00050000-55bf-4cc5-b787-2285e01dee54	2365	Vuhred
00050000-55bf-4cc5-7172-02fe7f5b76ae	2367	Vuzenica
00050000-55bf-4cc5-c829-b5d35b625a56	8292	Zabukovje 
00050000-55bf-4cc5-67ea-9eb9535b8602	1410	Zagorje ob Savi
00050000-55bf-4cc5-31bf-3f207d98ce52	1303	Zagradec
00050000-55bf-4cc5-ce21-8383e1ef396c	2283	Zavrč
00050000-55bf-4cc5-14c5-ed7564804e63	8272	Zdole 
00050000-55bf-4cc5-4fce-24fe6b5425e1	4201	Zgornja Besnica
00050000-55bf-4cc5-b3d3-f33db693500e	2242	Zgornja Korena
00050000-55bf-4cc5-33e2-226526a5b928	2201	Zgornja Kungota
00050000-55bf-4cc5-b6fd-566e6ace01b4	2316	Zgornja Ložnica
00050000-55bf-4cc5-c048-7cf52d436f4d	2314	Zgornja Polskava
00050000-55bf-4cc5-3104-da41ed993ac3	2213	Zgornja Velka
00050000-55bf-4cc5-149f-36a9c8fc571e	4247	Zgornje Gorje
00050000-55bf-4cc5-8ce3-bd80d70c5d66	4206	Zgornje Jezersko
00050000-55bf-4cc5-b991-6f9b7e1f81fd	2285	Zgornji Leskovec
00050000-55bf-4cc5-29ce-8a83ae3da509	1432	Zidani Most
00050000-55bf-4cc5-6de5-e913937ebd9c	3214	Zreče
00050000-55bf-4cc5-b84c-3178b028f249	4209	Žabnica
00050000-55bf-4cc5-b309-9d6b893b8480	3310	Žalec
00050000-55bf-4cc5-74ad-1c42c6334e1c	4228	Železniki
00050000-55bf-4cc5-9a2e-e46fbfa4e52b	2287	Žetale
00050000-55bf-4cc5-e2eb-88694a5534e3	4226	Žiri
00050000-55bf-4cc5-ebd5-a1cfd0907fd0	4274	Žirovnica
00050000-55bf-4cc5-3e88-16d1c01b8f2b	8360	Žužemberk
\.


--
-- TOC entry 2990 (class 0 OID 11515378)
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
-- TOC entry 2972 (class 0 OID 11515189)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11515267)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 11515390)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 11515692)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 11515702)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55bf-4cc6-9672-76462b6ed888	00080000-55bf-4cc6-6173-364126b0077e	0900	AK
00190000-55bf-4cc6-4d58-2d5752497532	00080000-55bf-4cc6-9e34-460efb39f644	0987	AK
00190000-55bf-4cc6-3f0b-ecc733c8b310	00080000-55bf-4cc6-5966-021e0d532864	0989	AK
00190000-55bf-4cc6-acbc-0d33e74786a8	00080000-55bf-4cc6-7816-4932326cebf0	0986	AK
00190000-55bf-4cc6-55ec-f6b41f456742	00080000-55bf-4cc6-a6ac-5edaef935fb5	0984	AK
00190000-55bf-4cc6-1e43-d80590d40d05	00080000-55bf-4cc6-d391-66d050c96812	0983	AK
00190000-55bf-4cc6-16f2-b97420f5b435	00080000-55bf-4cc6-eea9-3ec047709850	0982	AK
\.


--
-- TOC entry 3014 (class 0 OID 11515673)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55bf-4cc6-7d57-a03dcd8dcb0f	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3017 (class 0 OID 11515710)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 11515419)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55bf-4cc6-e4d7-7c3d44a0fe16	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55bf-4cc6-460a-2a6068f34290	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55bf-4cc6-4dcf-6515fa490794	0003	Kazinska	t	84	Kazinska dvorana
00220000-55bf-4cc6-583d-992458ce9400	0004	Mali oder	t	24	Mali oder 
00220000-55bf-4cc6-8164-1af1e3828b29	0005	Komorni oder	t	15	Komorni oder
00220000-55bf-4cc6-661b-56689136163b	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55bf-4cc6-ba8c-9211f1c696d8	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2988 (class 0 OID 11515363)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11515353)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11515538)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 11515487)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 11515061)
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
-- TOC entry 2997 (class 0 OID 11515429)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 11515099)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55bf-4cc5-1dc2-9a3789ab996c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55bf-4cc5-5ed9-8d850f82a244	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55bf-4cc5-a24c-141081f4c279	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55bf-4cc5-773c-3691b3955036	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55bf-4cc5-1b22-09a1150ecafd	planer	Planer dogodkov v koledarju	t
00020000-55bf-4cc5-dcfc-12293699d63f	kadrovska	Kadrovska služba	t
00020000-55bf-4cc5-525c-1f0e2039e9d6	arhivar	Ažuriranje arhivalij	t
00020000-55bf-4cc5-10dd-ae65596e921a	igralec	Igralec	t
00020000-55bf-4cc5-ed4d-3e60512787f8	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55bf-4cc6-edfa-31119c8d51dd	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2963 (class 0 OID 11515083)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55bf-4cc5-6f69-d64cc37d5af6	00020000-55bf-4cc5-a24c-141081f4c279
00010000-55bf-4cc5-06ed-afe3dd730e63	00020000-55bf-4cc5-a24c-141081f4c279
00010000-55bf-4cc6-4b84-6ccdfea469db	00020000-55bf-4cc6-edfa-31119c8d51dd
\.


--
-- TOC entry 2999 (class 0 OID 11515443)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11515384)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 11515334)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 11515751)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55bf-4cc5-771d-4d18077daf35	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55bf-4cc5-437d-1d7a71ea0fdc	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55bf-4cc5-5a6a-3c4a74feffe9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55bf-4cc5-e404-d2d691a9edc7	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55bf-4cc5-55ee-1116945838f6	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3021 (class 0 OID 11515743)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55bf-4cc5-c75b-53c023f8d0d2	00230000-55bf-4cc5-e404-d2d691a9edc7	popa
00240000-55bf-4cc5-68a6-fa86ffba0cb3	00230000-55bf-4cc5-e404-d2d691a9edc7	oseba
00240000-55bf-4cc5-2e0a-f87968db99d6	00230000-55bf-4cc5-437d-1d7a71ea0fdc	prostor
00240000-55bf-4cc5-bfad-29aa4a5f3648	00230000-55bf-4cc5-e404-d2d691a9edc7	besedilo
00240000-55bf-4cc5-b2b0-29acd73c4e8c	00230000-55bf-4cc5-e404-d2d691a9edc7	uprizoritev
00240000-55bf-4cc5-b8ca-6401754d42a4	00230000-55bf-4cc5-e404-d2d691a9edc7	funkcija
00240000-55bf-4cc5-a554-259169119235	00230000-55bf-4cc5-e404-d2d691a9edc7	tipfunkcije
00240000-55bf-4cc5-fdb5-6ce8ac0b6a04	00230000-55bf-4cc5-e404-d2d691a9edc7	alternacija
00240000-55bf-4cc5-740c-6efcd175bb83	00230000-55bf-4cc5-771d-4d18077daf35	pogodba
00240000-55bf-4cc5-cdb1-f82eb93eb0c1	00230000-55bf-4cc5-e404-d2d691a9edc7	zaposlitev
00240000-55bf-4cc5-d5b8-a13449b94851	00230000-55bf-4cc5-771d-4d18077daf35	programdela
00240000-55bf-4cc5-3b86-62e00474b601	00230000-55bf-4cc5-e404-d2d691a9edc7	zapis
\.


--
-- TOC entry 3020 (class 0 OID 11515738)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11515497)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55bf-4cc6-9d03-7473731b1a3e	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	00080000-55bf-4cc6-6788-c85e09481597	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55bf-4cc6-e911-b9e98cb20240	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	00080000-55bf-4cc6-6788-c85e09481597	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55bf-4cc6-2b45-6052dced1c00	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	00080000-55bf-4cc6-0f33-af749eca61d1	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55bf-4cc6-564f-0b19ea769bdd	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	00080000-55bf-4cc6-0f33-af749eca61d1	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2970 (class 0 OID 11515161)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 11515340)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55bf-4cc6-70be-58615d2679c1	00180000-55bf-4cc6-d0fc-b9f48c41e3b8	000c0000-55bf-4cc6-54aa-da912c7dd07d	00090000-55bf-4cc6-f28d-a8e37ae95c3c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-4cc6-6891-80f74b1bd05f	00180000-55bf-4cc6-d0fc-b9f48c41e3b8	000c0000-55bf-4cc6-db90-2110be0d7d51	00090000-55bf-4cc6-5850-644e2e652ec6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-4cc6-c3c0-f3be11913737	00180000-55bf-4cc6-d0fc-b9f48c41e3b8	000c0000-55bf-4cc6-7540-750c9bc975f7	00090000-55bf-4cc6-1256-0d11978bd57f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-4cc6-9ad7-08226d10b89c	00180000-55bf-4cc6-d0fc-b9f48c41e3b8	000c0000-55bf-4cc6-6613-53365fcb872f	00090000-55bf-4cc6-a338-3299dcf3c667	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-4cc6-a60e-b6417045e75d	00180000-55bf-4cc6-d0fc-b9f48c41e3b8	000c0000-55bf-4cc6-6740-b53677f4b240	00090000-55bf-4cc6-a388-1923bf8d56c8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-4cc6-c09b-00670ad826ae	00180000-55bf-4cc6-a217-902ad7762bb5	\N	00090000-55bf-4cc6-a388-1923bf8d56c8	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3006 (class 0 OID 11515527)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55bf-4cc5-643d-18c9193f4f60	Avtor	Avtorji	Avtorka	umetnik
000f0000-55bf-4cc5-581c-a3ae53636607	Priredba	Priredba	Priredba	umetnik
000f0000-55bf-4cc5-12c5-79a1ae86a8b4	Prevod	Prevod	Prevod	umetnik
000f0000-55bf-4cc5-db04-da1a8fd78281	Režija	Režija	Režija	umetnik
000f0000-55bf-4cc5-7a94-52e7f39a0802	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55bf-4cc5-5080-66164fb5a5f0	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55bf-4cc5-7fac-2aab9bfb92c2	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55bf-4cc5-71d7-55e258acfa25	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55bf-4cc5-d3a3-c9b1f8472f16	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55bf-4cc5-ccec-72b13a7c14c0	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55bf-4cc5-0d57-a9e7eaa4a838	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55bf-4cc5-b205-5947d04f999e	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55bf-4cc5-624f-d98a9e95c0c3	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55bf-4cc5-12ea-1ae10fb0d700	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55bf-4cc5-2716-f6ecdc2a7e6e	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55bf-4cc5-ac0a-4b77745d8d99	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55bf-4cc5-0394-d071941ba5da	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55bf-4cc5-edac-6b63df720b98	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3018 (class 0 OID 11515720)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55bf-4cc5-d97f-ebe1eb2441ec	01	Velika predstava	f	1.00	1.00
002b0000-55bf-4cc5-1fb7-cfd4073b33d6	02	Mala predstava	f	0.50	0.50
002b0000-55bf-4cc5-ec95-357d92771a9e	03	Mala koprodukcija	t	0.40	1.00
002b0000-55bf-4cc5-e160-44db9347a193	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55bf-4cc5-91e4-5995f2bcfda8	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2975 (class 0 OID 11515224)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 11515070)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55bf-4cc5-06ed-afe3dd730e63	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRONplymtiKWkOAE.52FXla6nwE/DH78CS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55bf-4cc6-5ea2-9e92fcb95d4d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55bf-4cc6-5cfa-1bc0246f7707	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55bf-4cc6-e4aa-56ed227fdd84	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55bf-4cc6-f6d2-ec0a11abea48	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55bf-4cc6-5375-5782fcb10b37	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55bf-4cc6-b907-f7caae41d79f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55bf-4cc6-ba52-b50ace00a423	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55bf-4cc6-8d24-7dd36bcbdf8c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55bf-4cc6-4c7a-13d03a407be9	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55bf-4cc6-4b84-6ccdfea469db	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55bf-4cc5-6f69-d64cc37d5af6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3010 (class 0 OID 11515575)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55bf-4cc6-fa0a-12eea8c29e0b	00160000-55bf-4cc6-8093-2318aa4e4a57	00150000-55bf-4cc5-4520-2d63dada06b9	00140000-55bf-4cc4-7b05-28d11d85e99a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55bf-4cc6-8164-1af1e3828b29
000e0000-55bf-4cc6-15bb-bf4d35bd3df9	00160000-55bf-4cc6-73e3-afb40a882079	00150000-55bf-4cc5-9054-a6ff5219b508	00140000-55bf-4cc5-3d2e-86008c4ef00a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55bf-4cc6-661b-56689136163b
000e0000-55bf-4cc6-31c2-f66a92d8eeb0	\N	00150000-55bf-4cc5-9054-a6ff5219b508	00140000-55bf-4cc5-3d2e-86008c4ef00a	00190000-55bf-4cc6-4d58-2d5752497532	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55bf-4cc6-8164-1af1e3828b29
000e0000-55bf-4cc6-5a86-955a322df58c	\N	00150000-55bf-4cc5-9054-a6ff5219b508	00140000-55bf-4cc5-3d2e-86008c4ef00a	00190000-55bf-4cc6-4d58-2d5752497532	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55bf-4cc6-8164-1af1e3828b29
000e0000-55bf-4cc6-3bec-a05fbd9b85dc	\N	00150000-55bf-4cc5-9054-a6ff5219b508	00140000-55bf-4cc5-3d2e-86008c4ef00a	00190000-55bf-4cc6-4d58-2d5752497532	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55bf-4cc6-e4d7-7c3d44a0fe16
\.


--
-- TOC entry 2980 (class 0 OID 11515286)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55bf-4cc6-e33c-270a424977ad	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	1	
00200000-55bf-4cc6-8cfd-f1da117a54a1	000e0000-55bf-4cc6-15bb-bf4d35bd3df9	2	
\.


--
-- TOC entry 2995 (class 0 OID 11515411)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 11515790)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 11515762)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 11515802)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 11515480)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55bf-4cc6-0f6c-f854ba832b4b	00090000-55bf-4cc6-5850-644e2e652ec6	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-4cc6-aae9-f2205fa42d67	00090000-55bf-4cc6-1256-0d11978bd57f	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-4cc6-825a-79a3eaa8055b	00090000-55bf-4cc6-6e44-3c35417459fa	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-4cc6-0732-d58336bb18fb	00090000-55bf-4cc6-eda4-741bbd40c9bb	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-4cc6-20c6-3ecec41b8eca	00090000-55bf-4cc6-f28d-a8e37ae95c3c	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-4cc6-e725-67dba100dbf3	00090000-55bf-4cc6-7952-bf638d881e7a	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2982 (class 0 OID 11515318)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11515565)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55bf-4cc4-7b05-28d11d85e99a	01	Drama	drama (SURS 01)
00140000-55bf-4cc4-e6fb-084571f58145	02	Opera	opera (SURS 02)
00140000-55bf-4cc5-2887-6033928c89d5	03	Balet	balet (SURS 03)
00140000-55bf-4cc5-450c-60b2a2c9b8b4	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55bf-4cc5-4285-de229989d860	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55bf-4cc5-3d2e-86008c4ef00a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55bf-4cc5-14e9-ca5ebcbfad8d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3001 (class 0 OID 11515470)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55bf-4cc5-2523-2e896ab9638b	01	Opera	opera
00150000-55bf-4cc5-9595-bdaacc682350	02	Opereta	opereta
00150000-55bf-4cc5-05df-6e3c54f68fdf	03	Balet	balet
00150000-55bf-4cc5-fa39-b88984a69d55	04	Plesne prireditve	plesne prireditve
00150000-55bf-4cc5-4abf-29427d37fc7c	05	Lutkovno gledališče	lutkovno gledališče
00150000-55bf-4cc5-e511-abe37d879895	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55bf-4cc5-03cb-cdfe935a4fb7	07	Biografska drama	biografska drama
00150000-55bf-4cc5-4520-2d63dada06b9	08	Komedija	komedija
00150000-55bf-4cc5-9400-bdb04b847375	09	Črna komedija	črna komedija
00150000-55bf-4cc5-c1ed-848d8e4b0057	10	E-igra	E-igra
00150000-55bf-4cc5-9054-a6ff5219b508	11	Kriminalka	kriminalka
00150000-55bf-4cc5-23b7-c89ba16aca45	12	Musical	musical
\.


--
-- TOC entry 2507 (class 2606 OID 11515124)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 11515622)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 11515612)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 11515526)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11515843)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 11515308)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 11515333)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11515736)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 11515250)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 11515667)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 11515466)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 11515284)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 11515327)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 11515264)
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
-- TOC entry 2599 (class 2606 OID 11515376)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 11515819)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 11515826)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2747 (class 2606 OID 11515851)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 11515403)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 11515222)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 11515133)
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
-- TOC entry 2514 (class 2606 OID 11515157)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 11515113)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2498 (class 2606 OID 11515098)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 11515409)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 11515442)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 11515560)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 11515186)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 11515210)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 11515382)
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
-- TOC entry 2529 (class 2606 OID 11515200)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 11515271)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 11515394)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 11515699)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 11515707)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 11515690)
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
-- TOC entry 2705 (class 2606 OID 11515718)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 11515426)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 11515367)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 11515358)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11515548)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 11515494)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 11515069)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 11515433)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 11515087)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2500 (class 2606 OID 11515107)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 11515451)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 11515389)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 11515339)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 11515760)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 11515748)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 11515742)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 11515507)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 11515166)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 11515349)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11515537)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 11515730)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 11515235)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 11515082)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 11515591)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 11515293)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 11515417)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 11515800)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 11515784)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 11515808)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 11515485)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 11515322)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 11515573)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 11515478)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 1259 OID 11515315)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2647 (class 1259 OID 11515508)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2648 (class 1259 OID 11515509)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2733 (class 1259 OID 11515821)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2734 (class 1259 OID 11515820)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2521 (class 1259 OID 11515188)
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
-- TOC entry 2612 (class 1259 OID 11515410)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2720 (class 1259 OID 11515788)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2721 (class 1259 OID 11515787)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2722 (class 1259 OID 11515789)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2723 (class 1259 OID 11515786)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2724 (class 1259 OID 11515785)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2606 (class 1259 OID 11515396)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 11515395)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 11515294)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 11515467)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 11515469)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2636 (class 1259 OID 11515468)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2546 (class 1259 OID 11515266)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 11515265)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2703 (class 1259 OID 11515719)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2657 (class 1259 OID 11515562)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2658 (class 1259 OID 11515563)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2659 (class 1259 OID 11515564)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2730 (class 1259 OID 11515809)
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
-- TOC entry 2666 (class 1259 OID 11515596)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2667 (class 1259 OID 11515593)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2668 (class 1259 OID 11515597)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2669 (class 1259 OID 11515595)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2670 (class 1259 OID 11515594)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2536 (class 1259 OID 11515237)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 11515236)
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
-- TOC entry 2512 (class 1259 OID 11515160)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2622 (class 1259 OID 11515434)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2576 (class 1259 OID 11515328)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2502 (class 1259 OID 11515114)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2503 (class 1259 OID 11515115)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2627 (class 1259 OID 11515454)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2628 (class 1259 OID 11515453)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2629 (class 1259 OID 11515452)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2550 (class 1259 OID 11515272)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2551 (class 1259 OID 11515274)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2552 (class 1259 OID 11515273)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2713 (class 1259 OID 11515750)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2586 (class 1259 OID 11515362)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2587 (class 1259 OID 11515360)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2588 (class 1259 OID 11515359)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2589 (class 1259 OID 11515361)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2493 (class 1259 OID 11515088)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2494 (class 1259 OID 11515089)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 11515418)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2743 (class 1259 OID 11515844)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2744 (class 1259 OID 11515852)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2745 (class 1259 OID 11515853)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2601 (class 1259 OID 11515383)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2643 (class 1259 OID 11515495)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2644 (class 1259 OID 11515496)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2687 (class 1259 OID 11515672)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2688 (class 1259 OID 11515671)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2689 (class 1259 OID 11515668)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2690 (class 1259 OID 11515669)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2691 (class 1259 OID 11515670)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2525 (class 1259 OID 11515202)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 11515201)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2527 (class 1259 OID 11515203)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2486 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2695 (class 1259 OID 11515700)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2696 (class 1259 OID 11515701)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2680 (class 1259 OID 11515626)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2681 (class 1259 OID 11515627)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2682 (class 1259 OID 11515624)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2683 (class 1259 OID 11515625)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2640 (class 1259 OID 11515486)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 11515371)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2593 (class 1259 OID 11515370)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2594 (class 1259 OID 11515368)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2595 (class 1259 OID 11515369)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2464 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2676 (class 1259 OID 11515614)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2677 (class 1259 OID 11515613)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2692 (class 1259 OID 11515691)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2557 (class 1259 OID 11515285)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2710 (class 1259 OID 11515737)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2737 (class 1259 OID 11515827)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2738 (class 1259 OID 11515828)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2508 (class 1259 OID 11515135)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2509 (class 1259 OID 11515134)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2517 (class 1259 OID 11515167)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 11515168)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2581 (class 1259 OID 11515352)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2582 (class 1259 OID 11515351)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2583 (class 1259 OID 11515350)
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
-- TOC entry 2564 (class 1259 OID 11515317)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2565 (class 1259 OID 11515313)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2566 (class 1259 OID 11515310)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2567 (class 1259 OID 11515311)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2568 (class 1259 OID 11515309)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2569 (class 1259 OID 11515314)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2570 (class 1259 OID 11515312)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2524 (class 1259 OID 11515187)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2542 (class 1259 OID 11515251)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 11515253)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2544 (class 1259 OID 11515252)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2545 (class 1259 OID 11515254)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2600 (class 1259 OID 11515377)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 11515561)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2671 (class 1259 OID 11515592)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2515 (class 1259 OID 11515158)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2516 (class 1259 OID 11515159)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2637 (class 1259 OID 11515479)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 11515761)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 11515223)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2716 (class 1259 OID 11515749)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2620 (class 1259 OID 11515428)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2621 (class 1259 OID 11515427)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2684 (class 1259 OID 11515623)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2532 (class 1259 OID 11515211)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 11515574)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 11515801)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2701 (class 1259 OID 11515708)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 11515709)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2501 (class 1259 OID 11515108)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2571 (class 1259 OID 11515316)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2773 (class 2606 OID 11515989)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2776 (class 2606 OID 11515974)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2775 (class 2606 OID 11515979)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2771 (class 2606 OID 11515999)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2777 (class 2606 OID 11515969)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2772 (class 2606 OID 11515994)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2774 (class 2606 OID 11515984)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2807 (class 2606 OID 11516144)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 11516149)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 11516319)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2841 (class 2606 OID 11516314)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2758 (class 2606 OID 11515904)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2794 (class 2606 OID 11516084)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2835 (class 2606 OID 11516299)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2836 (class 2606 OID 11516294)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2834 (class 2606 OID 11516304)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2837 (class 2606 OID 11516289)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2838 (class 2606 OID 11516284)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2792 (class 2606 OID 11516079)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2793 (class 2606 OID 11516074)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2770 (class 2606 OID 11515964)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 11516114)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 11516124)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2801 (class 2606 OID 11516119)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2764 (class 2606 OID 11515939)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 11515934)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 11516064)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2831 (class 2606 OID 11516269)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2810 (class 2606 OID 11516154)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2809 (class 2606 OID 11516159)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2808 (class 2606 OID 11516164)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2839 (class 2606 OID 11516309)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2812 (class 2606 OID 11516184)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2815 (class 2606 OID 11516169)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2811 (class 2606 OID 11516189)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2813 (class 2606 OID 11516179)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2814 (class 2606 OID 11516174)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2762 (class 2606 OID 11515929)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 11515924)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 11515889)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2755 (class 2606 OID 11515884)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2796 (class 2606 OID 11516094)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2778 (class 2606 OID 11516004)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 11515864)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2750 (class 2606 OID 11515869)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2797 (class 2606 OID 11516109)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2798 (class 2606 OID 11516104)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2799 (class 2606 OID 11516099)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2768 (class 2606 OID 11515944)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2766 (class 2606 OID 11515954)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2767 (class 2606 OID 11515949)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2833 (class 2606 OID 11516279)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2782 (class 2606 OID 11516039)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2784 (class 2606 OID 11516029)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2785 (class 2606 OID 11516024)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2783 (class 2606 OID 11516034)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2749 (class 2606 OID 11515854)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2748 (class 2606 OID 11515859)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2795 (class 2606 OID 11516089)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2844 (class 2606 OID 11516334)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 11516339)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2845 (class 2606 OID 11516344)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2791 (class 2606 OID 11516069)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2805 (class 2606 OID 11516134)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2804 (class 2606 OID 11516139)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2822 (class 2606 OID 11516244)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2823 (class 2606 OID 11516239)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2826 (class 2606 OID 11516224)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2825 (class 2606 OID 11516229)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2824 (class 2606 OID 11516234)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2760 (class 2606 OID 11515914)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 11515909)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2759 (class 2606 OID 11515919)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2829 (class 2606 OID 11516254)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2828 (class 2606 OID 11516259)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2819 (class 2606 OID 11516214)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2818 (class 2606 OID 11516219)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2821 (class 2606 OID 11516204)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2820 (class 2606 OID 11516209)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2803 (class 2606 OID 11516129)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2786 (class 2606 OID 11516059)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2787 (class 2606 OID 11516054)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2789 (class 2606 OID 11516044)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2788 (class 2606 OID 11516049)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2816 (class 2606 OID 11516199)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2817 (class 2606 OID 11516194)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2827 (class 2606 OID 11516249)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2769 (class 2606 OID 11515959)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2830 (class 2606 OID 11516264)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2832 (class 2606 OID 11516274)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2843 (class 2606 OID 11516324)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2842 (class 2606 OID 11516329)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2752 (class 2606 OID 11515879)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2753 (class 2606 OID 11515874)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2757 (class 2606 OID 11515894)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2756 (class 2606 OID 11515899)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 11516019)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 11516014)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2781 (class 2606 OID 11516009)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-03 13:13:11 CEST

--
-- PostgreSQL database dump complete
--

