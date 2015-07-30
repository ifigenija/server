--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-30 16:47:45 CEST

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
-- TOC entry 183 (class 1259 OID 11201312)
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
-- TOC entry 228 (class 1259 OID 11201811)
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
-- TOC entry 227 (class 1259 OID 11201794)
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
-- TOC entry 221 (class 1259 OID 11201706)
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
-- TOC entry 244 (class 1259 OID 11202027)
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
-- TOC entry 197 (class 1259 OID 11201491)
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
-- TOC entry 200 (class 1259 OID 11201525)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11201929)
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
-- TOC entry 192 (class 1259 OID 11201434)
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
-- TOC entry 229 (class 1259 OID 11201824)
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
-- TOC entry 216 (class 1259 OID 11201651)
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
-- TOC entry 195 (class 1259 OID 11201471)
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
-- TOC entry 199 (class 1259 OID 11201519)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11201451)
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
-- TOC entry 205 (class 1259 OID 11201568)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11202008)
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
-- TOC entry 243 (class 1259 OID 11202020)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11202043)
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
-- TOC entry 209 (class 1259 OID 11201593)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11201408)
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
-- TOC entry 184 (class 1259 OID 11201321)
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
-- TOC entry 185 (class 1259 OID 11201332)
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
-- TOC entry 180 (class 1259 OID 11201286)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11201305)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11201600)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11201631)
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
-- TOC entry 224 (class 1259 OID 11201745)
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
-- TOC entry 187 (class 1259 OID 11201365)
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
-- TOC entry 189 (class 1259 OID 11201400)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11201574)
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
-- TOC entry 188 (class 1259 OID 11201385)
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
-- TOC entry 194 (class 1259 OID 11201463)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11201586)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11201889)
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
-- TOC entry 232 (class 1259 OID 11201900)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11201870)
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
-- TOC entry 233 (class 1259 OID 11201908)
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
-- TOC entry 212 (class 1259 OID 11201615)
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
-- TOC entry 204 (class 1259 OID 11201559)
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
-- TOC entry 203 (class 1259 OID 11201549)
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
-- TOC entry 223 (class 1259 OID 11201734)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11201683)
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
-- TOC entry 177 (class 1259 OID 11201257)
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
-- TOC entry 176 (class 1259 OID 11201255)
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
-- TOC entry 213 (class 1259 OID 11201625)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11201295)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11201279)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11201639)
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
-- TOC entry 207 (class 1259 OID 11201580)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11201530)
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
-- TOC entry 238 (class 1259 OID 11201949)
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
-- TOC entry 237 (class 1259 OID 11201941)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11201936)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11201693)
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
-- TOC entry 186 (class 1259 OID 11201357)
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
-- TOC entry 202 (class 1259 OID 11201536)
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
-- TOC entry 222 (class 1259 OID 11201723)
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
-- TOC entry 234 (class 1259 OID 11201918)
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
-- TOC entry 191 (class 1259 OID 11201420)
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
-- TOC entry 178 (class 1259 OID 11201266)
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
-- TOC entry 226 (class 1259 OID 11201771)
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
-- TOC entry 196 (class 1259 OID 11201482)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11201607)
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
-- TOC entry 240 (class 1259 OID 11201988)
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
-- TOC entry 239 (class 1259 OID 11201960)
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
-- TOC entry 241 (class 1259 OID 11202000)
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
-- TOC entry 218 (class 1259 OID 11201676)
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
-- TOC entry 198 (class 1259 OID 11201514)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11201761)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11201666)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2245 (class 2604 OID 11201260)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2969 (class 0 OID 11201312)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 11201811)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ba-3911-4ac9-859390637f77	000d0000-55ba-3910-3fa5-1766abb5fda2	\N	00090000-55ba-3910-b64e-bf3763538c8f	000b0000-55ba-3910-77d0-6c81a76e5f76	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55ba-3911-ff51-e617d5311101	000d0000-55ba-3910-f44e-05a27c0b47b8	00100000-55ba-3910-1de4-113205131bf5	00090000-55ba-3910-82a7-e59bde83541c	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55ba-3911-5932-e2604b364813	000d0000-55ba-3910-4385-5e3a35b323f9	00100000-55ba-3910-5ee7-e6997c4cb757	00090000-55ba-3910-5ffa-d2ef65957595	\N	0003	t	\N	2015-07-30	\N	2	\N	\N	f	f
000c0000-55ba-3911-6bf5-606440dba305	000d0000-55ba-3910-c4ab-86fbd0e1b436	\N	00090000-55ba-3910-baeb-3aaf53f265c7	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55ba-3911-8349-6aa9ac066543	000d0000-55ba-3910-846c-69a1e86514c4	\N	00090000-55ba-3910-66af-40de7aa06dfc	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55ba-3911-1794-7149469061f0	000d0000-55ba-3910-b995-b865ea94b742	\N	00090000-55ba-3910-126d-57319382e9a0	000b0000-55ba-3910-a0c6-25b043730d98	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55ba-3911-898a-6514ab92d238	000d0000-55ba-3910-0ac9-4419bbeb3cff	00100000-55ba-3910-6d22-b1d7bb09a642	00090000-55ba-3910-e913-fc061a511d31	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55ba-3911-454d-1a6e8cb65707	000d0000-55ba-3910-6df6-6dfd06364de7	\N	00090000-55ba-3910-47c6-5e083a2cba2f	000b0000-55ba-3910-0218-e43c6f03ced1	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55ba-3911-803a-bd4650f62497	000d0000-55ba-3910-0ac9-4419bbeb3cff	00100000-55ba-3910-2ff2-a76e5bb97413	00090000-55ba-3910-f935-0f0fe41ff333	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55ba-3911-80c2-169d8ebee515	000d0000-55ba-3910-0ac9-4419bbeb3cff	00100000-55ba-3910-91b6-d8a1349a72cb	00090000-55ba-3910-faa9-93d5550b6705	\N	0010	t	\N	2015-07-30	\N	16	\N	\N	f	t
000c0000-55ba-3911-1f8c-c76fe4e69b0e	000d0000-55ba-3910-0ac9-4419bbeb3cff	00100000-55ba-3910-ba67-2f1e573a0b37	00090000-55ba-3910-629f-9f24b4d7abc2	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3013 (class 0 OID 11201794)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11201706)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ba-3910-3f89-133ca1ff3e06	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ba-3910-27cd-53e2d100d6c6	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55ba-3910-23f7-e6e1f62ca542	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3030 (class 0 OID 11202027)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 11201491)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55ba-3911-1aa6-4925711c4c3e	\N	\N	00200000-55ba-3911-270b-39f401b06918	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55ba-3911-9843-54227bc6ea8d	\N	\N	00200000-55ba-3911-0d97-ef7d0e3c3cf8	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55ba-3911-ce43-d74f64510818	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55ba-3911-8fcd-49b2335e6a29	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55ba-3911-2535-ecdd94fa941d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2986 (class 0 OID 11201525)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 11201929)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11201434)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ba-390f-40e0-6b4cdf288e48	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ba-390f-b86c-8f0b44b061b7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ba-390f-94f7-e1cdbdb41d93	AL	ALB	008	Albania 	Albanija	\N
00040000-55ba-390f-63c8-6427046f285c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ba-390f-518c-293ff624c806	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ba-390f-f088-c1a85b548e3c	AD	AND	020	Andorra 	Andora	\N
00040000-55ba-390f-346b-333db70915ad	AO	AGO	024	Angola 	Angola	\N
00040000-55ba-390f-465e-0b1cc672deb8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ba-390f-80c7-b8e9f5914775	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ba-390f-f812-27f178173eed	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ba-390f-f7a2-11e23bf49eeb	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ba-390f-8232-eb7a929f6d7d	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ba-390f-bda4-ca21a74ecb34	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ba-390f-d036-7ed52510ab05	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ba-390f-b16f-7495a6cf88d4	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ba-390f-7dde-da79dbe660dc	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ba-390f-d6fd-832f94ea3294	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ba-390f-7086-f3721955f197	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ba-390f-bf0f-c634e44b5964	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ba-390f-bc1b-f243e92cf8a9	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ba-390f-5748-a2161c90b22b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ba-390f-09e3-7543119d8930	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ba-390f-3ed5-3bbfd80e182a	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ba-390f-6fec-d6c17948a95a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ba-390f-055a-4c247959f901	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ba-390f-86e6-cbc13dcbcbcc	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ba-390f-cb38-6e62195d4a17	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ba-390f-fd7d-6999fef80251	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ba-390f-bd85-6b40b2fcaca5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ba-390f-7e08-df5551df8b42	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ba-390f-8bfd-1f15b070769f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ba-390f-a3f2-0a2fa6d8a46c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ba-390f-5813-61663ba76105	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ba-390f-3d2b-e089bfdfaaf4	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ba-390f-3bbe-acbf6046ebc8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ba-390f-2ddb-1e54c68f7abe	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ba-390f-4c8d-a9f8aa787d2e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ba-390f-8b49-4fa8f6ccbe57	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ba-390f-b375-4dbb98500982	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ba-390f-23e9-d8a6159df1a8	CA	CAN	124	Canada 	Kanada	\N
00040000-55ba-390f-d548-df4b6c261241	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ba-390f-2754-accbef96ed21	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ba-390f-d8b6-c2d232f2dc93	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ba-390f-5058-e1f0144df7ef	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ba-390f-f0a9-30d8bc0ed3ec	CL	CHL	152	Chile 	Čile	\N
00040000-55ba-390f-9745-a90645ad6b41	CN	CHN	156	China 	Kitajska	\N
00040000-55ba-390f-7e34-ae1aa431c5e4	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ba-390f-4b95-e6e42f430740	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ba-390f-30fe-fa7b5a612d0b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ba-390f-97cc-e75c6b916876	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ba-390f-587b-b2d5ce73274c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ba-390f-1d78-d5dc5b577d20	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ba-390f-430a-2007cb82804f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ba-390f-9bb8-dec1301b4a84	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ba-390f-f2eb-031770bfcd5d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ba-390f-53d0-01dc75c78b84	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ba-390f-53e1-06775f557ab9	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ba-390f-6597-c4638bc3c931	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ba-390f-6bab-4e5d6434a02d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ba-390f-5b7a-b4e15d5ad135	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ba-390f-1c0e-7c0142b31bbe	DK	DNK	208	Denmark 	Danska	\N
00040000-55ba-390f-8814-754637b28484	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ba-390f-9fb3-5a62163bf0fe	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ba-390f-da83-cb764722147c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ba-390f-cb72-82798f5dbd90	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ba-390f-8ff2-2f5fce89f620	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ba-390f-dd2f-143884dd56c7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ba-390f-f126-5aa8df4d4589	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ba-390f-6987-a98627222a23	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ba-390f-5899-8eee397b1edf	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ba-390f-f889-ca50ac074fdd	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ba-390f-85cc-4d6f3fea7fee	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ba-390f-28b4-ac1a4b2a23a9	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ba-390f-2fad-7309595fdb34	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ba-390f-598b-20c2cb491109	FI	FIN	246	Finland 	Finska	\N
00040000-55ba-390f-9887-d8250743d769	FR	FRA	250	France 	Francija	\N
00040000-55ba-390f-3fef-fc655c07b849	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ba-390f-957e-2e0079d23447	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ba-390f-1cfc-c19bdbf7c930	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ba-390f-6833-2e4c8c13cd76	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ba-390f-01a3-d9c53338af6b	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ba-390f-0297-6ad8dd3f54e1	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ba-390f-97dd-c160dbe4f6f1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ba-390f-6d97-e33293baa365	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ba-390f-2e1a-9430041845d7	GH	GHA	288	Ghana 	Gana	\N
00040000-55ba-390f-6c19-4da162a12276	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ba-390f-181b-18c5f23ab1f0	GR	GRC	300	Greece 	Grčija	\N
00040000-55ba-390f-aed4-faf6fc90a81a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ba-390f-211b-55bdeb3ab1ee	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ba-390f-23cc-088297ab11d1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ba-390f-c57f-ddb3a182ef3b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ba-390f-2b70-f954f0f9da31	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ba-390f-9e37-162544f68886	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ba-390f-5f98-9fe141b97355	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ba-390f-e916-f92bfc7d7e80	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ba-390f-19ba-5b6a3d941f4d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ba-390f-1075-246e09dbf19f	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ba-390f-261c-d99af08cab1e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ba-390f-90e2-f013a177f382	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ba-390f-8a78-44f08768e69f	HN	HND	340	Honduras 	Honduras	\N
00040000-55ba-390f-75bb-185542c60c9d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ba-390f-3cb5-e1133e089747	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ba-390f-491d-4edd51a7b71c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ba-390f-d03b-17b844aab295	IN	IND	356	India 	Indija	\N
00040000-55ba-390f-7a7b-59ef45cf80f9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ba-390f-b250-f5b3fd754f40	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ba-390f-32b7-cfb2014e6715	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ba-390f-12ac-5553f5927f99	IE	IRL	372	Ireland 	Irska	\N
00040000-55ba-390f-752c-e02571fabdaa	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ba-390f-abb9-ddd02c388cd4	IL	ISR	376	Israel 	Izrael	\N
00040000-55ba-390f-bbe2-7a0251d7c2e2	IT	ITA	380	Italy 	Italija	\N
00040000-55ba-390f-eaa7-8a650ed52f8d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ba-390f-0b7e-d3d7c7c3f528	JP	JPN	392	Japan 	Japonska	\N
00040000-55ba-390f-edb1-305f9b9529fd	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ba-390f-234a-f189d5915fb6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ba-390f-d126-6e4164ba8574	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ba-390f-4b51-89ff1b373149	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ba-390f-ff35-7072373008ce	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ba-390f-db2a-5a583c620639	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ba-390f-c9bb-dfb942a78cd8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ba-390f-8f56-9013fc3b9d74	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ba-390f-9b53-2a2a994b5c67	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ba-390f-0d93-6fab4fd60c60	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ba-390f-782d-d235ac063fa6	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ba-390f-9e52-409533c43ad9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ba-390f-22a1-d2ac572475ff	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ba-390f-8569-a968e5d355e1	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ba-390f-96a5-e5726fe8476e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ba-390f-0c8b-a39dc6bf5557	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ba-390f-5f4d-50b787cc7efe	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ba-390f-c373-8eaeb0dc0042	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ba-390f-3f06-672ef10f08db	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ba-390f-57ca-79095818c8ef	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ba-390f-cc20-9348efa70ebe	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ba-390f-d0ef-abcff6570d99	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ba-390f-e137-9d4af1b61ad9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ba-390f-29e6-b10246b3af51	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ba-390f-5ea4-b6ea0831edc7	ML	MLI	466	Mali 	Mali	\N
00040000-55ba-390f-2cd9-a05b91d7f062	MT	MLT	470	Malta 	Malta	\N
00040000-55ba-390f-fa80-56c9ed00a05a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ba-390f-dc1c-0ec06088ecf9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ba-390f-8c59-35fee56da1bb	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ba-390f-dbf5-6b005cb59701	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ba-390f-e4da-aa96f0c003b4	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ba-390f-a654-67b72c4ead76	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ba-390f-6bfa-9056163e6bfd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ba-390f-af2f-ac72e7a1f557	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ba-390f-aea8-ce5ef3d3d481	MC	MCO	492	Monaco 	Monako	\N
00040000-55ba-390f-92ff-d33ecac9c99a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ba-390f-cb88-1b0a6d78edde	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ba-390f-bcff-fc742405aa12	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ba-390f-64c5-7f7dc2a29f83	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ba-390f-6cf4-53bf39009501	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ba-390f-37bf-4d8582787106	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ba-390f-c0d6-73f6ae511fe2	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ba-390f-d525-4332ea6a938f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ba-390f-f5a5-3606161a78b6	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ba-390f-1d6c-66c0aa0f460e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ba-390f-3b33-67471ea3cf5c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ba-390f-8629-7c713c9d7d54	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ba-390f-c659-ac2210335832	NE	NER	562	Niger 	Niger 	\N
00040000-55ba-390f-c29b-656fb8a497cb	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ba-390f-c9d8-8b5cf14e24de	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ba-390f-5fe9-3e4d71207b54	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ba-390f-5bc7-7cd7061fda34	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ba-390f-5519-433ef4a6e5ab	NO	NOR	578	Norway 	Norveška	\N
00040000-55ba-390f-4534-7d5ec704f13c	OM	OMN	512	Oman 	Oman	\N
00040000-55ba-390f-b798-2b58f36f9dbb	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ba-390f-6e37-be2f9aa022db	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ba-390f-7e76-f4fbbb73c0c3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ba-390f-9b9b-2e4db4e7fe2a	PA	PAN	591	Panama 	Panama	\N
00040000-55ba-390f-af73-1d7c5f399915	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ba-390f-3776-e9a1266f76f1	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ba-390f-2e69-3f41d4bdd4f5	PE	PER	604	Peru 	Peru	\N
00040000-55ba-390f-0fe4-610e53d22454	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ba-390f-7690-9492da172b9a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ba-390f-8b8a-ba9e0c673a1a	PL	POL	616	Poland 	Poljska	\N
00040000-55ba-390f-e6f2-8153480d50f2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ba-390f-e0a5-d52ad303de8a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ba-390f-8c22-4fdd0467fae5	QA	QAT	634	Qatar 	Katar	\N
00040000-55ba-390f-4423-ed1398c4d9a3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ba-390f-711e-e3a5778e3634	RO	ROU	642	Romania 	Romunija	\N
00040000-55ba-390f-29d8-afa32174fa49	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ba-390f-0152-6123e7cf216a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ba-390f-4820-09ad18b06fcb	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ba-390f-bbbc-0dca6f3e9795	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ba-390f-6f9c-b11854e0ed26	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ba-390f-779c-dff6939bf516	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ba-390f-92d8-2b9f422f7e9c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ba-390f-93fd-2e83b80feb2b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ba-390f-f0a7-8c4c50f4db02	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ba-390f-265f-9afc44dbf86f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ba-390f-0423-aa056f507bc3	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ba-390f-5bca-9d451b7aceb2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ba-390f-7149-1738a704bd2e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ba-390f-4d42-f5006c854288	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ba-390f-b21f-516aa4ea211e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ba-390f-178f-e8050747fd72	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ba-390f-6ac2-9c08854e28f8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ba-390f-bbee-d030f332c966	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ba-390f-e8fe-b77ea6ab42d1	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ba-390f-4680-9478c80e5327	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ba-390f-6d27-257027e06250	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ba-390f-10bf-a34dfa806c77	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ba-390f-dc5e-ad1e377b07e9	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ba-390f-4b3e-cc2b52b1f9db	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ba-390f-bcca-b8405542e671	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ba-390f-57a7-1e751185a306	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ba-390f-6e68-3ee9a440a1bf	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ba-390f-6988-52ebe0eaa39b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ba-390f-8eaa-8575181e68c1	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ba-390f-18e8-8fc028f67d2c	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ba-390f-572d-728cd70942b8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ba-390f-17ef-551c828f0238	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ba-390f-95d0-e65f9c16d93c	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ba-390f-6d7a-9133eba17b97	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ba-390f-6d9e-9e9bb2425baf	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ba-390f-d865-e8b46d6947c5	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ba-390f-52d5-2b98706d4aac	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ba-390f-1aa1-1d20c0b0ed4c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ba-390f-c5e6-59fe3716f848	TH	THA	764	Thailand 	Tajska	\N
00040000-55ba-390f-d389-a38994c7e9df	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ba-390f-341b-5ca926b6eaa6	TG	TGO	768	Togo 	Togo	\N
00040000-55ba-390f-f48a-e1bb25a641cc	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ba-390f-cb7a-76e2f0311024	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ba-390f-7fa2-2939e19eb3f0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ba-390f-8f9e-5e720ef46e2f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ba-390f-2196-eb04c79f9535	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ba-390f-09ce-7015801be3a6	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ba-390f-76c3-cbb8b49cdfb5	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ba-390f-7741-067652e1a2e7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ba-390f-f370-e4e4e4e40210	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ba-390f-3131-caf54cb5366b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ba-390f-971b-744bb6029cd2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ba-390f-62ca-c815769fef3a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ba-390f-5b17-ad510df7fe83	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ba-390f-a7ec-ac264e76fc52	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ba-390f-b29f-e6450b9c7135	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ba-390f-8755-d935d364d089	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ba-390f-1b2d-4978e5655210	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ba-390f-1caa-9865898cd450	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ba-390f-2d0d-23b750506982	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ba-390f-9db5-f261c9a0ea5a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ba-390f-a1ce-64093ad6d8c1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ba-390f-cec1-a715f3dd6858	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ba-390f-c1ec-a58a39b721af	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ba-390f-f332-b21ab273da5f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ba-390f-b5f7-0f6c59ca2ad2	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ba-390f-9b1a-d86e2ffce47c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3015 (class 0 OID 11201824)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55ba-3911-d79b-dd30132020b6	000e0000-55ba-3910-941a-31abec8a2576	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55ba-390f-29d5-46fac0d1aac4	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ba-3911-1b41-ab80c557f193	000e0000-55ba-3910-ff91-7dd37e0a231f	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55ba-390f-0755-3330e663f230	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ba-3911-fc9b-befa97d3fcbe	\N	\N	\N	300.00	300.00	0.00	0.00	20.00	60.00	200.11	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ba-3911-4308-861fc5e88bdc	\N	\N	\N	203.00	203.00	0.00	0.00	30.00	60.90	100.22	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3002 (class 0 OID 11201651)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ba-3910-0ac9-4419bbeb3cff	000e0000-55ba-3910-ff91-7dd37e0a231f	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ba-390f-9992-d36f2a6d963e
000d0000-55ba-3910-3fa5-1766abb5fda2	000e0000-55ba-3910-ff91-7dd37e0a231f	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ba-390f-9992-d36f2a6d963e
000d0000-55ba-3910-f44e-05a27c0b47b8	000e0000-55ba-3910-ff91-7dd37e0a231f	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ba-390f-b1a7-bc0974792e4b
000d0000-55ba-3910-4385-5e3a35b323f9	000e0000-55ba-3910-ff91-7dd37e0a231f	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ba-390f-05ad-a59cde0d2e66
000d0000-55ba-3910-c4ab-86fbd0e1b436	000e0000-55ba-3910-ff91-7dd37e0a231f	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ba-390f-4b69-3fa3301a50e2
000d0000-55ba-3910-846c-69a1e86514c4	000e0000-55ba-3910-ff91-7dd37e0a231f	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55ba-390f-2198-60dc12e7b7f9
000d0000-55ba-3910-b995-b865ea94b742	000e0000-55ba-3910-ff91-7dd37e0a231f	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ba-390f-9992-d36f2a6d963e
000d0000-55ba-3910-6df6-6dfd06364de7	000e0000-55ba-3910-ff91-7dd37e0a231f	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ba-390f-db27-466415f04c9e
\.


--
-- TOC entry 2981 (class 0 OID 11201471)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 11201519)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 11201451)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ba-3910-6f41-1ee005aeeb4d	00080000-55ba-3910-4b9a-b3a0fede9d2a	00090000-55ba-3910-faa9-93d5550b6705	AK		
\.


--
-- TOC entry 2956 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11201568)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11202008)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11202020)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 11202043)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11201593)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 11201408)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ba-390f-31f5-30e52e303ddb	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55ba-390f-2c9a-13a575a5efdc	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ba-390f-bb58-04806c1ea07a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ba-390f-6460-a072dc224088	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ba-390f-2d47-6be398d90514	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ba-390f-857f-7f6c88f63d73	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55ba-390f-e692-c542811395fd	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ba-390f-62f7-500c10833b0b	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55ba-390f-9225-35ebcb03658f	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55ba-390f-d44d-616e2e580250	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ba-390f-7dcd-5d73b8893e92	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ba-390f-fe54-f88e91530af8	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ba-390f-bdc2-b149f6a578a9	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55ba-390f-3c3a-f70acfb7f9ab	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ba-3910-6013-5c0c619a9e44	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55ba-3910-bbd3-c7c871c4c7f9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ba-3910-c563-5d94cd34583f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ba-3910-98cb-44804a7d1f8f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ba-3910-32c5-920216220a33	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ba-3910-05f9-c3967b80e6a4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2970 (class 0 OID 11201321)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ba-3910-c1e4-f14f09266efb	00000000-55ba-3910-bbd3-c7c871c4c7f9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ba-3910-cb54-5d5d36291fe1	00000000-55ba-3910-bbd3-c7c871c4c7f9	00010000-55ba-390f-9a36-a77a09ab67e1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ba-3910-5d9c-4d236d21eede	00000000-55ba-3910-c563-5d94cd34583f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2971 (class 0 OID 11201332)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ba-3910-b64e-bf3763538c8f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ba-3910-baeb-3aaf53f265c7	00010000-55ba-3910-969d-18022067b44b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ba-3910-5ffa-d2ef65957595	00010000-55ba-3910-2d4c-c7d3ea3a500b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ba-3910-f935-0f0fe41ff333	00010000-55ba-3910-86af-749bcea8f41b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ba-3910-3838-5ef18ad7c215	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ba-3910-126d-57319382e9a0	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ba-3910-629f-9f24b4d7abc2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ba-3910-e913-fc061a511d31	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ba-3910-faa9-93d5550b6705	00010000-55ba-3910-6545-75c4f9bfbf2b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ba-3910-82a7-e59bde83541c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ba-3910-2954-af2f9fcc0f55	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ba-3910-66af-40de7aa06dfc	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ba-3910-47c6-5e083a2cba2f	00010000-55ba-3910-462c-418257fc6859	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2958 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 11201286)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ba-390f-58a6-352f1e7dff7d	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ba-390f-1a05-541ade50244d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ba-390f-ff1a-e7c1fb6a68ed	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ba-390f-3042-9024bd41f348	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ba-390f-75f9-3352087ce777	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ba-390f-2c35-a244f7536793	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ba-390f-4e97-97cf695e495e	Abonma-read	Abonma - branje	f
00030000-55ba-390f-3419-cf6f036db016	Abonma-write	Abonma - spreminjanje	f
00030000-55ba-390f-0e88-e44f6806e210	Alternacija-read	Alternacija - branje	f
00030000-55ba-390f-adc7-f0824c6247b9	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ba-390f-59ed-ba678073cafe	Arhivalija-read	Arhivalija - branje	f
00030000-55ba-390f-95d7-486bdb7d5755	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ba-390f-2e39-5369737ff961	Besedilo-read	Besedilo - branje	f
00030000-55ba-390f-70b2-5f334879158d	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ba-390f-5277-6bce64ff9ca6	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ba-390f-6d47-445837cf2df5	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ba-390f-a857-913ce378a901	Dogodek-read	Dogodek - branje	f
00030000-55ba-390f-0c4e-ea87b7ab60d7	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ba-390f-7a0d-eb7bf071f87b	DrugiVir-read	DrugiVir - branje	f
00030000-55ba-390f-6f0c-227dbfa2d3f4	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ba-390f-9265-96a4ba5c3904	Drzava-read	Drzava - branje	f
00030000-55ba-390f-76ec-87140cd04ad6	Drzava-write	Drzava - spreminjanje	f
00030000-55ba-390f-848c-6f371060aa35	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ba-390f-f948-e04c0ddd432c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ba-390f-9741-558b36d9638a	Funkcija-read	Funkcija - branje	f
00030000-55ba-390f-7c0b-df9e7e46019e	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ba-390f-e8f3-adc8a6b8bad7	Gostovanje-read	Gostovanje - branje	f
00030000-55ba-390f-09f7-67b12482d9bc	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ba-390f-fddf-789890bbb81b	Gostujoca-read	Gostujoca - branje	f
00030000-55ba-390f-3a97-6aa738cfc7f3	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ba-390f-1ba6-1044791d77c7	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ba-390f-7a31-26dfa8cca0b0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ba-390f-2a05-d3877d6804bc	Kupec-read	Kupec - branje	f
00030000-55ba-390f-fd46-7cd3dba7e0c7	Kupec-write	Kupec - spreminjanje	f
00030000-55ba-390f-7880-41061f803d9d	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ba-390f-b654-449d5a36dd9f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ba-390f-9fbc-4e5373caebc9	Option-read	Option - branje	f
00030000-55ba-390f-75ca-4bc33dd7905a	Option-write	Option - spreminjanje	f
00030000-55ba-390f-d618-3324e7234f5d	OptionValue-read	OptionValue - branje	f
00030000-55ba-390f-e120-628a391921c2	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ba-390f-2378-ba31997940a0	Oseba-read	Oseba - branje	f
00030000-55ba-390f-294e-a461a6fd3e02	Oseba-write	Oseba - spreminjanje	f
00030000-55ba-390f-c79f-b92a0be54c7d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ba-390f-b3cf-c221e1510f06	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ba-390f-9216-1dcd47dcae30	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ba-390f-72d4-c8864484855e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ba-390f-6dd7-87339e640d4a	Pogodba-read	Pogodba - branje	f
00030000-55ba-390f-860a-acdac76722f8	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ba-390f-8c2e-2f0ef42f3570	Popa-read	Popa - branje	f
00030000-55ba-390f-b507-8827ee301256	Popa-write	Popa - spreminjanje	f
00030000-55ba-390f-b189-3c03969b44c1	Posta-read	Posta - branje	f
00030000-55ba-390f-c149-ca7d192f2694	Posta-write	Posta - spreminjanje	f
00030000-55ba-390f-c32f-7be0015a216d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ba-390f-5ec4-20c20395d029	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ba-390f-7950-1f1861adb90e	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ba-390f-6e97-7963f400213d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ba-390f-9704-c9e3603b8f7b	Predstava-read	Predstava - branje	f
00030000-55ba-390f-4243-31070404d6a1	Predstava-write	Predstava - spreminjanje	f
00030000-55ba-390f-c112-2302556c9ad5	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ba-390f-b5da-7c4201bd3367	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ba-390f-ba99-f345a037b7d0	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ba-390f-0b4d-2039fe9f1d86	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ba-390f-21e0-7c10031f6b39	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ba-390f-281a-210928730d28	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ba-390f-cc2d-452455217727	ProgramDela-read	ProgramDela - branje	f
00030000-55ba-390f-a7f3-a2f39c0ca1ab	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ba-390f-18c4-00b2c7b29381	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ba-390f-1b23-e27bb50d26a3	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ba-390f-c8ef-fb55df4f46f8	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ba-390f-7787-1f786325fb63	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ba-390f-765a-d7000a42cb72	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ba-390f-957f-a256f4f11bed	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ba-390f-9ca7-c5b5d5e233b6	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ba-390f-12de-e436e945d4f5	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ba-390f-5e16-1f51b605b7d8	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ba-390f-2376-0013e051f83a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ba-390f-d011-504002b3bd04	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ba-390f-e6b9-64fc7c8d8297	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ba-390f-ef75-38723ee959c2	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ba-390f-e182-d21af4ffbd1b	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ba-390f-0b80-abac96bfdc38	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ba-390f-855b-d19e8d32b055	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ba-390f-5f5a-aba5bf8e87d9	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ba-390f-de9f-895a80103873	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ba-390f-617a-0d8992bfe1b4	Prostor-read	Prostor - branje	f
00030000-55ba-390f-2534-9f06f4380dff	Prostor-write	Prostor - spreminjanje	f
00030000-55ba-390f-f7d4-38696533588d	Racun-read	Racun - branje	f
00030000-55ba-390f-f4ab-a181058b6d66	Racun-write	Racun - spreminjanje	f
00030000-55ba-390f-3902-4ed6956e4b46	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ba-390f-7556-b95d304f62fb	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ba-390f-ed5a-05b86aa2d777	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ba-390f-2dca-eaf68c9b6a29	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ba-390f-1175-6577139c5946	Rekvizit-read	Rekvizit - branje	f
00030000-55ba-390f-db9b-a90d58a80682	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ba-390f-7adc-8f2098f00c7b	Revizija-read	Revizija - branje	f
00030000-55ba-390f-49c2-0c2e96aac099	Revizija-write	Revizija - spreminjanje	f
00030000-55ba-390f-2d2e-ee5e6df2b275	Rezervacija-read	Rezervacija - branje	f
00030000-55ba-390f-1ae9-f671d4a498bb	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ba-390f-8607-b3d7e024e595	SedezniRed-read	SedezniRed - branje	f
00030000-55ba-390f-d4a8-c1188912b521	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ba-390f-02fe-96c2dd62bec2	Sedez-read	Sedez - branje	f
00030000-55ba-390f-b3a5-61aa6042ac1e	Sedez-write	Sedez - spreminjanje	f
00030000-55ba-390f-15cf-3726fca6a287	Sezona-read	Sezona - branje	f
00030000-55ba-390f-dae4-b06cd10a4711	Sezona-write	Sezona - spreminjanje	f
00030000-55ba-390f-2caf-9eff45502a61	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ba-390f-daf5-d2369c267bfc	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ba-390f-3c4b-52c7e4b2ef01	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ba-390f-fb34-e6cce8dd03d6	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ba-390f-05a0-0878efda2045	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ba-390f-b62f-b64bf99960d6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ba-390f-fb49-0487c2a38781	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ba-390f-cf83-1ec125dd5c12	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ba-390f-2340-690781099ff2	Telefonska-read	Telefonska - branje	f
00030000-55ba-390f-d93d-0895b5f2714a	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ba-390f-57e9-c71be37a97c0	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ba-390f-f240-6302226c030d	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ba-390f-ac9e-7f687612397b	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ba-390f-cd5c-1a911c8e8035	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ba-390f-813a-1b6f7e97138c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ba-390f-9ba8-0fdc9cefd52b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ba-390f-1c3d-63af8af77fcf	Trr-read	Trr - branje	f
00030000-55ba-390f-a847-dfbb3c849413	Trr-write	Trr - spreminjanje	f
00030000-55ba-390f-1e65-07b732f4dc43	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ba-390f-03f0-8bcb64f906ed	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ba-390f-bc7a-b126631a94f2	Vaja-read	Vaja - branje	f
00030000-55ba-390f-a647-d3e1058e76cc	Vaja-write	Vaja - spreminjanje	f
00030000-55ba-390f-4d2b-184c9da8f060	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ba-390f-a1a6-b86ee6729286	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ba-390f-296f-354632b4bd2a	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ba-390f-5429-2b93d805353a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ba-390f-3e46-7b64a3082ed4	Zasedenost-read	Zasedenost - branje	f
00030000-55ba-390f-a9a7-82c3794ce602	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ba-390f-01eb-ddb21d301ba3	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ba-390f-0af3-fa48fbbea62b	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ba-390f-1c6d-7024277a9b96	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ba-390f-7489-fe8f8458fe60	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ba-390f-4edf-8f170b809471	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ba-390f-0e56-11c83939c48e	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ba-390f-9299-53c5de7140fc	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ba-390f-cf4b-314af2aef9c7	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ba-390f-957a-5429335713cb	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ba-390f-8f3a-832fa0c1f7a3	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ba-390f-01ce-e53ce8f02fd2	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ba-390f-74f5-0a285f0b3720	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ba-390f-65a5-c3b91797a483	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ba-390f-6dcd-5065befa4fb7	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ba-390f-d4d1-c4dee953a748	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ba-390f-152b-75f1273259b8	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2968 (class 0 OID 11201305)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ba-390f-d344-939a06e5c3c2	00030000-55ba-390f-1a05-541ade50244d
00020000-55ba-390f-04fe-09c8f9c039b1	00030000-55ba-390f-9265-96a4ba5c3904
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-4e97-97cf695e495e
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-3419-cf6f036db016
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-0e88-e44f6806e210
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-adc7-f0824c6247b9
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-59ed-ba678073cafe
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-a857-913ce378a901
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-3042-9024bd41f348
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-0c4e-ea87b7ab60d7
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-9265-96a4ba5c3904
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-76ec-87140cd04ad6
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-9741-558b36d9638a
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-7c0b-df9e7e46019e
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-e8f3-adc8a6b8bad7
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-09f7-67b12482d9bc
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-fddf-789890bbb81b
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-3a97-6aa738cfc7f3
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-1ba6-1044791d77c7
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-7a31-26dfa8cca0b0
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-9fbc-4e5373caebc9
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-d618-3324e7234f5d
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-2378-ba31997940a0
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-294e-a461a6fd3e02
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-8c2e-2f0ef42f3570
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-b507-8827ee301256
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-b189-3c03969b44c1
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-c149-ca7d192f2694
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-7950-1f1861adb90e
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-6e97-7963f400213d
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-9704-c9e3603b8f7b
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-4243-31070404d6a1
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-21e0-7c10031f6b39
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-281a-210928730d28
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-617a-0d8992bfe1b4
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-2534-9f06f4380dff
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-ed5a-05b86aa2d777
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-2dca-eaf68c9b6a29
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-1175-6577139c5946
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-db9b-a90d58a80682
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-15cf-3726fca6a287
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-dae4-b06cd10a4711
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-ac9e-7f687612397b
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-1e65-07b732f4dc43
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-03f0-8bcb64f906ed
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-bc7a-b126631a94f2
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-a647-d3e1058e76cc
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-3e46-7b64a3082ed4
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-a9a7-82c3794ce602
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-01eb-ddb21d301ba3
00020000-55ba-390f-f036-29caab4d98a4	00030000-55ba-390f-1c6d-7024277a9b96
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-4e97-97cf695e495e
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-59ed-ba678073cafe
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-a857-913ce378a901
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-9265-96a4ba5c3904
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-e8f3-adc8a6b8bad7
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-fddf-789890bbb81b
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-1ba6-1044791d77c7
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-7a31-26dfa8cca0b0
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-9fbc-4e5373caebc9
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-d618-3324e7234f5d
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-2378-ba31997940a0
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-294e-a461a6fd3e02
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-8c2e-2f0ef42f3570
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-b189-3c03969b44c1
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-7950-1f1861adb90e
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-6e97-7963f400213d
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-9704-c9e3603b8f7b
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-617a-0d8992bfe1b4
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-ed5a-05b86aa2d777
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-1175-6577139c5946
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-15cf-3726fca6a287
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-2340-690781099ff2
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-d93d-0895b5f2714a
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-1c3d-63af8af77fcf
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-a847-dfbb3c849413
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-296f-354632b4bd2a
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-5429-2b93d805353a
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-01eb-ddb21d301ba3
00020000-55ba-390f-19e0-c7c98275cf7e	00030000-55ba-390f-1c6d-7024277a9b96
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-4e97-97cf695e495e
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-0e88-e44f6806e210
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-59ed-ba678073cafe
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-95d7-486bdb7d5755
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-2e39-5369737ff961
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-5277-6bce64ff9ca6
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-a857-913ce378a901
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-9265-96a4ba5c3904
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-9741-558b36d9638a
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-e8f3-adc8a6b8bad7
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-fddf-789890bbb81b
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-1ba6-1044791d77c7
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-9fbc-4e5373caebc9
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-d618-3324e7234f5d
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-2378-ba31997940a0
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-8c2e-2f0ef42f3570
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-b189-3c03969b44c1
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-9704-c9e3603b8f7b
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-21e0-7c10031f6b39
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-617a-0d8992bfe1b4
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-ed5a-05b86aa2d777
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-1175-6577139c5946
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-15cf-3726fca6a287
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-ac9e-7f687612397b
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-bc7a-b126631a94f2
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-3e46-7b64a3082ed4
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-01eb-ddb21d301ba3
00020000-55ba-390f-52ec-b005f84d44a8	00030000-55ba-390f-1c6d-7024277a9b96
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-4e97-97cf695e495e
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-3419-cf6f036db016
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-adc7-f0824c6247b9
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-59ed-ba678073cafe
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-a857-913ce378a901
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-9265-96a4ba5c3904
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-e8f3-adc8a6b8bad7
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-fddf-789890bbb81b
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-9fbc-4e5373caebc9
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-d618-3324e7234f5d
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-8c2e-2f0ef42f3570
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-b189-3c03969b44c1
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-9704-c9e3603b8f7b
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-617a-0d8992bfe1b4
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-ed5a-05b86aa2d777
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-1175-6577139c5946
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-15cf-3726fca6a287
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-ac9e-7f687612397b
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-01eb-ddb21d301ba3
00020000-55ba-390f-0252-f000260f7a95	00030000-55ba-390f-1c6d-7024277a9b96
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-4e97-97cf695e495e
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-59ed-ba678073cafe
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-a857-913ce378a901
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-9265-96a4ba5c3904
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-e8f3-adc8a6b8bad7
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-fddf-789890bbb81b
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-9fbc-4e5373caebc9
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-d618-3324e7234f5d
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-8c2e-2f0ef42f3570
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-b189-3c03969b44c1
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-9704-c9e3603b8f7b
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-617a-0d8992bfe1b4
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-ed5a-05b86aa2d777
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-1175-6577139c5946
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-15cf-3726fca6a287
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-57e9-c71be37a97c0
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-ff1a-e7c1fb6a68ed
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-ac9e-7f687612397b
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-01eb-ddb21d301ba3
00020000-55ba-390f-4cb2-84dd134e99d3	00030000-55ba-390f-1c6d-7024277a9b96
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-58a6-352f1e7dff7d
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-1a05-541ade50244d
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-ff1a-e7c1fb6a68ed
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-3042-9024bd41f348
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-75f9-3352087ce777
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-2c35-a244f7536793
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-4e97-97cf695e495e
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-3419-cf6f036db016
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-0e88-e44f6806e210
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-adc7-f0824c6247b9
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-59ed-ba678073cafe
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-95d7-486bdb7d5755
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-2e39-5369737ff961
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-70b2-5f334879158d
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-5277-6bce64ff9ca6
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-6d47-445837cf2df5
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-a857-913ce378a901
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-0c4e-ea87b7ab60d7
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-9265-96a4ba5c3904
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-76ec-87140cd04ad6
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-7a0d-eb7bf071f87b
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-6f0c-227dbfa2d3f4
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-848c-6f371060aa35
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-f948-e04c0ddd432c
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-9741-558b36d9638a
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-7c0b-df9e7e46019e
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-e8f3-adc8a6b8bad7
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-09f7-67b12482d9bc
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-fddf-789890bbb81b
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-3a97-6aa738cfc7f3
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-1ba6-1044791d77c7
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-7a31-26dfa8cca0b0
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-2a05-d3877d6804bc
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-fd46-7cd3dba7e0c7
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-7880-41061f803d9d
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-b654-449d5a36dd9f
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-9fbc-4e5373caebc9
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-75ca-4bc33dd7905a
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-d618-3324e7234f5d
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-e120-628a391921c2
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-2378-ba31997940a0
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-294e-a461a6fd3e02
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-c79f-b92a0be54c7d
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-b3cf-c221e1510f06
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-9216-1dcd47dcae30
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-72d4-c8864484855e
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-6dd7-87339e640d4a
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-860a-acdac76722f8
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-8c2e-2f0ef42f3570
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-b507-8827ee301256
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-b189-3c03969b44c1
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-c149-ca7d192f2694
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-c32f-7be0015a216d
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-5ec4-20c20395d029
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-7950-1f1861adb90e
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-6e97-7963f400213d
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-9704-c9e3603b8f7b
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-4243-31070404d6a1
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-c112-2302556c9ad5
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-b5da-7c4201bd3367
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-ba99-f345a037b7d0
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-0b4d-2039fe9f1d86
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-21e0-7c10031f6b39
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-281a-210928730d28
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-cc2d-452455217727
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-a7f3-a2f39c0ca1ab
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-18c4-00b2c7b29381
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-1b23-e27bb50d26a3
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-c8ef-fb55df4f46f8
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-7787-1f786325fb63
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-765a-d7000a42cb72
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-957f-a256f4f11bed
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-9ca7-c5b5d5e233b6
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-12de-e436e945d4f5
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-5e16-1f51b605b7d8
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-2376-0013e051f83a
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-d011-504002b3bd04
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-e6b9-64fc7c8d8297
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-ef75-38723ee959c2
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-e182-d21af4ffbd1b
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-0b80-abac96bfdc38
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-855b-d19e8d32b055
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-5f5a-aba5bf8e87d9
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-de9f-895a80103873
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-617a-0d8992bfe1b4
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-2534-9f06f4380dff
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-f7d4-38696533588d
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-f4ab-a181058b6d66
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-3902-4ed6956e4b46
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-7556-b95d304f62fb
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-ed5a-05b86aa2d777
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-2dca-eaf68c9b6a29
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-1175-6577139c5946
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-db9b-a90d58a80682
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-7adc-8f2098f00c7b
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-49c2-0c2e96aac099
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-2d2e-ee5e6df2b275
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-1ae9-f671d4a498bb
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-8607-b3d7e024e595
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-d4a8-c1188912b521
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-02fe-96c2dd62bec2
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-b3a5-61aa6042ac1e
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-15cf-3726fca6a287
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-dae4-b06cd10a4711
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-2caf-9eff45502a61
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-daf5-d2369c267bfc
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-3c4b-52c7e4b2ef01
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-fb34-e6cce8dd03d6
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-05a0-0878efda2045
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-b62f-b64bf99960d6
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-fb49-0487c2a38781
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-cf83-1ec125dd5c12
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-2340-690781099ff2
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-d93d-0895b5f2714a
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-57e9-c71be37a97c0
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-f240-6302226c030d
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-ac9e-7f687612397b
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-cd5c-1a911c8e8035
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-813a-1b6f7e97138c
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-9ba8-0fdc9cefd52b
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-1c3d-63af8af77fcf
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-a847-dfbb3c849413
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-1e65-07b732f4dc43
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-03f0-8bcb64f906ed
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-bc7a-b126631a94f2
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-a647-d3e1058e76cc
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-4d2b-184c9da8f060
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-a1a6-b86ee6729286
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-296f-354632b4bd2a
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-5429-2b93d805353a
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-3e46-7b64a3082ed4
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-a9a7-82c3794ce602
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-01eb-ddb21d301ba3
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-0af3-fa48fbbea62b
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-1c6d-7024277a9b96
00020000-55ba-3910-9188-c340679484b0	00030000-55ba-390f-7489-fe8f8458fe60
\.


--
-- TOC entry 2996 (class 0 OID 11201600)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 11201631)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 11201745)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ba-3910-77d0-6c81a76e5f76	00090000-55ba-3910-b64e-bf3763538c8f	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ba-3910-a0c6-25b043730d98	00090000-55ba-3910-126d-57319382e9a0	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ba-3910-0218-e43c6f03ced1	00090000-55ba-3910-47c6-5e083a2cba2f	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2973 (class 0 OID 11201365)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ba-3910-4b9a-b3a0fede9d2a	00040000-55ba-390f-6d27-257027e06250	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ba-3910-8a84-16cd10950bee	00040000-55ba-390f-6d27-257027e06250	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ba-3910-d3eb-1b5d14a2bf19	00040000-55ba-390f-6d27-257027e06250	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ba-3910-0026-563bd7e538f7	00040000-55ba-390f-6d27-257027e06250	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ba-3910-fefe-a9f732f3a646	00040000-55ba-390f-6d27-257027e06250	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ba-3910-2d23-1dc9ac03cf49	00040000-55ba-390f-f7a2-11e23bf49eeb	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ba-3910-1fc4-967fd508f681	00040000-55ba-390f-53d0-01dc75c78b84	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ba-3910-80aa-12e24e750fbd	00040000-55ba-390f-b16f-7495a6cf88d4	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ba-3910-c77f-5507a9bd1a21	00040000-55ba-390f-6d27-257027e06250	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2975 (class 0 OID 11201400)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ba-390f-39e0-b535e42dc587	8341	Adlešiči
00050000-55ba-390f-d0b7-2bbac6c35cbe	5270	Ajdovščina
00050000-55ba-390f-708f-7fdf58e0079b	6280	Ankaran/Ancarano
00050000-55ba-390f-a33f-29d05e1efea0	9253	Apače
00050000-55ba-390f-68a7-3a649fedae14	8253	Artiče
00050000-55ba-390f-8b34-d7d79bf6e6a5	4275	Begunje na Gorenjskem
00050000-55ba-390f-400f-b22c8d85af08	1382	Begunje pri Cerknici
00050000-55ba-390f-c443-148fdf291d4b	9231	Beltinci
00050000-55ba-390f-ba51-2c7675f7e7a4	2234	Benedikt
00050000-55ba-390f-428c-841450c9b732	2345	Bistrica ob Dravi
00050000-55ba-390f-a8b2-fd6cff8cb11f	3256	Bistrica ob Sotli
00050000-55ba-390f-ec84-7895a0ca9bc1	8259	Bizeljsko
00050000-55ba-390f-cbd0-d81bc39416d6	1223	Blagovica
00050000-55ba-390f-0fa2-3462ed9f3baa	8283	Blanca
00050000-55ba-390f-e8e0-1a3688d8e1dd	4260	Bled
00050000-55ba-390f-bc45-019d85d162a9	4273	Blejska Dobrava
00050000-55ba-390f-97ca-6db9d866afab	9265	Bodonci
00050000-55ba-390f-c61c-cf22f437025c	9222	Bogojina
00050000-55ba-390f-04f4-aed297e3eebe	4263	Bohinjska Bela
00050000-55ba-390f-7f5c-c0d7aecca440	4264	Bohinjska Bistrica
00050000-55ba-390f-564f-fe3f713f3d7d	4265	Bohinjsko jezero
00050000-55ba-390f-f4f0-92899d82e94e	1353	Borovnica
00050000-55ba-390f-3bcf-be0f383d7104	8294	Boštanj
00050000-55ba-390f-f9b3-692e161e0ed5	5230	Bovec
00050000-55ba-390f-568e-36032d903344	5295	Branik
00050000-55ba-390f-4ecc-3933a6383abb	3314	Braslovče
00050000-55ba-390f-2395-9c04a36bb9f1	5223	Breginj
00050000-55ba-390f-733d-df19337fb9fb	8280	Brestanica
00050000-55ba-390f-dee7-981c9f61b3c7	2354	Bresternica
00050000-55ba-390f-ef25-4cb8a2391734	4243	Brezje
00050000-55ba-390f-37d3-d665d9900304	1351	Brezovica pri Ljubljani
00050000-55ba-390f-a737-67f90e9506d9	8250	Brežice
00050000-55ba-390f-23d8-0ec400a3c401	4210	Brnik - Aerodrom
00050000-55ba-390f-19f3-906db1384d2a	8321	Brusnice
00050000-55ba-390f-5e4b-36fae7540e9b	3255	Buče
00050000-55ba-390f-80d2-1597cd1ff537	8276	Bučka 
00050000-55ba-390f-3902-339e5e419528	9261	Cankova
00050000-55ba-390f-fc31-4d8419e4bd44	3000	Celje 
00050000-55ba-390f-78a6-4ae937f2f6e6	3001	Celje - poštni predali
00050000-55ba-390f-80f0-3851c4545e7e	4207	Cerklje na Gorenjskem
00050000-55ba-390f-ed31-1a9922e51fb1	8263	Cerklje ob Krki
00050000-55ba-390f-2995-375ca882fe13	1380	Cerknica
00050000-55ba-390f-cd53-4e48bc9ee697	5282	Cerkno
00050000-55ba-390f-308b-9e38a7f9e56a	2236	Cerkvenjak
00050000-55ba-390f-d9c1-0ecc6f3fe0fc	2215	Ceršak
00050000-55ba-390f-4982-bdd2930c224c	2326	Cirkovce
00050000-55ba-390f-672d-65b9547a2bcb	2282	Cirkulane
00050000-55ba-390f-9fd4-e65ee2311211	5273	Col
00050000-55ba-390f-5288-be823600d255	8251	Čatež ob Savi
00050000-55ba-390f-015a-25fee5264276	1413	Čemšenik
00050000-55ba-390f-1b9a-f8817dce3f47	5253	Čepovan
00050000-55ba-390f-fe20-d1c1c8245ca7	9232	Črenšovci
00050000-55ba-390f-bfde-95b009f423c5	2393	Črna na Koroškem
00050000-55ba-390f-2b24-745fb28d69c5	6275	Črni Kal
00050000-55ba-390f-fb87-2483e9191da3	5274	Črni Vrh nad Idrijo
00050000-55ba-390f-c85c-dcc521edeb62	5262	Črniče
00050000-55ba-390f-5605-07fbfca2e4ce	8340	Črnomelj
00050000-55ba-390f-9569-1f3d271d41ff	6271	Dekani
00050000-55ba-390f-4a0f-1fb1f50fd06e	5210	Deskle
00050000-55ba-390f-02d0-68777491b618	2253	Destrnik
00050000-55ba-390f-5360-3bc16da2c917	6215	Divača
00050000-55ba-390f-9083-4cc962056a06	1233	Dob
00050000-55ba-390f-6ebb-852488961973	3224	Dobje pri Planini
00050000-55ba-390f-3e2f-e5ba30551425	8257	Dobova
00050000-55ba-390f-dfc3-df4ba4722304	1423	Dobovec
00050000-55ba-390f-d5dd-25a535052fa6	5263	Dobravlje
00050000-55ba-390f-468b-963bdb9156ff	3204	Dobrna
00050000-55ba-390f-b2d5-362aad421980	8211	Dobrnič
00050000-55ba-390f-257a-c2cb5ecba16d	1356	Dobrova
00050000-55ba-390f-0495-2724f569cdab	9223	Dobrovnik/Dobronak 
00050000-55ba-390f-59af-acefb6e2bede	5212	Dobrovo v Brdih
00050000-55ba-390f-33f9-84ff08bfa5f7	1431	Dol pri Hrastniku
00050000-55ba-390f-4a5d-9f6d44e64532	1262	Dol pri Ljubljani
00050000-55ba-390f-da0e-e7ad832ec2bf	1273	Dole pri Litiji
00050000-55ba-390f-9420-efee58553ade	1331	Dolenja vas
00050000-55ba-390f-83ee-3e91bc40e95e	8350	Dolenjske Toplice
00050000-55ba-390f-a612-b7620ea9c9b2	1230	Domžale
00050000-55ba-390f-d532-ff9a29bd1d2a	2252	Dornava
00050000-55ba-390f-3dde-fdc1a539a3d6	5294	Dornberk
00050000-55ba-390f-4294-c12adc305365	1319	Draga
00050000-55ba-390f-f28e-1c2546ac7cb6	8343	Dragatuš
00050000-55ba-390f-bd65-fd48342813b5	3222	Dramlje
00050000-55ba-390f-de6b-6614518f7b86	2370	Dravograd
00050000-55ba-390f-cf58-c3c6f20ea454	4203	Duplje
00050000-55ba-390f-9bf3-977394c37a13	6221	Dutovlje
00050000-55ba-390f-820c-412e70e57c51	8361	Dvor
00050000-55ba-390f-1868-c678c654410d	2343	Fala
00050000-55ba-390f-a623-1c0b12d53d0c	9208	Fokovci
00050000-55ba-390f-719d-ab22ce694c8e	2313	Fram
00050000-55ba-390f-c179-08913f7fead4	3213	Frankolovo
00050000-55ba-390f-5eb9-42ac8c854768	1274	Gabrovka
00050000-55ba-390f-e739-e37c475848db	8254	Globoko
00050000-55ba-390f-776b-b31b790238f4	5275	Godovič
00050000-55ba-390f-57cc-312c0b23c1d9	4204	Golnik
00050000-55ba-390f-9326-c1668ef636c4	3303	Gomilsko
00050000-55ba-390f-09ae-40f84f770906	4224	Gorenja vas
00050000-55ba-390f-72c4-69e149361055	3263	Gorica pri Slivnici
00050000-55ba-390f-50c3-8deadc82e56c	2272	Gorišnica
00050000-55ba-390f-bd1b-f25fb3ec86f4	9250	Gornja Radgona
00050000-55ba-390f-235e-774fabc98d7f	3342	Gornji Grad
00050000-55ba-390f-081d-e84b75a2d8b6	4282	Gozd Martuljek
00050000-55ba-390f-2920-81545628ed2b	6272	Gračišče
00050000-55ba-390f-3602-50d6ae55b7b4	9264	Grad
00050000-55ba-390f-b0b8-c854209d8994	8332	Gradac
00050000-55ba-390f-6545-d43b3db3da2e	1384	Grahovo
00050000-55ba-390f-9ac4-4455b305e7cc	5242	Grahovo ob Bači
00050000-55ba-390f-f3c8-a4bc75fbaacd	5251	Grgar
00050000-55ba-390f-6618-82b15d54188e	3302	Griže
00050000-55ba-390f-a382-a3893a11d464	3231	Grobelno
00050000-55ba-390f-e628-78d02692230b	1290	Grosuplje
00050000-55ba-390f-eaf4-25179bf2438a	2288	Hajdina
00050000-55ba-390f-4b8b-e3799896d460	8362	Hinje
00050000-55ba-390f-8776-dadbc718d860	2311	Hoče
00050000-55ba-390f-5c0c-311c7aaf2b17	9205	Hodoš/Hodos
00050000-55ba-390f-cf84-308002651253	1354	Horjul
00050000-55ba-390f-7370-786cda75ee3e	1372	Hotedršica
00050000-55ba-390f-7fa9-03896f590bc9	1430	Hrastnik
00050000-55ba-390f-883c-40378f2630a9	6225	Hruševje
00050000-55ba-390f-6154-fa45388b1bce	4276	Hrušica
00050000-55ba-390f-6fe5-ff30998fad12	5280	Idrija
00050000-55ba-390f-ae6c-6ff1b5743655	1292	Ig
00050000-55ba-390f-83e4-20f367b929fa	6250	Ilirska Bistrica
00050000-55ba-390f-91d6-b86014403007	6251	Ilirska Bistrica-Trnovo
00050000-55ba-390f-e193-9d0dd75ac33c	1295	Ivančna Gorica
00050000-55ba-390f-8126-ccb12516537e	2259	Ivanjkovci
00050000-55ba-390f-d282-e5863a22ae09	1411	Izlake
00050000-55ba-390f-22dd-42ef48f472f2	6310	Izola/Isola
00050000-55ba-390f-a6ee-d70b0b42a08f	2222	Jakobski Dol
00050000-55ba-390f-466e-e3d679c56bc3	2221	Jarenina
00050000-55ba-390f-9e7c-3e996d7b7b5c	6254	Jelšane
00050000-55ba-390f-4758-01f1be5863c0	4270	Jesenice
00050000-55ba-390f-145f-9d3d247420bc	8261	Jesenice na Dolenjskem
00050000-55ba-390f-f4a4-8a2780193997	3273	Jurklošter
00050000-55ba-390f-2463-9f3af9922bca	2223	Jurovski Dol
00050000-55ba-390f-7919-08c9a7399c44	2256	Juršinci
00050000-55ba-390f-1d79-8f37c99ac831	5214	Kal nad Kanalom
00050000-55ba-390f-0070-8838f3b54219	3233	Kalobje
00050000-55ba-390f-0ba8-cb4c4c9f18d2	4246	Kamna Gorica
00050000-55ba-390f-d279-e9602b2c7555	2351	Kamnica
00050000-55ba-390f-49cc-f988907b9336	1241	Kamnik
00050000-55ba-390f-8e7a-f530e64a1aa9	5213	Kanal
00050000-55ba-390f-5c1a-2590e60d6cd7	8258	Kapele
00050000-55ba-390f-20ca-977e183941f3	2362	Kapla
00050000-55ba-390f-26fe-7540f425d193	2325	Kidričevo
00050000-55ba-390f-825b-eb2a8575809f	1412	Kisovec
00050000-55ba-390f-4846-069bcb9432b2	6253	Knežak
00050000-55ba-390f-8914-1eaa4971be8b	5222	Kobarid
00050000-55ba-390f-4bdb-f38819fcb0c3	9227	Kobilje
00050000-55ba-390f-505c-9dd0a116aabe	1330	Kočevje
00050000-55ba-390f-4045-a15f72dc9804	1338	Kočevska Reka
00050000-55ba-390f-e7be-4ef3c13c51df	2276	Kog
00050000-55ba-390f-acfb-1524ba161b2b	5211	Kojsko
00050000-55ba-390f-9ce1-16c2bb824773	6223	Komen
00050000-55ba-390f-87e6-c939e2ba58d8	1218	Komenda
00050000-55ba-390f-68ef-eb0b11fb3092	6000	Koper/Capodistria 
00050000-55ba-390f-9c74-da68b6859467	6001	Koper/Capodistria - poštni predali
00050000-55ba-390f-f592-1324c9c042fb	8282	Koprivnica
00050000-55ba-390f-ced5-c1f4722353c0	5296	Kostanjevica na Krasu
00050000-55ba-390f-f65a-5333e1777c1c	8311	Kostanjevica na Krki
00050000-55ba-390f-79e3-71dac659d4f7	1336	Kostel
00050000-55ba-390f-e1b5-cb638f3c4043	6256	Košana
00050000-55ba-390f-b0d1-256d535751a7	2394	Kotlje
00050000-55ba-390f-5a5a-f23d669e6799	6240	Kozina
00050000-55ba-390f-441a-4ab3c7f7a31a	3260	Kozje
00050000-55ba-390f-0dfc-ff4d8e591677	4000	Kranj 
00050000-55ba-390f-7c94-bf5e797f376f	4001	Kranj - poštni predali
00050000-55ba-390f-6375-bf1a4f1309d2	4280	Kranjska Gora
00050000-55ba-390f-904f-27412628719f	1281	Kresnice
00050000-55ba-390f-2fef-fdecb97d863a	4294	Križe
00050000-55ba-390f-bfcf-57485d07a6e0	9206	Križevci
00050000-55ba-390f-bc34-cfc4ed4f706c	9242	Križevci pri Ljutomeru
00050000-55ba-390f-b91f-aba729524413	1301	Krka
00050000-55ba-390f-e70f-d59588759fb4	8296	Krmelj
00050000-55ba-390f-6ac2-59de36be09c6	4245	Kropa
00050000-55ba-390f-b906-ceb2c12b3714	8262	Krška vas
00050000-55ba-390f-d416-a06f2f0a0d5f	8270	Krško
00050000-55ba-390f-e0b0-bdd87ae45d57	9263	Kuzma
00050000-55ba-390f-0f33-e1ea1853b878	2318	Laporje
00050000-55ba-390f-60ab-fd8a636b8dc1	3270	Laško
00050000-55ba-390f-2a71-a1db709106ca	1219	Laze v Tuhinju
00050000-55ba-390f-de80-5b98790a03b5	2230	Lenart v Slovenskih goricah
00050000-55ba-390f-2d81-af491dd08281	9220	Lendava/Lendva
00050000-55ba-390f-a9b3-c26b919fea19	4248	Lesce
00050000-55ba-390f-5524-4568a0a95578	3261	Lesično
00050000-55ba-390f-4939-8e31d201cda4	8273	Leskovec pri Krškem
00050000-55ba-390f-1b16-9e811d16e2ad	2372	Libeliče
00050000-55ba-390f-1c96-1cbf835c5ee2	2341	Limbuš
00050000-55ba-390f-17f8-f6a0f21db17f	1270	Litija
00050000-55ba-390f-f922-40090f62cd66	3202	Ljubečna
00050000-55ba-390f-4929-52aa67fd76a8	1000	Ljubljana 
00050000-55ba-390f-fe28-b86864335a00	1001	Ljubljana - poštni predali
00050000-55ba-390f-37e9-250dea1cfdf1	1231	Ljubljana - Črnuče
00050000-55ba-390f-b53f-9d0e2af8e5ca	1261	Ljubljana - Dobrunje
00050000-55ba-390f-ad8f-96314d81d2ac	1260	Ljubljana - Polje
00050000-55ba-390f-c036-7573839d0592	1210	Ljubljana - Šentvid
00050000-55ba-390f-ac28-97b52774ffd4	1211	Ljubljana - Šmartno
00050000-55ba-390f-bb56-6d01defff65c	3333	Ljubno ob Savinji
00050000-55ba-390f-ad1d-601231911cb9	9240	Ljutomer
00050000-55ba-390f-e163-24ff6f0648ee	3215	Loče
00050000-55ba-390f-6477-613e77949ad1	5231	Log pod Mangartom
00050000-55ba-390f-ec16-b4214bc00d38	1358	Log pri Brezovici
00050000-55ba-390f-a430-5d7f5f15130c	1370	Logatec
00050000-55ba-390f-28bb-98c3f670bc12	1371	Logatec
00050000-55ba-390f-97cb-e4fb1276e114	1434	Loka pri Zidanem Mostu
00050000-55ba-390f-6926-c8e414f85fca	3223	Loka pri Žusmu
00050000-55ba-390f-457a-b2e1b163238a	6219	Lokev
00050000-55ba-390f-2f56-9ca14cd05fa1	1318	Loški Potok
00050000-55ba-390f-6770-fbaa945fcbb0	2324	Lovrenc na Dravskem polju
00050000-55ba-390f-9e0c-011f15059ae3	2344	Lovrenc na Pohorju
00050000-55ba-390f-94ea-f0bb3c784b3e	3334	Luče
00050000-55ba-390f-4823-a3f34d3bddef	1225	Lukovica
00050000-55ba-390f-09e6-3c073eb8fc1d	9202	Mačkovci
00050000-55ba-390f-e8a1-6f849f6df186	2322	Majšperk
00050000-55ba-390f-f645-59296456690d	2321	Makole
00050000-55ba-390f-53b3-917b6751f29a	9243	Mala Nedelja
00050000-55ba-390f-7342-da5b5fe70468	2229	Malečnik
00050000-55ba-390f-151b-af28bbdddf2d	6273	Marezige
00050000-55ba-390f-8b15-2103a3b3c2ba	2000	Maribor 
00050000-55ba-390f-5f03-32aef7b24bf1	2001	Maribor - poštni predali
00050000-55ba-390f-0cf3-20ae86a9d0f8	2206	Marjeta na Dravskem polju
00050000-55ba-390f-e431-f81cc139e08d	2281	Markovci
00050000-55ba-390f-a130-e29b03857181	9221	Martjanci
00050000-55ba-390f-408a-5ca0e6b178d2	6242	Materija
00050000-55ba-390f-009e-aa85fe81598f	4211	Mavčiče
00050000-55ba-390f-7f21-77c1f3299f57	1215	Medvode
00050000-55ba-390f-2572-34a9b70335f5	1234	Mengeš
00050000-55ba-390f-215c-f38b1d59c96e	8330	Metlika
00050000-55ba-390f-d5b2-29538661417b	2392	Mežica
00050000-55ba-390f-1e47-e89df99acb69	2204	Miklavž na Dravskem polju
00050000-55ba-390f-ac0b-30005d120909	2275	Miklavž pri Ormožu
00050000-55ba-390f-df94-3a151af78ed4	5291	Miren
00050000-55ba-390f-1077-534230bb9c53	8233	Mirna
00050000-55ba-390f-0e83-16972b36e585	8216	Mirna Peč
00050000-55ba-390f-b4f8-6934841c9206	2382	Mislinja
00050000-55ba-390f-c335-6a2e0f6d86a3	4281	Mojstrana
00050000-55ba-390f-5501-2672077c4ff5	8230	Mokronog
00050000-55ba-390f-7307-3fd9f21830c4	1251	Moravče
00050000-55ba-390f-8df4-a1c47f7695e4	9226	Moravske Toplice
00050000-55ba-390f-c84e-0d31f166b93f	5216	Most na Soči
00050000-55ba-390f-b031-38715e56273e	1221	Motnik
00050000-55ba-390f-a1f9-6cdb67851e4a	3330	Mozirje
00050000-55ba-390f-7d9f-a6135b7fe2cb	9000	Murska Sobota 
00050000-55ba-390f-2e4e-9697b75b51a4	9001	Murska Sobota - poštni predali
00050000-55ba-390f-6e54-05b1813c26df	2366	Muta
00050000-55ba-390f-983f-341a79d8e244	4202	Naklo
00050000-55ba-390f-456c-ded5f1b7432b	3331	Nazarje
00050000-55ba-390f-ba10-92aad3c6e8fd	1357	Notranje Gorice
00050000-55ba-390f-575e-f3ae3fe89f57	3203	Nova Cerkev
00050000-55ba-390f-c1e9-bf1ddf255813	5000	Nova Gorica 
00050000-55ba-390f-0ade-b72a5faf7fb0	5001	Nova Gorica - poštni predali
00050000-55ba-390f-116f-1d8ba36a6047	1385	Nova vas
00050000-55ba-390f-49d9-35411e2cd2b4	8000	Novo mesto
00050000-55ba-390f-39ba-622db69461d2	8001	Novo mesto - poštni predali
00050000-55ba-390f-f261-de032216e08b	6243	Obrov
00050000-55ba-390f-2210-e802357b504c	9233	Odranci
00050000-55ba-390f-6de1-78aa010db0ba	2317	Oplotnica
00050000-55ba-390f-9a1c-f3daea685b9f	2312	Orehova vas
00050000-55ba-390f-f9e9-d75bc946b949	2270	Ormož
00050000-55ba-390f-d5ff-8612203dfdb8	1316	Ortnek
00050000-55ba-390f-008f-334d51b0929e	1337	Osilnica
00050000-55ba-390f-1866-e71d8ff2a97f	8222	Otočec
00050000-55ba-390f-4aa7-2f71179ffd90	2361	Ožbalt
00050000-55ba-390f-1728-9f5f4d279d58	2231	Pernica
00050000-55ba-390f-be55-2d4eedb4be79	2211	Pesnica pri Mariboru
00050000-55ba-390f-58a4-24633c1c528a	9203	Petrovci
00050000-55ba-390f-61c4-54c98fdab39b	3301	Petrovče
00050000-55ba-390f-562d-4036fb616ccc	6330	Piran/Pirano
00050000-55ba-390f-8e16-9b4779e5758b	8255	Pišece
00050000-55ba-390f-0c43-026c0ca7f95e	6257	Pivka
00050000-55ba-390f-16d1-839510efcf71	6232	Planina
00050000-55ba-390f-1f73-8d5c3c1e8ccf	3225	Planina pri Sevnici
00050000-55ba-390f-4f35-f9579d649787	6276	Pobegi
00050000-55ba-390f-0891-42747f848a9f	8312	Podbočje
00050000-55ba-390f-2b7d-8e4b07a4c226	5243	Podbrdo
00050000-55ba-390f-312e-9e2b111e7af2	3254	Podčetrtek
00050000-55ba-390f-9809-350f1810c0d5	2273	Podgorci
00050000-55ba-390f-84e6-b77f8e23770a	6216	Podgorje
00050000-55ba-390f-36b9-2d4f324796ed	2381	Podgorje pri Slovenj Gradcu
00050000-55ba-390f-6e84-1bba5d726bfa	6244	Podgrad
00050000-55ba-390f-0615-3ff21551314f	1414	Podkum
00050000-55ba-390f-fde4-d514d401bfe9	2286	Podlehnik
00050000-55ba-390f-755c-4f388df2a4be	5272	Podnanos
00050000-55ba-390f-2083-60ae79d8e87a	4244	Podnart
00050000-55ba-390f-deac-34d85dc70510	3241	Podplat
00050000-55ba-390f-e58a-b18f33090d6d	3257	Podsreda
00050000-55ba-390f-a0fc-eeb6d1cbc918	2363	Podvelka
00050000-55ba-390f-347a-33044a002249	2208	Pohorje
00050000-55ba-390f-d338-a51077165c9d	2257	Polenšak
00050000-55ba-390f-4a84-50a70c7daf33	1355	Polhov Gradec
00050000-55ba-390f-e809-2e56aca3bc9b	4223	Poljane nad Škofjo Loko
00050000-55ba-390f-bac8-62096fa976bf	2319	Poljčane
00050000-55ba-390f-901e-85e93b91dded	1272	Polšnik
00050000-55ba-390f-c7c9-298b9e917ab2	3313	Polzela
00050000-55ba-390f-9b1d-96ac5f630b4b	3232	Ponikva
00050000-55ba-390f-872e-3ffd75b12772	6320	Portorož/Portorose
00050000-55ba-390f-a97d-4323e83391b8	6230	Postojna
00050000-55ba-390f-53d8-fae5bb4df390	2331	Pragersko
00050000-55ba-390f-a88c-f28a2118d90e	3312	Prebold
00050000-55ba-390f-39e7-cf5939e645ff	4205	Preddvor
00050000-55ba-390f-1dce-48c18befa99f	6255	Prem
00050000-55ba-390f-9488-7b1c6effb39d	1352	Preserje
00050000-55ba-390f-1daf-66ff8a32d7b8	6258	Prestranek
00050000-55ba-390f-a39a-0948cbe71985	2391	Prevalje
00050000-55ba-390f-563b-d45a6bb3a5bd	3262	Prevorje
00050000-55ba-390f-f254-bf206c01d38d	1276	Primskovo 
00050000-55ba-390f-c9de-069e7b0755cf	3253	Pristava pri Mestinju
00050000-55ba-390f-6021-5ce135d2a2a1	9207	Prosenjakovci/Partosfalva
00050000-55ba-390f-730f-7eb321890c69	5297	Prvačina
00050000-55ba-390f-5959-2b1c706b295e	2250	Ptuj
00050000-55ba-390f-38cc-d99d38e87b12	2323	Ptujska Gora
00050000-55ba-390f-c73e-489d5f49ee14	9201	Puconci
00050000-55ba-390f-1d4a-bfad757e92cf	2327	Rače
00050000-55ba-390f-b669-22d2f946ddf0	1433	Radeče
00050000-55ba-390f-4599-5932b7932175	9252	Radenci
00050000-55ba-390f-c31e-5cf8544c30ff	2360	Radlje ob Dravi
00050000-55ba-390f-da7d-c5f76ded3e36	1235	Radomlje
00050000-55ba-390f-0514-eb854ebe1f25	4240	Radovljica
00050000-55ba-390f-6b82-50e24ae33eb4	8274	Raka
00050000-55ba-390f-033e-c302503125cc	1381	Rakek
00050000-55ba-390f-550d-0342a372fc79	4283	Rateče - Planica
00050000-55ba-390f-7bc0-bb385906c573	2390	Ravne na Koroškem
00050000-55ba-390f-1ead-d21d4b7482aa	9246	Razkrižje
00050000-55ba-390f-17d7-99b7c84826ad	3332	Rečica ob Savinji
00050000-55ba-390f-833b-1fdd07d27f6b	5292	Renče
00050000-55ba-390f-574e-11b72593d22e	1310	Ribnica
00050000-55ba-390f-9c45-cca2e38a4d86	2364	Ribnica na Pohorju
00050000-55ba-390f-0e24-5ee5cb4ef734	3272	Rimske Toplice
00050000-55ba-390f-9da2-e2445920f547	1314	Rob
00050000-55ba-390f-ade2-5eb400052d51	5215	Ročinj
00050000-55ba-390f-391f-989f44b282e7	3250	Rogaška Slatina
00050000-55ba-390f-5b1a-330f4de697cc	9262	Rogašovci
00050000-55ba-390f-dc99-f4029faaba26	3252	Rogatec
00050000-55ba-390f-6f9d-4e8ceb8ea91e	1373	Rovte
00050000-55ba-390f-e042-3622c2c2d8a5	2342	Ruše
00050000-55ba-390f-dcdf-6a28e48c31a5	1282	Sava
00050000-55ba-390f-c9f3-5107ec7796cb	6333	Sečovlje/Sicciole
00050000-55ba-390f-99d0-c53444d580c7	4227	Selca
00050000-55ba-390f-ebdb-d10489b5618f	2352	Selnica ob Dravi
00050000-55ba-390f-aa20-b238cdb8322e	8333	Semič
00050000-55ba-390f-29ee-72e02750248e	8281	Senovo
00050000-55ba-390f-00e5-3484dc71a568	6224	Senožeče
00050000-55ba-390f-58e3-2b4623e2a2ef	8290	Sevnica
00050000-55ba-390f-22ec-eb0d3dff44b7	6210	Sežana
00050000-55ba-390f-d28f-32d6d2dade5d	2214	Sladki Vrh
00050000-55ba-390f-2509-106f5c071361	5283	Slap ob Idrijci
00050000-55ba-390f-f321-c83c6c42089c	2380	Slovenj Gradec
00050000-55ba-390f-484c-5fd200bdbed9	2310	Slovenska Bistrica
00050000-55ba-390f-6bcb-ad6e37c7fbf2	3210	Slovenske Konjice
00050000-55ba-390f-196b-6c10543fd2da	1216	Smlednik
00050000-55ba-390f-9ca1-dc20e09be4eb	5232	Soča
00050000-55ba-390f-8244-1881dd15557d	1317	Sodražica
00050000-55ba-390f-46a2-4f13dfbcf1ab	3335	Solčava
00050000-55ba-390f-4fc1-e8b539d4377f	5250	Solkan
00050000-55ba-390f-b079-da972476ce31	4229	Sorica
00050000-55ba-390f-d5be-bf3d51ba8ee3	4225	Sovodenj
00050000-55ba-390f-5ec3-31d86dcf273e	5281	Spodnja Idrija
00050000-55ba-390f-5c93-c8e96ed47a57	2241	Spodnji Duplek
00050000-55ba-390f-88ec-43c422fd5e5b	9245	Spodnji Ivanjci
00050000-55ba-390f-f2a8-cb0f6fb416b9	2277	Središče ob Dravi
00050000-55ba-390f-f915-6c73f4691e80	4267	Srednja vas v Bohinju
00050000-55ba-390f-3cc7-e89bfd080949	8256	Sromlje 
00050000-55ba-390f-514f-c626b1ea1963	5224	Srpenica
00050000-55ba-390f-9c11-e271769eeb3b	1242	Stahovica
00050000-55ba-390f-5820-2817657b1273	1332	Stara Cerkev
00050000-55ba-390f-33e8-bd8d131b21df	8342	Stari trg ob Kolpi
00050000-55ba-390f-6971-4a3595513733	1386	Stari trg pri Ložu
00050000-55ba-390f-699b-72d427ec2456	2205	Starše
00050000-55ba-390f-66e3-a0f36377223a	2289	Stoperce
00050000-55ba-390f-82ad-bc40fe01543d	8322	Stopiče
00050000-55ba-390f-65b1-d6b155a69352	3206	Stranice
00050000-55ba-390f-8e95-d44043ddb5a9	8351	Straža
00050000-55ba-390f-f54c-b9bf45fb4c37	1313	Struge
00050000-55ba-390f-c786-f9db5a3e8cff	8293	Studenec
00050000-55ba-390f-9c53-b81854ae757f	8331	Suhor
00050000-55ba-390f-65ac-e0656a5ef21b	2233	Sv. Ana v Slovenskih goricah
00050000-55ba-390f-49b1-068c38de1b34	2235	Sv. Trojica v Slovenskih goricah
00050000-55ba-390f-c246-d9ea20cfb14f	2353	Sveti Duh na Ostrem Vrhu
00050000-55ba-390f-b07e-7f857d4f3164	9244	Sveti Jurij ob Ščavnici
00050000-55ba-390f-a38b-7db41a83ad6d	3264	Sveti Štefan
00050000-55ba-390f-25bc-e712ce68290e	2258	Sveti Tomaž
00050000-55ba-390f-798f-36a52931f380	9204	Šalovci
00050000-55ba-390f-f42a-1b10e92e2555	5261	Šempas
00050000-55ba-390f-d8b6-019af32f7414	5290	Šempeter pri Gorici
00050000-55ba-390f-d0ea-87d627428b96	3311	Šempeter v Savinjski dolini
00050000-55ba-390f-aed6-4f415f3ab011	4208	Šenčur
00050000-55ba-390f-fd4d-6fbb0f7eb8b1	2212	Šentilj v Slovenskih goricah
00050000-55ba-390f-0751-d1f3a0a9c084	8297	Šentjanž
00050000-55ba-390f-9ce8-7097e9e3a0cc	2373	Šentjanž pri Dravogradu
00050000-55ba-390f-fc6e-2853eaa65f4a	8310	Šentjernej
00050000-55ba-390f-3dcf-3ecaf15165ef	3230	Šentjur
00050000-55ba-390f-693e-1e074a0dae41	3271	Šentrupert
00050000-55ba-390f-93a0-e7e204a76f10	8232	Šentrupert
00050000-55ba-390f-8df2-5a40ac5c161c	1296	Šentvid pri Stični
00050000-55ba-390f-2e55-716d0e8a15cb	8275	Škocjan
00050000-55ba-390f-7fb3-acd26aa4a95c	6281	Škofije
00050000-55ba-390f-9de6-464ca06c9bb4	4220	Škofja Loka
00050000-55ba-390f-a853-59016d693882	3211	Škofja vas
00050000-55ba-390f-1543-40c1476a68da	1291	Škofljica
00050000-55ba-390f-c267-3ba3eb54aef9	6274	Šmarje
00050000-55ba-390f-ba99-7cc6de7efe21	1293	Šmarje - Sap
00050000-55ba-390f-2f42-7d9b97f5bcc9	3240	Šmarje pri Jelšah
00050000-55ba-390f-262d-64f1dca2b388	8220	Šmarješke Toplice
00050000-55ba-390f-1602-1a7c218f569a	2315	Šmartno na Pohorju
00050000-55ba-390f-131b-8d1e61a19c41	3341	Šmartno ob Dreti
00050000-55ba-390f-0387-2d376de1ec2e	3327	Šmartno ob Paki
00050000-55ba-390f-a9fc-9d61b0cd8ce0	1275	Šmartno pri Litiji
00050000-55ba-390f-072f-5c2aa81db105	2383	Šmartno pri Slovenj Gradcu
00050000-55ba-390f-2717-ec01c210b86a	3201	Šmartno v Rožni dolini
00050000-55ba-390f-4d00-25d362c8074d	3325	Šoštanj
00050000-55ba-390f-94a6-2953c8313d7b	6222	Štanjel
00050000-55ba-390f-226d-f88b4027c7d8	3220	Štore
00050000-55ba-390f-5149-bd24ad8eac67	3304	Tabor
00050000-55ba-390f-a7a7-b5935f755210	3221	Teharje
00050000-55ba-390f-9982-6e4dd94b8d14	9251	Tišina
00050000-55ba-390f-580a-f81078595fcf	5220	Tolmin
00050000-55ba-390f-0270-817abd9f023a	3326	Topolšica
00050000-55ba-390f-b2cc-f989c2ddf51d	2371	Trbonje
00050000-55ba-390f-1731-f4ab13adbb79	1420	Trbovlje
00050000-55ba-390f-51c6-e77ce8c46333	8231	Trebelno 
00050000-55ba-390f-135c-238c9a0e7c96	8210	Trebnje
00050000-55ba-390f-a648-922de82a24dd	5252	Trnovo pri Gorici
00050000-55ba-390f-39a0-134a25b319c9	2254	Trnovska vas
00050000-55ba-390f-b5aa-936c5a48f73d	1222	Trojane
00050000-55ba-390f-adcb-4c13e796c08d	1236	Trzin
00050000-55ba-390f-9416-9e1abe20ad15	4290	Tržič
00050000-55ba-390f-58d8-665bb48a426c	8295	Tržišče
00050000-55ba-390f-d15e-f5020a7a9794	1311	Turjak
00050000-55ba-390f-0e08-6afa2c15b3ac	9224	Turnišče
00050000-55ba-390f-045a-ba0952e7caa2	8323	Uršna sela
00050000-55ba-390f-6d0d-71f48b3caa5b	1252	Vače
00050000-55ba-390f-411f-d355e8143c6b	3320	Velenje 
00050000-55ba-390f-e277-2b28262e7a48	3322	Velenje - poštni predali
00050000-55ba-390f-2a56-7a2807adf297	8212	Velika Loka
00050000-55ba-390f-a8bc-f31d745a8cec	2274	Velika Nedelja
00050000-55ba-390f-d353-a9b7046ab92d	9225	Velika Polana
00050000-55ba-390f-cfd1-ab314b6f8442	1315	Velike Lašče
00050000-55ba-390f-9efc-6cd84f26ebcc	8213	Veliki Gaber
00050000-55ba-390f-89b2-ae947f407803	9241	Veržej
00050000-55ba-390f-cec6-0fede5666d8c	1312	Videm - Dobrepolje
00050000-55ba-390f-a12b-a2491a8b08f5	2284	Videm pri Ptuju
00050000-55ba-390f-0815-8b74b1ba9617	8344	Vinica
00050000-55ba-390f-64e9-4ca0d3f16af2	5271	Vipava
00050000-55ba-390f-3f2f-d9c236c0cd11	4212	Visoko
00050000-55ba-390f-0441-3f641a892eb8	1294	Višnja Gora
00050000-55ba-390f-43f6-1a0cb79149fa	3205	Vitanje
00050000-55ba-390f-4f77-1446dc8f0412	2255	Vitomarci
00050000-55ba-390f-220d-a360ca96af7b	1217	Vodice
00050000-55ba-390f-8006-5e037bd2fb48	3212	Vojnik\t
00050000-55ba-390f-b988-c1a255c8bdd1	5293	Volčja Draga
00050000-55ba-390f-7d71-db9c99995561	2232	Voličina
00050000-55ba-390f-334c-cee4cbb2b379	3305	Vransko
00050000-55ba-390f-2bf6-3e5fa059d9b1	6217	Vremski Britof
00050000-55ba-390f-217b-3764ab0c7c4f	1360	Vrhnika
00050000-55ba-390f-cc99-ff0d773ae9da	2365	Vuhred
00050000-55ba-390f-34c5-a44458bcb461	2367	Vuzenica
00050000-55ba-390f-72d2-90411f1928b1	8292	Zabukovje 
00050000-55ba-390f-d425-cd298894bba3	1410	Zagorje ob Savi
00050000-55ba-390f-455e-d75e1ad01db3	1303	Zagradec
00050000-55ba-390f-45b3-ac66e521f535	2283	Zavrč
00050000-55ba-390f-3e2a-198eb9043abd	8272	Zdole 
00050000-55ba-390f-9ef8-a459bec1fef9	4201	Zgornja Besnica
00050000-55ba-390f-4a09-52ce1970f3ee	2242	Zgornja Korena
00050000-55ba-390f-d8ce-a924f30f96db	2201	Zgornja Kungota
00050000-55ba-390f-344f-88114dd60b08	2316	Zgornja Ložnica
00050000-55ba-390f-a7dd-cd468ed0b892	2314	Zgornja Polskava
00050000-55ba-390f-46d0-f221f62ad23d	2213	Zgornja Velka
00050000-55ba-390f-ca7b-e56476f44d1f	4247	Zgornje Gorje
00050000-55ba-390f-7665-3b37b7c71931	4206	Zgornje Jezersko
00050000-55ba-390f-0e89-76dc10f561f8	2285	Zgornji Leskovec
00050000-55ba-390f-19fc-7656692b4967	1432	Zidani Most
00050000-55ba-390f-9f0b-43983a319554	3214	Zreče
00050000-55ba-390f-da49-7c38f4ba5ba7	4209	Žabnica
00050000-55ba-390f-ba9c-6aa0a1dd25dd	3310	Žalec
00050000-55ba-390f-cabb-335ea51f527a	4228	Železniki
00050000-55ba-390f-864b-354c2cdc4688	2287	Žetale
00050000-55ba-390f-7548-cc17ad7c772f	4226	Žiri
00050000-55ba-390f-47be-3ff9b2e965ff	4274	Žirovnica
00050000-55ba-390f-1ede-d99bb21c3242	8360	Žužemberk
\.


--
-- TOC entry 2992 (class 0 OID 11201574)
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
-- TOC entry 2974 (class 0 OID 11201385)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 11201463)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 11201586)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 11201889)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 11201900)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ba-3910-9516-9b756251c2d3	00080000-55ba-3910-c77f-5507a9bd1a21	0900	AK
00190000-55ba-3910-ad00-080e8fb0b9a7	00080000-55ba-3910-d3eb-1b5d14a2bf19	0987	AK
00190000-55ba-3910-2662-f79957aea475	00080000-55ba-3910-8a84-16cd10950bee	0989	AK
00190000-55ba-3910-0774-c161807f5c0a	00080000-55ba-3910-0026-563bd7e538f7	0986	AK
00190000-55ba-3910-7703-7fc85905c32f	00080000-55ba-3910-2d23-1dc9ac03cf49	0984	AK
00190000-55ba-3910-c0b2-2823a65a8cf8	00080000-55ba-3910-1fc4-967fd508f681	0983	AK
00190000-55ba-3910-976f-7f41cf879424	00080000-55ba-3910-80aa-12e24e750fbd	0982	AK
\.


--
-- TOC entry 3016 (class 0 OID 11201870)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55ba-3911-4e6c-85b4c01d1542	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3019 (class 0 OID 11201908)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 11201615)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55ba-3910-2d9c-bb615eb22381	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55ba-3910-d14a-dbc1cbb5449c	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55ba-3910-1368-36889dd7adb5	0003	Kazinska	t	84	Kazinska dvorana
00220000-55ba-3910-795e-9742759b959b	0004	Mali oder	t	24	Mali oder 
00220000-55ba-3910-763a-816b2700f1de	0005	Komorni oder	t	15	Komorni oder
00220000-55ba-3910-637d-26d44e03dd1f	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ba-3910-747d-c120193ee4ca	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2990 (class 0 OID 11201559)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11201549)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11201734)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 11201683)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 11201257)
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
-- TOC entry 2999 (class 0 OID 11201625)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 11201295)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ba-390f-d344-939a06e5c3c2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ba-390f-04fe-09c8f9c039b1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ba-390f-36d2-48b84d45c0bf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ba-390f-92a2-44574c6106a0	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ba-390f-f036-29caab4d98a4	planer	Planer dogodkov v koledarju	t
00020000-55ba-390f-19e0-c7c98275cf7e	kadrovska	Kadrovska služba	t
00020000-55ba-390f-52ec-b005f84d44a8	arhivar	Ažuriranje arhivalij	t
00020000-55ba-390f-0252-f000260f7a95	igralec	Igralec	t
00020000-55ba-390f-4cb2-84dd134e99d3	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ba-3910-9188-c340679484b0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2965 (class 0 OID 11201279)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ba-390f-9a36-a77a09ab67e1	00020000-55ba-390f-36d2-48b84d45c0bf
00010000-55ba-390f-63d1-ec4a29b3e75c	00020000-55ba-390f-36d2-48b84d45c0bf
00010000-55ba-3910-4d5d-6b768a2762b2	00020000-55ba-3910-9188-c340679484b0
\.


--
-- TOC entry 3001 (class 0 OID 11201639)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11201580)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11201530)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 11201949)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ba-390f-198d-135ae2eaec07	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ba-390f-b2e0-83ebae211cdb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ba-390f-ce29-72540b6d7cc3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ba-390f-bbea-74810aec67d2	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55ba-390f-d0c5-f2421d352bfe	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3023 (class 0 OID 11201941)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ba-390f-257c-45151a604cf5	00230000-55ba-390f-bbea-74810aec67d2	popa
00240000-55ba-390f-35f4-60c9fbe8ae1f	00230000-55ba-390f-bbea-74810aec67d2	oseba
00240000-55ba-390f-1fb2-299e49e61e9b	00230000-55ba-390f-b2e0-83ebae211cdb	prostor
00240000-55ba-390f-950c-e333e1407b21	00230000-55ba-390f-bbea-74810aec67d2	besedilo
00240000-55ba-390f-91db-033f5cc15c85	00230000-55ba-390f-bbea-74810aec67d2	uprizoritev
00240000-55ba-390f-5d40-21b19af9f49c	00230000-55ba-390f-bbea-74810aec67d2	funkcija
00240000-55ba-390f-820c-8c030655a300	00230000-55ba-390f-bbea-74810aec67d2	tipfunkcije
00240000-55ba-390f-e2d9-b0ed289cc600	00230000-55ba-390f-bbea-74810aec67d2	alternacija
00240000-55ba-390f-922f-1e17e78a185a	00230000-55ba-390f-198d-135ae2eaec07	pogodba
00240000-55ba-390f-da3c-5596b00d648f	00230000-55ba-390f-bbea-74810aec67d2	zaposlitev
00240000-55ba-390f-5059-f431a9163583	00230000-55ba-390f-198d-135ae2eaec07	programdela
00240000-55ba-390f-da5f-f53bfa9117ea	00230000-55ba-390f-bbea-74810aec67d2	zapis
\.


--
-- TOC entry 3022 (class 0 OID 11201936)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 11201693)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55ba-3911-a939-ac8636c2f73d	000e0000-55ba-3910-ff91-7dd37e0a231f	00080000-55ba-3910-4b9a-b3a0fede9d2a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55ba-3911-90f8-502b58f6dac7	000e0000-55ba-3910-ff91-7dd37e0a231f	00080000-55ba-3910-4b9a-b3a0fede9d2a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55ba-3911-2d1f-aa018c247182	000e0000-55ba-3910-ff91-7dd37e0a231f	00080000-55ba-3910-fefe-a9f732f3a646	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55ba-3911-57c0-ae30933209e4	000e0000-55ba-3910-ff91-7dd37e0a231f	00080000-55ba-3910-fefe-a9f732f3a646	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2972 (class 0 OID 11201357)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 11201536)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ba-3911-cdaa-c454a27f4b78	00180000-55ba-3911-1aa6-4925711c4c3e	000c0000-55ba-3911-4ac9-859390637f77	00090000-55ba-3910-faa9-93d5550b6705	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ba-3911-378f-137ed35d320b	00180000-55ba-3911-1aa6-4925711c4c3e	000c0000-55ba-3911-ff51-e617d5311101	00090000-55ba-3910-82a7-e59bde83541c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ba-3911-00a4-39f9a78a2bab	00180000-55ba-3911-1aa6-4925711c4c3e	000c0000-55ba-3911-5932-e2604b364813	00090000-55ba-3910-5ffa-d2ef65957595	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ba-3911-b5c5-696a46ad595a	00180000-55ba-3911-1aa6-4925711c4c3e	000c0000-55ba-3911-6bf5-606440dba305	00090000-55ba-3910-baeb-3aaf53f265c7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ba-3911-8920-a40030dd7513	00180000-55ba-3911-1aa6-4925711c4c3e	000c0000-55ba-3911-8349-6aa9ac066543	00090000-55ba-3910-66af-40de7aa06dfc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ba-3911-6fef-8c8d142e5af6	00180000-55ba-3911-ce43-d74f64510818	\N	00090000-55ba-3910-66af-40de7aa06dfc	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3008 (class 0 OID 11201723)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ba-390f-9992-d36f2a6d963e	Igralec ali animator	Igralci in animatorji	Igralka ali animatorka	igralec
000f0000-55ba-390f-1fd9-729f3720d7f5	Baletnik ali plesalec	Baletniki in plesalci	Baletnica ali plesalka	igralec
000f0000-55ba-390f-a95e-7a4493468832	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ba-390f-b1a7-bc0974792e4b	Režiser	Režiserji	Režiserka	umetnik
000f0000-55ba-390f-9979-a4884b2c826b	Scenograf	Scenografi	Scenografka	tehnik
000f0000-55ba-390f-ff93-ccdc2ef9b388	Kostumograf	Kostumografi	Kostumografinja	tehnik
000f0000-55ba-390f-3581-9cecc4997dd5	Oblikovalec maske	Oblikovalci maske	Oblikovalka maske	tehnik
000f0000-55ba-390f-416f-c3bb84f05318	Avtor glasbe	Avtorji glasbe	Avtorica glasbe	umetnik
000f0000-55ba-390f-2198-60dc12e7b7f9	Oblikovalec svetlobe	Oblikovalci svetlobe	Oblikovalka svetlobe	tehnik
000f0000-55ba-390f-549a-12a8b570b2a1	Koreograf	Koreografi	Koreografinja	umetnik
000f0000-55ba-390f-6b50-829e07ffe136	Dramaturg	Dramaturgi	Dramaturginja	umetnik
000f0000-55ba-390f-db27-466415f04c9e	Lektor	Lektorji	Lektorica	umetnik
000f0000-55ba-390f-4817-646eceefeaa5	Prevajalec	Prevajalci	Prevajalka	umetnik
000f0000-55ba-390f-2dd6-5d6fb952f8dd	Oblikovalec videa	Oblikovalci videa	Oblikovalka videa	umetnik
000f0000-55ba-390f-3503-d669e8941bbe	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijska ustvarjalka	umetnik
000f0000-55ba-390f-f197-faca40bfcf9e	Nerazvrščeno	Nerazvrščeno	Nerazvrščeno	\N
000f0000-55ba-390f-05ad-a59cde0d2e66	Inšpicient	Inšpicienti	Inšpicientka	inspicient
000f0000-55ba-390f-8c2b-8641d3918bf2	Šepetalec	Šepetalci	Šepetalka	sepetalec
000f0000-55ba-390f-4b69-3fa3301a50e2	Tehnični vodja	Tehnične vodje	Tehnični vodja	tehnik
\.


--
-- TOC entry 3020 (class 0 OID 11201918)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ba-390f-da3a-c1bad7c2e75e	01	Velika predstava	f	1.00	1.00
002b0000-55ba-390f-f9d8-c119f2a58feb	02	Mala predstava	f	0.50	0.50
002b0000-55ba-390f-e3c0-2dcb132f93d6	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ba-390f-29d5-46fac0d1aac4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ba-390f-0755-3330e663f230	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2977 (class 0 OID 11201420)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 11201266)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ba-390f-63d1-ec4a29b3e75c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRODI1.Imv3Dl1bevm9mbOZmXrDI9rbn7.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ba-3910-2d4c-c7d3ea3a500b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ba-3910-969d-18022067b44b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ba-3910-6545-75c4f9bfbf2b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ba-3910-462c-418257fc6859	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ba-3910-86af-749bcea8f41b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ba-3910-cdbd-57909b03fb3b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ba-3910-d934-b298f391cd25	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ba-3910-7f74-a2612f5c41a9	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ba-3910-5bfc-820590507259	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ba-3910-4d5d-6b768a2762b2	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ba-390f-9a36-a77a09ab67e1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3012 (class 0 OID 11201771)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ba-3910-941a-31abec8a2576	00160000-55ba-3910-3f89-133ca1ff3e06	00150000-55ba-390f-4059-17a41e9332f1	00140000-55ba-390f-2f71-7326bcaa86a5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55ba-3910-763a-816b2700f1de
000e0000-55ba-3910-ff91-7dd37e0a231f	00160000-55ba-3910-23f7-e6e1f62ca542	00150000-55ba-390f-ce6d-57ff54c8630b	00140000-55ba-390f-8084-60e83748d2fb	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55ba-3910-637d-26d44e03dd1f
000e0000-55ba-3910-7115-5e58143a9cbf	\N	00150000-55ba-390f-ce6d-57ff54c8630b	00140000-55ba-390f-8084-60e83748d2fb	00190000-55ba-3910-ad00-080e8fb0b9a7	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55ba-3910-763a-816b2700f1de
000e0000-55ba-3910-4aea-118d84918678	\N	00150000-55ba-390f-ce6d-57ff54c8630b	00140000-55ba-390f-8084-60e83748d2fb	00190000-55ba-3910-ad00-080e8fb0b9a7	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55ba-3910-763a-816b2700f1de
000e0000-55ba-3910-5a37-850cc1fda1c6	\N	00150000-55ba-390f-ce6d-57ff54c8630b	00140000-55ba-390f-8084-60e83748d2fb	00190000-55ba-3910-ad00-080e8fb0b9a7	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55ba-3910-2d9c-bb615eb22381
\.


--
-- TOC entry 2982 (class 0 OID 11201482)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55ba-3911-270b-39f401b06918	000e0000-55ba-3910-ff91-7dd37e0a231f	1	
00200000-55ba-3911-0d97-ef7d0e3c3cf8	000e0000-55ba-3910-ff91-7dd37e0a231f	2	
\.


--
-- TOC entry 2997 (class 0 OID 11201607)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11201988)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 11201960)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11202000)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11201676)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ba-3910-1de4-113205131bf5	00090000-55ba-3910-82a7-e59bde83541c	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ba-3910-5ee7-e6997c4cb757	00090000-55ba-3910-5ffa-d2ef65957595	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ba-3910-6d22-b1d7bb09a642	00090000-55ba-3910-e913-fc061a511d31	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ba-3910-2ff2-a76e5bb97413	00090000-55ba-3910-f935-0f0fe41ff333	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ba-3910-91b6-d8a1349a72cb	00090000-55ba-3910-faa9-93d5550b6705	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ba-3910-ba67-2f1e573a0b37	00090000-55ba-3910-629f-9f24b4d7abc2	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2984 (class 0 OID 11201514)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 11201761)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ba-390f-2f71-7326bcaa86a5	01	Drama	drama (SURS 01)
00140000-55ba-390f-a0bd-a5ea8436bbe0	02	Opera	opera (SURS 02)
00140000-55ba-390f-e645-bb527043d1f0	03	Balet	balet (SURS 03)
00140000-55ba-390f-4c66-fc16f573162e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ba-390f-4feb-118c26d9043a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ba-390f-8084-60e83748d2fb	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ba-390f-0304-c7cdc0ae5cfe	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3003 (class 0 OID 11201666)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55ba-390f-af32-7a297e1e1f0b	01	Opera	opera
00150000-55ba-390f-62e9-c706fe85f0e9	02	Opereta	opereta
00150000-55ba-390f-9bb0-b274dcc8b62e	03	Balet	balet
00150000-55ba-390f-cf94-2cb66261ed45	04	Plesne prireditve	plesne prireditve
00150000-55ba-390f-daa3-e7b7fe615b7c	05	Lutkovno gledališče	lutkovno gledališče
00150000-55ba-390f-c5c3-3a351574e63e	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55ba-390f-f954-b2a2c386d132	07	Biografska drama	biografska drama
00150000-55ba-390f-4059-17a41e9332f1	08	Komedija	komedija
00150000-55ba-390f-60d3-40a3386df09b	09	Črna komedija	črna komedija
00150000-55ba-390f-7e06-7f2af0df76af	10	E-igra	E-igra
00150000-55ba-390f-ce6d-57ff54c8630b	11	Kriminalka	kriminalka
00150000-55ba-390f-66aa-537b57df03da	12	Musical	musical
\.


--
-- TOC entry 2509 (class 2606 OID 11201320)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 11201818)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 11201808)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11201722)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 11202041)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 11201504)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 11201529)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 11201934)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 11201446)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 11201864)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 11201662)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 11201480)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 11201523)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 11201460)
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
-- TOC entry 2601 (class 2606 OID 11201572)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 11202017)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11202024)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2749 (class 2606 OID 11202049)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 11201599)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 11201418)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 11201329)
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
-- TOC entry 2516 (class 2606 OID 11201353)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 11201309)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2500 (class 2606 OID 11201294)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 11201605)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 11201638)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 11201756)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 11201382)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 11201406)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 11201578)
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
-- TOC entry 2531 (class 2606 OID 11201396)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 11201467)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 11201590)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 11201897)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 11201905)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 11201887)
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
-- TOC entry 2707 (class 2606 OID 11201916)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 11201622)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 11201563)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 11201554)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 11201744)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 11201690)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 11201265)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 11201629)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 11201283)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2502 (class 2606 OID 11201303)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 11201647)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 11201585)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 11201535)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 11201958)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 11201946)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 11201940)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 11201703)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 11201362)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 11201545)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11201733)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11201928)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 11201431)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 11201278)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 11201787)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 11201489)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 11201613)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 11201998)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 11201982)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 11202006)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 11201681)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 11201518)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 11201769)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 11201674)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 1259 OID 11201511)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2649 (class 1259 OID 11201704)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2650 (class 1259 OID 11201705)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 11202019)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2736 (class 1259 OID 11202018)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2523 (class 1259 OID 11201384)
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
-- TOC entry 2614 (class 1259 OID 11201606)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 11201986)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2723 (class 1259 OID 11201985)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2724 (class 1259 OID 11201987)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2725 (class 1259 OID 11201984)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2726 (class 1259 OID 11201983)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2608 (class 1259 OID 11201592)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2609 (class 1259 OID 11201591)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2560 (class 1259 OID 11201490)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 11201663)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 11201665)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 11201664)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2548 (class 1259 OID 11201462)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2549 (class 1259 OID 11201461)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2705 (class 1259 OID 11201917)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2659 (class 1259 OID 11201758)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 11201759)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2661 (class 1259 OID 11201760)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2732 (class 1259 OID 11202007)
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
-- TOC entry 2668 (class 1259 OID 11201792)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2669 (class 1259 OID 11201789)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2670 (class 1259 OID 11201793)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2671 (class 1259 OID 11201791)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2672 (class 1259 OID 11201790)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2538 (class 1259 OID 11201433)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 11201432)
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
-- TOC entry 2514 (class 1259 OID 11201356)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 11201630)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2578 (class 1259 OID 11201524)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 11201310)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2505 (class 1259 OID 11201311)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 11201650)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 11201649)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 11201648)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2552 (class 1259 OID 11201468)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 11201470)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2554 (class 1259 OID 11201469)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2715 (class 1259 OID 11201948)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2588 (class 1259 OID 11201558)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2589 (class 1259 OID 11201556)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2590 (class 1259 OID 11201555)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2591 (class 1259 OID 11201557)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2495 (class 1259 OID 11201284)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2496 (class 1259 OID 11201285)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2617 (class 1259 OID 11201614)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 11202042)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2746 (class 1259 OID 11202050)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 11202051)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2603 (class 1259 OID 11201579)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 11201691)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 11201692)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 11201869)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2690 (class 1259 OID 11201868)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2691 (class 1259 OID 11201865)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2692 (class 1259 OID 11201866)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2693 (class 1259 OID 11201867)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2527 (class 1259 OID 11201398)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2528 (class 1259 OID 11201397)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2529 (class 1259 OID 11201399)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2488 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2697 (class 1259 OID 11201898)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2698 (class 1259 OID 11201899)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2682 (class 1259 OID 11201822)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2683 (class 1259 OID 11201820)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2684 (class 1259 OID 11201821)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 11201682)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 11201567)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2595 (class 1259 OID 11201566)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2596 (class 1259 OID 11201564)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2597 (class 1259 OID 11201565)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2466 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2678 (class 1259 OID 11201810)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 11201809)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2694 (class 1259 OID 11201888)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2559 (class 1259 OID 11201481)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2712 (class 1259 OID 11201935)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 11202025)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 11202026)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2510 (class 1259 OID 11201331)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2511 (class 1259 OID 11201330)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2519 (class 1259 OID 11201363)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 11201364)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2583 (class 1259 OID 11201548)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 11201547)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2585 (class 1259 OID 11201546)
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
-- TOC entry 2566 (class 1259 OID 11201513)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2567 (class 1259 OID 11201509)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2568 (class 1259 OID 11201506)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 11201507)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 11201505)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 11201510)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2572 (class 1259 OID 11201508)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2526 (class 1259 OID 11201383)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 11201447)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 11201449)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2546 (class 1259 OID 11201448)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2547 (class 1259 OID 11201450)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2602 (class 1259 OID 11201573)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2664 (class 1259 OID 11201757)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 11201788)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2517 (class 1259 OID 11201354)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2518 (class 1259 OID 11201355)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 11201675)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 11201959)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 11201419)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2718 (class 1259 OID 11201947)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2622 (class 1259 OID 11201624)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 11201623)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2685 (class 1259 OID 11201819)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 11201823)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2469 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2534 (class 1259 OID 11201407)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 11201770)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 11201999)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2703 (class 1259 OID 11201906)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 11201907)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2503 (class 1259 OID 11201304)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2573 (class 1259 OID 11201512)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2775 (class 2606 OID 11202187)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2778 (class 2606 OID 11202172)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2777 (class 2606 OID 11202177)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2773 (class 2606 OID 11202197)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2779 (class 2606 OID 11202167)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2774 (class 2606 OID 11202192)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2776 (class 2606 OID 11202182)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2809 (class 2606 OID 11202342)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 11202347)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 11202517)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2843 (class 2606 OID 11202512)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 11202102)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2796 (class 2606 OID 11202282)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2837 (class 2606 OID 11202497)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2838 (class 2606 OID 11202492)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2836 (class 2606 OID 11202502)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 11202487)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2840 (class 2606 OID 11202482)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2794 (class 2606 OID 11202277)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2795 (class 2606 OID 11202272)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2772 (class 2606 OID 11202162)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 11202312)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 11202322)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2803 (class 2606 OID 11202317)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2766 (class 2606 OID 11202137)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 11202132)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2792 (class 2606 OID 11202262)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 11202467)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2812 (class 2606 OID 11202352)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 11202357)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 11202362)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2841 (class 2606 OID 11202507)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2814 (class 2606 OID 11202382)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2817 (class 2606 OID 11202367)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2813 (class 2606 OID 11202387)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2815 (class 2606 OID 11202377)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2816 (class 2606 OID 11202372)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2764 (class 2606 OID 11202127)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 11202122)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 11202087)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2757 (class 2606 OID 11202082)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2798 (class 2606 OID 11202292)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 11202202)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 11202062)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2752 (class 2606 OID 11202067)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 11202307)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2800 (class 2606 OID 11202302)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 11202297)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2770 (class 2606 OID 11202142)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 11202152)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2769 (class 2606 OID 11202147)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2835 (class 2606 OID 11202477)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2784 (class 2606 OID 11202237)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2786 (class 2606 OID 11202227)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2787 (class 2606 OID 11202222)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2785 (class 2606 OID 11202232)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2751 (class 2606 OID 11202052)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2750 (class 2606 OID 11202057)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2797 (class 2606 OID 11202287)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2846 (class 2606 OID 11202532)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 11202537)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 11202542)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2793 (class 2606 OID 11202267)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2807 (class 2606 OID 11202332)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2806 (class 2606 OID 11202337)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2824 (class 2606 OID 11202442)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2825 (class 2606 OID 11202437)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2828 (class 2606 OID 11202422)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 11202427)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2826 (class 2606 OID 11202432)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2762 (class 2606 OID 11202112)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 11202107)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 11202117)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 11202452)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2830 (class 2606 OID 11202457)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2821 (class 2606 OID 11202412)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 11202417)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2823 (class 2606 OID 11202402)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2822 (class 2606 OID 11202407)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2805 (class 2606 OID 11202327)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 11202257)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2789 (class 2606 OID 11202252)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2791 (class 2606 OID 11202242)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2790 (class 2606 OID 11202247)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2818 (class 2606 OID 11202397)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2819 (class 2606 OID 11202392)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2829 (class 2606 OID 11202447)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2771 (class 2606 OID 11202157)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2832 (class 2606 OID 11202462)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 11202472)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2845 (class 2606 OID 11202522)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2844 (class 2606 OID 11202527)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2754 (class 2606 OID 11202077)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 11202072)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2759 (class 2606 OID 11202092)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2758 (class 2606 OID 11202097)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 11202217)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 11202212)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2783 (class 2606 OID 11202207)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-30 16:47:46 CEST

--
-- PostgreSQL database dump complete
--

